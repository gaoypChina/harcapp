import 'package:flutter/material.dart';
import 'package:flutter_link_previewer/flutter_link_previewer.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_image_data.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:optional/optional.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../community_publishable_widget_template.dart';
import '../../common/cover_image_selectable_widget.dart';
import '../model/forum.dart';
import '../model/post.dart';
import '../post_widget_template.dart';

class PostEditorPage extends StatefulWidget{

  final Forum forum;
  final PaletteGenerator? palette;
  final Post? initPost;

  final void Function(Post)? onSaved;
  final void Function()? onRemoved;
  final void Function()? onError;

  const PostEditorPage(
      { required this.forum,
        required this.palette,
        this.initPost,
        this.onSaved,
        this.onRemoved,
        this.onError,
        Key? key
      }) : super(key: key);

  @override
  State<StatefulWidget> createState() => PostEditorPageState();


}

class PostEditorPageState extends State<PostEditorPage>{

  Forum get forum => widget.forum;
  PaletteGenerator? get palette => widget.palette;
  Post? get initPost => widget.initPost;

  void Function(Post)? get onSaved => widget.onSaved;
  void Function()? get onRemoved => widget.onRemoved;
  void Function()? get onError => widget.onError;

  CommunityCoverImageData? coverImage;

  late TextEditingController titleController;
  late TextEditingController textController;
  late TextEditingController urlToPreviewController;

  dynamic previewData;

  dynamic heroTag;

  @override
  void initState() {
    coverImage = initPost?.coverImage;
    titleController = TextEditingController(text: initPost?.title??'');
    textController = TextEditingController(text: initPost?.text??'');
    urlToPreviewController = TextEditingController(text: initPost?.urlToPreview??'');

    heroTag = initPost??UniqueKey();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CommunityCoverColors.cardColor(context, palette),
    appBottomNavColor: CommunityCoverColors.cardColor(context, palette),
    body: CustomScrollView(
      clipBehavior: Clip.none,
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: Text(
            initPost==null?'Dodaj post':'Edytuj post',
            style: AppTextStyle(),
          ),
          backgroundColor: CommunityCoverColors.cardColor(context, palette),
          centerTitle: true,
          floating: true,
          actions: [
            IconButton(
              icon: const Icon(MdiIcons.eyeOutline),
              onPressed: (){

                Post post = Post(
                  key: '',
                  title: titleController.text,
                  publishTime: DateTime.now(),
                  lastUpdateTime: DateTime.now(),

                  urlToPreview: urlToPreviewController.text.isEmpty?
                  null:
                  urlToPreviewController.text,

                  author: UserData(
                    key: AccountData.key!,
                    name: AccountData.name!,
                    shadow: false,
                    sex: AccountData.sex!,
                  ),
                  coverImage: coverImage,
                  text: textController.text,
                  forum: forum,
                );

                openDialog(
                  context: context,
                  builder: (context) => IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            Expanded(child: Center(
                              child: SingleChildScrollView(
                                child: Hero(
                                  tag: heroTag,
                                  child: PostWidgetTemplate(
                                    post,
                                    palette: palette,
                                  ),
                                ),
                              ),
                            )),

                            const SizedBox(height: Dimen.SIDE_MARG),

                            SimpleButton.from(
                              elevation: AppCard.bigElevation,
                              margin: EdgeInsets.zero,
                              textColor: iconEnab_(context),
                              color: CommunityCoverColors.cardColor(context, palette),
                              icon: MdiIcons.arrowLeft,
                              text: 'Wróć',
                              onTap: () => Navigator.pop(context),
                            ),

                          ]
                      )
                    )
                  )
                );

              }
            )
          ],
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([


            Material(
              borderRadius: BorderRadius.circular(AppCard.defRadius),
              color: CommunityCoverColors.backgroundColor(context, palette),
              child: Padding(
                padding: const EdgeInsets.all(Dimen.ICON_MARG),
                child: Text(
                  'Ten post będą mogli zobaczyć wszyscy\nz kontem HarcApp.',
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                    color: CommunityCoverColors.strongColor(context, palette),
                    fontWeight: weight.halfBold
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            AppTextFieldHint(
              hint: 'Tytuł:',
              hintTop: 'Tytuł',
              controller: titleController,
              style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
              maxLines: 1,
              textCapitalization: TextCapitalization.sentences
            ),

            const SizedBox(height: 10),

            AppTextFieldHint(
              hint: 'Treść:',
              hintTop: '',
              controller: textController,
              style: CommunityPublishableWidgetTemplate.textStyle,
              maxLines: null,
              textCapitalization: TextCapitalization.sentences
            ),

          ])),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            if(coverImage == null)
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(CommunityPublishableWidgetTemplate.radius),
                      color: backgroundIcon_(context)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    children: [

                      const SizedBox(width: Dimen.SIDE_MARG),

                      Expanded(
                        child: AppTextFieldHint(
                            hint: 'Link z podglądem:',
                            hintTop: '',
                            controller: urlToPreviewController,
                            onAnyChanged: (_){
                              previewData = null;
                              setState(() {});
                            },
                            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                            hintStyle: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                fontWeight: weight.halfBold,
                                color: hintEnab_(context)
                            ),
                            maxLines: 1,
                            textCapitalization: TextCapitalization.sentences
                        ),
                      ),

                      if(urlToPreviewController.text.isNotEmpty)
                        IconButton(
                          icon: const Icon(MdiIcons.close),
                          onPressed: (){
                            previewData = null;
                            setState(() => urlToPreviewController.clear());
                          },
                        )

                    ],
                  )
              ),

            if(coverImage == null && urlToPreviewController.text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: Dimen.SIDE_MARG),
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(CommunityPublishableWidgetTemplate.radius),
                  color: CommunityCoverColors.cardColor(context, palette),
                  clipBehavior: Clip.hardEdge,
                  child: LinkPreview(
                    enableAnimation: true,
                    onPreviewDataFetched: (data) {
                      setState(() => previewData = data);
                    },
                    previewData: previewData,
                    text: urlToPreviewController.text,
                    width: MediaQuery.of(context).size.width,

                    openOnPreviewTitleTap: true,
                    openOnPreviewImageTap: true,
                    //key: ValueKey(urlToPreviewController.text),
                  ),
                ),
              ),

            const SizedBox(height: Dimen.SIDE_MARG),

            if(urlToPreviewController.text.isEmpty)
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(CommunityPublishableWidgetTemplate.radius)
                ),
                clipBehavior: Clip.hardEdge,
                child:
                CoverImageSelectableWidget(
                  palette,
                  initCoverImage: coverImage,
                  showAdaptiveImages: false,
                  separateAdaptiveImages: true,
                  removable: true,
                  onSelected: (newCoverImage) => setState(() => coverImage = newCoverImage),
                  emptyBuilder: (context) => SizedBox(
                    height: Dimen.ICON_FOOTPRINT,
                    child: Container(
                      color: backgroundIcon_(context),
                      child: Row(
                        children: [

                          const SizedBox(width: Dimen.SIDE_MARG),

                          Expanded(
                            child: Text(
                              'Dodaj grafikę',
                              style: AppTextStyle(
                                  color: hintEnab_(context),
                                  fontWeight: weight.halfBold,
                                  fontSize: Dimen.TEXT_SIZE_BIG
                              ),
                            ),
                          ),

                          Icon(MdiIcons.imagePlus, color: hintEnab_(context)),

                          const SizedBox(width: Dimen.SIDE_MARG),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

            const SizedBox(height: Dimen.SIDE_MARG),

            SimpleButton.from(
                elevation: AppCard.bigElevation,
                margin: EdgeInsets.zero,
                radius: AppCard.defRadius,
                textColor: CommunityCoverColors.backgroundColor(context, palette),
                color: CommunityCoverColors.strongColor(context, palette),
                icon: MdiIcons.earthArrowRight,
                text: initPost==null?'Dodaj post':'Edytuj post',
                onTap: () => showAppToast(
                    context,
                    text: 'Przytrzymaj, aby opublikować'
                ),
                onLongPress: () async {

                  if(textController.text.isEmpty){
                    showAppToast(context, text: 'Podaj treść posta');
                    return;
                  }

                  showLoadingWidget(
                      context, CommunityCoverColors.strongColor(context, palette),
                      initPost == null?'Publikowanie...':'Uaktualnianie...'
                  );

                  if(initPost == null)
                    await ApiForum.publishPost(
                        forumKey: forum.key,
                        title: titleController.text,

                        urlToPreview: urlToPreviewController.text.isEmpty?
                        null:
                        urlToPreviewController.text,

                        coverImage: coverImage,
                        text: textController.text,
                        onSuccess: (post) async {
                          if(mounted) await popPage(context); // Close loading widget.
                          if(mounted) popPage(context); // Close page.
                          onSaved?.call(post);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) popPage(context); // Close loading widget.
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onImageDBWakingUp: () async {
                          if(mounted) await popPage(context); // Close loading widget.
                          if(mounted) showImageDBWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          if(mounted) await popPage(context); // Close loading widget.
                          if(mounted) showAppToast(context, text: 'Błąd w publikowaniu');
                          onError?.call();
                        }
                    );
                  else
                    await ApiForum.updatePost(
                        post: initPost!,

                        title:
                        initPost!.title == titleController.text?
                        null:
                        Optional.of(titleController.text),

                        urlToPreview:
                        initPost!.urlToPreview == urlToPreviewController.text ||
                        (initPost!.urlToPreview == null && urlToPreviewController.text.isEmpty)?
                        null:
                        Optional.ofNullable(
                            urlToPreviewController.text.isEmpty?
                            null:
                            urlToPreviewController.text
                        ),

                        coverImage:
                        initPost!.coverImage?.uniqueID == coverImage?.uniqueID?
                        null:
                        Optional.ofNullable(coverImage),

                        text:
                        initPost!.text == textController.text?
                        null:
                        textController.text,

                        onSuccess: (post) async {
                          if(mounted) await popPage(context); // Close loading widget.
                          onSaved?.call(post);
                        },
                        onServerMaybeWakingUp: () {
                          if(mounted) popPage(context); // Close loading widget.
                          if(mounted) showServerWakingUpToast(context);
                          return true;
                        },
                        onImageDBWakingUp: (){
                          if(mounted) popPage(context); // Close loading widget.
                          if(mounted) showImageDBWakingUpToast(context);
                          return true;
                        },
                        onError: () async {
                          if(mounted) await popPage(context); // Close loading widget.
                          if(mounted) showAppToast(context, text: 'Błąd w publikowaniu');
                          onError?.call();
                        }
                    );

                }
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

          ])),
        ),


      ],
    ),
  );



}