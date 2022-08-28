import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
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
    icon: ShareCodeWidget.iconOn,
    title: 'Dołącz do istniejącego',
    description: 'Dołącz do współzawodnictwa utworzonego przez inną osobę.',
    onTap: null,
    bottom: Row(
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
          const Icon(MdiIcons.arrowRight),

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
                  widget.onSuccess.call(comp);
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
    ),
  );

}