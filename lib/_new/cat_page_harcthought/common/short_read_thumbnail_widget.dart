import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_new/cat_page_harcthought/common/short_read.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShortReadThumbnailWidget extends StatelessWidget{

  final ShortRead shortRead;
  final void Function() onTap;

  const ShortReadThumbnailWidget(this.shortRead, {required this.onTap, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      AspectRatio(
        aspectRatio: 1,
        child: Hero(
            tag: shortRead,
            child: AppCard(
                onTap: onTap,
                color: background_(context),
                radius: AppCard.BIG_RADIUS,
                elevation: 0,//AppCard.bigElevation,
                padding: EdgeInsets.zero,
                child: Stack(
                  children: [

                    Center(
                      child: SpinKitChasingDots(size: Dimen.ICON_SIZE, color: accent_(context)),
                    ),

                    Positioned.fill(
                      child: Image(
                        image: AssetImage('assets/images/gawedy/${shortRead.graphicalResource.path}'),
                        fit: BoxFit.cover,
                      ),
                    ),

                    if(shortRead.soundResource != null)
                      const Positioned(
                        bottom: 0,
                        right: 0,
                        child: AppCard(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppCard.BIG_RADIUS),
                              bottomLeft: Radius.zero,
                              topRight: Radius.zero
                          ),
                          margin: EdgeInsets.zero,
                          child: Icon(MdiIcons.volumeHigh),
                        ),
                      )

                  ],
                )
            )

        ),
      ),

      const SizedBox(height: Dimen.ICON_MARG),

      Padding(
        padding: const EdgeInsets.all(Dimen.DEF_MARG),
        child: Text(
          shortRead.title,
          style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_BIG,
            color: iconEnab_(context),
            fontWeight: weight.halfBold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),

    ],
  );

}