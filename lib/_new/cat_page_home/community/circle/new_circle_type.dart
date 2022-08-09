import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../_common_widgets/bottom_sheet.dart';
import '../../../api/circle.dart';
import '../../common.dart';
import 'circle_page.dart';
import 'model/circle.dart';

Future<NewCircleType?> pickNewCircleType(BuildContext context)async {

  NewCircleType? result;
  await showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        title: 'Nowy krąg',
        builder: (context) => CircleTypeWidget(
            onSelected: (circle){
              result = circle;
              Navigator.pop(context);
            }
        ),
      )
  );

  return result;

}

enum NewCircleType{
  empty,
  join
}

class CircleTypeWidget extends StatelessWidget{

  final void Function(NewCircleType type)? onSelected;

  const CircleTypeWidget({this.onSelected, super.key});

  @override
  Widget build(BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        _JoinButton(
          onSuccess: (comp) async {
            onSelected!(NewCircleType.join);
            Circle.addToAll(context, comp);
            pushReplacePage(context, builder: (context) => CirclePage(comp));
          },
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        CreateNewButton(
          icon: MdiIcons.applicationOutline,
          title: 'Utwórz nowy',
          description: 'Zawiąż nowy krąg.',
          onTap: () => onSelected!(NewCircleType.empty),
        ),

      ]
  );

}

class _JoinButton extends StatefulWidget{

  final void Function(Circle) onSuccess;

  const _JoinButton({required this.onSuccess});

  @override
  State<StatefulWidget> createState() => _JoinButtonState();

}

class _JoinButtonState extends State<_JoinButton>{

  TextEditingController? controller;

  late bool processing;

  @override
  void initState() {
    controller = TextEditingController();
    processing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CreateNewButton(
      icon: MdiIcons.applicationImport,
      title: 'Dołącz do istniejącego',
      description: 'Dołącz do kręgu zawiązanego przez inną osobę.',
      onTap: null,
      bottom: Row(
        children: [

          Expanded(
            child: AppTextFieldHint(
              hint: 'Kod dostępu:',
              hintStyle: AppTextStyle(color: hintEnab_(context)),
              accentColor: Colors.deepOrange,
              controller: controller,
            ),
          ),

          IconButton(
            icon:
            processing?
            SpinKitChasingDots(color: iconEnab_(context), size: Dimen.ICON_SIZE):
            const Icon(MdiIcons.arrowRight),

            onPressed: () async {
              setState(() => processing = true);
              await ApiCircle.joinByShareCode(
                  searchCode: controller!.text,
                  onSuccess: (circle, newCommunityAdded){
                    widget.onSuccess.call(circle);
                    if(newCommunityAdded)
                      CommunityProvider.of(context).notify();
                  },
                  onServerMaybeWakingUp: () {
                    if(mounted) showAppToast(context, text: serverWakingUpMessage);
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

}