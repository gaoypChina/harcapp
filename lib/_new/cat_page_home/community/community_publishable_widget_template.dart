import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart' hide Size;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/community_publishable.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../cover_image.dart';
import 'common/community_cover_colors.dart';

class CommunityPublishableWidgetTemplate extends StatelessWidget{

  static const double radius = 8.0;
  static const double elevation = 0;
  static const int shrinkedTextMaxLines = 5;
  static TextStyle textStyle = AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL);

  final CommunityPublishable publishable;
  final PaletteGenerator? palette;
  final bool shrinkText;
  final void Function()? onTap;
  final void Function()? onUpdateTap;

  final bool showSourceButton;
  final void Function()? onSourceButtonTap;
  final IconData? sourceIcon;
  final String? sourceText;

  final Widget? publishInfoTrailing;

  final Widget? titleTop;

  final Widget? bottomLeading;
  final Widget? bottomTrailing;

  final double bottomLeadingPadding;
  final double bottomTrailingPadding;

  const CommunityPublishableWidgetTemplate(
      this.publishable,
      this.palette,
      { this.shrinkText = true,
        this.onTap,
        this.onUpdateTap,

        this.showSourceButton = false,
        this.onSourceButtonTap,
        this.sourceIcon,
        this.sourceText,

        this.publishInfoTrailing,

        this.titleTop,

        this.bottomLeading,
        this.bottomTrailing,

        this.bottomLeadingPadding = 0,
        this.bottomTrailingPadding = 0,

        super.key
      });

  @override
  Widget build(BuildContext context){

    bool showEdit = AccountData.key == publishable.author.key && onUpdateTap != null;

    bool hasTitle = publishable.title.isNotEmpty;

    Size? textSize;
    if(shrinkText) {
      TextPainter textPainter = TextPainter(
          text: TextSpan(text: publishable.text, style: textStyle),
          textDirection: TextDirection.ltr
      )..layout(minWidth: 0, maxWidth: double.infinity);
      textSize = textPainter.size;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        if(showSourceButton)
          Stack(
            clipBehavior: Clip.none,
            children: [

              Positioned.fill(child: Material(
                color: CommunityCoverColors.cardColor(context, palette),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(CommunityPublishableWidgetTemplate.radius),
                    topRight: Radius.circular(CommunityPublishableWidgetTemplate.radius)
                ),
              )),

              SimpleButton(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(CommunityPublishableWidgetTemplate.radius),
                      topRight: Radius.circular(CommunityPublishableWidgetTemplate.radius)
                  ),
                  color: backgroundIcon_(context),
                  onTap: onSourceButtonTap,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(sourceIcon, size: 20),
                        const SizedBox(width: Dimen.ICON_MARG),
                        if(sourceText != null) Text(sourceText!, style: AppTextStyle(fontWeight: weight.halfBold, color: iconEnab_(context)))
                      ],
                    ),
                  )
              )

            ],
          ),

        SimpleButton(
          onTap: onTap,
          color: CommunityCoverColors.cardColor(context, palette),
          clipBehavior: Clip.antiAlias,
          borderRadius: showSourceButton?
          const BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius)
          ):
          BorderRadius.circular(radius),
          elevation: elevation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              if(publishable.coverImage != null)
                CoverImage(publishable.coverImage!),

              Container(
                  color: backgroundIcon_(context),
                  child: Row(
                    children: [

                      const SizedBox(
                        height: Dimen.ICON_FOOTPRINT,
                      ),

                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: Dimen.ICON_MARG,
                                left: Dimen.SIDE_MARG,
                                bottom: Dimen.ICON_MARG
                            ),
                            child: PublishInfoWidget(publishable)
                        ),
                      ),
                      
                      if(publishInfoTrailing != null)
                        publishInfoTrailing!,

                    ],
                  )
              ),

              if(titleTop != null)
                titleTop!,

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    if(hasTitle)
                      Text(
                        publishable.title,
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    if(hasTitle)
                      const SizedBox(height: 12),

                    if(shrinkText)
                      Text(
                          publishable.text,
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
                          maxLines: shrinkedTextMaxLines,
                          overflow: TextOverflow.ellipsis
                      )
                    else
                      SelectableText(
                        publishable.text,
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
                      ),

                    if(shrinkText && textSize!.height > shrinkedTextMaxLines*(textStyle.fontSize! * (textStyle.height??1).toDouble()))
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2*Dimen.DEF_MARG),
                          child: Text('...czytaj dalej', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_NORMAL)),
                        ),
                      )

                  ],
                ),
              ),

              if(showEdit || bottomLeading != null || bottomTrailing != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    SizedBox(
                      height: Dimen.ICON_FOOTPRINT,
                      width: bottomLeadingPadding,
                    ),

                    if(bottomLeading != null)
                      bottomLeading!,

                    if(showEdit)
                      IconButton(
                          icon: const Icon(MdiIcons.pencilOutline),
                          onPressed: onUpdateTap
                      ),

                    Expanded(child: Container()),

                    if(bottomTrailing != null)
                      bottomTrailing!,

                    SizedBox(
                      width: bottomTrailingPadding,
                    )

                  ],
                ),

              if(showEdit && bottomLeading != null && bottomTrailing != null)
                const SizedBox(height: Dimen.SIDE_MARG - Dimen.ICON_MARG),

              if(publishable.urlToPreview != null)
                LinkPreviewer(publishable.urlToPreview!, palette),

            ],
          ),
        )

      ],
    );
  }

}

class PublishInfoWidget extends StatelessWidget{

  final CommunityPublishable publishable;
  const PublishInfoWidget(this.publishable, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(publishable.author.name, style: AppTextStyle()),
      Text(
        dateToString(publishable.publishTime, shortMonth: true, withTime: true),
        style: AppTextStyle(color: hintEnab_(context)),
      ),

    ],
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
    margin: const EdgeInsets.only(
        left: Dimen.DEF_MARG,
        right: Dimen.DEF_MARG,
        bottom: Dimen.DEF_MARG
    ),
    elevation: 3,
    color: CommunityCoverColors.backgroundColor(context, palette),
    clipBehavior: Clip.hardEdge,
    borderRadius: BorderRadius.circular(CommunityPublishableWidgetTemplate.radius),
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