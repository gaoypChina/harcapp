
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import 'common.dart';

class DescCzekoladka extends StatelessWidget{

  const DescCzekoladka({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        children: <Widget>[

          const DescOnlyWidget(),

          const SizedBox(height: Dimen.SIDE_MARG),

          Text(
            'Szyfr czekoladka zamienia każdą literę w szyfrowanej wiadomości na symbol, któremu dana litera odpowiada w poniższym zestawie tabelek.'
                '\n\nZaszyfrowana litera jest elementem tabelki w której się znajduje, gdzie sama litera jest zamieniana na kropkę.',
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
          ),

          const SizedBox(height: Dimen.SIDE_MARG),

          Row(
            children: <Widget>[

              const SizedBox(width: 2*Dimen.defMarg),

              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: Text('A   B', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                          Container(height: 36, width: 2, color: textEnab_(context)),
                          Expanded(child: Text('C   D', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                          Container(height: 36, width: 2, color: textEnab_(context)),
                          Expanded(child: Text('E   F', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                        ],
                      ),
                      Container(height: 2, width: double.infinity, color: textEnab_(context)),
                      Row(
                        children: <Widget>[
                          Expanded(child: Text('G   H', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                          Container(height: 36, width: 2, color: textEnab_(context)),
                          Expanded(child: Text('I   J', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                          Container(height: 36, width: 2, color: textEnab_(context)),
                          Expanded(child: Text('K   L', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                        ],
                      ),
                      Container(height: 2, width: double.infinity, color: textEnab_(context)),
                      Row(
                        children: <Widget>[
                          Expanded(child: Text('M   N', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                          Container(height: 36, width: 2, color: textEnab_(context)),
                          Expanded(child: Text('O   P', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                          Container(height: 36, width: 2, color: textEnab_(context)),
                          Expanded(child: Text('R   S', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold), textAlign: TextAlign.center)),
                        ],
                      ),
                    ],
                  )
              ),
              const SizedBox(width: 20.0),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Transform.rotate(angle: -pi/4,
                    child: Container(
                        child: Column(children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const RotateText('Y'),
                              Container(height: 36, width: 2, color: textEnab_(context)),
                              const RotateText('T'),
                            ],),
                          Container(height: 2, width: 2*36.0, color: textEnab_(context)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const RotateText('W'),
                              Container(height: 36, width: 2, color: textEnab_(context)),
                              const RotateText('U'),
                            ],),
                        ])
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      RoundContainer(
                          34,
                          textEnab_(context),
                          Container()
                      ),
                      RoundContainer(
                          30,
                          background_(context),
                          Center(child: Text('Z', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold)))
                      )
                    ],)

                ],
              ),

              const SizedBox(width: 2*Dimen.defMarg),

            ],),

        ]
    );
  }

}

class RotateText extends StatelessWidget{

  final String string;

  const RotateText(this.string, {super.key});

  @override
  Widget build(BuildContext context) {

    return Transform.rotate(
      angle: pi/4,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        child: Text(string, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold)),
      ),
    );
  }
}

class RoundContainer extends StatelessWidget{

  final double radius;
  final Color? color;
  final Widget child;
  const RoundContainer(this.radius, this.color, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              topRight: Radius.circular(radius),
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius))),
      child: child,
    );
  }
}