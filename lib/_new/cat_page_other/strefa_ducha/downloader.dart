
import 'package:dio/dio.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha/_main.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha/source.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';

class Downloader{

  List<Function(List<Source> sources)> _onCompleteListeners;

  addCompleteListener(Function(List<Source> sources) listener){
    _onCompleteListeners.add(listener);
  }

  dispose(){
    _onCompleteListeners.clear();
  }

  SpiritPageState parentState;

  PrimitiveWrapper<bool> isCancelled = PrimitiveWrapper(false);
  bool isRunning = false;

  Downloader(this.parentState){
    _onCompleteListeners = [];
  }

  run() async {
    isRunning = true;
    List<Source> sources = await parentState.downloadData(isCancelled);
    isRunning = false;
    for(Function(List<Source> sources) listener in _onCompleteListeners)
      listener(sources);
  }

  cancel(){
    isRunning = false;
    isCancelled.set(true);
  }

}

const String gitDuchoweSourceList = 'https://gitlab.com/n3o2k7i8ch5/harcapp_data/raw/master/duchowe/.index';

Future<List<Source>> downloadSources(Function onError, PrimitiveWrapper<bool> isCancelled) async {

  Dio dio = Dio(BaseOptions(
    //baseUrl: StrefaDuchaFragment.gitDuchoweSourceList,
    //baseUrl: 'https://gitlab.com/n3o2k7i8ch5/harcapp_data/raw/master/duchowe/.index',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    sendTimeout: 3000,
  ));

  /*
  //Future futureSources = dio.get(StrefaDuchaFragment.gitDuchoweSourceList,);
  Future futureSources = dio.get(gitDuchoweSourceList);
  futureSources.catchError((error){
    if(onError != null) onError();
    return null;
  });
  var resultSources = await futureSources;
  if (resultSources.statusCode != 200) {
    if(onError != null) onError();
    return null;
  }

  String data = resultSources.data;
   */

  String data;
  try{
    Response response = await dio.get(gitDuchoweSourceList);
    data = response.data as String;
  }catch (e){
    if(onError != null) onError();
    return null;
  }

  List<String> sourceParts = data.replaceAll('#\n', '#').split('##');

  // DOWNLOAD SOURCES

  List<Source> sources = [];

  for (String part in sourceParts) {
    if (part.length == 0) continue;
    try{sources.add(Source.decode(shaPref, part));} on Exception{}
  }

  return sources;
}