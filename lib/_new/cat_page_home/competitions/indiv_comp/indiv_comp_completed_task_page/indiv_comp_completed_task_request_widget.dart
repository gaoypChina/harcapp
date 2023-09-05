import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/loadable_particip_selector.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp/account/account_tile.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/show_rank_data.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../indiv_comp_task_widget.dart';
import '../models/indiv_comp_particip.dart';

class IndivCompCompetedTaskRequestWidget extends StatefulWidget{

  final IndivComp comp;
  final IndivCompTask task;
  final bool adminOrMod;
  final void Function(List<IndivCompCompletedTask>, Map<String, ShowRankData>)? onSuccess;

  const IndivCompCompetedTaskRequestWidget(
      this.comp,
      this.task,
      { required this.adminOrMod,
        this.onSuccess,
        super.key
      });

  @override
  State<StatefulWidget> createState() => IndivCompCompetedTaskRequestWidgetState();

}

class IndivCompCompetedTaskRequestWidgetState extends State<IndivCompCompetedTaskRequestWidget>{

  IndivComp get comp => widget.comp;
  IndivCompTask get task => widget.task;
  bool get adminOrMod => widget.adminOrMod;

  late TextEditingController controller;
  late bool sending;
  IndivCompParticip? particip;

  void onParticipTileTap() async {
    IndivCompParticip? selected = await selectParticip(
      context: context,
      comp: comp,
    );
    setState(() => particip = selected);
  }

  @override
  void initState() {
    controller = TextEditingController();
    sending = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Dimen.defMarg).add(MediaQuery.of(context).viewInsets),
    child: Material(
        color: background_(context),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        clipBehavior: Clip.hardEdge,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          slivers: [

            SliverAppBar(
              title: Text(adminOrMod?'Zalicz zadanie':'Wniosek o zaliczenie'),
              centerTitle: true,
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.defMarg),
              sliver: SliverList(
                delegate: SliverChildListDelegate([

                  const SizedBox(height: Dimen.defMarg),

                  if(adminOrMod)
                    BorderMaterial(
                        elevation: particip == null?
                        AppCard.bigElevation:
                        0,

                        child:
                        particip == null?
                        NoParticipSelectedWidget(
                          comp: comp,
                          onTap: onParticipTileTap,
                        ):
                        ParticipTile(
                          particip: particip!,
                          onTap: onParticipTileTap,
                          thumbnailTapable: false,
                        )
                    ),

                  if(adminOrMod)
                    const SizedBox(height: Dimen.defMarg),

                  IndivCompTaskWidget(task),

                  Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: AppTextFieldHint(
                      hint: adminOrMod?'Wiadomość':'Wiadomość do admina',
                      hintStyle: AppTextStyle(color: hintEnab_(context)),
                      hintTop: 'Wiadomość',
                      controller: controller,
                      maxLines: null,
                      maxLength: IndivCompCompletedTask.MAX_LEN_REQ_COMMENT,
                    ),
                  ),

                ]),
              ),
            ),

            SliverList(
                delegate: SliverChildListDelegate([

                  SimpleButton.from(
                      textColor: sending || (adminOrMod && particip == null)?iconDisab_(context):iconEnab_(context),
                      iconLeading: false,
                      margin: EdgeInsets.zero,
                      radius: 0,

                      icon: (adminOrMod && particip == null)?MdiIcons.accountAlertOutline:
                      (adminOrMod && particip != null)?MdiIcons.check:
                      MdiIcons.cubeSend,

                      text:
                      (adminOrMod && particip == null)?'Wybierz uczestnika':
                      (adminOrMod && particip != null)?'Zalicz zadanie':
                      'Prześlij ',

                      onTap: sending || (adminOrMod && particip == null)?null:() async {

                        if(!await isNetworkAvailable()) {
                          showAppToast(context, text: 'Brak internetu.');
                          return;
                        }

                        setState(() => sending = true);
                        showAppToast(context, text: 'Przesyłanie...');
                        await ApiIndivComp.createCompletedTask(
                            comp: comp,
                            taskKey: task.key,
                            userKeys: particip == null?null:[particip!.key],
                            comment: controller.text,
                            onSuccess: (List<IndivCompCompletedTask> taskComplRespMap, Map<String, ShowRankData> idRank){
                              if(mounted) showAppToast(context, text: adminOrMod?'Zaliczono':'Przesłano. Wniosek oczekuje na rozpatrzenie.');
                              if(mounted) Navigator.pop(context);
                              widget.onSuccess?.call(taskComplRespMap, idRank);
                            },
                            onServerMaybeWakingUp: () {
                              if(mounted) showServerWakingUpToast(context);
                              return true;
                            },
                            onError: (){
                              if(mounted) showAppToast(context, text: simpleErrorMessage);
                            }
                        );
                        if(!mounted) return;
                        setState(() => sending = false);

                      }
                  )

                ])
            )

          ],
        )
    ),
  );

}

class NoParticipSelectedWidget extends StatelessWidget{

  final IndivComp comp;
  final FutureOr<void> Function()? onTap;

  const NoParticipSelectedWidget({
    required this.comp,
    this.onTap,
    super.key
  });

  @override
  Widget build(BuildContext context) => AccountTile(
      'Wybierz uczestnika',
      textColor: textEnab_(context),
      showThumbnail: false,
      contentPadding: const EdgeInsets.only(
        top: Dimen.ICON_MARG/2,
        bottom: Dimen.ICON_MARG/2,
        right: Dimen.ICON_MARG/2,
        left: Dimen.ICON_MARG,
      ),
      trailing: AccountThumbnailWidget(
        icon: MdiIcons.accountAlertOutline,
        verified: false,
        elevated: false,
        tapable: false,
      ),
      onTap: onTap
  );


  //     ListTile(
  //   leading: AccountThumbnailWidget(
  //     icon: MdiIcons.accountOutline,
  //     verified: false,
  //     elevated: false,
  //   ),
  //   // leading: Icon(MdiIcons.accountOutline, color: textEnab_(context)),
  //   title: Text('Wybierz uczestnika', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
  // );

}