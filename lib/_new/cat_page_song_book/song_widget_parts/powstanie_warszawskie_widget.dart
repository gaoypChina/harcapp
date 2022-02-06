
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core_song/song_core.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PowstWarszCard<T extends SongCore> extends StatelessWidget{

  final void Function() onPowstanieCardTap;
  const PowstWarszCard({this.onPowstanieCardTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
        padding: EdgeInsets.zero,
        elevation: AppCard.bigElevation,
        onTap: onPowstanieCardTap,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/start/start_layout_pol_walcz_spiewnik.webp'),
                  fit: BoxFit.cover,
                  alignment: Alignment.center
              ),
            ),
            child: Padding(
              padding: AppCard.defPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(width: Dimen.ICON_SIZE),
                  Expanded(child: Container()),
                  SvgPicture.asset('assets/images/hist/hist_2.svg', color: Colors.white, width: Dimen.ICON_SIZE, height: Dimen.ICON_SIZE),
                  SizedBox(width: Dimen.DEF_MARG),
                  Text('Piosenki powstańcze', style: TextStyle(fontFamily: 'Hand15', color: Colors.white)),
                  Expanded(child: Container()),
                  Icon(MdiIcons.gestureTap, color: Colors.white54,),

                ],
              ),
            )
        )
    );
  }
}