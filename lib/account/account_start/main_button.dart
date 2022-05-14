import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:provider/provider.dart';
import 'package:harcapp/account/account_start/part_template.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

class MainButton extends StatelessWidget{

  static Color borderColor(BuildContext context) => iconDisab_(context);
  static const double borderSize = 4.0;
  static const double outerRadius = AppCard.BIG_RADIUS;
  static const double innerRadius = AppCard.BIG_RADIUS - 3.0;
  static const double height = Dimen.ICON_FOOTPRINT + borderSize;

  final IconData? icon;
  final String? text;
  final bool? processing;
  final bool enabled;
  final void Function()? onTap;

  const MainButton({
    this.icon,
    this.text,
    this.processing,
    this.enabled: true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: PartTemplate.mainButtonHeroTag,
        child: Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(outerRadius),
            color: borderColor(context),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(innerRadius),
                  color: cardEnab_(context),
                  child: Consumer<ConnectivityProvider>(
                      builder: (context, prov, child) => InkWell(
                        onTap: !prov.connected || processing! || !enabled?null:onTap,
                        child: SizedBox(
                          height: Dimen.ICON_FOOTPRINT,
                          width: double.infinity,
                          child: AnimatedChildSlider(
                            isCenter: false,
                            index: processing!?1:0,
                            withOpacity: true,
                            direction: Axis.horizontal,
                            children: [
                              SimpleButton.from(
                                  context: context,
                                  text: text,
                                  margin: EdgeInsets.zero,
                                  icon: icon,
                                  textColor: enabled && prov.connected?iconEnab_(context):iconDisab_(context),
                                  iconLeading: false,
                                  onTap: null
                              ),
                              SpinKitThreeBounce(
                                color: PartTemplate.accentColor(context),
                                size: Dimen.ICON_SIZE,
                              ),

                            ],
                          ),
                        ),
                      )
                  )
              ),
            )
        )
    );
  }

}