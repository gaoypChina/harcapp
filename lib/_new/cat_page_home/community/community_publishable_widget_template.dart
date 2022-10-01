import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart' hide Size;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/time_settings.dart';
import 'package:harcapp/_common_widgets/periodic_rebuild_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/_new/cat_page_home/community/community_thumbnail_widget.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

import 'common/cover_image.dart';
import 'circle/model/circle.dart';
import 'common/community_cover_colors.dart';
import 'forum/model/forum.dart';
import 'forum/model/post.dart';

class CommunityPublishableWidgetTemplate extends StatelessWidget{

  static const double borderHorizontalMarg = Dimen.defMarg;
  static const double borderWidth = Dimen.defMarg;
  static const double textHorizontalMarg = Dimen.ICON_MARG;

  static const double radius = 8.0;
  static const double elevation = 0;
  static const int shrinkedTextMaxLines = 5;
  static TextStyle textStyle = const TextStyle(fontFamily: 'Lato', fontSize: Dimen.TEXT_SIZE_BIG-1);

  final CommunityPublishable publishable;
  final PaletteGenerator? palette;
  final bool shrinkText;
  final void Function()? onTap;
  final void Function()? onMoreTap;
  final void Function()? onUpdateTap;

  final bool showCommunityInfo;
  final void Function()? onCommunityButtonTap;

  final Widget? contentTop;
  final Widget? contentBottom;

  final bool constrainImage;

  const CommunityPublishableWidgetTemplate(
      this.publishable,
      this.palette,
      { this.shrinkText = true,
        this.onTap,
        this.onMoreTap,
        this.onUpdateTap,

        this.showCommunityInfo = false,
        this.onCommunityButtonTap,

        this.contentTop,
        this.contentBottom,

        this.constrainImage=true,

        super.key
      });

  @override
  Widget build(BuildContext context) => SimpleButton(
    onTap: onTap,
    color: CommunityCoverColors.cardColor(context, palette),
    borderRadius: BorderRadius.circular(radius),
    elevation: 3.0,//elevation,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: Dimen.defMarg,
                    left: Dimen.defMarg,
                    bottom: Dimen.defMarg
                ),
                child: PublishInfoWidget(
                  publishable,
                  palette: palette,
                  showCommunityInfo: showCommunityInfo,
                  onCommunityButtonTap: onCommunityButtonTap,
                ),
              ),
            ),

            if(onMoreTap != null)
              SimpleButton.from(
                context: context,
                radius: AppCard.defRadius,
                margin: const EdgeInsets.all(Dimen.defMarg),
                icon: MdiIcons.dotsVertical,
                onTap: onMoreTap,
              )
            else
              const SizedBox(width: Dimen.defMarg)

          ],
        ),

        if(contentTop != null)
          contentTop!,

        Padding(
          padding: const EdgeInsets.only(
              top: Dimen.ICON_MARG,
              left: textHorizontalMarg,
              right: textHorizontalMarg,
              bottom: Dimen.ICON_MARG
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              if(publishable.hasTitle)
                Text(
                  publishable.title!,
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

              if(publishable.hasTitle)
                const SizedBox(height: Dimen.ICON_MARG),

              if(shrinkText)
                Text(
                    publishable.text,
                    style: textStyle,
                    maxLines: shrinkedTextMaxLines,
                    overflow: TextOverflow.ellipsis
                )
              else
                SelectableText(
                  publishable.text,
                  style: textStyle,
                ),

              if(shrinkText && isTextExpandable(publishable.text, context: context))
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2*Dimen.defMarg),
                    child: Text('...czytaj dalej', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_NORMAL)),
                  ),
                )

            ],
          ),
        ),

        if(contentBottom != null)
          contentBottom!,

        if(publishable.coverImage != null)
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius - 2))
            ),
            child: Builder(
              builder: (context){

                ImageProvider image = publishable.coverImage!.getImageProvider(darkSample: false)!;
                Completer<ui.Image> completer = Completer<ui.Image>();
                image.resolve(const ImageConfiguration()).addListener(ImageStreamListener((ImageInfo info, bool _) =>
                    completer.complete(info.image)
                ));

                return FutureBuilder<ui.Image>(
                  future: completer.future,
                  builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
                    if (constrainImage && snapshot.hasData && snapshot.data!.width < snapshot.data!.height) {
                      return ConstrainedBox(
                          constraints:
                          BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.shortestSide,
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [

                              CoverImageWidget(publishable.coverImage!),

                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: 16,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.black.withOpacity(.3),
                                            Colors.black.withOpacity(0),
                                          ],
                                        )
                                    )
                                ),
                              )

                            ],
                          )
                      );

                    } else
                      return CoverImageWidget(publishable.coverImage!);
                  }
                );

              },
            )
          ),

        if(publishable.urlToPreview != null)
          LinkPreviewer(publishable.urlToPreview!, palette),

      ],
    ),
  );

  static bool isTextExpandable(String text, {double? width, BuildContext? context}){

    assert(width != null || context != null);

    width ??= MediaQuery.of(context!).size.width - 2*(borderHorizontalMarg + borderWidth + textHorizontalMarg);

    TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr
    )..layout(minWidth: 0, maxWidth: width);
    Size textSize = textPainter.size;

    return textSize.height > (shrinkedTextMaxLines + .5)*(textStyle.fontSize! * (textStyle.height??1).toDouble());
    // .5 is used, because emojis are a bit bigger.
  }

}

class PublishInfoWidget extends StatelessWidget{

  static const double lineSepHeight = 6.0;
  static const double height = 2*Dimen.TEXT_SIZE_NORMAL + lineSepHeight;

  static const double factor = AccountThumbnailWidget.defSize/CommunityThumbnailWidget.defSize;

  final CommunityPublishable publishable;
  final PaletteGenerator? palette;
  final bool showCommunityInfo;
  final void Function()? onCommunityButtonTap;

  const PublishInfoWidget(
      this.publishable,
      { this.palette,
        this.showCommunityInfo = false,
        this.onCommunityButtonTap,
        super.key
      });

  @override
  Widget build(BuildContext context) => Consumer<CommunityProvider>(
    builder: (context, prov, child) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if(showCommunityInfo || publishable.author == null)
          Stack(
            children: [

              CommunityThumbnailWidget(
                  publishable.community.iconKey,
                  publishable.community.key,
                  palette: palette,
                  colorsInverted: true,
                  size: AccountThumbnailWidget.defSize,//.8*CommunityThumbnailWidget.defSize,
                  paddingSize: factor*CommunityThumbnailWidget.defPaddingSize,
                  radius: communityRadius,
                  borderSize: factor*CommunityThumbnailWidget.defBorderWidth,
                  heroTag: false,
                  onTap: onCommunityButtonTap
              ),

              if(publishable.author != null)
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: IgnorePointer(
                      child: AccountThumbnailWidget(
                        name: publishable.author!.name,
                        elevated: false,

                        color: CommunityCoverColors.backgroundColor(context, palette),

                        borderColor: CommunityCoverColors.backgroundColor(context, palette),

                        size: .45*AccountThumbnailWidget.defSize,
                      ),
                    )
                )

            ],
          )
        else
          AccountThumbnailWidget(
            name: publishable.author!.name,
            elevated: false,

            color: CommunityCoverColors.backgroundColor(context, palette),

            borderColor: CommunityCoverColors.backgroundColor(context, palette),
          ),

        const SizedBox(width: 10.0),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child:
                showCommunityInfo || publishable.author == null?
                Text(
                  publishable.community.name,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_NORMAL,
                      fontWeight: weight.halfBold
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.clip,
                ):
                Text(publishable.author!.name, style: AppTextStyle()),
              ),

              Row(
                children: [

                  const SizedBox(height: Dimen.TEXT_SIZE_NORMAL + 2 + 2*4),

                  if(showCommunityInfo && publishable.author != null)
                    Text('${publishable.author!.name}  ', style: AppTextStyle()),

                  FutureBuilder(
                      future: TimeSettings.isTimeAutomatic,
                      builder: (BuildContext context, AsyncSnapshot<bool> snapshot){

                        bool? isTimeAuto = snapshot.data;

                        Widget Function(BuildContext) builder;
                        Duration diff;

                        if(snapshot.hasData && isTimeAuto == true) {
                          builder = (context) => Text(
                            timeAgo(DateTime.now(), publishable.publishTime),
                            style: AppTextStyle(color: hintEnab_(context)),
                          );
                          diff = publishable.publishTime.difference(DateTime.now());
                        }
                        else if(AccountData.lastServerTime != null) {
                          builder = (context) => Text(
                            timeAgo(AccountData.lastServerTime!, publishable.publishTime),
                            style: AppTextStyle(color: hintEnab_(context)),
                          );
                          diff = publishable.publishTime.difference(AccountData.lastServerTime!);
                        } else
                          return Text(
                            dateToString(publishable.publishTime, withTime: true, shortMonth: true),
                            style: AppTextStyle(color: hintEnab_(context)),
                          );

                        return PeriodicRebuildWidget(
                          duration: diff < const Duration(seconds: 60)?
                          const Duration(seconds: 1):
                          const Duration(minutes: 1),
                          builder: builder,
                        );

                      }
                  )


                ],
              ),

            ],
          ),
        ),

        const SizedBox(width: 6.0),

        SimpleButton(
          onTap: onCommunityButtonTap,
          color: CommunityCoverColors.backgroundColor(context, palette),
          radius: AppCard.defRadius,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [

                Icon(
                  publishable is Post?Forum.icon:Circle.icon,
                  size: Dimen.TEXT_SIZE_NORMAL + 2,
                  color: textEnab_(context),
                ),

                const SizedBox(width: 4.0),

                Text(
                  publishable is Post?'Forum':'Krąg',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_NORMAL,
                      fontWeight: weight.halfBold
                  ),
                ),

              ],
            ),
          ),
        ),


      ],
    )
  );

}

class LinkPreviewer extends StatefulWidget{

  final String urlToPreview;
  final PaletteGenerator? palette;
  const LinkPreviewer(this.urlToPreview, this.palette, {super.key});

  @override
  State<StatefulWidget> createState() => LinkPreviewerState();

}

class LinkPreviewerState extends State<LinkPreviewer>{

  String get urlToPreview => widget.urlToPreview;
  PaletteGenerator? get palette => widget.palette;

  dynamic data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SimpleButton(
    radius: 0,
    color: CommunityCoverColors.backgroundColor(context, palette).withOpacity(.35),
    clipBehavior: Clip.hardEdge,
    onTap: () => launchURL(urlToPreview),
    onLongPress: (){
      Clipboard.setData(ClipboardData(text: urlToPreview));
      showAppToast(context, text: 'Link skopiowany');
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LinkPreview(
          enableAnimation: true,
          onPreviewDataFetched: (data) {
            setState(() => this.data = data);
          },
          previewData: data,
          text: urlToPreview,
          textWidget: Text(urlToPreview, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyle()),
          width: MediaQuery.of(context).size.width,
          openOnPreviewTitleTap: true,
          openOnPreviewImageTap: true,
        ),

        if(data == null)
          Padding(
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            child: SpinKitChasingDots(size: Dimen.ICON_SIZE, color: CommunityCoverColors.strongColor(context, palette)),
          )
      ],
    ),
  );

}