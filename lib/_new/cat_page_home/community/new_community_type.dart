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

import '../../../_common_widgets/bottom_sheet.dart';
import '../../api/circle.dart';
import '../common.dart';
import 'circle/circle_page.dart';
import 'circle/model/circle.dart';

Future<NewCommunityType?> pickNewCommunityType(BuildContext context)async {

  NewCommunityType? result;
  await showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetDef(
      title: 'Nowe środowisko',
      builder: (context) => CircleTypeWidget(
        onSelected: (value){
          result = value;
          Navigator.pop(context);
        }
      ),
    )
  );

  return result;

}

enum NewCommunityType{
  empty,
  joinCircle
}

class CircleTypeWidget extends StatelessWidget{

  final void Function(NewCommunityType type)? onSelected;

  const CircleTypeWidget({this.onSelected, super.key});

  @override
  Widget build(BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        _JoinCircleButton(
          onSuccess: (circle) async {
            onSelected!(NewCommunityType.joinCircle);
            Circle.addToAll(context, circle);
            pushReplacePage(context, builder: (context) => CirclePage(circle));
          },
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        CreateNewButton(
          icon: MdiIcons.accountGroup,
          title: 'Nowe środowisko',
          description: 'Zawiąż nowe środowisko.',
          onTap: () => onSelected!(NewCommunityType.empty),
        ),

      ]
  );

}

class _JoinCircleButton extends StatefulWidget{

  final void Function(Circle) onSuccess;

  const _JoinCircleButton({required this.onSuccess});

  @override
  State<StatefulWidget> createState() => _JoinCircleButtonState();

}

class _JoinCircleButtonState extends State<_JoinCircleButton>{

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
      icon: MdiIcons.googleCircles,
      title: 'Dołącz do kręgu',
      description: 'Dołącz do istniejącego kręgu zawiązanego przez inną osobę.',
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

}