import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../_common_widgets/bottom_sheet.dart';
import '../../api/circle.dart';
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

  const CircleTypeWidget({this.onSelected, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        _Button(
          icon: MdiIcons.applicationOutline,
          title: 'Utwórz puste',
          description: 'Zacznij od pustego szablonu.\n\nSkorzystaj, jeżeli wiesz jak działają współzawodnictwa.',
          onTap: () => onSelected!(NewCircleType.empty),
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        _JoinButton(
          onSuccess: (comp) async {
            onSelected!(NewCircleType.join);
            Circle.addToAll(context, comp);
            pushReplacePage(context, builder: (context) => CirclePage(comp));
          },
        ),

      ]
  );

}

class _Button extends StatelessWidget{

  final IconData icon;
  final String title;
  final String description;
  final Widget? bottom;
  final void Function()? onTap;

  const _Button({required this.icon, required this.title, required this.description, this.bottom, this.onTap});

  @override
  Widget build(BuildContext context) => SimpleButton(
      padding: EdgeInsets.zero,
      radius: AppCard.BIG_RADIUS,
      color: background_(context),
      child: Padding(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [

            Text(
              title,
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_APPBAR,
                fontWeight: weight.bold,
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                  description,
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_BIG,
                  )),
            ),

            if(bottom != null)
              bottom!,

          ],
        ),
      ),
      onTap: onTap
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
    return _Button(
      icon: MdiIcons.applicationImport,
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
                  onSuccess: (circle){
                    if(!mounted) return;
                    widget.onSuccess.call(circle);
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