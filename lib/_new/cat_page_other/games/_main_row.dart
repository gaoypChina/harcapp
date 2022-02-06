import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_new/cat_page_other/games/data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GamesPreviewRow extends StatefulWidget {

  @override
  State createState() => GamesPreviewRowState();

}

class GamesPreviewRowState extends State<GamesPreviewRow>{

  bool init;

  @override
  void initState() {

    init = false;

    post(()async{
      await precacheImage(AssetImage('assets/images/games/bg_pytajki.webp'), context);
      await precacheImage(AssetImage('assets/images/games/bg_slowo_klucz.webp'), context);
      setState(() => init = true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return init?ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: gameList.length,
      itemBuilder: (context, index) => Hero(
        tag: gameList[index],
        child: GameItem(data: gameList[index]),
      ),
      separatorBuilder: (context, index) => SizedBox(width: Dimen.ICON_MARG),

    ):SpinKitThreeBounce(color: accent_(context), size: Dimen.ICON_SIZE,);

  }

}

class GameItem extends StatelessWidget{

  final GameData data;

  const GameItem({@required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: AppCard(
        radius: AppCard.BIG_RADIUS,
        elevation: 0, //AppCard.bigElevation,
        padding: EdgeInsets.zero,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => data.builder(context))),
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/games/${data.coverImg}.webp'),
                  fit: BoxFit.cover,
                  alignment: data.bgAlignment
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 18.0, left: 18.0, right: 12.0, bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Text(data.name, style: AppTextStyle(fontSize: 24.0, fontWeight: weight.bold, color: Colors.white, shadow: true), textAlign: TextAlign.center,),

                  Expanded(child: Container()),

                  Row(
                    children: [

                      Icon(MdiIcons.accountMultiple, size: 20, color: Colors.white),
                      SizedBox(width: 6),
                      Text('${data.minPlayerCount} - ${data.maxPlayerCount==-1?'...':data.maxPlayerCount}', style: AppTextStyle(fontWeight: weight.halfBold, color: Colors.white, fontSize: Dimen.TEXT_SIZE_BIG),),

                    ],
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }

}
