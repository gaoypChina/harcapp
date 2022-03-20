import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import '../../../_common_classes/org/org_indicator.dart';

const List<Item> events_1 = [
  Item('Oblężenie <b>Mafekingu</b> podczas wojny <b>Anglików</b> z <b>Burami</b>. Robert Baden-Powell szkoli młodych chłopców na "<b>skautów</b>". Zajmują się wywiadem, łącznością, podchodzeniem, tropieniem, pierwszą pomocą.',
      '1899 r.'),
  Item('Początki skautingu w Anglii.',
      '1907 r.'),
  Item('Pierwszy obóz na <b>wyspie Brownsea</b>.',
      '29 lipca 1907 r.'),
  Item('Ukazuje się książka Baden-Powella "<b>Skauting dla chłopców</b>" (Scouting for Boys).',
      '1908 r.'),
  Item('Pierwsze wiadomości o skautingu docierają do Polski.',
      '1909 r.'),
  Item('<b>Andrzej Małkowski</b> przetłumaczył na język polski podręcznik Roberta Baden-Powella "Skauting dla chłopców" ("Scouting for boys") (początkowo w ramach kary wymierzonej za spóźnienie się na ćwiczenia "<b>Zarzewia</b>").',
      'listopad 1909 r.'),
  Item('Rozkazem Andrzeja Małkowskiego <b>we Lwowie</b> powołane zostały cztery <b>pierwsze polskie drużyny skautowe</b>.',
      '1910 r.'),
  Item('Opracowanie przez ks. Kazimierza Lutosławskiego projektu <b>Krzyża Harcerskiego</b>.',
      'Maj 1911 r.'),
  Item('Wszechbrytyjski Zlot Skautów w Birmingham.',
      '1912 r.'),
  Item('<b>Olga Małkowska</b> utworzyła w Zakopanem pierwszą gromadę "Krasnoludków".',
      '1913 r.'),
  Item('Zjazd połączeniowy w Lublinie, na którym zostało uchwalone połączenie się harcerstwa w jedną organizację noszącą nazwę <b>Związku Harcerstwa Polskiego</b>.',
      '1-2 listopada 1918 r.'),
  Item('Założenie Międzynarodowej Organizacji Ruchu Skautowego <b>WOSM</b> (World Organization of the Scout Movement). Związek Harcerstwa Polskiego jest jednym z członków-założycieli.',
      '1920 r.'),
  Item('I Zlot Międzynarodowy (Jamboree) w Londynie. Roberta Baden-Powella obwołano <b>Naczelnym Skautem Świata</b>. Do londyńskiej Olympia Hall przybyło około 8000 skautów z 34 krajów.',
      '1920 r.'),
  Item('Pierwszy Walny Zjazd ZHP, który zatwierdza treść <b>Prawa i Przyrzeczenia Harcerskiego</b>, opartego na tekstach z roku 1911.',
      '31 grudnia 1920 r. - 2 stycznia 1921 r.'),
  Item('Założenie Światowego Stowarzyszenia Przewodniczek i Skautek <b>WAGGGS</b> (World Association of Girl Guides and Girl Scouts). Związek Harcerstwa Polskiego jest jednym z członków-założycieli.',
      '1928 r.'),
  Item('Zostaje zakończona budowa flagowego okrętu polskiego harcerstwa – "<b>Zawiszy Czarnego</b>".',
      '17 czerwca 1935 r.'),
  Item('Rejestracja harcerzy i harcerek powyżej 15 roku życia, którzy mogą być przydatni do prowadzenia służby pomocniczej Wojsku Polskiemu w przypadku konfliktu zbrojnego.',
      'wiosna 1938 r.'),
];

const List<Item> events_2 = [
  Item('Wybucha <b>II wojna światowa</b>. Harcerze i instruktorzy biorą udział w walkach na froncie i obronie miast i miasteczek. Pełnią także służbę sanitarną i łącznościową.',
      '1 września 1939 r.'),
  Item('W warszawskim mieszkaniu Tadeusza Borowieckiego. Przy ulicy Noakowskiego 12 w Warszawie podjęto decyzję o przejściu ZHP "<b>do podziemia</b>". Nazwę <b>Szare Szeregi</b> przyjęto najprawdopodobniej w okolicach grudnia 1939 roku. Przyjęto nazwy: "Pasieka" – Główna Kwatera, "Ul" – chorągiew, "Rój" - hufiec, "Rodzina" - drużyna, "Pszczoła" - zastęp.',
      '27 września 1939 r.'),
  Item('Zostaje wprowadzony program: "<b>Dziś-Jutro-Pojutrze</b>". "Dziś" - czas przygotowania do walki z okupantem; "Jutro" - jawna, otwarta walka; "Pojutrze" - nauka i praca w wolnej Polsce.',
      '22 czerwca 1941 r.'),
  Item('"<b>Akcja pod Arsenałem</b>": akcja odbicia więźniów przewożonych z alei Szucha do więzienia na Pawiaku, m.in Janka Bytnara - "Rudego". W wyniku ran odniesionych w akcji zginął Aleksy Dawidowski "Alek", natomiast "Rudego", ciężko skatowanego, nie udało się uratować.',
      '26 marca 1943 r.'),
  Item('"<b>Akcja Celestynów</b>": uwolnienie 49 więźniów na stacji kolejowej Celestynów. 4 żołnierzy niemieckich zabito.',
      '20 maja 1943 r.'),
  Item('"<b>Akcja Sieczychy</b>": atak na niemiecki posterunek w Sieczychach, podczas którego zginął tylko Tadeusz Zawadzki "Zośka". Dla jego upamiętnienia jednemu z harcerskich batalionów, walczącym w Powstaniu Warszawskim, nadano jego imię.',
      '20 sierpnia 1943 r.'),
  Item('Wybuch trwającego 63 dni <b>Powstania Warszawskiego</b>, w którym udział biorą bataliony harcerskie "Zośka" i "Parasol". Ciężkie walki, choć także z sukcesami - np. zdobyciem dwóch niemieckich czołgów, czy uwolnieniem 350 Żydów - odbiły się na stanie liczebnym obu batalionów, które ostatecznie połączono w jeden. Po upadku powstania "Pasieka" przenosi się do Krakowa.',
      '1 sierpnia 1944 r.'),
  Item('Rzeź Woli - <b>niemieckie ludobójstwo</b> na cywilach polskich, mieszkańcach warszawskiej dzielnicy Wola. W ciągu kilku dni zginęło od 30 tys. do 70 tys. polskich mężczyzn, kobiet i dzieci.',
      'sierpnień 1944 r.'),
  Item('Szare Szeregi zostają rozwiązane przez Naczelnika Szarych Szeregów – Leona Marszałka.',
      '18 stycznia 1945 r.'),
];

const List<Item> events_3 = [
  Item('Liczne akcje CAS - <b>Centralne Akcje Szkoleniowe</b>, w ramach których przygotowuje się nowe kadry harcerskie.',
      '1945-1946 r.'),
  Item('Powstaje HSP - Harcerska Służba Polsce. Jej cel to wsparcie w odbudowie Polski. Następuje również połączenie, wcześniej rozdzielonych, pionów męskiego i żeńskiego.',
      '1948 r.'),
  Item('ZHP zostaje wcielone w struktury Związku Młodzieży Polskiej.',
      '15 października 1950 r.'),
  Item('Powstaje Organizacja Harcerska Związku Młodzieży Polskiej. Opiera się ona na wzorze radzieckim, niestosując harcerskich zasad. Członkowie OH ZMP noszą białe koszule z czerwonymi chustami.',
      '1 czerwca 1951 r.'),
  Item('Dochodzi do powstania Organizacji Harcerskiej Polski Ludowej (OHPL). Wyodrębnia się ona z OH ZMP. Powraca harcerski mundur i nazewnictwo.',
      '1956 r.'),
  Item('W Łodzi obraduje zjazd, podczas którego dochodzi do <b>reaktywowania ZHP</b> ze wszystkimi tradycjami, umundurowaniem.',
      '8-10 grudnia 1956 r.'),
  Item('Powstanie <b>Federacji Skautingu Europejskiego</b>.',
      '1 listopada 1956 r.', tags: [Item.TAG_FSE]),
  Item('Odejście z ZHP wielu instruktorów szaroszeregowych. Rezygnacja hm. Aleksandra Kamińskiego z funkcji Przewodniczącego Naczelnej Rady Harcerskiej ZHP.',
      '1958 r.'),
  Item('Powstanie Nieprzetartego Szlaku, w ramach którego instruktorzy harcerscy pracują z dziećmi i młodzieżą niepełnosprawną.',
      '1958 r.'),
  Item('Powstanie w Warszawie porozumienia Kręgów Instruktorów Harcerskich im. A. Małkowskiego (<b>KIHAM</b>).',
      '22 listopada 1980 r.'),
  Item('Na konferencjach sprawozdawczo–wyborczych hufców ZHP komendantami wybrano instruktorów <b>Ruchu Harcerskiego Rzeczypospolitej</b>: w Zakopanem – Piotra Bąka, w Opolu – Jerzego Mikę, w Krakowie–Krowodrzy – Wojciecha Hausnera, w Krakowie-Śródmieściu – Kazimierza Wiatra. W następne konferencje chorągwi pokazują niemożliwe przekształcenie wewnętrzne ZHP w zgodzie z założeniami wypracowanymi przez RHR. Na Pomorzu działa tzw. "mały" ZHR, na południu Polski Związek Drużyn Kotliny Kłodzkiej.',
      'październik-listopad 1988 r.', tags: [Item.TAG_ZHP, Item.TAG_ZHR]),
  Item('Powstaje <b>Porozumienie Niezależnych Środowisk i Organizacji Harcerskich</b> z udziałem m.in. POH, Klubu "Promienistych" z Lublina, I NDH ze Stalowej Woli i Niezależnego Harcerskiego Ruchu Liturgicznego.',
      '1 października 1988 r.', tags: [Item.TAG_ZHR]),
  Item('Rada Ruchu Harcerskiego postanowiła ujawnić struktury i przyjąć nazwę <b>Ruch Harcerski Rzeczypospolitej</b> (RHR).',
      '8 października 1988 r.', tags: [Item.TAG_ZHR]),
  Item('W Warszawie trwają obrady "okrągłego stołu". Po stronie opozycyjnej w sprawach harcerskich występują W. Wróblewski i M. Frąckowiak. Leszek Miller, reprezentujący PZPR, przed kamerami telewizji wypowiada słowa: "harcerstwa partia nie odda".',
      'luty-kwiecień 1989 r.', tags: [Item.TAG_ZHP, Item.TAG_ZHR]),
  Item('<b>Powstanie Związku Harcerstwa Rzeczypospolitej.</b>\n51 instruktorów harcerstwa niezależnego i niepokornego na spotkaniu w kościele św. Zygmunta w Warszawie, po długiej i gorącej dyskusji, uznało się za Komitet Założycielski Związku Harcerstwa Rzeczypospolitej.',
      '12 lutego 1989 r.', tags: [Item.TAG_ZHR]),
  Item('Na spotkaniu w Warszawie przedstawione zostają deklaracje drużyn i środowisk o woli <b>opuszczenia ZHP i budowie ZHR</b>. Takich deklaracji nie składają przedstawiciele środowiska krakowskiego, zakopiańskiego, części Opola. Instruktorzy krakowscy nie akceptują tworzenia nowej organizacji, oczekując że <b>nastąpi reaktywowanie dawnego ZHP</b>.',
      '25 lutego 1989 r.', tags: [Item.TAG_ZHR]),
  Item('Instruktorzy środowiska krakowskiego zebrani w krypcie kościoła OO. Dominikanów podejmują decyzję o powołaniu <b>Komitetu Odrodzenia ZHP</b> (r. z. 1918) i tymczasowego zarządu okręgu małopolskiego, w oparciu o Statut z roku 1936.',
      '19 marca 1989 r.', tags: [Item.TAG_ZHP, Item.TAG_ZHR]),
  Item('Naczelnik ZHR powołuje trzy pierwsze chorągwie: Mazowiecką, Pomorską i Dolnośląską.',
      '22 maja 1989 r.', tags: [Item.TAG_ZHR]),
  Item('W ZHR odbywa się seria konferencji programowych w Toruniu, Lublinie i Krakowie zajmujących się regulaminami, systemem stopni harcerskich.',
      'listopad 1989 r.', tags: [Item.TAG_ZHR]),
  Item('W ZHR działa ok. 10 tysięcy harcerek, harcerzy, instruktorek i instruktorów.',
      'grudzień 1989 r.', tags: [Item.TAG_ZHR]),
  Item('Powstanie <b>Stowarzyszenia Harcerstwa Katolickiego "Zawisza"</b> Federacji Skautingu Europejskiego.',
      '2 grudnia 1989 r.', tags: [Item.TAG_FSE]),
];

const List<Item> events_4 = [
  Item('XXVI Zjazd ZHP (o podwójnej numeracji, od tej daty kolejność zjazdów liczy się od roku 1920) uchwala nowy statut, a także Prawo i Przyrzeczenie Harcerskie.',
      '1989 r.', tags: [Item.TAG_ZHP]),
  Item('XVIII Zjazd ZHP w Bydgoszczy podczas którego zostaje przyjęty nowy statut, w którym mowa o dwóch alternatywnych wersjach Przyrzeczenia Harcerskiego.',
      '6-9 grudnia 1990 r.', tags: [Item.TAG_ZHP]),
  Item('Zjednoczenie ZHR i ZHP-1918 (Związku Harcerstwa Polskiego rok założenia 1918).',
      '3 października 1992.', tags: [Item.TAG_ZHR]),
  Item('Zjazd ZHP przywraca historyczną (<b>przedwojenną</b>) rotę <b>Przyrzeczenia Harcerskiego</b>.',
      'czerwiec 1995 r.', tags: [Item.TAG_ZHP]),
  Item('ZHP powraca do struktur międzynarodowych organizacji skautowych: Światowej Organizacji Skautów (WOSM) i Światowego Stowarzyszenia Skautek i Przewodniczek (WAGGGS).',
      '1996 r.', tags: [Item.TAG_ZHP]),
  Item('Zjednoczenie ZHR i POH (Polskiej Organizacji Harcerskiej).',
      '23 listopada 1997 r.', tags: [Item.TAG_ZHR]),
  Item('Po reformie administracyjnej w kraju w ZHP funkcjonuje <b>17 chorągwi</b> (16 wojewódzkich i stołeczna).',
      '1999 r.', tags: [Item.TAG_ZHP]),
  Item('Jubileuszowy Zlot X-lecia ZHR w okolicach Lednicy.',
      '3–15 sierpnia 1999', tags: [Item.TAG_ZHR]),
  Item('Wejście w życie nowego podziału grup wiekowych w ZHP, dostosowanego do reformy edukacyjnej; zuchy (uczniowie klas 0-3 szkół podstawowych), harcerze (klasy 4-6), harcerze starsi (gimnazjaliści) i wędrownicy (16-25 lat).',
      'wrzesień 2003 r.', tags: [Item.TAG_ZHP]),
  Item('Z okazji 60 rocznicy wybuchu powstania warszawskiego równolegle zorganizowane zostały: III Narodowy Zlot Organizacji Harcerzy oraz Zlot Organizacji Harcerek "Bądź Gotów".',
      '28 lipca – 2 sierpnia 2004 r.', tags: [Item.TAG_ZHR]),
  Item('XXXIII Zjazd ZHP zobowiązuje nowe władze do wprowadzenia osobowości prawnej regionalnych oddziałów ZHP – chorągwi. Zostają przyjęte także "Podstawy wychowawcze".',
      'grudzień 2005 r.', tags: [Item.TAG_ZHP]),
  Item('Wejście w życie reformy mundurowej.',
      '2006 r.', tags: [Item.TAG_ZHP]),
  Item('ZHP wraz organizacjami zrzeszonymi w WOSM obchodzi 100-lecie skautingu. Odbywa się z tej okazji Zlot Związku Harcerstwa Polskiego w Kielcach, oraz Światowe Jamboree w Wielkiej Brytanii.',
      '2007 r.', tags: [Item.TAG_ZHP]),
  Item('ZHP obchodzi 90-lecie powstania Związku.',
      '2008 r.', tags: [Item.TAG_ZHP]),
  Item('w Koronowie koło Bydgoszczy odbywa się Jubileuszowy Zlot XX-lecia ZHR.',
      '3–9 sierpnia 2009 r.', tags: [Item.TAG_ZHR]),
  Item('ZHP obchodzi Jubileusz 100-lecia harcerstwa, z tej okazji odbywa Jubileuszowy Zlot ZHP w Krakowie.',
      '2010 r.', tags: [Item.TAG_ZHP]),
  Item('Instruktorska Wyprawa do Lwowa "Powrót do źródeł".',
      '20–22 maja 2011 r.', tags: [Item.TAG_ZHR]),
  Item('Jubileuszowy Zlot Stulecia Harcerstwa „Całym Życiem – Przygoda XXI” w Krakowie.',
      '25–28 sierpnia 2011 r.', tags: [Item.TAG_ZHR]),
  Item('Zlot ZHP w Gdańsku z okazji stulecia ZHP.',
      '6-16 sierpnia 2018 r.', tags: [Item.TAG_ZHP]),
  Item('Jubileuszowy Zlot 30-lecia Związku Harcerstwa Rzeczypospolitej w Rybakach k. Olsztyna',
      '2019 r.', tags: [Item.TAG_ZHR]),
];

List<Item> list = events_1 + events_2 + events_3 + events_4;


class HistoriaFragment extends StatefulWidget{

  const HistoriaFragment({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HistoriaFragmentState();

}

class HistoriaFragmentState extends State<HistoriaFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.historia;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[

        SliverAppBar(
          title: const Text('Historia'),
          centerTitle: true,
          backgroundColor: background_(context),
          floating: true,
        ),

        SliverList(
          delegate: SliverChildListDelegate([const SizedBox(height: Dimen.ICON_MARG)]),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
            if (index.isEven)
              return Padding(
                padding: const EdgeInsets.only(left: Dimen.ICON_MARG),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AppText(list[index].content, size: Dimen.TEXT_SIZE_BIG),
                    const SizedBox(height: Dimen.ICON_MARG),
                    Row(
                      children: [

                        Wrap(
                          spacing: Dimen.ICON_MARG,
                          children: [
                            if(list[index].tags.contains(Item.TAG_FSE)) const OrgIndicator(Org.fse),
                            if(list[index].tags.contains(Item.TAG_ZHP)) const OrgIndicator(Org.zhp),
                            if(list[index].tags.contains(Item.TAG_ZHR)) const OrgIndicator(Org.zhr_o)
                          ],
                        ),

                        Expanded(child: Container()),

                        Text(
                          list[index].date,
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_NORMAL,
                              fontWeight: weight.halfBold,
                              color: hintEnab_(context)
                          ),
                          textAlign: TextAlign.end,
                        ),

                        const SizedBox(width: Dimen.ICON_MARG)

                      ],
                    )
                  ],
                ),
              );

            return const SizedBox(height: 4*Dimen.ICON_MARG);
          },
            semanticIndexCallback: (Widget widget, int localIndex) {
              if (localIndex.isEven) {
                return localIndex ~/ 2;
              }
              return null;
            },
            childCount: list.length,
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([const SizedBox(height: Dimen.ICON_MARG)]),
        )

      ],
    ),
  );

}

class Item{

  static const TAG_FSE = 'FSE';
  static const TAG_ZHP = 'ZHP';
  static const TAG_ZHR = 'ZHR';

  final String content, date;
  final List<String> tags;
  const Item(this.content, this.date, {this.tags = const []});
}