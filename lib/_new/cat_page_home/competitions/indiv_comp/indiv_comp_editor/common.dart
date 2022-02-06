import 'package:flutter/cupertino.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../loading_widget.dart';
import '../comp_role.dart';
import '../indiv_comp_loader.dart';

class LeaveButton extends StatelessWidget{

  final IndivComp comp;

  const LeaveButton(this.comp);

  @override
  Widget build(BuildContext context) {

    return SimpleButton(
        radius: AppCard.BIG_RADIUS,
        padding: EdgeInsets.all(Dimen.SIDE_MARG),
        color: backgroundIcon_(context),
        onTap: () {

          int allAdminCount = 0;
          for(IndivCompParticip particip in comp.particips) if(particip.profile.role == CompRole.ADMIN) allAdminCount++;

          if(allAdminCount == 1 && comp.profile.role == CompRole.ADMIN){
            showAlertDialog(
                context,
                title: 'Hola, hola...',
                content: 'Jesteś ostatnim administratorem współzawodnictwa i zamierzasz je opuścić!\n\nTak nie wolno.',
                actionBuilder: (context) => [
                  AlertDialogButton(
                      text: 'No dobrze',
                      onTap: () => Navigator.pop(context)
                  )
                ]
            );
            return;
          }else
            showAlertDialog(
                context,
                title: 'Zastanów się dobrze...',
                content: 'Jesteś na ostatniej prostej, by <b>opuścić</b> współzawodnictwo. Twoje osiągnięcia zostaną utracone.\n\nNa pewno chcesz kontynuować?',
                actionBuilder: (_) => [

                  AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),

                  AlertDialogButton(
                      text: 'Tak',
                      onTap: () async {

                        Navigator.pop(context);

                        showLoadingWidget(context, comp.colors.avgColor, 'Opuszczanie lokalu...');

                        await ApiIndivComp.leave(
                            compKey: comp.key,
                            onSuccess: () async {
                              await indivCompLoader.run();
                              Navigator.pop(context);
                              Navigator.pop(context);
                              showAppToast(context,
                                  text: 'Współzawodnictwo opuszczone');
                            },
                            onError: () =>
                                showAppToast(
                                    context, text: 'Coś poszło nie tak...')
                        );
                        Navigator.pop(context);
                      }
                  )
                ]
            );


        },
        child: SizedBox(
          height: 100,
          child: Stack(
            children: [

              Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  MdiIcons.logout,
                  size: 60,
                  color: backgroundIcon_(context),
                ),
              ),

              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  'Opuść\nwspółzawodnictwo',
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                      fontWeight: weight.bold,
                      color: iconEnab_(context)
                  ),
                ),
              )
            ],
          ),
        )
    );

  }



}

class EditGradientButton extends StatelessWidget{
  
  final IconData icon;
  final String text;
  final void Function() onTap;

  const EditGradientButton(this.icon, this.text, {this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return AppCard(
        radius: AppCard.BIG_RADIUS,
        elevation: AppCard.bigElevation,
        margin: AppCard.normMargin,
        padding: EdgeInsets.zero,
        onTap: onTap,
        child: GradientWidget(
          colorStart: Provider.of<ColorKeyProvider>(context, listen: false).color1,
          colorEnd: Provider.of<ColorKeyProvider>(context, listen: false).color2,
          child: TitleShortcutRowWidget(
            leading: Padding(
              padding: EdgeInsets.all(Dimen.ICON_MARG + AppCard.DEF_PADDING_VAL),
              child: Icon(icon, color: background_(context)),
            ),
            title: text,
            titleColor: background_(context),
            trailing: SizedBox(width: Dimen.ICON_FOOTPRINT),
          ),
        )
    );
  }
  
}