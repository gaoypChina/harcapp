import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_page.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../_common_widgets/bottom_sheet.dart';
import '../common.dart';
import 'indiv_comp/models/indiv_comp.dart';

Future<NewCompType?> pickCompType(BuildContext context)async {

  NewCompType? result;

  await showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        title: 'Nowe współzawodnictwo',
        builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              KeyboardVisibilityBuilder(
                builder: (context, keyboardVisible){
                  if(keyboardVisible)
                    return Container();

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      CreateNewButton(
                        icon: MdiIcons.applicationOutline,
                        title: 'Utwórz puste',
                        description: 'Zacznij od pustego szablonu.\n\nSkorzystaj, jeżeli wiesz jak działają współzawodnictwa.',
                        onTap: (){
                          result = NewCompType.empty;
                          Navigator.pop(context);
                        }
                      ),

                      const SizedBox(height: Dimen.SIDE_MARG),

                      CreateNewButton(
                        icon: MdiIcons.applicationEditOutline,
                        title: 'Utwórz przykładowe',
                        description: 'Wybierz w pełni uzupełny przykład.\n\nSkorzystaj, jeżeli pierwszy raz tworzysz współzawodnictwo.',
                          onTap: (){
                            result = NewCompType.example;
                            Navigator.pop(context);
                          }
                      ),

                      const SizedBox(height: Dimen.SIDE_MARG),

                    ],
                  );

                },
              ),

              _JoinButton(
                onSuccess: (comp) async {
                  result = NewCompType.join;
                  Navigator.pop(context);
                  IndivComp.addToAll(comp, context: context);
                  pushReplacePage(context, builder: (context) => IndivCompPage(comp));
                },
              ),

            ]
        ),
      )
  );

  return result;

}

enum NewCompType{
  empty,
  example,
  join
}

class _JoinButton extends StatefulWidget{

  final void Function(IndivComp) onSuccess;

  const _JoinButton({required this.onSuccess});

  @override
  State<StatefulWidget> createState() => _JoinButtonState();

}

class _JoinButtonState extends State<_JoinButton>{

  static IconData icon = ShareCodeDialog.iconOn;
  static String title = 'Dołącz do istniejącego';
  static String description = 'Dołącz do współzawodnictwa utworzonego przez inną osobę.';

  late TextEditingController controller;
  late FocusNode focusNode;
  late bool processing;

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => CreateNewButton(
    icon: icon,
    title: title,
    description: description,
    onTap: (){
      Navigator.pop(context);
      openDialog(
          context: context,
          builder: (context) => JoinDialog(
              onSuccess: widget.onSuccess
          )
      );
    },
    bottom: JoinTextField(onSuccess: widget.onSuccess)
  );

}

class JoinTextField extends StatefulWidget{

  final void Function(IndivComp)? onSuccess;

  const JoinTextField({this.onSuccess, super.key});

  @override
  State<StatefulWidget> createState() => JoinTextFieldState();

}

class JoinTextFieldState extends State<JoinTextField>{

  void Function(IndivComp)? get onSuccess => widget.onSuccess;

  late TextEditingController controller;
  late FocusNode focusNode;
  late bool processing;

  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row(
    children: [

      Expanded(
        child: AppTextFieldHint(
            hint: 'Kod dostępu:',
            hintStyle: AppTextStyle(color: hintEnab_(context)),
            accentColor: Colors.deepOrange,
            controller: controller,
            focusNode: focusNode
        ),
      ),

      IconButton(
        icon:
        processing?
        SpinKitChasingDots(color: iconEnab_(context), size: Dimen.ICON_SIZE):
        Icon(MdiIcons.arrowRight),

        onPressed: () async {
          if(controller.text.isEmpty){
            focusNode.requestFocus();
            showAppToast(context, text: 'Podaj kod dostępu');
            return;
          }

          setState(() => processing = true);
          await ApiIndivComp.joinByShareCode(
              searchCode: controller.text,
              onSuccess: (comp){
                if(!mounted) return;
                onSuccess?.call(comp);
              },
              onServerMaybeWakingUp: () {
                if(mounted) showServerWakingUpToast(context);
                return true;
              },
              onError: (){
                if(mounted) showAppToast(context, text: 'Błędny kod dostępu');
              }
          );
          if(mounted) setState(() => processing = false);
        },
      ),

    ],
  );

}

class JoinDialog extends StatelessWidget{

  final void Function(IndivComp)? onSuccess;

  const JoinDialog({this.onSuccess, super.key});

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG).add(MediaQuery.of(context).viewInsets),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Row(
                children: [
                  Icon(_JoinButtonState.icon),
                  const SizedBox(width: Dimen.SIDE_MARG),
                  Text(
                    _JoinButtonState.title,
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: AppText(
                  _JoinButtonState.description,
                  size: Dimen.TEXT_SIZE_BIG,
                ),
              ),

              JoinTextField(onSuccess: onSuccess)
            ],
          ),
        ),
      ),
    ),
  );

}