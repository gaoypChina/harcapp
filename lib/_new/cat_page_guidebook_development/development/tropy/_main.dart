import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';

class TropyPage extends StatelessWidget{

  const TropyPage({super.key});

  @override
  Widget build(BuildContext context) => const BottomNavScaffold(
    body: CustomScrollView(
      slivers: [

        SliverAppBar(
          floating: true,
          pinned: true,
          centerTitle: true,
          title: Text('Tropy'),
        ),



      ],
    ),
  );

}