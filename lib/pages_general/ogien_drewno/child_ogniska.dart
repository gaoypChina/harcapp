
import 'package:flutter/material.dart';
import 'package:harcapp/pages_general/ogien_drewno/common.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class ChildOgniska extends StatelessWidget{

  static const Map<int, String> _mapMask = {
    0:'zmienny',
    1:'mały',
    2:'średni',
    3:'duży',
    4:'b. duży'
  };
  static const Map<int, String> _mapFem = {
    0:'zmienna',
    1:'mała',
    2:'średnia',
    3:'duża',
    4:'b. duża'
  };
  static const Map<int, String> _mapNeut = {
    0:'zmienne',
    1:'małe',
    2:'średnie',
    3:'duże',
    4:'b. duże'
  };

  const ChildOgniska();

  @override
  Widget build(BuildContext context) {

    List<Item> items = [
      Item(
        'Wigwam',
        'Dogodne do gotowania i ogrzewania się (zużywa wiele opału). Jest najpopularniejszym typem ogniska.'
            '\n\nWbity w środek pal okłada się podpałką wstępną, z otwarciem od strony nawietrznej (wiatru). Nastepnie ze wszystkich stron opiera się drobniejsze patyki, pamiętając jednak by od strony nawietrznej zapewnić dostęp do podpałki. W miarę dokładania patyków należy wybierać drewno o większej grubości.'
            '\n\nTen typ ogniska zużywa wiele opału, jest jednak doskonały do ogrzewania się i suszenia odzienia. Suszenie obuwia może grozić jego rozklejeniem.'
            '\n\nUwaga! Ognisko typu "wigwam", prędzej czy później zawala się (po przepaleniu środkowego pala) i rozsypuje do postaci bezładnej zbieraniny płonących bierwion.'
      ),
      Item(
        'Studnia',
        'Zapewnia dużo ciepła i światła dzięki dużemu dopływowi powietrza. Może ono służyć do sygnalizacji.'
            '\n\nStudnia jest rozbudowanym ogniskiem typu "wigwam". Gotowe ognisko "wigwam" zostaje obłożone polanami (żerdziami). Polana okłada się tak, by tworzyły ażurową konstrukcję, podobną do kraty, która zapewnia dostęp tlenu i wytwarza efekt komina, przez co ogień bucha z wielką werwą.'
      ),
      Item(
          'Piramida',
          'Odmiana ogniska typu "studnia".'
              '\n\nBudowana jest podobnie jak "studnia" z tą różnicą, że każde „piętro” układane jest z coraz krótszych żerdzi.'
      ),
      Item(
          'Tratwa',
          'Typ ogniska użyteczny w przypadku wilgotnego drewna i podłoża.'
              '\n\nNa podłożu kładzione jest kwadratowe "łoże" z większych kawałków drewna. Następna warstwa układana jest poprzecznie. Na wierzchu budowana jest piramida. Wraz ze spaleniem żar przechodzi niżej osuszając i rozpalając dwie zasadnicze warstwy tratwy.'
      ),
      Item(
          'Gwiazda',
          'Zapewnia oszczędne zużycie opału i niewielki, dyskretny ogień.'
              '\n\nDo ogniska tego rodzaju zaleca się stosowanie twardego drewna drzew liściastych.'
              '\n\nGrubsze patyki układa się promieniście tak by stykały się w centrum, gdzie płonie ogień. Gdy płomień staje się zbyt wielki – odsuwa się gałęzie na zewnątrz. Gdy przygasa podsuwa je do centrum, nawet by zachodziły tam jedne na drugie.'
      ),
      Item(
          'T',
          'Ognisko dogodne do gotowania, niewrażliwe na wiatr.'
              '\n\nNiezbędne jest wykopanie dwóch podłużnych dołków, które połączone przypominają literę "T". W dołku będącym górną belką litery T zapalamy ognisko, zaś do części dolnej zbieramy żar, nad którym odbywa się gotowanie.'
      )
    ];

    return Container(
        color: AppColors.app_yellow_light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            AppCard(
              color: Colors.red,
              child: Text('Strona w budowie', style: AppTextStyle(color: Colors.white, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.center,),
            ),

            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[Header('Rodzaje ognisk', color: AppColors.app_yellow_main,)] + items,
              ),
            )

          ],
        )
    );
  }
}

class Item extends StatelessWidget{
  final String name;
  final String description;

  const Item(this.name, this.description);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.app_yellow_main,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(name, style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG),),
          SizedBox(height: Dimen.DEF_MARG,),
          Text(description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_NORMAL), textAlign: TextAlign.justify,)

        ],
      ),
    );
  }
}