import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRWidget extends StatelessWidget{

  final String data;

  const QRWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) => Material(
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        Center(
          child: QrImageView(
            padding: const EdgeInsets.all(10.0),
            eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
            dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: Colors.black),
            data: data,
            version: QrVersions.auto,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(
              left: Dimen.ICON_MARG,
              right: Dimen.ICON_MARG,
              bottom: Dimen.ICON_MARG
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Jak odebrać piosenkę?',
                  style: AppTextStyle(fontWeight: weight.halfBold, color: ColorPack.DEF_ICON_DISAB, fontSize: Dimen.TEXT_SIZE_BIG)),
              const SizedBox(height: Dimen.defMarg),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Text(
                    'Kliknij ',
                    style: AppTextStyle(color: ColorPack.DEF_ICON_DISAB, fontSize: Dimen.TEXT_SIZE_BIG),
                  ),

                  Icon(MdiIcons.musicNotePlus, color: ColorPack.DEF_ICON_DISAB, size: Dimen.TEXT_SIZE_BIG),
                  Text(
                    ', następnie ',
                    style: AppTextStyle(color: ColorPack.DEF_ICON_DISAB, fontSize: Dimen.TEXT_SIZE_BIG),
                  ),
                  Icon(MdiIcons.qrcodeScan, color: ColorPack.DEF_ICON_DISAB, size: Dimen.TEXT_SIZE_BIG),

                  Text(
                    ' i zeskanuj powyższy kod.',
                    style: AppTextStyle(color: ColorPack.DEF_ICON_DISAB, fontSize: Dimen.TEXT_SIZE_BIG),
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
