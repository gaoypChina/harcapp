import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../_common_widgets/bottom_sheet.dart';
import '../../api/circle.dart';
import '../common.dart';
import 'circle/circle_page.dart';
import 'circle/model/circle.dart';
import 'forum/model/forum.dart';

Future<JoinOrCreateType?> pickJoinCreateType(BuildContext context)async {

  JoinOrCreateType? result;
  await showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetDef(
      title: 'Stwórz lub dołącz do środowiska',
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
                        icon: Community.icon,
                        title: 'Nowe środowisko',
                        description: 'Środowisko to wspólnota.'
                            '\n'
                            '\nZawiąż w nim <b>krąg - zamkniętą grupę</b>.'
                            '\nZałoż w nim <b>forum - publiczną stronę</b>, którą każdy może obserwować!',
                        onTap: (){
                          result = JoinOrCreateType.newCommunity;
                          Navigator.pop(context);
                        }
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    CreateNewButton(
                        icon: Forum.icon,
                        title: 'Przeglądaj fora',
                        description: 'Forum to publiczna strona środowiska.'
                            '\n'
                            '\nObczaj fora różnych środowisk i obserwuj najciekawsze z nich!',
                        onTap: (){
                          result = JoinOrCreateType.searchForum;
                          Navigator.pop(context);
                        }
                    ),

                  ],
                );

              },
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            _JoinCircleButton(
              onSuccess: (circle) async {
                result = JoinOrCreateType.joinCircle;
                Navigator.pop(context);
                Community.addToAllByCircle(circle, context: context);
                pushReplacePage(context, builder: (context) => CirclePage(circle));
              },
            ),

          ]
      )

    )
  );

  return result;

}

enum JoinOrCreateType{
  newCommunity,
  joinCircle,
  searchForum,
}


class _JoinCircleButton extends StatefulWidget{

  final void Function(Circle) onSuccess;

  const _JoinCircleButton({required this.onSuccess});

  @override
  State<StatefulWidget> createState() => _JoinCircleButtonState();

}

class _JoinCircleButtonState extends State<_JoinCircleButton>{

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
    icon: MdiIcons.googleCircles,
    title: 'Dołącz do kręgu',
    description: 'Krąg to zamknięta grupa.'
        '\n\nDołącz do istniejącego kręgu zawiązanego przez inną osobę.',
    onTap: null,
    bottom: Row(
      children: [

        Expanded(
          child: AppTextFieldHint(
            hint: 'Kod dostępu:',
            hintStyle: AppTextStyle(color: hintEnab_(context)),
            accentColor: Colors.deepOrange,
            controller: controller,
            focusNode: focusNode,
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
            await ApiCircle.joinByShareCode(
                searchCode: controller.text,
                onSuccess: (circle, newCommunityAdded){
                  widget.onSuccess.call(circle);
                  if(newCommunityAdded)
                    CommunityProvider.of(context).notify();
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