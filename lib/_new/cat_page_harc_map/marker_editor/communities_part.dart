import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_data.dart';
import 'package:harcapp/_new/cat_page_harc_map/marker_editor/providers.dart';
import 'package:harcapp/_new/cat_page_harc_map/model/marker_type.dart';
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
        builder: (context, bindCommProv, child){
          Map<String, String> communities = bindCommProv.communities;
          return Stack(
            children: [

              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [

                  // SliverOverlapInjector does not work with SliverAppBar(pinned = true);
                  // SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

                  if(communities.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Consumer<MarkerTypeProvider>(
                          builder: (context, typeProv, child) => EmptyMessageWidget(
                            icon: Community.icon,
                            text: isMarkerTypeZbiorkable(typeProv.markerType)?
                            'To miejsce świeci pustkami...\n\nDodaj gromady i drużyny,\nktóre mają tu zbiórki!':
                            'Nikt się tu na razie nie kręci...',
                          ),
                        )
                      ),
                    ),
                  SliverPadding(
                      padding: const EdgeInsets.only(
                        top: Dimen.SIDE_MARG,
                        right: Dimen.SIDE_MARG,
                        left: Dimen.SIDE_MARG,
                        bottom: Dimen.SIDE_MARG + Dimen.ICON_FOOTPRINT + 2*AppCard.defPaddingVal + Dimen.defMarg
                      ),
                      sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                        (context, index){
                          String commKey = communities.keys.toList()[index];
                          Community community = Community.allMap![commKey]!;
                          return BindedCommunityEditWidget(
                            community: community,
                            initNote: communities[commKey],
                            onNoteChanged: (note) => bindCommProv.edit(commKey, note),
                            onRemoveTap: () => bindCommProv.remove(commKey),
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
                  child: Consumer<MarkerTypeProvider>(
                    builder: (context, prov, child) => SimpleButton(
                        radius: AppCard.bigRadius,
                        padding: AppCard.defPadding,
                        color: getMarkerTypeColorEnd(prov.markerType),
                        elevation: AppCard.bigElevation,
                        child: TitleShortcutRowWidget(
                          icon: MdiIcons.plus,
                          title: 'Dodaj środowisko',
                          titleColor: iconEnab_(context),
                        ),
                        onTap: () async {

                          String? communityKey = await selectCommunity(
                              context,
                              forbiddenCommunityKeys: communities.keys.toList(),
                              filterMode: FilterMode.manager,
                              backgroundColor: getMarkerTypeColor(prov.markerType)
                          );
                          if(communityKey == null) return;
                          bindCommProv.add(communityKey);

                        }
                    ),
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
  Widget build(BuildContext context) => Consumer<MarkerTypeProvider>(
    builder: (context, prov, child) => BorderMaterial(
      borderColor: getMarkerTypeColorEnd(prov.markerType),
      color: getMarkerTypeColor(prov.markerType),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          CommunityHeaderWidget(
              community.iconKey,
              community.key,
              community.name,
              community.category,

              thumbnailBackgroundColor: Colors.transparent,
              thumbnailBorderColor: Colors.transparent,

              thumbnailHeroTag: false
          ),

          Padding(
            padding: const EdgeInsets.all(Dimen.defMarg),
            child: AppTextFieldHint(
              controller: noteController,
              hint: isMarkerTypeZbiorkable(prov.markerType)?
              'Czas zbiórek, inne uwagi:':
              'Jakieś uwagi:',
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
    ),
  );

}