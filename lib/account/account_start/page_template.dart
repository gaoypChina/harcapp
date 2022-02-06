import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/_new/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/dimen.dart';

class PageTemplate extends StatelessWidget {

  static const appBarHeroTag = 'accPageTemplateAppBarHeroTag';

  static const Color accentColor = Colors.black;

  final String title;
  final Widget child;
  final double appBarElevation;
  final PreferredSizeWidget appBarBottom;
  final List<Widget> actions;

  const PageTemplate({this.title, @required this.child, this.appBarElevation, this.appBarBottom, this.actions});

  @override
  Widget build(BuildContext context) {

    double bgIconSize = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
              double.infinity,
              kToolbarHeight + (appBarBottom?.preferredSize?.height??0.0)
          ),
          child: Hero(
            tag: appBarHeroTag,
            child: AppBar(
              leading: SizedBox(
                width: Dimen.APPBAR_LEADING_WIDTH,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              title: Text(title??'Konto HarcApp'),
              centerTitle: true,
              actions: actions,
              elevation: appBarElevation??0.0,
              bottom: appBarBottom,
            ),
          ),
        ),
        body: Stack(
          children: [

            Positioned(
                bottom: -1*bgIconSize*0.17,
                right: -1*bgIconSize*0.17,
                child: Hero(
                  tag: harcAppBigRotatLogoHero,
                  child: RotationTransition(
                    child: SvgPicture.asset(
                        'assets/images/harcapp_logo.svg',
                        height: bgIconSize,
                        width: bgIconSize,
                        color: Colors.black.withOpacity(0.05)),
                    turns: AlwaysStoppedAnimation(-45 / 360),
                  ),
                )
            ),

            Column(
              children: [
                Expanded(child: child),

                Consumer<ConnectivityProvider>(
                  builder: (context, prov, child){
                    if(prov.connected)
                      return Container();

                    return GradientWidget(
                        radius: 0,
                        colorStart: Colors.red[900],
                        colorEnd: Colors.deepOrange[700],
                        height: Dimen.ICON_SIZE + 2*Dimen.DEF_MARG,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Icon(MdiIcons.wifiOff, color: Colors.white),

                            SizedBox(width: Dimen.ICON_MARG),

                            Text(
                              'Brak połączenia z Internetem',
                              style: AppTextStyle(fontWeight: weight.halfBold, color: Colors.white),
                            ),
                          ],
                        )
                    );
                  },
                )

              ],
            )

          ],
        ),
    );

  }

}