import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:tuple/tuple.dart';

const String ASSETS_PATH = 'assets/images/symb/';

List<ItemData> items = [
  ItemData(
    Colors.blue,
    'flag_poland.svg',
    'Flaga Polski',
    [
      const Tuple2('Biały kolor', 'Czystość i szczerość'),
      const Tuple2('Czerwony kolor', 'Krew poległych w obronie Ojczyzny.')
    ],
    'W czasie Powstania Listopadowego Sejm ustanowił biel i czerwień barwami narodowymi. Białoczerwonych opasek używano podczas wszystkich zrywów powstańczych w XIX i XX wieku.',
    padding: false,
    colorStart: Colors.white,
    colorEnd: Colors.white,
    childBuilder: (context) => Center(
      child: AppCard(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        elevation: AppCard.bigElevation,
        child: Column(
          children: [
            Expanded(
              child: Container(width: MediaQuery.of(context).size.width, height: double.infinity, color: Colors.white),
            ),
            Expanded(
              child: Container(width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.width/3, color: Colors.redAccent),
            )
          ],
        )

        //Flag('PL', width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.width/1.5, fit: BoxFit.cover,),
      ),
    ),
  ),
  const ItemData(
    Colors.white,
    'herb_polski.svg',
    'Herb Polski',
    [
      Tuple2('Biały orzeł', 'Niezależność państwa od innych krajów.'),
      Tuple2('Biel', 'Srebro, wodę oraz pod względem duchowym – czystość i niepokalanie. Jest to nawiązanie do Matki Boskiej, która jest patronką Polski.'),
      Tuple2('Czerwień', 'Ogień, odwaga oraz waleczność.'),
      Tuple2('Korona', 'Symbol królewskości oraz pełnej niepodległości.'),
    ],
    'Zgodnie z legendą spisanej po raz pierwszy w Kronice wielkopolskiej w 1273 roku, założyciel Państwa Polan - Lech - podczas postoju w okolicach Poznania ujrzał wieczorem gniazdo na drzewie. Znajdował się z nim biały orzeł z trzema pisklętami. Podczas gdy Lech przyglądał mu się, orzeł rozpostarł skrzydła na tle nieba czerwonego od zachodzącego słońca. Zachwycony tym widokiem Lech postanowił nazwać owo miejsce Gniezdnem (obecnie Gniezno), od słowa "gniazdo", zaś białego orła na czewonym tle użył jako swego herbu.'
        '\n\nW przeszłości PRL pozbawił orła państwowego korony. Pokazano tym symbolem, że w latach 1944-1989 nie byliśmy w pełni suwerennym państwem. Orzeł niekoronowany czyli w warunkach polskich – orzeł książęcy – był mniej ważny od orła ukoronowanego, czyli orła królewskiego. Korona wróciła na głowę polskiego orła po przemianach w 1989 roku.',
    padding: false,
    colorStart: Colors.red,
    colorEnd: Color.fromARGB(255, 190, 0, 40),
  ),
  const ItemData(
    Colors.black,
    'krzyz_harc.svg',
    'Krzyż harcerski',
    [
      Tuple2('Okrąg pośrodku krzyża', 'Doskonałość.'),
      Tuple2('Promienie rozchodzące się od lilijki', 'Obejmowanie jak najszerszych kręgów społecznych przez harcerstwo, jak największą liczbę dzieci i młodzieży.'),
      Tuple2('Wieniec z dębu i wawrzynu (liści laurowych)', 'Cele do zdobycia: siłę, umiejętności, sprawność i wiedzę. Dąb jednocześnie symbolizuje męstwo, a laur zwycięstwo.'),
      Tuple2('Hasło "Czuwaj"', 'Wezwanie harcerzy do nieustannej służby.'),
      Tuple2('Ziarna piasku na ramionach Krzyża Harcerskiego', 'Ogromna liczba członków naszego ruchu na całym świecie.'),
      Tuple2('Puste miejsce pomiędzy ziarenkami piasku', 'Stale pozostawione miejsce dla nowych harcerzy.'),
      Tuple2('Dwie gwiazdki na lilijce', 'Czujne oczy harcerza (Prawo i Przyrzeczenie harcerskie).'),
      Tuple2('Trzy żołędzie na wieńcu dębowym krzyża', 'Trzy rozbiory Polski.'),
    ],
    'Krzyż Harcerski jest wzorowany na orderze Virtuti Militari, przyznawanym za szczególne męstwo i dzielność w służbie dla Ojczyzny. Harcerz otrzymuje go po złożeniu przyrzeczenia harcerskiego i nosi go 2 cm nad lewą kieszenią koszuli mundurowej (przypięty w wyznaczonym miejscu).',
    colorStart: Colors.white,
    colorEnd: Colors.white,
  ),
  ItemData(
    Colors.black,
    'lilijka_zhp.svg',
    'Lilijka ZHP',
    [
      const Tuple2('O, N, C', 'Skrót słów: Ojczyzna, Nauka, Cnota – hasła Zgromadzenia Filaretów.'),
      const Tuple2('Trzy ramiona', 'Służba Bogu, ojczyźnie i bliźnim'),
      const Tuple2('Środkowa igła lilijki', 'Podążanie w słusznym kierunku, wyznaczonym zgodnie z ideałami Prawa i Przyrzeczenia Harcerskiego'),
      const Tuple2('Węzeł z napisem ZHP', 'Węzeł płaski, łączący w jedno trzy ramiona lilijki.'),

    ],
    'Od początków chrześcijaństwa lilijka symbolizuje cnotę i czystość. Na swych szatach nosili ją królowie, na sztandarach - książęta, na herbach - rycerze.'
    '\n\nZgromadzenie Filaretów, do którego hasła odnoszą się litery O, N, C, działał w Wilnie w latach 1820-1823. Hasło zaczerpnięte zostało z wiersza jednego z filaretów, Adama Mickiewicza, pt. „Pieśń Filaretów”. Filareta to słowo zaczerpnięte z jęz. greckiego (philáretos), oznaczające „miłośnik cnoty moralnej”.',
    colorStart: Colors.blueGrey[600],
    colorEnd: Colors.grey[600],
  ),
  ItemData(
    Colors.black,
    'lilijka_zhr.svg',
    'Lilijka ZHR',
    [
      const Tuple2('O, N, C', 'Skrót słów: Ojczyzna, Nauka, Cnota – hasła Zgromadzenia Filaretów.'),
      const Tuple2('Trzy ramiona', 'Służba Bogu, ojczyźnie i bliźnim'),
      const Tuple2('Środkowa igła lilijki', 'Podążanie w słusznym kierunku, wyznaczonym zgodnie z ideałami Prawa i Przyrzeczenia Harcerskiego'),
      const Tuple2('Węzeł z napisem ZHR', 'Węzeł płaski, łączący w jedno trzy ramiona lilijki.'),

    ],
    'Od początków chrześcijaństwa lilijka symbolizuje cnotę i czystość. Na swych szatach nosili ją królowie, na sztandarach - książęta, na herbach - rycerze.'
        '\n\nZgromadzenie Filaretów, do którego hasła odnoszą się litery O, N, C, działał w Wilnie w latach 1820-1823. Hasło zaczerpnięte zostało z wiersza jednego z filaretów, Adama Mickiewicza, pt. „Pieśń Filaretów”. Filareta to słowo zaczerpnięte z jęz. greckiego (philáretos), oznaczające „miłośnik cnoty moralnej”.',
    colorStart: Colors.grey[600],
    colorEnd: const Color.fromARGB(255, 150, 90, 80),
  ),

  const ItemData(
      Colors.amber,
      'fse.svg',
      'Flaga FSE',
      [
        Tuple2('Tło ciemne i jasne', 'Zmartwychwstanie Chrystusa, który przeprowadził nas z cienia śmierci do światła życia wiecznego.'),
        Tuple2('Osiem ramion krzyża', 'Osiem błogosławieństw z Kazania na górze (Mt 5,1-12).'),
        Tuple2('Lilijka', 'Symbol wybrany przez Baden-Powella jako znak wszystkich skautów świata. Na starych mapach lilijką oznaczano północ, czyli pokazuje nam kierunek, którego należy się trzymać. W heraldyce jest zaś ona symbolem czystości, która jest jedną z cnót harcerskich.'),
      ],
      'Na maszcie flaga FSE zawsze zajmuje centralne miejsce, a żadna inna flaga nie powinna powiewać ponad nią - symbolizuje ona służbę Bogu.',
      colorStart: AppColors.fseBackgroundDark,
      colorEnd: Colors.white,
      sharpBackgroundEdge: true
  ),

  ItemData(
      AppColors.symb_wagggs_text,
      'WAGGGS.svg',
      'WAGGGS',
      [
        const Tuple2('Trzy listki koniczyny', 'Trzy zobowiązania wobec Boga, bliźnich i ojczyzny zawarte w Przyrzeczeniu Skautowym.'),
        const Tuple2('Dwie pięcioramienne gwiazdki', 'Prawo i Przyrzeczenie, a ich 10 ramion – 10 punktów Prawa.'),
        const Tuple2('Żyłka koniczynki', 'Igła kompasu, który pokazuje skautkom i przewodniczkom dobrą drogę.'),
        const Tuple2('Łodyżka koniczyny', 'Płomień miłości międzyludzkiej.'),
        const Tuple2('Kolory złoty i niebieski', 'Słońce świecące dzieciom na całym świecie.'),
      ],
      'Znak przynależności zuchów i harcerek do Światowego Stowarzyszenia Przewodniczek i Skautek (WAGGGS). noszony na lewej kieszeni bluzy mundurowej - złota koniczyna na niebieskim tle.',
      colorStart: Colors.lightBlueAccent,
      colorEnd: Colors.blue,

      childBuilder: (context) => Center(
        child: AppCard(
          color: Colors.transparent,
          radius: 1000,
          elevation: AppCard.bigElevation,
          padding: EdgeInsets.zero,
          child: AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset('${ASSETS_PATH}WAGGGS.svg', fit: BoxFit.contain),
          ),
        ),
      )
  ),
  ItemData(
      AppColors.symb_wosm_text,
      'WOSM.svg',
      'WOSM',
      [
        const Tuple2('Lilijka', 'Symbol przypisany przez Baden-Powella zwiadowcom armii brytyjskiej, który następnie został zmodyfikowany dla skautingu.'),
        const Tuple2('Strzałka', 'Igła kompasu wskazującą północ, rozumiana jako symbol służby i jedności.'),
        const Tuple2('Trzy ramiona lilijki', 'Obowiązki wobec Boga, bliźnich i siebie.'),
        const Tuple2('Dwie pięcioramienne gwiazdki', 'Prawda i wiedza, a ich dziesięć ramion – punkty prawa skautowego.'),
        const Tuple2('Kolor biały', 'Czystość.'),
        const Tuple2('Kolor purpurowy', 'Odpowiedzialność i pomoc bliźnim.'),
        const Tuple2('Lina związana węzłem płaskim', 'Jedność i braterstwo skautów.'),
      ],
      'Znak przynależności zuchów i harcerzy do Światowej Organizacji Ruchu Skautowego (WOSM) noszony na lewej kieszeni bluzy mundurowej - biała lilijka otoczona liną związana skautowym węzłem, umieszczona na purpurowym tle.',
      colorStart: Colors.deepPurpleAccent,
      colorEnd: Colors.indigo,

      childBuilder: (context) => Center(
        child: AppCard(
          color: Colors.transparent,
          radius: 1000,
          elevation: AppCard.bigElevation,
          padding: EdgeInsets.zero,
          child: AspectRatio(
            aspectRatio: 1,
            child: SvgPicture.asset('${ASSETS_PATH}WOSM.svg', fit: BoxFit.contain),
          ),
        ),
      )
  ),
  const ItemData(
    AppColors.textDefEnab,
    'znaczek_zucha.svg',
    'Znaczek zucha',
    [
      Tuple2('Słońce', 'Radość.'),
      Tuple2('Promienie słońca', 'Gotowość służenia i niesienia pomocy innym, świecenie przykładem.'),
      Tuple2('Czyste niebo', 'Pogoda ducha.'),
      Tuple2('Orzeł', 'Odwaga, męstwo i dzielność.'),
      Tuple2('Napis "ZUCH"', 'Przynależność do ZHP.'),
    ],
    'Zuch otrzymuje znaczek po złożeniu Obietnicy i nosi go 2 cm nad lewą kieszenią koszuli mundurowej (przypięty w wyznaczonym miejscu).',
    colorStart: Colors.lightBlueAccent,
    colorEnd: Colors.deepPurpleAccent,
  ),
  const ItemData(
    AppColors.textDefEnab,
    'harcerze_starsi.svg',
    'Starszoharcerska róża wiatrów',
    [
      Tuple2('Ramiona róży wiatrów', 'Cztery kierunki rozwoju: intelektualny, społeczny, duchowy i emocjonalny oraz fizyczny.'),
      Tuple2('Równa długość ramion róży wiatrów', 'Rozwój obszarów: intelektualnego, społęcznego, emocjonalnego i fizycznego powinine być równoważny.'),
      Tuple2('Róża wiatrów', 'Poszukiwanie kierunku, swojego miejsca, pasji, służby, wyjście w nieznane'),
    ],
    'Róża Wiatrów ma przypominać o właściwym kierunku i, w przypadku zbłądzenia, pomagać wrócić na właściwy szlak. To dzięki niej każdy z nas może obrać właściwy kierunek: w harcerstwie, w rodzinie, w szkole, w pracy oraz w życiu.',
    colorStart: Color.fromARGB(255, 25, 64, 147),
    colorEnd: Color.fromARGB(255, 25, 64, 147),
    padding: false
  ),
  ItemData(
    AppColors.symb_naramiennik_text,
    'naramiennik.svg',
    'Naramiennik wędrowniczy',
    [
      const Tuple2('Trzy polana ogniska', 'Służba, szukanie miejsca w społeczeństwie, praca nad sobą.'),
      const Tuple2('Mały płomień ogniska', 'Siła ciała.'),
      const Tuple2('Średni płomień ogniska', 'Siła rozumu.'),
      const Tuple2('Duży płomień ogniska', 'Siła ducha.'),
      const Tuple2('Zielone tło', 'Las, puszczaństwo.'),
    ],
    'Watra noszona na lewym naramienniku munduru symbolizuje świadomą życiową wędrówkę – zarówno intelektualną, jak i fizyczną – po własnej miejscowości, regionie, Polsce, Europie i świecie.',
    colorStart: Colors.green[700],
    colorEnd: Colors.brown[600],
  )
];

class ItemData{

  final Color? colorStart;
  final Color? colorEnd;
  final Color textColor;
  final String fileName;

  final String title;
  final List<Tuple2<String, String>> content1;
  final String content2;

  final bool padding;

  final Widget Function(BuildContext context)? childBuilder;
  final bool sharpBackgroundEdge;

  const ItemData(
      this.textColor,
      this.fileName,
      this.title,
      this.content1,
      this.content2,
      {
        this.padding = true,
        required this.colorStart,
        required this.colorEnd,
        this.childBuilder,
        this.sharpBackgroundEdge = false,
      });

}