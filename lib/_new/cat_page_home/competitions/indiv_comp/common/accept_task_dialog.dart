import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_task_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_task.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/account/account_thumbnail_row_widget.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../_common_widgets/loading_widget.dart';

class AcceptTaskWidget extends StatefulWidget{

  final IndivComp comp;
  final List<IndivCompParticip> selectedParticips;

  final FutureOr<void> Function()? onSuccess;
  final FutureOr<void> Function()? onError;

  const AcceptTaskWidget(this.comp, this.selectedParticips, {this.onSuccess, this.onError, super.key});

  @override
  State<StatefulWidget> createState() => AcceptTaskWidgetState();

}

class AcceptTaskWidgetState extends State<AcceptTaskWidget>{

  IndivComp get comp => widget.comp;
  List<IndivCompParticip> get selectedParticips => widget.selectedParticips;

  FutureOr<void> Function()? get onSuccess => widget.onSuccess;

  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for(int i=0; i<comp.tasks.length; i++) {
      IndivCompTask task = comp.tasks[i];
      children.add(
          IndivCompTaskWidget(
            task,
            bottom: SimpleButton.from(
                context: context,
                color: cardEnab_(context),
                icon: MdiIcons.check,
                text: 'Zalicz',
                margin: EdgeInsets.zero,
                radius: 0,
                onTap: () async {

                  showLoadingWidget(context, 'Przesyłanie punktów...', color: comp.colors.avgColor);

                  await ApiIndivComp.createCompletedTask(
                      comp: comp,
                      taskKey: task.key,
                      comment: controller.text,
                      userKeys: selectedParticips.map((particips) => particips.key).toList(),
                      onSuccess: () async {
                        if(mounted) showAppToast(context, text: 'Zaliczono');
                        await onSuccess?.call();
                      },
                      onServerMaybeWakingUp: () {
                        if(mounted) showServerWakingUpToast(context);
                        return true;
                      },
                      onError: (){
                        if(mounted) showAppToast(context, text: simpleErrorMessage);
                        widget.onError?.call();
                      }
                  );

                  Navigator.pop(context);

                }
            )
          )
      );
      if(i<widget.comp.tasks.length-1)
        children.add(const SizedBox(height: Dimen.defMarg));
    }

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          const SliverAppBar(
            title: Text('Zalicz zadanie'),
            centerTitle: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildListDelegate([

              if(selectedParticips.length==1)
                ParticipHeaderWidget.fromParticip(selectedParticips[0])
              else
                Consumer<IndivCompParticipsProvider>(
                    builder: (context, prov, child) => AccountThumbnailRowWidget(selectedParticips.map((particip) => particip.name).toList())
                ),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: AppTextFieldHint(
                  hint: 'Wiadomość:',
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  hintTop: 'Wiadomość',
                  controller: controller,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              )

            ])),
          )
        ],
      ),
    );
  }

}

void openAcceptTaskDialog(
    BuildContext context,
    IndivComp comp,
    List<IndivCompParticip> particips,
    { void Function()? onPointsGranted
    }) async => await openDialog(
    context: context,
    builder: (context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Material(
          clipBehavior: Clip.hardEdge,
          color: background_(context),
          borderRadius: BorderRadius.circular(AppCard.bigRadius),
          child: AcceptTaskWidget(
            comp,
            particips,
            onSuccess: (){
              onPointsGranted?.call();
              Navigator.pop(context);
            },
          ),
        ),
      ),
    )
);