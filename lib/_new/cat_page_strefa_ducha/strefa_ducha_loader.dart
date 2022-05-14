
import 'package:dio/dio.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer.dart';
import 'package:harcapp/_common_classes/single_computer/single_computer_listener.dart';
import 'package:harcapp/_new/cat_page_strefa_ducha/source.dart';


StrefaDuchaLoader strefaDuchaLoader = StrefaDuchaLoader();
class StrefaDuchaLoader extends SingleComputer<String?, SingleComputerListener<String>?>{

  static const String sourceListUrl = 'https://gitlab.com/n3o2k7i8ch5/harcapp_data/raw/master/duchowe/.index';

  @override
  String get computerName => 'StrefaDuchaLoader';

  @override
  Future<void> perform() async {

    Dio dio = Dio(BaseOptions(
      connectTimeout: 18000,
      receiveTimeout: 40000,
    ));

    String? data;
    try{
      Response response = await dio.get(sourceListUrl);
      data = response.data as String?;
    }catch (e){
      callError(null);
      return;
    }

    List<String> sourceParts = data!.replaceAll('#\n', '#').split('##');

    // DOWNLOAD SOURCES

    List<Source> sources = [];

    for (String part in sourceParts) {
      if (part.isEmpty) continue;
      try{
        sources.add(Source.decode(part));
      } on Exception{}
    }

    Source.all = sources;
    Source.aggrAllDisplayableItems();
  }


}