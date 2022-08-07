import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart' hide Size;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/circles/announcement_widget_template.dart';
import 'package:harcapp/_new/cat_page_home/cover_image.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import '../common/community_cover_colors.dart';
import 'model/post.dart';

class PostWidgetTemplate extends StatelessWidget{

  static const double radius = 8.0;
  static const double elevation = 0;
  static const int shrinkedTextMaxLines = 5;
  static TextStyle textStyle = AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL);

  final Post post;
  final bool shrinkText;
  final PaletteGenerator? palette;
  final void Function()? onTap;
  final void Function()? onUpdateTap;
  final bool showForumButton;
  final void Function()? onForumButtonTap;

  const PostWidgetTemplate(
      this.post,
      { this.shrinkText = true,
        this.palette,
        this.onTap,
        this.onUpdateTap,
        this.showForumButton = false,
        this.onForumButtonTap,
        Key? key
      }) : super(key: key);

  @override
  Widget build(BuildContext context){

    bool showEdit = AccountData.key == post.author.key && onUpdateTap != null;

    bool hasTitle = post.title.isNotEmpty;

    Size? textSize;
    if(shrinkText) {
      TextPainter textPainter = TextPainter(
          text: TextSpan(text: post.text, style: textStyle),
          textDirection: TextDirection.ltr
      )..layout(minWidth: 0, maxWidth: double.infinity);
      textSize = textPainter.size;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [

        if(showForumButton)
          Stack(
            clipBehavior: Clip.none,
            children: [

              Positioned.fill(child: Material(
                color: CommunityCoverColors.cardColor(context, palette),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(PostWidgetTemplate.radius),
                    topRight: Radius.circular(PostWidgetTemplate.radius)
                ),
              )),
              
              SimpleButton(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(PostWidgetTemplate.radius),
                      topRight: Radius.circular(PostWidgetTemplate.radius)
                  ),
                  color: backgroundIcon_(context),
                  onTap: onForumButtonTap,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(MdiIcons.googleCircles, size: 20),
                        const SizedBox(width: Dimen.ICON_MARG),
                        Text(post.forum!.name, style: AppTextStyle(fontWeight: weight.halfBold, color: iconEnab_(context)))
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
          borderRadius: showForumButton?
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

              if(post.coverImage != null)
                CoverImage(post.coverImage!),

              Container(
                  color: backgroundIcon_(context),
                  child: Row(
                    children: [

                      const SizedBox(height: Dimen.ICON_FOOTPRINT),

                      Expanded(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: Dimen.ICON_MARG,
                                left: Dimen.SIDE_MARG,
                                bottom: Dimen.ICON_MARG
                            ),
                            child: PostingInfoWidget(post)
                        ),
                      ),

                    ],
                  )
              ),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    if(hasTitle)
                      Text(
                        post.title,
                        style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                    if(hasTitle)
                      const SizedBox(height: 12),

                    if(shrinkText)
                      Text(
                          post.text,
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL),
                          maxLines: shrinkedTextMaxLines,
                          overflow: TextOverflow.ellipsis
                      )
                    else
                      SelectableText(
                        post.text,
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

              if(showEdit)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    const SizedBox(height: Dimen.ICON_FOOTPRINT),

                    const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),


                    if(showEdit)
                      IconButton(
                          icon: const Icon(MdiIcons.pencilOutline),
                          onPressed: onUpdateTap
                      ),

                    Expanded(child: Container()),

                    const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG),

                  ],
                ),

            ],
          ),
        )

      ],
    );

  }

}

class PostingInfoWidget extends StatelessWidget{

  final Post post;
  const PostingInfoWidget(this.post, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Text(post.author.name, style: AppTextStyle()),
      Text(
        dateToString(post.postTime, shortMonth: true, withTime: true),
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
    borderRadius: BorderRadius.circular(AnnouncementWidgetTemplate.radius),
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