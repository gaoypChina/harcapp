import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';

class OrgCardWidgetTemplate extends StatelessWidget{

  static const double height = 160;

  final void Function(BuildContext context) onTap;
  final Color background;
  final heroTag;
  final Widget child;

  const OrgCardWidgetTemplate({@required this.background, @required this.child, @required this.heroTag, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Hero(
        tag: heroTag,
        child: AppCard(
            onTap: onTap==null?null:() => onTap(context),
            radius: AppCard.BIG_RADIUS,
            elevation: 0, //AppCard.bigElevation,
            padding: EdgeInsets.zero,
            color: background,
            child: child
        ),
      ),
    );
  }


}