import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/details/app_settings.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';


class ChildStopnie extends StatelessWidget{

  const ChildStopnie({super.key});

  @override
  Widget build(BuildContext context) {

    AutoSizeGroup sizeGroup = AutoSizeGroup();

    Widget cardPWD = SimpleButton(
      radius: AppCard.bigRadius,
      onTap: () => showScrollBottomSheet(
        context: context,
        builder: (context) => BottomSheetStopien(
          title: 'Przewodnik\nPrzewodniczka',
          color: AppSettings.isDark?cardEnab_(context):AppColors.stop_pwd,
          textColor: AppSettings.isDark?textEnab_(context):Colors.white,
          idea: 'Swoją postawą propaguje harcerski system wartości wynikający z Przyrzeczenia i Prawa Harcerskiego. Poznaje siebie i motywy swojego postępowania. Pracuje nad własnymi słabościami i rozwija zdolności. Jest wzorem dla harcerzy. We współdziałaniu z dziećmi i młodzieżą znajduje radość, umie być starszym kolegą i przewodnikiem. Bierze aktywny udział w życiu drużyny, świadomie stosując metodę harcerską i wykorzystując przykład osobisty do realizacji celów wychowawczych. Ma poczucie odpowiedzialności za pracę i powierzoną grupę. Współtworzy hufcową wspólnotę. Ma świadomość wychowawczej roli służby w harcerstwie.',
          warOtw: const [
            'Złożenie Przyrzeczenia Harcerskiego.',
            'Przedstawienie KSI programu swojej próby zapewniającego realizację wymagań.',
            'Ukończone 16 lat.',
          ],
          zadania: const [
            'Kształtuje własną osobowość zgodnie z Prawem Harcerskim, w tym dokonał samooceny i na tej podstawie ułożył i konsekwentnie realizował plan swojego rozwoju.',
            'Pogłębia swoją wiedzę i rozwija swoje zainteresowania.',
            'Zachowuje właściwe proporcje w wypełnianiu obowiązków wynikających z przynależności do różnych grup społecznych (rodzina, szkoła, drużyna, środowisko zawodowe).',
            'Podejmuje stałą służbę w swoim harcerskim środowisku.',
            'Bierze udział w życiu hufca.',
            'W trakcie minimum 9-miesięcznej aktywnej służby w gromadzie/drużynie wykazał się umiejętnością pracy wychowawczej metodą harcerską z dziećmi lub młodzieżą w wybranej grupie wiekowej, w tym umiejętnościami:'
                '\n\ta)\tstosowania instrumentów metodycznych,'
                '\n\tb)\tstosowania systemu małych grup,'
                '\n\tc)\ttworzenia programu gromady/drużyny, jego realizacji i podsumowania,'
                '\n\td)\tpracy z Prawem i Przyrzeczeniem / Prawem i Obietnicą,'
                '\n\te)\tsamodzielnego prowadzenia zbiórek'
                '\noraz uczestniczył w:'
                '\n\tf)\torganizacji wyjazdowych form pracy wykorzystujących kontakt z przyrodą,'
                '\n\tg)\torganizowaniu oraz przeprowadzeniu gier i form pracy w terenie uwzględniających współdziałanie i współzawodnictwo,'
                '\n\th)\tpozyskiwaniu środków finansowych lub innych form wsparcia działalności gromady/drużyny,'
                '\n\ti)\torganizacji obozu (kolonii) lub zimowiska gromady/drużyny i pełnił na nim funkcję,'
                '\n\tj)\tprowadzeniu dokumentacji niezbędnej do działania gromady/drużyny,'
                '\n\tk)\twspółpracy ze środowiskiem działania – rodzicami, szkołą, itp.'
            'Wykazał się umiejętnością stosowania zasad dotyczących umundurowania, musztry, ceremoniału harcerskiego w pracy z drużyną.',
            'Wiedzę zdobytą w harcerskiej literaturze i mediach wykorzystał w pracy wychowawczej. Przeczytał minimum 3 książki harcerskie.'
          ],
          warZamk: const [
            'Osiągnięcie poziomu opisanego w idei stopnia i zrealizowanie wymagań próby.',
            'Przestrzeganie zasad "Polityki ochrony bezpieczeństwa dzieci w ZHP" oraz innych przepisów dotyczących zasad bezpieczeństwa w pracy z dziećmi i młodzieżą.',
            'Posiadanie wiedzy i umiejętności na poziomie stopnia harcerki orlej – harcerza orlego.',
            'Ukończenie minimum 15-godzinnego kursu pierwszej pomocy zawierającego zajęcia w praktyce.',
            'Pozytywnie oceniona służba w gromadzie/drużynie w okresie realizacji próby.',
            'Ukończenie kursu przewodnikowskiego.',
            'Posiadanie wiedzy i umiejętności odpowiadających wymaganiom stawianym wychowawcom wypoczynku.',
          ],
          oznaczenie: 'Oznaką stopnia przewodnika jest granatowa podkładka pod Krzyżem Harcerskim i granatowa lilijka na lewym rękawie munduru.',
        ),
      ),
      child: Center(
        child: AutoSizeText(
          'pwd',
          style: AppTextStyle(fontSize: 48.0, fontWeight: weight.halfBold, color: AppColors.stop_pwd),
          textAlign: TextAlign.center,
          group: sizeGroup,
        ),
      )
    );

    Widget cardPHM = SimpleButton(
        radius: AppCard.bigRadius,
        onTap: () => showScrollBottomSheet(
          context: context,
          builder: (context) => BottomSheetStopien(
            title: 'Podharcmistrz\nPodharcmistrzyni',
            color: AppSettings.isDark?cardEnab_(context):AppColors.stop_phm,
            textColor: AppSettings.isDark?textEnab_(context):Colors.white,
            idea: 'Określa kierunki swojego rozwoju i je realizuje. Pracuje nad własnymi słabościami, przełamując je. Przykładem osobistym świadomie i pozytywnie oddziałuje na otoczenie. Rozumie ludzi i otaczającą go rzeczywistość – reaguje na ich potrzeby. Systematycznie stosuje służbę jako narzędzie harcerskiej pracy wychowawczej. Potrafi zauważyć sytuacje problemowe i je rozwiązywać. Umie spojrzeć na nie szerzej, niż tylko z perspektywy własnego środowiska. Buduje swój autorytet. Doskonali swą wiedzę i umiejętności wychowawcze. Dzieli się nimi z kadrą. Świadomie i konsekwentnie stosuje metodę harcerską. Pracuje w zespole instruktorskim. Ma własny pogląd na sprawy nurtujące jego środowisko harcerskie. Wzmacnia tożsamość harcerstwa.',
            warOtw: const [
              'Pozytywnie oceniona praca instruktorska przez co najmniej 12 miesięcy od przyznania stopnia przewodnika.',
              'Zaliczona służba instruktorska.',
              'Ukończone 18 lat.',
              'Przedstawienie KSI programu swojej próby zapewniającego realizację wymagań.',
              'Brał udział w doskonaleniu zastępowych, przybocznych.',
              'Ma doświadczenie na funkcji drużynowego lub przybocznego.',
            ],
            zadania: const [
              'Wykazał się umiejętnością pracy nad sobą, stawiania celów w życiu, podejmowania działań (do ich realizacji), ich oceny i wyciągania wniosków.',
              'Podnosi swoje umiejętności i kwalifikacje.',
              'Bierze czynny udział w życiu otaczającego go środowiska społecznego.',
              'W swojej pracy instruktorskiej świadomie wykorzystuje służbę.',
              'Wykazał się umiejętnością pracy w zespole, komunikowania się oraz motywowania innych. Zrealizował zadanie instruktorskie na poziomie szczepu lub hufca.',
              'Pogłębił znajomość harcerskiego systemu wychowawczego oraz zasad metodyki grup wiekowych.',
              'Stosuje metodę harcerską w pracy z instruktorami.',
              'Świadomie stosuje System pracy z kadrą.',
              'Pracuje nad swoją postawą instruktorską. Doskonali swoje umiejętności harcerskie i instruktorskie – w trakcie próby brał udział w minimum 2 wybranych formach kształceniowych.',
              'Przygotował się do roli opiekuna próby na stopnie instruktorskie.',
              'Pozyskał sojuszników do działalności harcerskiej.',
              'Pełnił funkcję instruktorską w czasie roku harcerskiego i był członkiem komendy kolonii/obozu lub zimowiska.',
              'Orientuje się w historii i aktualnej sytuacji harcerstwa. Korzysta z harcerskiej literatury i mediów. Przeczytał minimum 3 wybrane książki harcerskie.',
              'Wykazał się znajomością przepisów finansowych i organizacyjnych oraz zasad prowadzenia obozu harcerskiego odpowiadających wymaganiom stawianym kierownikom wypoczynku.',
              'Wykazał się umiejętnością pozyskiwania środków na działalność harcerską.',
            ],
            warZamk: const [
              'Osiągnięcie poziomu opisanego w idei stopnia i zrealizowanie wymagań próby.',
              'Pozytywnie oceniona praca instruktorska w okresie realizacji próby.',
              'Ukończenie kursu podharcmistrzowskiego.'
            ],
            oznaczenie: 'Oznaką stopnia podharcmistrza jest zielona podkładka pod Krzyżem Harcerskim i zielona lilijka na lewym rękawie munduru.',
          ),
        ),
        child: Center(
          child: AutoSizeText(
            'phm',
            style: AppTextStyle(fontSize: 48.0, fontWeight: weight.halfBold, color: AppColors.stop_phm),
            textAlign: TextAlign.center,
            group: sizeGroup,
          ),
        )
    );

    Widget cardHM = SimpleButton(
        radius: AppCard.bigRadius,
        onTap: () => showScrollBottomSheet(
          context: context,
          builder: (context) => BottomSheetStopien(
            title: 'Harcmistrz\nHarcmistrzyni',
            color: AppSettings.isDark?cardEnab_(context):AppColors.stop_hm,
            textColor: AppSettings.isDark?textEnab_(context):Colors.white,
            idea: 'Dba o swój wszechstronny rozwój. Stara się dotrzeć do prawdy o sensie życia. Konsekwentnie realizuje swoje cele życiowe. Osiągnął założoną przez siebie dojrzałość w życiu rodzinnym, zawodowym i społecznym. Kreuje rzeczywistość. Jest znaczącą osobowością w zespole instruktorskim, z którym aktywnie pracuje w środowisku swojego działania. Dzieli się własnymi doświadczeniami życiowymi i wychowawczymi i przekłada je na trwały dorobek. Po mistrzowsku stosuje harcerski system wychowawczy. Ma dużą wiedzę i umiejętności w zakresie samodzielnego kierowania zespołem. Potrafi inspirować i organizować swoje środowisko do potrzebnego społecznie działania. Wpływa na oblicze harcerstwa, buduje jego tożsamość. Jest wzorem dla instruktorów.',
            warOtw: const [
              'Pozytywnie oceniona praca instruktorska przez co najmniej 12 miesięcy od przyznania stopnia podharcmistrza.',
              'Zaliczona służba instruktorska.',
              'Ukończone 21 lat.',
              'Przedstawienie KSI programu swojej próby zapewniającego realizację wymagań.',
              'Udział w kształceniu kadry.'
            ],
            zadania: const [
              'W świadomy sposób określa i realizuje własne plany życiowe.',
              'Pogłębia swoją wiedzę zawodową.',
              'Poza swoimi zainteresowaniami zawodowymi poznaje wybraną dziedzinę nauki lub kultury.',
              'Świadomie stosuje harcerski system wychowawczy, upowszechnia go i dzieli się własnymi doświadczeniami.',
              'Przygotował się do roli opiekuna próby na stopień podharcmistrza i harcmistrza.',
              'Kierował zespołem instruktorskim. W jego działaniu kształtował postawy oraz poszerzał wiedzę i umiejętności instruktorów.',
              'Wykazał się skutecznym stosowaniem Systemu pracy z kadrą w kierowanym przez siebie zespole instruktorskim.',
              'Zrealizował zadanie instruktorskie na poziomie chorągwi lub Związku.',
              'Opracował i upowszechnił materiały programowo-metodyczne jako wkład w dorobek Związku.',
              'W trakcie próby ukończył kurs harcmistrzowski lub aktywnie uczestniczył w minimum 2 innych formach wymiany doświadczeń poziomu harcmistrzowskiego (kursy, warsztaty, seminaria, konferencje itp.).'
            ],
            warZamk: const [
              'Osiągnięcie poziomu opisanego w idei stopnia i zrealizowanie wymagań próby.',
              'Osiągnięcie sukcesu w wybranej dziedzinie.',
                'Prowadzenie obozu (kolonii) lub zimowiska w okresie od zdobycia stopnia podharcmistrza. Uzyskanie pozytywnej oceny swojej pracy.',
                'Pozytywnie oceniona praca instruktorska w okresie realizacji próby.',
                'Pełnienie funkcji opiekuna pozytywnie zakończonej próby na stopień instruktorski w okresie od zdobycia stopnia podharcmistrza.',
            ],
            oznaczenie: 'Oznaką stopnia harcmistrza jest czerwona podkładka pod Krzyżem Harcerskim i czerwona lilijka na lewym rękawie munduru.',
          ),
        ),
        child: Center(
          child: AutoSizeText(
            'hm',
            style: AppTextStyle(fontSize: 48.0, fontWeight: weight.halfBold, color: AppColors.stop_hm),
            textAlign: TextAlign.center,
            group: sizeGroup,
          ),
        )
    );

    if(MediaQuery.of(context).orientation == Orientation.portrait)
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: cardPWD
          ),
          Expanded(
              flex: 1,
              child: cardPHM
          ),
          Expanded(
              flex: 1,
              child: cardHM
          )
        ]
      );
    else
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: cardPWD
          ),
          Expanded(
              flex: 1,
              child: cardPHM
          ),
          Expanded(
              flex: 1,
              child: cardHM
          )
        ],);
  }
}

class BottomSheetStopien extends StatelessWidget{

  final String title;
  final Color? color;
  final Color? textColor;
  final String idea;
  final List<String> warOtw;
  final List<String> zadania;
  final List<String> warZamk;
  final String oznaczenie;

  const BottomSheetStopien({
      required this.title,
      required this.color,
      required this.textColor,
      required this.idea,
      required this.warOtw,
      required this.zadania,
      required this.warZamk,
      required this.oznaczenie,
      Key? key,
  }): super(key: key);

  Widget getListWidget(List<String> elements){

    List<Widget> children = [];

    for(int i=0; i< elements.length; i++)
      children.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    child: Text('${i+1}.', style: AppTextStyle(color: textColor, fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
                  ),
                  Expanded(
                    child: Text(elements[i], style: AppTextStyle(color: textColor, fontSize: Dimen.TEXT_SIZE_BIG)),
                  )
                ]
            ),
          )
      );


    return Column(children: children);

  }

  @override
  Widget build(BuildContext context) {

    return BottomSheetDef(
      title: title,
      color: color,
      textColor: textColor,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Idea:', style: AppTextStyle(color: textColor, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.defMarg),
          SelectableText(idea, style: AppTextStyle(color: textColor, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.justify,),

          const SizedBox(height: 2*Dimen.ICON_MARG),
          Text('Warunki otwarcia:', style: AppTextStyle(color: textColor, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.defMarg),
          getListWidget(warOtw),

          const SizedBox(height: 2*Dimen.ICON_MARG),
          Text('Zadania:', style: AppTextStyle(color: textColor, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.defMarg),
          getListWidget(zadania),

          const SizedBox(height: 2*Dimen.ICON_MARG),
          SelectableText('Warunki zamknięcia:', style: AppTextStyle(color: textColor, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.defMarg),
          getListWidget(warZamk),

          const SizedBox(height: 2*Dimen.ICON_MARG),
          Text('Oznaczenie:', style: AppTextStyle(color: textColor, fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.defMarg),
          SelectableText(oznaczenie, style: AppTextStyle(color: textColor, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.justify,),
        ],),
    );
  }
}