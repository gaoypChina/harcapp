import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import 'common/cover_image.dart';
import 'common/community_cover_colors.dart';
import 'community_thumbnail_widget.dart';
import 'model/community.dart';

class CommunitySliverAppBar extends StatefulWidget{

  final CommunityBasicData community;
  final PaletteGenerator? palette;
  final CommunityCoverImageData coverImage;
  final Color? backgroundColor;
  final Color? preBackgroundColor;
  final double backgroundMarg;
  final ScrollController mainScrollController;
  final GlobalKey communityNameWidgetKey;
  final dynamic heroTag;
  final List<Widget> Function(AppBarProvider)? actions;
  final List<Widget> bottomWidgets;

  const CommunitySliverAppBar(
      this.community,
      { this.palette,
        required this.coverImage,
        this.backgroundColor,
        this.preBackgroundColor,
        this.backgroundMarg = 0,
        required this.mainScrollController,
        required this.communityNameWidgetKey,
        this.heroTag,
        this.actions,
        this.bottomWidgets = const [],
        super.key
      });

  @override
  State<StatefulWidget> createState() => CommunitySliverAppBarState();
  
}

class CommunitySliverAppBarState extends State<CommunitySliverAppBar>{

  CommunityBasicData get community => widget.community;
  PaletteGenerator? get palette => widget.palette;
  CommunityCoverImageData get coverImage => widget.coverImage;
  Color? get backgroundColor => widget.backgroundColor;
  Color? get preBackgroundColor => widget.preBackgroundColor;
  double get backgroundMarg => widget.backgroundMarg;
  ScrollController get mainScrollController => widget.mainScrollController;
  GlobalKey get communityNameWidgetKey => widget.communityNameWidgetKey;
  dynamic get heroTag => widget.heroTag;
  List<Widget> Function(AppBarProvider)? get actions => widget.actions;
  List<Widget> get bottomWidgets => widget.bottomWidgets;

  Color get appBarColor => CommunityCoverColors.appBarColor(context, palette);
  Color get _backgroundColor => backgroundColor??CommunityCoverColors.backgroundColor(context, palette);
  Color get cardColor => CommunityCoverColors.cardColor(context, palette);
  Color get strongColor => CommunityCoverColors.strongColor(context, palette);
  Color get coverIconColor => CommunityCoverColors.coverIconColor(context, palette);

  void _listener(){
    AppBarProvider appBarProv = AppBarProvider.of(context);

    double topPadding = MediaQuery.of(context).padding.top;
    final appBarBox = communityNameWidgetKey.currentContext?.findRenderObject() as RenderBox?;
    double appBarPos = appBarBox==null? -double.infinity: appBarBox.localToGlobal(Offset(0, -topPadding)).dy;
    if (appBarPos < kToolbarHeight && !appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = true;
    else if(appBarPos >= kToolbarHeight && appBarProv.showTitleOnAppBar) appBarProv.showTitleOnAppBar = false;

    if (appBarPos < 2*kToolbarHeight && appBarProv.coverVisible) appBarProv.coverVisible = false;
    else if(appBarPos >= 2*kToolbarHeight && !appBarProv.coverVisible) appBarProv.coverVisible = true;
  }

  @override
  void initState() {
    mainScrollController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    mainScrollController.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<AppBarProvider>(
    builder: (context, prov, child) => SliverAppBar(
      iconTheme: IconThemeData(
        color: prov.coverVisible?coverIconColor:iconEnab_(context)
      ),
      title: AnimatedOpacity(
        opacity: prov.showTitleOnAppBar?1:0,
        duration: Duration(milliseconds: prov.showTitleOnAppBar?200:0),
        child: Text(
          community.name,
          style: AppTextStyle(
              color: iconEnab_(context)
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      centerTitle: true,
      pinned: true,
      excludeHeaderSemantics: true,
      elevation: prov.elevated?AppCard.bigElevation:0,
      backgroundColor: preBackgroundColor??_backgroundColor,
      expandedHeight: 200,
      actions: actions?.call(prov),
      flexibleSpace: FlexibleSpaceBar(
        background:
        Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [

            Positioned(
              top: 0,
              bottom: 0,
              left: backgroundMarg,
              right: backgroundMarg,
              child: Container(color: _backgroundColor),
            ),

            Hero(
                tag: Tuple2(heroTag, 'coverImage'),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: CoverImageWidget(coverImage),
                ),
            ),

            Positioned(
              left: Dimen.SIDE_MARG,
              bottom: 0,
              child: CommunityThumbnailWidget(
                community.iconKey,
                community.key,
                palette: palette,
              ),
            ),

            Positioned(
              right: Dimen.SIDE_MARG,
              bottom: 0,
              child: Hero(
                tag: Tuple2(heroTag, 'bottomWidgets'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: bottomWidgets,
                ),
              )
            ),

          ],
        ),

      ),
    ),
  );
  
}

class AppBarProvider extends ChangeNotifier{

  static AppBarProvider of(BuildContext context) => Provider.of<AppBarProvider>(context, listen: false);

  late bool _elevated;
  bool get elevated => _elevated;
  set elevated(bool value){
    _elevated = value;
    notifyListeners();
  }

  late bool _showTitleOnAppBar;
  bool get showTitleOnAppBar => _showTitleOnAppBar;
  set showTitleOnAppBar(bool value){
    _showTitleOnAppBar = value;
    notifyListeners();
  }

  late bool _coverVisible;
  bool get coverVisible => _coverVisible;
  set coverVisible(bool value){
    _coverVisible = value;
    notifyListeners();
  }

  void set({
    bool? elevated,
    bool? showTitleOnAppBar,
    bool? coverVisible,
  }){
    if(elevated != null) _elevated = elevated;
    if(showTitleOnAppBar != null) _showTitleOnAppBar = showTitleOnAppBar;
    if(coverVisible != null) _coverVisible = coverVisible;
    notifyListeners();
  }

  AppBarProvider(){
    _elevated = true;
    _showTitleOnAppBar = false;
    _coverVisible = true;
  }

}