import 'dart:async';

import 'package:dio/dio.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';

import '_api.dart';

class MarkerRespBody{

  final String key;
  final String name;
  final MarkerContactRespBody contact;
  double lat;
  double lng;
  MarkerType type;
  final UserData user;

  MarkerRespBody({
    required this.key,
    required this.name,
    required this.contact,
    required this.lat,
    required this.lng,
    required this.type,
    required this.user
  });

  static MarkerRespBody fromMap(Map map, {String? key}) => MarkerRespBody(
    key: key??map['_key']??(throw InvalidResponseError('_key')),
    name: map['name']??(throw InvalidResponseError('name')),
    contact: MarkerContactRespBody.fromMap(map['contact']??(throw InvalidResponseError('contact'))),
    lat: map['lat']??(throw InvalidResponseError('lat')),
    lng: map['lng']??(throw InvalidResponseError('lng')),
    type: strToMarkerType[map['type']]??(throw InvalidResponseError('type')),
    user: UserData.fromMap(map['creatorUser']??(throw InvalidResponseError('creatorUser'))),
  );

}

class MarkerContactRespBody{

  final List<String> email;
  final List<String> phone;
  final List<String> website;
  final String? other;

  const MarkerContactRespBody({
    required this.email,
    required this.phone,
    required this.website,
    required this.other
  });

  static MarkerContactRespBody fromMap(Map map) => MarkerContactRespBody(
    email: (map['email'] as List?)?.cast<String>()??[],
    phone: (map['phone'] as List?)?.cast<String>()??[],
    website: (map['website'] as List?)?.cast<String>()??[],
    other: map['other']
  );

}

class ApiHarcMap{

  static Future<Response?> getAllMarkers({
    FutureOr<void> Function(List<MarkerRespBody>)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<void> Function(Response? response)? onError,
  }) async => await API.sendRequest(
    withToken: true,
    requestSender: (Dio dio) => dio.get(
        '${API.SERVER_URL}api/harcMap',
    ),
    onSuccess: (Response response, DateTime now) async {
      List<MarkerRespBody> markerRespBodyList = [];
      for(Map map in response.data) {
        MarkerRespBody markerRespBody = MarkerRespBody.fromMap(map);
        markerRespBodyList.add(markerRespBody);
      }

      onSuccess?.call(markerRespBodyList);
    },
    onForceLoggedOut: onForceLoggedOut,
    onServerMaybeWakingUp: onServerMaybeWakingUp,
    onError: (err) async => onError?.call(err.response)
  );

  static Future<Response?> createMarker({
    required String name,
    required double lat,
    required double lng,
    required MarkerType type,

    FutureOr<void> Function(MarkerRespBody marker)? onSuccess,
    FutureOr<bool> Function()? onForceLoggedOut,
    FutureOr<bool> Function()? onServerMaybeWakingUp,
    FutureOr<bool> Function()? onImageDBWakingUp,
    FutureOr<void> Function()? onError,
  }) async {

    return API.sendRequest(
      withToken: true,
      requestSender: (Dio dio) async => dio.post(
          '${API.SERVER_URL}api/harcMap',
          data: FormData.fromMap({
            'name': name,
            'lat': lat,
            'lng': lng,
            'type': markerTypeToStr[type],
          })
      ),
      onSuccess: (Response response, DateTime now) async{
        MarkerRespBody markerRespBody = MarkerRespBody.fromMap(response.data);
        onSuccess?.call(markerRespBody);
      },
      onForceLoggedOut: onForceLoggedOut,
      onServerMaybeWakingUp: onServerMaybeWakingUp,
      onImageDBWakingUp: onImageDBWakingUp,
      onError: (_) async => onError?.call()
    );

  }

}