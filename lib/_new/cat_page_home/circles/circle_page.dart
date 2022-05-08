import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcement_widget.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../_common_classes/sliver_child_builder_separated_delegate.dart';
import '../../../_common_widgets/app_toast.dart';
import 'circle_editor/_main.dart';
import 'circle_palette_generator.dart';
import 'circle_role.dart';
import 'cover_image.dart';
import 'model/circle.dart';

class CirclePage extends StatefulWidget{

  static Color _lighten(Color color, [double amount = .1]) {
    if(color == null) return null;

    final hsl = HSLColor.fromColor(color);
    final hslLight = hsl.withLightness(amount);//hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  static Color appBarColor(BuildContext context, PaletteGenerator palette){
    if(palette == null) return background_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor.color, .1);
    else
      return _lighten(palette.dominantColor.color, .8);
  }

  static Color backgroundColor(BuildContext context, PaletteGenerator palette){
    if(palette == null) return background_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor.color, .1);
    else
      return _lighten(palette.dominantColor.color, .86);

  }

  static Color cardColor(BuildContext context, PaletteGenerator palette){
    if(palette == null) return cardEnab_(context);

    if(AppSettings.isDark)
      return _lighten(palette.dominantColor.color, .16);
    else
      return _lighten(palette.dominantColor.color, .8);

  }

  static Color strongColor(BuildContext context, PaletteGenerator palette) =>
      _lighten(palette?.dominantColor?.color, .5)??iconEnab_(context);

  final Circle circle;
  const CirclePage(this.circle, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CirclePageState();

}

class CirclePageState extends State<CirclePage>{

  Circle get circle => widget.circle;

  RefreshController refreshController;

  PaletteGenerator paletteGeneratorFirst;
  PaletteGenerator paletteGeneratorSecond;

  Future<void> initPaletteGenerator({bool refresh = true}) async {
    paletteGeneratorFirst = await getPaletteGenerator(circle.coverImage.local, circle.coverImage.firstFileName);
    paletteGeneratorSecond = await getPaletteGenerator(circle.coverImage.local, circle.coverImage.secondFileName);

    if(refresh) setState(() {});
  }

  @override
  void initState() {
    refreshController = RefreshController();
    initPaletteGenerator();

    super.initState();
  }

  PaletteGenerator get paletteGenerator{
    if(circle.colorsKey == 'none') return null;

    if(paletteGeneratorSecond == null) return paletteGeneratorFirst;
    return AppSettings.isDark?paletteGeneratorSecond:paletteGeneratorFirst;
  }

  Color get appBarColor => CirclePage.appBarColor(context, paletteGenerator);
  Color get backgroundColor => CirclePage.backgroundColor(context, paletteGenerator);
  Color get cardColor => CirclePage.cardColor(context, paletteGenerator);
  Color get strongColor => CirclePage.strongColor(context, paletteGenerator);

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    color: backgroundColor,
    child: SmartRefresher(
        enablePullDown: true,
        physics: const BouncingScrollPhysics(),
        header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: strongColor),
        controller: refreshController,
        onRefresh: () async {

          if(!await isNetworkAvailable()){
            showAppToast(context, text: 'Brak dostępu do Internetu');
            refreshController.refreshCompleted();
            return;
          }

          await ApiCircle.get(
            circleKey: circle.key,
            onSuccess: (updatedCircle) async {
              circle.name = updatedCircle.name;
              circle.description = updatedCircle.description;
              circle.coverImage = updatedCircle.coverImage;
              circle.colorsKey = updatedCircle.colorsKey;

              await initPaletteGenerator(refresh: false);

              setState(() {});
            },
            onError: () => null
          );
          refreshController.refreshCompleted();

        },
        child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [

              SliverAppBar(
                centerTitle: true,
                pinned: true,
                stretch: true,
                backgroundColor: appBarColor,
                expandedHeight: 600/MediaQuery.of(context).devicePixelRatio + kToolbarHeight,
                actions: [
                  IconButton(
                    icon: const Icon(MdiIcons.cogOutline),
                    onPressed: () => pushPage(
                      context,
                      builder: (context) => CircleEditorPage(
                        initCircle: circle,
                        onSaved: (updatedCircle) async {

                          circle.name = updatedCircle.name;
                          circle.description = updatedCircle.description;
                          circle.coverImage = updatedCircle.coverImage;
                          circle.colorsKey = updatedCircle.colorsKey;

                          await initPaletteGenerator(refresh: false);

                          setState(() {});
                        },
                      )
                    ),
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    circle.name,
                    style: AppTextStyle(
                        color: iconEnab_(context)
                    ),
                    maxLines: 1,
                  ),
                  centerTitle: true,
                  background:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Expanded(child: CoverImage(circle.coverImage)),

                      AnimatedContainer(color: backgroundColor, height: kToolbarHeight, duration: const Duration(milliseconds: 300))
                    ],
                  ),
                  stretchModes: const [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground
                  ],
                ),
              ),

              SliverList(delegate: SliverChildListDelegate([

                const SizedBox(height: Dimen.SIDE_MARG),

                AccountThumbnailRowWidget(
                  circle.members.map((m) => m.name).toList(),
                  elevated: true,
                  backgroundColor: backgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                ),

                if(circle.members.firstWhere((mem) => mem.key == AccountData.key).role != CircleRole.OBSERVER)
                  Padding(
                    padding: const EdgeInsets.only(top: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG, left: Dimen.SIDE_MARG),
                    child: Material(
                      color: cardColor,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                      elevation: AppCard.bigElevation,
                      child: Padding(
                        padding: const EdgeInsets.all(Dimen.ICON_MARG),
                        child: Row(
                          children: [
                            Icon(MdiIcons.draw, color: hintEnab_(context)),
                            const SizedBox(width: Dimen.SIDE_MARG),
                            Text(
                                'Dodaj ogłoszenie...',
                                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, color: hintEnab_(context))
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox(height: Dimen.SIDE_MARG),

              ])),

              if(circle.announcements.isEmpty)
                SliverPadding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  sliver: SliverList(delegate: SliverChildListDelegate([
                    const SizedBox(height: 2*Dimen.SIDE_MARG),
                    EmptyMessageWidget(
                      icon: MdiIcons.newspaperVariantOutline,
                      text: 'Brak postów',
                      color: cardColor,
                    ),
                  ])),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                  sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                      (context, index) => AnnouncementWidget(
                        circle.announcements[index],
                        paletteGenerator: paletteGenerator
                      ),
                      separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                      count: circle.announcements.length
                  )),
                )


            ]
        )
    ),
  );

}