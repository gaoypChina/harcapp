import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRWidget extends StatelessWidget{

  final String data;

  const QRWidget(this.data);

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Center(
            child: QrImage(
              padding: EdgeInsets.all(10),
              foregroundColor: iconEnab_(context),
              data: data,
              version: QrVersions.auto,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(Dimen.ICON_MARG),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    'Jak odebrać piosenkę?',
                    style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_NORMAL)),
                SizedBox(height: Dimen.DEF_MARG),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      'Kliknij ',
                      style: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_NORMAL),
                    ),

                    Icon(MdiIcons.musicNotePlus, color: hintEnab_(context), size: Dimen.TEXT_SIZE_NORMAL),
                    Text(
                      ', następnie ',
                      style: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_NORMAL),
                    ),
                    Icon(MdiIcons.qrcodeScan, color: hintEnab_(context), size: Dimen.TEXT_SIZE_NORMAL),

                    Text(
                      ' i zeskanuj powyższy kod.',
                      style: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_NORMAL),
                    ),
                  ],
                )

              ],
            ),
          )

        ],
      ),
    );
  }

}
