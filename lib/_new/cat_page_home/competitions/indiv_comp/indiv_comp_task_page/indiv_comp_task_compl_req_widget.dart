import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task_compl.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import '../indiv_comp_task_widget.dart';

class IndivTaskComplReqWidget extends StatefulWidget{

  final List<IndivCompTask> allTasks;
  final IndivCompTask task;
  final bool adminOrMod;
  final void Function(List<IndivCompTaskCompl>, Map<String, Tuple3<int, int, Tuple2<double, double>>>) onSuccess;

  const IndivTaskComplReqWidget(
      this.allTasks,
      this.task,
      {
        @required this.adminOrMod,
        this.onSuccess
      });

  @override
  State<StatefulWidget> createState() => IndivTaskComplReqWidgetState();

}

class IndivTaskComplReqWidgetState extends State<IndivTaskComplReqWidget>{

  List<IndivCompTask> get allTasks => widget.allTasks;
  IndivCompTask get task => widget.task;
  bool get adminOrMod => widget.adminOrMod;

  TextEditingController controller;
  bool sending;

  @override
  void initState() {
    controller = TextEditingController();
    sending = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return KeyboardAvoider(
      child: AppCard(
          color: background_(context),
          radius: AppCard.BIG_RADIUS,
          margin: EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [

              TitleShortcutRowWidget(
                leading: IconButton(
                  icon: Icon(MdiIcons.arrowLeft),
                  onPressed: () => Navigator.pop(context),
                ),
                trailing: SizedBox(width: Dimen.ICON_FOOTPRINT),
                title: adminOrMod?'Zalicz sobie zadanie':'Prześlij prośbę o zaliczenie',
              ),

              SizedBox(height: Dimen.DEF_MARG),

              IndivCompTaskWidget(task),

              Padding(
                padding: EdgeInsets.all(Dimen.SIDE_MARG),
                child: AppTextFieldHint(
                  hint: 'Wiadomość do admina',
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  hintTop: 'Wiadomość',
                  controller: controller,
                  maxLines: null,
                  maxLength: IndivCompTaskCompl.MAX_LEN_REQ_COMMENT,
                ),
              ),

              SimpleButton.from(
                  textColor: sending?iconDisab_(context):iconEnab_(context),
                  iconLeading: false,
                  margin: EdgeInsets.zero,
                  icon: adminOrMod?MdiIcons.check:MdiIcons.cubeSend,
                  text: adminOrMod?'Zalicz':'Prześlij',
                  onTap: sending?null:() async {

                    if(!await isNetworkAvailable()) {
                      showAppToast(context, text: 'Brak internetu.');
                      return;
                    }

                    setState(() => sending = true);
                    showAppToast(context, text: 'Przesyłanie...');
                    await ApiIndivComp.sendTaskComplReq(
                        allTasks: allTasks,
                        taskKey: task.key,
                        comment: controller.text,
                        onSuccess: (List<IndivCompTaskCompl> taskComplRespMap, Map<String, Tuple3<int, int, Tuple2<double, double>>> idRank){
                          if(mounted) showAppToast(context, text: adminOrMod?'Zaliczono':'Przesłano. Wniosek oczekuje na rozpatrzenie.');
                          if(mounted) Navigator.pop(context);
                          widget.onSuccess?.call(taskComplRespMap, idRank);
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