import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';

class CirclePrompt extends StatelessWidget{

  final Widget child;
  final String? text;
  final IconData? icon;

  const CirclePrompt({required this.child, this.text, this.icon, super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      Stack(
        children: [

          Opacity(
              opacity: .7,
              child: child
          ),

          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          background_(context).withOpacity(0),
                          background_(context)//.withOpacity(0),
                        ],
                        stops: const [0, 0.9],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        tileMode: TileMode.repeated
                    )
                ),
              ),
            ),
          ),

        ],
      ),

      Container(
        color: background_(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            if(text != null)
              Text(
                text!,
                style: AppTextStyle(
                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                    fontWeight: weight.bold
                ),
                textAlign: TextAlign.center,
              ),

            const SizedBox(height: Dimen.SIDE_MARG),

            if(icon != null)
              Icon(icon, size: 48.0, color: textEnab_(context)),

          ],
        ),
      )
    ],
  );

}