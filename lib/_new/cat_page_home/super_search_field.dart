import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_home/_main.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/_new/cat_page_home/community/common/cover_image_selector_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'community/circle/model/circle.dart';
import 'community/community_thumbnail_widget.dart';
import 'community/forum/model/forum.dart';

class SuperSearchField extends StatelessWidget{

  static const String heroTag = 'SuperSearchField';

  final TextEditingController? controller;
  final Widget? leading;
  final bool autofocus;
  final FocusNode? focusNode;
  final EdgeInsets margin;
  final void Function(String)? onChanged;

  const SuperSearchField({this.controller, this.leading, this.autofocus = false, this.focusNode, this.margin = SearchField.normMargin, this.onChanged, super.key});

  @override
  Widget build(BuildContext context) => Hero(
    tag: heroTag,
    child: SearchField(
      hint: 'Szukaj czego tam tylko chcesz:',
      controller: controller,
      leading: leading,
      autofocus: autofocus,
      focusNode: focusNode,
      margin: margin,
      onChanged: onChanged,
      elevation: 0,
      color: CommunityCoverColors.nonPaletteCardColor(),
      background: background_(context),
    ),
  );

}


class SuperSearchFieldButton extends StatelessWidget{

  final EdgeInsets margin;
  const SuperSearchFieldButton({this.margin = SearchField.normMargin, super.key});

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => pushPage(context, builder: (context) => const SuperSearchPage()),
    child: AbsorbPointer(
      child: SuperSearchField(margin: margin),
    ),
  );

}


class SuperSearchPage extends StatefulWidget{

  const SuperSearchPage({super.key});

  @override
  State<StatefulWidget> createState() => SuperSearchPageState();

}

class SuperSearchPageState extends State<SuperSearchPage>{

  late List<dynamic> searched;

  late TextEditingController textController;

  @override
  void initState() {
    searched = [];
    textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        FloatingContainer.child(
            child: SuperSearchField(
              autofocus: true,
              controller: textController,
              leading: IconButton(
                icon: const Icon(MdiIcons.arrowLeft),
                onPressed: () => Navigator.pop(context),
              ),
              onChanged: (text){

                searched.clear();

                if(text.isEmpty) {
                  setState((){});
                  return;
                }

                text = remPolChars(remSpecChars(text.toLowerCase()));

                for(IndivComp comp in IndivComp.all!){
                 if(remPolChars(remSpecChars(comp.name)).contains(text))
                   searched.add(comp);
                }

                for(Community community in Community.all!){
                  if(remPolChars(remSpecChars(community.name)).contains(text)) {
                    searched.add(community);

                    if(community.circle != null)
                      searched.add(community.circle);

                    if(community.forum != null)
                      searched.add(community.forum);
                  }

                }

                setState((){});

              }
            ),
            height: SearchField.height
        ),

        if(textController.text.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [

                ListTile(
                  leading: const SizedBox(),
                  title: Text(
                      'Wpisz frazę by wyszukać swoje:',
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: iconDisab_(context)
                      )
                  ),
                ),

                ListTile(
                  leading: Icon(MdiIcons.plusCircleMultipleOutline, color: iconDisab_(context)),
                  dense: true,
                  title: Text(
                    'Współzawodnictwo',
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      color: iconDisab_(context)
                    )
                  ),
                ),

                ListTile(
                  leading: Icon(Community.icon, color: iconDisab_(context)),
                  dense: true,
                  title: Text(
                      'Środowisko',
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: iconDisab_(context)
                      )
                  ),
                ),

                ListTile(
                  leading: Icon(Circle.icon, color: iconDisab_(context)),
                  dense: true,
                  title: Text(
                      'Krąg',
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: iconDisab_(context)
                      )
                  ),
                ),

                ListTile(
                  leading: Icon(Forum.icon, color: iconDisab_(context)),
                  dense: true,
                  title: Text(
                      'Forum',
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: iconDisab_(context)
                      )
                  ),
                ),

              ],
            )
          )
        else if(searched.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: EmptyMessageWidget(
              icon: MdiIcons.magnifyClose,
              text: 'Niczego nie\nznaleziono',
            ),
          )
        else
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index){

              dynamic item = searched[index];

              if(item is IndivComp)
                return _IndivCompTile(comp: item);

              if(item is Community)
                return _CommunityTile(community: item);

              if(item is Circle)
                return _CircleTile(circle: item);

              if(item is Forum)
                return _ForumTile(forum: item);
            },
            childCount: searched.length,
          ))

      ],
    ),
  );

}

class TemplateTile extends StatelessWidget{

  final Widget? leading;
  final String name;
  final String typeName;
  final IconData typeIcon;
  final void Function()? onTap;

  const TemplateTile({this.leading, required this.name, required this.typeName, required this.typeIcon, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => ListTile(
    onTap: onTap,
    leading: leading,
    title: Text(name, style: AppTextStyle()),
    subtitle: Row(
      children: [

        Icon(typeIcon, size: 18.0),

        const SizedBox(width: Dimen.defMarg),

        Text(typeName, style: AppTextStyle(fontWeight: weight.halfBold)),

      ],
    )
  );

}

class _IndivCompTile extends StatelessWidget{

  final IndivComp comp;

  const _IndivCompTile({required this.comp, super.key});

  @override
  Widget build(BuildContext context) => TemplateTile(
    name: comp.name,
    typeName: 'Współzawodnictwo',
    typeIcon: MdiIcons.plusCircleMultiple,
    leading: IndivCompThumbnailWidget.from(comp: comp, size: 48.0),
    onTap: () => CatPageHomeState.openCompPage(context, comp, replacePage: true),
  );

}

class _CommunityTile extends StatelessWidget{

  final Community community;

  const _CommunityTile({required this.community, super.key});

  @override
  Widget build(BuildContext context) => TemplateTile(
    name: community.name,
    typeName: 'Społeczność',
    typeIcon: MdiIcons.accountMultiple,
    leading: CommunityThumbnailWidget(
      community.iconKey,
      community.key,
      size: 48.0,
      borderSize: CommunityThumbnailWidget.border(48.0),
      paddingSize: CommunityThumbnailWidget.padding(48.0),
      radius: CommunityThumbnailWidget.radius_(48.0),
    ),
    onTap: () => CatPageHomeState.openCommunityPage(context, community, replacePage: true),
  );

}

class _CircleTile extends StatelessWidget{

  final Circle circle;

  const _CircleTile({required this.circle, super.key});

  @override
  Widget build(BuildContext context) => TemplateTile(
    name: circle.name,
    typeName: 'Krąg',
    typeIcon: Circle.icon,
    leading: SizedBox(
      height: 48.0,
      width: 48.0,
      child: CoverImageWidget(
        circle.coverImage,
        radius: AppCard.defRadius,
      )
    ),
    onTap: () => CatPageHomeState.openCirclePage(context, circle, replacePage: true),
  );

}

class _ForumTile extends StatelessWidget{

  final Forum forum;

  const _ForumTile({required this.forum, super.key});

  @override
  Widget build(BuildContext context) => TemplateTile(
    name: forum.name,
    typeName: 'Forum',
    typeIcon: Forum.icon,
    leading: SizedBox(
      height: 48.0,
      width: 48.0,
      child: CoverImageWidget(
        forum.coverImage,
        radius: AppCard.defRadius
      )
    ),
    onTap: () => CatPageHomeState.openForumPage(context, forum, replacePage: true),
  );

}