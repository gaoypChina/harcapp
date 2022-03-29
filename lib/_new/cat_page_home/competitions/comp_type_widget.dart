import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_page.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../_common_widgets/bottom_sheet.dart';
import 'indiv_comp/models/indiv_comp.dart';

Future<NewCompType> pickCompType(BuildContext context)async {

  NewCompType result;
  await showScrollBottomSheet(
      context: context,
      builder: (context) => CompTypeWidget(
          onSelected: (indiv){
            result = indiv;
            Navigator.pop(context);
          }
      )
  );

  return result;

}

enum NewCompType{
  empty,
  example,
  join
}

class CompTypeWidget extends StatelessWidget{

  final void Function(NewCompType type) onSelected;

  const CompTypeWidget({this.onSelected, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(Dimen.DEF_MARG),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              _Button(
                icon: MdiIcons.applicationOutline,
                backgroundIcon: MdiIcons.sproutOutline,
                title: 'Utwórz puste',
                colorStart: Colors.grey[AppSettings.isDark?700:300],
                colorEnd: Colors.grey[AppSettings.isDark?900:600],
                textColor: Colors.blueGrey,
                description: 'Zacznij od pustego szablonu.\n\nSkorzystaj, jeżeli wiesz jak działają współzawodnictwa.',
                onTap: () => onSelected(NewCompType.empty),
              ),

              const SizedBox(height: Dimen.DEF_MARG),

              _Button(
                icon: MdiIcons.applicationEditOutline,
                backgroundIcon: MdiIcons.fruitPineapple,
                title: 'Utwórz przykładowe',
                colorStart: Colors.lightBlue[AppSettings.isDark?800:500],
                colorEnd: Colors.blue[AppSettings.isDark?900:500],
                textColor: Colors.indigo[AppSettings.isDark?300:500],
                description: 'Wybierz w pełni uzupełny przykład.\n\nSkorzystaj, jeżeli pierwszy raz tworzysz współzawodnictwo.',
                onTap: () => onSelected(NewCompType.example),
              ),

              const SizedBox(height: Dimen.DEF_MARG),

              _JoinButton(
                onSuccess: (comp) async {
                  onSelected(NewCompType.join);
                  IndivComp.addToAll(context, comp);
                  pushReplacePage(context, builder: (context) => IndivCompPage(comp));
                },
              ),

            ]
        ),
      )
    );

  }

}

class _Button extends StatelessWidget{

  final IconData icon;
  final IconData backgroundIcon;
  final String title;
  final String description;
  final Widget bottom;
  final Color colorStart;
  final Color colorEnd;
  final Color textColor;
  final void Function() onTap;

  const _Button({@required this.icon, @required this.backgroundIcon, @required this.title, @required this.description, this.bottom, @required this.colorStart, @required this.colorEnd, @required this.textColor, this.onTap});

  @override
  Widget build(BuildContext context) => GradientWidget(
    radius: 22,
    colorStart: colorStart,
    colorEnd: colorEnd,
    child: SimpleButton(
        padding: EdgeInsets.zero,
        margin: const EdgeInsets.all(Dimen.DEF_MARG),
        radius: AppCard.BIG_RADIUS,
        color: background_(context),
        child: Stack(
            children: [

              Positioned(
                bottom: -.1*MediaQuery.of(context).size.shortestSide,
                right: -.1*MediaQuery.of(context).size.shortestSide,
                child: Icon(
                  backgroundIcon,
                  color: backgroundIcon_(context),
                  size: MediaQuery.of(context).size.shortestSide/2,
                ),
              ),

              Positioned.fill(
                child: GradientWidget(
                  colorStart: colorEnd.withOpacity(.2),
                  colorEnd: colorStart.withOpacity(.2),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Row(
                      children: [

                        GradientIcon(
                          icon,
                          size: 58.0,
                          colorStart: colorStart, // backgroundIcon_(context),
                          colorEnd: colorEnd, //hintEnab_(context),
                        ),

                        const SizedBox(width: Dimen.SIDE_MARG),

                        Expanded(child: Text(
                          title,
                          style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_APPBAR,
                            fontWeight: weight.bold,
                          ),
                        )),

                      ],
                    ),

                    const SizedBox(height: Dimen.SIDE_MARG),

                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                          description,
                          style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_NORMAL,
                            color: textColor,
                          )),
                    ),

                    if(bottom != null)
                      bottom,

                  ],
                ),
              ),
              
            ]
        ),
        onTap: onTap
    ),
  );

}

class _JoinButton extends StatefulWidget{

  final void Function(IndivComp) onSuccess;

  const _JoinButton({@required this.onSuccess});

  @override
  State<StatefulWidget> createState() => _JoinButtonState();

}

class _JoinButtonState extends State<_JoinButton>{

  TextEditingController controller;

  bool processing;

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
      backgroundIcon: MdiIcons.palmTree,
      title: 'Dołącz do istniejącego',
      colorStart: Colors.yellow[AppSettings.isDark?800:500],
      colorEnd: Colors.orange[AppSettings.isDark?900:500],
      textColor: Colors.orange[AppSettings.isDark?300:700],
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
              await ApiIndivComp.joinByShareCode(
                  searchCode: controller.text,
                  onSuccess: (comp){
                    if(!mounted) return;
                    widget.onSuccess.call(comp);
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