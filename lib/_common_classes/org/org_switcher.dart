
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';


import '../common.dart';
import 'org.dart';
import 'org_indicator.dart';

class OrgSwitcher extends StatelessWidget{

  static const double _width = 50.0;
  static const double margin = Dimen.ICON_MARG;

  static const double width = _width + 2*margin;

  final List<Org?> allowedOrgs;
  final bool longPressable;
  final Function(Org? currentState)? onTap;

  const OrgSwitcher({this.allowedOrgs=Org.values, this.longPressable = true, this.onTap, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<OrgProvider>(
    builder: (context, prov, child) => SimpleButton(
      radius: AppCard.BIG_RADIUS,
      padding: const EdgeInsets.only(
        left: OrgSwitcher.margin,
        right: OrgSwitcher.margin,
        top: 5.0,
        bottom: 5.0,
      ),
      onTap: (){
        Org? org = prov.nextFrom(allowedOrgs);
        onTap?.call(org);
      },
      onLongPress: longPressable?() => openDialog(
          context: context,
          builder: (context) => Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: AppCard(
                    padding: EdgeInsets.zero,
                    radius: AppCard.BIG_RADIUS,
                    child: Column(
                      children: [
                        _OrgSwitcherExtendedButton(allowedOrgs, Org.fse, onTap: onTap),
                        _OrgSwitcherExtendedButton(allowedOrgs, Org.zhp, onTap: onTap),
                        _OrgSwitcherExtendedButton(allowedOrgs, Org.zhr_o, onTap: onTap),
                        _OrgSwitcherExtendedButton(allowedOrgs, Org.zhr_c, onTap: onTap),
                        _OrgSwitcherExtendedButton(allowedOrgs, Org.zhr_d, onTap: onTap),
                      ],
                    )
                ),
              )
            ],
          )
      ):null,
      child: SizedBox(
        width: OrgSwitcher._width,
        child: Center(
            child: Column(
              children: [

                Text('', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL)),
                Text(
                    orgName[prov.current!]!,
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.bold,
                        color: orgColor[prov.current!]
                    )
                ),
                Text(
                    prov.current==Org.zhr_d?'H-KI':(
                        prov.current==Org.zhr_c?'H-RZE':''),
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_SMALL,
                        fontWeight: weight.bold,
                        color: orgColor[prov.current!]
                    )
                )
              ],
            )
        ),
      ),
    ),
  );

}

class _OrgSwitcherExtendedButton extends StatelessWidget{

  final List<Org?> allowedOrgs;
  final Org org;
  final void Function(Org?)? onTap;

  const _OrgSwitcherExtendedButton(this.allowedOrgs, this.org, {this.onTap});

  @override
  Widget build(BuildContext context) {
    if(!allowedOrgs.contains(org))
      return Container();

    return SimpleButton(
        radius: 0,
        padding: const EdgeInsets.all(6.0),
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            if(OrgProvider.of(context).current == org)
              const Icon(MdiIcons.circleMedium)
            else
              const SizedBox(width: Dimen.ICON_SIZE),

            Padding(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              child: SizedBox(
                width: 32.0,
                child: OrgIndicator(org, fontSize: Dimen.TEXT_SIZE_BIG),
              ),
            ),
          ],
        ),
        onTap: (){
          Org? org = OrgProvider.of(context).nextFrom(allowedOrgs);
          onTap?.call(org);
          Navigator.pop(context);
        }
    );
  }}