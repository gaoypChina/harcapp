import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

import 'data.dart';

class AllBioPage extends StatelessWidget{

  final void Function(int)? onPicked;

  const AllBioPage({this.onPicked, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {

    final orientation = MediaQuery.of(context).orientation;

    List<Widget> children = [];

    for(ItemData data in DATA)
      children.add(
          Hero(
            tag: data,
            child: AppCard(
                onTap: ()async{
                  onPicked!(DATA.indexOf(data));
                  Navigator.pop(context);
                },
                elevation: AppCard.bigElevation,
                radius: AppCard.BIG_RADIUS,
                padding: EdgeInsets.zero,
                child: Image.asset('assets/images/bio/${data.imgSrc[0].item1}.webp', fit: BoxFit.cover)
            ),
          )
      );

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          const SliverAppBar(
            title: Text('Biografie'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverGrid.count(
              crossAxisCount: (orientation == Orientation.portrait) ? 3 : 5,
              mainAxisSpacing: Dimen.DEF_MARG,
              crossAxisSpacing: Dimen.DEF_MARG,
              children: children,
            ),
          )

        ],
      ),
    );
    
  }
  
}