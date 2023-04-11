import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'common.dart';

class PartChangelog extends StatelessWidget{

  const PartChangelog({GlobalKey? globalKey}):super(key: globalKey);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          const SliverAppBar(
            title: Text('Co nowego'),
            centerTitle: true,
            floating: true,
          ),

          SliverPadding(
            padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
            sliver: SliverList(delegate: SliverChildListDelegate([

              const ListCard(
                  '3.1.20',
                  [
                    'Dodano nowe piosenki,',
                    'Poprawiono błąd znikających piosenek własnych.',
                  ]
              ),

              const ListCard(
                  '3.1.19',
                  [
                    'Wielkanoc!',
                    'Dodano nowe piosenki,',
                    'Poprawiono literówkę i treść w module "Strefa instruktora".',
                  ]
              ),

              const ListCard(
                  '3.1.18',
                  [
                    'Dodano nowe piosenki,',
                    'Poprawiono błędy związane z przewijaniem piosenek,',
                    'Poprawiono błędy związane z włączaniem i wyłączaniem chwytów w śpiewniku.'
                  ]
              ),

              const ListCard(
                  '3.1.17',
                  [
                    'Dodano nowe piosenki,',
                    'Zmieniono sposób dostępu do interpretacji piosenek,',
                    'Zmieniono sposób dostępu do zmiany tekstu piosenek,',
                    'Rozszerzono liczbę ocen piosenek,',
                    'Poprawiono błąd spisu treści wracającego zawsze na początek listy przy ponownym jego otwarciu,',
                    'Dodano stałe albumy ("piosenki własne" i "do nauki").'
                  ]
              ),

              const ListCard(
                  '3.1.16',
                  [
                    'Dodano nowe piosenki,',
                    'Poprawiono błąd złego kodowania sprawności,',
                    'Poprawiono literówki.',
                  ]
              ),

              const ListCard(
                  '3.1.15',
                  [
                    'Dodano nowe piosenki,',
                    'Dodano tropy,',
                    'Poprawiono moduł "Rozwój".',
                  ]
              ),

              const ListCard(
                  '3.1.14',
                  [
                    'Dodano nowe piosenki,',
                    'Dodano możliwość słuchania nagrań piosenek spoza serwisu Youtube,',
                    'Dodano symbolikę lilijki ZHP i ZHR.',
                  ]
              ),

              const ListCard(
                  '3.1.13',
                  [
                    'Dodano nowe piosenki,',
                    'Ułatwiono losowanie kolejnych piosenek,',
                    'Wyeksponowano osoby dodające piosenki i ich punkty.'
                  ]
              ),

              const ListCard(
                  '3.1.12',
                  [
                    'Dodano nowe piosenki,',
                    'Poprawiono błąd albumów w module "Śpiewnik".',
                  ]
              ),

              const ListCard(
                  '3.1.11',
                  [
                    'Dodano nowe piosenki,',
                    'Poprawiono generowanie pliku PDF z apelami ewangelicznymi.',
                  ]
              ),

              const ListCard(
                  '3.1.10',
                  [
                    'Dodano nowe piosenki,',
                    'Dodano apele ewangeliczne,',
                    'Dodano historię wyszukiwania piosenek',
                    'Poprawiono błąd odtwarzania piosenek na YT w module "Śpiewnik",',
                    'Poprawiono i ujednolicono interfejsy.',
                  ]
              ),

              const ListCard(
                  '3.1.9',
                  [
                    'Dodano język niderlandzki do modułu "Słownik harcerski".'
                  ]
              ),

              const ListCard(
                  '3.1.9',
                  [
                    'Dodano nowe piosenki,',
                    'Dodano ranking osób dodających piosenki,',
                    'Poprawiono podpisy osób dodających piosenki,',
                    'Poprawiono moduł "Strefa ducha".',
                  ]
              ),

              const ListCard(
                  '3.1.8',
                  [
                    'Poprawiono spójność części elementów interfejsu graficznego,',
                    'Poprawiono kolejny błąd działania aplikacji bez Internetu.'
                  ]
              ),

              const ListCard(
                  '3.1.7',
                  [
                    'Dodano nowe piosenki,',
                    'Poprawiono błąd działania aplikacji bez Internetu.'
                  ]
              ),

              const ListCard(
                  '3.1.6',
                  [
                    'Dodano nowe piosenki.',
                  ]
              ),

              const ListCard(
                  '3.1.5',
                  [
                    'Poprawiono błąd niewyświetlającego się modułu "Poradnik i rozwój".',
                  ]
              ),

              const ListCard(
                  '3.1.4',
                  [
                    'Dodano nowe piosenki.',
                  ]
              ),

              const ListCard(
                  '3.1.3',
                  [
                    'Poprawiono horyzontalną wersję śpiewnika,',
                    'Poprawiono podgląd stopni ZHP,',
                    'Poprawiono szatę graficzną.'
                  ]
              ),

              const ListCard(
                  '3.1.2',
                  [
                    'Poprawiono ortografię.',
                  ]
              ),

              const ListCard(
                  '3.1.1',
                  [
                    'Adwent!',
                    'Dodano nowe gawędy,',
                    'Dodano nowe piosenki.'
                  ]
              ),

              const ListCard(
                  '3.1.0',
                  [
                    'Dodano stopnie zgodne z propozycją nowego SIM,',
                    'Dodano sprawności, tropy i wyzwania zgodne z nowym SIM do dokumnetów,',
                    'Poprawiono interfejs stopni,',
                    'Dodano nowe piosenki.'
                  ]
              ),

              const ListCard(
                  '3.0.6',
                  [
                    'Zmieniono szatę graficzną ekranu startowego,',
                    'Dodano do ekranu startowego definicje różnych pojęć,',
                    'Dodano nowe piosenki.',
                  ]
              ),

              const ListCard(
                  '3.0.5',
                  [
                    'Poprawiono błąd niewłączającego się śpiewnika (przyznaję się, wcześniej nie został poprawiony).',
                  ]
              ),

              const ListCard(
                  '3.0.4',
                  [
                    'Dodano wiersze do modułu "Myśl harcerska",',
                    'Poprawiono błąd niewłączającego się śpiewnika.',
                  ]
              ),

              const ListCard(
                  '3.0.3',
                  [
                    'Dodano więcej szczegółów w module "Słownik harcerski",',
                    'Dodano chwyty na mandolinę.',
                  ]
              ),

              const ListCard(
                  '3.0.2',
                  [
                    'Dodano nowe piosenki,',
                    'Dodano samouczek gry "Słowo klucz".',
                  ]
              ),

              const ListCard(
                  '3.0.1',
                  [
                    'Dodano nowe piosenki,',
                    'Poprawiono błędy w słowniku norweskim,',
                    'Poprawiono ikonkę na niektórych urządzeniach Android.'
                  ]
              ),

              const ListCard(
                  '3.0.0',
                  [
                    'Nowy interfejs graficzny!',
                    'Dodano nowe piosenki,',
                    'Rozbudowano moduł dodawania piosenek,',
                    'Poprawiono wyszukiwanie piosenek,',
                    'Dodano artykuły harcerskie,',
                    'Dodano gawędy harcerskie,',
                    'Dodano rozbudowany moduł stopni i spranwości,',
                    'Dodano sprawności harcerzy i harcerek ZHR,',
                    'Dodano dokumenty ZHR.',
                  ]
              ),

              const ListCard(
                  '2.8.2',
                  [
                    'Boże narodzenie!',
                    'Uaktualniono zasady harcerskiej pisowni.',
                  ]
              ),

              const ListCard(
                  '2.8.1',
                  [
                    'Adwent!',
                    'Dodano w śpiewniku tag "#DlaDzieci",',
                    'Dodano nowe piosenki,',
                    'Dodano biografię Piłsudskiego i Dmowskiego,',
                    'Poprawiono ciemny motyw w module "Sprawności",',
                    'Poprawiono i dodano nowe słowa do moduły "Słownik".',
                  ]
              ),

              const ListCard(
                  '2.8.0',
                  [
                    'Rozszerzono panel dodawania własnych piosenek,',
                    'Dodano możliwość otwarcia spisu treści przy wejściu do modułu "Śpiewnik",',
                    'Dodano możliwość schowania chwytów od razu przy próbie nadmiernego powiększenia tekstu,',
                    'Zmieniono działanie przycisku powrotu w śpiewniku,',
                    'Zwiększono płynność działania aplikacji przy przejściu między modułami,',
                    'Poprawiono interfers w module "Strefa Ducha",',
                    'Poprawiono błąd trybu offline modułu "Strefa Ducha".',
                  ]
              ),

              const ListCard(
                  '2.7.0',
                  [
                    'Dodano ciemny motyw w całej aplikacji,',
                    'Poprawiono błąd niewłączającego się śpiewnika.'
                  ]
              ),

              const ListCard(
                  '2.6.4',
                  [
                    'Dodano możliwość automatycznej zmiany motywu śpiewnika na ciemny po zmierzchu,',
                    'Poprawiono błąd w szyfratorze Morse\'a,',
                    'Poprawiono błąd samoczynnej zmiany metody wyszukwiania piosenek w spisie treści.'
                  ]
              ),

              const ListCard(
                  '2.6.3',
                  [
                    'Ujednolicono interfejs użytkownika,',
                    'Dodano możliwość kolejkowania piosenek przy ich odtwarzaniu,',
                    'Dodano nowe piosenki.',
                  ]
              ),

              const ListCard(
                  '2.6.2',
                  [
                    'Dodano nowe piosenki,',
                    'Dodano możliwość odtworzenia piosenki w śpiewniku bez wychodzenia z aplikacji.',
                  ]
              ),

              const ListCard(
                  '2.6.1',
                  ['Dodano możliwość zapamiętywania frazy wyszukującej w spisie treści po jego opuszczeniu,',
                    'Dodano możliwość kopiowania danych do faktur,',
                    'Połączono moduły "Tonacja" i "Chwyty",',
                    'Poprawiono dodawanie piosenek do albumów w module "Śpiewnik",',
                    'Poprawiono losowanie piosenek w module "Śpiewnik".',
                  ]
              ),

              const ListCard(
                  '2.6.0',
                  ['Dodano nowe piosenki,',
                    'Dodano język norweski w module "Słownik",',
                    'Poprawiono kolejność wyświetlania słów w module "Słownik",',
                    'Poprawiono animacje w module "Las".',
                  ]
              ),
              const ListCard(
                  '2.5.1',
                  ['Dodano nowe piosenki,',
                    'Dodano w module "Śpiewnik" tag #Powstańcze,',
                    'Dodano informacje o Royal Rangers w module "O harcerstwie",',
                    'Dodano 2500 nowych słów do gry "Słowo klucz",',
                    'Poprawiono błąd dodawania piosenek do albumu,',
                    'Poprawiono błąd "uciekającego tekstu" w module "Tonacja".'
                  ]
              ),
              const ListCard(
                  '2.5.0',
                  ['Dodano grę "Słowo klucz" w module "Gry",',
                    'Dodano historię ZHR do modułu "Historia i Biografie",',
                    'Dodano tagi do modułu "Historia i Biografie",',
                    "Dodano automatyczne nadawanie kodu Morse'a diodą w telefonie,",
                    'Poprawiono tryb pełnoekranowy,',
                    'Poprawiono niewidoczną czcionkę przy wyszukiwaniu piosenek w ciemnym trybie.',
                  ]
              ),
              const ListCard(
                  '2.4.0',
                  ['Dodano możliwość zapisywania wspomnień związanych z piosenkami,',
                    'Dodano moduł "Las",',
                    'Dodano krzyż FSE do modułu "Symbolika",',
                    'Połączono moduł "Szyfrator" i "Szyfry",',
                    'Połączono moduł "Biografie" i "Historia",',
                    'Ujednolicono wygląd aplikacji,',
                    'Poprawiono błąd dodawania nowych piosnek i dodawania nowych okrzyków,',
                    'Poprawiono błędy w module "Historia".'
                  ]
              ),
              const ListCard(
                  '2.3.1',
                  ['Dodano nowych patronów,',
                    'Poprawiono błąd dodawania nowych piosenek do aplikacji.']
              ),
              const ListCard(
                  '2.3.0',
                  ['Dodano język czeski do modułu "Słownik",',
                    'Dodano grę "Pytajki".']
              ),
              const ListCard(
                  '2.2.0',
                  ['Dodano informacje dotyczące koronawirusa,',
                    'Dodano możliwość tworzenia własnych albumów w module "Śpiewnik".']
              ),
              const ListCard(
                  '2.1.1',
                  ['Dodano nowe piosenki,',
                    'Dodano opis aplikacji "Pola",',
                    'Poprawiono kolorystykę ikon,',
                    'Poprawiono zmianę kryteriów wyszukiwania piosenek w "Śpiewnik",',
                    'Poprawiono błąd w szyfrze komórkowym,',
                    'Poprawiono błędy w module "Sprawności".']
              ),
              const ListCard(
                  '2.1.0',
                  ['Dodano nowe piosenki,',
                    'Dodano słowa kluczowe przy wyszukiwaniu modułów,',
                    'Poprawiono pasek ładowania w module "Śpiewnik",',
                    'Poprawiono wyszukiwanie piosenek w module "Śpiewnik",']
              ),
              const ListCard(
                  '2.0.11',
                  ['Dodano moduł "Biografie",',
                    'Dodano możliwość wybrania, czy aplikacja powinna zajmować cały ekran,',
                    'Dodano możliwość szukania modułów po nazwach,',
                    'Dodawno nową animację w module "Strefa Ducha",',
                    'Dodano jasne cienie do ciemnego motywu w module "Śpiewnik",',
                    'Dodano możliwość stopniowania ulubienia piosenek,',
                    'Dodano nowe piosenki.']
              ),
              const ListCard(
                  '2.0.10',
                  ['Dodano nowe piosenki,',
                    'Poprawiono ciemny motyw w module "Śpiewnik".']
              ),
              const ListCard(
                  '2.0.9',
                  ['Dodano możliwość automatycznego przewijania tekstu piosenek,',
                    'Poprawiono błąd losowania piosenek,',
                    'Poprawiono błąd skalowania tekstu piosenki w module "Śpiewnik",',
                    'Poprawiono błąd powiększania i pomniejszania tekstu w module "Śpiewnik",',
                    'Poprawiono ciemny motywu w module "Śpiewnik".']
              ),
              const ListCard(
                  '2.0.8',
                  ['Dodano nowe piosenki,',
                    'Poprawiono błędy w metodykach.']
              ),
              const ListCard(
                  '2.0.7',
                  ['Dodano zapamiętywanie położenia listy spisu treści w module "Śpiewnik".']
              ),
              const ListCard(
                  '2.0.6',
                  ['Poprawiono błąd transpozycji chytów w module "Tonacja",',
                    'Poprawiono błąd ładowania piosenek w module "Śpiewnik",',
                    'Poprawiono błąd wyświetlania trudnych słów w module "Śpiewnik",',
                    'Poprawiono błąd w stopniu ochotniczki w stopniach harcerek ZHR,',
                    'Poprawiono błąd w przykładzie szyfru "Karolinka".']
              ),
              const ListCard(
                  '2.0.5',
                  ['Poprawiono błąd znikających chwytów przy zmianie tonacji w module "Śpiewnik".',
                    'Poprawiono błąd podglądu dodawanej piosenki w module "Śpiewnik".']
              ),
              const ListCard(
                  '2.0.4',
                  ['Dodano nowe piosenki,',
                    'Poprawiono błąd wyszukiwania znaków patrolowych,',
                    'Poprawiono błąd niezmieniających się obrazków chwytów przy transpozycji chwytów piosenki w module "Śpiewnik".']
              ),
              const ListCard(
                  '2.0.3',
                  ['Poprawiono błąd wyświetlania wersji aplikacji,',
                    'Poprawiono błąd wyszukiwania piosenek po słowach tekstu.']
              ),
              const ListCard(
                  '2.0.2',
                  ['Dodano wiadomość o zmianach pojawiającą się po zaktualizowaniu aplikacji,',
                    'Poprawiono płynność wybierania losowej piosenki w module "Śpiewnik",',
                    'Poprawiono płynność wybierania piosenki ze spisu treści w module "Śpiewnik",',
                    'Poprawiono błąd klawiatury w wyszukiwaniu w module "Znaki Patrolowe".']
              ),
              const ListCard(
                  '2.0.1',
                  ['Poprawiono błąd wyświetlania transpozycji chwytów w module "Tonacja",',
                    'Poprawiono błąd wyświetlania ikonek wyposażenia kuchnnego w module "Kuchnia harcerska",',
                    'Poprawiono błąd dodawania nowych piosenek,',
                    'Poprawiono błąd przewijania kart w module "Symbolika",',
                    'Poprawiono błąd wyświetlania stopni harcerskich ZHR.']
              ),
              const ListCard(
                  '2.0.0',
                  ['Aplikacja została przepisana przy użyciu wieloplatformowego narzędzia "Flutter" umożliwiającej jej wydanie na Androida oraz iOS przy wykorzystaniu jednego kodu źródłowego.']
              ),
              const ListCard(
                  '1.13.1',
                  ['Poprawiono błędy w module "Okrzyki".']
              ),
              const ListCard(
                  '1.13.0',
                  ['Dodano moduł "Okrzyki",',
                    'Dodano do modułu "Symbolika" flagę Polski,',
                    'Dodawno prawo harcerek FSE,',
                    'Poprawiono treść 1. punktu Prawa Harcerskiego ZHR.',
                    'Poprawiono wyświetlanie gwiazdek zuchowych.',
                    'Poprawiono wyświetlanie sprawności.']
              ),
              const ListCard(
                  '1.12.5',
                  ['Poprawiono ładowanie tła grafik w module "Strefa ducha" na starszych urządzeniach.']
              ),
              const ListCard(
                  '1.12.4',
                  ['Dodano możliwość wysyłania własnych piosenek do oficjalnego spisu treści z telefonu,',
                    'Poprawiono dodawanie własnych piosenek do telefonu,',
                    'Poprawiono błąd wyświetlania komentarza 10. punktu Prawa Harcerskiego ZHR.']
              ),
              const ListCard(
                  '1.12.3',
                  ['Poprawiono błąd zapisywania grafik offline w module "Strefa ducha",',
                    'Poprawiono łatwość przewijania grafik w module "Strefa ducha".']
              ),
              const ListCard(
                  '1.12.2',
                  [' Poprawiono błąd kolejności wyświetlania grafik w module "Strefa ducha".']
              ),
              const ListCard(
                  '1.12.1',
                  [' Poprawiono błąd otwierania modułu "Kontakt i o programie",',
                    'Poprawiono błąd wczytywania danych w module "Strefa ducha".']
              ),
              const ListCard(
                  '1.12.0',
                  ['Powstanie Warszawskie',
                    'Dodano moduł "Strefa ducha",',
                    'Dodano czarny motyw do okna pobierania piosenek w module "Śpiewnik",',
                    'Dodano sprawności wodniackie,',
                    'Dodano Prawo i Przyrzeczenie ZHR oraz Skautów Europy,',
                    'Dodano stopnie harcerek ZHR,',
                    'Dodano stopnie harcerzy ZHR',
                    'Dodano gwiazdki zuchowe ZHR,',
                    'Poprawiono symbol sodu w module "Kuchnia harcerska",',
                    'Poprawiono treść kodeksu wędrowniczego,',
                    'Poprawiono błąd edycji ustawień w aplikacji.']
              ),
              const ListCard(
                  '1.11.6',
                  ['Dodano możliwość importu i eksportu piosenek z i do pamięci telefonu,',
                    'Piosenki dostępne do pobrania są bardziej szczegółowo opisane,',
                    'Poprawiono błąd zmiany orientacji ekranu w spisie treści modułu "Śpiewnik",',
                    'Poprawiono błąd niechronologicznych dat w module "Historia",',
                    'Poprawiono literówki.']
              ),
              const ListCard(
                  '1.11.5',
                  ['Dodano możliwość wyboru, czy zostawić w śpiewniku oryginał edytowanej piosenki podczas jej zapisu.']
              ),
              const ListCard(
                  '1.11.4',
                  ['Dodano w module "Historia harcerstwa" datę powołania pierwszych drużyn we Lwowie,',
                    'Poprawiono błąd usuwania piosenek.']
              ),
              const ListCard(
                  '1.11.3',
                  ['Dodano instrukcję tworzenia i działania chorągwi ZHP,',
                    'Dodano opis ordynacji wyborczej ZHP,',
                    'Dodano możliwość sprawdzenia interpretacji piosenki (w budowie),',
                    'Poprawiono błąd przywracania aplikacji z pamięci.']
              ),
              const ListCard(
                  '1.11.2',
                  ['Dodano możliwość zgłaszania słów o niejasnym znaczeniu w piosenkach,',
                    'Dodano możliwość sprawdzenia znaczenia słów o niejasnym znaczeniu w piosenkach,',
                    'Poprawiono wyświetlanie śpiewnika w przypadku braku piosenek.']
              ),
              const ListCard(
                  '1.11.1',
                  ['Poprawiono błąd wyświetlania danych do faktur,',
                    'Poprawiono wpisywanie klucza do szyfratora GA-DE-RY-PO-LU-KI',
                    'Podjęto próbę naprawy błędu wyszukiwania piosenek.']
              ),
              const ListCard(
                  '1.11.0',
                  ['Umożliwiono lepszy podgląd chwytów w module "Śpiewnik",',
                    'Wyodrębniono informacje dotyczące tematów instruktorskich,',
                    'Poprawiono wygląd aplikacji,',
                    'Dodano możliwość kopiowania danych do faktur,',
                    'Dodano możliwość kopiowania tekstów i chwytów piosenek,',
                    'Poprawiono kolejność strun ukulele w module "Chwyty",',
                    'Poprawiono czas ładowania aplikacji (pierwsze ładowanie będzie dłuższe),',
                    'Poprawiono udostępnianie piosenek między urządzeniami.']
              ),
              const ListCard(
                  '1.10.3',
                  ['Wielki Tydzień.']
              ),
              const ListCard(
                  '1.10.2',
                  ['Poprawiono błąd związany z wpisaniem kropki do liczby porcji w module "Kuchnia harcerska",',
                    'Poprawiono błąd w module "Historia harcerstwa".']
              ),
              const ListCard(
                  '1.10.1',
                  ['Poprawiono błąd przepełnienia liczby porcji w module "Kuchnia harcerska",',
                    'Poprawiono błąd wielokrotnego wyświetlania grafik chwytów ukulele w module "Śpiewnik",',
                    'Poprawiono błąd wizualny w module "HIB",',
                    'Poprawiono błąd w module "Szyfrator".']
              ),
              const ListCard(
                  '1.10.0',
                  ['Dodano moduł "Kuchnia harcerska",',
                    'Dodano możliwość kopiowania kodu morse\'a w module "Szyfrator",',
                    'Poprawiono błąd w module "Stopnie",',
                    'Poprawiono błąd zmiany chwytów z gitarowych na ukulele.']
              ),
              const ListCard(
                  '1.9.5',
                  [' Dodano możliwość wyświetlenia chwytów na ukulele pod piosenką w module "Śpiewnik",',
                    'Poprawiono błędy w module "Sprawności".']
              ),
              const ListCard(
                  '1.9.4',
                  ['Boże Narodzenie!',
                    'Dodano ikonki do modułu "Musztra"',
                    'Poprawiono błąd w słowniku włoskim.']
              ),
              const ListCard(
                  '1.9.3',
                  ['Dodano język włoski do słownika,',
                    'Dodano ankietę dotyczącą nowych sprawności,',
                    'Poprawiono błąd słownika.']
              ),
              const ListCard(
                  '1.9.2',
                  ['Adwent!',
                    'Moduł "Metoda i metodyka" został zmieniony na "Strefę instruktora" i uzupełniony o kodeks instruktorski,',
                    'Dodano odnośnik do kodu źródłowego aplikacji,',
                    'Poprawiono błędy w słowniku polsko-niemieckim (dzięki Maximilian Steinhoff),',
                    'Poprawiono błąd otwierania modułu "Śpiewnik" na urządzeniach z systemem w wersji niższej niż 5.0,',
                    'Zaktualizowano obowiązujące dokumenty w ZHP w module "Dokumenty".']
              ),
              const ListCard(
                  '1.9.1',
                  ['Uaktualniono dane do faktur chorągwi.']
              ),
              const ListCard(
                  '1.9.0',
                  ['Niepodległa!',
                    'Dodano harcerskie zasady pisowni w module "Słownik harcerski",',
                    'Dodano informację o aplikacji Pola,',
                    'Dodano moduł "HIB" Panelu Badawczego ZHP,',
                    'Poprawiono literówkę w module "Sprawności"']
              ),
              const ListCard(
                  '1.8.13',
                  ['Dodano możliwość udostępniania piosenek między telefonami przy użyciu QR-kodów,',
                    'Dodano możliwość ustawienia funkcji przycisku powrotu w aplikacji,',
                    'Dodano możliwość zmiany kolejności wyświetlania modułów na alfabetyczną,',
                    'Dodano blokadę powiększania tekstu piosenek gdy skutkuje to niedopasowaniem do chwytów,',
                    'Dodano odnośnik do strony "https://dokumenty.zhp.pl",',
                    'Zaktualizowano instrukcję HALiZ,',
                    'Przeniesiono moduł "Harcerstwo w sieci" do modułu "O harcerstwie",',
                    'Poprawiono błędy ortograficzne.']
              ),
              const ListCard(
                  '1.8.12',
                  ['Dodano powiadomienia o nowych piosenkach,',
                    'Poprawiono błąd w informowaniu o nowych aktualizacjach aplikacji,',
                    'Uproszczono szyfrator GADERYPOLUKI,',
                    'Poprawiono liczne błędy ortograficzne w module "Słownik",',
                    'Poprawiono błąd w kodzie morsa,',
                    'Poprawiono błąd w module "Tonacja",',
                    'Poprawiono błąd ortograficzny w module "Sprawności" i "Prawo i Przyrzeczenie".']
              ),
              const ListCard(
                  '1.8.11',
                  ['Święta Bożego Narodzenia!',
                    'Dodano nowy tag #Kolędy.']
              ),
              const ListCard(
                  '1.8.10',
                  ['Poprawiono błąd wyświetlania krzyża harcerskiego.']
              ),
              const ListCard(
                  '1.8.9',
                  ['Poprawiono literówki,',
                    'Poprawiono błąd w Spisie Treści Śpiewnika.']
              ),
              const ListCard(
                  '1.8.8',
                  ['Poprawiono błąd obrotu ekranu w spisie treści Śpiewnika.']
              ),
              const ListCard(
                  '1.8.7',
                  ['Poprawiono błąd grafik w module "Historia".']
              ),
              const ListCard(
                  '1.8.6',
                  ['Dodano możliwość wyszukiwania tagowanych piosenek poprzez naciśnięcie tagu pod piosenką,',
                    'Dodano nowy tag #Patriotyczne,',
                    'Nowy statut ZHP,',
                    'Poprawiono błąd ortograficzny,',
                    'Poprawiono interfejs pobierania piosenek,',
                    'Nieznacznie przyspieszono ładowanie aplikacji,',
                    'Przyspieszono pobieranie nowych piosenek,',
                    'Poprawiono błędy w module "Sprawności",',
                    'Poprawiono literówki w słowniku i sprawnościach,',
                    'Zawieszono możliwość przesyłania piosenek między telefonami (biblioteka nie jest dłużej wspierana, trzeba znaleźć inną).']
              ),
              const ListCard(
                  '1.8.5',
                  ['Dodano słownik Polsko-Polski,',
                    'Dodano graficzne przedstawienie rodzajów drewna,',
                    'Udoskonalono ciemną nakładkę śpiewnika,',
                    'Poprawiono błąd w "Szyfratorze",',
                    'Przyspieszono czas ładowania aplikacji,',
                    'Poprawiono ekran ładowania aplikacji.']
              ),
              const ListCard(
                  '1.8.4',
                  ['Poprawiono błąd wyświetlania piosenek na Androidzie 4.x.']
              ),
              const ListCard(
                  '1.8.3',
                  ['Poprawiono błąd wyświetlania niektórych szyfrów,',
                    'Poprawiono sposób wyświetlania wiadomości Toast,',
                    'Poprawiono błąd tagu #Ballady w "Śpiewniku".']
              ),
              const ListCard(
                  '1.8.2',
                  ['Nowy, uproszczony system tworzenia własnych piosenek,',
                    'Znacznie przyspieszono pobieranie piosenek,',
                    'Poprawiono błąd przywracania wszystkich piosenek przy każdym uruchomieniu aplikacji, ',
                    'Poprawiono błąd w module "Chwyty".']
              ),
              const ListCard(
                  '1.8.1',
                  ['Dodano język hiszpański do słownika (sam. Patrycja Szczęsna!),',
                    'Dodano możliwość wyszukiwania piosenek po tagach,',
                    'Poprawiono system zgłaszania błędów (wcześniej część nie docierała),',
                    'Poprawiono drobne elementy interfejsu w śpiewniku,',
                    'Poprawiono błędy ortograficznych w module "Musztra".']
              ),
              const ListCard(
                  '1.8.0',
                  ['Dodano język niemiecki do słownika harcerskiego,',
                    'Dodano chwyty na ukulele,',
                    'Dodano kodeks wędrowniczy,',
                    'Dodano symbolikę harcerską,',
                    'Dodano musztrę ZHP,',
                    'Dodano infodmacje o ogniu i drewnie,',
                    'Dodano w "Dokumentach ZHP" wzór rozkazu i regulamin musztry.']
              ),
              const ListCard(
                  '1.7.4',
                  ['Dodano słownik harcerski,',
                    'Poprawiono błąd wyświetlania wymagań sprawności,',
                    'Poprawiono błąd klucza w szyfratorze GA DE RY PO LU KI.']
              ),
              const ListCard(
                  '1.7.3',
                  ['Poprawiono treść Prawa Harcerskiego.']
              ),
              const ListCard(
                  '1.7.2',
                  ['Dodano system stopni instruktorskich do modułu "Dokumenty ZHP",',
                    'Uaktualniono wymagania na stopnie instruktorskie.']
              ),
              const ListCard(
                  '1.7.1',
                  ['Poprawiono błąd niewyświetlania dokumentów ZHP na Androidzie 7+.']
              ),
              const ListCard(
                  '1.7.0',
                  ['Dodano możliwość zgłaszania błędów z poziomu aplikacji,',
                    'Umożliwiono przeglądanie dokumentów bez zewnętrznej pamięci telefonu,',
                    'Dodano możliwość przesyłania piosenek między telefonami,',
                    'Poprawiono błąd zmiany kolorystyki śpiewnika,',
                    'Poprawiono błąd zerowej prędkości autoprzewijania piosenki w śpiewniku.']
              ),
            ])),
          )

        ],
      ),
    );

  }
}

class ListCard extends StatelessWidget{

  final String version;
  final List<String> changelog;

  const ListCard(this.version, this.changelog, {super.key});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(String item in changelog)
      children.add(Padding(
        padding: const EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('• ', style: AppTextStyle(color: textEnab_(context))),
            Expanded(child: Text(
                item,
                style: AppTextStyle(
                    color: textEnab_(context),
                    fontSize: Dimen.TEXT_SIZE_BIG
                )
            ))
          ],
        ),
      ));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: SEPARATOR_BIG/2),
        Text(version, style: AppTextStyle(fontWeight: weight.halfBold, color: textEnab_(context))),
        const SizedBox(height: Dimen.defMarg),
        Column(children: children),
        const SizedBox(height: SEPARATOR_BIG/2),
      ]
    );
  }

}