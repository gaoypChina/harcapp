import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../api/harc_map.dart';

class MarkerRespBodyProvider extends ChangeNotifier{

  late MarkerRespBody markerBody;

  MarkerRespBodyProvider({MarkerRespBody? initMarker}){
    markerBody = initMarker??MarkerRespBody(
      key: '',
      name: '',
      contact: MarkerContactRespBody(
        email: [],
        phone: [],
        website: [],
        other: null
      ),
      type: MarkerType.DRUZYNA_HARCERSKA_ZHP,
      user: UserData(
        key: '',
        name: '',
        shadow: false,
        sex: Sex.male
      ),
      lat: 50.0537412,
      lng: 19.9349666,
    );
  }

  static MarkerRespBodyProvider of(BuildContext context) =>
      Provider.of<MarkerRespBodyProvider>(context, listen: false);

  static void notify_(BuildContext context) => of(context).notify();

  void notify() => notifyListeners();

  void setPosition(LatLng pointer){
    markerBody.lat = pointer.latitude;
    markerBody.lng = pointer.longitude;
    notifyListeners();
  }

}

