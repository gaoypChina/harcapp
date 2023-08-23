import 'package:flutter/material.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/dimen.dart';

class PatronListWidget extends StatelessWidget{

  static const List<Person> PLN50Patrons = [
    WIKTOR_KARPALA,
    PIOTR_MACIEJ_KABATA,
    HUBERT_FRUKOWSKI,
  ];

  static const List<Person> PLN20Patrons = [
    JAROSLAW_JAKUBIAK,
    KLAUDIUSZ_PALUCH,
    PAWEL_KIMEL,
    Person(name: 'Anna Kaczorowska'),
  ];

  static const List<Person> PLN10Patrons = [
    RAFAL_BARAN,
    JULITA_STEPIEN,
    ADAM_DUDAK,
    Person(name: 'Filip Skura'),
    Person(name: 'Karol Kociołek'),
    Person(name: 'Maciej Marciniak'),
    Person(name: 'Krzysiek Marciniak'),
  ];

  static const List<Person> PLN5Patrons = [
    KAROLINA_MARCINKOWSKA,
    Person(name: 'Szymon Hołysz'),
    PRZEMYSLAW_KLUCZKOWSKI,
    Person(name: 'Mikołaj Olejarz'),
    WIKTORIA_PRUSZYNSKA,
    Person(name: 'Sławomira Wcisło'),
    Person(name: 'Tosia Wachowicz'),
    Person(name: 'Witek Marszał'),
    // MALGORZATA_MASKO_HORYZA, // anonim
    Person(name: 'Franek Janiak'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Lista Patronów'),
          centerTitle: true,
          floating: true,
        ),

        SliverPadding(
            padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
            sliver: SliverList(
              delegate: SliverChildListDelegate([

                Column(children: PLN50Patrons.map((p) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: PersonCard(p)
                )).toList()),

                const SizedBox(height: Dimen.defMarg),
                Column(children: PLN20Patrons.map((p) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: PersonCard(p)
                )).toList()),

                const SizedBox(height: Dimen.defMarg),
                Column(children: PLN10Patrons.map((p) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: PersonCard(p)
                )).toList()),

                const SizedBox(height: Dimen.defMarg),

                // ---
                // PATRONI BEZ PROGU
                Column(children: PLN5Patrons.map((p) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: PersonCard(p)
                )).toList()),

              ]),
            )
        )

      ],
    ),
  );


}