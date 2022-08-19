import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart' hide Size;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/circle/model/announcement.dart';
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

import '../cover_image.dart';
import 'common/community_cover_colors.dart';
import 'forum/model/post.dart';

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

  final bool showCommunityInfo;
  final void Function()? onCommunityButtonTap;

  final Widget? contentTop;
  final Widget? contentBottom;

  final Widget? bottomLeading;
  final Widget? bottomTrailing;

  const CommunityPublishableWidgetTemplate(
      this.publishable,
      this.palette,
      { this.shrinkText = true,
        this.onTap,
        this.onUpdateTap,

        this.showCommunityInfo = false,
        this.onCommunityButtonTap,

        this.contentTop,
        this.contentBottom,

        this.bottomLeading,
        this.bottomTrailing,

        super.key
      });

  @override
  Widget build(BuildContext context){

    bool showEdit = AccountData.key == publishable.author?.key && onUpdateTap != null;

    bool hasTitle = publishable.title.isNotEmpty;

    Size? textSize;
    if(shrinkText) {
      TextPainter textPainter = TextPainter(
          text: TextSpan(text: publishable.text, style: textStyle),
          textDirection: TextDirection.ltr
      )..layout(minWidth: 0, maxWidth: double.infinity);
      textSize = textPainter.size;
    }

    bool showCommunityThumb = showCommunityInfo || publishable is Post;
    bool showAuthor = publishable.author != null;

    double headerHeight =
    showCommunityThumb?
    .85*CommunityThumbnailWidget.defSize:
    PublishInfoWidget.height + 2*Dimen.defMarg;

    return Column(
      children: [

        SimpleButton(
          onTap: onTap,
          color: CommunityCoverColors.cardColor(context, palette),
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(radius),
          elevation: elevation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Container(
                color: backgroundIcon_(context),
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.defMarg),
                  child: PublishInfoWidget(
                    publishable,
                    palette: palette,
                    showCommunityInfo: showCommunityInfo,
                    onCommunityButtonTap: onCommunityButtonTap,
                  ),
                ),
              ),

              if(contentTop != null)
                contentTop!,

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
                      const SizedBox(height: Dimen.ICON_MARG),

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
                CoverImage(publishable.coverImage!),


              if(showEdit || bottomLeading != null || bottomTrailing != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

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

                  ],
                ),

              if(showEdit && bottomLeading != null && bottomTrailing != null)
                const SizedBox(height: Dimen.SIDE_MARG - Dimen.ICON_MARG),

              if(publishable.urlToPreview != null)
                LinkPreviewer(publishable.urlToPreview!, palette),

            ],
          ),
        ),

      ],
    );
  }

}

class PublishInfoWidget extends StatelessWidget{

  static const double lineSepHeight = 6.0;
  static const double height = 2*Dimen.TEXT_SIZE_NORMAL + lineSepHeight;

  final CommunityPublishable publishable;
  final PaletteGenerator? palette;
  final bool showCommunityInfo;
  final void Function()? onCommunityButtonTap;

  const PublishInfoWidget(this.publishable, {this.palette, this.showCommunityInfo = false, this.onCommunityButtonTap, super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [

      if(showCommunityInfo || publishable.author == null)
        Stack(
          children: [

            CommunityThumbnailWidget(
                publishable.community.iconKey,
                palette: palette,
                size: .8*CommunityThumbnailWidget.defSize,
                paddingSize: .8*CommunityThumbnailWidget.defPaddingSize,
                radius: .8*AppCard.bigRadius,
                borderSize: 0,
                heroTag: false,
                onTap: onCommunityButtonTap
            ),

            if(publishable.author != null)
              Positioned(
                right: 0,
                bottom: 0,
                child: AccountThumbnailWidget(
                  name: publishable.author!.name,
                  elevated: false,
                  color: CommunityCoverColors.backgroundColor(context, palette),
                  borderColor: CommunityCoverColors.cardColor(context, palette),
                  size: .45*.8*CommunityThumbnailWidget.defSize,
                ),
              )

          ],
        )
      else
        AccountThumbnailWidget(
          name: publishable.author!.name,
          elevated: false,
          color: CommunityCoverColors.backgroundColor(context, palette),
          borderColor: CommunityCoverColors.cardColor(context, palette),
        ),

      const SizedBox(width: 12.0),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if(showCommunityInfo || publishable.author == null)
              Row(
                children: [
                  Text(publishable.community.name, style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      fontWeight: weight.halfBold
                  )),

                  const SizedBox(width: 6.0),

                  Icon(
                    publishable is Post?Post.icon:Announcement.icon,
                    size: Dimen.TEXT_SIZE_BIG + 2,
                    color: textEnab_(context),
                  ),

                ],
              )
            else
              Text(publishable.author!.name, style: AppTextStyle()),

            const SizedBox(height: 6.0),
            Row(
              children: [
                if(showCommunityInfo && publishable.author != null)
                  Text('${publishable.author!.name}  ', style: AppTextStyle()),

                Text(
                  dateToString(publishable.publishTime, shortMonth: true, withTime: true),
                  style: AppTextStyle(color: hintEnab_(context)),
                ),
              ],
            ),

          ],
        ),
      )

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
        left: Dimen.defMarg,
        right: Dimen.defMarg,
        bottom: Dimen.defMarg
    ),
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