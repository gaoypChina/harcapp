import 'package:flutter/material.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/dimen.dart';

class PatronListWidget extends StatelessWidget{

  static const List<Person> PLN50Patrons = [
    WIKTOR_KARPALA,
    PIOTR_MACIEJ_KABATA,
    HUBERT_FRUKOWSKI
  ];

  static const List<Person> PLN20Patrons = [
    JAROSLAW_JAKUBIAK,
    KLAUDIUSZ_PALUCH,
  ];

  static const List<Person> PLN10Patrons = [
    RAFAL_BARAN,
    JULITA_STEPIEN,
    ADAM_DUDAK,
  ];

  static const List<Person> PLN5Patrons = [
    KAROLINA_MARCINKOWSKA,
    Person(
      name: 'Szymon Hołysz',
    ),
    PRZEMYSLAW_KLUCZKOWSKI,
    Person(
      name: 'Mikołaj Olejarz',
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text('Lista Patronów'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
            padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
            sliver: SliverList(
              delegate: SliverChildListDelegate([

                Column(children: PLN50Patrons.map((p) => PersonCard(p)).toList()),
                //SizedBox(height: 24.0),

                //Text('Złoci Patroni:', style: AppTextStyle(fontWeight: weight.halfBold, color: widget.colorPack.hintDrawer),),
                SizedBox(height: Dimen.DEF_MARG),
                Column(children: PLN20Patrons.map((p) => PersonCard(p)).toList()),

                SizedBox(height: Dimen.DEF_MARG),
                Column(children: PLN10Patrons.map((p) => PersonCard(p)).toList()),
                //Text('Patroni:', style: AppTextStyle(fontWeight: weight.halfBold, color: widget.colorPack.hintDrawer),),
                SizedBox(height: Dimen.DEF_MARG),

                // ---
                // PATRONI BEZ PROGU
                Column(children: PLN5Patrons.map((p) => PersonCard(p)).toList()),

              ]),
            )
          )

        ],
      ),
    );
  }


}