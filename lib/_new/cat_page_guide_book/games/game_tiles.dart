import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guide_book/games/data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class GameTiles extends StatefulWidget {

  const GameTiles({super.key});

  @override
  State createState() => GameTilesState();

}

class GameTilesState extends State<GameTiles>{

  @override
  Widget build(BuildContext context) => ListView.separated(
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    itemCount: gameList.length,
    itemBuilder: (context, index) => GameTile(data: gameList[index]),
    separatorBuilder: (context, index) => const SizedBox(width: Dimen.ICON_MARG),
  );

}

class GameTile extends StatelessWidget{

  final GameData data;

  const GameTile({required this.data, super.key});

  @override
  Widget build(BuildContext context) => ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppCard.bigRadius)),
    leading: const SizedBox(),
    trailing: Hero(
      tag: data,
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        clipBehavior: Clip.antiAlias,
        child: Image.asset(
          'assets/images/games/${data.coverImg}.webp',
          width: 72,
          height: Dimen.ICON_FOOTPRINT,
          fit: BoxFit.fitWidth,
        ),
      ),
    ),
    title: Text(data.name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: textEnab_(context))),
    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => data.builder(context))),
  );

}
