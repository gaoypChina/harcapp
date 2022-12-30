import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
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
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../indiv_comp_task_widget.dart';

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

  @override
  void initState() {
    controller = TextEditingController();
    sending = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: AppCard(
          color: background_(context),
          radius: AppCard.bigRadius,
          margin: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [

              TitleShortcutRowWidget(
                leading: IconButton(
                  icon: const Icon(MdiIcons.arrowLeft),
                  onPressed: () => Navigator.pop(context),
                ),
                trailing: const SizedBox(width: Dimen.ICON_FOOTPRINT),
                title: adminOrMod?'Zalicz zadanie':'Wniosek o zaliczenie',
              ),

              const SizedBox(height: Dimen.defMarg),

              IndivCompTaskWidget(task),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: AppTextFieldHint(
                  hint: 'Wiadomość do admina',
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  hintTop: 'Wiadomość',
                  controller: controller,
                  maxLines: null,
                  maxLength: IndivCompCompletedTask.MAX_LEN_REQ_COMMENT,
                ),
              ),

              SimpleButton.from(
                  textColor: sending?iconDisab_(context):iconEnab_(context),
                  iconLeading: false,
                  margin: EdgeInsets.zero,
                  icon: adminOrMod?MdiIcons.check:MdiIcons.cubeSend,
                  text: adminOrMod?'Zalicz sobie':'Prześlij',
                  onTap: sending?null:() async {

                    if(!await isNetworkAvailable()) {
                      showAppToast(context, text: 'Brak internetu.');
                      return;
                    }

                    setState(() => sending = true);
                    showAppToast(context, text: 'Przesyłanie...');
                    await ApiIndivComp.createCompletedTask(
                        comp: comp,
                        taskKey: task.key,
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

            ],
          )
      ),
    );

  }

}