import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/community/common_widgets/community_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/_new/cat_page_home/community/select_community.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class CommunitiesPart extends StatefulWidget{

  final MarkerData? initMarker;

  const CommunitiesPart({this.initMarker, super.key});

  @override
  State<StatefulWidget> createState() => CommunitiesPartState();

}

class CommunitiesPartState extends State<CommunitiesPart> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  MarkerData? get initMarker => widget.initMarker;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    return Consumer<BindedCommunitiesProvider>(
        builder: (context, prov, child){
          Map<String, String> communities = prov.communities;
          return Stack(
            children: [

              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [

                  // SliverOverlapInjector does not work with SliverAppBar(pinned = true);
                  // SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

                  SliverPadding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    sliver: SliverList(delegate: SliverChildListDelegate([

                      TitleShortcutRowWidget(
                        title: 'Środowiska powiązane z miejscem',
                        titleColor: hintEnab_(context),
                        textAlign: TextAlign.left,
                      )

                    ])),
                  ),

                  if(communities.isEmpty)
                    const SliverFillRemaining(
                      child: Center(
                        child: EmptyMessageWidget(
                          icon: Community.icon,
                          text: 'Nikt się tu na razie nie kręci...',
                        ),
                      ),
                    ),
                  SliverPadding(
                      padding: const EdgeInsets.only(
                        right: Dimen.SIDE_MARG,
                        left: Dimen.SIDE_MARG,
                        bottom: Dimen.SIDE_MARG
                      ),
                      sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                        (context, index){
                          String commKey = communities.keys.toList()[index];
                          Community community = Community.allMap![commKey]!;
                          return BindedCommunityEditWidget(
                            community: community,
                            initNote: communities[commKey],
                            onNoteChanged: (note) => prov.edit(commKey, note),
                            onRemoveTap: () => prov.remove(commKey),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                        count: communities.length,
                      ))
                  )

                ],
              ),

              Positioned(
                  bottom: Dimen.defMarg,
                  left: Dimen.defMarg,
                  right: Dimen.defMarg,
                  child: SimpleButton(
                    radius: AppCard.bigRadius,
                    padding: AppCard.defPadding,
                    color: cardEnab_(context),
                    elevation: AppCard.bigElevation,
                    child: const TitleShortcutRowWidget(
                      icon: MdiIcons.plus,
                      title: 'Dodaj środowisko',
                    ),
                    onTap: () async {

                      String? communityKey = await selectCommunity(
                        context,
                        forbiddenCommunityKeys: communities.keys.toList(),
                        filterMode: FilterMode.manager
                      );
                      if(communityKey == null) return;
                      prov.add(communityKey);

                    }
                  )
              ),

            ],
          );
        });
  }

}

class BindedCommunityEditWidget extends StatefulWidget{

  final Community community;
  final String? initNote;
  final void Function(String)? onNoteChanged;
  final void Function()? onRemoveTap;

  const BindedCommunityEditWidget({required this.community, required this.initNote, this.onNoteChanged, this.onRemoveTap, super.key});

  @override
  State<StatefulWidget> createState() => BindedCommunityEditWidgetState();

}

class BindedCommunityEditWidgetState extends State<BindedCommunityEditWidget>{

  Community get community => widget.community;
  String? get initNote => widget.initNote;
  void Function(String)? get onNoteChanged => widget.onNoteChanged;
  void Function()? get onRemoveTap => widget.onRemoveTap;

  late TextEditingController noteController;

  @override
  void initState() {
    noteController = TextEditingController(text: initNote??'');
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BorderMaterial(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        CommunityHeaderWidget(
            community.iconKey,
            community.key,
            community.name,
            community.category,

            thumbnailHeroTag: false
        ),

        Padding(
          padding: const EdgeInsets.all(Dimen.defMarg),
          child: AppTextFieldHint(
            controller: noteController,
            hint: 'Jakieś uwagi:',
            hintTop: 'Uwagi',
            maxLines: null,
            onChanged: (_, text) => onNoteChanged?.call(text),
          ),
        ),

        SimpleButton.from(
            context: context,
            margin: EdgeInsets.zero,
            radius: 0,
            icon: MdiIcons.trashCanOutline,
            onTap: onRemoveTap
        )

      ],
    ),
  );

}