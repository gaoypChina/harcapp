import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


enum Org{zhp, zhr_o, zhr_c, zhr_d, fse}

double BACKGROUND_TEXT_SIZE(BuildContext context) => MediaQuery.of(context).size.width/3;

const Map<Org, int> orgToInt = {
  Org.zhp:0,
  Org.zhr_o:1,
  Org.zhr_c:2,
  Org.zhr_d:3,
  Org.fse:4,
};

const Map<int, Org> orgFromInt = {
  0:Org.zhp,
  1:Org.zhr_o,
  2:Org.zhr_c,
  3:Org.zhr_d,
  4:Org.fse,
};

const Map<Org, String> orgName = {
  Org.zhp:'ZHP',
  Org.zhr_o:'ZHR',
  Org.zhr_c:'ZHR', //♂
  Org.zhr_d:'ZHR', //♀
  Org.fse:'FSE'
};

const Map<Org, Color> orgColor = {
  Org.zhp:Colors.green,//AppColors.zhp_green,
  Org.zhr_o:Colors.deepOrange,
  Org.zhr_c:Colors.deepOrange,
  Org.zhr_d:Colors.deepOrange,
  Org.fse:Colors.amber
};

const Map<Org, String> orgFullName = {
  Org.zhp:'Związek Harcerstwa Polskiego',
  Org.zhr_o:'Związek Harcerstwa Rzeczypospolitej',
  Org.zhr_c:'Związek Harcerstwa Rzeczypospolitej',
  Org.zhr_d:'Związek Harcerstwa Rzeczypospolitej',
  Org.fse:'Federacja Skautingu Europejskiego'
};

class OrgIndicator extends StatelessWidget{

  final Org org;
  final double fontSize;

  const OrgIndicator(this.org, {this.fontSize: Dimen.TEXT_SIZE_NORMAL});

  @override
  Widget build(BuildContext context) {
    return Text(
        orgName[org],
        style: AppTextStyle(
            fontWeight: weight.halfBold,
            color: orgColor[org],
            fontSize: fontSize
        )
    );
  }

}

class OrgManager{
/*
  static Org get next{

    Org current = OrgManager.current;

    if(current == Org.zhp) current = Org.zhr_o;
    else if(current == Org.zhr_o) current = Org.zhr_c;
    else if(current == Org.zhr_c) current = Org.zhr_d;
    else if(current == Org.zhr_d) current = Org.fse;
    else if(current == Org.fse) current = Org.zhp;

    shaPref.setInt(ShaPref.SHA_PREF_ORG, orgToInt[current]);

    return current;
  }
*/
  static Org nextFrom(List<Org> allowedOrgs){
    int currIndex = allowedOrgs.indexOf(OrgManager.current);
    Org nextOrg = allowedOrgs[(currIndex + 1) % allowedOrgs.length];
    OrgManager.current = nextOrg;
    return nextOrg;
  }

  static Org get current{
    int orgInt = shaPref.getInt(ShaPref.SHA_PREF_ORG, orgToInt[Org.zhp]);
    return orgFromInt[orgInt];
  }

  static Org currentFrom(List<Org> allowedOrgs){

    Org globCurrOrg = OrgManager.current;
    if(allowedOrgs.contains(globCurrOrg)) return globCurrOrg;

    if(globCurrOrg == Org.zhr_c || globCurrOrg == Org.zhr_d)
      if(allowedOrgs.contains(Org.zhr_o)) return Org.zhr_o;

    if(globCurrOrg == Org.fse)
      if(allowedOrgs.contains(Org.zhr_o)) return Org.zhr_o;

    OrgManager.current = Org.zhp;
    if(allowedOrgs.contains(Org.zhp)) return Org.zhp;

    return null;

  }

  static set current(Org value) => shaPref.setInt(ShaPref.SHA_PREF_ORG, orgToInt[value]);

}

class OrgSwitcher extends StatefulWidget{

  static const double _width = 50.0;
  static const double margin = Dimen.ICON_MARG;

  static const double width = _width + 2*margin;

  final List<Org> allowedOrgs;
  final bool longPressable;
  final Function(Org currentState) onTap;

  const OrgSwitcher({this.allowedOrgs=Org.values, this.longPressable = true, this.onTap});

  @override
  State<StatefulWidget> createState() => OrgSwitcherState();
}

class OrgSwitcherState extends State<OrgSwitcher>{

  List<Org> get allowedOrgs => widget.allowedOrgs;

  @override
  void initState() {
    OrgManager.current = OrgManager.currentFrom(allowedOrgs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      radius: AppCard.BIG_RADIUS,
      padding: EdgeInsets.only(
        left: OrgSwitcher.margin,
        right: OrgSwitcher.margin,
        top: 5.0,
        bottom: 5.0,
      ),
      onTap: (){
        int currIndex = allowedOrgs.indexOf(OrgManager.current);
        OrgManager.current = allowedOrgs[(currIndex + 1)%allowedOrgs.length];
        if(widget.onTap != null) widget.onTap(OrgManager.current);
      },
      onLongPress: widget.longPressable?() => openDialog(
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
                      _OrgSwitcherExtendedButton(allowedOrgs, Org.fse, onTap: widget.onTap),
                      _OrgSwitcherExtendedButton(allowedOrgs, Org.zhp, onTap: widget.onTap),
                      _OrgSwitcherExtendedButton(allowedOrgs, Org.zhr_o, onTap: widget.onTap),
                      _OrgSwitcherExtendedButton(allowedOrgs, Org.zhr_c, onTap: widget.onTap),
                      _OrgSwitcherExtendedButton(allowedOrgs, Org.zhr_d, onTap: widget.onTap),
                    ],
                  )
                ),
              )
            ],
          )
      ):null,
      child: Container(
        width: OrgSwitcher._width,
        child: Center(
            child: Column(
              children: [

                Text('', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_SMALL)),
                Text(
                    orgName[OrgManager.current],
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.bold,
                        color: orgColor[OrgManager.current]//appBarTextEnab_(context)
                    )
                ),
                Text(
                  OrgManager.current==Org.zhr_d?'H-KI':(
                  OrgManager.current==Org.zhr_c?'H-RZE':''),
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_SMALL,
                      fontWeight: weight.bold,
                      color: orgColor[OrgManager.current]//appBarTextEnab_(context)
                  )
                )
              ],
            )
        ),
      ),
    );
  }
}

class _OrgSwitcherExtendedButton extends StatelessWidget{

  final List<Org> allowedOrgs;
  final Org org;
  final void Function(Org) onTap;

  const _OrgSwitcherExtendedButton(this.allowedOrgs, this.org, {this.onTap});

  @override
  Widget build(BuildContext context) {
    if(!allowedOrgs.contains(org))
      return Container();

    return SimpleButton(
        radius: 0,
        padding: EdgeInsets.all(6.0),
        margin: EdgeInsets.zero,
        child: Row(
          children: [
            if(OrgManager.current == org)
              Icon(MdiIcons.circleMedium)
            else
              SizedBox(width: Dimen.ICON_SIZE),

            Padding(
              padding: EdgeInsets.all(Dimen.ICON_MARG),
              child: SizedBox(
                width: 32.0,
                child: OrgIndicator(org, fontSize: Dimen.TEXT_SIZE_BIG),
              ),
            ),
          ],
        ),
        onTap: (){
          Org org = OrgManager.nextFrom(allowedOrgs);
          if (onTap != null) onTap(org);
          Navigator.pop(context);
        }
    );
  }}