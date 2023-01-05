import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../_common_widgets/loading_widget.dart';
import '../comp_role.dart';

class LeaveCompButton extends StatelessWidget{

  final IndivComp comp;

  const LeaveCompButton(this.comp, {super.key});

  @override
  Widget build(BuildContext context) => ListTile(
    leading: const Icon(MdiIcons.exitToApp),
    title: Text(
      'Opuść współzawodnictwo',
      style: AppTextStyle(),
    ),
    onTap: () {

      int allAdminCount = 0;
      for(IndivCompParticip? particip in comp.loadedParticips) if(particip!.profile.role == CompRole.ADMIN) allAdminCount++;

      if(allAdminCount == 1 && comp.myProfile?.role == CompRole.ADMIN){
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
                          IndivComp.removeFromAll(comp, context: context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          showAppToast(context, text: 'Współzawodnictwo opuszczone');
                        },
                        onServerMaybeWakingUp: () {
                          showServerWakingUpToast(context);
                          return true;
                        },
                        onError: (){
                          showAppToast(context, text: simpleErrorMessage);
                        }
                    );
                    Navigator.pop(context);
                  }
              )
            ]
        );

    },
  );

}

class EditGradientButton extends StatelessWidget{
  
  final IconData icon;
  final String text;
  final void Function()? onTap;

  const EditGradientButton(this.icon, this.text, {this.onTap, super.key});
  
  @override
  Widget build(BuildContext context) => GradientWidget(
    radius: AppCard.bigRadius,
    elevation: AppCard.bigElevation,
    colorStart: ColorKeyProvider.of(context).color1!,
    colorEnd: ColorKeyProvider.of(context).color2!,
    child: InkWell(
      onTap: onTap,
      child: TitleShortcutRowWidget(
        leading: Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG + AppCard.defPaddingVal),
          child: Icon(icon, color: background_(context)),
        ),
        title: text,
        titleColor: background_(context),
        trailing: const SizedBox(width: Dimen.ICON_FOOTPRINT),
      ),
    )
  );
  
}

const double settingsPartPaddingVal = Dimen.ICON_MARG;

class SettingsPartHeader extends StatelessWidget{

  final String title;

  const SettingsPartHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) =>
      TitleShortcutRowWidget(
          title: title,
          textAlign: TextAlign.start,
          titleColor: backgroundIcon_(context).withOpacity(.1)
      );

}