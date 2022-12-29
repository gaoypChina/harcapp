import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AppCustomFooter extends StatelessWidget{

  static const double defHeight = 55.0;

  final bool moreToLoad;
  final Color? color;
  final bool showDotWhenAllLoaded;

  const AppCustomFooter({
    required this.moreToLoad,
    this.color,
    required this.showDotWhenAllLoaded,

    super.key
  });

  @override
  Widget build(BuildContext context) => CustomFooter(
    height: moreToLoad && showDotWhenAllLoaded?55:0,
    builder: (BuildContext context, LoadStatus? mode){
      Widget body;
      if(!moreToLoad)
        body = showDotWhenAllLoaded?
        Icon(MdiIcons.circleMedium, color: hintEnab_(context)):
        Container();

      else if(mode == LoadStatus.idle)
        body = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(MdiIcons.arrowUp),
            const SizedBox(width: Dimen.ICON_MARG),
            Text(
                'Przeciągnij, by załadować kolejne',
                style: AppTextStyle()
            ),
          ],
        );

      else if(mode == LoadStatus.loading)
        body = SpinKitChasingDots(
          color: color??iconEnab_(context),
          size: Dimen.ICON_SIZE,
        );

      else if(mode == LoadStatus.failed)
        body = Text("Coś poszło nie tak!", style: AppTextStyle());

      else if(mode == LoadStatus.canLoading)
        body = Text("Puść, by załadować", style: AppTextStyle());

      else
        body = Text(
          'Nie wiem co tu wyświtlić. Pozdrawiam mamę!',
          style: AppTextStyle(),
        );

      return SizedBox(
        height: defHeight,
        child: Center(child: body),
      );
    },
  );

}