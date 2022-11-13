import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_home/community/common_widgets/community_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/community_role.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import 'model/community.dart';

enum FilterMode{
  adminOnly,
  manager,
  all
}

Future<String?> selectCommunity(BuildContext context, {List<String> forbiddenCommunityKeys = const [], FilterMode filterMode = FilterMode.all}) async {

  String? selectedKey;

  await openDialog(
    context: context,
    builder: (context) => CommunitySelectDialog(
      filterMode: filterMode,
      forbiddenCommunityKeys: forbiddenCommunityKeys,
      onSelected: (community){
        selectedKey = community;
        Navigator.pop(context);
      },
    )
  );

  return selectedKey;
}

class CommunitySelectDialog extends StatefulWidget{

  final FilterMode filterMode;
  final List<String> forbiddenCommunityKeys;
  final void Function(String)? onSelected;

  const CommunitySelectDialog({this.filterMode = FilterMode.all, this.forbiddenCommunityKeys = const [], this.onSelected, super.key});

  @override
  State<StatefulWidget> createState() => CommunitySelectDialogState();

}

class CommunitySelectDialogState extends State<CommunitySelectDialog>{

  FilterMode get filterMode => widget.filterMode;
  List<String> get forbiddenCommunityKeys => widget.forbiddenCommunityKeys;
  void Function(String)? get onSelected => widget.onSelected;

  String? selectedKey;

  late List<Tuple2<Community, bool>> communities;

  @override
  void initState() {

    communities = [];
    for(Community community in Community.all!) {

      if(forbiddenCommunityKeys.contains(community.key))
        continue;

      bool enabled;

      switch(filterMode){
        case FilterMode.adminOnly: enabled = community.myRole == CommunityRole.ADMIN; break;
        case FilterMode.manager: enabled = community.myRole != null; break;
        case FilterMode.all: enabled = true; break;
      }

      communities.add(Tuple2(community, enabled));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Expanded(
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SimpleButton(
                    borderRadius: BorderRadius.zero,
                    color: selectedKey == communities[index].item1.key?
                    backgroundIcon_(context):
                    null,

                    onTap:
                    communities[index].item2?
                    () => setState(() => selectedKey = communities[index].item1.key):
                    null,
                    child: CommunityHeaderWidget(
                      communities[index].item1.iconKey,
                      communities[index].item1.key,
                      communities[index].item1.name,
                      communities[index].item1.category,

                      thumbnailColor: communities[index].item2?
                      iconEnab_(context):
                      iconDisab_(context),

                      nameColor: communities[index].item2?
                      iconEnab_(context):
                      iconDisab_(context),

                      tagOpacity:  communities[index].item2?
                      1.0:
                      .5,

                      thumbnailHeroTag: false,
                    ),
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: 0),
                  itemCount: communities.length
              ),
            ),

            Row(
              children: [

                Expanded(
                  child: SimpleButton.from(
                      context: context,
                      margin: EdgeInsets.zero,
                      icon: MdiIcons.arrowLeft,
                      text: 'Wróć',
                      onTap: () => Navigator.pop(context)
                  ),
                ),

                Expanded(
                  child: SimpleButton.from(
                      margin: EdgeInsets.zero,
                      textColor: selectedKey==null?iconDisab_(context):iconEnab_(context),
                      icon: MdiIcons.check,
                      iconLeading: false,
                      text: 'Wybierz',
                      onTap: selectedKey == null?null:() => onSelected?.call(selectedKey!)
                  ),
                )

              ],
            )

          ],
        ),
      ),
    ),
  );

}