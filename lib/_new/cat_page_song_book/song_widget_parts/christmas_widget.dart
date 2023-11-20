
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/snow.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core_song/song_core.dart';

class ChristmasCard<T extends SongCore> extends StatelessWidget{

  final void Function()? onChristmasCardTap;
  const ChristmasCard({super.key, this.onChristmasCardTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
        elevation: 0,
        radius: AppCard.bigRadius,
        margin: AppCard.normMargin,
        onTap: onChristmasCardTap,
        child: Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                SvgPicture.asset('assets/images/snowflake/mistletoe.svg', color: iconDisab_(context), width: Dimen.ICON_SIZE, height: Dimen.ICON_SIZE),
                SvgPicture.asset('assets/images/snowflake/snowflake_1.svg', color: iconDisab_(context), width: Dimen.ICON_SIZE, height: Dimen.ICON_SIZE),
                Text('Hej kolęda!', style: AppTextStyle(color: hintEnab_(context), fontWeight: weight.halfBold)),
                SvgPicture.asset('assets/images/snowflake/snowflake_2.svg', color: iconDisab_(context), width: Dimen.ICON_SIZE, height: Dimen.ICON_SIZE),
                SvgPicture.asset('assets/images/snowflake/snowflake_3.svg', color: iconDisab_(context), width: Dimen.ICON_SIZE, height: Dimen.ICON_SIZE),

              ],
            ),
            const SizedBox(
              width: double.infinity,
              height: Dimen.ICON_SIZE,
              child: SnowWidget(speed: 0.3, isRunning: true, totalSnow: 30,),
            ),
          ],
        )
    );
  }
}