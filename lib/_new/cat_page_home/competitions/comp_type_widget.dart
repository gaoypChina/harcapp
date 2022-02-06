import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_page.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'indiv_comp/models/indiv_comp.dart';

Future<NewCompType> pickCompType(BuildContext context)async {

  NewCompType result;
  await openDialog(context: context, builder: (context) => CompTypeWidget(
    onSelected: (indiv){
      result = indiv;
      Navigator.pop(context);
    }
  ));

  return result;

}

enum NewCompType{
  empty,
  example,
  join
}

class CompTypeWidget extends StatelessWidget{

  final void Function(NewCompType type) onSelected;

  const CompTypeWidget({this.onSelected});

  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController();
    
    return Dialog(
      insetPadding: EdgeInsets.all(Dimen.SIDE_MARG),
      backgroundColor: background_(context),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS)),
      child: CustomScrollView(
        shrinkWrap: true,
        reverse: true,
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text('Nowe współzawodnictwo'),
            centerTitle: true,
            floating: true,
          ),

          SliverList(delegate: SliverChildListDelegate([

            _Button(
              icon: MdiIcons.applicationOutline,
              title: 'Utwórz puste',
              colorStart: backgroundIcon_(context),
              colorEnd: hintEnab_(context),
              description: 'Utwórz współzawodnictwo zaczynając od pustego szablonu.\n\nSkorzystaj, jeżeli wiesz jak działają współzawodnictwa HarcApp.',
              onTap: () => onSelected(NewCompType.empty),
            ),

            _Button(
              icon: MdiIcons.applicationEditOutline,
              title: 'Utwórz przykładowe',
              colorStart: Colors.lightBlueAccent,
              colorEnd: Colors.blueAccent,
              description: 'Utwórz współzawodnictwo zaczynając od w pełni uzupełnionego przykładu.\n\nSkorzystaj, jeżeli pierwszy raz tworzysz współzawodnictwo HarcApp.',
              onTap: () => onSelected(NewCompType.example),
            ),

            _Button(
                icon: MdiIcons.applicationImport,
                title: 'Dołącz do istniejącego',
                colorStart: Colors.yellow,
                colorEnd: Colors.orange,
                description: 'Dołącz do współzawodnictwa HarcApp utworzonego przez inną osobę.',
                onTap: () => onSelected(NewCompType.join),
                bottom: Padding(
                  padding: EdgeInsets.only(top: Dimen.DEF_MARG),
                  child: Row(
                    children: [

                      Expanded(
                        child: AppTextFieldHint(
                          hint: 'Kod dostępu:',
                          hintStyle: AppTextStyle(color: hintEnab_(context)),
                          accentColor: Colors.orange,
                          controller: controller,
                          showUnderline: true,
                        ),
                      ),

                      IconButton(
                        icon: Icon(MdiIcons.arrowRight),
                        onPressed: (){
                          ApiIndivComp.joinByShareCode(
                              searchCode: controller.text,
                              onSuccess: (IndivComp comp) async {
                                IndivComp.addToAll(context, comp);
                                pushReplacePage(context, builder: (context) => IndivCompPage(comp));
                              },
                              onError: (){
                                showAppToast(context, text: 'Błędny kod dostępu');
                              }
                          );
                        },
                      )

                    ],
                  ),
                )
            ),

          ].reversed.toList()))

        ].reversed.toList(),
      ),
    );
  }

}

class _Button extends StatelessWidget{

  final IconData icon;
  final String title;
  final String description;
  final Widget bottom;
  final Color colorStart;
  final Color colorEnd;
  final void Function() onTap;

  const _Button({@required this.icon, @required this.title, @required this.description, this.bottom, @required this.colorStart, @required this.colorEnd, this.onTap});

  @override
  Widget build(BuildContext context) => SimpleButton(
      padding: EdgeInsets.all(Dimen.SIDE_MARG),
      radius: AppCard.BIG_RADIUS,
      color: backgroundIcon_(context),
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

              SizedBox(width: Dimen.SIDE_MARG),

              Expanded(child: Text(
                  title,
                  style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                    fontWeight: weight.bold,
                  ),
              )),

            ],
          ),

          SizedBox(height: Dimen.SIDE_MARG),

          Padding(
            padding: EdgeInsets.only(left: 2),
            child: Text(description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context))),
          ),

          if(bottom != null)
            bottom,

        ],
      ),
      onTap: onTap
  );

}