import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PolaIcon extends StatelessWidget{

  final Color color;

  const PolaIcon({this.color});

  @override
  Widget build(BuildContext context) =>
    SvgPicture.asset('assets/images/pola.svg', color: color, height: Dimen.ICON_SIZE, width: Dimen.ICON_SIZE,);


}

Function polaTap = (BuildContext context) {

  IconData iconDownload;

  if (Platform.isAndroid) iconDownload = MdiIcons.googlePlay;
  else if (Platform.isIOS) iconDownload = MdiIcons.cloudDownloadOutline;

  showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        title: 'Wspieramy naszych!',
        builder: (context) =>
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            AppCard(
                onTap: (){
                  if (Platform.isAndroid) launchURL('https://play.google.com/store/apps/details?id=pl.pola_app');
                  else if (Platform.isIOS) launchURL('https://apps.apple.com/us/app/pola-zabierz-ja-na-zakupy/id1038401148?ls=1');
                },
                elevation: AppCard.bigElevation,
                radius: AppCard.BIG_RADIUS,
                padding: EdgeInsets.all(12.0),
                child: Row(
                  children: <Widget>[

                    Padding(
                      child: Icon(iconDownload),
                      padding: EdgeInsets.all(Dimen.ICON_MARG),
                    ),
                    Expanded(
                      child: Text('Pobierz aplikację', style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
                    ),
                    Padding(
                      child: PolaIcon(color: textEnab_(context)),
                      padding: EdgeInsets.all(Dimen.ICON_MARG),
                    ),

                  ],
                )
            ),

            SizedBox(height: Dimen.BOTTOM_SHEET_MARG,),

            Padding(
              padding: EdgeInsets.all(Dimen.DEF_MARG/2),
              child: AppText(
                '<b>Pola</b> ułatwia kupowanie polskich produktów.'
                    '\n\n<b>Zeskanuj kod kreskowy</b> z dowolnego produktu i dowiedz się, czy firma, która go wyprodukowała jest polska.'
                    '\n\nWspieraj z nami polskich producentów! :)',
                size: Dimen.TEXT_SIZE_BIG,
              ),
            ),

            SizedBox(height: 2*Dimen.BOTTOM_SHEET_MARG,),

            Padding(
              padding: EdgeInsets.all(Dimen.DEF_MARG),
              child: Center(
                child: AppCard(
                    padding: EdgeInsets.zero,
                    radius: 2,
                    child:
                    Column(
                      children: <Widget>[
                        Container(width: Dimen.ICON_SIZE*2, height: Dimen.ICON_SIZE*0.6, color: Colors.white,),
                        Container(width: Dimen.ICON_SIZE*2, height: Dimen.ICON_SIZE*0.6, color: Colors.red,)
                      ],
                    )
                ),
              )
            ),

          ],
        ),
      )
  );


};

