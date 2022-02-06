import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/sliding_card.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha/providers.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha/show_init_message.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../app_bottom_navigator.dart';
import 'background_widget.dart';
import 'child_fragment.dart';
import 'child_fragment_template.dart';
import 'downloader.dart';
import 'image_loader.dart';
import 'settings_page.dart';
import 'source.dart';

enum SourcesState{
  LOADING,
  SUCCESS,
  FAILED,
}

class SpiritPage extends StatefulWidget {

  static const int pageViewExtent = 1;

  static String gitDuchoweImageUrl(String sourceCode, String fileName) => 'https://gitlab.com/n3o2k7i8ch5/harcapp_data/raw/master/duchowe/$sourceCode/$fileName';

  @override
  State createState() => SpiritPageState();

}

class SpiritPageState extends State<SpiritPage> {

  SourcesState sourcesState;

  Downloader downloader;

  static bool _showInitMessage;

  PageController itemsController;
  PageController pinController;

  ValueNotifier pinNotifier;

  StreamSubscription<ConnectivityResult> subscription;

  FadeImageProvider fadeImgProv;

  @override
  void initState() {

    AppBottomNavigatorProvider.addOnSelectedListener(onNavSelected);

    ItemsProvider itemsProv = Provider.of<ItemsProvider>(context, listen: false);

    itemsController = PageController(initialPage: itemsProv.notifier.value.toInt());

    pinController = PageController(initialPage: 1);
    pinNotifier = ValueNotifier<double>(pinController.initialPage.toDouble());

    subscription = addConnectionListener((hasConnection) async{
      if(hasConnection) {
        showAppToast(context, text: 'Połączono z internetem');
        if(sourcesState == SourcesState.FAILED){
          setState(() => sourcesState = SourcesState.LOADING);
          runDownloader();
        }
      }else {
        showAppToast(context, text: 'Brak internetu');
        if(sourcesState == SourcesState.LOADING) {
          downloader.cancel();
          setState(() => sourcesState = SourcesState.FAILED);
          if(!itemsProv.offlineOnly) setOffline();
        }
      }
    });

    fadeImgProv = Provider.of<FadeImageProvider>(context, listen: false);
    //dispItemsProv = Provider.of<DisplayedItemsProvider>(context, listen: false);

    if(_showInitMessage == null) {
      _showInitMessage = shaPref.getBool(ShaPref.SHA_PREF_DUCHOWE_INIT_MESSAGE, true);

      if (_showInitMessage) {
        post(() => openDialog(context: context, builder: (context) => ShowInitMessageWidget()));
        _showInitMessage = false;
      }
    }

    post(() => _initState(itemsProv));
    BackButtonInterceptor.add(onBackPressed);

    super.initState();
  }

  _initState(ItemsProvider itemsProv) async {

    Function setOffline = (){
      ItemsProvider itemsProv = Provider.of<ItemsProvider>(context, listen: false);
      itemsProv.offlineOnly = true;
      showAppToast(context, text: 'Tryb offline.');
      setState(() => sourcesState = SourcesState.FAILED);
    };

    if (itemsProv.sources == null) {
      if(await isNetworkAvailable())
        runDownloader();
      else
        setOffline();
    }else {
      if(await isNetworkAvailable())
        setState(() => sourcesState = SourcesState.SUCCESS);
      else
        setOffline();
    }

  }

  @override
  dispose() {
    AppBottomNavigatorProvider.removeOnSelectedListener(onNavSelected);

    if(downloader != null) downloader.dispose();
    //dispItemsProv.clear();
    subscription.cancel();

    pinController.dispose();

    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  void onNavSelected(int page) => Navigator.pop(context);

  bool onBackPressed(bool stopDefaultButtonEvent, RouteInfo info) {
    LockProvider prov = Provider.of<LockProvider>(context, listen: false);
    if(prov.locked){
      prov.locked = false;
      return true;
    }
    return false;
  }

  void setOffline() {
    ItemsProvider prov = Provider.of<ItemsProvider>(context, listen: false);
    prov.offlineOnly = true;
    fadeImgProv.clear();
    showAppToast(context, text: 'Tryb offline');
  }

  bool isDownloaderRunning() => downloader != null && downloader.isRunning;
  Future<void> runDownloader()async{
    fadeImgProv.clear();
    setState(() => sourcesState = SourcesState.LOADING);
    if(downloader != null)
      downloader.cancel();

    downloader = Downloader(this);
    downloader.addCompleteListener((List<Source> sources) {
      if (sources == null){
        setState(() => sourcesState = SourcesState.FAILED);
      }else{
        ItemsProvider itemsProv = Provider.of<ItemsProvider>(context, listen: false);
        itemsProv.sources = sources;

        setState(() => sourcesState = SourcesState.SUCCESS);
      }

    });
    await downloader.run();
  }

  Future<List<Source>> downloadData(PrimitiveWrapper<bool> isCancelled) async{

    List<Source> sources;
    try {
      sources = await downloadSources(
          () => handleError(),
          isCancelled
      );
    } on Error{
      return null;
    }

    if(isCancelled.get()) return null;

    return sources;
  }

  handleError(){
    showAppToast(context, text: 'Problem przy pobieraniu.');
  }

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      //appBar: buildAppBar(context),
      body: Stack(
        children: [

          Background(Provider.of<ItemsProvider>(context, listen: false).notifier),

          Consumer<ItemsProvider>(
              builder: (context, itemsProv, child){

                switch(sourcesState){

                  case SourcesState.LOADING:
                    return AnimatedOpacity(
                      opacity: itemsProv.items==null?1.0:0.0,
                      duration: Duration(milliseconds: 300),
                      child: SpinKitDoubleBounce(color: accent_(context)),
                    );

                  case SourcesState.SUCCESS:
                    return Consumer<LockProvider>(
                      builder: (context, lockProv, child) => SlidingPageView(
                        grow: true,
                        physics: lockProv.locked?NeverScrollableScrollPhysics():BouncingScrollPhysics(),
                        controller: pinController,
                        notifier: pinNotifier,
                        itemCount: 2,
                        itemBuilder: (context, index){
                          if(index == 0) return PinnedItem();
                          else{

                            if(itemsProv.items.isEmpty){

                              if(itemsProv.favoriteOnly)
                                return EmptyMessageWidget(
                                  text: 'W ulubionych pusto...\n\nAby dodać refleksję do ulubionych, dwukrotnie ją kliknij.',
                                  icon: MdiIcons.gestureDoubleTap,
                                  color: Colors.white30,
                                );
                              else
                                return EmptyMessageWidget(
                                  text: 'Pusto...',
                                  icon: MdiIcons.gaugeEmpty,
                                  color: Colors.white30,
                                );

                            }

                            return ItemsPageView(itemsController, itemsProv, lockProv, fadeImgProv);

                          }
                        },
                      ),
                    );

                  case SourcesState.FAILED:
                    return ImageCard(null, ValueNotifier(0), Image(image: ImageLoader.noInternetImage), null, 0);

                  default:
                    return Container();
                }

              }
          ),

          Blur(
            child: Container(
              color: Colors.black26,
              child: buildAppBar(context),
              height: AppBar().preferredSize.height,
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Blur(
              child: AppBottomNavigator(
                background: Colors.black26,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white54,
                elevation: 0.0,
              ),
            ),
          )


        ],

      ),
    );

  }

  AppBar buildAppBar(BuildContext context) {

    ItemsProvider itemsProv = Provider.of<ItemsProvider>(context, listen: false);

    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Text('Strefa ducha', style: AppTextStyle(color: Colors.white),),
          AnimatedBuilder(
              animation: pinNotifier,
              builder: (context, child){
                return Transform.translate(
                    offset: Offset(0, (pinNotifier.value)*AppBar().preferredSize.height),
                    child: Container(
                      height: AppBar().preferredSize.height,
                      child: Consumer<PinProvider>(
                        builder: (context, prov, child){
                          if(prov.item == null)
                            return Container();

                          return Center(
                              child: Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Icon(
                                    MdiIcons.pinOutline,
                                    size: 20,
                                    color: hintEnab_(context),
                                  )
                              )
                          );
                        }
                      )
                      //child: Center(child: Text(' (pin)'))
                    ),
                );
              }
          )
        ],
      ),
      actions: <Widget>[

        AnimatedBuilder(
            animation: pinNotifier,
            builder: (context, child){
              return Transform.translate(
                offset: Offset(0, 2*(pinNotifier.value-1)*Dimen.ICON_FOOTPRINT),
                child: Container(
                  height: AppBar().preferredSize.height,
                  child: IconButton(
                    icon: Consumer<ItemsProvider>(
                      builder: (context, __, _) => Icon(itemsProv.favoriteOnly?MdiIcons.heart:MdiIcons.heartOutline, color: Colors.white),
                    ),
                    onPressed: (){

                      itemsProv.favoriteOnly = !itemsProv.favoriteOnly;
                      tryJumpToPage(itemsProv.index);

                      showAppToast(context, text: itemsProv.favoriteOnly?'Ulubione refleksje.':'Wszystkie refleksje.');
                    },
                  ),
                ),
              );
            }
        ),

        AnimatedBuilder(
            animation: pinNotifier,
            builder: (context, child){
              return Transform.translate(
                offset: Offset(0, (pinNotifier.value-1)*Dimen.ICON_FOOTPRINT),
                child: Container(
                  height: AppBar().preferredSize.height,
                  child: IconButton(
                    icon: Consumer<ItemsProvider>(
                      builder: (context, itemsProv, _) => Icon(itemsProv.offlineOnly?MdiIcons.earthOff:MdiIcons.earth, color: Colors.white),
                    ),
                    onPressed: () async {

                      if(await isNetworkAvailable())
                        // Linijkę później offlineOnly się zmienia, spokojnie.
                        showAppToast(context, text: itemsProv.offlineOnly?'Tryb online':'Tryb offline');
                      else{
                        showAppToast(context, text: 'Brak połączenia z internetem...');
                        return;
                      }
                      
                      itemsProv.offlineOnly = !itemsProv.offlineOnly;
                      tryJumpToPage(itemsProv.index);

                    },
                  ),
                ),
              );
            }
        ),

        Center(child: AnimatedCrossFade(
          firstChild:  IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: ()async{
              if(await isNetworkAvailable()) await runDownloader();
              else showAppToast(context, text: 'Brak połączenia z internetem...');
            },
          ),
          secondChild: IconButton(
            icon: Icon(MdiIcons.cogOutline, color: Colors.white),
            onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(this))),
          ),
          crossFadeState: sourcesState==SourcesState.SUCCESS?CrossFadeState.showSecond:CrossFadeState.showFirst,
          duration: Duration(milliseconds: 500),
        ))
      ],
    );
  }

  void tryJumpToPage(int index){
    fadeImgProv.clear(currIdx: index);

    post(() {
      if(itemsController.hasClients)
        itemsController.jumpToPage(index);
    });

    ItemsProvider itemsProvider = Provider.of<ItemsProvider>(context, listen: false);
    itemsProvider.notifier.value = index.toDouble();
  }

}

class PinnedItem extends StatelessWidget{

  const PinnedItem();

  @override
  Widget build(BuildContext context) {

    return Consumer<PinProvider>(
      builder: (context, pinProv, child){
        if(pinProv.item!=null)
          return ChildFragmentTemplate(
            pinProv.item,
            ValueNotifier(0),
            0,
            key: ValueKey(pinProv.item),
            onPin: (pinned){
              if(!pinned)
                Provider.of<LockProvider>(context, listen: false).locked = false;
            }
          );
        else
          return EmptyMessageWidget(
            text: 'Brak\nprzypiętej\nrefleksji.',
            icon: MdiIcons.pinOffOutline,
            color: Colors.white30,
          );
      },
    );
  }

}

class ItemsPageView extends StatelessWidget{

  final PageController controller ;
  final ItemsProvider itemsProv;
  final LockProvider lockProv;
  final FadeImageProvider fadeImgProv;

  const ItemsPageView(this.controller, this.itemsProv, this.lockProv, this.fadeImgProv);

  @override
  Widget build(BuildContext context) {
    return SlidingPageView(
      physics: lockProv.locked?NeverScrollableScrollPhysics():BouncingScrollPhysics(),
      notifier: itemsProv.notifier,
      extents: SpiritPage.pageViewExtent,
      itemCount: itemsProv.items.length,
      controller: controller,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) =>
          ChildFragment(
            itemsProv.items[index],
            itemsProv.notifier,
            index,
            key: ValueKey(
                '${itemsProv.favoriteOnly}'
                    '${itemsProv.offlineOnly}' +
                    itemsProv.items[index].toString()
            ),
          ),
      onPageChanged: (index) {

        if(index>fadeImgProv.currIdx)
          fadeImgProv.moveOneForw();
        else if(index<fadeImgProv.currIdx)
          fadeImgProv.moveOneBack();

        itemsProv.index = index;
      },
    );
  }

}