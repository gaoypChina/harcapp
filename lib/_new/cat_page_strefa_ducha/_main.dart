import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/preload_page_view.dart';
import 'package:harcapp/_new/app_drawer.dart';
import 'package:harcapp/_new/cat_page_strefa_ducha/show_init_message.dart';
import 'package:harcapp/_new/cat_page_strefa_ducha/strefa_ducha_loader.dart';
import 'package:harcapp/_new/cat_page_strefa_ducha/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import '../../../_common_classes/single_computer/single_computer_listener.dart';
import '../../_common_widgets/drawer_tile.dart';
import '../app_bottom_navigator.dart';
import '../module_statistics_registrator.dart';
import 'background_widget.dart';
import 'image_card.dart';
import 'image_loader.dart';
import 'image_card_downloadable.dart';
import 'settings_page.dart';
import 'source.dart';

enum SelectedItemsSource{
  all,
  pinned,
  favorite,
  cached,
}

class CatPageStrefaDucha extends StatefulWidget {

  static const int pageViewExtent = 1;

  const CatPageStrefaDucha({Key? key}) : super(key: key);

  static String gitDuchoweImageUrl(String sourceCode, String fileName) => 'https://gitlab.com/n3o2k7i8ch5/harcapp_data/raw/master/duchowe/$sourceCode/$fileName';

  @override
  State createState() => CatPageStrefaDuchaState();

}

class CatPageStrefaDuchaState extends State<CatPageStrefaDucha> with AfterLayoutMixin, ModuleStatsMixin, TickerProviderStateMixin{

  @override
  String get moduleId => ModuleStatsMixin.strefaDucha;

  late SingleComputerListener<String> loaderListener;

  bool? networkAvailable;
  StreamSubscription<ConnectivityResult>? subscription;

  static SelectedItemsSource selectedItemsSrc = SelectedItemsSource.all;
  static int lastAllPage = 0;
  static int lastFavoritePage = 0;
  static int lastCachedPage = 0;

  int get lastPage {
    if(selectedItemsSrc == SelectedItemsSource.all) return lastAllPage;
    if(selectedItemsSrc == SelectedItemsSource.favorite) return lastFavoritePage;
    if(selectedItemsSrc == SelectedItemsSource.cached) return lastCachedPage;
    return 0;
  }

  set lastPage(int value) {
    if(selectedItemsSrc == SelectedItemsSource.all) lastAllPage = value;
    if(selectedItemsSrc == SelectedItemsSource.favorite) lastFavoritePage = value;
    if(selectedItemsSrc == SelectedItemsSource.cached) lastCachedPage = value;
  }

  static bool openedFirstTime = true;
  static bool loadedFirstTime = true;

  static tryReloadItems(BuildContext context) async {
    if(await isNetworkAvailable())
      strefaDuchaLoader.run();
    else
      showAppToast(context, text: 'Brak internetu');
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    Provider.of<ColorPackProvider>(context, listen: false).colorPack = ColorPackStrefaDucha();
    networkAvailable = await isNetworkAvailable();
    if(!networkAvailable! && Source.all == null) {
      Source.aggrAllDisplayableItems(cachedOnly: true);
      if(Source.allItems!.isNotEmpty) {
        selectedItemsSrc = SelectedItemsSource.cached;
        showAppToast(context, text: 'Tryb offline');
      }
    }
    if(openedFirstTime&& Settings.showInitMessage)
      openDialog(context: context, builder: (context) => const ShowInitMessageWidget());

    openedFirstTime = false;

    setState(() {});
  }

  @override
  void initState() {
    loaderListener = SingleComputerListener(
        onStart: (){
          if(mounted) setState((){});
        },
        onError: (_) async {
          if(mounted) setState((){});
        },
        onEnd: (error, __){
          if(error != null) return;
          loadedFirstTime = false;
          if(mounted) setState((){});
        }
    );

    strefaDuchaLoader.addListener(loaderListener);

    if(Source.all == null)
      strefaDuchaLoader.run();

    networkAvailable = true;
    subscription = addConnectionListener((hasConnection) async{
      if(hasConnection) {
        showAppToast(context, text: 'Połączono z internetem');
        if(Source.all == null) strefaDuchaLoader.run();
      }else {
        showAppToast(context, text: 'Brak internetu');
      }
      setState(() => networkAvailable = hasConnection);
    });


    BackButtonInterceptor.add(onBackPressed);

    super.initState();
  }

  @override
  dispose() {
    strefaDuchaLoader.removeListener(loaderListener);

    subscription!.cancel();

    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  bool onBackPressed(bool stopDefaultButtonEvent, RouteInfo info) {
    LockProvider prov = Provider.of<LockProvider>(context, listen: false);
    if(prov.locked!){
      prov.locked = false;
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => FavoriteListProvider())
    ],
    builder: (context, child) => Consumer2<LockProvider, FavoriteListProvider>(
      builder: (context, lockProv, favProv, child) => AppScaffold(
        body: Stack(
          children: [

            if(selectedItemsSrc == SelectedItemsSource.pinned)
              Stack(
                children: [

                  if(SourceItem.pinned == null || !SourceItem.pinned!.cachedFile.existsSync())
                    BackgroundImage(ImageLoader.emptyImage)
                  else
                    BackgroundImage(Image.file(SourceItem.pinned!.cachedFile).image),

                  const BackgroundBlur(),

                  Consumer<PinProvider>(
                    builder: (context, prov, child) => prov.item == null?
                    Center(
                      child: EmptyMessageWidget(
                        text: 'Pusto',
                        icon: MdiIcons.pinOffOutline,
                        color: Colors.white24,
                        size: .7*MediaQuery.of(context).size.shortestSide,
                      ),
                    ):
                    Center(
                      child: _CardWidget(
                        sourceItem: prov.item,
                        pageViewNotifier: ValueNotifier(0),
                        index: 0,
                        pinable: false,
                      ),
                    ),
                  ),

                ],
              )
            else if(selectedItemsSrc == SelectedItemsSource.favorite && Source.allItems!.isEmpty)
              Stack(
                children: [

                  BackgroundImage(ImageLoader.emptyImage),

                  const BackgroundBlur(),

                  Center(
                    child: EmptyMessageWidget(
                      text: 'Pusto',
                      icon: MdiIcons.heartOffOutline,
                      color: Colors.white24,
                      size: .7*MediaQuery.of(context).size.shortestSide,
                    ),
                  ),

                ],
              )
            else if(selectedItemsSrc == SelectedItemsSource.cached && Source.allItems!.isEmpty)
                Stack(
                  children: [

                    BackgroundImage(ImageLoader.emptyImage),

                    const BackgroundBlur(),

                    Center(
                      child: EmptyMessageWidget(
                        text: 'Pusto',
                        icon: MdiIcons.trayArrowDown,
                        color: Colors.white24,
                        size: .7*MediaQuery.of(context).size.shortestSide,
                      ),
                    ),

                  ],
                )
            else
              ImageCardPageView(
                ignoreNoSources: selectedItemsSrc == SelectedItemsSource.cached,
                networkAvailable: networkAvailable,
                initialPage: lastPage,
                onPageChanged: (index) => lastPage = index,
                key: ValueKey(selectedItemsSrc),
              ),

            SizedBox(
              height: kToolbarHeight,
              child: Blur(
                child: AppBar(
                  title: Text('Strefa ducha', style: AppTextStyle(color: Colors.white)),
                  iconTheme: const IconThemeData(color: Colors.white),
                  actionsIconTheme: const IconThemeData(color: Colors.white),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.black26,
                  actions: [
                    if(Source.all == null)
                      IconButton(
                          icon:
                          strefaDuchaLoader.running?
                          const SpinKitChasingDots(size: Dimen.ICON_SIZE, color: Colors.white):
                          const Icon(MdiIcons.refresh),
                          onPressed: () => tryReloadItems(context)
                      )
                    else
                      IconButton(
                        icon: const Icon(MdiIcons.cogOutline, color: Colors.white),
                        onPressed: () => pushPage(context, builder: (context) =>
                            SettingsPage(sourceChanged: (){
                              Provider.of<FadeImageProvider>(context, listen: false).clear(currIdx: 0);
                              lastAllPage = 0;
                              lastFavoritePage = 0;
                              lastCachedPage = 0;
                              setState(() {});
                            })
                        ),
                      ),
                  ],
                ),
              ),
            ),

            const Positioned(
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
        drawer: AppDrawer(
            body: Column(
              children: [
                _DrawerTile(
                  icon: MdiIcons.pinOutline,
                  title: 'Przypięta grafika',
                  source: SelectedItemsSource.pinned,
                  selectedSource: selectedItemsSrc,
                  onSelect: (source) => setState(() => selectedItemsSrc = source),
                ),

                const SizedBox(height: Dimen.SIDE_MARG),

                _DrawerTile(
                    icon: MdiIcons.allInclusive,
                    title: 'Wszystkie',
                    source: SelectedItemsSource.all,
                    selectedSource: selectedItemsSrc,
                    onSelect: (source){
                      Source.aggrAllDisplayableItems();
                      setState(() => selectedItemsSrc = source);
                      if(Source.allItems != null && Source.allItems!.isNotEmpty)
                        post(() => Provider.of<FadeImageProvider>(context, listen: false).clear(currIdx: lastAllPage));
                    }
                ),

                _DrawerTile(
                  icon: MdiIcons.heartOutline,
                  title: 'Polubione',
                  source: SelectedItemsSource.favorite,
                  selectedSource: selectedItemsSrc,
                  onSelect: (source){
                    Source.aggrAllDisplayableItems(favoriteOnly: true);
                    setState(() => selectedItemsSrc = source);
                    if(Source.allItems != null && Source.allItems!.isNotEmpty)
                      post(() => Provider.of<FadeImageProvider>(context, listen: false).clear(currIdx: lastFavoritePage));
                  },
                  trailing: Consumer<FavoriteListProvider>(
                      builder: (context, prov, child) => Text(
                          '${SourceItem.favoriteItems(displayableOnly: true).length}',
                          style: AppTextStyle(
                              fontWeight: selectedItemsSrc == SelectedItemsSource.favorite?weight.bold:weight.normal,
                              color: selectedItemsSrc == SelectedItemsSource.favorite?iconEnab_(context):textEnab_(context)
                          )
                      )
                  ),
                ),
                _DrawerTile(
                  icon: MdiIcons.trayArrowDown,
                  title: 'Zapisane',
                  source: SelectedItemsSource.cached,
                  selectedSource: selectedItemsSrc,
                  onSelect: (source){
                    Source.aggrAllDisplayableItems(cachedOnly: true);
                    setState(() => selectedItemsSrc = source);
                    if(Source.allItems != null && Source.allItems!.isNotEmpty)
                      post(() => Provider.of<FadeImageProvider>(context, listen: false).clear(currIdx: lastCachedPage));
                  },
                ),
              ],
            )
        ),
      ),
    ),
  );

}

class ImageCardPageView extends StatelessWidget{

  final bool ignoreNoSources;
  final bool? networkAvailable;
  final int? initialPage;
  final void Function(int)? onPageChanged;

  const ImageCardPageView(
      { this.ignoreNoSources = false,
        this.networkAvailable,
        this.initialPage,
        this.onPageChanged,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(Source.all == null && !ignoreNoSources && !networkAvailable!)
      return _NoNetWidget();
    else if(strefaDuchaLoader.running)
      return _LoadingWidget();
    else if(Source.all == null && !ignoreNoSources && !strefaDuchaLoader.running)
      return _ErrorWidget();

    PageController pageController = PageController(initialPage: initialPage??0);
    ValueNotifier pageViewNotifier = ValueNotifier(pageController.initialPage.toDouble());
    pageController.addListener(() => pageViewNotifier.value = pageController.page);

    return Stack(
      children: [

        Background(pageViewNotifier),

        Consumer<LockProvider>(
          builder: (context, lockProv, child) => Consumer<FadeImageProvider>(
            builder: (context, fadeImgProv, child) => PreloadPageView.extents(
              scrollDirection: Axis.vertical,
              controller: pageController,
              itemCount: Source.allItems!.length,
              physics: lockProv.locked!?const NeverScrollableScrollPhysics():const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Center(
                child: _CardWidget(
                  sourceItem: Source.allItems![index],
                  pageViewNotifier: pageViewNotifier,
                  index: index,
                ),
              ),
              onPageChanged: (index) {
                onPageChanged?.call(index);
                if(index>fadeImgProv.currIdx)
                  fadeImgProv.moveOneForw();
                else if(index<fadeImgProv.currIdx)
                  fadeImgProv.moveOneBack();
              },
            ),
          ),
        )
      ],
    );

  }

}

class _DrawerTile extends StatelessWidget{

  final IconData icon;
  final String title;
  final SelectedItemsSource source;
  final SelectedItemsSource selectedSource;
  final void Function(SelectedItemsSource)? onSelect;
  final Widget? trailing;
  
  const _DrawerTile({
    required this.icon,
    required this.title,
    required this.source,
    required this.selectedSource,
    required this.onSelect,
    this.trailing,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DrawerTile<SelectedItemsSource>(
    icon: icon,
    title: title,
    source: source,
    selectedSource: selectedSource,
    trailing: trailing,
    onSelect: (source){
      LockProvider prov = Provider.of<LockProvider>(context, listen: false);
      if(prov.locked!)
        prov.locked = false;
      onSelect?.call(source);
      //setState(() => selectedSource = SelectedItemsSource.cached);
      Navigator.pop(context);
    },
  );
  
}

class _HeartWidget extends StatefulWidget{

  const _HeartWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HeartWidgetState();

}

class _HeartWidgetState extends State<_HeartWidget>{

  late bool visible;
  static const Duration _duration = Duration(milliseconds: 1400);

  void pulse()async{
    if(!mounted) return;
    setState(() => visible = !visible);
    await Future.delayed(_duration);
    pulse();
  }

  @override
  void initState() {
    visible = true;
    pulse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double size = 0.8*MediaQuery.of(context).size.shortestSide;

    return AnimatedOpacity(
        opacity: visible?0.25:0,
        duration: _duration,
        child: Stack(
          children: [
            Icon(
              MdiIcons.heartOutline,
              color: Colors.black,
              size: size,
            ),

            Blur(
              sigma: 8,
              child: Icon(
                MdiIcons.heartOutline,
                color: Colors.white,
                size: size,
              ),
            ),

          ],
        )
    );

  }

}

class _CardWidget extends StatefulWidget{

  final SourceItem? sourceItem;
  final int index;
  final ValueNotifier pageViewNotifier;
  final bool pinable;
  final void Function()? onLikeChanged;

  const _CardWidget({
    required this.sourceItem,
    required this.index,
    required this.pageViewNotifier,
    this.pinable = true,

    this.onLikeChanged,

  });

  @override
  State<StatefulWidget> createState() => _CardWidgetState();

}

class _CardWidgetState extends State<_CardWidget>{

  static const Duration animDuration = Duration(milliseconds: 500);
  static const Curve animCurve = Curves.easeInOutCubic;

  SourceItem? get sourceItem => widget.sourceItem;
  int get index => widget.index;
  ValueNotifier get pageViewNotifier => widget.pageViewNotifier;
  bool get pinable => widget.pinable;
  void Function()? get onLikeChanged => widget.onLikeChanged;


  bool? get optionsOn => Provider.of<LockProvider>(context, listen: false).locked;
  set optionsOn(bool? value) =>
    Provider.of<LockProvider>(context, listen: false).locked = value;

  @override
  Widget build(BuildContext context) => Consumer<LockProvider>(
    builder: (context, prov, child) => Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            children: [

              const SizedBox(height: kToolbarHeight),

              Expanded(
                child: AnimatedContainer(
                  duration: animDuration,
                  curve: animCurve,
                  child: AnimatedBuilder(
                    animation: pageViewNotifier,
                    child:Stack(
                      alignment: Alignment.center,
                      children: [

                        ImageCardDownloadable(
                          sourceItem,
                          pageViewNotifier: pageViewNotifier,
                          index: index,
                          onLoaded: (ImageProvider? image, int index){
                            if(!mounted) return;
                            FadeImageProvider fadeImgProv = Provider.of<FadeImageProvider>(context, listen: false);
                            post(() => fadeImgProv.newImage(image??ImageLoader.noInternetImage, index, reload: true));
                          },
                          onLike: (){
                            if(sourceItem!.isFavorite)
                              sourceItem!.removeFromFavorite();
                            else
                              sourceItem!.addToFavorite();

                            Provider.of<FavoriteListProvider>(context, listen: false).notify();

                            setState(() {});
                          },
                          onLongPress: () => setState(() => optionsOn = !optionsOn!),
                        ),

                        IgnorePointer(
                          child: AnimatedOpacity(
                            opacity: !Provider.of<LockProvider>(context, listen: false).locked! && sourceItem!.isFavorite?1:0,
                            duration: const Duration(milliseconds: 500),
                            child: const _HeartWidget(),
                          ),
                        ),

                      ],
                    ),
                    builder: (context, child) => Transform.translate(
                        offset: Offset(0, MediaQuery.of(context).size.height/2*(index - pageViewNotifier.value)),
                        child: child
                    ),
                  ),
                ),
              ),

              AnimatedContainer(
                  height: optionsOn!?5*Dimen.ICON_FOOTPRINT:0,
                  duration: animDuration,
                  curve: animCurve,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ListTile(
                          leading: const Icon(MdiIcons.shareVariant, color: Colors.white),
                          title: Text('Udostępnij', style: AppTextStyle(color: Colors.white)),
                          onTap: () => Share.shareFiles([sourceItem!.cachedFile.path], text: 'Udostępnij...')
                      ),
                      ListTile(
                        leading: const Icon(MdiIcons.link, color: Colors.white),
                        title: Text('Źródło', style: AppTextStyle(color: Colors.white)),
                        onTap: () => launchURL(sourceItem!.sourceUrl!),
                      ),
                      ListTile(
                        leading: const Icon(MdiIcons.trayArrowDown, color: Colors.white),
                        title: Text('Pobierz', style: AppTextStyle(color: Colors.white)),
                        onTap: () async {
                          if(await Permission.storage.request().isGranted){
                            await GallerySaver.saveImage(sourceItem!.cachedFile.path);
                            showAppToast(context, text: 'Zapisano w galerii.');
                          }
                        },
                      ),
                      ListTile(
                          leading: const Icon(MdiIcons.informationOutline, color: Colors.white),
                          title: Text('Informacje', style: AppTextStyle(color: Colors.white)),
                          onTap: () => showAppToast(context, text: sourceItem!.cachedFileName)
                      ),
                    ],
                  )
              ),

              const SizedBox(height: kBottomNavigationBarHeight),

            ],
          ),
        ),

        if(pinable)
          AnimatedPositioned(
              duration: animDuration,
              curve: animCurve,

              bottom: kBottomNavigationBarHeight + Dimen.FLOATING_BUTTON_MARG,

              right: optionsOn!?
              Dimen.FLOATING_BUTTON_MARG:
              -(Dimen.FLOATING_BUTTON_SIZE + Dimen.FLOATING_BUTTON_MARG),

              child: Consumer<PinProvider>(
                builder: (context, prov, child) => FloatingActionButton(
                  heroTag: null,
                  backgroundColor: Colors.white,
                  child: Icon(
                      MdiIcons.pinOutline,
                      color: prov.item == sourceItem?
                      DefColorPack.ICON_ENABLED:
                      DefColorPack.ICON_DISABLED),
                  onPressed: (){
                    if(prov.item == sourceItem){
                      prov.item = null;
                      showAppToast(context, text: 'Grafika odpięta');
                    } else {
                      prov.item = sourceItem;
                      showAppToast(context, text: 'Grafika przypięta');
                    }
                  },
                ),
              )

          )
      ],
    ),
  );

}

class _NoNetWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      BackgroundImage(ImageLoader.noInternetImage),

      const BackgroundBlur(),

      Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: ImageCard(
            ImageLoader.noInternetImage,
            onTap: () => CatPageStrefaDuchaState.tryReloadItems(context),
          ),
        ),
      )

    ],
  );

}

class _LoadingWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SpinKitDoubleBounce(
          size: 100,
          color: backgroundIcon_(context),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        Text('Ładowanie', style: AppTextStyle(fontWeight: weight.bold, fontSize: Dimen.TEXT_SIZE_BIG, color: backgroundIcon_(context)))

      ],
    );
  }

}

class _ErrorWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.center,
    children: [

      BackgroundImage(ImageLoader.emptyImage),

      const BackgroundBlur(),

      EmptyMessageWidget(
        icon: MdiIcons.alertCircleOutline,
        text: 'Błąd',
        color: Colors.white24,
        size: .7*MediaQuery.of(context).size.shortestSide,
      ),


    ],
  );

}