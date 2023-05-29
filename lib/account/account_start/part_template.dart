import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class PartTemplate extends StatelessWidget {

  static const String defHeroTag = 'AccountStartPartTemplate';

  static const _backgroundHeroTag = 'backgroundHeroTag';
  static const _titleHeroTag = 'titleHeroTag';

  static const emailInputFieldHeroTag = 'emailInputFieldHeroTag';
  static const passwordInputFieldHeroTag = 'passwordInputFieldHeroTag';

  static const mainButtonHeroTag = 'mainButtonHeroTag';
  static const secondaryButtonHeroTag = 'secondaryButtonHeroTag';

  static Color accentColor(BuildContext context) => Provider.of<ColorPackProvider>(context, listen: false).isDark()?Colors.white:Colors.black;

  final String title;
  final String? errorMessage;
  final Widget? child;
  final dynamic heroTag;

  const PartTemplate({required this.title, this.errorMessage, this.child, this.heroTag = defHeroTag, super.key});

  @override
  Widget build(BuildContext context) {

    Widget backgroundWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
      child: GradientWidget(
          colorStart: cardEnab_(context)!,
          colorEnd: background_(context).withAlpha(0),
          radius: AppCard.bigRadius,
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.longestSide/2,
          )
      ),
    );

    Widget titleWidget = Text(
        title,
        textAlign: TextAlign.center,
        style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_APPBAR,
            fontWeight: weight.bold
        )
    );

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [

          Stack(
            children: [

              if(heroTag==null)
                backgroundWidget
              else
                Hero(
                  tag: Tuple2(heroTag, _backgroundHeroTag),
                  child: backgroundWidget,
                ),

              Padding(
                  padding: EdgeInsets.all(2*Dimen.SIDE_MARG),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      SizedBox(height: Dimen.SIDE_MARG),

                      if(heroTag==null)
                        titleWidget
                      else
                        Hero(
                            tag: Tuple2(heroTag, _titleHeroTag),
                            child: Material(
                                color: Colors.transparent,
                                child: titleWidget
                            )
                        ),

                      SizedBox(height: Dimen.SIDE_MARG),

                      Text(
                        translate(errorMessage??''),
                        style: AppTextStyle(
                            color: Colors.red
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: Dimen.SIDE_MARG),

                      child!

                    ],
                  )
              )
            ],
          )
        ],
      ),
    );

  }

}