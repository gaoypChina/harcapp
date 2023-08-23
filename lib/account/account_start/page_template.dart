import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:harcapp/_new/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/dimen.dart';

class PageTemplate extends StatelessWidget {

  static const appBarHeroTag = 'accPageTemplateAppBarHeroTag';

  static const Color accentColor = Colors.black;

  final String? title;
  final Widget child;
  final double? appBarElevation;
  final PreferredSizeWidget? appBarBottom;
  final List<Widget>? actions;

  const PageTemplate({this.title, required this.child, this.appBarElevation, this.appBarBottom, this.actions, super.key});

  @override
  Widget build(BuildContext context) {

    double bgIconSize = MediaQuery.of(context).size.width;

    return AppScaffold(
        appBar: PreferredSize(
          preferredSize: Size(
              double.infinity,
              kToolbarHeight + (appBarBottom?.preferredSize.height??0.0)
          ),
          child: Hero(
            tag: appBarHeroTag,
            child: AppBar(
              leading: SizedBox(
                width: Dimen.APPBAR_LEADING_WIDTH,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
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
                    turns: const AlwaysStoppedAnimation(-45 / 360),
                    child: SvgPicture.asset(
                        'assets/images/harcapp_logo.svg',
                        height: bgIconSize,
                        width: bgIconSize,
                        color: Colors.black.withOpacity(0.05)),
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

                    return Container(
                        color: Colors.red,
                        child: SizedBox(
                          height: Dimen.TEXT_SIZE_NORMAL + 2*Dimen.defMarg,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              //Icon(MdiIcons.earthOff, color: Colors.white),

                              const SizedBox(width: Dimen.ICON_MARG),

                              Text(
                                noInternetMessage,
                                style: AppTextStyle(color: Colors.white),
                              ),
                            ],
                          ),
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