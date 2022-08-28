import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_new/cat_page_harcthought/common/short_read.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShortReadThumbnailWidget extends StatelessWidget{

  static const double height = 120;

  final ShortRead shortRead;
  final Color? titleColor;
  final void Function() onTap;

  const ShortReadThumbnailWidget(this.shortRead, {required this.titleColor, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 1,
    child: Hero(
        tag: shortRead,
        child: SimpleButton(
            onTap: onTap,
            color: backgroundIcon_(context),
            radius: AppCard.bigRadius,
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
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
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Material(
                      color: background_(context),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(AppCard.bigRadius),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(Dimen.defMarg),
                        child: Icon(MdiIcons.volumeHigh),
                      ),
                    ),
                  ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  height: 2*Dimen.TEXT_SIZE_NORMAL + 2*Dimen.defMarg,
                  child: Container(
                    color: iconEnab_(context).withOpacity(.5),
                    child: Padding(
                        padding: const EdgeInsets.all(Dimen.defMarg),
                        child: Center(
                          child: Text(
                            shortRead.title,
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_NORMAL,
                                color: titleColor??background_(context),
                                fontWeight: weight.halfBold
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        )
                    ),
                  ),
                )

              ],
            )
        )

    ),
  );

}