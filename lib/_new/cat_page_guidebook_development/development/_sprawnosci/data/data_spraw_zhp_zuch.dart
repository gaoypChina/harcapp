import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_group.dart';

SprawBook sprawBookZHPZuchSim2022 = SprawBookData(
    id: SprawBookData.ZHP_ZUCH_SIM_2022_ID,
    title: 'Sprawności zuchowe ZHP',
    source: '',
    color: SprawBookData.SPRAW_BOOK_ZHP_ZUCH_SIM_2022_COLOR,
    icon: SprawBookData.SPRAW_BOOK_ZHP_ZUCH_SIM_2022_ICON,
    male: true,
    female: true,
    iconPathWithFamilyId: false,
    iconPathWithLevel: false,
    iconBlackAndWightOnly: false,
    groupData: [

      SprawGroupData(
          id: 'artystyczne',
          title: 'Artystyczne',
          tags: ['#zdolności manualne', '#kreatywność', '#wyrażanie siebie', '#wyobraźnia', '#estetyka', '#tworzę', '#artysta'],
          familyData: [
            SprawFamilyData(
                id: '1',
                requirements: [
                  'Często słucham muzyki. Mam ulubionego twórcę (wykonawcę).',
                  'Potrafię określić rodzaj muzyki (poważna, ludowa, rozrywkowa).',
                  'Potrafię rozpoznać instrument po brzmieniu.',
                  'Byłem(-am) na koncercie.',
                  'Umiem zagrać na instrumencie dwie lub trzy proste melodie.',
                  'Potrafię zagrać gamę C-dur, a-moll, zapisać ją i nazwać dźwięki.',
                  'Dbam o własny instrument.',
                  'Wykonałem(-am) koncert dla mojej gromady.',
                  'Przygotowałem(-am) akompaniament do występu gromady, klasy lub szkoły.',
                  'Brałem(-am) udział w muzycznej imprezie szkolnej.'
                ],
                notesForLeaders: [
                  'Sprawność pomaga kształtować sumienność, staranność i dokładność. Wpływa na rozwój estetyczny zucha i kształci jego zdolności manualne. Dla zuchów nieśmiałych jest szansą na zaprezentowanie własnych umiejętności (np. podczas zabawy w teatr), wzmaga przy tym poczucie wpływu na całokształt przedsięwzięcia.',
                  'Zuch „Charakteryzator” wie, jak ważna dla sztuki teatralnej czy filmu jest praca charakteryzatora. Sprawnie posługuje się przydatnymi w pracy przyborami, takimi jak pomadki, pudry, cienie, tusze, farbki i peruki. Dba o skórę i ubranie charakteryzowanych osób.',
                  'Zuchowi, który interesuje się charakteryzacją, warto zaproponować także zdobywanie sprawności „Lalkarza” lub „Fryzjera”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Charakteryzatora”: „Zuch pamięta o swoich obowiązkach”, „Zuch stara się być coraz lepszy”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'charakteryzator',
                      title: 'Charakteryzator',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) innym zuchom, czym zajmują się charakteryzatorzy i gdzie pracują.',
                        'Narysowałem(-am) lub zaprezentowałem(-am) w kręgu rady przedmioty potrzebne w pracy charakteryzatora.',
                        'Ucharakteryzowałem(-am) innego zucha do teatrzyku.',
                        'Wykonałem(-am) jeden prosty element charakteryzacji twarzy.',
                      ]),
                  SprawData(
                      id: 'charakteryzator',
                      title: 'Charakteryzator',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) innym zuchom, czym zajmują się charakteryzatorzy i gdzie pracują oraz jakie są dziedziny ich pracy.',
                        'Zaprezentowałem(-am) w kręgu rady przedmioty potrzebne w pracy charakteryzatora.',
                        'Ucharakteryzowałem(-am) moją szóstkę do teatrzyku.',
                        'Własnoręcznie wykonałem(-am) elementy charakteryzacji twarzy do wybranej postaci.',
                        'Przygotowałem(-am) naturalne farby do charakteryzacji i zaprezentowałem(-am) je w praktyce.',
                        'Zmyłem(-am) makijaż po charakteryzacji.',
                      ]),
                  SprawData(
                      id: 'charakteryzator',
                      title: 'Charakteryzator',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) innym zuchom, czym zajmują się charakteryzatorzy, gdzie pracują i jakie są dziedziny ich pracy. Zaprezentowałem(-am) najlepsze, moim zdaniem, efekty pracy charakteryzatorów w filmie lub teatrze.',
                        'Zaprezentowałem(-am) w kręgu rady przedmioty potrzebne w pracy charakteryzatora. Pokazałem(-am) chętnym zuchom, jak należy się nimi posługiwać.',
                        'Ucharakteryzowałem(-am) moją szóstkę do teatrzyku. Czuwałem(-am) nad charakteryzacją zuchów z gromady, służąc innym radą i wskazówkami.',
                        'Własnoręcznie wykonałem(-am) elementy charakteryzacji dla wybranej postaci.',
                        'Przygotowałem(-am) naturalne farby i materiały do charakteryzacji. Zaprezentowałem(-am) je w praktyce.',
                        'Zmyłem(-am) makijaż po charakteryzacji.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '2',
                requirements: [
                  'Zbieram materiały przydatne do majsterkowania i dekorowania, np. ścinki materiałów, kolorowe papiery, wstążki.',
                  'Udekorowałem(-am) scenę na przedstawienie, salę na bal lub uroczystość szkolną.',
                  'Zrobiłem(-am) wycinankę lub inną ozdobę.',
                  'Uczestniczyłem(-am) w wykonaniu wystroju zuchówki lub klasy.',
                  'Przygotowałem(-am) gazetkę ścienną.',
                  'Zrobiłem(-am) ozdobną okładkę na książkę lub zeszyt.',
                  'Ułożyłem(-am) kwiaty.',
                  'Przygotowałem(-am) stół do posiłku.',
                  'Zaprojektowałem(-am) i zrobiłem(-am) kartę do kroniki.',
                  'Zaprojektowałem(-am) i wykonałem(-am) zabawkę.',
                  'Zapakowałem(-am) prezent.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów, które lubią upiększać swoje otoczenie, potrafią zaplanować urządzenie pokoju i chętnie własnoręcznie przygotują ozdobę lub prezent.',
                  'Zdolności i umiejętności zucha w tej dziedzinie można wykorzystać np. podczas urządzania zuchówki lub klasy, a także na kolonii zuchowej.',
                  'Zuchowi, który chce poszerzyć swoje umiejętności w tej dziedzinie, można polecić także sprawność „Plastyka”, „Rzeźbiarza” i „Miłośnika sztuk pięknych”.',
                  'Punkt Prawa Zucha, na który zwracamy szczególną uwagę, realizując sprawność „Dekoratora”: „Wszystkim jest z zuchem dobrze”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'dekorator',
                      title: 'Dekorator',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Własnoręcznie ozdobiłem(-am) pudełko, w którym zbieram materiały przydatne do majsterkowania i dekorowania, np. ścinki materiałów, kolorowe papiery, wstążki.',
                        'Zrobiłem(-am) wycinankę i zaprezentowałem(-am) ją na zbiórce gromady.',
                        'Ułożyłem(-am) kwiaty lub suche liście w wazonie.',
                        'Własnoręcznie zapakowałem(-am) prezent.',
                        'Narysowałem(-am) pokój moich marzeń.',
                      ]),
                  SprawData(
                      id: 'dekorator',
                      title: 'Dekorator',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Własnoręcznie ozdobiłem(-am) pudełko, w którym zbieram materiały przydatne do majsterkowania i dekorowania, np. ścinki materiałów, kolorowe papiery, wstążki.',
                        'Udekorowałem(-am) scenę na przedstawienie, salę na bal lub uroczystość szkolną.',
                        'Zrobiłem(-am) ozdobną okładkę na książkę lub zeszyt.',
                        'Zaprojektowałem(-am) i wykonałem(-am) ozdobę do domu.',
                        'Zaprojektowałem(-am) i zrobiłem(-am) kartę do kroniki.',
                      ]),
                  SprawData(
                      id: 'dekorator',
                      title: 'Dekorator',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Własnoręcznie ozdobiłem(-am) pudełko, w którym zbieram materiały przydatne do majsterkowania i dekorowania, np. ścinki materiałów, kolorowe papiery, wstążki.',
                        'Uczestniczyłem(-am) w wykonaniu wystroju zuchówki lub klasy.',
                        'Przygotowałem(-am) stół do posiłku gromady na kolonii lub biwaku. Udekorowałem(-am) go kwiatami lub własnoręcznie zrobionymi ozdobami. Pokazałem(-am) innym zuchom, jak składać serwetki w fantazyjne kształty.',
                        'Zaprojektowałem(-am) i własnoręcznie wykonałem(-am) prezent dla bliskiej osoby lub dla zwierzaka.',
                        'Przygotowałem(-am) gazetkę ścienną do zuchówki lub klasy.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '3',
                requirements: [
                  'Wiem, co to jest pięciolinia, nuta, klucz wiolinowy i pauza. Potrafię odróżnić całą nutę, półnutę, ćwierćnutę i ósemkę. Wyjaśniłem(-am) mojej gromadzie znane mi znaki muzyczne.',
                  'Znam podział instrumentów na dęte, perkusyjne i strunowe.',
                  'Samodzielnie wykonałem(-am) z dostępnych materiałów (garnki, puszki, patyki itp.) prosty instrument perkusyjny i grałem(-am) na nim podczas piosenki śpiewanej przez gromadę.',
                  'W swoim otoczeniu znalazłem(-am) kilka przedmiotów, które wydają ciekawe dźwięki.',
                  'Rozpoznałem(-am) dźwięki wydawane przez różne przedmioty, np. garnek, kartka papieru, szklanka.',
                  'Umiem wystukać proste rytmy. Akompaniowałem(-am) gromadzie do różnych piosenek.',
                  'Przygotowałem(-am) koncert z wykorzystaniem niekonwencjonalnych instrumentów (grzebień, piła, pokrywki, puszki z grochem).',
                ],
                notesForLeaders: [
                  'Sprawność ćwiczy słuch dziecka, daje możliwość rozwoju muzycznego i estetycznego oraz twórczej ekspresji. Wprowadza zucha w świat muzyki. Pokazuje, że można znaleźć ją wszędzie − nawet w codziennym otoczeniu. Uświadamia, że muzyka to nie tylko melodia, ale i poszczególne dźwięki, które można zapisać na pięciolinii. Odkrywa również tajemnice powstawania dźwięków i budowy instrumentów.',
                  'Zuchowi zainteresowanemu muzyką można polecić także sprawności „Miłośnika muzyki” i „Śpiewaka”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Grajka”: „Wszystkim jest z zuchem dobrze”, „Zuch stara się być coraz lepszy”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'grajek',
                      title: 'Grajek',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, czym jest pięciolinia, nuta i pauza. Opowiedziałem(-am) zuchom w kręgu rady, do czego służą.',
                        'Znam podział instrumentów na dęte, perkusyjne i strunowe. Wymieniłem(-am) przynajmniej jeden instrument z każdej z tych grup.',
                        'Samodzielnie wykonałem(-am) prosty instrument muzyczny z dostępnych materiałów. Zagrałem(-am) na nim podczas piosenki śpiewanej przez gromadę.',
                        'Zaprezentowałem(-am) mojej szóstce trzy przedmioty, które wydają ciekawy dźwięk.'
                      ]),
                  SprawData(
                      id: 'grajek',
                      title: 'Grajek',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, czym jest pięciolinia, nuta, pauza, klucz wiolinowy. Opowiedziałem(-am) zuchom w kręgu rady, do czego służą. Wyjaśniłem(-am) na plakacie, czym różni się cała nuta od półnuty, ćwierćnuty i ósemki.',
                        'Znam podział instrumentów na dęte, perkusyjne i strunowe. Wymieniłem(-am) przynajmniej trzy instrumenty z każdej z tych grup.',
                        'Samodzielnie wykonałem(-am) prosty instrument muzyczny z dostępnych materiałów. Zagrałem(-am) na nim podczas piosenki śpiewanej przez gromadę.',
                        'Umiem wystukać prosty rytm. Nauczyłem(-am) tego młodsze zuchy z gromady i wspólnie stworzyliśmy akompaniament do wybranej piosenki.',
                        'Umiem rozpoznać dźwięki wydawane przez różne przedmioty. Wykorzystałem(-am) przynajmniej dwa takie dźwięki do wspólnego muzykowania z gromadą.',
                      ]),
                  SprawData(
                      id: 'grajek',
                      title: 'Grajek',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, czym jest pięciolinia, nuta, pauza, klucz wiolinowy. Opowiedziałem(-am) zuchom w kręgu rady, do czego służą. Wyjaśniłem(-am), czym różni się cała nuta od półnuty, ćwierćnuty i ósemki, wyklaskując ich wartości.',
                        'Znam podział instrumentów na dęte, perkusyjne i strunowe. Wymieniłem(-am) przynajmniej pięć instrumentów z każdej z tych grup.',
                        'Samodzielnie wykonałem(-am) z dostępnych materiałów prosty instrument muzyczny. Zagrałem(-am) na nim podczas piosenki śpiewanej przez gromadę. Zagrałem(-am) na nim także wymyśloną przez siebie melodię.',
                        'Umiem wystukać prosty rytm. Nauczyłem(-am) tego młodsze zuchy z gromady i wspólnie stworzyliśmy akompaniament do wybranej piosenki.',
                        'Umiem rozpoznać dźwięki wydawane przez różne przedmioty. Wykorzystałem(-am) przynajmniej trzy takie dźwięki do wspólnego muzykowania z gromadą.',
                        'Wraz z szóstką przygotowałem(-am) koncert niekonwencjonalnych instrumentów. Wykorzystaliśmy podczas niego kilka przedmiotów, które wydają ciekawe dźwięki.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '4',
                requirements: [
                  'Znam rodzaje lalek (pacynki, marionetki, jawajki, kukły, lalki do teatru cieni). Wiem, jak się nimi posługiwać.',
                  'Zaprojektowałem(-am) lalkę do konkretnego przedstawienia.',
                  'Samodzielnie wykonałem(-am) lalkę do wybranego rodzaju przedstawienia.',
                  'Przygotowałem(-am) scenę, stroje i dekoracje do wybranego przedstawienia.',
                  'Zorganizowałem(-am) przedstawienie dla młodszych kolegów, zuchów z gromady lub rodziców.',
                  'Znam kilka piosenek i wierszy, które można zainscenizować za pomocą lalek.',
                  'Umiem podkładać głos swoim lalkom.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów zainteresowanych teatrem i lubiących majsterkować. Rozwija zdolności manualne i fantazję oraz pobudza do tworzenia.',
                  'Zuchom nieśmiałym daje okazję do aktywnego włączenia się w artystyczne przedsięwzięcia gromady.',
                  'Zuchowi zainteresowanemu teatrem i plastyką można polecić także sprawności „Mima” i „Dekoratora”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Lalkarza”: „Zuch pamięta o swoich obowiązkach.”, „Wszystkim jest z zuchem dobrze.”, „Zuch stara się być coraz lepszy”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'lalkarz',
                      title: 'Lalkarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam rodzaje lalek i wiem, do jakich przedstawień ich się używa. Zaprezentowałem(-am) je mojej szóstce w wybranej formie.',
                        'Wykonałem(-am) wybrany typ lalki.',
                        'Wykonałem(-am) wybrany element dekoracji do przygotowanego w gromadzie lub szkole przedstawienia.',
                        'Pokazałem(-am) w kręgu rady, jak podkładam głos mojej lalce.',
                      ]),
                  SprawData(
                      id: 'lalkarz',
                      title: 'Lalkarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam rodzaje lalek i wiem, do jakich przedstawień ich się używa. Zaprezentowałem(-am) je mojej szóstce w wybranej formie.',
                        'Samodzielnie zaprojektowałem(-am) i wykonałem(-am) lalkę do wybranego typu przedstawienia.',
                        'Wykonałem(-am) wybrany element dekoracji i stroju do przygotowanego w gromadzie lub szkole przedstawienia.',
                        'Zaprezentowałem(-am) gromadzie zainscenizowaną za pomocą lalki piosenkę.',
                        'Zaprezentowałem(-am) w kręgu rady, jak podkładam głos mojej lalce i jak ją animuję.',
                      ]),
                  SprawData(
                      id: 'lalkarz',
                      title: 'Lalkarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam rodzaje lalek i wiem, do jakich przedstawień ich się używa. Zaprezentowałem(-am) je mojej gromadzie w wybranej formie.',
                        'Samodzielnie zaprojektowałem(-am) i wykonałem(-am) lalki do wybranego typu przedstawienia.',
                        'Wykonałem(-am) wybrany element dekoracji i stroju oraz scenę do przygotowanego w gromadzie lub szkole przedstawienia.',
                        'Zaprezentowałem(-am) gromadzie kilka piosenek zainscenizowanych za pomocą lalki.',
                        'Przedstawiłem(-am) w kręgu rady, jak podkładam głos mojej lalce i jak ją animuję. Umiem „zagrać” lalką różne emocje.',
                        'Zorganizowałem(-am) przedstawienie dla młodszych kolegów, zuchów z gromady lub rodziców.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '5',
                requirements: [
                  'Wiem, czym zajmuje się mim. Widziałem(-am) przedstawienie pantomimiczne na żywo lub w telewizji.',
                  'Wiem, jak wygląda mim, jaki nosi strój, dlaczego podczas przedstawień ma twarz pomalowaną na biało.',
                  'Wiem, jak ważne są gesty oraz mimika w porozumiewaniu się ludzi. Za ich pomocą wyraziłem(-am) różne uczucia: smutek, złość, radość, zawstydzenie.',
                  'Przedstawiłem(-am) za pomocą gestów ręki lub całego ciała kilka scenek z codziennego życia.',
                  'Stale i regularnie ćwiczę moje ciało, by doskonalić się w sztuce mimów. Wymyśliłem(-am) krótką gimnastykę buzi i języka oraz palców i dłoni.',
                  'Wspólnie z kolegami przygotowałem(-am) krótki spektakl pantomimiczny.',
                  'Umiem podkładać głos swoim lalkom.',
                ],
                notesForLeaders: [
                  'Sprawność pokazuje, jak ważna w kontaktach międzyludzkich jest komunikacja pozawerbalna oraz jak wiele można przekazać za pomocą gestów i mimiki. Pomaga zuchom zrozumieć rozmaite ludzkie zachowania, ćwiczy także ich ciało oraz pozwala na przełamanie nieśmiałości.',
                  'Samodzielne zadania zucha można włączyć do pracy gromady podczas zuchowego teatru.',
                  'Zuchowi zainteresowanemu teatrem można polecić także sprawność „Lalkarza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mima”: „Wszystkim jest z zuchem dobrze”, „Zuch stara się być coraz lepszy”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'mim',
                      title: 'Mim',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) szóstce, czym zajmuje się mim, jak się ubiera i jak się charakteryzuje.',
                        'Obejrzałem(-am) przedstawienie pantomimiczne. Zaprezentowałem(-am) zuchom w dowolnej formie jego najciekawszy fragment i opowiedziałem(-am), czego dotyczyło.',
                        'Zagrałem(-am) dla zuchów z mojej szóstki pantomimę, wyrażając przynajmniej trzy różne uczucia i scenki z życia codziennego.',
                        'Zaprezentowałem(-am) zuchom wymyśloną przez siebie gimnastykę buzi i języka.',
                      ]),
                  SprawData(
                      id: 'mim',
                      title: 'Mim',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) gromadzie, czym zajmuje się mim, jak się ubiera i jak się charakteryzuje.',
                        'Obejrzałem(-am) przedstawienie pantomimiczne. Zaprezentowałem(-am) zuchom w dowolnej formie najciekawszy jego fragment i opowiedziałem(-am), czego dotyczyło.',
                        'Mam ulubionego mima. Przedstawiłem(-am) w kręgu rady jego sylwetkę i kilka przedstawień, w których grał.',
                        'Zagrałem(-am) dla zuchów z mojej gromady pantomimę, wyrażając przynajmniej pięć różnych uczuć i scenek z życia codziennego.',
                        'Zaprezentowałem(-am) zuchom wymyśloną przez siebie gimnastykę buzi i języka oraz palców i dłoni.',
                        'Razem z szóstką przygotowałem(-am) krótki spektakl pantomimiczny.',
                      ]),
                  SprawData(
                      id: 'mim',
                      title: 'Mim',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) gromadzie, czym zajmuje się mim, jak się ubiera i jak charakteryzuje.',
                        'Obejrzałem(-am) przedstawienie pantomimiczne. Zaprezentowałem(-am) zuchom w dowolnej formie najciekawszy jego fragment i opowiedziałem(-am), czego dotyczyło.',
                        'Mam swojego ulubionego mima. Przedstawiłem(-am) w kręgu rady jego sylwetkę i kilka przedstawień, w których grał.',
                        'Zagrałem(-am) dla zuchów z mojej gromady pantomimę, wyrażając przynajmniej pięć różnych uczuć i scenek z życia codziennego. Nauczyłem(-am) chętne zuchy wybranych ruchów.',
                        'Zaprezentowałem(-am) zuchom wymyśloną przez siebie gimnastykę buzi i języka, palców i dłoni oraz ciała.',
                        'Razem z szóstką przygotowałem(-am) krótki spektakl pantomimiczny.',
                        'Przygotowałem(-am) zuchy z mojej szóstki do przedstawienia, poprowadziłem(-am) gimnastykę oraz zaproponowałem(-am) ruchy i miny.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '6',
                requirements: [
                  'Często słucham muzyki. Mam ulubionego twórcę (wykonawcę).',
                  'Potrafię określić rodzaj muzyki (poważna, ludowa, rozrywkowa).',
                  'Potrafię rozpoznać instrument po brzmieniu.',
                  'Byłem(-am) na koncercie.',
                  'Umiem zagrać na instrumencie dwie lub trzy proste melodie.',
                  'Potrafię zagrać gamę C-dur, a-moll, zapisać ją i nazwać dźwięki.',
                  'Dbam o własny instrument.',
                  'Wykonałem(-am) koncert dla mojej gromady.',
                  'Przygotowałem(-am) akompaniament do występu gromady, klasy lub szkoły.',
                  'Brałem(-am) udział w muzycznej imprezie szkolnej.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje zdolności muzyczne i wyrabia wrażliwość na piękno.',
                  'Zuch „Miłośnik muzyki” jest znawcą muzyki − jednego lub kilku jej rodzajów (np. pop, rock, muzyka klasyczna, jazz). Potrafi zagrać na jakimś instrumencie. Należy zróżnicować poziom wymagań dla zuchów, które chodzą do szkoły muzycznej i samouków.',
                  'Zadania realizowane przez zucha można wykorzystać np. na uroczystych zbiorkach gromady lub podczas przygotowań do festiwalu piosenki.',
                  'Aby dalej rozwijać zainteresowania zucha, można polecić mu sprawności „Grajka” i „Śpiewaka”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Miłośnika muzyki”: „Zuch stara się być coraz lepszy”, „Wszystkim jest z zuchem dobrze”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'mistrz_muzyki',
                      title: 'Mistrz muzyki',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozpoznałem(-am) po brzmieniu trzy instrumenty. Narysowałem(-am) te instrumenty.',
                        'Zagrałem(-am) na instrumencie gamę C-dur i jedną melodię.',
                        'Narysowałem(-am), jak dbam o swój instrument.',
                        'Brałem(-am) udział w szkolnej imprezie muzycznej. Narysowałem(-am) obrazek przedstawiający tę imprezę i opowiedziałem(-am) o niej innym zuchom.',
                      ]),
                  SprawData(
                      id: 'mistrz_muzyki',
                      title: 'Mistrz muzyki',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zagrałem(-am) na instrumencie gamę C-dur. Zapisałem(-am) gamę C-dur na pięciolinii i podpisałem(-am) dźwięki.',
                        'Narysowałem(-am), jak dbam o swój instrument.',
                        'Byłem(-am) na koncercie. Narysowałem(-am) to i napisałem(-am), jaka muzyka była wykonywana.',
                        'Mam ulubionego wykonawcę muzyki. Narysowałem(-am) go i napisałem(-am), jaki rodzaj muzyki wykonuje.',
                        'Zagrałem(-am) gromadzie dwie melodie',
                      ]),
                  SprawData(
                      id: 'mistrz_muzyki',
                      title: 'Mistrz muzyki',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zagrałem(-am) na instrumencie dwie melodie. Zapisałem(-am) do nich nuty na pięciolinii i podpisałem(-am) dźwięki.',
                        'Narysowałem(-am), jak dbam o swój instrument.',
                        'Byłem(-am) na koncercie. Narysowałem(-am) to i napisałem(-am), jaka muzyka była wykonywana.',
                        'Mam swojego ulubionego wykonawcę muzyki. Opowiedziałem(-am) o nim na zbiórce i przygotowałem(-am) krótką audycję muzyczną z melodiami, które wykonuje.',
                        'Przygotowałem(-am) akompaniament do występu gromady, klasy lub szkoły',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '7',
                requirements: [
                  'Wiem, co to jest makrama i do czego można ją wykorzystać.',
                  'Umiem wiązać przynajmniej trzy węzły i zastosować je do wykonania makramy.',
                  'Potrafię dobrać odpowiedni sznurek, aby wykonać makramę.',
                  'Umiem korzystać z rysunków o sztuce makramy.',
                  'Nauczyłem(-am) inne zuchy podstawowego węzła makramy.',
                  'Wymyśliłem(-am) własny węzeł przydatny do wykonania makramy.',
                  'Zorganizowałem(-am) wystawę własnych prac.',
                  'Wykonałem(-am) element zdobnictwa do wykorzystania w zuchówce.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów, które lubią zajęcia manualne. Rozwija zdolności praktyczne i poczucie estetyki.',
                  'Wykonane przez zucha prace można wykorzystać np. do wystroju zuchówki lub zdobnictwa na kolonii zuchowej.',
                  'Aby dalej rozwijać zainteresowania zucha, można polecić mu inne sprawności, np. „Plastyka”, „Dekoratora” lub „Mistrza robótek ręcznych”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza makramy”: „Zuch stara się być coraz lepszy”, „Wszystkim jest z zuchem dobrze”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'mistrz_makramy',
                      title: 'Mistrz makramy',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest makrama i do czego można ją wykorzystać. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Nauczyłem(-am) się wiązać przynajmniej trzy węzły.',
                        'Nauczyłem(-am) innego zucha podstawowego węzła makramy.',
                        'Wykonałem(-am) własną makramę.',
                      ]),
                  SprawData(
                      id: 'mistrz_makramy',
                      title: 'Mistrz makramy',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest makrama i do czego można ją wykorzystać. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Nauczyłem(-am) się wiązać przynajmniej trzy węzły.',
                        'Nauczyłem(-am) inne zuchy podstawowego węzła makramy.',
                        'Dobrałem(-am) odpowiedni sznurek, aby wykonać makramę.',
                        'Wykorzystałem(-am) rysunki o sztuce makramy, aby wykonać własną makramę.',
                      ]),
                  SprawData(
                      id: 'mistrz_makramy',
                      title: 'Mistrz makramy',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest makrama i do czego można ją wykorzystać. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Nauczyłem(-am) się wiązać przynajmniej trzy węzły.',
                        'Nauczyłem(-am) inne zuchy podstawowego węzła makramy.',
                        'Wymyśliłem(-am) własny węzeł przydatny do wykonania makramy.',
                        'Zorganizowałem(-am) wystawę własnych prac makramy.',
                        'Wykonałem(-am) element zdobnictwa do wykorzystania w zuchówce',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '8',
                requirements: [
                  'Wiem, skąd wywodzi się origami. Przygotowałem(-am) plakat lub opowiedziałem(-am) o tym swojej szóstce.',
                  'Zgromadziłem(-am) zbiór ilustracji i opisy nowych figur.',
                  'Znam podstawy origami (bazy wyjściowe, np. lody). Zaprezentowałem(-am) je na zbiórce lub w klasie.',
                  'Nauczyłem(-am) inne zuchy składać figury.',
                  'Wymyśliłem(-am) własną figurę.',
                  'Stale poszerzam kolekcję własnoręcznie wykonanych prac. Zorganizowałem(-am) wystawę zuchowych prac origami.',
                  'Upiększyłem(-am) swój pokój, zuchówkę, klasę lub inne wybrane miejsce własnoręcznie wykonanymi figurami.',
                  'Podczas teatru wykorzystałem(-am) lalki wykonane techniką origami.',
                  'Zorganizowałem(-am) konkurs na najładniejszą i najciekawszą figurę origami.',
                  'Wykonałem(-am) techniką origami upominek dla kogoś bliskiego.',
                ],
                notesForLeaders: [
                  'Sprawność uczy zucha cierpliwości, dokładności i precyzji w działaniu, rozwija wyobraźnię i pomysłowość, wyrabia umiejętności manualne (nawet w przypadku zuchów, które nie lubią prac artystycznych).',
                  'Origami można wykorzystać przy wielu okazjach, więc nie powinno być problemu z włączeniem indywidualnych zadań zucha do tematyki zbiórek.',
                  'Aby dalej rozwijać zainteresowania zucha, można polecić mu np. sprawność „Modelarza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza origami”: „Wszystkim jest z zuchem dobrze”, „Zuch stara się być coraz lepszy”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'mistrz_origami',
                      title: 'Mistrz origami',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Przygotowałem(-am) plakat dotyczący sztuki origami, przedstawiający jej historię i pochodzenie.',
                        'Zgromadziłem(-am) zbiór ilustracji i opisy nowych figur.',
                        'Znam podstawy origami i zaprezentowałem(-am) je swojej szóstce.',
                        'Upiększyłem(-am) swój pokój figurami wykonanymi z origami.',
                      ]),
                  SprawData(
                      id: 'mistrz_origami',
                      title: 'Mistrz origami',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaprezentowałem(-am) na zbiórce historię i pochodzenie origami',
                        'Zgromadziłem(-am) zbiór ilustracji i opisy nowych figur.',
                        'Znam podstawy origami (bazy wyjściowe, np. lody). Zaprezentowałem(-am) je na zbiórce lub w klasie.',
                        'Zorganizowałem(-am) wystawę swoich prac wykonanych techniką origami.',
                        'Upiększyłem(-am) zuchówkę pracami wykonanymi techniką origami.',
                        'Podczas teatru wykorzystałem(-am) lalki wykonane techniką origami.'
                      ]),
                  SprawData(
                      id: 'mistrz_origami',
                      title: 'Mistrz origami',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaprezentowałem(-am) na zbiórce historię i pochodzenie origami.',
                        'Zgromadziłem(-am) zbiór ilustracji i opisy nowych figur.',
                        'Znam podstawy origami (bazy wyjściowe, np. lody). Zaprezentowałem(-am) je na zbiórce lub w klasie.',
                        'Nauczyłem(-am) inne zuchy składać figury.',
                        'Wymyśliłem(-am) własną figurę i zaprezentowałem na zbiórce.',
                        'Zorganizowałem(-am) wystawę zuchowych prac origami.',
                        'Upiększyłem(-am) zuchówkę pracami wykonanymi techniką origami.',
                        'Podczas teatru wykorzystałem(-am) lalki wykonane techniką origami.',
                        'Wykonałem(-am) techniką origami upominek dla kogoś bliskiego.',
                      ]),
                ]
            ),

            // 9. artystyczna MISTRZ ROBÓTEK RĘCZNYCH
            SprawFamilyData(
                id: '9',
                requirements: [
                  'Wykonałem(-am) robótki z różnego rodzaju materiałów.',
                  'Zrobiłem(-am) dla siebie lub dla kogoś szalik lub inny włóczkowy upominek.',
                  'Wykonałem(-am) serwetkę według wzoru (wymyślonego przez siebie lub podpatrzonego).',
                  'Gromadzę wzory i pomysły robótek ręcznych z różnych materiałów.',
                  'Znam przynajmniej jeden ze sposobów nabierania oczek, robienia łańcuszka, słupków i półsłupków. Potrafię nazwać i wykonać kilka rodzajów ściegów na drutach (francuski, pończoszniczy, ściągaczowy).',
                  'Umiem rozpoznać rodzaj włóczki.',
                  'Dobrałem(-am) włóczkę oraz druty lub szydełko do planowanej robótki.',
                  'Wykonałem(-am) coś pożytecznego dla mojej gromady.',
                ],
                notesForLeaders: [
                  'Sprawność uczy zucha cierpliwości i dokładności. Wyrabia zmysł estetyki oraz umiejętności manualne.',
                  'W zdobywaniu sprawności może pomóc mama lub babcia.',
                  'Aby dalej rozwijać zainteresowania zucha, można polecić mu sprawność „Mistrza makramy”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza robótek ręcznych”: "Zuch stara się być coraz lepszy.", "Wszystkim z zuchem jest dobrze."',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_robotek_recznych',
                      title: 'Mistrz robótek ręcznych',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zrobiłem(-am) dla siebie lub dla kogoś szalik albo inny włóczkowy upominek.',
                        'Znam przynajmniej jeden ze sposobów nabierania oczek i robienia łańcuszka.',
                        'Nauczyłem(-am) się rozpoznawać rodzaj włóczki. Opowiedziałem(-am) o rodzajach włóczki mojej szóstce.',
                        'Gromadzę wzory i pomysły robótek ręcznych z różnych materiałów.',
                      ]),
                  SprawData(
                      id: 'mistrz_robotek_recznych',
                      title: 'Mistrz robótek ręcznych',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zrobiłem(-am) dla siebie lub dla kogoś szalik albo inny włóczkowy upominek.',
                        'Wykonałem(-am) serwetkę według wzoru (wymyślonego przez siebie lub podpatrzonego).',
                        'Gromadzę wzory i pomysły robótek ręcznych z różnych materiałów.',
                        'Znam przynajmniej jeden ze sposobów nabierania oczek, robienia łańcuszka, słupków i półsłupków. Potrafię je wykonać.',
                        'Nauczyłem(-am) się rozpoznawać rodzaj włóczki. Opowiedziałem(-am) o rodzajach włóczki w kręgu rady.',
                        'Dobrałem(-am) włóczkę i druty lub szydełko do planowanej robótki.',
                      ]),
                  SprawData(
                      id: 'mistrz_robotek_recznych',
                      title: 'Mistrz robótek ręcznych',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zrobiłem(-am) dla siebie lub dla kogoś szalik albo inny włóczkowy upominek.',
                        'Wykonałem(-am) serwetkę według wzoru (wymyślonego przez siebie lub podpatrzonego).',
                        'Gromadzę wzory i pomysły robótek ręcznych z różnych materiałów.',
                        'Nauczyłem(-am) się przynajmniej jednego ze sposobów nabierania oczek, robienia łańcuszka, słupków i półsłupków.',
                        'Nauczyłem(-am) się nazw i wykonania kilku rodzajów ściegów na drutach (francuski, pończoszniczy, ściągaczowy). Pokazałem(-am) efekty mojej pracy w kręgu rady.',
                        'Nauczyłem(-am) się rozpoznawać rodzaj włóczki. Opowiedziałem(-am) o rodzajach włóczki w kręgu rady.',
                        'Wykonałem(-am) coś pożytecznego dla mojej gromady.',
                      ]),
                ]
            ),

            // 10. artystyczna MODELARZ
            SprawFamilyData(
                id: '10',
                requirements: [
                  'Sklejam modele z papieru, sklejki i tworzywa.',
                  'Zgromadziłem(-am) własną kolekcję prac.',
                  'Znam i stosuję odpowiednie rodzaje klejów.',
                  'Korzystam z fachowej literatury.',
                  'Zorganizowałem(-am) wystawę prac własnych i kolegów.',
                  'Opowiedziałem(-am) kolegom o etapach powstawania modelu.',
                  'Wykonałem(-am) własny model.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje cierpliwość, zdolności manualne i wytrwałość.',
                  'Zuch zdobywający sprawność może uczestniczyć w działaniach kółka modelarskiego lub samodzielnie uczyć się sklejać modele.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Modelarza”: "Zuch stara się być coraz lepszy.", "Wszystkim z zuchem jest dobrze."',
                ],
                sprawData: [

                  SprawData(
                      id: 'modelarz',
                      title: 'Modelarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zastosowałem(-am) różne rodzaje klejów (odpowiednio do materiału).',
                        'Skleiłem(-am) dwa modele z papieru, sklejki lub tworzywa na podstawie instrukcji.',
                        'Wykonałem (-am) własny model.',
                      ]),
                  SprawData(
                      id: 'modelarz',
                      title: 'Modelarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zastosowałem(-am) różne rodzaje klejów (odpowiednio do materiału).',
                        'Skleiłem(-am) trzy modele z papieru, sklejki lub tworzywa na podstawie instrukcji.',
                        'Wykonałem(-am) własny model. Zaprezentowałem(-am) go na zbiórce gromady.',
                        'Zgromadziłem(-am) własną kolekcję prac.',
                        'Opowiedziałem(-am) kolegom o etapach powstawania modelu.',
                      ]),
                  SprawData(
                      id: 'modelarz',
                      title: 'Modelarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zastosowałem(-am) różne rodzaje klejów (odpowiednio do materiału).',
                        'Skleiłem(-am) cztery modele z papieru, sklejki lub tworzywa na podstawie instrukcji.',
                        'Wykonałem(-am) własny model. Zaprezentowałem(-am) go na zbiórce gromady.',
                        'Opowiedziałem(-am) kolegom o etapach powstawania modelu.',
                        'Zorganizowałem(-am) wystawę prac własnych i kolegów.',
                      ]),
                ]
            ),

            // 11. artystyczna PLASTYK
            SprawFamilyData(
                id: '11',
                requirements: [
                  'Wiem, co znaczą słowa: oryginał, kopia, reprodukcja, galeria, paleta, krytyk.',
                  'Wykonałem(-am) cztery prace różnymi technikami plastycznymi.',
                  'Brałem(-am) udział w konkursie plastycznym.',
                  'Zaprojektowałem(-am) kostium lub maskę na bal gromady.',
                  'Zorganizowałem(-am) dla swojej szóstki konkurs rysunkowy.',
                  'Zapoznałem(-am) innych z różnymi technikami plastycznymi. Nauczyłem(-am) kolegów kilku z nich.',
                  'Różnymi sposobami upiększam swój pokój (dbam o estetykę wnętrza).',
                  'Wykonałem(-am) własnoręcznie lub pomogłem(-am) wykonać scenografię do przedstawienia szóstki lub gromady.',
                ],
                notesForLeaders: [
                  'Sprawność wyzwala drzemiące w dzieciach możliwości tworzenia nawet „z niczego”, według własnej wyobraźni. Zuch rozwija swoje poczucie estetyki i zdolności manualne oraz uczy się organizacji warsztatu pracy.',
                  'Samodzielne zadania zucha można włączyć do pracy gromady. Zuch zdobywający sprawność może pomóc przy organizowaniu konkursów i pokazów technik plastycznych, zadbać o wystrój zuchówki lub przyczynić się do ulepszenia szaty graficznej gazetki lub kroniki.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności plastyczne, np. „Dekoratora”, „Rzeźbiarza” i „Miłośnika sztuk pięknych”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Plastyka": "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze."',
                ],
                sprawData: [

                  SprawData(
                      id: 'plastyk',
                      title: 'Plastyk',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Dowiedziałem(-am) się, co znaczą słowa: oryginał, kopia, reprodukcja, galeria, paleta, krytyk. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Zapoznałem(-am) się z różnymi technikami plastycznymi. Nauczyłem(-am) się dwóch wybranych technik.',
                        'Wykonałem(-am) dwie prace różnymi technikami plastycznymi.',
                        'Brałem(-am) udział w konkursie plastycznym.',
                      ]),
                  SprawData(
                      id: 'plastyk',
                      title: 'Plastyk',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Dowiedziałem(-am) się, co znaczą słowa: oryginał, kopia, reprodukcja, galeria, paleta, krytyk. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Zapoznałem(-am) się z różnymi technikami plastycznymi. Nauczyłem(-am) się trzech wybranych technik.',
                        'Wykonałem(-am) trzy prace różnymi technikami plastycznymi.',
                        'Brałem(-am) udział w konkursie plastycznym.',
                        'Wykonałem(-am) własnoręcznie lub pomogłem(-am) wykonać scenografię do przedstawienia szóstki lub gromady.',
                        'Zaprojektowałem(-am) kostium na przedstawienie gromady.',
                      ]),
                  SprawData(
                      id: 'plastyk',
                      title: 'Plastyk',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Dowiedziałem(-am) się, co znaczą słowa: oryginał, reprodukcja, galeria, paleta, krytyk. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Zapoznałem(-am) się z różnymi technikami plastycznymi. Nauczyłem(-am) się trzech wybranych technik.',
                        'Wykonałem(-am) trzy prace różnymi technikami plastycznymi.',
                        'Zorganizowałem(-am) konkurs plastyczny dla mojej szóstki lub gromady.',
                        'Wziąłem(wzięłam) udział w konkursie plastycznym.',
                        'Wykonałem(-am) własnoręcznie lub pomogłem(-am) wykonać scenografię do przedstawienia szóstki lub gromady.',
                        'Zaprojektowałem(-am) kostium na przedstawienie gromady.',
                      ]),
                ]
            ),


            // 12. artystyczna RECYTATOR
            SprawFamilyData(
                id: '12',
                requirements: [
                  'Mam swoje ulubione wiersze. Potrafię je odpowiednio wyrecytować.',
                  'Znam kilka nazwisk popularnych autorów wierszy dla dzieci.',
                  'Recytowałem(-am) wiersz podczas uroczystości w gromadzie lub szkole.',
                  'Wiem, jak ćwiczyć poprawność wymowy, dykcję i oddech oraz jak dbać o gardło.',
                  'Znam zasady dobrej recytacji. Potrafię modulować głos, akcentować w mowie znaki interpunkcyjne, robić pauzy w odpowiednich momentach recytacji oraz dbać o tempo i rytm.',
                  'Słucham recytacji wierszy.',
                  'Zaprezentowałem(-am) swoich ulubionych autorów wierszy i ich dzieła.',
                ],
                notesForLeaders: [
                  'Podczas zdobywania sprawności zuch uczy się dostrzegać piękno w słowach (w poezji). Wiersze kształtują osobowość dziecka, uczą oddziaływać na drugiego człowieka, uwrażliwiają na melodyjność języka, a także poszerzają jego słownictwo. Zadania sprawności wspierają pewność siebie zucha, który poprzez głośne deklamowanie utworu przełamuje swoje lęki i nieśmiałość.',
                  'Zadania realizowane przez zucha można wykorzystać przy okazji różnych uroczystości w gromadzie i w szkole.',
                  'Aby dalej wspierać zainteresowania zucha, można mu zaproponować zdobywanie sprawności „Bajarza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Recytatora”: "Zuch kocha Boga i Polskę", "Wszystkim jest z zuchem dobrze", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'recytator',
                      title: 'Recytator',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Przedstawiłem(-am) szóstce swój ulubiony wiersz i jego autora. Wyrecytowałem(-am) go lub odpowiednio odczytałem(-am).',
                        'Znam przynajmniej dwóch autorów wierszy i bajek dla dzieci. Zaprezentowałem(-am) gromadzie ich sylwetki w dowolnej formie.',
                        'Wyrecytowałem(-am) wiersz podczas uroczystości w gromadzie lub w szkole.',
                        'Potrafię wyrecytować tekst i modulować głos, wcielając się w wybraną postać. Zaprezentowałem(-am) wybrany fragment mojej szóstce.',
                      ]),
                  SprawData(
                      id: 'recytator',
                      title: 'Recytator',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wyrecytowałem(-am) gromadzie mój ulubiony wiersz i przedstawiłem(-am) zuchom jego autora.',
                        'Znam przynajmniej trzech autorów wierszy i bajek dla dzieci. Zaprezentowałem(-am) gromadzie ich sylwetki w dowolnej formie.',
                        'Wyrecytowałem(-am) wiersz podczas uroczystości w gromadzie lub w szkole.',
                        'Potrafię wyrecytować tekst i modulować głos, wcielając się w wybrane postaci. Zaprezentowałem(-am) w kręgu rady wybrane fragmenty (co najmniej dwa).',
                        'Uczestniczyłem(-am) w wieczorku poetyckim, słuchając recytacji wierszy.',
                      ]),
                  SprawData(
                      id: 'recytator',
                      title: 'Recytator',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wyrecytowałem(-am) gromadzie mój ulubiony wiersz i przedstawiłem(-am) jego autora. Uzasadniłem(-am), dlaczego wybrałem ten utwór i czego możemy się z niego nauczyć.',
                        'Znam przynajmniej czterech autorów wierszy i bajek dla dzieci. Zaprezentowałem(-am) gromadzie ich sylwetki w dowolnej formie.',
                        'Wyrecytowałem(-am) wiersz podczas uroczystości w gromadzie lub szkole.',
                        'Potrafię wyrecytować tekst i modulować głos, wcielając się w wybrane postaci. Zaprezentowałem(-am) w kręgu rady wybrane fragmenty (co najmniej trzy).',
                        'Uczestniczyłem(-am) w wieczorku poetyckim, słuchając recytacji wierszy.',
                        'Zaprezentowałem(-am) zuchom ćwiczenia i wprawki przygotowujące do dobrej recytacji. Opowiedziałem(-am), jak dbać o gardło.',
                      ]),
                ]
            ),


            // 13. artystyczna RZEŹBIARZ
            SprawFamilyData(
                id: '13',
                requirements: [
                  'Byłem(-am) w pracowni rzeźbiarza, kamieniarza lub garncarza.',
                  'Rozróżniam rzeźbę i płaskorzeźbę. Wiem, jakie funkcje mogą pełnić rzeźby i płaskorzeźby (np. dekoracyjne, pomnikowe, nagrobne, architektoniczne).',
                  'Znam rzeźby i płaskorzeźby znajdujące się w najbliższej okolicy.',
                  'Wykonałem(-am) kilka prac różnymi technikami rzeźbiarskimi. Rzeźbiłem(-am) w glinie, plastelinie, masie solnej, masie papierowej, gipsie, kamieniu, drewnie, mydle, korze, śniegu lub piasku.',
                  'Brałem(-am) udział w konkursie rzeźbiarskim.',
                  'Urządziłem(-am) wystawę swoich prac.',
                  'Zorganizowałem(-am) kurs rzeźbienia w wybranym materiale. Pokazałem(-am), jak bezpiecznie posługiwać się narzędziami.',
                ],
                notesForLeaders: [
                  'Sprawność wspiera rozwój zdolności manualnych oraz uczy bezpiecznego korzystania z różnych narzędzi. Zuch poznaje właściwości rozmaitych materiałów i kształci swój zmysł estetyczny, poczynając od zachowania czystości na stanowisku pracy, a kończąc na nauce określania właściwych proporcji.',
                  'Aby dalej rozwijać zainteresowania zucha, można mu polecić inne sprawności artystyczne, np. „Dekoratora”, „Plastyka” i „Miłośnika sztuk pięknych”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Rzeźbiarza": "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze."',
                ],
                sprawData: [

                  SprawData(
                      id: 'rzezbiarz',
                      title: 'Rzeźbiarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) w pracowni rzeźbiarza, kamieniarza lub garncarza. Narysowałem(-am) sprzęty i narzędzia, które tam się znajdują.',
                        'Poznałem(-am) kilka technik rzeźbiarskich. Opowiedziałem(-am) o nich drużynowemu.',
                        'Wykonałem(-am) pracę wybraną techniką rzeźbiarską (np. w glinie, plastelinie lub masie solnej).',
                        'Wykonaną pracę zaprezentowałem(-am) na zbiórce gromady.',
                      ]),
                  SprawData(
                      id: 'rzezbiarz',
                      title: 'Rzeźbiarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) w pracowni rzeźbiarza, kamieniarza lub garncarza. Narysowałem(-am) sprzęty i narzędzia, które tam się znajdują.',
                        'Poznałem(-am) różne techniki rzeźbiarskie. Opowiedziałem(-am) o nich drużynowemu.',
                        'Wykonałem(-am) trzy prace wybranymi technikami rzeźbiarskimi (np. w glinie, gipsie, kamieniu, drewnie, mydle lub korze). Wykonane prace zaprezentowałem(-am) na zbiórce gromady.',
                        'Znam rzeźby i płaskorzeźby znajdujące się w różnych miejscach w najbliższej okolicy (np. pomniki, rzeźby i płaskorzeźby w kościele, w muzeum, na cmentarzu, umieszczone na budynkach). Wykonałem(-am) replikę (miniaturę) wybranej rzeźby lub płaskorzeźby, a następnie zaprezentowałem(-am) ją gromadzie.',
                        'Brałem(-am) udział w konkursie rzeźbiarskim.',
                      ]),
                  SprawData(
                      id: 'rzezbiarz',
                      title: 'Rzeźbiarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) w pracowni rzeźbiarza, kamieniarza lub garncarza. Narysowałem(-am) sprzęty i narzędzia, które tam się znajdują.',
                        'Znam rzeźby i płaskorzeźby znajdujące się w różnych miejscach w najbliższej okolicy (np. pomniki, rzeźby i płaskorzeźby w kościele, w muzeum, na cmentarzu, umieszczone na budynkach). Wykonałem(-am) replikę (miniaturę) wybranej rzeźby lub płaskorzeźby, a następnie zaprezentowałem(-am) ją gromadzie.',
                        'Poznałem(-am) różne techniki rzeźbiarskie. Opowiedziałem(-am) o nich w kręgu rady.',
                        'Wykonałem(-am) kilka prac wybranymi technikami rzeźbiarskimi (np. w glinie, plastelinie, masie solnej, masie papierowej, gipsie, kamieniu, drewnie, mydle, korze, śniegu lub piasku).',
                        'Pokazałem(-am) swoje prace na urządzonej przeze mnie wystawie.',
                        'Brałem(-am) udział w konkursie rzeźbiarskim.',
                        'Zorganizowałem(-am) kurs rzeźbienia w wybranym materiale. Pokazałem(-am), jak bezpiecznie posługiwać się narzędziami.',
                      ]),
                ]
            ),


            // 14. artystyczna SZANTYMEN
            SprawFamilyData(
                id: '14',
                requirements: [
                  'Wiem, co oznacza słowo „szanta”.',
                  'Wiem, do czego dawniej szanty były wykorzystywane na statkach. Potrafię odróżnić pieśni kubryku, wielorybnicze i szanty klasyczne.',
                  'Mam swój szantowy śpiewnik.',
                  'Potrafię zaśpiewać przynajmniej pięć szant i opowiedzieć ich treść.',
                  'Wymyśliłem(-am) gesty i ruchy do jednej z żeglarskich piosenek.',
                  'Znam nazwy kilku zespołów, które śpiewają szanty. Mam swój ulubiony zespół szantowy. Posiadam nagrania jego piosenek lub potrafię zaśpiewać kilka z nich.',
                  'Wystąpiłem(-am) na zuchowym festiwalu, śpiewając solo lub z szóstką piosenkę żeglarską.',
                ],
                notesForLeaders: [
                  'Podczas zdobywania sprawności zuch rozwija swoje zdolności muzyczne i zainteresowania związane z żeglarstwem. Kadra zuchowa musi zwrócić szczególną uwagę na dobór piosenek, gdyż niektóre szanty zawierają wulgaryzmy.',
                  'Sprawność jest przeznaczona przede wszystkim dla zuchów, które interesują się żeglarstwem lub należą do gromady, w której występuje obrzędowość żeglarska.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Szantymena”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'szantymen',
                      title: 'Szantymen',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co oznacza słowo „szanta”. Wykonałem(-am) plakat promujący szanty.',
                        'Założyłem(-am) swój szantowy śpiewnik.',
                        'Wymyśliłem(-am) gesty i ruchy do jednej z żeglarskich piosenek.',
                        'Potrafię zaśpiewać przynajmniej dwie szanty.',
                      ]),
                  SprawData(
                      id: 'szantymen',
                      title: 'Szantymen',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co oznacza słowo „szanta”. Wiem, do czego kiedyś były wykorzystywane szanty. Opowiedziałem(-am) o tym swojej szóstce.',
                        'Założyłem(-am) swój szantowy śpiewnik.',
                        'Wymyśliłem(-am) gesty i ruchy do dwóch szant.',
                        'Potrafię zaśpiewać przynajmniej trzy szanty i opowiedzieć ich treść.',
                        'Wystąpiłem(-am) na zuchowym festiwalu, śpiewając solo lub z szóstką piosenkę żeglarską.',
                        'Zorganizowałem(-am) spotkanie szantowe dla bliskich lub gromady, podczas którego śpiewaliśmy wspólnie szanty.',
                      ]),
                  SprawData(
                      id: 'szantymen',
                      title: 'Szantymen',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wykonałem(-am) plakat dotyczący szant. Wyjaśniłem(-am) na nim, skąd wzięła się ich nazwa, do czego były dawniej wykorzystywane oraz wymieniłem(-am) różne rodzaje szant (np. pieśni kubryku, wielorybnicze, szanty klasyczne).',
                        'Założyłem(-am) swój szantowy śpiewnik.',
                        'Wystąpiłem(-am) na zuchowym festiwalu, śpiewając solo lub z szóstką piosenkę żeglarską.',
                        'Znam przynajmniej jeden zespół szantowy i potrafię zaśpiewać kilka jego piosenek.',
                        'Zorganizowałem(-am) szantowe spotkanie dla bliskich lub gromady, podczas którego wspólnie śpiewaliśmy szanty.',
                      ]),
                ]
            ),


            // 15. artystyczna ŚPIEWAK
            SprawFamilyData(
                id: '15',
                requirements: [
                  'Zaśpiewałem(-am) co najmniej dziesięć piosenek i pląsów.',
                  'Nauczyłem(-am) kolegów z podwórka, klasy lub gromady dwóch nowych piosenek lub pląsów.',
                  'Założyłem(-am) swój śpiewnik, wpisuję lub wklejam do niego słowa piosenek.',
                  'Zorganizowałem(-am) lub współorganizowałem(-am) festiwal piosenki.',
                  'Byłem(-am) na koncercie lub wysłuchałem(-am) przynajmniej jednej audycji muzycznej.',
                  'Zaśpiewałem(-am) dźwięki gamy.',
                  'Zorganizowałem(-am) wraz z zuchami ze swojej szóstki „spotkanie z piosenką”.',
                  'Mam swojego ulubionego wykonawcę. Potrafię zaśpiewać jedną z jego piosenek.',
                ],
                notesForLeaders: [
                  'Zuch zdobywający sprawność rozwija swój talent muzyczny, kształci wrażliwość na piękno, ćwiczy rytmikę i przełamuje swoją nieśmiałość.',
                  'Samodzielne zadania zucha można włączyć do pracy gromady. Zuch zdobywający sprawność „Śpiewaka” może poprowadzić na zbiórce śpiew lub pląs.',
                  'Aby dalej rozwijać zainteresowania zucha, można mu polecić sprawność „Grajka” i „Miłośnika muzyki”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Śpiewaka”: "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'spiewak',
                      title: 'Śpiewak',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) śpiewnik i stale uzupełniam go nowymi piosenkami. Zaprezentowałem(-am) go mojej szóstce.',
                        'Słuchałem(-am) muzyki na żywo.',
                        'Opowiedziałem(-am) zuchom z gromady o moim ulubionym wykonawcy. Wspólnie wysłuchaliśmy piosenki z jego repertuaru.',
                        'Razem z gromadą zaśpiewałem(-am) co najmniej trzy piosenki.',
                      ]),
                  SprawData(
                      id: 'spiewak',
                      title: 'Śpiewak',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) śpiewnik i stale uzupełniam go nowymi piosenkami. Zaprezentowałem(-am) go w kręgu rady.',
                        'Słuchałem(-am) muzyki na żywo. Opowiedziałem(-am) w kręgu rady o koncercie (co mi się najbardziej podobało i co szczególnie zwróciło moją uwagę).',
                        'Opowiedziałem(-am) zuchom z gromady o moim ulubionym wykonawcy. Zaprezentowałem(-am) przedstawiający go plakat oraz zaśpiewałem(-am) moją ulubioną piosenkę z jego repertuaru.',
                        'Razem z gromadą zaśpiewałem(-am) co najmniej pięć piosenek.',
                        'Wystąpiłem(-am) na festiwalu zuchowym. Zaśpiewałem(-am) wybraną piosenkę.',
                      ]),
                  SprawData(
                      id: 'spiewak',
                      title: 'Śpiewak',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) śpiewnik i stale uzupełniam go nowymi piosenkami. Mam w nim co najmniej trzy piosenki harcerskie, które umiem już zaśpiewać. Zaśpiewałem(-am) jedną z nich zuchom z mojej gromady.',
                        'Byłem(-am) na koncercie. Opowiedziałem(-am) o nim w kręgu rady.',
                        'Opowiedziałem(-am) mojej szóstce o ciekawej audycji muzycznej, której ostatnio słuchałem(-am).',
                        'Opowiedziałem(-am) zuchom z gromady o swoim ulubionym wykonawcy. Zaprezentowałem(-am) przedstawiający go plakat oraz zaśpiewałem(-am) swoją ulubioną piosenkę z jego repertuaru.',
                        'Razem z gromadą zaśpiewałem(-am) co najmniej pięć piosenek.',
                        'Wystąpiłem(-am) na festiwalu zuchowym. Zaśpiewałem(-am) wybraną piosenkę.',
                        'Potrafię zaśpiewać dźwięki gamy. Zaprezentowałem(-am) to na zbiórce.',
                      ]),
                ]
            ),

          ]),

      SprawGroupData(
          id: 'sportowe',
          title: 'Sportowe',
          tags: ['#aktywność fizyczna', '#rekreacja' '#zdrowa rywalizacja' '#zdrowy tryb życia', '#praca nad sobą', '#ruch to zdrowie', '#w zdrowym ciele zdrowy duch'],
          familyData: [

            // 1. sportowa GIMNASTYK
            SprawFamilyData(
                id: '1',
                requirements: [
                  'Wiem, dlaczego gimnastyka jest ważna dla zdrowia. Gimnastykuję się codziennie rano',
                  'Zrobiłem(-am) pomoce do ćwiczeń gimnastycznych, np. woreczki z grochem, serso, piłki szmaciane lub szarfy.',
                  'Obejrzałem(-am) zawody gimnastyczne. ',
                  'Dobrałem(-am) ćwiczenia do muzyki',
                  'Brałem(-am) udział w pokazach gimnastycznych organizowanych przez gromadę lub szkołę.',
                  'Umiem zrobić przewrót w tył i w przód, mostek z pozycji leżącej, głęboki skłon (dotykając dłońmi podłogi) i jaskółkę.',
                  'Prowadziłem(-am) na zbiórce lub kolonii zuchowej gimnastykę oraz rozgrzewkę na lekcji wychowania fizycznego. ',
                  'Staram się zachować prawidłową postawę w każdej sytuacji.',
                  'Nauczyłem(-am) kolegów prostego układu ćwiczeń.',
                  'Wykonałem(-am) ćwiczenia na przyrządach (ławeczce, drabince, materacu, drążku)',
                  'Wykonałem(-am) układ ćwiczeń z piłką, wstążką lub skakanką.',
                ],
                notesForLeaders: [
                  'Wobec powszechnego występowania u dzieci wad postawy bardzo ważne są działania profilaktyczne, dlatego warto zachęcać zuchy do zdobywania sprawności „Gimnastyka”.',
                  'Indywidualne zadania zucha można włączyć do zbiórek gromady, szczególnie podczas zdobywania tropów „Olimpijczyków”, „Sportowców”, Trenerek”, „Rycerzy”, „Kosmonautów” lub „Żołnierzy”.',
                  'Zuchowi, który interesuje się sportem, warto zaproponować także zdobywanie innych sprawności, np. „Mistrza rolek (wrotek)”, „Mistrza deskorolki”, „Narciarza”, „Pływaka” lub „Lekkoatlety".',
                  'Punkt Prawa Zucha, na który zwracamy szczególną uwagę, realizując sprawność „Gimnastyka”: "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'gimnastyk',
                      title: 'Gimnastyk',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Gimnastykowałem(-am) się rano co najmniej trzy razy w tygodniu.',
                        'Zapisałem(-am) dwa powody, dla których gimnastyka jest ważna dla zdrowia.',
                        'Dobrałem(-am) trzy ćwiczenia do mojej ulubionej piosenki i zaprezentowałem(-am) je gromadzie na zbiórce.',
                        'Przeszedłem(-am) ścieżkę zdrowia. Narysowałem(-am) trzy ćwiczenia, które na niej wykonałem(-am).',
                      ]),
                  SprawData(
                      id: 'gimnastyk',
                      title: 'Gimnastyk',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Gimnastykowałem(-am) się rano co najmniej pięć razy w tygodniu.',
                        'Zapisałem(-am) trzy powody, dla których gimnastyka jest ważna dla zdrowia.',
                        'Przeszedłem(-am) ścieżkę zdrowia. Narysowałem(-am) cztery ćwiczenia, które na niej wykonałem(-am).',
                        'Przeprowadziłem(-am) rozgrzewkę na zbiórce, biwaku lub kolonii gromady.',
                        'Zrobiłem(-am) jedną pomoc do ćwiczeń gimnastycznych, np. woreczki z grochem, serso, piłki szmaciane lub szarfy.',
                        'Nauczyłem(-am) się wykonywać dwa ćwiczenia gimnastyczne, np. przewrót w tył i w przód, mostek z pozycji leżącej, głęboki skłon (dotykając dłońmi podłogi) i jaskółkę. Zaprezentowałem(-am) je na zbiórce',
                      ]),
                  SprawData(
                      id: 'gimnastyk',
                      title: 'Gimnastyk',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Gimnastykowałem(-am) się rano co najmniej pięć razy w tygodniu.',
                        'Zapisałem(-am) trzy powody, dla których gimnastyka jest ważna dla zdrowia.',
                        'Przeszedłem(-am) ścieżkę zdrowia. Narysowałem(-am) pięć ćwiczeń, które na niej wykonałem(-am).',
                        'Przeprowadziłem(-am) rozgrzewkę na zbiórce, biwaku lub kolonii gromady.',
                        'Wykonałem(-am) układ ćwiczeń z piłką, wstążką lub skakanką, zawierający o najmniej trzy różne ćwiczenia.',
                        'Nauczyłem(-am) się wykonywać trzy ćwiczenia, np. przewrót w tył i w przód, mostek z pozycji leżącej, głęboki skłon (dotykając dłońmi podłogi) i jaskółkę. Zaprezentowałem(-am) je na zbiórce.',
                      ]),
                ]
            ),

            // 2. sportowa LEKKOATLETA
            SprawFamilyData(
                id: '2',
                requirements: [
                  'Znam konkurencje lekkoatletyczne. Uprawiam jedną z dziedzin lekkiej atletyki.',
                  'Pracuję nad swoją kondycją fizyczną. Systematycznie uprawiam gimnastykę.',
                  'Założyłem(-am) dzienniczek swoich rekordów.',
                  'Opowiedziałem(-am) kolegom, na czym polega zdrowe odżywianie się. Wyjaśniłem(-am), dlaczego jest ważne.',
                  'Uczestniczyłem(-am) w meetingu lekkoatletycznym lub zawodach sportowych.',
                  'Znam rekordy olimpijskie i nazwiska sportowców uprawiających wybraną dyscyplinę sportową.',
                  'Zorganizowałem(-am) zawody w gromadzie lub na podwórku.',
                  'Podczas zawodów stosuję zasady fair play.',
                ],
                notesForLeaders: [
                  'Zuch „Lekkoatleta” uprawia jedną lub kilka dyscyplin lekkoatletycznych. Lubi uprawiać sport, ma dużo energii i chęci do pracy nad sobą.',
                  'Zuchy, które zdobywają tę sprawność na kolonii, mogą pomagać w porannych rozgrzewkach lub zajęciach sportowych.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Lekkoatlety”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze.", "Zuch pamięta o swoich obowiązkach."',
                ],
                sprawData: [

                  SprawData(
                      id: 'lekkoatleta',
                      title: 'Lekkoatleta',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zawsze jestem przygotowany(-na) na zajęcia sportowe. Narysowałem(-am), jak wyglądam w stroju sportowym.',
                        'Systematycznie uprawiam gimnastykę, przygotowałem(-am) trzy ulubione ćwiczenia i przedstawiłem(-am) je na zbiórce.',
                        'Zrobiłem(-am) plakat, na którym pokazałem(-am), co powinni jeść chłopcy i dziewczynki w moim wieku. Pokazałem(-am) plakat w kręgu rady. Opowiedziałem(-am) innym zuchom, na czym polega zdrowe odżywianie i dlaczego jest ważne.',
                        'Uczestniczyłem(-am) w meetingu lekkoatletycznym lub zawodach sportowych.',
                        'Założyłem(-am) dzienniczek swoich rekordów.',
                      ]),
                  SprawData(
                      id: 'lekkoatleta',
                      title: 'Lekkoatleta',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Regularnie ćwiczę na zajęciach sportowych. Zrobiłem(-am) dzienniczek swoich osiągnięć.',
                        'Mam swojego ulubionego olimpijczyka. Przedstawiłem(-am) na zbiórce prezentację o nim. Wiem, jakie pobił rekordy i ile medali zdobył.',
                        'W kręgu rady zaprezentowałem(-am) moje trzy ulubione dyscypliny sportowe. Opowiedziałem(-am) zuchom o zasadach fair play.',
                        'Narysowałem(-am) piramidę zdrowego odżywiania i zaprezentowałem(-am) ją zuchom z gromady.',
                        'Obejrzałem(-am) razem z rodzicami Igrzyska Olimpijskie.',
                        'Założyłem(-am) dzienniczek moich rekordów. Analizuję je i sprawdzam, czy moje wyniki się poprawiły.',
                        'Uczestniczyłem(-am) w meetingu lekkoatletycznym lub zawodach sportowych.',
                      ]),
                  SprawData(
                      id: 'lekkoatleta',
                      title: 'Lekkoatleta',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Regularnie ćwiczę w domu i na zajęciach sportowych. Po każdych zajęciach pamiętam o rozciąganiu. Zrobiłem(-am) plan ćwiczeń odpowiednich dla mojego wieku i zaprezentowałem(-am) go na zbiórce.',
                        'Znam co najmniej trzech mistrzów olimpijskich. Znam ich rekordy i liczbę zdobytych medali.',
                        'Zorganizowałem(-am) na zbiórce zawody między szóstkami. Opowiedziałem(-am) gromadzie o zasadach fair play. Przygotowałem(-am) drobne nagrody dla najlepszej szóstki.',
                        'Zrobiłem(-am) plakat dotyczący mojej ulubionej dziedziny lekkiej atletyki.',
                        'Nauczyłem(-am) się jednej nowej rzeczy związanej z moją ulubioną dziedziną lekkiej atletyki. Zaprezentowałem(-am) ją na zbiórce.',
                        'Założyłem(-am) dzienniczek moich rekordów. Analizuję je i sprawdzam, czy moje wyniki się poprawiły.',
                        'Przygotowałem(-am) piramidę zdrowego odżywiania. Przedstawiłem(-am) ją w kręgu rady.',
                        'Przygotowałem(-am) listę zdrowych produktów, które powinna jeść osoba w moim wieku uprawiająca sport.',
                        'Uczestniczyłem(-am) w meetingu lekkoatletycznym lub zawodach sportowych.',
                      ]),
                ]
            ),

            // 3. sportowa ŁYŻWIARZ
            SprawFamilyData(
                id: '3',
                requirements: [
                  'Byłem(-am) na lodowisku. Jeździłem(-am) na łyżwach.',
                  'Znam dyscypliny łyżwiarskie i nazwiska słynnych łyżwiarzy.',
                  'Jeździłem(-am) na jednej nodze, tyłem i w pozycji kucznej.',
                  'Wymijałem(-am) przeszkody znajdujące się na lodzie.',
                  'Wytłumaczyłem(-am) kolegom, gdzie wolno jeździć na łyżwach i jakie niebezpieczeństwa czyhają na nieostrożnych łyżwiarzy.',
                  'Oglądałem(-am) w telewizji mistrzostwa w łyżwiarstwie szybkim lub figurowym albo rozgrywki w hokeju na lodzie.',
                  'Dbam o swój sprzęt łyżwiarski.',
                  'Sam(a) zrobiłem(-am) sobie kij do hokeja.',
                  'Uczestniczyłem(-am) w zawodach łyżwiarskich lub meczu hokejowym organizowanym w gromadzie.',
                ],
                notesForLeaders: [
                  'Zuch „Łyżwiarz” kształtuje swoją zwinność, zręczność oraz ogólną kondycję fizyczną. Świetnie jeździ na łyżwach. Wie, jak bezpiecznie bawić się na lodzie oraz gdzie wolno jeździć na łyżwach.',
                  'Aby dalej rozwijać zainteresowania zucha, można mu wskazać sprawności „Mistrza rolek” i „Narciarza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Łyżwiarza”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze.", "Zuch jest dzielny."',
                ],
                sprawData: [

                  SprawData(
                      id: 'lyzwiarz',
                      title: 'Łyżwiarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) z rodzicami lub klasą na łyżwach. Przejechałem(-am) samodzielnie przynajmniej jedną długość lodowiska.',
                        'Nauczyłem(-am) się jeździć w pozycji klasycznej bez pomocy rodziców i podpórek.',
                        'Mam swojego ulubionego łyżwiarza, opowiedziałem(-am) o nim na zbiórce.',
                        'Narysowałem(-am) swoje wymarzone łyżwy.',
                        'Opowiedziałem(-am) szóstce, gdzie wolno jeździć na łyżwach i jakie niebezpieczeństwa czyhają na nieostrożnych łyżwiarzy.',
                      ]),
                  SprawData(
                      id: 'lyzwiarz',
                      title: 'Łyżwiarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) z rodzicami lub klasą na łyżwach. Przejechałem(-am) dowolną odległość tyłem.',
                        'Znam trzech sławnych łyżwiarzy. Zrobiłem(-am) plakat prezentujący jednego z nich.',
                        'Pokazałem(-am), jak wymijam przeszkody na lodzie.',
                        'Mam własne łyżwy, razem z rodzicami oddałem(-am) je do ostrzenia. Opowiedziałem(-am) szóstce, jak należy o nie dbać.',
                        'Wykonałem(-am) swój wymarzony kij do hokeja.',
                        'Oglądałem(-am) z rodzicami mistrzostwa w łyżwiarstwie.',
                        'W kręgu rady opowiedziałem(-am), gdzie wolno jeździć na łyżwach i jakie niebezpieczeństwa czyhają na nieostrożnych łyżwiarzy.',
                      ]),
                  SprawData(
                      id: 'lyzwiarz',
                      title: 'Łyżwiarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Regularnie ćwiczyłem(-am) na lodowisku. Nauczyłem(-am) młodszego zucha jazdy przodem na lodzie.',
                        'Jeździłem(-am) tyłem, w pozycji klasycznej i na jednej nodze.',
                        'W kręgu rady opowiedziałem(-am), gdzie wolno jeździć na łyżwach i jakie niebezpieczeństwa czyhają na nieostrożnych łyżwiarzy. Zaprezentowałem(-am) idealny strój na łyżwy.',
                        'Dbam o moje łyżwy, samodzielnie je czyszczę i regularnie ostrzę.',
                        'Byłem(-am) z rodzicami na zawodach hokejowych lub mistrzostwach w łyżwiarstwie.',
                        'Wykonałem(-am) swój kij hokejowy i przyozdobiłem(-am) kask.',
                        'Znam przynajmniej trzech sławnych łyżwiarzy. Mam swoją ulubioną drużynę hokejową. Zaprezentowałem(-am) ulubionych sportowców i ich osiągnięcia na zbiórce.',
                      ]),
                ]
            ),

            // 4. sportowa MISTRZ DESKOROLKI
            SprawFamilyData(
                id: '4',
                requirements: [
                  'Lubię jeździć na deskorolce. Jestem sprawny(-na) i zwinny(-na).',
                  'Znam kilka ewolucji na deskorolce. Wykonałem(-am) je.',
                  'Dbam o bezpieczeństwo podczas jazdy. Noszę nakolanniki i kask.',
                  'Konserwuję swoją deskę.',
                  'Jeżdżę tylko w miejscach do tego wyznaczonych.',
                  'Naprawiłem(-am) zepsutą deskę.',
                  'Zorganizowałem(-am) na podwórku pokaz jazdy na deskorolce.',
                ],
                notesForLeaders: [
                  'Zuch zdobywający sprawność kształtuje swoją zwinność, zręczność i ogólną kondycję fizyczną. Świetnie jeździ na desce. Wie, jak bezpiecznie się bawić i gdzie powinno się jeździć.',
                  'Aby dalej rozwijać zainteresowania zucha, można mu wskazać inne sprawności sportowe, np. „Mistrza rolek” i „Gimnastyka”.',
                  ' Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza deskorolki”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze."',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_deskorolki',
                      title: 'Mistrz deskorolki',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Potrafię jeździć na deskorolce klasycznie oraz hamować.',
                        'Dbam o swoją deskorolkę i zestaw ochraniaczy.',
                        'Narysowałem(-am) siebie podczas robienia jednej z ewolucji na deskorolce.',
                        'Znam zasady bezpiecznej jazdy na deskorolce. Przedstawiłem(-am) je w kręgu rady.',
                        'Ozdobiłem(-am) swoją deskorolkę naklejkami.',
                      ]),
                  SprawData(
                      id: 'mistrz_deskorolki',
                      title: 'Mistrz deskorolki',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Umiem jeździć na deskorolce klasycznie, skręcać i hamować.',
                        'Dbam o swoją deskorolkę i zestaw ochraniaczy.',
                        'Byłem(-am) na osiedlowym skateparku i obserwowałem(-am) inne jeżdżące osoby.',
                        'Wiem, z czego składa się deskorolka, zrobiłem(-am) plakat, który pokazuje jej budowę.',
                        'Mam swojego ulubionego skatera, opowiedziałem(-am) o nim na zbiórce.',
                        'Znam zasady bezpiecznej jazdy na deskorolce. Przedstawiłem(-am) je w kręgu rady.',
                      ]),
                  SprawData(
                      id: 'mistrz_deskorolki',
                      title: 'Mistrz deskorolki',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Umiem jeździć na deskorolce klasycznie, skręcać i hamować.',
                        'Dbam o swoją deskorolkę i zestaw ochraniaczy.',
                        'Byłem(-am) na osiedlowym skateparku i obserwowałem(-am) inne jeżdżące osoby.',
                        'Wiem, z czego składa się deskorolka. Przedstawiłem(-am) jej budowę na plakacie. ',
                        'Mam swojego ulubionego skatera. Opowiedziałem(-am) o nim na zbiórce.',
                        'Znam zasady bezpiecznej jazdy na deskorolce. Przedstawiłem(-am) je w kręgu rady.',
                      ]),
                ]
            ),

            // 5. sportowa MISTRZ GIER I ZABAW
            SprawFamilyData(
                id: '5',
                requirements: [
                  'Znam różne gry: ruchowe, umysłowe, świetlicowe i podwórkowe. Założyłem(-am) wielką księgę gier gromady.',
                  'Wykonałem(-am) przybory do gier i zabaw.',
                  'Zbieram gry i zabawy, zapisuję je w notatniku i wykorzystuję podczas zabaw.',
                  'Wymyśliłem(-am) nową grę. Wypróbowaliśmy ją na zbiórce.',
                  'Prowadziłem(-am) kilka gier na zbiórce.',
                  'Nauczyłem(-am) kolegów na podwórku lub w klasie kilku nowych gier. Opowiedziałem(-am) im o zasadzie fair play.',
                  'Byłem(-am) sędzią podczas rozgrywek.',
                  'Zrobiłem(-am) spis gier planszowych znajdujących się w zuchówce.',
                  'Zorganizowałem(-am) na podwórku festyn gier.',
                  'Dbam o znajdujące się w zuchówce przybory do gier i zabaw. Zostałem(-am) strażnikiem sprzętu sportowego na biwaku lub kolonii i prowadziłem(-am) książkę wypożyczeń.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów, które lubią grać, chętnie proponują gry i potrafią je prowadzić, a także wymyślają nowe gry i zabawy.',
                  'Indywidualne zadania zucha można włączyć do zajęć gromady - na zbiórce, biwaku lub kolonii. Zuch zdobywający sprawność może sędziować rozgrywki oraz przeprowadzić zabawę lub grę według własnego pomysłu (z pomocą kadry). Może także być inicjatorem nowych pląsów, sprawować pieczę nad sprzętem sportowym lub grami planszowymi i odpowiadać za ich wypożyczanie (np. na kolonii).',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza gier i zabaw”: "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_gier_i_zabaw',
                      title: 'Mistrz gier i zabaw',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wykonałem(-am) przybory do gier i zabaw.',
                        'Zbieram różne gry. Zapisuję je w notatniku i wykorzystuję podczas zabaw. Przeprowadziłem(-am) przynajmniej dwie gry lub zabawy na zbiórce.',
                        'Zrobiłem(-am) spis gier planszowych zgromadzonych w zuchówce.',
                        'Dbam o przybory do gier i zabaw znajdujące się w zuchówce. Zostałem(-am)strażnikiem sprzętu sportowego na kolonii i prowadziłem(-am) książkę wypożyczeń.',
                        'Przeprowadziłem(-am) na zbiórce gromady moją ulubioną grę.',
                      ]),
                  SprawData(
                      id: 'mistrz_gier_i_zabaw',
                      title: 'Mistrz gier i zabaw',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) wielką księgę gier gromady.',
                        'Prowadziłem(-am) na zbiórce przynajmniej pięć gier',
                        'Zbieram gry i zabawy, zapisuję je w notatniku i wykorzystuję podczas zabaw.',
                        'Nauczyłem(-am) kolegów na podwórku lub w klasie przynajmniej dwóch nowych gier. Opowiedziałem(-am) im o zasadzie fair play.',
                        'Zorganizowałem(-am) na podwórku festyn gier. ',
                        'Wymyśliłem(-am) trzy nowe gry. Wypróbowaliśmy je na zbiórce lub w klasie.',
                        'Zostałem(-am) strażnikiem sprzętu sportowego na biwaku lub kolonii i prowadziłem(-am) książkę wypożyczeń.',
                      ]),
                  SprawData(
                      id: 'mistrz_gier_i_zabaw',
                      title: 'Mistrz gier i zabaw',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) wielką księgę gier gromady.',
                        'Zbieram gry i zabawy, zapisuję je w notatniku i wykorzystuję podczas zabaw.',
                        'Zorganizowałem(-am) na podwórku festyn gier.',
                        'Prowadziłem(-am) przynajmniej pięć gier na zbiórce',
                        'Nauczyłem(-am) moich kolegów na podwórku lub w klasie przynajmniej dwóch nowych gier. Opowiedziałem(-am) im o zasadzie fair play.',
                        'Byłem(-am) sędzią podczas rozgrywek.',
                        'Rozmawiałem(-am) z rodzicami lub dziadkami i dowiedziałem(-am) się, w jakie gry grali, kiedy byli w moim wieku. Przeprowadziłem(-am) na zbiórce trzy zabawy podwórkowe i zaprosiłem(-am) do wspólnej zabawy rodziców lub dziadków.',
                      ]),
                ]
            ),

            // 6. sportowa MISTRZ KOMETKI
            SprawFamilyData(
                id: '6',
                requirements: [
                  'Mam własny sprzęt do kometki. Dbam o niego, naprawiłem(-am) niewielkie uszkodzenia.',
                  'Przygotowałem(-am) boisko do gry w kometkę.',
                  'Rozegrałem(-am) mecz w singlu i deblu.',
                  'Pobiłem(-am) swój rekord w podbijaniu lotki.',
                  'Pokazałem(-am) koledze, jak się gra w kometkę. Wytłumaczyłem(-am) mu zasady gry.',
                  'Nauczyłem(-am) kolegę podbijać lotkę, uderzać rakietą z forhendu i bekhendu.',
                  'Zorganizowałem(-am) podwórkowy turniej kometki.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje zwinność, spostrzegawczość, zręczność i ogólną kondycję fizyczną.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności sportowe, np. „Gimnastyka” i „Mistrza ringo”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza kometki”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_kometki',
                      title: 'Mistrz kometki',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własny sprzęt do kometki. Zadbałem(-am) o niego.',
                        'Regularnie gram w kometkę (co najmniej raz w tygodniu).',
                        'Podbiłem(-am) lotkę co najmniej pięć razy.',
                        'Znam zasady gry w kometkę i nauczyłem(-am) grać kolegę.',
                        'Zorganizowałem(-am) w szóstce turniej gry w kometkę.',
                        'Oglądałem(-am) w telewizji lub w Internecie profesjonalne zawody gry w kometkę. Opowiedziałem(-am) o nich na zbiórce gromady.',
                        'Rozegrałem(-am) mecz w singlu',
                      ]),
                  SprawData(
                      id: 'mistrz_kometki',
                      title: 'Mistrz kometki',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własny sprzęt do kometki. Zadbałem(-am) o niego. Naprawiłem(-am) niewielkie uszkodzenie.',
                        'Regularnie gram w kometkę (co najmniej raz w tygodniu).',
                        'Podbiłem(-am) lotkę co najmniej dziesięć razy.',
                        'Uderzałem(-am) rakietą z forhendu i bekhendu.',
                        'Przygotowałem(-am) boisko do gry.',
                        'Zorganizowałem(-am) podwórkowy turniej.',
                        'Oglądałem(-am) w telewizji lub w Internecie profesjonalne zawody gry w kometkę. Opowiedziałem(-am) o nich na zbiórce',
                        'Rozegrałem(-am) mecz w singlu i deblu.',
                      ]),
                  SprawData(
                      id: 'mistrz_kometki',
                      title: 'Mistrz kometki',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własny sprzęt do kometki. Kupiłem(-am) go za zaoszczędzone pieniądze.',
                        'Zadbałem(-am) o swój sprzęt. Naprawiłem(-am) niewielkie uszkodzenie.',
                        'Regularnie gram w kometkę (co najmniej raz w tygodniu).',
                        'Nauczyłem(-am) grać w kometkę co najmniej trzy osoby.',
                        'Wiem, jak wyglądają mistrzostwa gry w kometkę. Zorganizowałem(-am) mistrzostwapodwórkowe.',
                        'Poprawiłem(-am) swoje rekordy w odbijaniu lotki. Zapisałem(-am) wyniki w tabeli.',
                        'Oglądałem(-am) w telewizji lub w Internecie profesjonalne zawody gry w kometkę.',
                        'Rozegrałem(-am) mecz w singlu i deblu.',
                      ]),
                ]
            ),

            // 7. sportowa MISTRZ PING-PONGA
            SprawFamilyData(
                id: '7',
                requirements: [
                  'Rozegrałem(-am) mecz w singlu i deblu.',
                  'Pobiłem(-am) swój rekord w podbijaniu piłeczki.',
                  'Dbam o swój sprzęt. Naprawiłem(-am) niewielkie uszkodzenia.',
                  'Przygotowałem(-am) stół do gry.',
                  'Sędziowałem(-am) mecz tenisa stołowego.',
                  'Wytłumaczyłem(-am) zasady gry i fachowe słownictwo używane podczas meczu.',
                  'Brałem(-am) udział w turnieju ping-ponga.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje zwinność, spostrzegawczość, zręczność i ogólną kondycję fizyczną.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności sportowe, np. „Gimnastyka” i „Mistrza ringo”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza ping-ponga”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_ping_ponga',
                      title: 'Mistrz ping-ponga',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własną paletkę. Co najmniej raz w tygodniu gram w ping-ponga.',
                        'Podbiłem(-am) piłeczkę co najmniej pięć razy.',
                        'Znam zasady gry w ping-ponga i nauczyłem(-am) grać kolegę.',
                        'Oglądałem(-am) w telewizji lub w Internecie zawody w ping-ponga.',
                        'Przygotowałem(-am) stół do gry',
                        'Rozegrałem(-am) mecz w singlu.',
                      ]),
                  SprawData(
                      id: 'mistrz_ping_ponga',
                      title: 'Mistrz ping-ponga',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własną paletkę. Co najmniej raz w tygodniu gram w ping-ponga.',
                        'Podbiłem(-am) piłeczkę co najmniej dziesięć razy.',
                        'Rozegrałem(-am) mecz w singlu i deblu.',
                        'Nauczyłem(-am) grać w ping-ponga co najmniej jedną osobę.Nauczyłem(-am) grać w ping-ponga co najmniej jedną osobę.',
                        'Przygotowałem(-am) stół do gry.',
                        'Zorganizowałem(-am) podwórkowy turniej.',
                        'Wytłumaczyłem(-am) swojej szóstce zasady gry i fachowe słownictwo używane podczas meczu.',
                      ]),
                  SprawData(
                      id: 'mistrz_ping_ponga',
                      title: 'Mistrz ping-ponga',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Za zaoszczędzone pieniądze kupiłem(-am) własny sprzęt do ping-ponga.',
                        'Co najmniej raz w tygodniu gram w ping-ponga.',
                        'Nauczyłem(-am) grać co najmniej dwie osoby.',
                        'Wiem, jak wyglądają mistrzostwa gry w ping-ponga. Zorganizowałem(-am) mistrzostwa w gromadzie.',
                        'Poprawiłem(-am) swoje rekordy w odbijaniu piłeczki. Zapisałem(-am) wyniki w tabeli.',
                        'Wytłumaczyłem(-am) swojej szóstce zasady gry i fachowe słownictwo używane podczas meczu.',
                        'Sędziowałem(-am) mecz tenisa stołowego.',
                        'Brałem(-am) udział w turnieju ping-ponga.',
                      ]),
                ]
            ),

            // 8. sportowa MISTRZ RINGO
            SprawFamilyData(
                id: '8',
                requirements: [
                  'Poznałem(-am) historię gry w ringo. Opowiedziałem(-am) ją innym.',
                  'Umiem dobrze grać w ringo. Rzucałem(-am) i chwytałem(-am) ringo prawą i lewą ręką.',
                  'Brałem(-am) udział w rozgrywkach ringo.',
                  'Wytłumaczyłem(-am) zasady gry i nauczyłem(-am) grać w ringo kolegę.',
                  'Sędziowałem(-am) mecz.',
                  'Zorganizowałem(-am) zawody dla kolegów.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje zwinność, spostrzegawczość, zręczność oraz ogólną kondycję fizyczną.',
                  ' Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności sportowe, np. „Gimnastyka” i „Mistrza ping-ponga”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza ringo”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze".',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_ringo',
                      title: 'Mistrz ringo',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własne ringo. Gram co najmniej raz w tygodniu.',
                        'Rzucałem(-am) i chwytałem(-am) ringo jedną (wybraną) ręką.',
                        'Znam zasady gry w ringo i nauczyłem(-am) grać kolegę.',
                        'Brałem(-am) udział w rozgrywkach ringo.',
                        'Zorganizowałem(-am) zawody dla kolegów.',
                      ]),
                  SprawData(
                      id: 'mistrz_ringo',
                      title: 'Mistrz ringo',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własne ringo. Gram co najmniej raz w tygodniu.',
                        'Brałem(-am) udział w rozgrywkach ringo.',
                        'Rzucałem(-am) i chwytałem(-am) ringo prawą i lewą ręką. ',
                        'Rozegrałem(-am) mecz w ringo ze starszym kolegą.',
                        'Zorganizowałem(-am) podwórkowy turniej ringo.',
                      ]),
                  SprawData(
                      id: 'mistrz_ringo',
                      title: 'Mistrz ringo',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Kupiłem(-am) ringo za zaoszczędzone pieniądze. Gram co najmniej raz w tygodniu.',
                        'Nauczyłem(-am) grać w ringo co najmniej trzy osoby.',
                        'Zorganizowałem(-am) zawody w gromadzie. Sędziowałem(-am) mecz w ringo.',
                        'Opowiedziałem(-am) na zbiórce o najlepszym sportowcu w ringo.',
                        'Wykonałem(-am) plakat przedstawiający historię gry w ringo.',
                      ]),
                ]
            ),

            // 9. sportowa MISTRZ ROLEK (WROTEK)
            SprawFamilyData(
                id: '9',
                requirements: [
                  'Umiem jeździć na rolkach (wrotkach). Wykonałem(-am) kilka ewolucji: jeździłem(-am) na jednej nodze, tyłem i w pozycji kucznej.',
                  'Odpowiednio ubieram się do jazdy, zakładam kask.',
                  'Wymijałem(-am) przeszkody znajdujące się na drodze.',
                  'Dbam o swój sprzęt. Naprawiłem(-am) niewielkie uszkodzenie.',
                  'Uczestniczyłem(-am) w zawodach jazdy na wrotkach lub rolkach.',
                  'Wytłumaczyłem(-am) kolegom, gdzie wolno jeździć na rolkach (wrotkach) oraz jakie niebezpieczeństwa czyhają na osoby jeżdżące nieostrożnie.',
                ],
                notesForLeaders: [
                  'Zuch „Mistrz rolek” kształtuje swoją zwinność, zręczność i ogólną kondycję fizyczną. Świetnie jeździ na rolkach (wrotkach). Wie, jak bezpiecznie bawić się na rolkach i gdzie należy jeździć.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu sprawność „Łyżwiarza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza rolek (wrotek)”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze.", "Zuch jest dzielny.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_rolek',
                      title: 'Mistrz rolek',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Nauczyłem(-am) się jeździć w pozycji klasycznej bez pomocy innej osoby i bez podpórek.',
                        'Narysowałem(-am) swoje wymarzone rolki.',
                        'Odpowiednio ubieram się do jazdy i zakładam kask. Opowiedziałem (-am) o tym szóstce.',
                        'Potrafię wymijać przeszkody znajdujące się na drodze. Zaprezentowałem(-am), jak to robię.',
                      ]),
                  SprawData(
                      id: 'mistrz_rolek',
                      title: 'Mistrz rolek',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaprezentowałem(-am) jazdę w pozycji klasycznej, skręt w prawo i w lewo oraz hamowanie.',
                        'Znam przeszkody znajdujące się na drodze. Zaprezentowałem(-am), jak je omijam.',
                        'Pod okiem osoby dorosłej naoliwiłem(-am) kółka w rolkach.',
                        'Przyniosłem(-am) kask i ochraniacze na zbiórkę oraz wyjaśniłem(-am), dlaczego bardzo ważne jest ich używanie.',
                        'Jeżdżę na rolkach regularnie, co najmniej dwa razy w tygodniu.',
                      ]),
                  SprawData(
                      id: 'mistrz_rolek',
                      title: 'Mistrz rolek',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Jeżdżę na rolkach regularnie, co najmniej dwa razy w tygodniu.',
                        'Wykonałem(-am) kilka ewolucji. Jeździłem(-am) na jednej nodze, tyłem i w pozycji kucznej.',
                        'Zebrałem(-am) połowę sumy na nowe rolki. Dbam o swoje rolki.',
                        'Wiem, jakie zagrożenia występują na drodze. Wyjaśniłem(-am), jak należy wezwać pomoc w razie wypadku.',
                        'Przyniosłem(-am) kask i ochraniacze na zbiórkę oraz wyjaśniłem(-am), dlaczego bardzo ważne jest ich używanie.',
                        'Uczestniczyłem(-am) w zawodach jazdy na wrotkach (rolkach).',
                      ]),
                ]
            ),

            // 10. sportowa MISTRZ SNOWBOARDU
            SprawFamilyData(
                id: '10',
                requirements: [
                  'Lubię uprawiać sporty zimowe. Jeździłem(-am) na desce snowboardowej.',
                  'Wiem, jak wygląda powierzchnia stoku podczas różnych warunków atmosferycznych (marznący deszcz, świeże opady śniegu, odwilż). Nie jeżdżę, gdy śnieg na stoku jest bardzo twardy (zmrożony), bo wiem, czym to grozi.',
                  'Wiem, co to jest ratrak i do czego służy.',
                  'Korzystałem(-am) z wyciągu narciarskiego.',
                  'Wiem, jak się odpowiednio ubrać do jazdy na desce, zabezpieczyłem(-am) się przed mrozem.',
                  'Dbam o sprzęt, na którym jeżdżę. Smaruję deskę i naprawiam niewielkie uszkodzenia wiązań. Wiem, gdzie należy się zgłosić, aby naprawić większe uszkodzenia lub zmienić ustawienia wiązań.',
                  'Jeżdżę w bezpiecznych miejscach. Zwracam uwagę na bezpieczeństwo, kulturę jazdy oraz na inne osoby znajdujące się na stoku.',
                  'Urządziłem(-am) pokaz jazdy na snowboardzie. Zaprezentowałem(-am) skręty z omijaniem przeszkód i hamowanie.',
                  'Brałem(-am) udział w zawodach w jeździe na desce snowboardowej.',
                ],
                notesForLeaders: [
                  'Zuch „Mistrz snowboardu” ćwiczy swoją zwinność, zręczność i ogólną kondycję fizyczną. Świetnie jeździ na desce. Wie, jak bezpiecznie się bawić na śniegu i gdzie powinno się jeździć na desce snowboardowej.',
                  'Aby dalej rozwijać zainteresowania zucha, można mu wskazać inne sprawności sportowe, np. „Mistrza rolek”, „Mistrza deskorolki”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza snowboardu”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_snowboardu',
                      title: 'Mistrz snowboardu',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Jeździłem(-am) na snowboardzie.',
                        'Znam zasady bezpieczeństwa na stoku. Opowiedziałem(-am) o nich swojej szóstce.',
                        'Narysowałem(-am) ratrak i opowiedziałem(-am) na zbiórce gromady, do czego służy.',
                        'Mam zestaw ochraniaczy oraz kask. Przyniosłem(-am) je na zbiórkę i opowiedziałem(-am), jak ważne jest ich używanie.',
                        'Wiem, jak się odpowiednio ubrać do jazdy na desce. Potrafię zabezpieczyć się przed mrozem. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Pokonałem(-am) tor przeszkód.',
                        'Zaprezentowałem(-am) hamowanie na desce snowboardowej.',
                      ]),
                  SprawData(
                      id: 'mistrz_snowboardu',
                      title: 'Mistrz snowboardu',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Jeździłem(-am) na snowboardzie co najmniej trzy razy.',
                        'Znam zasady bezpieczeństwa na stoku. Zrobiłem(-am) krótki filmik lub plakat na ten temat.',
                        'Wiem, jak wygląda powierzchnia stoku podczas różnych warunków atmosferycznych (marznący deszcz, świeże opady śniegu, odwilż). Przygotowałem(-am) plakat ilustrujący ten temat.',
                        'Znam numery telefonów GOPR i TOPR. Wiem, jak udzielić pomocy podczas lawiny. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Zaprojektowałem(-am) wymarzoną deskę i ochraniacze. Zaprezentowałem(-am) projekt w gromadzie.',
                        'Korzystałem(-am) z wyciągu narciarskiego.',
                        'Pokonałem(-am) tor przeszkód.',
                        'Zaprezentowałem(-am) omijanie przeszkód i hamowanie.',
                      ]),
                  SprawData(
                      id: 'mistrz_snowboardu',
                      title: 'Mistrz snowboardu',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Umiem jeździć na snowboardzie. Byłem(-am) na zimowym wyjeździe.',
                        'Przygotowałem(-am) plakat prezentujący powierzchnię stoku w czasie różnych warunków atmosferycznych (marznący deszcz, świeże opady śniegu, odwilż).',
                        'Znam zasady bezpiecznej i kulturalnej jazdy na stoku. Przygotowałem(-am) krótki kodeks snowboardzisty.',
                        'Mam zestaw ochraniaczy oraz kask. Przyniosłem(-am) je na zbiórkę i opowiedziałem(-am), dlaczego trzeba ich używać.',
                        'Wiem, jak udzielić pomocy podczas lawiny. Znam numery alarmowe do GOPRi TOPR. Przedstawiłem(-am) je na zbiórce.',
                        'Korzystałem(-am) z wyciągu narciarskiego.',
                        'Pokonałem(-am) tor przeszkód.',
                        'Urządziłem(-am) pokaz jazdy na snowboardzie. Zaprezentowałem(-am) skręty z omijaniem przeszkód i hamowanie',
                        'Brałem(-am) udział w zawodach w jeździe na desce snowboardowej.',
                      ]),
                ]
            ),

            // 11. sportowa NARCIARZ
            SprawFamilyData(
                id: '11',
                requirements: [
                  'Umiem jeździć na nartach.',
                  'Sporządziłem(-am) schematyczne obrazki podstawowych rodzajów śniegu i opisałem(-am) każdy z nich pod kątem przydatności do jazdy na nartach.',
                  'Brałem(-am) udział w zawodach narciarskich.',
                  'Urządziłem(-am) pokaz jazdy na nartach, zaprezentowałem(-am) m.in. skręt pługiem w lewo i w prawo, podchodzenie pod górkę dwoma sposobami, omijanie przeszkód.',
                  'Korzystałem(-am) z wyciągu narciarskiego.',
                  'Dbam o sprzęt, na którym jeżdżę. Smaruję narty i naprawiam niewielkie uszkodzenia wiązań lub kijków.',
                  'Jeżdżę w bezpiecznych miejscach. Zwracam uwagę na bezpieczeństwo własne i innych osób znajdujących się na stoku.',
                  'Nauczyłem(-am) początkującego kolegę podstaw jazdy.',
                ],
                notesForLeaders: [
                  'Zuch „Narciarz” ćwiczy zwinność, zręczność i ogólną kondycję fizyczną. Świetnie jeździ na nartach. Wie, gdzie powinno się jeździć. Uczy inne zuchy bezpiecznie bawić się na śniegu.',
                  'Aby dalej rozwijać zainteresowania zucha, można mu wskazać sprawności „Saneczkarza” i „Łyżwiarza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Narciarza”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'narciarz',
                      title: 'Narciarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Jeździłem(-am) na nartach.',
                        'Znam zasady bezpiecznej i kulturalnej jazdy na stoku. Opowiedziałem(-am) o nich na zbiórce gromady.',
                        'Zaprezentowałem(-am) skręt pługiem w lewo i w prawo, podchodzenie pod górkę oraz hamowanie.',
                        'Umiem założyć buty narciarskie i kask. Zaprezentowałem(-am) tę umiejętność.',
                      ]),
                  SprawData(
                      id: 'narciarz',
                      title: 'Narciarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Jeździłem(-am) co najmniej pięć razy na nartach.',
                        'Sporządziłem(-am) schematyczne obrazki podstawowych rodzajów śniegu i opisałem(-am) każdy z nich pod kątem przydatności do jazdy na nartach.',
                        'Opowiedziałem(-am) na zbiórce o różnych konkurencjach narciarskich.',
                        'Znam zasady bezpieczeństwa na stoku, zrobiłem(-am) krótki filmik na ten temat.',
                        'Korzystałem(-am) z wyciągu narciarskiego.',
                        'Dbam o sprzęt, na którym jeżdżę. Pod okiem dorosłego nasmarowałem(-am) narty lub naprawiłem(-am) niewielkie uszkodzenia wiązań lub kijków.',
                        'Urządziłem(-am) pokaz jazdy na nartach, zaprezentowałem(-am) m.in. skręt pługiem w lewo i w prawo, podchodzenie pod górkę dwoma sposobami i hamowanie.',
                      ]),
                  SprawData(
                      id: 'narciarz',
                      title: 'Narciarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Umiem jeździć na nartach. Byłem(-am) na zimowym wyjeździe narciarskim.',
                        'Wykonałem(-am) plakat, który informuje o powierzchni stoku w czasie różnych warunków atmosferycznych (marznący deszcz, świeże opady śniegu, odwilż).',
                        'Wiem, jak udzielić pomocy podczas lawiny i znam numer alarmowy, pod który należy zadzwonić w razie niebezpieczeństwa. Przygotowałem(-am) plakat z taką informacją.',
                        'Zrobiłem(-am) projekt wymarzonych nart.',
                        'Nauczyłem(-am) kolegę jazdy na nartach.',
                        'Urządziłem(-am) pokaz jazdy na nartach. Zaprezentowałem(-am) m.in. skręt pługiem w lewo i w prawo, podchodzenie pod górkę dwoma sposobami, omijanie przeszkód i krawędziowanie.',
                        'Brałem(-am) udział w mini zawodach narciarskich.',
                      ]),
                ]
            ),

            // 12. sportowa PIŁKARZ
            SprawFamilyData(
                id: '12',
                requirements: [
                  'Rozegrałem(-am) kilkanaście meczów w piłkę nożną (grając na różnych pozycjach).',
                  ' Podczas meczu stosuję zasady fair play. Przedstawiłem(-am) te zasady w gromadzie.',
                  'Byłem(-am) sędzią podczas meczu.',
                  'Prowadziłem(-am) przed meczem rozgrzewkę. Opowiedziałem(-am) zuchom, dlaczego jest ona ważna.',
                  'Zorganizowałem(-am) mini rozgrywki na podwórku lub w gromadzie albo przeprowadziłem(-am) zawody, wybierając króla strzelców lub najlepszego bramkarza.',
                  'Umiem podbijać piłkę nogą, prowadzić ją lewą i prawą nogą oraz wybijać z rzutu rożnego. Zaprezentowałem(-am) te umiejętności gromadzie.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów w każdym wieku, zwłaszcza fanów piłki nożnej.',
                  'Zuch, który ją zdobywa, zna zasady fair play oraz wie, jak ważny jest ruch i zdrowy styl życia.',
                  'Należy zwrócić uwagę na to, aby zadania były dostosowane do poziomu zucha. Podczas zdobywania sprawności powinien on rozwinąć swoje dotychczasowe umiejętności piłkarskie oraz poznać nowe tricki.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Piłkarza”: "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'pilkarz',
                      title: 'Piłkarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Podczas meczu stosuję zasady fair play. Przedstawiłem(-am) je w swojej gromadzie..',
                        'Prowadziłem(-am) przed meczem rozgrzewkę. Opowiedziałem(-am) zuchom, dlaczego jest ona ważna.',
                        'Umiem podbijać piłkę nogą, prowadzić ją lewą lub prawą nogą. Zaprezentowałem(-am) te umiejętności swojej gromadzie.',
                        'Rozegrałem(-am) co najmniej dwa mecze.',
                      ]),
                  SprawData(
                      id: 'pilkarz',
                      title: 'Piłkarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Podczas meczu stosuję zasady fair play. Przedstawiłem(-am) je w swojej gromadzie.',
                        'Prowadziłem(-am) przed meczem rozgrzewkę. Opowiedziałem(-am) zuchom, dlaczego jest ona ważna.',
                        'Umiem podbijać piłkę nogą, prowadzić ją lewą i prawą nogą, wybijać z rzutu rożnego. Zaprezentowałem(-am) te umiejętności swojej gromadzie.',
                        'Rozegrałem(-am) kilka meczów w piłkę nożną (grając na różnych pozycjach).',
                        'Zorganizowałem(-am) mini zawody na podwórku.',
                      ]),
                  SprawData(
                      id: 'pilkarz',
                      title: 'Piłkarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozegrałem(-am) kilkanaście meczów w piłkę nożną (grając na różnych pozycjach).',
                        'Podczas meczu stosuję zasady fair play. Przygotowałem(-am) kodeks piłkarza.',
                        'Byłem(-am) sędzią podczas meczu',
                        'Zorganizowałem(-am) mini rozgrywki na podwórku lub w gromadzie albo przeprowadziłem(-am) zawody, wybierając króla strzelców lub najlepszego bramkarza.',
                        'Umiem podbijać piłkę nogą, prowadzić ją lewą i prawą nogą oraz wybijać z rzutu rożnego. Zaprezentowałem(-am) te umiejętności swojej gromadzie.',
                      ]),
                ]
            ),

            // 13. sportowa PŁYWAK
            SprawFamilyData(
                id: '13',
                requirements: [
                  'Staram się regularnie chodzić na basen lub kąpielisko.',
                  'Znam zasady bezpiecznej kąpieli w basenie i w wodach otwartych. Przestrzegam regulaminu kąpieli.',
                  'Brałem(-am) udział w zajęciach w wodzie organizowanych przez gromadę.',
                  'Potrafię przepłynąć wybranym stylem określony dystans.',
                  'Umiem nurkować i skakać do wody w bezpiecznym miejscu.',
                  'Brałem(-am) udział w wodnej olimpiadzie lub zawodach.',
                ],
                notesForLeaders: [
                  'Zuch „Pływak” zna miejsca, w których bezpiecznie można się kąpać. Wie, jak zachować się podczas zabaw w wodzie i sprawnie pływa.',
                  'Drużynowy musi wyraźnie podkreślić, że zdobycie sprawności „Pływaka” nie jest równoznaczne z uzyskaniem karty pływackiej (ale np. na kolonii zdobywanie sprawności można połączyć ze zdobywaniem karty).',
                  'Punkt Prawa Zucha, na który zwracamy szczególną uwagę, realizując sprawność „Pływaka”: "Zuch stara się być coraz lepszy.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'plywak',
                      title: 'Pływak',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'W ciągu miesiąca lub podczas kolonii byłem(-am) na basenie lub kąpielisku co najmniej cztery razy.',
                        'Narysowałem(-am), co wolno i czego nie wolno robić na basenie. Narysowałem(-am) białą i czerwoną flagę. Opisałem(-am), co one znaczą.',
                        'Brałem(-am) udział w zajęciach w wodzie organizowanych przez gromadę.',
                        'Przepłynąłem(-am) 25 m dowolnym stylem, z deską do pływania lub bez niej.',
                        'Wskoczyłem(-am) do wody z krawędzi basenu lub pomostu w miejscu dozwolonym',
                      ]),
                  SprawData(
                      id: 'plywak',
                      title: 'Pływak',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'W ciągu miesiąca lub podczas kolonii byłem(-am) na basenie lub kąpielisku co najmniej cztery razy.',
                        'Opowiedziałem(-am), w jaki sposób należy zachowywać się na basenie. Wyjaśniłem(-am), co oznaczają białe i czerwone flagi wywieszone na kąpieliskach.',
                        'Brałem(-am) udział w zajęciach w wodzie organizowanych przez gromadę.',
                        'Przepłynąłem(-am) 25 m dowolnym stylem, bez użycia deski do pływania.',
                        'Wskoczyłem(-am) do wody z krawędzi basenu lub pomostu w miejscu dozwolonym.',
                        'Wyłowiłem(-am) z dna przedmiot rzucony przez ratownika.',
                      ]),
                  SprawData(
                      id: 'plywak',
                      title: 'Pływak',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'W ciągu miesiąca lub podczas kolonii byłem(-am) na basenie lub kąpielisku co najmniej cztery razy.',
                        'Opowiedziałem(-am) innym zuchom, jak należy zachowywać się na basenie lub kąpielisku.',
                        'Wyjaśniłem(-am) innym zuchom, co oznaczają białe i czerwone flagi wywieszone na kąpieliskach.',
                        'Przeprowadziłem(-am) rozgrzewkę dla innych zuchów przed kąpielą.',
                        'Brałem(-am) udział w wodnej olimpiadzie lub zawodach.',
                        'Przepłynąłem(-am) 50 m dowolnym stylem, bez użycia deski do pływania. Przepłynąłem(-am) także 5 m pod wodą.',
                        'Wskoczyłem(-am) do wody ze słupka lub pomostu w dozwolonym miejscu. Wyłowiłem z dna przedmiot rzucony przez ratownika.',
                      ]),
                ]
            ),

            // 14. sportowa ROWERZYSTA
            SprawFamilyData(
                id: '14',
                requirements: [
                  'Znam historię roweru. Opowiedziałem kolegom, jak dawniej wyglądały rowery.',
                  'Bezpiecznie jeżdżę na rowerze. Znam podstawowe przepisy ruchu drogowego.',
                  'Znam rodzaje znaków drogowych i potrafię rozpoznać niektóre z nich.',
                  'Bawiłem(-am) się z kolegami w wyścig kolarski.',
                  'Urządziłem(-am) rowerowy tor przeszkód - jazda po ósemce, slalom itp.',
                  'Konserwuję swój rower i potrafię naprawić drobne uszkodzenia.',
                  'Potrafię przygotować rower do bezpiecznej jazdy.',
                  'Potrafię udzielić pierwszej pomocy przy skaleczeniu.',
                  'Znam numery alarmowe, pod które można zadzwonić po pomoc w razie wypadku na drodze.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje zwinność, sprawność i wytrzymałość, a także zdolność przewidywania i umiejętność podporządkowania się przepisom.',
                  'Zuch „Rowerzysta” bezpiecznie porusza się na rowerze. Nie stwarza zagrożenia dla innych osób i nie naraża własnego zdrowia.',
                  'Zuchowi zdobywającemu sprawność należy uświadomić, że nie jest ona równoznaczna z kartą rowerową.',
                  'Punkt Prawa Zucha, na który zwracamy szczególną uwagę, realizując sprawność „Rowerzysty”: "Zuch stara się być coraz lepszy.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'rowerzysta',
                      title: 'Rowerzysta',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Na zbiórce gromady opowiedziałem(-am), jak ubieram się do bezpiecznej jazdy rowerem.',
                        'Bawiłem(-am) się z kolegami w wyścig kolarski. Zaplanowałem(-am) trasę wyścigu i przed startem opowiedziałem(-am) innym rowerzystom o zasadach bezpiecznej jazdy.',
                        'Zapisałem(-am) numery alarmowe, pod które mogę zadzwonić po pomoc w razie wypadku na drodze.',
                        'Połączyłem(-am) znaki drogowe z ich opisami: droga dla rowerów, stop, ustąp pierwszeństwa przejazdu, droga z pierwszeństwem przejazdu, zakaz wjazdu rowerów.',
                      ]),
                  SprawData(
                      id: 'rowerzysta',
                      title: 'Rowerzysta',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wyszukałem(-am) ilustracje i informacje o tym, jak wyglądały rowery w przeszłości. Pokazałem(-am) na zbiórce zdjęcia i opowiedziałem(-am) o nich kolegom.',
                        'Urządziłem(-am) rowerowy tor przeszkód − jazda po ósemce, slalom. Zaprezentowałem(-am) bezpieczny przejazd torem.',
                        'Zaopatrzyłem(-am) swój rower w światła i dzwonek. Posiadam co najmniej jeden odblask.',
                        'Zapisałem(-am) numery alarmowe, pod które mogę zadzwonić po pomoc w razie wypadku na drodze.',
                        'Połączyłem(-am) znaki drogowe z ich opisami: droga dla rowerów, stop, ustąp pierwszeństwa przejazdu, droga z pierwszeństwem przejazdu, zakaz wjazdu rowerów, przejście dla pieszych, droga dla pieszych.',
                      ]),
                  SprawData(
                      id: 'rowerzysta',
                      title: 'Rowerzysta',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Z pamięci wymieniłem(-am) numery alarmowe, pod które mogę zadzwonić po pomoc w razie wypadku na drodze.',
                        'Urządziłem(-am) rowerowy tor przeszkód − jazda po ósemce, slalom, jazda pod górkę, jazda po nierównej powierzchni. Zaprezentowałem(-am) bezpieczny przejazd torem.',
                        'Pokazałem(-am) innym zuchom, jak udzielić pomocy w razie skaleczenia kolana lub łokcia.',
                        'Napompowałem(-am) koła mojego roweru.',
                        'Zaopatrzyłem(-am) swój rower w światła i dzwonek. Posiadam co najmniej jedenodblask.',
                        'Połączyłem(-am) znaki drogowe z ich opisami.',
                        'Jako rowerzysta potrafię zasygnalizować na drodze manewry skrętu w prawo i lewo. Pokazałem(-am) to innym zuchom i wyjaśniłem(-am) im, na co trzeba zwracać uwagę podczas jazdy rowerem na ścieżce rowerowej i na drodze.',
                      ]),
                ]
            ),

            // 15. sportowa SANECZKARZ
            SprawFamilyData(
                id: '15',
                requirements: [
                  'Umiem kierować sankami. Pokonałem(-am) górkę lub tor przeszkód.',
                  'Zabezpieczyłem(-am) swój sprzęt i wykonałem(-am) potrzebne naprawy.',
                  'Jeżdżę na bezpiecznych górkach. Odradzam kolegom jazdę w miejscach niebezpiecznych. Wymyśliłem(-am) własny bezpieczny sposób zjeżdżania na sankach. Ułożyłem(-am) regulamin jazdy na sankach na biwaku lub zimowisku.',
                  'Odpowiednio się ubieram, wychodząc na sanki. Przedstawiłem(-am) te zasady w formie graficznej na zbiórce gromady. ',
                  'Narysowałem(-am) plan bezpiecznej górki. Zaznaczyłem(-am) na nim podejścia dla saneczkarzy, zjazdy dla bardziej i mniej zaawansowanych oraz poczekalnię dla rodziców. Uwzględniłem(-am) bezpieczną odległość od ulic, chodników, płotów i drzew.',
                  'Brałem(-am) udział w zawodach saneczkowych',
                  'Urządziłem(-am) pokaz jazdy na sankach (jazda w różnych pozycjach, w kuligu,slalomem, zaprzęgiem).',
                  'Zorganizowałem(-am) dla gromady wyścigi saneczkowych zaprzęgów.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje zwinność, zręczność i ogólną kondycję fizyczną.',
                  'Zucha zdobywającego tę sprawność należy uczulić przede wszystkim na bezpieczeństwo jazdy − i to nie tylko osoby jeżdżącej, lecz także otoczenia.',
                  'Sanki to doskonała zimowa zabawa, szczególnie jeśli bierze w niej udział grupa dzieci. Dlatego warto pomyśleć o wykorzystaniu do wspólnej zabawy umiejętności kilku zuchów „Saneczkarzy”.',
                  'Aby dalej rozwijać zainteresowania zucha sportem, można mu wskazać m.in. sprawności „Łyżwiarza” i „Narciarza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Saneczkarza”: "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'saneczkarz',
                      title: 'Saneczkarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Umiem kierować sankami. Pokonałem(-am) górkę lub tor przeszkód.',
                        'Zabezpieczyłem(-am) swój sprzęt i wykonałem(-am) potrzebne naprawy.',
                        'Odpowiednio się ubieram wychodząc na sanki. Na zbiórce gromady przedstawiłem(-am) zasady ubioru na sanki w postaci plakatu.',
                        'Narysowałem(-am) plan bezpiecznej górki, na którym zaznaczyłem(-am) podejścia dla saneczkarzy, zjazdy dla bardziej i mniej zaawansowanych, poczekalnię dla rodziców. Uwzględniłem(-am) bezpieczną odległość od ulic, chodników, płotów i drzew.',
                        'Brałem(-am) udział w zawodach saneczkowych.',
                      ]),
                  SprawData(
                      id: 'saneczkarz',
                      title: 'Saneczkarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zabezpieczyłem(-am) swój sprzęt i wykonałem(-am) potrzebne naprawy.',
                        'Jeżdżę na bezpiecznych górkach i odradzam innym jazdę w miejscach niebezpiecznych. Wymyśliłem(-am) własny bezpieczny sposób zjeżdżania na sankach. Ułożyłem(-am) regulamin jazdy na sankach na biwaku.',
                        'Odpowiednio się ubieram, wychodząc na sanki. Na zbiórce gromady przedstawiłem(-am) rysunek pokazujący zasady ubioru na sanki.',
                        'Narysowałem(-am) plan bezpiecznej górki, w którym zaznaczyłem(-am) podejścia dla saneczkarzy, zjazdy dla bardziej i mniej zaawansowanych, poczekalnię dla rodziców. Uwzględniłem(-am) bezpieczną odległość od ulic, chodników, płotów i drzew.',
                        'Brałem(-am) udział w zawodach saneczkowych.',
                        'Urządziłem(-am) pokaz jazdy na sankach (jazda w różnych pozycjach, w kuligu, slalomem, zaprzęgiem).',
                      ]),
                  SprawData(
                      id: 'saneczkarz',
                      title: 'Saneczkarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zabezpieczyłem(-am) swój sprzęt i wykonałem(-am) potrzebne naprawy.',
                        'Jeżdżę na bezpiecznych górkach i odradzam innym jazdę w miejscach niebezpiecznych. Wymyśliłem(-am) własny bezpieczny sposób zjeżdżania na sankach. Ułożyłem(-am) regulamin jazdy na sankach na biwaku.',
                        'Odpowiednio się ubieram, wychodząc na sanki. Na zbiórce gromady przedstawiłem(-am) rysunek pokazujący zasady ubioru na sanki.',
                        'Brałem(-am) udział w zawodach saneczkowych.',
                        'Urządziłem(-am) pokaz jazdy na sankach (jazda w różnych pozycjach, w kuligu, slalomem, zaprzęgiem).',
                        'Zorganizowałem(-am) dla gromady wyścigi saneczkowych zaprzęgów.',
                      ]),
                ]
            ),

            // 16. sportowa SZACHISTA
            SprawFamilyData(
                id: '16',
                requirements: [
                  'Znam podstawowe zasady gry w szachy i przedstawiłem(-am) je na plakacie lub opowiedziałem(-am) o nich w gromadzie.',
                  'Potrafię rozpoznać wszystkie figury szachowe i znam ich ruchy. Nauczyłem(-am) nazw figur i ich ruchów kolegę.',
                  'Rozegrałem(-am) kilka partii szachowych z kolegami lub rodzeństwem.',
                  'Zorganizowałem(-am) turniej szachowy lub żywe szachy.',
                  'Potrafię ocenić sytuację na szachownicy i wykonać właściwy ruch. Nauczyłem(-am) tej taktyki kolegę.',
                  'Znam nazwiska mistrzów szachowych. Zaprezentowałem(-am) je w gromadzie. ',
                  'Wiem, na czym polega obrona i atak podczas gry. Opowiedziałem(-am) o tym w swojej szóstce.',
                  'Nauczyłem(-am) grać w szachy kolegę. Wytłumaczyłem(-am) jemu/jej, co oznacza roszada, pat i mat.',
                ],
                notesForLeaders: [
                  'Zdobywając tę sprawność, zuch rozwija zmysł taktyczny, uczy się strategii i logicznego myślenia, kształci umiejętność przewidywania dalszego ciągu zdarzeń i konsekwencji podejmowanych działań.',
                  'Zuch „Szachista” to strateg, który w różnych sytuacjach potrafi wykorzystać swoje umiejętności na potrzeby całej gromady.',
                  'Zdobywanie sprawności powinno być dostosowane do indywidualnych umiejętności zucha i jego znajomości gry w szachy.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Szachisty”: "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'szachista',
                      title: 'Szachista',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam podstawowe zasady gry w szachy. Przedstawiłem(-am) je na plakacie lub opowiedziałem(-am) o nich w gromadzie.',
                        'Rozegrałem(-am) partię szachową z kolegami lub rodzeństwem.',
                        'Potrafię rozpoznać wszystkie figury szachowe i znam ich ruchy. Nauczyłem(-am) nazw figur i ich ruchów kolegę.',
                      ]),
                  SprawData(
                      id: 'szachista',
                      title: 'Szachista',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam podstawowe zasady gry w szachy. Przedstawiłem(-am) je na plakacie lub opowiedziałem(-am) o nich w gromadzie.',
                        'Potrafię rozpoznać wszystkie figury szachowe i znam ich ruchy. Nauczyłem(-am) nazw figur i ich ruchów kolegę.',
                        'Rozegrałem(-am) kilka partii szachowych z kolegami lub rodzeństwem.',
                        'Potrafię ocenić sytuację na szachownicy i wykonać właściwy ruch. Nauczyłem(-am) tej taktyki kolegę.',
                        'Znam nazwiska mistrzów szachowych. Zaprezentowałem(-am) je w gromadzie.',
                        'Wiem, na czym polega obrona i atak podczas gry. Opowiedziałem(-am) o tym w swojej szóstce.',
                      ]),
                  SprawData(
                      id: 'szachista',
                      title: 'Szachista',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Potrafię rozpoznać wszystkie figury szachowe. Znam ich ruchy. Nauczyłem(-am) nazw figur i ich ruchów kolegę.',
                        'Zorganizowałem(-am) turniej szachowy lub żywe szachy.',
                        'Potrafię ocenić sytuację na szachownicy i wykonać właściwy ruch. Nauczyłem(-am) tej taktyki kolegę.',
                        'Rozegrałem(-am) kilka partii szachowych z kolegami lub rodzeństwem.',
                        'Znam nazwiska mistrzów szachowych. Zaprezentowałem(-am) je w gromadzie.',
                        'Nauczyłem(-am) grać w szachy kolegę. Wytłumaczyłem(-am) jemu/jej, co oznacza roszada, pat i mat.',
                      ]),
                ]
            ),

            // 17. sportowa TENISISTA
            SprawFamilyData(
                id: '17',
                requirements: [
                  'Rozegrałem(-am) mecz w singlu i deblu.',
                  'Pobiłem(-am) swój rekord w podbijaniu piłeczki tenisowej. Zorganizowałem(-am) mini zawody w szóstce.',
                  'Dbam o swój sprzęt. Naprawiłem(-am) niewielkie uszkodzenia. Przygotowałem(-am) poradnik na ten temat.',
                  'Przygotowałem(-am) kort do gry.',
                  'Sędziowałem(-am) mecz tenisa.',
                  'Wytłumaczyłem(-am) w gromadzie zasady gry oraz fachowe słownictwo używane podczas meczu.',
                  'Brałem(-am) udział w turnieju tenisa.',
                  'Nauczyłem(-am) kolegę odbijać piłkę z forhendu i bekhendu.',
                  'Zorganizowałem(-am) turniej tenisa w gromadzie.',
                ],
                notesForLeaders: [
                  'Sprawność ćwiczy zwinność, spostrzegawczość, zręczność i ogólną kondycję fizyczną, a także umiejętność przestrzegania zasad fair play.',
                  'Zdobywając ją, zuch może promować zdrowy styl życia i hasło „W zdrowym ciele zdrowy duch”.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności sportowe, np. „Gimnastyka” lub „Mistrza ringo”.',
                  ' Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Tenisisty”: "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy.".',
                ],
                sprawData: [

                  SprawData(
                      id: 'tenisista',
                      title: 'Tenisista',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozegrałem(-am) mecz w singlu i deblu.',
                        'Pobiłem(-am) swój rekord w podbijaniu piłeczki tenisowej.',
                        'Zorganizowałem(-am) mini zawody w szóstce.',
                        'Dbam o swój sprzęt, naprawiłem(-am) niewielkie uszkodzenia. Przygotowałem(-am) poradnik na ten temat.',
                        'Przygotowałem(-am) kort do gry.',
                        'Brałem(-am) udział w turnieju tenisa.',
                      ]),
                  SprawData(
                      id: 'tenisista',
                      title: 'Tenisista',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozegrałem(-am) mecz w singlu i deblu.',
                        'Przygotowałem(-am) kort do gry.',
                        'Sędziowałem(-am) mecz tenisa.',
                        'Wytłumaczyłem(-am) zasady gry i fachowe słownictwo używane podczas meczu. Zaprezentowałem(-am) to w gromadzie.',
                        'Brałem(-am) udział w turnieju tenisa.',
                      ]),
                  SprawData(
                      id: 'tenisista',
                      title: 'Tenisista',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wytłumaczyłem(-am) zasady gry i fachowe słownictwo używane podczas meczu. Zaprezentowałem(-am) to w gromadzie.',
                        'Sędziowałem(-am) mecz tenisa.',
                        'Brałem(-am) udział w turnieju tenisa.',
                        'Nauczyłem(-am) kolegę odbijać piłkę z forhendu i bekhendu.',
                        'Zorganizowałem(-am) turniej tenisa w gromadzie.',
                      ]),
                ]
            ),

          ]),

      SprawGroupData(
          id: 'zaradnosc_zyciowa',
          title: 'Zaradność życiowa',
          tags: ['#samodzielność', '#obowiązkowość', '#rodzina', '#dom', '#empatia', '#umiejętność życia w społeczeństwie', '#zróbtosam'],
          familyData: [

            SprawFamilyData(
                id: '1',
                requirements: [
                  'Używam słów: proszę, przepraszam, dziękuję, dzień dobry, dobranoc, do widzenia. Opowiedziałam o tym swojej szóstce.',
                  'Zachowuję się uprzejmie wobec chłopców i dziewcząt. Nie zaczepiam ich i nie przezywam. Stworzyłam poradnik młodej damy.',
                  'Przeczytałam książkę lub artykuł z czasopisma dla dzieci o zasadach savoir-vivre’u. Ułożyłam kodeks damy.',
                  'Zrobiłam gazetkę na temat savoir-vivre’u lub opowiedziałam o zasadach savoir-vivre’u kolegom.',
                  'Spory rozwiązuję w sposób kulturalny. Zorganizowałam obrady okrągłego stołu, w czasie których rozstrzygaliśmy problem, przestrzegając zasad kulturalnej dyskusji.',
                  'Przygotowałam dla papierowych lalek ubranka na różne okazje.',
                  'Umiem ubrać się odpowiednio do okazji. Przygotowałam pokaz mody w gromadzie lub klasie.',
                  'Nakrywałam do stołu w domu, na kolonii zuchowej, podczas święta klasowego lub w gromadzie.',
                  'Zaprosiłam kolegów na herbatkę (urodziny). Urządziłam przyjęcie.',
                  'Potrafię rozmawiać przez telefon. Zaprezentowałam na zbiórce podstawowe zasady kulturalnej rozmowy telefonicznej ',
                ],
                notesForLeaders: [
                  'Sprawność jest przydatna do unormowania relacji między dziewczynkami a chłopcami.',
                  'Realizowane przez zucha zadania można włączyć do prawie wszystkich zabaw (ponieważ zawsze należy zachowywać się kulturalnie).',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Damy”: "Wszystkim jest z zuchem dobrze." "Zuch stara się być coraz lepszy." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'dama',
                      title: 'Dama',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Używam słów: proszę, przepraszam, dziękuję, dzień dobry, dobranoc, do widzenia. Opowiedziałam swojej szóstce, dlaczego ważne są zwroty grzecznościowe.',
                        'Zachowuję się uprzejmie wobec chłopców i dziewcząt. Nie zaczepiam ich i nie przezywam. Stworzyłam poradnik młodej damy, w którym zawarłam najważniejsze porady.',
                        'Zrobiłam gazetkę na temat savoir-vivre’u lub opowiedziałam o zasadach savoir-vivre’u kolegom.',
                        'Wykonałam dla papierowych lalek ubranka na różne okazje. Wiem, jak się ubrać odpowiednio do okazji.',
                        'Nakrywałam do stołu w domu, na kolonii zuchowej, podczas święta klasowego lub w gromadzie.',
                      ]),
                  SprawData(
                      id: 'dama',
                      title: 'Dama',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Używam słów: proszę, przepraszam, dziękuję, dzień dobry, dobranoc, do widzenia. Opowiedziałam szóstce, dlaczego ważne są zwroty grzecznościowe.',
                        'Zachowuję się uprzejmie wobec chłopców i dziewcząt. Nie zaczepiam ich i nie przezywam. Stworzyłam poradnik młodej damy, w którym zawarłam najważniejsze porady.',
                        'Zrobiłam gazetkę na temat savoir-vivre’u lub opowiedziałam o zasadach savoir-vivre’u kolegom.',
                        'Umiem ubrać się odpowiednio do okazji. Przygotowałam pokaz mody w gromadzie lub klasie.',
                        ' Nakrywałam do stołu w domu, na kolonii zuchowej, podczas święta klasowego lub w gromadzie.',
                        'Zaprosiłam kolegów na herbatkę (urodziny). Urządziłam przyjęcie.',
                        'Potrafię rozmawiać przez telefon. Zaprezentowałam na zbiórce podstawowe zasady kulturalnej rozmowy telefonicznej.',
                      ]),
                  SprawData(
                      id: 'dama',
                      title: 'Dama',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Przeczytałam książkę lub artykuł z czasopisma dla dzieci o zasadach savoir-vivre’u. Ułożyłam kodeks damy, który zaprezentowałam kolegom z klasy lub gromady.',
                        'Zrobiłam gazetkę na temat savoir-vivre’u lub opowiedziałam o zasadach savoir-vivre’u kolegom.',
                        'Spory rozwiązuję w sposób kulturalny. Zorganizowałam obrady okrągłego stołu, w czasie których rozstrzygaliśmy problem, przestrzegając zasad kulturalnej dyskusji.',
                        'Umiem ubrać się odpowiednio do okazji. Przygotowałam pokaz mody w gromadzie lub w klasie.',
                        'Nakrywałam do stołu w domu, na kolonii zuchowej, podczas święta klasowego lub w gromadzie.',
                        'Zaprosiłam kolegów na herbatkę (urodziny). Urządziłam przyjęcie.',
                        'Potrafię rozmawiać przez telefon. Zaprezentowałam na zbiórce podstawowe zasady kulturalnej rozmowy telefonicznej.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '2',
                requirements: [
                  'Używam słów: proszę, dziękuję, przepraszam, dzień dobry, dobranoc i do widzenia.',
                  'Znam zasady savoir-vivre’u. Opowiedziałem o nich na zbiórce.',
                  'Zachowuję się w sposób uprzejmy wobec innych. Przedstawiłem te zasady podczas zbiórki.',
                  'Potrafię rozwiązywać spory w sposób kulturalny.',
                  'Potrafię ubrać się stosownie do okazji i pory roku. Zawsze jestem schludnie ubrany.',
                  ' Nakrywałem do stołu podczas rodzinnej uroczystości.',
                  'Umiem prowadzić rozmowy telefoniczne.',
                ],
                notesForLeaders: [
                  'Sprawność ma na celu wskazanie zuchom prawidłowych postaw i zasad współpracy pomiędzy dziewczynkami a chłopcami.',
                  'Sprawność powinna być zdobywana co roku podczas zbiórek pierwszego miesiąca, aby przypominać o zasadach obowiązujących w naszej kulturze.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Dżentelmena”: "Zuch stara się być coraz lepszy." i  "Zuch mówi prawdę." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'dzentelmen',
                      title: 'Dżentelmen',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Używam słów dziękuję, przepraszam, proszę, dzień dobry, do widzenia. Wytłumaczyłem swojej szóstce, dlaczego te słowa są bardzo ważne.',
                        'Umiem ubrać się stosownie do okazji i pory roku. Wiem, jak prawidłowo złożyć ubranie. Wykonałem pokaz na zbiórce.',
                        'Nakryłem do stołu podczas rodzinnej uroczystości.',
                        'Zadzwoniłem do drużynowego, nie zapominając o zasadach poprawnego porozumiewania się.',
                        'Samodzielnie dobrałem ubranie galowe na ważną uroczystość.',
                      ]),
                  SprawData(
                      id: 'dzentelmen',
                      title: 'Dżentelmen',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Używam słów dziękuję, przepraszam, proszę, dzień dobry, do widzenia. Wytłumaczyłem swojej szóstce, dlaczego te słowa są bardzo ważne.',
                        'Umiem ubrać się stosownie do okazji i pory roku. Wiem, jak prawidłowo złożyć ubranie. Wykonałem pokaz na zbiórce.',
                        'Przeczytałem książkę dla dzieci na temat savoir-vivre’u.',
                        'Opowiedziałem swojej szóstce o zasadach savoir-vivre’u.',
                        'Wiem, że spory załatwia się w sposób kulturalny. Przygotowałem plakat o tej tematyce.',
                        'Przeprowadziłem przez telefon kulturalną rozmowę z osobą dorosłą na dowolny temat.',
                        'Samodzielnie dobrałem ubranie galowe na ważną uroczystość.',
                      ]),
                  SprawData(
                      id: 'dzentelmen',
                      title: 'Dżentelmen',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Używam słów dziękuję, przepraszam, proszę, dzień dobry, do widzenia. Wytłumaczyłem swojej szóstce, dlaczego te słowa są bardzo ważne.',
                        'Umiem ubrać się stosownie do okazji i pory roku. Wiem, jak prawidłowo złożyć ubranie. Wykonałem pokaz na zbiórce.',
                        'Przeprowadziłem przez telefon kulturalną rozmowę z osobą dorosłą na dowolny temat.',
                        'Nakryłem do stołu w domu lub na kolonii.',
                        'Przeczytałem książkę dla dzieci na temat savoir-vivreu’.',
                        'Samodzielnie dobrałem ubranie galowe na ważną uroczystość.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '3',
                requirements: [
                  'Wiem, co znaczy słowo „epidemia” i jak mogą rozprzestrzeniać się choroby. Wiem, co to znaczy „przebywać na kwarantannie”.',
                  'Potrafię poprawnie myć ręce. Zwracam uwagę na całą powierzchnię dłoni i odpowiedni czas mycia rąk.',
                  'Potrafię przygotować danie (na śniadanie, podwieczorek, kolację) ze składników dostępnych w domu, z zachowaniem zasad higieny.',
                  'Dbam o swoją sprawność fizyczną i zachęcam do tego domowników.',
                  'Dbam o więzi rodzinne podczas izolacji.',
                ],
                notesForLeaders: [
                  'Zuch zdobywający sprawność uczy się zaradności i odpowiedzialności społecznej podczas stanu epidemii. Sprawność pomaga wyrobić dobre nawyki (np. częste mycie rąk i dbanie o kondycję fizyczną), włączyć zucha w obowiązki domowe i zacieśnić więzi rodzinne.',
                  'Realizacja sprawności ma sens wtedy, gdy zuch musi przez pewien czas przebywać w „domowej izolacji”, ponieważ tylko powtarzanie niektórych czynności pomoże wypracować zdrowe nawyki.',
                  'Sprawność można zdobyć bez angażowania innych członków gromady (w zamian za to zuch współpracuje ze swoimi domownikami).',
                  'Pierwowzór sprawności został opracowany na początku pandemii COVID-19 przez XIII „Czarny” Szczep im. Zawiszy Czarnego z Hufca ZHP Radomsko.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Epidemiologa”: "Zuch pamięta o swoich obowiązkach" Wszystkim jest z zuchem dobrze" "Zuch jest dzielny".',

                ],
                sprawData: [
                  SprawData(
                      id: 'epidemiolog',
                      title: 'Epidemiolog',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co znaczą słowa „epidemia” i „kwarantanna”. Wyjaśniłem(-am) je własnymi słowami.',
                        'Wybrałem(-am) piosenkę (lub jej 30-sekundowy fragment), którą śpiewam zawsze podczas mycia rąk, aby robić to odpowiednio długo.',
                        'Pomogłem(-am) rodzicom lub starszemu rodzeństwu w przygotowaniu dla domowników wspólnego posiłku. Wykorzystaliśmy dostępne w domu składniki.',
                        'Mam ulubioną aktywność fizyczną, którą mogę wykonywać w domu. Wykonuję ją regularnie razem z domownikami.',
                        'Utrzymywałem(-am) kontakt (np. telefoniczny) z bliskimi, z którymi na co dzień nie mieszkam.',
                      ]),
                  SprawData(
                      id: 'epidemiolog',
                      title: 'Epidemiolog',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co znaczy słowo „epidemia”. Narysowałem(-am) komiks o tym, jak rozprzestrzeniają się choroby zakaźne i jak kwarantanna może temu zapobiegać.',
                        'Często myję ręce. Wykonałem(-am) plakat z instrukcją mycia rąk. Powiesiłem(-am) w widocznym miejscu (na przykład przy umywalce).',
                        'Przygotowałem(-am) z pomocą kogoś starszego wybrane danie dla wszystkich domowników. Wykorzystałem(-am) składniki dostępne w domu.',
                        'Przygotowałem(-am) kilka ćwiczeń, które można bezpiecznie wykonywać w domu. W moje ćwiczenia angażuję domowników.',
                        'Utrzymywałem(-am) kontakt (np. telefoniczny) z bliskimi, z którymi na co dzień nie mieszkam.',
                      ]),
                  SprawData(
                      id: 'epidemiolog',
                      title: 'Epidemiolog',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co znaczy słowo „epidemia”. Narysowałem(-am) komiks o tym, jak rozprzestrzeniają się choroby zakaźne i jak kwarantanna może temu zapobiegać.',
                        'Często myję ręce. Nagrałem(-am) filmik, w którym pokazuję, jak poprawnie myć ręce.',
                        'Samodzielnie przygotowałem(-am) dla wszystkich domowników danie według własnego pomysłu, wykorzystując dostępne w domu składniki. Osoba dorosła towarzyszyła mi w kuchni i nadzorowała pracę (na przykład przy używaniu kuchenki).',
                        'Zaplanowałem(-am) zestaw ćwiczeń fizycznych, które można wykonywać w domu i dobrałem(-am) do nich odpowiednią muzykę. Przygotowałem(-am) filmik pokazujący rozgrzewkę, którą wykonywałem(-am) razem z domownikami.',
                        'Utrzymywałem(-am) kontakt (np. telefoniczny) z bliskimi, z którymi na co dzień nie mieszkam.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '4',
                requirements: [
                  'Wiem, w jaki sposób można oszczędzać pieniądze.',
                  'Oszczędnie gospodaruję pieniędzmi i planuję swoje wydatki.',
                  'Rozliczam się z powierzonych mi pieniędzy.',
                  'Mam własną skarbonkę lub kartę przedpłaconą.',
                  'Zbieram makulaturę, butelki, zioła lub owoce lasu i pieniądze uzyskane z ich sprzedaży oszczędzam na określony cel.',
                  'Zrobiłem(-am) portmonetkę lub sakiewkę do przechowywania drobnych oszczędności.',
                  'Umiem ułożyć pieniądze według ich wartości.',
                  'Sprzedawałem(-am) w sklepiku zuchowym lub na kiermaszu prowadzonym przez gromadę lub klasę.',
                ],
                notesForLeaders: [
                  'Sprawność uczy oszczędności, odpowiedzialności, samodzielności i umiejętności gospodarowania pieniędzmi (planowania wydatków, zdobywania funduszy, realizowania planów).',
                  'Należy zwrócić uwagę na to, aby zuch nie zbierał pieniędzy dla samego zbierania i aby cel ich gromadzenia był realny, a sposób pozyskiwania uczciwy.',
                  'Punkt Prawa Zucha, który podkreślamy, realizując sprawność „grosika”: "Zuch stara się być coraz lepszy." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'grosik',
                      title: 'Grosik',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zbieram swoje oszczędności do skarbonki. Przeznaczyłem(-am) je na wybrany cel.',
                        'Zrobiłem(-am) portmonetkę lub sakiewkę do przechowywania drobnych oszczędności.',
                        'Poznałem(-am) wartości pieniądza, ułożyłem(-am) je według nominałów.',
                        'Dowiedziałem(-am) się, w jaki sposób można oszczędzać pieniądze i opowiedziałem(-am) o tym drużynowemu.',
                      ]),
                  SprawData(
                      id: 'grosik',
                      title: 'Grosik',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wykonałem(-am) skarbonkę, do której zbieram swoje oszczędności. Przeznaczyłem(-am) je na wybrany cel.',
                        'Brałem(-am) udział w akcji zarobkowej gromady.',
                        'Dowiedziałem(-am) się, w jaki sposób można oszczędzać pieniądze. Wymyśliłem(-am) własny sposób oszczędzania.',
                        'Sprzedawałem(-am) w sklepiku zuchowym lub na kiermaszu prowadzonym przez gromadę lub klasę.',
                        'Podczas wyjazdu gromady zaplanowałem(-am) swoje wydatki z otrzymanych na ten cel pieniędzy.',
                      ]),
                  SprawData(
                      id: 'grosik',
                      title: 'Grosik',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wykonałem(-am) skarbonkę, do której zbieram swoje oszczędności. Przeznaczyłem(-am) je na wybrany cel.',
                        'Brałem(-am) udział w akcji zarobkowej gromady.',
                        'Dowiedziałem(-am) się, w jaki sposób można oszczędzać pieniądze. Wymyśliłem(-am) własny sposób.',
                        'Sprzedawałem(-am) w sklepiku zuchowym lub na kiermaszu prowadzonym przez gromadę lub klasę.',
                        'Podczas wyjazdu gromady zaplanowałem(-am) swoje wydatki z otrzymanych na ten cel pieniędzy.',
                        'Dowiedziałem(-am) się, co to jest bankomat i karta płatnicza. Opowiedziałem(-am) o tym innym zuchom w kręgu rady.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '5',
                requirements: [
                  'Wiem, na czym polega codzienna toaleta.',
                  'Dbam o higienę własnego ciała. Wiem, kiedy i jak należy myć ręce.',
                  'Opowiedziałem(-am) kolegom, jak należy dbać o higienę.',
                  'Sprawdzałem(-am) stan czystości na kolonii.',
                  'Zmierzyłem(-am) temperaturę i oceniłem(-am), czy jest prawidłowa.',
                  'Dbam o swój pokój lub kącik. Potrafię uporządkować swoje miejsce pracy.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje postawę dbałości o zdrowie. Uczy zucha troski o higienę swojego ciała i miejsca, w którym przebywa.',
                  'Zuch „Higienista” może następnie zdobyć sprawność „Śnieżnobiały uśmiech”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Higienisty”: "Zuch stara się być coraz lepszy.", "Zuch pamięta o swoich obowiązkach." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'higienista',
                      title: 'Higienista',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zademonstrowałem(-am) innym zuchom, jak prawidłowo myć ręce.',
                        'Sprawdzałem(-am) stan czystości na wyjeździe gromady.',
                        'Nauczyłem(-am) się prawidłowo myć zęby.',
                        'Samodzielnie umyłem(-am) włosy podczas wyjazdu gromady lub w domu pod okiem rodziców. Efekty zaprezentowałem(-am) drużynowemu.',
                      ]),
                  SprawData(
                      id: 'higienista',
                      title: 'Higienista',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zademonstrowałem(-am) innym zuchom, jak prawidłowo myć ręce.',
                        'Dwukrotnie sprawdzałem(-am) stan czystości na wyjeździe gromady.',
                        'Zmierzyłem(-am) temperaturę w domu i oceniłem(-am), czy jest prawidłowa.',
                        'Samodzielnie umyłem(-am) włosy podczas wyjazdu gromady lub w domu pod okiem rodziców. Efekty zaprezentowałem(-am) drużynowemu.',
                      ]),
                  SprawData(
                      id: 'higienista',
                      title: 'Higienista',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zademonstrowałem(-am) innym zuchom, jak prawidłowo myć ręce.',
                        'Wiem, jakich produktów należy używać, aby odpowiednio dbać o higienę ciała. Opowiedziałem(-am) o tym innym zuchom w kręgu rady.',
                        'Trzykrotnie sprawdzałem(-am) stan czystości na wyjeździe gromady.',
                        'Zaprezentowałem(-am) młodszym zuchom, jak należy dbać o czystość swojego miejsca w namiocie lub w pokoju.',
                        'Zmierzyłem(-am) temperaturę w domu i oceniłem(-am), czy jest prawidłowa.',
                        'Samodzielnie umyłem(-am), a następnie uczesałem(-am) włosy podczas wyjazdu gromady lub w domu pod okiem rodziców. Efekty zaprezentowałem(-am) drużynowemu.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '6',
                requirements: [
                  'Założyłem(-am) książkę kucharską, w której zamieściłem(-am) przepisy na swoje ulubione potrawy.',
                  'Mam własny fartuszek kuchenny.',
                  'Znam nazwy przypraw. Wiem, do jakich potraw ich się używa.',
                  'Potrafię samodzielnie przyrządzić kilka potraw',
                  'Znam zdrowe nawyki żywieniowe i stosuję je w praktyce.',
                  'Umiem zaplanować tygodniowy jadłospis zawierający potrzebne witaminy, minerały i składniki odżywcze.',
                  'Zachęcam innych do zdrowych nawyków żywieniowych. Przygotowałem(-am) plakat, który je promuje. Przedstawiłem(-am) go podczas zbiórki.',
                  'Wiem, jak należy się obchodzić z wrzątkiem oraz ostrymi nożami.',
                  'Zawsze przed przygotowywaniem posiłku i jedzeniem myję ręce.',
                  'Chętnie pomagam rodzicom w robieniu zakupów i przygotowywaniu posiłków.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla dzieci, które lubią pomagać w kuchni. Zdobywającyą zuch na pewno chętnie umieści swoje ulubione przepisy we własnej książce ucharskiej, pochwali się kolorowym fartuszkiem lub przygotuje plakat, który pokaże kolegom z gromady lub klasy, aby przekonać ich, że bardzo ważne jest to, o jedzą.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność "Kuchmistrza”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'kuchmistrz',
                      title: 'Kuchmistrz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Pomogłem(-am) członkowi rodziny przygotować posiłek.',
                        'Poznałem(-am) smak i nazwy kilku wybranych przypraw.',
                        'Z pomocą osoby dorosłej nauczyłem(-am) się prawidłowo kroić.',
                        'Dowiedziałem(-am) się, jak się przygotowuje mój ulubiony posiłek. Przedstawiłem(-am) przepis szóstce lub gromadzie.',
                        'Zabrałem(-am) zdrową przekąskę do szkoły.',
                      ]),
                  SprawData(
                      id: 'kuchmistrz',
                      title: 'Kuchmistrz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Z pomocą osoby dorosłej nauczyłem(-am) się prawidłowo kroić.',
                        'Samodzielnie przygotowałem(-am) zdrowy deser dla rodziny lub kolegi.',
                        'Pomogłem(-am) komuś z rodziny przygotować dwa wybrane posiłki.',
                        'Podczas wyjazdu z gromadą pomogłem(-am) w przygotowaniu posiłku.',
                        'Założyłem(-am) własną książkę kucharską, w której zbieram przepisy.',
                        'Zabrałem(-am) zdrową przekąskę na wyjazd z gromadą.',
                      ]),
                  SprawData(
                      id: 'kuchmistrz',
                      title: 'Kuchmistrz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Przez tydzień zabierałem(-am) zdrowe przekąski do szkoły.',
                        'Pomogłem(-am) komuś z rodziny przygotować trzy wybrane posiłki.',
                        'Samodzielnie wybrałem(-am) w sklepie produkty potrzebne do przygotowania określonego posiłku.',
                        'Samodzielnie przygotowałem(-am) zdrowy deser dla rodziny lub kolegi.',
                        'Założyłem(-am) własną książkę kucharską, w której zbieram przepisy.',
                        'Podczas wyjazdu z gromadą pomogłem(-am) w przygotowaniu posiłku.',
                        'Zabrałem(-am) zdrową przekąskę na wyjazd z gromadą.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '7',
                requirements: [
                  'Dbam o porządek w swoim pokoju. Sam(-a) zaprojektowałem(-am) wystój kącika zabaw.',
                  'Przygotowałem(-am) prosty posiłek dla swojej rodziny (kolacja, podwieczorek).',
                  'Pomagałem(-am) w wykonywaniu porządków domowych. Nakrywałem(-am) do stołu.',
                  'Uszyłem(-am) rękawicę do podtrzymywania gorących naczyń lub inną użyteczną rzecz.',
                  'Pomogłem(-am) rodzicom ułożyć jadłospis na cały dzień.',
                  'Odkurzałem(-am) pokój. Podczas porządków domowych korzystałem(-am) ze środków czystości.',
                  'Przygotowałem(-am) gazetkę na temat zdrowego odżywiania się.',
                  'Zrobiłem(-am) proste zakupy.',
                  'Dbam o swój ubiór. Prałem(-am) i prasowałem(-am) własne ubrania. Potrafię dobrać strój odpowiedni do okoliczności.',
                  'Uzgodniłem(-am) z rodzicami cztery prace domowe, które regularnie wykonywałem(-am).',
                  'Dobrze wypełniałem(-am) obowiązki dyżurnego. Posprzątałem(-am) zuchówkę.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje przydatną każdemu człowiekowi umiejętność dbania o siebie i swoje otoczenie oraz radzenia sobie z obowiązkami domowymi. Uczy systematyczności, zaradności życiowej i porządku oraz rozwija zmysł estetyki.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu sprawności „Złotej rączki” i „Kuchmistrza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Perfekcyjnego pana/pani domu”: "Zuch pamięta o swoich obowiązkach.", "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'perfekcyjny_pan_domu',
                      title: 'Perfekcyjny pan/pani domu',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Samodzielnie posprzątałem(-am) swój pokój.',
                        'Co najmniej raz w tygodniu robiłem(-am) sobie śniadanie.',
                        'Posprzątałem(-am) po majsterce na zbiórce.',
                        'Nauczyłem(-am) się składać odpowiednio mundur i ubranie. Zaprezentowałem(-am) to swojej szóstce.',
                        'Z pomocą osoby dorosłej zrobiłem(-am) zakupy potrzebne do przygotowania wybranego posiłku.',
                        'Nakryłem(-am) do stołu ',
                        'Regularnie odkurzałem(-am) swój pokój.',
                        'Przygotowałem(-am) śniadanie dla całej rodziny.',
                      ]),
                  SprawData(
                      id: 'perfekcyjny_pan_domu',
                      title: 'Perfekcyjny pan/pani domu',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Samodzielnie posprzątałem(-am) swój pokój.',
                        'Pełniłem(-am) obowiązki dyżurnego w klasie.',
                        'Przez dwa tygodnie przygotowywałem(-am) sobie śniadanie.',
                        'Przyszyłem(-am) guzik do munduru.',
                        'Zrobiłem(-am) zakupy potrzebne do przygotowania wybranego posiłku.',
                        'Nakryłem(-am) do stołu.',
                        'Ustaliłem(-am) z rodzicami dwie prace domowe, które wykonywałem(-am) regularnie przez dwa tygodnie.',
                        'Uszyłem(-am) rękawicę do podtrzymywania gorących naczyń lub inną użyteczną rzecz.',
                        'Przygotowałem(-am) kolację dla całej rodziny.',
                      ]),
                  SprawData(
                      id: 'perfekcyjny_pan_domu',
                      title: 'Perfekcyjny pan/pani domu',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Samodzielnie przyszyłem(-am) plakietkę okolicznościową.',
                        'Samodzielnie wyprasowałem(-am) mundur.',
                        'Raz w tygodniu wyręczałem(-am) rodziców w szykowaniu śniadania dla całej rodziny.',
                        'Zrobiłem(-am) proste zakupy.',
                        'Ustaliłem(-am) z rodzicami trzy prace domowe, które wykonywałem(-am) regularnie przez dwa tygodnie.',
                        'Uszyłem(-am) rękawicę do trzymania gorących naczyń.',
                        'Nakryłem(-am) do stołu.',
                        'Ustaliłem(-am) z rodzicami jadłospis na cały tydzień.',
                        'Zaprojektowałem(-am) wystrój kącika zabaw w zuchówce.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '8',
                requirements: [
                  'Wiem, jak należy zachowywać się w drodze do szkoły i gdzie można bezpiecznie przechodzić przez ulicę. Wiem, co to jest zebra.',
                  'Rozpoznaję znaki drogowe znajdujące się na drodze z domu do szkoły i w okolicach mojego miejsca zamieszkania. Wiem, co oznacza sygnalizacja świetlna i dźwiękowa.',
                  'Nauczyłem(-am) młodsze dziecko zasad przechodzenia przez ulicę.',
                  'Wiem, jak oznaczona jest ścieżka rowerowa i kto może się po niej poruszać.',
                  'Potrafię zachować się w sytuacji, gdy widzę na ulicy wypadek. Wiem, kogo należy poinformować o takim zdarzeniu.',
                  'Umiem poruszać się po drodze, na której nie ma chodnika. Wiem, co muszę mieć przy sobie, poruszając się drogą po zmroku.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje samodzielność, spostrzegawczość, a także umiejętność przewidywania i podporządkowania się przepisom. Zuch „Przechodzień” bezpiecznie porusza się po drodze. Wie, jak prawidłowo przechodzić przez ulicę, nie narażając własnego zdrowia i nie stanowiąc zagrożenia dla innych.',
                  'Zuchowi zdobywającemu sprawność należy uświadomić, że poruszanie się po drogach może być niebezpieczne, a podczas przechodzenia przez jezdnię należy zachować szczególną ostrożność (nawet przy zielonym świetle).',
                  'Zuchowi można zaproponować następnie sprawność „Rowerzysty”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Przechodnia”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'przechodzien',
                      title: 'Przechodzień',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Narysowałem(-am) i zaprezentowałem(-am) w gromadzie znak drogowy „przejście dla pieszych”. Opowiedziałem(-am), w jaki sposób należy bezpiecznie przechodzić przez jezdnię.',
                        'Mam odblaski przypięte do plecaka. Na zbiórce opowiedziałem(-am), gdzie należy je nosić i dlaczego są takie ważne.',
                        'Znam telefon na policję, straż pożarną i pogotowie. Wiem, jak wezwać pomoc. Przedstawiłem(-am) to drużynowemu.',
                        'Umiem w poprawny sposób przejść przez przejście dla pieszych. Pokazałem(-am) rodzicom, jak to robię.',
                        'Sporządziłem(-am) mapkę mojej drogi z domu do szkoły. Zaznaczyłem(-am) na niej miejsca niebezpieczne i przejścia dla pieszych.',
                      ]),
                  SprawData(
                      id: 'przechodzien',
                      title: 'Przechodzień',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Umiem w poprawny sposób przejść przez przejście dla pieszych. Pokazałem(-am) rodzicom, jak to robię.',
                        'Mam odblaski przypięte do plecaka. Na zbiórce opowiedziałem(-am), gdzie należy je nosić i dlaczego są takie ważne.',
                        'Wykonałem(-am) plakat przedstawiający poprawny sposób poruszania się po drodze.',
                        'Wiem, jak należy zareagować podczas wypadku komunikacyjnego. Zaprezentowałem(-am) w kręgu rady, w jaki sposób należy wezwać pomoc.',
                        'Znam drogę ze szkoły do domu. Narysowałem(-am) mapkę tej drogi z zaznaczeniem przejść dla pieszych i miejsc niebezpiecznych.',
                      ]),
                  SprawData(
                      id: 'przechodzien',
                      title: 'Przechodzień',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, jak należy zareagować podczas wypadku komunikacyjnego. Zaprezentowałem(-am) w kręgu rady, w jaki sposób należy wezwać pomoc.',
                        'Zrobiłem(-am) filmik, w którym opowiadam o prawidłowym poruszaniu się po zmroku.',
                        'Przedstawiłem(-am) na plakacie zagrożenia czyhające na drodze na pieszych.',
                        'Pokazałem(-am) zuchom na zbiórce, jak można wykonać odblask i gdzie się go nosi. Wyjaśniłem(-am), dlaczego powinniśmy pamiętać o noszeniu odblasków.',
                        'Znam drogę ze szkoły do domu. Narysowałem(-am) mapkę tej drogi z zaznaczeniem przejść dla pieszych i niebezpiecznych miejsc oraz znaków drogowych.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '9',
                requirements: [
                  'Dobrze znam swoją szkołę. Potrafię za pomocą słuchu rozpoznać szkolne odgłosy (śmiechy i okrzyki podczas przerwy, szelest kartek w bibliotece, dzwonek, skrzypienie kredy na tablicy itp.).',
                  'Potrafię nazwać uczucia, które towarzyszą dzieciom podczas pierwszych dni w szkole. Umiem zaradzić uczuciom negatywnym.',
                  'Opiekowałem(-am) się pierwszoklasistą przez pierwszy miesiąc jego nauki w szkole.',
                  'Wiem, kto jest patronem mojej szkoły. Opowiedziałem(-am) o jego zasługach.',
                  'Wykonałem(-am) plan szkoły i podarowałem(-am) go pierwszoklasistom. Oprowadziłem(-am) ich i pokazałem(-am) ciekawe miejsca w szkole.',
                  'Pokazałem(-am) pierwszoklasiście, gdzie pracują różni pracownicy szkoły (dyrektor, pielęgniarka, woźna, dozorca, sekretarka, pedagog, bibliotekarka, kucharki). Objaśniłem(-am), do kogo z nich można zwracać się w różnych sprawach.',
                  'Pokazałem(-am) pierwszoklasistom, jak dbać o naszą szkołę.',
                  'Przyprowadziłem(-am) na zbiórkę gromady młodszego kolegę.',
                ],
                notesForLeaders: [
                  'Zuch „Przewodnik po szkole” jest odpowiedzialny nie tylko za siebie, ale także za innych. Łatwo nawiązuje kontakty z rówieśnikami i chętnie pomaga innym. Warto zwrócić uwagę zucha na pierwszoklasistów oraz nowych uczniów.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Przewodnika po szkole”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'przewodnik_po_szkole',
                      title: 'Przewodnik po szkole',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, gdzie jest moja klasa. Sam(a) do niej trafiłem(-am).',
                        'Znam imię i nazwisko wychowawcy.',
                        'Wiem, kto jest patronem mojej szkoły. Opowiedziałem(-am) na lekcji lub zbiórce o jego zasługach.',
                        'Wiem, gdzie pracują różni pracownicy szkoły (dyrektor, pielęgniarka, woźna, dozorca, sekretarka, pedagog, bibliotekarka, kucharki). Wyjaśniłem(-am) w kręgu rady, do kogo z nich można zwracać się w różnych sprawach.',
                      ]),
                  SprawData(
                      id: 'przewodnik_po_szkole',
                      title: 'Przewodnik po szkole',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Narysowałem(-am) plakat przedstawiający patrona mojej szkoły.',
                        'Znam imiona i nazwiska nauczycieli, z którymi mam lekcje.',
                        'Przyprowadziłem(-am) na zbiórkę młodszego kolegę.',
                        'Pokazałem(-am) pierwszoklasiście, gdzie pracują różni pracownicy szkoły (dyrektor, pielęgniarka, woźna, dozorca, sekretarka, pedagog, bibliotekarka, kucharki). Objaśniłem(-am), do kogo z nich może zwracać się w różnych sprawach.',
                        'Pokazałem(-am) pierwszoklasistom, jak dbać o naszą szkołę.',
                      ]),
                  SprawData(
                      id: 'przewodnik_po_szkole',
                      title: 'Przewodnik po szkole',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaangażowałem(-am) się w samorząd klasowy.',
                        'Zrobiłem(-am) filmik o patronie szkoły.',
                        'Oprowadziłem(-am) po szkole pierwszoklasistę.',
                        'Narysowałem(-am) mapę szkoły. Podarowałem(-am) ją klasie pierwszej.',
                        'Przyprowadziłem(-am) na zbiórkę młodszego kolegę.',
                        'Pokazałem(-am) pierwszoklasiście, gdzie pracują różni pracownicy szkoły (dyrektor, pielęgniarka, woźna, dozorca, sekretarka, pedagog, bibliotekarka, kucharki). Wyjaśniłem(-am), do kogo z nich może zwracać się w różnych sprawach.',
                        'Pokazałem(-am) pierwszoklasistom, jak dbać o naszą szkołę.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '10',
                requirements: [
                  'Wziąłem(wzięłam) udział w kolonii zuchowej.',
                  'Potrafię posługiwać się narzędziami w bezpieczny sposób.',
                  'Potrafię samodzielnie rozłożyć i pościelić kanadyjkę.',
                  'Potrafię samodzielnie złożyć swój śpiwór.',
                  'Wraz z szóstką przygotuję element zdobnictwa, np. tablicę ogłoszeń.',
                  'Potrafię bezpiecznie posługiwać się scyzorykiem. Wykonałem(-am) majsterkę lub zdobnictwo z jego użyciem.',
                  'Potrafię bez użycia latarki trafić do swojego namiotu lub domku.',
                  'Potrafię dokładnie umyć menażkę.',
                ],
                notesForLeaders: [
                  'Zuchy mogą zdobywać sprawność na kolonii lub dłuższym biwaku w warunkach leśnych. Warto, aby jej zdobywanie wiązało się z urządzaniem kolonii i czasem prowadzenia prac pionierskich.',
                  'Zuch powinien realizować zadania samodzielnie. Rolą kadry jest troska o jego bezpieczeństwo i przygotowanie go do wyzwań stawianych przez wymagania sprawności (np. udzielenie instruktażu dotyczącego używania narzędzi).',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Sobieradka obozowego”: "Zuch stara się być coraz lepszy.", "Zuch pamięta o swoich obowiązkach.", "Zuch jest dzielny." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'sobieradek_obozowy',
                      title: 'Sobieradek obozowy',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wziąłem(wzięłam) udział w kolonii zuchowej lub leśnym biwaku.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać narzędziami. Opowiem o tym drużynowemu.',
                        'Samodzielnie rozłożyłem(-am) i pościeliłem(-am) kanadyjkę oraz złożyłem(-am) i rozłożyłem(-am) swój śpiwór.',
                        'Wbiłem(-am) gwóźdź, przeciąłem(-am) sznurek lub przepiłowałem(-am) żerdkę.',
                        'Bez użycia latarki trafiłem(-am) po ciemku do swojego namiotu lub domku.',
                        'Przez cały wyjazd sam(a) dokładnie myłem(-am) swoją menażkę i przybory do jedzenia.',
                      ]),
                  SprawData(
                      id: 'sobieradek_obozowy',
                      title: 'Sobieradek obozowy',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wziąłem(wzięłam) udział w kolonii zuchowej lub leśnym biwaku.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać narzędziami. Opowiedziałem(-am) o tym drużynowemu.',
                        'Samodzielnie rozłożyłem(-am) i pościeliłem(-am) kanadyjkę. Przez cały wyjazd dbałem(-am) o swoje miejsce do spania.',
                        'Samodzielnie złożyłem(-am) i rozłożyłem(-am) swój śpiwór.',
                        'Wraz z szóstką przygotowałem(-am) element zdobnictwa kolonijnego, np. tablicę ogłoszeń.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać scyzorykiem. Wykonałem(-am) majsterkę lub zdobnictwo z jego użyciem.',
                        'Bez użycia latarki trafiłem(-am) po ciemku do swojego namiotu lub domku.',
                        'Przez cały wyjazd sam(a) dokładnie myłem(-am) swoją menażkę.',
                      ]),
                  SprawData(
                      id: 'sobieradek_obozowy',
                      title: 'Sobieradek obozowy',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wziąłem(wzięłam) udział w kolonii zuchowej lub leśnym biwaku.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać narzędziami. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Samodzielnie rozłożyłem(-am) i pościeliłem(-am) kanadyjkę. Przez cały wyjazd dbałem(-am) o swoje miejsce do spania.',
                        'Samodzielnie złożyłem(-am) i rozłożyłem(-am) swój śpiwór.',
                        'Zaprojektowałem(-am) element zdobnictwa, np. tablicę ogłoszeń. Pokierowałem(-am) jej wykonaniem przez szóstkę.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać scyzorykiem. Wykonałem(-am) majsterkę lub zdobnictwo z jego użyciem.',
                        'Bez użycia latarki trafiłem(-am) po ciemku do swojego namiotu lub domku. Nauczyłem(-am) tej umiejętności zucha z mojego domku lub namiotu.',
                        'Przez cały wyjazd sam(a) dokładnie myłem(-am) swoją menażkę.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '11',
                requirements: [
                  'Poznałem(-am) budowę jamy ustnej.',
                  'Potrafię prawidłowo szczotkować zęby.',
                  'Założyłem(-am) dzienniczek szczotkowania zębów. Uzupełniałem(-am) go systematycznie (przynajmniej dwa razy dziennie).',
                  'Zrobiłem(-am) przegląd szczoteczek do zębów wszystkich domowników. Jeśli była taka potrzeba, wyjaśniłem(-am), dlaczego należy je zmienić.',
                  'Znam bezpieczne dla zębów przekąski.',
                  'Walczę ze skłonnością do podjadania słodyczy.',
                  'Sporządziłem(-am) listę past zawierających fluor.',
                  'Byłem(-am) w gabinecie stomatologicznym na badaniach kontrolnych.',
                  'Wykonałem(-am) plakat związany tematycznie z higieną jamy ustnej.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje pozytywne nawyki. Uczy obowiązkowości i odpowiedzialności oraz dbałości o higienę, przede wszystkim jamy ustnej.',
                  'Sprawność może być zdobywana przez zuchy w każdym wieku.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Śnieżnobiały uśmiech”: "Zuch stara się być coraz lepszy.", "Zuch pamięta o swoich obowiązkach." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'snieznobialy_usmiech',
                      title: 'Śnieżnobiały uśmiech',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam budowę jamy ustnej. Podzieliłem(-am) się tą wiedzą z moją szóstką.',
                        'Potrafię prawidłowo szczotkować zęby. Zaprezentowałem(-am) zuchom, jak to robić.',
                        'Odbyłem(-am) wizytę u stomatologa w celu wykonania profilaktycznego przeglądu zębów.',
                        'Założyłem(-am) dzienniczek szczotkowania zębów i uzupełniałem(-am) go przez trzy dni.',
                      ]),
                  SprawData(
                      id: 'snieznobialy_usmiech',
                      title: 'Śnieżnobiały uśmiech',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wykonałem(-am) plakat przedstawiający jamę ustną i zaprezentowałem(-am) na zbiórce gromady, jak prawidłowo szczotkować zęby.',
                        'Założyłem(-am) dzienniczek szczotkowania zębów i uzupełniałem(-am) go systematycznie (przynajmniej dwa razy dziennie) przez pięć dni.',
                        'Potrafię wymienić zdrowe dla zębów przekąski.',
                        'Odbyłem(-am) wizytę u stomatologa w celu wykonania profilaktycznego przeglądu zębów.',
                        'Zaprezentowałem(-am) gromadzie pasty, które zawierają fluor.',
                      ]),
                  SprawData(
                      id: 'snieznobialy_usmiech',
                      title: 'Śnieżnobiały uśmiech',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) dzienniczek szczotkowania zębów i uzupełniałem(-am) go przez siedem dni.',
                        'Zrobiłem(-am) w domu przegląd szczoteczek i płynów do mycia jamy ustnej. Jeśli była taka potrzeba, wyjaśniłem(-am), dlaczego należy je wymienić.',
                        'Przez pięć dni nie jadłem(-am) słodyczy. Słodkie jedzenie zamieniłem(-am) na zdrowe dla zębów przekąski.',
                        'Wykonałem(-am) listę past zawierających fluor.',
                        'Wykonałem(-am) model jamy ustnej. Zaprezentowałem(-am) nazwy wszystkich rodzajów zębów. Pokazałem(-am), jak prawidłowo szczotkować zęby.',
                        'Odbyłem(-am) wizytę u stomatologa w celu wykonania profilaktycznego przeglądu zębów.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '12',
                requirements: [
                  'Umiem bezpiecznie posługiwać się podstawowymi narzędziami (np. młotkiem, śrubokrętem, nożyczkami).',
                  'Wykonałem(-am) kilka zabawek i podarowałem(-am) je młodszym kolegom.',
                  'Przygotowałem(-am) dekoracje do zuchówki, do swojego pokoju lub na przyjęcie.',
                  'Złożyłem(-am) prosty model z gotowych elementów.',
                  'Własnoręcznie odnowiłem(-am) zniszczone drobne sprzęty.',
                  'Samodzielnie przygotowałem(-am) klej.',
                  'Wiem, gdzie naprawić zepsute sprzęty oraz czym zajmują się niektórzy rzemieślnicy (np. stolarz, elektryk, ślusarz).',
                  'Zbieram rzeczy, które mogą przydać się do majsterkowania (sznurki, szpulki, drut itp.).',
                  'Oszczędnie gospodaruję materiałami i dbam o narzędzia pracy.',
                ],
                notesForLeaders: [
                  'Zuch „Złota rączka” potrafi naprawić zepsute urządzenie, odnowić zniszczone sprzęty i wyczarować „coś z niczego”. Lubi majsterkować i kompletuje swój mały warsztat.',
                  'Zadania uczą zucha cierpliwości, dokładności i zaradności. Wyrabiają zmysł estetyki i sprawność manualną.',
                  'Zuch „Złota rączka” może wykazać się zdolnościami i umiejętnościami podczas zdobywania przez gromadę prawie każdego tropu (przede wszystkim podczas majsterki).',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Złotej rączki”: "Zuch pamięta o swoich obowiązkach.", "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'zlota_raczka',
                      title: 'Złota rączka',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Pod okiem osoby dorosłej wbiłem(-am) gwóźdź pod obrazek.',
                        'Wykonałem(-am) prostą zabawkę z wybranych materiałów.',
                        'Przygotowałem(-am) element dekoracji zuchówki lub swojego pokoju.',
                        'Opowiedziałem(-am) zuchom z mojej szóstki, czym zajmuje się stolarz, elektryk, ślusarz i szewc. Odwiedziłem(-am) z rodzicami wybrany zakład rzemieślniczy.',
                        'Mam swój mały warsztat złotej rączki. Zgromadziłem(-am) w nim różne przydatne przedmioty. Narysowałem(-am) je i opisałem(-am), do czego można je wykorzystać.',
                      ]),
                  SprawData(
                      id: 'zlota_raczka',
                      title: 'Złota rączka',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wbiłem(-am) gwóźdź pod obrazek i wkręciłem(-am) śrubkę.',
                        'Wykonałem(-am) zabawkę z wybranych materiałów.',
                        'Przygotowałem(-am) element dekoracji zuchówki i swojego pokoju.',
                        'Opowiedziałem(-am) zuchom z gromady, czym zajmuje się stolarz, elektryk, ślusarz, szewc, introligator i złotnik. Odwiedziłem(-am) z rodzicami wybrany zakład rzemieślniczy.',
                        'Mam mały warsztat złotej rączki. Zgromadziłem(-am) w nim różne przydatne przedmioty. Narysowałem(-am) je i opisałem(-am), do czego można je wykorzystać.',
                        'Samodzielnie zrobiłem(-am) klej do papieru.',
                        'Złożyłem(-am) prosty model z gotowych elementów.',
                      ]),
                  SprawData(
                      id: 'zlota_raczka',
                      title: 'Złota rączka',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wbiłem(-am) gwóźdź pod obrazek i wkręciłem(-am) śrubkę.',
                        'Wykonałem(-am) zabawkę i zakładkę do książki z wybranych materiałów',
                        'Przygotowałem(-am) element dekoracji zuchówki i swojego pokoju. Wykonałem(-am) dekorację na przyjęcie, pasującą do jego tematyki.',
                        'Opowiedziałem(-am) zuchom z gromady, czym zajmują się stolarz, elektryk, ślusarz, szewc, introligator, złotnik i inni ciekawiący mnie rzemieślnicy lub serwisanci. Odwiedziłem(-am) wybrany zakład rzemieślniczy i rozmawiałem(-am) z jego pracownikami o tajnikach ich zawodu.',
                        'Mam mały warsztat złotej rączki. Zgromadziłem(-am) w nim różne przydatne przedmioty. Narysowałem(-am) je i opisałem(-am), do czego można je wykorzystać.',
                        'Samodzielnie zrobiłem(-am) klej do papieru.',
                        'Złożyłem(-am) prosty model z gotowych elementów.',
                        'Wiem, jak dbać o swoje narzędzia pracy. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Samodzielnie odnowiłem(-am) zniszczony mebel lub element wyposażenia domu.',
                      ]),
                ]
            ),
          ]),

      SprawGroupData(
          id: 'przyrodnicze',
          title: 'Przyrodnicze',
          tags: ['#bliskość natury', '#szacunek do przyrody', '#ekologia', '#natura ', '#las', '#cudnatury'],
          familyData: [
            SprawFamilyData(
                id: '1',
                requirements: [
                  'Znam różne rośliny ozdobne (domowe i ogrodowe).',
                  'Prowadzę małą hodowlę kwiatów doniczkowych.',
                  'Potrafię pielęgnować kwiaty. Wiem, kiedy się je sadzi, przesadza i podlewa. Wyhodowałem(-am) roślinkę z nasion.',
                  'Byłem(-am) w ogrodzie botanicznym lub u ogrodnika.',
                  'Prowadziłem(-am) dzienniczek hodowli kwiatów. Zapisywałem(-am) w nim ciekawe spostrzeżenia.',
                  'Sadziłem(-am) kwiaty. Podlewałem(-am) je i nawoziłem(-am).',
                  'Wykonałem(-am) drabinkę do kwiatków.',
                  'Ułożyłem(-am) bukiet z kwiatów.',
                  'Razem z kolegami zaopiekowałem(-am) się klombem lub trawnikiem.',
                ],
                notesForLeaders: [
                  'Sprawność uczy systematyczności i odpowiedzialności.',
                  'Praktycznym sprawdzianem, czy zuch jest hodowcą kwiatów, może być np. przyniesienie samodzielnie wyhodowanej rośliny, zaprezentowanie dziennika hodowli roślin, wyhodowanie kwiatka lub przeprowadzenie dla innych dzieci konkursu na temat kwiatów.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności przyrodnicze, np. „Zielarza” lub „Ptasiego opiekuna”.',
                  'Punkt Prawa Zucha, który podkreślamy, realizując sprawność „Hodowcy kwiatów”:„Zuch pamięta o swoich obowiązkach".',

                ],
                sprawData: [

                  SprawData(
                      id: 'hodowca_kwiatow',
                      title: 'Hodowca Kwiatów',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam swoją ulubioną roślinę doniczkową. Narysowałem(-am) ją.',
                        'Razem z rodzicami wybrałem(-am) się do ogrodu botanicznego lub kwiaciarni. Tam dowiedziałem(-am) się, jaka jest różnica między kwiatami rosnącymi w mieszkaniu i na zewnątrz. Zapisałem(-am) zdobyte informacje.',
                        'Na tydzień przejąłem(-am) obowiązki dyżurnego w klasie i opiekowałem(-am) się kwiatami.',
                        'Ułożyłem(-am) bukiet z co najmniej czterech gatunków kwiatów polnych. Samodzielnie go skomponowałem(-am).',
                      ]),
                  SprawData(
                      id: 'hodowca_kwiatow',
                      title: 'Hodowca Kwiatów',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam swoją ulubioną roślinę doniczkową. Narysowałem(-am) ją.',
                        'Razem z rodzicami wybrałem(-am) się do ogrodu botanicznego lub kwiaciarni. Tam dowiedziałem(-am) się, jakich warunków do życia potrzebują rośliny doniczkowe zimą, a jakich latem, jak często należy je podlewać, jakie są sposoby nawożenia roślin i które kwiaty należy zraszać. Zapisałem(-am) zdobyte informacje.',
                        'Wykonałem(-am) plakat przypominający o tym, aby nie deptać kwiatów.',
                        'Wyjaśniłem(-am) w klasie, dlaczego trzeba dbać o rośliny.',
                        'Ozdobiłem(-am) doniczkę do kwiatów według własnego pomysłu.',
                        'Ułożyłem(-am) bukiet z co najmniej czterech gatunków kwiatów. Umiem nazwać te kwiaty i wiem, gdzie można je znaleźć.',
                      ]),
                  SprawData(
                      id: 'hodowca_kwiatow',
                      title: 'Hodowca Kwiatów',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam swoją ulubioną roślinę doniczkową. Narysowałem(-am) ją i opisałem(-am), jak należy ją pielęgnować.',
                        'Razem z rodzicami wybrałem(-am) się do ogrodu botanicznego lub kwiaciarni. Tam dowiedziałem(-am) się, jakich warunków do życia potrzebują rośliny doniczkowe zimą, a jakich latem, jak często należy je podlewać, jakie są sposoby nawożenia roślin i które kwiaty należy zraszać. Zapisałem(-am) zdobyte informacje.',
                        'Zorganizowałem(-am) w gromadzie Dzień Kwiatów, podczas którego opowiedziałem(-am), na czym polega pielęgnacja roślin, m.in. jak i kiedy należy je podlewać. Wspólnie z drużynowym prowadziłem(-am) warsztaty z poprawnego przesadzania kwiatów.',
                        'Zasadziłem(-am) wybraną roślinę. Obserwowałem(-am), jak kiełkuje i rośnie. Wszystkie obserwacje zapisywałem(-am) w dzienniku, który zaprezentowałem(-am) drużynowemu.',
                        'Wspólnie z rodzicami zaopiekowałem(-am) się wszystkimi roślinami domowymi. Sprawdziłem(-am), czy nie potrzebują dodatkowej pielęgnacji lub przesadzenia. Zrobiłem(-am) im zdjęcie pierwszego i ostatniego dnia próby. Widzę efekty pielęgnowania roślin.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '2',
                requirements: [
                  'Prowadzę swój mały ogródek.',
                  'Potrafię pielęgnować warzywa i owoce. Wiem, kiedy się je sadzi, zbiera i podlewa.',
                  'Wyhodowałem(-am) owoc lub warzywo z nasion',
                  'Prowadziłem(-am) dzienniczek hodowli warzyw lub owoców i zapisywałem(-am) w nim ciekawe spostrzeżenia.',
                  'Sadziłem(-am) warzywa lub owoce.',
                  'Potrafię zbierać nasiona warzyw i owoców.',
                  'Wiem, jakie są podobieństwa oraz różnice między warzywami i owocami.',
                ],
                notesForLeaders: [
                  'Zdobywając sprawność, zuch wyrabia w sobie systematyczność i odpowiedzialność.',
                  'Praktycznym sprawdzianem, czy zuch jest hodowcą warzyw i owoców, może być np. przyniesienie samodzielnie wyhodowanej rośliny, zaprezentowanie dziennika hodowli roślin, wyhodowanie warzywa lub przeprowadzenie dla innych zuchów konkursu na temat warzyw i owoców.',
                  'Jeżeli zuch nie ma własnego ogrodu, może realizować zadania w warunkach domowych, uprawiając np. szczypiorek, fasolę lub truskawki.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności przyrodnicze, np. „Hodowcy kwiatów” lub „Ptasiego opiekuna”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność„Hodowcy warzyw i owoców”:„Zuch pamięta o swoich obowiązkach", „Wszystkim jest z zuchem dobrze"',
                ],
                sprawData: [

                  SprawData(
                      id: 'hodowca_warzyw_i_owocow',
                      title: 'Hodowca warzyw i owoców',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) i wysuszyłem(-am) nasiona warzywa i owocu.',
                        'Zasadziłem(-am) owoc lub warzywo. Regularnie pielęgnuję posadzoną roślinę.',
                        'Założyłem(-am) i prowadzę dziennik hodowli. Rysuję w nim, jak rośnie posadzone przeze mnie warzywo lub owoc.',
                        'Odwiedziłem(-am) ogrodnika, który opowiedział mi o pielęgnacji warzyw i owoców. Swoją wizytę udokumentowałem(-am) zdjęciami.',
                        'Dowiedziałem(-am) się, jakie są podobieństwa oraz różnice między warzywami i owocami. Opowiedziałem(-am) o tym drużynowemu.',
                      ]),
                  SprawData(
                      id: 'hodowca_warzyw_i_owocow',
                      title: 'Hodowca warzyw i owoców',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) i wysuszyłem(-am) nasiona dwóch warzyw i owoców.',
                        'Zasadziłem(-am) owoc i warzywo. Regularnie je pielęgnuję. Efekty swojej pracy przedstawiłem(-am) podczas zbiórki gromady.',
                        'Założyłem(-am) i prowadzę dziennik hodowli. Zapisuję w nim swoje spostrzeżenia dotyczące posadzonego warzywa i owocu.',
                        'Odwiedziłem(-am) ogrodnika, który opowiedział mi o pielęgnacji warzyw i owoców. Wykonałem(-am) zdjęcia różnych warzyw i owoców. Przedstawiłem(-am) je swojej szóstce.',
                        'Dowiedziałem(-am) się, jakie są podobieństwa oraz różnice między warzywami i owocami. Opowiedziałem(-am) o tym innym zuchom w kręgu rady.',
                      ]),
                  SprawData(
                      id: 'hodowca_warzyw_i_owocow',
                      title: 'Hodowca warzyw i owoców',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) i wysuszyłem(-am) nasiona trzech warzyw i owoców. Nasiona pokazałem(-am) innym zuchom w kręgu rady.',
                        'Zasadziłem(-am) owoc i warzywo. Regularnie je pielęgnuję. Efekty swojej pracy rzedstawiłem(-am) na zbiórce gromady.',
                        'Założyłem(-am) i prowadzę dziennik hodowli. Zapisuję swoje spostrzeżenia dotyczące posadzonego warzywa i owocu oraz dokumentuję na zdjęciach etapy ich wzrostu.',
                        'Odwiedziłem(-am) ogrodnika, który opowiedział mi o pielęgnacji warzyw i owoców. Podczas wizyty pomogłem(-am) mu w czynnościach pielęgnacyjnych w ogrodzie.',
                        'Dowiedziałem(-am) się, jakie są podobieństwa i różnice między warzywami i owocami. Zorganizowałem(-am) mini turniej wiedzy na ten temat podczas zbiórki gromady.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '3',
                requirements: [
                  'Wiem, jakie zwierzęta można hodować w domu i w gospodarstwie.',
                  'Mam w domu zwierzę, którym opiekuję się wspólnie z rodzicami.',
                  'Potrafię opiekować się zwierzęciem. Wiem, czym i kiedy można je karmić, jak je pielęgnować i jak dbać o jego zdrowie. Poświęcam mu czas.',
                  'Wykonałem(-am) zabawkę lub inną przydatną zwierzęciu rzecz (np. drapak dla kota).',
                  'Prowadziłem(-am) dzienniczek hodowli zwierzęcia. Zapisywałem(-am) w nim ciekawe spostrzeżenia. Narysowałem(-am) lub sfotografowałem(-am) swoje zwierzę.',
                  'Wiem, co powinienem(powinnam) zrobić, gdy znajdę ranne zwierzę.',
                  'Opowiedziałem(-am) innym zuchom o swoim zwierzęciu.',
                ],
                notesForLeaders: [
                  'Zdobywając tę sprawność, zuch rozwija swoje zainteresowania przyrodnicze, wyrabia w sobie systematyczność i odpowiedzialność.',
                  'Praktycznym sprawdzianem, czy zuch opiekuje się zwierzęciem, może być przyniesienie zdjęć (filmiku) pokazujących hodowane zwierzę, przedstawienie jego zwyczajów albo przeprowadzenie dla innych zuchów konkursu na temat zwierząt domowych.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności przyrodnicze, np. „Zielarza”, „Ptasiego opiekuna”, „Hodowcy kwiatów”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Hodowcy zwierząt”: „Zuch pamięta o swoich obowiązkach" „Wszystkim jest z zuchem dobrze".',

                ],
                sprawData: [

                  SprawData(
                      id: 'hodowca_zwierzat',
                      title: 'Hodowca Zwierząt',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam w domu zwierzę, którym opiekuję się wspólnie z rodzicami, np. daję mu jeść, wyprowadzam na dwór, często się z nim bawię.',
                        'Z pomocą rodziców znalazłem(-am) w książce lub Internecie informacje przydatne do opieki nad moim zwierzęciem.',
                        'Wspólnie z rodzicami przygotowałem(-am) miejsce dla zwierzęcia. Pomagam w jego sprzątaniu.',
                        'Wykonałem(-am) prostą zabawkę dla mojego zwierzęcia.',
                        'Narysowałem(-am) moje zwierzę i opowiedziałem(-am) innym zuchom o jego zwyczajach (np. ile śpi, co lubi jeść, jak można się z nim bawić). Opowiedziałem(-am) też związaną z nim śmieszną historię.',
                      ]),
                  SprawData(
                      id: 'hodowca_zwierzat',
                      title: 'Hodowca Zwierząt',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam w domu zwierzę, którym opiekuję się wspólnie z rodzicami. Mam stały obowiązek, np. daję mu jeść lub wyprowadzam na dwór.',
                        'Zebrałem(-am) informacje przydatne do opieki nad moim zwierzęciem.',
                        'Wspólnie z rodzicami przygotowałem(-am) miejsce dla mojego zwierzęcia. Pomagam w jego sprzątaniu.',
                        'Wykonałem(-am) zabawkę lub inną przydatną rzecz dla mojego zwierzęcia.',
                        'Byłem(-am) z moim zwierzęciem u weterynarza.',
                        'Zrobiłem(-am) zdjęcia mojemu zwierzęciu. Pokazałem(-am) je innym zuchom i opowiedziałem(-am) im o jego zwyczajach (np. ile śpi, co lubi jeść, jak można się z nim bawić) oraz o tym, jak się nim zajmuję.',
                      ]),
                  SprawData(
                      id: 'hodowca_zwierzat',
                      title: 'Hodowca Zwierząt',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam w domu zwierzę, którym opiekuję się wspólnie z rodzicami. Mam stały obowiązek, np. daję mu jeść lub wyprowadzam na dwór.',
                        'Zebrałem(-am) informacje przydatne do opieki nad moim zwierzęciem.',
                        'Wspólnie z rodzicami przygotowałem(-am) miejsce dla zwierzęcia. Pomagam w jego sprzątaniu.',
                        'Wykonałem(-am) zabawkę lub inną przydatną rzecz dla mojego zwierzęcia.',
                        'Byłem(-am) z moim zwierzęciem u weterynarza. Dowiedziałem(-am) się, co zrobić, gdy znajdę ranne zwierzę.',
                        'Prowadziłem(-am) dzienniczek hodowli zwierzęcia. Zapisywałem(-am) w nim ciekawe spostrzeżenia. Narysowałem(-am) lub sfotografowałem(-am) moje zwierzę. Przedstawiłem(-am) dzienniczek na zbiórce.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '4',
                requirements: [
                  'Wiem, że ekologia zajmuje się przyrodą i naszym wpływem na środowisko. Wiem, na czym polega ekologiczny styl życia.',
                  'Poznaję i badam różne elementy środowiska.',
                  'Dowiedziałem(-am) się, jakie są przyczyny zanieczyszczenia środowiska i co można zrobić, żeby zmniejszyć zmiany klimatyczne.',
                  'Spędzam wolny czas na łonie przyrody. Brałem(-am) udział w wycieczkach, np. do lasu, nad wodę, w góry. Narysowałem(-am) lub sfotografowałem(-am) to, co zaobserwowałem(-am).',
                  'Podjąłem(podjęłam) ekowyzwanie.',
                  'Wziąłem(wzięłam) udział w akcji ekologicznej.',
                ],
                notesForLeaders: [
                  'Sprawność wspiera rozwój zainteresowań przyrodniczych oraz wyrabia ekologiczne nawyki zucha.',
                  'Praktycznym sprawdzianem wykonania przez zucha zadań mogą być rysunki, zdjęcia i notatki z realizacji ekowyzwania.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności przyrodnicze, np. „Zielarza”, „Ptasiego opiekuna”, „Hodowcy kwiatów”, „Hodowcy zwierząt” i „Przyjaciela lasu".',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Ekologa”:„Wszystkim jest z zuchem dobrze",„Zuch stara się być coraz lepszy".',
                ],
                sprawData: [

                  SprawData(
                      id: 'ekolog',
                      title: 'Ekolog',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Z pomocą rodziców dowiedziałem(-am) się, jakie są przyczyny zanieczyszczenia środowiska. Opowiedziałem(-am) o nich drużynowemu.',
                        'Narysowałem(-am), co można zrobić, żeby zmniejszyć zanieczyszczenie środowiska. Przedstawiłem(-am) swoją pracę w kręgu rady.',
                        'Spędzam wolny czas na łonie przyrody. Brałem(-am) udział w wycieczce np. do lasu, nad wodę, w góry. Poszukałem(-am) śladów zwierząt, przyjrzałem(-am) się mijanym po drodze roślinom. Narysowałem(-am) lub sfotografowałem(-am) to, co zaobserwowałem(-am).',
                        'Podjąłem(podjęłam) ekowyzwanie. Przez siedem dni realizowałem(-am) po dwa postanowienia z listy (codziennie mogą być inne):'
                            '\n\n-Zakręcałem(-am) wodę w czasie mycia zębów.'
                            '\n\n-Segregowałem(-am) śmieci.'
                            '\n\n-Nie wyrzuciłem(-am) żadnego jedzenia (np. drugiego śniadania w szkole).'
                            '\n\n-Wyłączyłem(-am) niepotrzebne światło.'
                            '\n\n-Podczas spaceru podniosłem(-am) śmieci z ziemi i wrzuciłem(-am) do kosza.'
                            '\n\n-Wziąłem(wzięłam) krótki prysznic zamiast kąpieli.',
                        'Razem z rodzicami, z klasą lub gromadą wziąłem(wzięłam) udział w akcji ekologicznej np. sprzątaniu świata, sadzeniu drzew, zbiórce elektrośmieci.',
                      ]),
                  SprawData(
                      id: 'ekolog',
                      title: 'Ekolog',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Z pomocą rodziców dowiedziałem(-am) się, jakie są przyczyny zanieczyszczenia środowiska i które z nich są najgroźniejsze. Opowiedziałem(-am) o nich drużynowemu.',
                        'Wykonałem(-am) plakat zachęcający do działań na rzecz ratowania środowiska naturalnego. Przedstawiłem(-am) go w kręgu rady.',
                        'Spędzam wolny czas na łonie przyrody. Brałem(-am) udział w dwóch wycieczkach np. do lasu, nad wodę, w góry. Poszukałem(-am) śladów zwierząt i przyjrzałem(-am) się mijanym po drodze roślinom. Narysowałem(-am) lub sfotografowałem(-am) to, co zaobserwowałem(-am).',
                        'Podjąłem(podjęłam) ekowyzwanie. Przez siedem dni realizowałem(-am) przynajmniej dwa postanowienia z listy (codziennie mogą być inne):'
                            '\n\n- Zakręcałem(-am) wodę w czasie mycia zębów.'
                            '\n\n- Wyjmowałem(-am) ładowarkę od telefonu z kontaktu.'
                            '\n\n- Segregowałem(-am) śmieci.'
                            '\n\n- Pojechałem(-am) gdzieś na rowerze, autobusem lub poszedłem(poszłam) pieszo.'
                            '\n\n- Nie wyrzuciłem(-am) żadnego jedzenia (np. drugiego śniadania w szkole).'
                            '\n\n- Nie wziąłem(wzięłam) torebki foliowej lub nie kupiłem(-am) w szkolnym sklepiku niczego w plastikowym opakowaniu.'
                            '\n\n- Wyłączyłem(-am) niepotrzebne światło.'
                            '\n\n- Podczas spaceru podniosłem(-am) śmieci z ziemi i wrzuciłem(-am) do kosza.'
                            '\n\n- Wziąłem(wzięłam) krótki prysznic zamiast kąpieli.',
                        'Razem z rodzicami, z klasą lub gromadą uczestniczyłem(-am) w akcji ekologicznej np. sprzątaniu świata, sadzeniu drzew, zbiórce elektrośmieci. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Wyjaśniłem(-am) innym zuchom, czym jest ślad węglowy i jak można go zlikwidować.',
                      ]),
                  SprawData(
                      id: 'ekolog',
                      title: 'Ekolog',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Dowiedziałem(-am) się, jakie są przyczyny zanieczyszczenia środowiska i które z nich są najgroźniejsze. Opowiedziałem(-am) o nich drużynowemu.',
                        'Wykonałem(-am) plakat zachęcający do działań na rzecz ratowania środowiska naturalnego. Przedstawiłem(-am) go w kręgu rady.',
                        'Spędzam wolny czas na łonie przyrody. Brałem(-am) udział w trzech wycieczkach np. do lasu, nad wodę, w góry. Poszukałem(-am) śladów zwierząt, przyjrzałem(-am) się mijanym po drodze roślinom. Narysowałem(-am) lub sfotografowałem(-am) to, co zaobserwowałem(-am).',
                        'Podjąłem(podjęłam) ekowyzwanie. Przez siedem dni realizowałam więcej niż dwa postanowienia z listy (codziennie mogą być inne):'
                            '\n\n- Zakręcałem(-am) wodę w czasie mycia zębów.'
                            '\n\n- Wyjmowałem(-am) ładowarkę od telefonu z kontaktu'
                            '\n\n- Segregowałem(-am) śmieci.'
                            '\n\n- Pojechałem(-am) gdzieś na rowerze, autobusem lub poszedłem(poszłam) pieszo.'
                            '\n\n- Nie wyrzuciłem(-am) żadnego jedzenia (np. drugiego śniadania w szkole).'
                            '\n\n- Nie wziąłem(wzięłam) torebki foliowej lub nie kupiłem(-am) w szkolnym sklepiku niczego w plastikowym opakowaniu.'
                            '\n\n- Wyłączyłem(-am) niepotrzebne światło.'
                            '\n\n- Podczas spaceru podniosłem(-am) śmieci z ziemi i wrzuciłem(-am) do kosza.'
                            '\n\n- Wziąłem(wzięłam) krótki prysznic zamiast kąpieli.',
                        'Razem z rodzicami, klasą lub gromadą uczestniczyłem(-am) w akcji ekologicznej, np. sprzątaniu świata, sadzeniu drzew, zbiórce elektrośmieci. Wytłumaczyłem(-am) w kręgu rady, że było to ważne działanie.',
                        'Wyjaśniłem(-am) innym zuchom, czym jest ślad węglowy i jak można gozlikwidować.',
                      ]),
                ]),
            SprawFamilyData(
                id: '5',
                requirements: [
                  'Potrafię wytłumaczyć powstawanie niektórych opadów i zjawisk atmosferycznych: deszczu, burzy, gradu, śniegu, mgły, tęczy.',
                  'Potrafię określić kierunek wiatru. Umiem odczytać wskazania termometru.',
                  'Oglądam prognozę pogody w telewizji lub zapoznaję się z nią w Internecie. Rozumiem używane przez prezenterów słowa: niż, wyż, front.',
                  'Zrobiłem(-am) wiatromierz lub wodomierz.',
                  'Przeprowadziłem(-am) obserwacje meteorologiczne i zapisywałem(-am) wyniki w kalendarzu pogody.',
                  'Znam przysłowia o pogodzie.',
                  'Umiem przewidzieć pogodę na podstawie obserwacji zjawisk przyrody.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów zainteresowanych meteorologią i zjawiskami przyrodniczymi. Rozbudza ciekawość. Zwraca uwagę na przyrodę i zjawiska, które w niej zachodzą.',
                  'Sprawność jest szczególnie atrakcyjna podczas kolonii zuchowej, kiedy zuchy są zainteresowane stanem pogody na następny dzień.',
                  'Aby dalej rozwijać zainteresowania przyrodnicze zucha, można zaproponować mu zdobywanie sprawności „Astronoma” (wpływ kosmosu na klimat Ziemi, zmiany pór roku itp.), „Ptasiego opiekuna” lub „Zielarza”.',
                  'Punkt Prawa Zucha, który podkreślamy, realizując sprawność „Meteorologa”:„Zuch stara się być coraz lepszy".',
                ],
                sprawData: [
                  SprawData(
                      id: 'meteorolog',
                      title: 'Meteorolog',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wytłumaczyłem(-am), jak powstaje deszcz, śnieg i tęcza.',
                        'Odczytałem(-am) wskazanie termometru.',
                        'Zapisałem(-am) dwa przysłowia o pogodzie.',
                        'Przez trzy dni prowadziłem(-am) obserwacje meteorologiczne i zapisywałem(-am) je w kalendarzu pogody.',
                        'Obejrzałem(-am) prognozę pogody i zaplanowałem(-am) odpowiedni ubiór na następny dzień.',
                      ]),
                  SprawData(
                      id: 'meteorolog',
                      title: 'Meteorolog',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wytłumaczyłem(-am), jak powstaje deszcz, burza, mgła, śnieg i tęcza.',
                        'Odczytałem(-am) wskazanie termometru.',
                        'Zapisałem(-am) cztery przysłowia o pogodzie.',
                        'Zrobiłem(-am) wiatromierz lub wodomierz.',
                        'Przez trzy dni prowadziłem(-am) obserwacje meteorologiczne i zapisywałem(-am) je w kalendarzu pogody. Uwzględniłem(-am) w nich wyniki odczytane z wykonanego przeze mnie wodomierza lub wiatromierza.',
                        'Obejrzałem(-am) prognozę pogody i zaplanowałem(-am) odpowiedni ubiór na następny dzień.',
                      ]),
                  SprawData(
                      id: 'meteorolog',
                      title: 'Meteorolog',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wytłumaczyłem(-am), jak powstaje deszcz, burza, grad, mgła, śnieg i tęcza. Opowiedziałem(-am) na zbiórce, jak należy zachować się podczas burzy.',
                        'Odczytałem(-am) wskazanie termometru.',
                        'Zapisałem(-am) cztery przysłowia o pogodzie.',
                        'Zrobiłem(-am) wiatromierz lub wodomierz.',
                        'Przez pięć dni prowadziłem(-am) obserwacje meteorologiczne i zapisywałem(-am) je w kalendarzu pogody. Uwzględniłem(-am) w nich wyniki odczytane z wykonanego przeze mnie wodomierza lub wiatromierza.',
                        'Obejrzałem(-am) prognozę pogody i zaplanowałem(-am) odpowiedni ubiór na następny dzień.',
                        'Na podstawie obserwacji przyrody przewidziałem(-am) pogodę na najbliższe godziny.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '6',
                requirements: [
                  'Interesuję się lasem. Znam rodzaje lasów występujących w Polsce.',
                  'Znam popularne rośliny występujące w lesie. Potrafię je rozpoznać.',
                  'Znam owoce lasu występujące w okolicy. Wiem, które z nich nadają się do spożycia.',
                  'Znam zwierzęta zamieszkujące polskie lasy, potrafię rozpoznać ich ślady.',
                  'Znam zasady przebywania w lesie. Opowiedziałem(-am) o nich kolegom.',
                  'Wybrałem(-am) się na wycieczkę do lasu, podczas której zebrałem(-am) znalezione śmieci.',
                  'Wykonałem(-am) makietę lasu, opisując poszczególne jego warstwy.',
                ],
                notesForLeaders: [
                  'Zdobywając tę sprawność, zuch rozwija swoje zainteresowania przyrodnicze i zdobywa wiedzę o polskich lasach.',
                  'Swoją makietę lasu zuch może przedstawić podczas realizacji w gromadzie tropu związanego z przyrodą.',
                  'Konieczny jest nadzór nad zuchem zdobywającym sprawność, gdyż dotyczy ona m.in. jadalnych owoców lasu. Jeśli kadra gromady nie ma wiedzy niezbędnej do ich rozpoznania, należy skonsultować się ze specjalistą i powierzyć mu kontrolę nad realizacją tego punktu.',
                  'Ze względu na specyfikę zadań o fakcie zdobywania sprawności należy poinformować rodziców zucha.',
                  'Aby dalej rozwijać zainteresowania przyrodnicze zucha, można zaproponować mu zdobywanie sprawności „Ptasiego opiekuna”, „Zbieracza grzybów”, „Zielarza” i „Ekologa”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Przyjaciela lasu”: „Wszystkim z zuchem jest dobrze" „Zuch stara się być coraz lepszy".',
                ],
                sprawData: [

                  SprawData(
                      id: 'przyjaciel_lasu',
                      title: 'Przyjaciel Lasu',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozpoznaję rodzaje polskich lasów. Znam liście i owoce najpopularniejszych drzew, które w nich występują.',
                        'Zebrałem(-am) ilustracje przedstawiające mieszkańców lasu. Pokazałem(-am) je mojej szóstce.',
                        'Byłem(-am) na wycieczce w lesie w poszukiwaniu śladów mieszkających tam zwierząt. Wykonałem(-am) rysunek wybranego śladu.',
                        'Podczas wycieczki do lasu słuchałem(-am) odgłosów przyrody (ptaki, zwierzęta, szum drzew). Prowadziłem(-am) notatki z obserwacji. Nagrałem(-am) kilka odgłosów przyrody i zaprezentowałem(-am) je w kręgu rady.',
                        'Wykonałem(-am) plakat pokazujący warstwy lasu. Przedstawiłem(-am) go w kręgu rady.',
                        'Znam owoce lasu. Wiem, które z nich są jadalne. Opowiedziałem(-am) o nich drużynowemu.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_lasu',
                      title: 'Przyjaciel Lasu',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozpoznaję rodzaje polskich lasów. Zebrałem(-am) i opisałem(-am) liście rosnących w nich drzew.',
                        'Zebrałem(-am) ilustracje przedstawiające mieszkańców lasu. Sfotografowałem(-am) przynajmniej jedno leśne zwierzę. Pokazałem(-am) zdjęcie mojej szóstce.',
                        'Byłem(-am) na wycieczce w lesie w poszukiwaniu śladów mieszkających tam zwierząt. Posprzątałem(-am) las ze znalezionych śmieci.',
                        'Podczas wycieczki do lasu słuchałem(-am) odgłosów przyrody (ptaki, zwierzęta, szum drzew). Prowadziłem(-am) notatki z obserwacji. Nagrałem(-am) kilka odgłosów przyrody i zaprezentowałem(-am) je w kręgu rady.',
                        'Wykonałem(-am) plakat lub makietę przedstawiającą las. Opisałem(-am) warstwy lasu oraz ich mieszkańców. Przedstawiłem(-am) go w kręgu rady.',
                        'Znam owoce lasu. Wiem, gdzie można je wykorzystać i jakie potrawy można z nich przyrządzić. Opowiedziałem(-am) o tym drużynowemu.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_lasu',
                      title: 'Przyjaciel Lasu',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozpoznaję rodzaje polskich lasów. Zebrałem(-am) i opisałem(-am) ich liście i narysowałem(-am) lub sfotografowałem(-am) ich owoce. Pracę przedstawiłem(-am) na zbiórce gromady.',
                        'Zebrałem(-am) ilustracje przedstawiające mieszkańców lasu. Pokazałem(-am) je mojej szóstce.',
                        'Byłem(-am) na wycieczce w lesie w poszukiwaniu śladów żyjących tam zwierząt. Posprzątałem(-am) las ze znalezionych śmieci.',
                        'Podczas wycieczki do lasu słuchałem(-am) odgłosów przyrody (ptaki, zwierzęta, szum drzew). Prowadziłem(-am) notatki z obserwacji. Nagrałem(-am) kilka odgłosów i zaprezentowałem(-am) je w kręgu rady. Potrafię określić, które zwierzęta wydają dane dźwięki.',
                        'Wykonałem(-am) makietę pokazującą warstwy lasu. Zamieściłem(-am) na niej także mieszkańców lasu i najpopularniejszą roślinność. Przedstawiłem(-am) makietę w kręgu rady.',
                        'Przygotowałem(-am) dla rodziny danie z owoców lasu. Wykonałem(-am) zdjęcie, które pokazałem(-am) drużynowemu.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '7',
                requirements: [
                  'Interesuję się ptakami. Zbieram przedstawiające je ilustracje.',
                  'Potrafię rozpoznać i nazwać niektóre ptaki.',
                  'Wykonałem(-am) karmnik. Systematycznie dokarmiałem(-am) ptaki. Wiem, jak należy dokarmiać ich różne gatunki.',
                  'Zbudowałem(-am) domek dla ptaków.',
                  'Rozpoznaję ptaki, które przylatują do mojego karmnika.',
                  'Byłem(-am) na wycieczce w parku lub w lesie i uważnie obserwowałem(-am) ptaki. Prowadziłem(-am) notatki z obserwacji.',
                  'Narysowałem(-am) ptaka lub sfotografowałem(-am) go.',
                  'Wiem, co zrobić, gdy znajdę rannego ptaka.',
                  'Zebrałem(-am) pióra ptaków. Potrafię rozpoznać, do jakich gatunków należały.',
                  'Opowiedziałem(-am) kolegom o życiu ptaków.',
                ],
                notesForLeaders: [
                  'Zdobywając tę sprawność, zuch rozwija zainteresowania przyrodnicze i uczy się systematyczności (należy uświadomić mu, że dokarmianie ptaków nie może skończyć się wraz ze zdobyciem sprawności, lecz trzeba prowadzić je do wiosny).',
                  'Aby dalej rozwijać zainteresowania przyrodnicze zucha, można zaproponować mu zdobywanie sprawności „Przyjaciela lasów”, „Zbieracza grzybów”, „Zielarza” i „Ekologa”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Ptasiego opiekuna”:„Wszystkim jest z zuchem dobrze", „Zuch stara się być coraz lepszy".',
                ],
                sprawData: [

                  SprawData(
                      id: 'ptasi_opiekun',
                      title: 'Ptasi Opiekun',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) ilustracje, widokówki z ptakami lub ptasie pióra. Pokazałem(-am) je na zbiórce gromady.',
                        'Rozpoznałem(-am) trzy gatunki ptaków.',
                        'Wykonałem(-am) zawieszkę z karmą dla ptaków i powiesiłem(-am) ją na drzewie.',
                        'Byłem(-am) na wycieczce w parku lub w lesie i uważnie obserwowałem(-am) ptaki. Prowadziłem(-am) notatki z obserwacji.',
                        'Narysowałem(-am) ptaka lub sfotografowałem(-am) go.',
                      ]),
                  SprawData(
                      id: 'ptasi_opiekun',
                      title: 'Ptasi Opiekun',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) ilustracje przedstawiające ptaki. Pokazałem(-am) je na zbiórce gromady.',
                        'Rozpoznałem(-am) pięć gatunków ptaków.',
                        'Wykonałem(-am) karmnik dla ptaków i regularnie je dokarmiałem(-am) odpowiednim pożywieniem.',
                        'Byłem(-am) na wycieczce w parku lub w lesie i uważnie obserwowałem(-am) ptaki. Prowadziłem(-am) notatki z obserwacji.',
                        'Narysowałem(-am) ptaka lub sfotografowałem(-am) go.',
                        'Zebrałem(-am) pióra ptaków i dowiedziałem(-am) się, do jakich gatunków należały.',
                      ]),
                  SprawData(
                      id: 'ptasi_opiekun',
                      title: 'Ptasi Opiekun',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) ilustracje z ptakami lub ptasie pióra. Pokazałem(-am) je na zbiórce gromady.',
                        'Rozpoznałem(-am) pięć gatunków ptaków.',
                        'Wykonałem(-am) karmnik dla ptaków i regularnie je dokarmiałem(-am) odpowiednim pożywieniem.',
                        'Byłem(-am) na wycieczce w parku lub w lesie i uważnie obserwowałem(-am) ptaki. Prowadziłem(-am) notatki z obserwacji.',
                        'Narysowałem(-am) ptaka lub sfotografowałem(-am) go.',
                        'Dowiedziałem(-am) się, co zrobić, gdy znajdę rannego ptaka (i dlaczego nie wolno zabierać go do domu). Wiem, jaka instytucja w mojej miejscowości zajmuje się pomocą ptakom.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '8',
                requirements: [
                  'Potrafię rozpoznać na zdjęciach i w naturze oraz nazwać pospolite grzyby jadalne i trujące.',
                  'Byłem(-am) na kilku grzybobraniach. Zorganizowałem(-am) konkurs na króla grzybobrania.',
                  'Sfotografowałem(-am) lub narysowałem(-am) moją najwspanialszą zdobycz.',
                  'Wiem, do czego można wykorzystać grzyby. Znam warunki ich przechowywania i suszenia.',
                  'Pomogłem(-am) przyrządzić potrawę z grzybów.',
                  'Wiem, jakie jest znaczenie grzybów trujących w przyrodzie i dlaczego nie wolno ich niszczyć.',
                  'Wykonałem(-am) własny atlas grzybów lub plakat dotyczący bezpiecznego zbierania grzybów.',
                  'Umiem szukać grzybów w charakterystycznych dla nich miejscach. Potrafię zbierać je, nie niszcząc grzybni i ściółki.',
                  'Odpowiednio ubieram się na grzybobranie.',
                ],
                notesForLeaders: [],
                sprawData: [

                  SprawData(
                      id: 'zbieracz_grzybow',
                      title: 'Zbieracz Grzybów',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Uczestniczyłem(-am) w grzybobraniu i zorganizowałem(-am) konkurs na króla grzybobrania.',
                        'Rozpoznałem(-am) trzy gatunki grzybów.',
                        'Sfotografowałem(-am) lub narysowałem(-am) moją najwspanialszą zdobycz.',
                        'Wymieniłem(-am) trzy potrawy, które można przyrządzić z grzybów. Pomogłem(-am) przyrządzić jedną z nich.',
                        'Przygotowałem(-am) plakat dotyczący bezpiecznego zbierania grzybów.',
                      ]),
                  SprawData(
                      id: 'zbieracz_grzybow',
                      title: 'Zbieracz Grzybów',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Uczestniczyłem(-am) w grzybobraniu i zorganizowałem(-am) konkurs na króla grzybobrania.',
                        'Rozpoznałem(-am) pięć gatunków grzybów.',
                        'Sfotografowałem(-am) lub narysowałem(-am) moją najwspanialszą zdobycz.',
                        'Wymieniłem(-am) pięć potraw, które można przyrządzić z grzybów. Pomogłem(-am) przyrządzić jedną z nich.',
                        'Pomogłem(-am) w suszeniu grzybów.',
                        'Wykonałem(-am) własny atlas grzybów lub plakat dotyczący bezpiecznego zbierania grzybów.',
                      ]),
                  SprawData(
                      id: 'zbieracz_grzybow',
                      title: 'Zbieracz Grzybów',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Uczestniczyłem(-am) w grzybobraniu i zorganizowałem(-am) konkurs na króla grzybobrania.',
                        'Rozpoznałem(-am) trzy gatunki grzybów jadalnych i trzy gatunki grzybów trujących.',
                        'Wytłumaczyłem(-am), dlaczego nie wolno niszczyć trujących gatunków grzybów.',
                        'Sfotografowałem(-am) lub narysowałem(-am) moją najwspanialszą zdobycz.',
                        'Wymieniłem(-am) siedem potraw, które można przyrządzić z grzybów. Pomogłem(-am) przyrządzić jedną z nich.',
                        'Pomogłem(-am) w suszeniu grzybów.',
                        'Wykonałem(-am) własny atlas grzybów. Opisałem(-am), w jakich charakterystycznych miejscach należy szukać grzybów.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '9',
                requirements: [
                  'Interesuję się zielarstwem. Wiem, kiedy i gdzie należy zbierać zioła.',
                  'Często korzystam z atlasu roślin leczniczych i sprawnie się nim posługuję.',
                  'Prowadzę i wciąż wzbogacam własny zielnik. Każde nowe zioło starannie oprawiam, opisuję jego cechy i walory lecznicze.',
                  'Zaparzyłem(-am) herbatkę z własnoręcznie zebranych i przygotowanych ziół: lipy, mięty, rumianku.',
                  'Pokazałem(-am) wszystkim zuchom rośliny jadalne lub lecznicze, które łatwo pomylić z roślinami trującymi.',
                  'Wykonałem(-am) plakaty ostrzegające przed trującymi roślinami. Pokazałem(-am) je innym zuchom.',
                  'Wiem, z których ziół można zrobić napar, syrop, sok, miazgę itp.',
                ],
                notesForLeaders: [
                  'Sprawność uczy dokładności, staranności i odpowiedzialności. Polecana jest dla zuchów interesujących się przyrodą, lubiących działania plastyczne i interesujących się kucharzeniem.',
                  'Zuch „Zielarz” potrafi rozpoznać wiele roślin. Wie, kiedy zbiera się poszczególne zioła, jak się je suszy i przechowuje. Potrafi wskazać ich właściwości.',
                  'Istotny jest nadzór nad zuchem zdobywającym sprawność, ponieważ dotyczy ona roślin leczniczych i trujących. Jeśli drużynowy nie zna się na ziołach, kontrolę nad zdobywaniem sprawności musi powierzyć specjaliście.',
                  'O fakcie zdobywania sprawności należy poinformować rodziców zucha.',
                  'Zuchowi, który interesuje się zielarstwem, można zaproponować także zdobywanie sprawności „Hodowcy kwiatów”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Zielarza”:„Zuch pamięta o swoich obowiązkach", „Zuch stara się być coraz lepszy",„Wszystkim jest z zuchem dobrze".',
                ],
                sprawData: [

                  SprawData(
                      id: 'zielarz',
                      title: 'Zielarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaprezentowałem(-am) szóstce trzy najpopularniejsze zioła, ich sposób wykorzystania oraz właściwości.',
                        'Umiem wyszukać informacje o interesującej mnie roślinie. Przedstawiłem(-am) je zuchom.',
                        'Przygotowałem(-am) i wciąż wzbogacam mój zielnik.',
                        'Wykonałem(-am) napar z własnoręcznie zebranej mięty, rumianku lub lipy.',
                        'Wyszukałem(-am) i zaprezentowałem(-am) gromadzie zdjęcia ziół trujących, których należy unikać.',
                      ]),
                  SprawData(
                      id: 'zielarz',
                      title: 'Zielarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaprezentowałem(-am) szóstce pięć najpopularniejszych ziół, ich sposób wykorzystania oraz właściwości.',
                        'Umiem wyszukać informacje o interesującej mnie roślinie. Wykonałem(-am) plakat pokazujący moje najnowsze odkrycie.',
                        'Przygotowałem(-am) i wciąż wzbogacam mój zielnik. Opowiedziałem(-am) o nim i pokazałem(-am) go mojej szóstce.',
                        'Wykonałem(-am) napar z własnoręcznie zebranej mięty, rumianku lub lipy. Samodzielnie przygotowałem(-am) naturalny sok.',
                        'Wykonałem(-am) tablice przedstawiające wybrane trzy zioła i rośliny trujące, na które możemy natrafić podczas leśnych wycieczek.',
                      ]),
                  SprawData(
                      id: 'zielarz',
                      title: 'Zielarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaprezentowałem(-am) gromadzie siedem najpopularniejszych ziół, ich sposób wykorzystania oraz właściwości.',
                        'Sprawnie wyszukuję informacje o interesującej mnie roślinie. Podzieliłem(-am) się z gromadą tytułami książek oraz adresami stron internetowych, z których czerpię najwięcej informacji.',
                        'Przygotowałem(-am) i wciąż wzbogacam mój zielnik. Opowiedziałem(-am) o nim i pokazałam go w gromadzie.',
                        'Wykonałem(-am) napar z własnoręcznie zebranej mięty, rumianku lub lipy. Samodzielnie przygotowałem(-am) syrop z ziół.',
                        'Wykonałem(-am) tablice przedstawiające pięć ziół i roślin trujących, na które możemy natrafić podczas leśnych wycieczek.',
                      ]),
                ]
            ),
          ]),

      SprawGroupData(
          id: 'naukowo_hobbystyczne',
          title: 'Naukowo-hobbystyczne',
          tags: ['#ciekawość świata', '#różnorodność', '#kultura', '#nauka', '#praca nad sobą', '#zawody', '#pasje', '#pomysłowość'],
          familyData: [

// 1. naukowo-hobbystyczna ASTRONOM
            SprawFamilyData(
                id: '1',
                requirements: [
                  'Przeprowadziłem(-am) regularne obserwacje nieba. Wiem, czym są wschód i zachód słońca oraz fazy księżyca.',
                  'Wiem, co to jest zaćmienie księżyca. Obserwowałem(-am) całkowite lub częściowe zaćmienie księżyca albo dowiedziałem(-am) się, kiedy wystąpi najbliższe takie zjawisko.',
                  'Znam budowę układu słonecznego.',
                  'Potrafię wskazać Wielką Niedźwiedzicę i inne wybrane gwiazdozbiory.',
                  'Wiem, co to jest Gwiazda Polarna oraz potrafię ją wskazać.',
                  'Znam osiągnięcia Mikołaja Kopernika lub innego sławnego astronoma.',
                  'Byłem(-am) w planetarium lub obserwatorium astronomicznym lub obejrzałem(-am) w atlasie lub Internecie mapę nieba.',
                  'Obejrzałem(-am) program o wszechświecie lub przeczytałem(-am) książkę na ten temat.',

                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów, które lubią obserwować niebo i interesują się wszechświatem.',
                  'Sprawność doskonale nadaje się na kolonię, podczas której można dokonywać wspólnych obserwacji, a także wykorzystać wiedzę zucha przy poznawaniu nieba przez inne dzieci.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu sprawność „Meteorologa”.',
                  'Punkt Prawa Zucha, który podkreślamy, realizując sprawność „Astronoma”: "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'astronom',
                      title: 'Astronom',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Dowiedziałem(-am) się, co to są fazy księżyca.',
                        'Przez tydzień prowadziłem(-am) regularne obserwacje nieba. Rysowałem(-am) w dzienniku obserwacji, jak wygląda niebo i księżyc.',
                        'Wykonałem(-am) plakat lub konstrukcję przestrzenną układu słonecznego, którą zaprezentowałem(-am) w kręgu rady.',
                        'Poznałem(-am) postać wybranego astronoma. Opowiedziałem(-am) o nim drużynowemu.',
                        'Wskazałem(-am) na niebie gwiazdozbiór Wielkiej Niedźwiedzicy oraz inny wybrany gwiazdozbiór.',
                        'Byłem(-am) w planetarium lub obserwatorium astronomicznym lub obejrzałem(-am) w atlasie lub Internecie mapę nieba.',
                        'Wskazałem(-am) Gwiazdę Polarną.',
                      ]),
                  SprawData(
                      id: 'astronom',
                      title: 'Astronom',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Prowadziłem(-am) regularne obserwacje nieba przez tydzień. Zapisałem(-am) każdego dnia, o której godzinie był wschód i zachód słońca oraz określiłem(-am) fazy księżyca.',
                        'Poznałem(-am) postać wybranego astronoma. Opowiedziałem(-am) o nim drużynowemu.',
                        'Wskazałem(-am) na niebie gwiazdozbiór Wielkiej Niedźwiedzicy i dwa inne wybrane gwiazdozbiory.',
                        'Byłem(-am) w planetarium lub obserwatorium astronomicznym lub obejrzałem(-am) w atlasie mapę nieba.',
                        'Podczas wyjazdu z gromadą wyznaczyłem(-am) północ według Gwiazdy Polarnej.',
                        'Obejrzałem(-am) program o wszechświecie lub przeczytałem(-am) książkę o tej tematyce. Zapisałem(-am) najciekawsze informacje.',
                      ]),
                  SprawData(
                      id: 'astronom',
                      title: 'Astronom',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Przez tydzień prowadziłem(-am) regularne obserwacje nieba. Zapisałem(-am) każdego dnia, o której godzinie był wschód i zachód słońca oraz określiłem(-am) fazy księżyca.',
                        'Wykonałem(-am) konstrukcję przestrzenną układu słonecznego. Zaprezentowałem(-am) ją w kręgu rady.',
                        'Poznałem(-am) postać wybranego astronoma. Opowiedziałem(-am) o nim innym zuchom w kręgu rady.',
                        'Wskazałem(-am) na niebie gwiazdozbiór Psy Gończe i trzy inne wybrane gwiazdozbiory.',
                        'Byłem(-am) w planetarium lub obserwatorium astronomicznym lub obejrzałem(-am) w atlasie lub Internecie mapę nieba.',
                        'Podczas wyjazdu z moją gromadą wyznaczyłem(-am) północ według Gwiazdy Polarnej.',
                        'Obejrzałem(-am) program o wszechświecie lub przeczytałem(-am) książkę o tej tematyce. Zapisałem(-am) najciekawsze informacje, które przedstawiłem(-am) innym zuchom w kręgu rady.',
                        'Dowiedziałem(-am) się, co to jest zaćmienie księżyca. Obserwowałem(-am) całkowite lub częściowe zaćmienie księżyca albo dowiedziałem(-am) się, kiedy wystąpi najbliższe takie zjawisko.',
                      ]),
                ]
            ),

// 2. naukowo-hobbystyczna BADACZ
            SprawFamilyData(
                id: '2',
                requirements: [
                  'Mam swój dziennik, w którym zapisuję przeprowadzane doświadczenia. Opisuję zawsze przebieg doświadczenia i wnioski.',
                  'Pokazałem(-am) zuchom na zbiórce kilka ciekawych doświadczeń.',
                  'Umiem dbać o bezpieczeństwo podczas wykonywania doświadczeń. Niebezpieczne doświadczenia przeprowadzam z pomocą osoby dorosłej.',
                  'Podczas wykonywania doświadczeń zawsze utrzymuję porządek.',
                  'Potrafię wytłumaczyć, dlaczego roślina wygina się do światła, dlaczego kompas pokazuje północ i jak powstaje wiatr.',
                  'Potrafię wymienić nazwiska trzech naukowców i powiedzieć, czym się zajmowali.',
                  'Widziałem(-am) pokaz doświadczeń naukowych lub byłem(-am) w centrum naukowym.',
                  'Interesuję się nauką i oglądam programy naukowe.',
                ],
                notesForLeaders: [
                  'Sprawność wprowadza zucha w pasjonujący świat nauki, doświadczeń i eksperymentów.',
                  'Jest przeznaczona przede wszystkim dla starszych dzieci, które interesują się mechanizmami rządzącymi światem. Pozwala na bogaty zakres działań ― przedmiotem podejmowanych doświadczeń może zostać każdy element naszego otoczenia.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Badacza”: "Zuch pamięta o swoich obowiązkach.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'badacz',
                      title: 'Badacz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Przeprowadziłem(-am) przynajmniej dwa doświadczenia. Opisałem(-am) je w swoim dzienniku badań.',
                        'Zaprezentowałem(-am) gromadzie wybrane doświadczenie. Opowiedziałam(-am), co ono ukazuje i jakie wnioski z niego płyną.',
                        'Interesuję się światem i zachodzącymi w nim zjawiskami. Znalazłem(-am) odpowiedzi na trzy zajmujące mnie pytania. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Znam nazwiska co najmniej jednego polskiego i jednego zagranicznego naukowca. Wiem, czym się zajmowali i czego dokonali. Opowiedziałem(-am) o nich drużynowemu.',
                        'Odwiedziłem(-am) centrum nauki lub uczestniczyłem(-am) w pokazie doświadczeń.',
                      ]),
                  SprawData(
                      id: 'badacz',
                      title: 'Badacz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Przeprowadziłem(-am) przynajmniej trzy doświadczenia. Opisałem(-am) je w swoim dzienniku badań, który zaprezentowałem(-am) w kręgu rady.',
                        'Wykonałem(-am) dla zuchów wybrane dwa doświadczenia. Opowiedziałem(-am), co ukazują i jakie wnioski z nich płyną.',
                        'Opowiedziałem(-am) zuchom z gromady, jak należy przygotować się do prowadzenia doświadczeń i jakie środki bezpieczeństwa zachować.',
                        'Interesuję się światem i zachodzącymi w nim zjawiskami. Znalazłem(-am) odpowiedzi na pięć zajmujących mnie pytań. Wynikiem mojej pracy podzieliłem(-am) się w kręgu rady, prezentując go w wybranej formie (plakat, opowieść, zdjęcia, prezentacja).',
                        'Znam nazwiska co najmniej dwóch polskich i dwóch zagranicznych naukowców. Wiem, czym się zajmowali i czego dokonali. Wykonałem(-am) plakaty prezentujące ich sylwetki lub opisałem(-am) ich w moim dzienniku badań.',
                        'Odwiedziłem(-am) centrum nauki lub uczestniczyłem(-am) w pokazie doświadczeń.',
                      ]),
                  SprawData(
                      id: 'badacz',
                      title: 'Badacz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Przeprowadziłem(-am) przynajmniej cztery doświadczenia. Opisałem(-am) je w swoim dzienniku badań, który zaprezentowałem(-am) zuchom w kręgu rady.',
                        'Wykonałem(-am) dla zuchów wybrane trzy doświadczenia. Opowiedziałem(-am), co ukazują i jakie wnioski z nich płyną.',
                        'Opowiedziałem(-am) zuchom z gromady, jak należy przygotować się do prowadzenia doświadczeń i jakie środki bezpieczeństwa zachować.',
                        'Wymieniłem(-am) lub narysowałem(-am) przedmioty potrzebne młodemu badaczowi. Wiem, do czego należy ich używać i jak o nie dbać.',
                        'Interesuję się światem i zachodzącymi w nim zjawiskami. Znalazłem(-am) odpowiedzi na siedem zajmujących mnie pytań. Wynikiem mojej pracy podzieliłem(-am) się w kręgu rady, prezentując go w wybranej formie (plakat, opowieść, zdjęcia, prezentacja).',
                        'Znam nazwiska co najmniej trzech polskich i trzech zagranicznych naukowców. Wiem, czym się zajmowali i czego dokonali. Wykonałem(-am) plakaty z ich sylwetkami lub opisałem(-am) ich w moim dzienniku badań.',
                        'Odwiedziłem(-am) centrum nauki lub uczestniczyłem(-am) w pokazie doświadczeń.',
                        'Mam swój ulubiony program naukowy. Opowiedziałem(-am) o nim w kręgu rady, zachęcając do obejrzenia go inne zuchy.',
                      ]),
                ]
            ),

// 3. naukowo-hobbystyczna BAJARZ
            SprawFamilyData(
                id: '3',
                requirements: [
                  'Wiem, jaka jest różnica między bajką a legendą. Opowiedziałem(-am) kolegom dwie bajki i jedną legendę.',
                  'Wykonałem(-am) ilustracje do ulubionej bajki.',
                  'Przeczytałem(-am) kilka baśni Andersena i dowolną książkę jednego z polskich autorów, np. Marii Kownackiej, Marii Konopnickiej, Hanny Januszewskiej, Jana Brzechwy.',
                  'Wysłuchałem(-am) nagrania bajki.',
                  'Zbieram książki i czasopisma z bajkami i legendami.',
                  'Brałem(-am) udział w konkursie bajarzy lub gawędziarzy.',
                  'Wykonałem(-am) krótką inscenizację bajkową. Byłem(-am) narratorem w teatrzyku zuchowym.',
                  'Zrobiłem(-am) zakładki do książek z motywami ulubionych bajek.',
                  'Napisałem(-am) bajkę.',
                ],
                notesForLeaders: [
                  'Zuch „Bajarz” chętnie czyta i opowiada bajki. Oprócz utworów z kanonu literatury dziecięcej warto zaproponować mu bajki i baśnie współczesnych autorów.',
                  'Zuchy zdobywające tę sprawność na kolonii mogą opowiadać bajki na dobranoc.',
                  'Zuch, który lubi przede wszystkim czytać, może następnie zdobywać sprawność „Przyjaciela książki”, a zuch, który chętnie rysuje - sprawność „Plastyka”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Bajarza”: "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'bajarz',
                      title: 'Bajarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest legenda i co to jest bajka. Porozmawiałem(-am) o tym z drużynowym.',
                        'Opowiedziałem(-am) lub przeczytałem(-am) swoją ulubioną bajkę młodszemu rodzeństwu lub kolegom.',
                        'Wykonałem(-am) zakładkę do książki.',
                      ]),
                  SprawData(
                      id: 'bajarz',
                      title: 'Bajarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam swoją ulubioną bajkę, wykonałem(-am) do niej ilustracje. Znam jej autora.',
                        'Wiem, co to jest legenda i co to jest bajka. Zapisałem(-am), co je charakteryzuje. Podałem(-am) po jednym tytule bajki i legendy.',
                        'Przeczytałem(-am) kilka baśni Andersena i jedną dowolną książkę któregoś z polskich autorów, np. Marii Konopnickiej, Marii Kownackiej, Hanny Januszewskiej, Jana Brzechwy.',
                        'Wykonałem(-am) zakładkę do książki i podarowałem(-am) ją komuś bliskiemu.',
                        'Wymyśliłem(-am) krótką inscenizację bajkową, którą wraz ze swoją szóstką zaprezentowałem(-am) na zbiórce gromady.',
                      ]),
                  SprawData(
                      id: 'bajarz',
                      title: 'Bajarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam swoją ulubioną bajkę. Wykonałem(-am) do niej ilustracje. Znam jej autora.',
                        'Wykonałem(-am) plakat zachęcający zuchy do czytania bajek. Zaprezentowałem(-am) go zuchom na zbiórce.',
                        'Przeczytałem(-am) kilka baśni Andersena i dwie dowolne książki któregoś z polskich autorów, np. Marii Konopnickiej, Marii Kownackiej, Hanny Januszewskiej, Jana Brzechwy.',
                        'Zorganizowałem(-am) w gromadzie konkurs na najładniejszą zakładkę.',
                        'Wiem, co to jest legenda i co to jest bajka. Zapisałem(-am), co je charakteryzuje. Wymieniłem(-am) tytuły jednej bajki i jednej legendy. Wybraną bajkę lub legendę zaprezentowałem(-am) zuchom na zbiórce gromady.',
                        'Napisałem(-am) własną bajkę i wykonałem(-am) do niej ilustracje. Przeczytałem(-am) ją zuchom na zbiórce.',
                      ]),
                ]
            ),

// 4. naukowo-hobbystyczna FOTOAMATOR
            SprawFamilyData(
                id: '4',
                requirements: [
                  'Wiem, jak jest zbudowany aparat fotograficzny.',
                  'Byłem(-am) w studiu fotograficznym.',
                  'Potrafię prawidłowo robić zdjęcia swoim aparatem lub telefonem. Nauczyłem(-am) się kadrowania zdjęć.',
                  'Umiem przesłać drogą elektroniczną zdjęcie do innej osoby.',
                  'Założyłem(-am) i systematycznie prowadzę album rodzinny.',
                  'Zorganizowałem(-am) wystawę prac fotograficznych.',
                  'Zrobiłem(-am) zdjęcie do kroniki gromady.',
                  'Umiem przerabiać zdjęcia za pomocą aplikacji dostępnych w telefonach komórkowych lub innych urządzeniach elektronicznych.',
                ],
                notesForLeaders: [
                  'Zuch „Fotoamator” może być fotografem gromady lub opiekować się albumem fotograficznym rodziny lub gromady. Zadania na sprawność może realizować podczas wypraw gromady, dokumentując ciekawe wydarzenia na zbiórkach i pomagając w prowadzeniu kroniki lub strony internetowej.',
                  'Zuch zdobywający tę sprawność powinien nauczyć się korzystać z różnych rodzajów aparatów, nie tylko tradycyjnych.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Fotoamatora”: "Zuch stara się być coraz lepszy.", "Zucha pamięta o swoich obowiązkach."',
                ],
                sprawData: [

                  SprawData(
                      id: 'fotoamator',
                      title: 'Fotoamator',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam budowę tradycyjnego aparatu fotograficznego. Przygotowałem(-am) plakat prezentujący budowę aparatu i przedstawiłem(-am) go drużynowemu.',
                        'Byłem(-am) w studiu fotograficznym i poznałem(-am) pracę fotografa. Opowiedziałem(-am) o tym na zbiórce.',
                        'Prawidłowo wykonałem(-am) trzy zdjęcia o różnej tematyce i zaprezentowałem(- łam) je w gromadzie.',
                        'Założyłem(-am) i systematycznie prowadzę album rodzinny. Zaprezentowałem(-am) go w kręgu rady.',
                        'Zrobiłem(-am) zdjęcie do kroniki gromady/na stronę internetową gromady.',
                      ]),
                  SprawData(
                      id: 'fotoamator',
                      title: 'Fotoamator',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam budowę tradycyjnego aparatu fotograficznego. Przygotowałem(-am) plakat prezentujący budowę aparatu i przedstawiłem(-am) go na zbiórce.',
                        'Byłem(-am) w studiu fotograficznym i poznałem(-am) pracę fotografa. Opowiedziałem(-am) o tym na zbiórce.',
                        'Prawidłowo wykonałem(-am) trzy zdjęcia o różnej tematyce. Prawidłowo je wykadrowałem(-am).',
                        'Założyłem(-am) i systematycznie prowadzę album rodzinny. Zaprezentowałem(-am) go w kręgu rady.',
                        'Przerobiłem(-am) zdjęcie za pomocą aplikacji dostępnej w telefonie komórkowym lub innym urządzeniu elektronicznym (kadrowanie, przycinanie, zmiana filtru).',
                      ]),
                  SprawData(
                      id: 'fotoamator',
                      title: 'Fotoamator',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam budowę tradycyjnego aparatu fotograficznego. Stworzyłem(-am) model aparatu w formacie 3D.',
                        'Byłem(-am) w studiu fotograficznym i poznałem(-am) pracę fotografa. Opowiedziałem(-am) o tym na zbiórce.',
                        'Założyłem(-am) i systematycznie prowadzę album rodzinny. Zaprezentowałem(-am) go w kręgu rady.',
                        'Wysłałem(-am) drogą elektroniczną/przez MMS wybrane zdjęcie do innej osoby. Opowiedziałem(-am) o tym na zbiórce.',
                        'Zorganizowałem(-am) wystawę prac fotograficznych.',
                        'Przerobiłem(-am) zdjęcie za pomocą aplikacji dostępnej w telefonie komórkowym lub innym urządzeniu elektronicznym (kadrowanie, przycinanie, zmiana filtru).',
                      ]),
                ]
            ),

// 5. naukowo-hobbystyczna FRYZJER
            SprawFamilyData(
                id: '5',
                requirements: [
                  'Byłem(-am) u fryzjera i obserwowałem(-am) jego pracę.',
                  'Ułożyłem(-am) według własnego pomysłu kilka fryzur z długich, średnich i krótkich włosów.',
                  'Opowiedziałem(-am) zuchom, jak właściwie pielęgnować włosy i skórę głowy oraz jak dobierać szampon.',
                  'Wykonałem(-am) ozdobę do włosów.',
                  'Wykonałem(-am) fryzurę balową z różnymi dodatkami.',
                  'Zakręciłem(-am) włosy na dwa różne sposoby.',
                  'Opowiedziałem(-am) zuchom, do czego służą odżywki, żele, pianki i dlaczego trzeba mieć własny grzebień.',
                ],
                notesForLeaders: [
                  'Sprawność wspiera rozwój umiejętności manualnych, wyobraźni i poczucia estetyki, a także zwraca uwagę na potrzebę zachowania higieny i schludnego wyglądu.',
                  'Zuchy mogą ją zdobywać podczas kolonii lub na biwaku, kiedy w pewnym stopniu samodzielnie dbają o higienę głowy i estetykę swojego uczesania.',
                  'Zuchom zainteresowanym sprawami higieny można następnie polecić sprawność „Higienisty”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Fryzjera”: "Zuch pamięta o swoich obowiązkach.", "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'fryzjer',
                      title: 'Fryzjer',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) u fryzjera i obserwowałem(-am) jego pracę. Wiem, jakich narzędzi i urządzeń używa oraz do czego służy każde z nich. Narysowałem(-am) je i zaprezentowałem(-am) zuchom w szóstce.',
                        'Własnoręcznie wykonałem(-am) ozdobę do włosów.',
                        'Ułożyłem(-am) fryzurę z włosów krótkich, średnich i długich.',
                        'Wiem, jak dbać o włosy i skórę głowy. Opowiedziałem(-am) o tym zuchom z gromady.',
                        'Umiem się samodzielnie uczesać. Na biwaku lub kolonii zuchowej czesałem(-am) się sam(a) każdego ranka.',
                      ]),
                  SprawData(
                      id: 'fryzjer',
                      title: 'Fryzjer',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) u fryzjera i obserwowałem(-am) jego pracę. Zadałem(-am) fryzjerowi pytania dotyczące pielęgnacji włosów. Zdobytą wiedzą podzieliłem(-am) się z zuchami z mojej szóstki.',
                        'Wiem, jakich narzędzi i urządzeń używa fryzjer oraz do czego one służą. Narysowałem(-am) je i opowiedziałem(-am) o nich zuchom w szóstce.',
                        'Własnoręcznie wykonałem(-am) ozdobę do włosów.',
                        'Ułożyłem(-am) po dwie fryzury z włosów krótkich, średnich i długich.',
                        'Wiem, jak dbać o włosy i skórę głowy. Znam podstawowe kosmetyki do pielęgnacji i higieny. Opowiedziałem(-am) o pielęgnacji włosów zuchom z mojej gromady.',
                        'Umiem się samodzielnie uczesać. Na biwaku lub kolonii zuchowej czesałem(-am) się sam(a) każdego ranka.',
                      ]),
                  SprawData(
                      id: 'fryzjer',
                      title: 'Fryzjer',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) u fryzjera i obserwowałem(-am) jego pracę. Zadałem(-am) fryzjerowi pytania dotyczące pielęgnacji włosów. Zdobytą wiedzą podzieliłem(-am) się z zuchami z gromady.',
                        'Wiem, jakich narzędzi i urządzeń używa fryzjer oraz do czego one służą. Narysowałem(-am) je i opowiedziałem(-am) o nich zuchom w kręgu rady.',
                        'Własnoręcznie wykonałem(-am) ozdobę do włosów.',
                        'Ułożyłem(-am) po trzy fryzury z włosów krótkich, średnich i długich.',
                        'Wiem, jak dbać o włosy i skórę głowy. Znam podstawowe kosmetyki do pielęgnacji i higieny. Opowiedziałem(-am) o pielęgnacji włosów zuchom z mojej gromady.',
                        'Zakręciłem(-am) włosy na dwa wybrane sposoby.',
                        'Umiem się samodzielnie uczesać. Na biwaku lub kolonii zuchowej czesałem(-am) się sam(a) każdego ranka.',
                      ]),
                ]
            ),

// 6. naukowo-hobbystyczna GEOPOSZUKIACZ
            SprawFamilyData(
                id: '6',
                requirements: [
                  'Wiem, co to jest geocaching, GPS i współrzędne geograficzne.',
                  'Zapoznałem(-am) się z kodeksem geocachera.',
                  'Odnalazłem(-am) wraz z opiekunem trzy skrzynki.',
                  'Znalazłem(-am) ciekawe miejsce lub budowlę w okolicy miejsca zamieszkania.',
                  'Zarejestrowałem(-am) w serwisie internetowym odnalezienie skrzynki.',
                ],
                notesForLeaders: [
                  'To sprawność dla zuchów, które chcą być współczesnymi poszukiwaczami skarbów.',
                  'Podczas jej zdobywania młody odkrywca uczy się dostrzegać piękno otaczającego świata i zwracać uwagę na zabytki. Korzysta z uroków natury, żyjąc z nią w zgodzie. Perspektywa odnalezienia skarbu jest dla niego dodatkową motywacją do działania.',
                  'Zuchy mogą zdobywać sprawność „Geoposzukiwacza” podczas realizacji w gromadzie tropów turystycznych i kulturoznawczych.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Geoposzukiwacza”: "Zuch kocha Boga i Polskę.", "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'geoposzukiwacz',
                      title: 'Geoposzukiwacz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) zuchom z mojej szóstki, czym jest geocaching.',
                        'Zaprezentowałem(-am) graficznie kodeks geocachera.',
                        'Odnalazłem(-am) skrzynkę. Opowiedziałem(-am) w kręgu rady, co się w niej znajdowało.',
                        'Zaprezentowałem(-am) gromadzie ciekawe miejsce lub budowlę znajdującą się w okolicy mojego domu. Uzasadniłem(-am), dlaczego warto je odwiedzić.',
                        'Wiem, gdzie należy zgłaszać odnalezienie skrzynek. Samodzielnie lub z pomocą dorosłego zarejestrowałem(-am) znalezioną skrzynkę.',
                      ]),
                  SprawData(
                      id: 'geoposzukiwacz',
                      title: 'Geoposzukiwacz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) zuchom z mojej gromady, czym jest geocaching oraz GPS.',
                        'Zaprezentowałem(-am) graficznie kodeks geocachera.',
                        'Odnalazłem(-am) trzy skrzynki. Opowiedziałem(-am) w kręgu rady, co się w nich znajdowało.',
                        'Zaprezentowałem(-am) gromadzie trzy ciekawe miejsce lub budowle znajdujące się w okolicy mojego domu. Uzasadniłem(-am), dlaczego warto je odwiedzić.',
                        'Wiem, gdzie należy zgłaszać odnalezienie skrzynek. Samodzielnie zarejestrowałem(-am) znalezioną skrzynkę.',
                      ]),
                  SprawData(
                      id: 'geoposzukiwacz',
                      title: 'Geoposzukiwacz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) zuchom z mojej gromady, czym jest geocaching i GPS oraz jak z niego korzystać.',
                        'Zaprezentowałem(-am) graficznie kodeks geocachera.',
                        'Odnalazłem(-am) trzy skrzynki. Opowiedziałem(-am) w kręgu rady, co się w nich znajdowało.',
                        'Zaprezentowałem(-am) gromadzie trzy ciekawe miejsce lub budowle znajdujące się w okolicy mojego domu. Uzasadniłem(-am), dlaczego warto je odwiedzić.',
                        'Zarejestrowałem(-am) wszystkie odnalezione przez siebie kesze.',
                        'Samodzielnie przygotowałem(-am) skrzynkę. Umieściłem(-am) ją w wybranym miejscu i zarejestrowałem(-am) na stronie internetowej.',
                      ]),
                ]
            ),

// 7. naukowo-hobbystyczna INTERNAUTA
/////////////////////////////////////////////////////
// SUGEROWANE TYLKO DLA ZDOBYWAJĄCYCH 3. GWIAZDKĘ ///
/////////////////////////////////////////////////////
            SprawFamilyData(
                id: '7',
                requirements: [
                  'Dowiedziałem(-am) się, w jaki sposób należy bezpiecznie korzystać z Internetu.',
                  'Sprawdziłem(-am) w Internecie prognozę pogody, rozkład jazdy pociągów lub autobusów.',
                  'Sprawdziłem(-am) w Internecie, jak dostać się w wybrane miejsce.',
                  'Znalazłem(-am) w Internecie film z kategorii „zrób to sam” i przygotowałem(-am) prezent dla bliskiej osoby według instrukcji.',
                  'Znalazłem(-am) w Internecie ciekawostki i przedstawiłem(-am) je na zbiórce.',
                  'Znalazłem(-am) w Internecie przepis i przyrządziłem(-am) posiłek według instrukcji.',
                ],
                notesForLeaders: [
                  'Zuch „Internauta” wie, że Internet to źródło wiedzy, inspiracji i rozrywki. Potrafi znaleźć odpowiedzi na proste pytania. Zna podstawowe zasady netykiety. Wie, jak bezpiecznie korzystać z Internetu.',
                  'Zucha zdobywającego tę sprawność można zaangażować w przygotowanie zbiórki i poprosić o wyszukanie ciekawostek dotyczących jej tematu.',
                  'Wskazując zuchom zadania związanie z działalnością w sieci, należy wziąć pod uwagę obowiązujące przepisy. Nie wolno proponować im zadań niezgodnych z prawem (np. dzieci w wieku zuchowym nie mogą posiadać konta na portalach społecznościowych).',
                  'Rekomendujemy zdobywanie sprawności przez najstarsze zuchy.',
                  'Rekomendujemy, by na wstępie ustalić z rodzicami lub opiekunami, czy zuch może zdobywać sprawność „Internauty”.',
                  'Punkt Prawa Zucha, na który zwracamy szczególną uwagę, realizując sprawność „Internauty”: "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [
///////////////////////// TU USUNĄĆ? ///////////////
                  SprawData(
                      id: 'internauta',
                      title: 'Internauta',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        '',
                      ]),
                  SprawData(
                      id: 'internauta',
                      title: 'Internauta',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        '',

////////////////////////KONIEC USUNIĘCIA //////////
                      ]),
                  SprawData(
                      id: 'internauta',
                      title: 'Internauta',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Sprawdziłem(-am) w Internecie długoterminową prognozę pogody dla mojej miejscowości. Dowiedziałem(-am) się, czy prognozowane są niebezpieczne zjawiska pogodowe.',
                        'Sprawdziłem(-am) w Internecie rozkład jazdy pociągów lub autobusów do miejsca, w którym chciałbym(-am) spędzić wakacje.',
                        'Korzystając z internetowej mapy, znalazłem(-am) w mojej okolicy: lodziarnię, pocztę, posterunek policji i park. Wyznaczyłem(-am) trasę do tych miejsc.',
                        'Znalazłem(-am) w Internecie filmik z instrukcją wykonania ozdoby. Wykonałem(-am) ją według wskazówek i podarowałem(-am) w prezencie bliskiej osobie.',
                        'Znalazłem(-am) w Internecie pięć ciekawostek na ustalony z drużynowym temat. Przedstawiłem(-am) je na zbiórce.',
                        'Znalazłem(-am) w Internecie przepis na ciasto i upiekłem(-am) je zgodnie z instrukcją pod opieką osoby dorosłej.',
                        'Obejrzałem(-am) w Internecie filmik dotyczący interesującego mnie tematu.',
                      ]),
                ]
            ),

// 8. naukowo-hobbystyczna KOLEKCJONER
            SprawFamilyData(
                id: '8',
                requirements: [
                  'Posiadam własną kolekcję.',
                  'Znam historię przedmiotów, które zbieram.',
                  'Dbam o swoje zbiory, utrzymuję swoją kolekcję w porządku.',
                  'Systematycznie wzbogacam swoją kolekcję.',
                  'Zaprezentowałem(-am) swoją kolekcję i opowiedziałem(-am) o niej.',
                  'Wymieniałem(-am) swoje zbiory z innymi hobbystami.',
                  'Wykonałem(-am) opisy do najciekawszych okazów.',
                ],
                notesForLeaders: [
                  'Zbieractwo jest popularną pasją wieku dziecięcego. Zuchy mogą zbierać autografy, etykiety zapałczane, monety, odznaki i znaczki metalowe, magnesy, znaczki pocztowe, widokówki, żołnierzyki, puszki, kapsle i wiele innych rzeczy. Pasje się zmieniają, zuchy mogą więc kilkakrotnie zdobyć tę sprawność.',
                  'Warto zachęcić zucha do poszerzania wiedzy o zbieranych przez niego przedmiotach.',
                  'Należy zwrócić uwagę na to, aby zuch nie kończył zbierania po zdobyciu sprawności.',
                  'Można zorganizować na zbiórce giełdę kolekcjonerską. To doskonała okazja, żeby zuchy zaprezentowały swoje zbiory, opowiedziały o nich innym i wymieniły się posiadanymi okazami.',
                  'Sprawność ma duże znaczenie wychowawcze ― rozbudza, poszerza i pogłębia zainteresowania poznawcze, przyspiesza wrastanie w kulturę, sprzyja powstawaniu zamiłowań, służy wypełnianiu wolnego czasu i uczy cierpliwości.',
                  'Punkt Prawa Zucha, na który zwracamy szczególną uwagę, realizując sprawność „Kolekcjonera”: "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'kolekcjoner',
                      title: 'Kolekcjoner',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) własną kolekcję.',
                        'Pokazałem(-am) moją kolekcję i opowiedziałem(-am) o niej.',
                        'Wybrałem(-am) najciekawszy okaz i opowiedziałem(-am) jego historię.',
                        'Opowiedziałem(-am), jak dbam o moją kolekcję.',
                        'Wzbogaciłem(-am) moją kolekcję o jeden nowy przedmiot.',
                      ]),
                  SprawData(
                      id: 'kolekcjoner',
                      title: 'Kolekcjoner',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) własną kolekcję.',
                        'Pokazałem(-am) moją kolekcję i opowiedziałem(-am) o niej.',
                        'Wybrałem(-am) trzy najciekawsze okazy i opowiedziałem(-am) ich historię.',
                        'Opowiedziałem(-am), jak dbam o moją kolekcję.',
                        'Wzbogaciłem(-am) moją kolekcję o dwa nowe przedmioty.',
                      ]),
                  SprawData(
                      id: 'kolekcjoner',
                      title: 'Kolekcjoner',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zebrałem(-am) własną kolekcję.',
                        'Pokazałem(-am) moją kolekcję i opowiedziałem(-am) o niej.',
                        'Wybrałem(-am) najciekawszy okaz i opracowałem(-am) jego kartę, zawierającą szkic okazu, opis oraz jego historię.',
                        'Opowiedziałem(-am), jak dbam o moją kolekcję.',
                        'Wzbogaciłem(-am) moją kolekcję o trzy nowe przedmioty.',
                        'Wymieniłem(-am) jeden okaz z mojego zbioru z innym hobbystą.',
                      ]),
                ]
            ),

// 9. naukowo-hobbystyczna KRONIKARZ
            SprawFamilyData(
                id: '9',
                requirements: [
                  'Jestem dobrym(-rą) obserwatorem (-rką), prowadzę dziennik (pamiętnik), w którym notuję najważniejsze wydarzenia.',
                  'Znam dzieje baśniowego kronikarza Koszałka-Opałka.',
                  'Zanotowałem(-am) trzy ważne wydarzenia z życia mojej gromady.',
                  'Piszę czysto i czytelnie.',
                  'Opowiedziałem(-am) nowemu zuchowi, koledze lub gościowi o kronice naszej gromady.',
                  'Przez miesiąc systematycznie pomagałem(-am) w prowadzeniu kroniki.',
                  'Wykonałem(-am) ochronną okładkę na kronikę albo przeprowadziłem(-am) renowację kroniki.',
                  'Zaprezentowałem(-am) wykorzystane przez siebie różne techniki pisma i zdobienia.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów, które lubią opisywać i ilustrować wydarzenia, w których uczestniczą.',
                  'Działania zucha „Kronikarza“ można włączyć do pracy gromady. Może on pełnić funkcję pomocnika kronikarza w gromadzie, na biwaku czy kolonii zuchowej.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Kronikarza”: "Zuch stara się być coraz lepszy.", "Zuch pamięta o swoich obowiązkach."',
                ],
                sprawData: [

                  SprawData(
                      id: 'kronikarz',
                      title: 'Kronikarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Prowadzę dziennik (pamiętnik), w którym notuję najważniejsze wydarzenia.',
                        'Znam dzieje baśniowego kronikarza Koszałka-Opałka.',
                        'Zanotowałem(-am) trzy ważne wydarzenia z życia mojej gromady.',
                        'Piszę czysto i czytelnie.',
                      ]),
                  SprawData(
                      id: 'kronikarz',
                      title: 'Kronikarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Prowadzę dziennik (pamiętnik), w którym notuję najważniejsze wydarzenia.',
                        'Opowiedziałem(-am) szóstce o dziejach baśniowego kronikarza Koszałka-Opałka.',
                        'Zanotowałem(-am) trzy ważne wydarzenia z życia mojej gromady.',
                        'Piszę czysto i czytelnie.',
                        'Opowiedziałem(-am) nowemu zuchowi, koledze lub gościowi o kronice naszej gromady.',
                        'Przez miesiąc systematycznie pomagałem(-am) w prowadzeniu kroniki. Samodzielnie wykonałem(-am) jedną stronę do kroniki gromady.',
                      ]),
                  SprawData(
                      id: 'kronikarz',
                      title: 'Kronikarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Prowadzę dziennik (pamiętnik), w którym notuję najważniejsze wydarzenia.',
                        'Opowiedziałem(-am) gromadzie o dziejach baśniowego kronikarza Koszałka-Opałka.',
                        'Piszę czysto i czytelnie.',
                        'Przez miesiąc systematycznie pomagałem(-am) w prowadzeniu kroniki. Samodzielnie wykonałem(-am) dwie strony do kroniki gromady.',
                        'Wykonałem(-am) ochronną okładkę na kronikę albo przeprowadziłem(-am) renowację kroniki.',
                        'Zaprezentowałem(-am) wykorzystane przez siebie różne techniki pisma i zdobienia.',
                      ]),
                ]
            ),

// 10. naukowo-hobbystyczna ŁAMIGŁOWA
            SprawFamilyData(
                id: '10',
                requirements: [
                  'Lubię rozwiązywać krzyżówki i łamigłówki. Rozwiązałem(-am) różne rodzaje łamigłówek (rebusy, szarady).',
                  'Potrafię odnaleźć w słowniku lub encyklopedii słowa potrzebne do rozwiązania krzyżówki.',
                  'Ułożyłem(-am) kilka łamigłówek.',
                  'Przedstawiłem(-am) propozycje swoich zagadek zuchom w gromadzie.',
                  'Wziąłem(wzięłam) udział w konkursie zagadek.',
                  'Zorganizowałem(-am) konkurs zagadek.',
                ],
                notesForLeaders: [
                  'Sprawność ćwiczy pamięć, uwagę i spostrzegawczość oraz wzbogaca słownictwo. Pomaga w poszerzaniu i utrwalaniu wiadomości z różnych dziedzin. Rozwija umiejętność logicznego kojarzenia i wnioskowania.',
                  'Sprawność jest przeznaczona dla zuchów, które lubią rozwiązywać i tworzyć łamigłówki.',
                  'Zuch zdobywający sprawność „Łamigłowy” może przygotować na zbiórkę gromady zagadki na zadany temat, opracować prostą krzyżówkę lub przygotować łamigłówki do zuchowej gazetki.',
                  'Punkt Prawa Zucha, który podkreślamy, realizując sprawność „Łamigłowy”: "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'lamiglowa',
                      title: 'Łamigłowa',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozwiązałem(-am) krzyżówkę, rebus i ułożyłem(-am) puzzle.',
                        'Znalazłem(-am) w encyklopedii lub słowniku słowo potrzebne do rozwiązania krzyżówki.',
                        'Ułożyłem(-am) rebus i pokazałem(-am) go na zbiórce.',
                        'Ułożyłem(-am) dwie zagadki i pokazałem(-am) je na zbiórce.',
                      ]),
                  SprawData(
                      id: 'lamiglowa',
                      title: 'Łamigłowa',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozwiązałem(-am) krzyżówkę, labirynt, rebus, odszyfrowałem(-am) wiadomość, ułożyłem(-am) puzzle.',
                        'Znalazłem(-am) w encyklopedii lub słowniku słowo potrzebne do rozwiązania krzyżówki.',
                        'Ułożyłem(-am) krzyżówkę i pokazałem(-am) ją na zbiórce.',
                        'Ułożyłem(-am) dwie zagadki i pokazałem(-am) je na zbiórce.',
                        'Wziąłem(wzięłam) udział w konkursie zagadek.',
                      ]),
                  SprawData(
                      id: 'lamiglowa',
                      title: 'Łamigłowa',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozwiązałem(-am) krzyżówkę, sudoku, labirynt, rebus, odszyfrowałem(-am) wiadomość, ułożyłem(-am) puzzle.',
                        'Znalazłem(-am) w encyklopedii lub słowniku słowo potrzebne do rozwiązania krzyżówki.',
                        'Ułożyłem(-am) krzyżówkę i pokazałem(-am) ją na zbiórce.',
                        'Ułożyłem(-am) trzy zagadki i pokazałem(-am) je na zbiórce.',
                        'Przeprowadziłem(-am) konkurs zagadek.',
                      ]),
                ]
            ),

// 11. naukowo-hobbystyczna MIŁOŚNIK FILMU
            SprawFamilyData(
                id: '11',
                requirements: [
                  'Lubię oglądać filmy. Wiem, jak powstaje film, czym zajmuje się reżyser, operator kamery i scenograf.',
                  'Wykonałem(-am) album zawierający zdjęcia ulubionych aktorów.',
                  'Opowiedziałem(-am) o ulubionym filmie. Znam nazwiska występujących w nim aktorów.',
                  'Wiem, jakie nagrody przyznaje się twórcom filmowym.',
                  'Właściwie zachowuję się w kinie.',
                  'Oglądam filmy przeznaczone dla dzieci. Mam wśród nich swoje ulubione i potrafię uzasadnić, dlaczego zasługują one na wyróżnienie.',
                  'Zaprojektowałem(-am) i wykonałem(-am) plakat do mojego ulubionego filmu.',
                  'Rozpoznałem(-am) różne gatunki filmów: przyrodnicze, historyczne, komedie itp.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów zainteresowanych kinem. Warto zachęcać je do wybierania ciekawych i wartościowych filmów oraz rekomendowania ich innym dzieciom.',
                  'Zdobywanie sprawności „Miłośnika filmu” to doskonała okazja, by zwrócić uwagę na postawy bohaterów filmowych, odnosząc je do zachowania zuchów.',
                  'Zuchy zdobywające sprawność powinny wiedzieć, że długie przebywanie przed telewizorem przynosi skutki niekorzystne dla zdrowia.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Miłośnika filmu”: "Zuch pamięta o swoich obowiązkach.", "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'milosnik_filmu',
                      title: 'Miłośnik filmu',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, jakie zadania przy powstawaniu filmu mają reżyser, operator kamery i scenograf. Opowiedziałem(-am) o tym zuchom z mojej szóstki.',
                        'Mam swojego ulubionego aktora. Opowiedziałem(-am) o nim zuchom lub kolegom z klasy.',
                        'Zaprezentowałem(-am) w kręgu rady własnoręcznie wykonany plakat do mojego ulubionego filmu. Opowiedziałem(-am) krótko, o czym jest ten film.',
                        'Wiem, jak należy zachować się w kinie. Zaprezentowałem(-am) to zuchom z mojej szóstki.',
                        'Znam przynajmniej dwa gatunki filmowe. Opowiedziałem(-am) zuchom, czym się charakteryzują.',
                      ]),
                  SprawData(
                      id: 'milosnik_filmu',
                      title: 'Miłośnik filmu',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, jakie zadania przy powstawaniu filmu mają reżyser, operator kamery, scenograf i kostiumolog. Opowiedziałem(-am) o tym zuchom w kręgu rady.',
                        'Wykonałem(-am) album prezentujący zdjęcia mojego ulubionego aktora. Pokazałem(-am) go gromadzie.',
                        'Zaprezentowałem(-am) w kręgu rady własnoręcznie wykonany plakat do mojego ulubionego filmu. Opowiedziałem(-am) o filmie i wymieniłem(-am) nazwiska aktorów grających w nim główne role.',
                        'Wiem, jak należy zachować się w kinie. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Znam przynajmniej trzy gatunki filmowe. Opowiedziałem(-am) zuchom, czym się charakteryzują. Podałem(-am) po jednym przykładzie filmu z każdego gatunku.',
                        'Uczestniczyłem(-am) w dyskusji na temat wybranego filmu.',
                      ]),
                  SprawData(
                      id: 'milosnik_filmu',
                      title: 'Miłośnik filmu',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, jakie zadania przy powstawaniu filmu mają reżyser, operator kamery, scenograf, kostiumolog i charakteryzator. Opowiedziałem(-am) o tym zuchom w kręgu rady.',
                        'Wykonałem(-am) album prezentujący zdjęcia moich ulubionych aktorów. Pokazałem(-am) go gromadzie.',
                        'Zaprezentowałem(-am) w kręgu rady własnoręcznie wykonany plakat do mojego ulubionego filmu. Opowiedziałem(-am) o filmie i wyjaśniłem(-am), dlaczego go szczególnie lubię. Wymieniłem(-am) nazwiska aktorów grających w nim główne role.',
                        'Wiem, jak należy zachować się w kinie. Wyjaśniłem(-am) to innym zuchom w kręgurady.',
                        'Znam przynajmniej pięć gatunków filmowych. Wyjaśniłem(-am) zuchom, czym sięcharakteryzują. Podałem(-am) po jednym przykładzie filmu z każdego gatunku.',
                        'Przedstawiłem(-am) w gromadzie wybraną nagrodę filmową. Opowiedziałem(-am), za co się ją przyznaje.',
                        'Przeprowadziłem(-am) w szóstce dyskusję na temat wybranego filmu.',
                      ]),
                ]
            ),

// 12. naukowo-hobbystyczna MIŁOŚNIK SZTUK PIĘKNYCH
            SprawFamilyData(
                id: '12',
                requirements: [
                  'Interesuję się malarstwem, rzeźbą lub inną dziedziną sztuk plastycznych.',
                  'Byłem(-am) w kilku muzeach lub galeriach sztuki. Zbieram przewodniki po wystawach (katalogi).',
                  'Oglądałem(-am) albumy o sztuce. Jeden z nich pokazałem na zbiórce gromady.',
                  'Opowiedziałem(-am) kolegom o swoim ulubionym dziele lub twórcy.',
                  'Zbieram wiadomości o interesujących mnie dziełach sztuki.',
                  'Znalazłem(-am) w czasopiśmie dla dzieci artykuł o malarzu, rzeźbiarzu, wystawie itp. Opowiedziałem(-am) o nim kolegom.',
                  'Namalowałem(-am) kopię mojego ulubionego obrazu lub wykonałem(-am) replikę ulubionej rzeźby.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów zainteresowanych plastyką (malarstwem, rzeźbą) i posiadających pewną wiedzę „teoretyczną” z tej dziedziny.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu inne sprawności plastyczne, np. „Dekoratora”, „Rzeźbiarza” i „Plastyka”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Miłośnika sztuk pięknych”: "Zuch stara się być coraz lepszy., "Wszystkim jest z zuchem dobrze."',
                ],
                sprawData: [

                  SprawData(
                      id: 'milosnik_sztuk_pieknych',
                      title: 'Miłośnik sztuk pięknych',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Odwiedziłem(-am) muzeum lub galerię sztuki.',
                        'Opowiedziałem(-am) szóstce o moim ulubionym dziele lub twórcy.',
                        'Namalowałem(-am) kopię mojego ulubionego obrazu lub wykonałem(-am) replikę ulubionej rzeźby.',
                        'Obejrzałem(-am) album o sztuce. Pokazałem(-am) go kolegom na zbiórce.',
                      ]),
                  SprawData(
                      id: 'milosnik_sztuk_pieknych',
                      title: 'Miłośnik sztuk pięknych',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) w muzeum lub galerii sztuki. Przyniosłem(-am) przewodnik po wystawie, który pokazałem(-am) innym zuchom.',
                        'Opowiedziałem(-am) kolegom o moim ulubionym dziele lub twórcy.',
                        'Zebrałem(-am) informacje o interesującym mnie dziele sztuki. Zaprezentowałem(-am) je drużynowemu lub nauczycielowi.',
                        'Namalowałem(-am) kopię ulubionego obrazu lub wykonałem(-am) replikę ulubionej rzeźby.',
                        'Obejrzałem(-am) album o sztuce. Pokazałem(-am) na zbiórce gromady obraz lub rzeźbę, która najbardziej mi się spodobała.',
                      ]),
                  SprawData(
                      id: 'milosnik_sztuk_pieknych',
                      title: 'Miłośnik sztuk pięknych',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Byłem(-am) w kilku muzeach lub galeriach sztuki. Zbieram przewodniki po wystawach (katalogi).',
                        'Obejrzałem(-am) album o sztuce. Pokazałem(-am) kolegom na zbiórce obraz lub rzeźbę, która najbardziej mi się spodobała. Uzasadniłem(-am), dlaczego wybrałem(-am) to dzieło.',
                        'Zebrałem(-am) informacje na temat interesującego mnie dzieła sztuki. Zaprezentowałem(-am) je drużynowemu lub nauczycielowi.',
                        'Znalazłem(-am) w czasopiśmie dla dzieci artykuł o malarzu, rzeźbiarzu, wystawie itp. Opowiedziałem(-am) o nim kolegom.',
                        'Namalowałem(-am) kopię ulubionego obrazu lub wykonałem(-am) replikę ulubionej rzeźby.',
                      ]),
                ]
            ),

// 13. naukowo-hobbystyczna MISTRZ GIER PLANSZOWYCH
            SprawFamilyData(
                id: '13',
                requirements: [
                  'Znam reguły przynajmniej pięciu gier planszowych.',
                  'Mam ulubioną grę, nauczyłem(-am) grać w nią inne dzieci.',
                  'Znam dawne gry.',
                  'Wymyśliłem(-am) własną grę. Ułożyłem(-am) jej reguły, wykonałem(-am) planszę i potrzebne rekwizyty.',
                  'Dbam o swoje gry. Naprawiłem(-am) lub uzupełniłem(-am) braki w grze planszowej.',
                  'W trakcie gry przestrzegam obowiązujących zasad.',
                  'Zorganizowałem(-am) turniej gier planszowych.',
                ],
                notesForLeaders: [
                  'Podczas zdobywania sprawności zuch uczy się twórczego myślenia, wygrywania i przegrywania. Rozwija swoją umiejętność pracy w grupie i uczy się dbać o swoje rzeczy.',
                  'Aby dalej rozwijać zainteresowania zucha, można mu wskazać sprawność „Łamigłowy”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Mistrza gier planszowych”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze."',
                ],
                sprawData: [

                  SprawData(
                      id: 'mistrz_gier_planszowych',
                      title: 'Mistrz gier planszowych',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własne trzy ulubione gry planszowe. Zaprezentowałem(-am) szóstce ich zasady.',
                        'Nauczyłem(-am) kolegów grać w moją ulubioną grę planszową.',
                        'Wymyśliłem(-am) własną grę karcianą.',
                        'Naprawiłem(-am) jedną grę z biblioteczki gromady.',
                        'Wraz z drużynowym zorganizowałem(-am) wystawę gier planszowych.',
                      ]),
                  SprawData(
                      id: 'mistrz_gier_planszowych',
                      title: 'Mistrz gier planszowych',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam własne trzy ulubione gry planszowe. Zaprezentowałem(-am) ich zasady i zagrałem(-am) ze swoją szóstką.',
                        'Nauczyłem(-am) kolegów grać w moją ulubioną grę planszową.',
                        'Wymyśliłem(-am) własną grę karcianą.',
                        'Naprawiłem(-am) jedną grę z biblioteczki gromady.',
                        'Zorganizowałem(-am) turniej gier planszowych w gromadzie.',
                      ]),
                  SprawData(
                      id: 'mistrz_gier_planszowych',
                      title: 'Mistrz gier planszowych',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Mam półkę z grami planszowymi. Zagrałem(-am) z kolegami w co najmniej pięć z nich.',
                        'Przez miesiąc przynajmniej raz w tygodniu grałem(-am) z rodzicami w gry planszowe.',
                        'Nauczyłem(-am) młodsze zuchy grać w moją ulubioną grę.',
                        'Wykonałem(-am) według własnego pomysłu grę planszową o naszej gromadzie.',
                        'Zorganizowałem(-am) zbiórkę używanych gier planszowych. Naprawiłem(-am) je i oddałem(-am) potrzebującym.',
                        'Zorganizowałem(-am) turniej gier planszowych w gromadzie.',
                      ]),
                ]
            ),

// 14. naukowo-hobbystyczna POLIGLOTA
            SprawFamilyData(
                id: '14',
                requirements: [
                  'Interesuję się językami obcymi. Uczę się jednego z nich.',
                  'Poprawnie mówię po polsku.',
                  'Potrafię w trzech językach powiedzieć dziesięć słów mających to samo znaczenie.',
                  'Prowadzę własny słowniczek.',
                  'Potrafię powiedzieć wiersz lub zaśpiewać piosenkę w innym języku.',
                  'Koresponduję z osobą z zagranicy.',
                  'Wydałem(-am) w kilku egzemplarzach i rozprowadziłem(-am) wśród znajomych „Mini słownik grzeczności” własnego pomysłu w jednym lub kilku obcych językach.',
                  'Przetłumaczyłem(-am) na język polski kilka obcojęzycznych etykietek różnych produktów.',
                  'Każdemu zuchowi z gromady (o ile to możliwe) podałem(-am) odpowiednik jego imienia w języku, którego się uczę.',
                  'Mówię „dzień dobry” i „do widzenia” w języku każdego z krajów sąsiadujących z Polską.',
                ],
                notesForLeaders: [
                  'Zuch „Poliglota” chętnie uczy się języków obcych. Chce poznać inne kraje, kultury i narodowości.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Poligloty”: "Zuch pamięta o swoich obowiązkach.", "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'poliglota',
                      title: 'Poliglota',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Nauczyłem(-am) się wybranego wiersza w innym języku. Wyrecytowałem(-am) go w kręgu rady.',
                        'Nauczyłem(-am) gromadę mówić „dzień dobry” i „do widzenia” w dwóch językach innych niż język polski.',
                        'Wykonałem(-am) plakat prezentujący moje ulubione państwo i jego język.',
                        'Zrobiłem(-am) słowniczek z wyrazami niezbędnymi do porozumiewania się w dowolnym języku obcym',
                      ]),
                  SprawData(
                      id: 'poliglota',
                      title: 'Poliglota',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Nauczyłem(-am) się wybranego wiersza w innym języku. Wyrecytowałem(-am) go w kręgu rady.',
                        'Mam swoją ulubioną piosenkę w języku obcym. Zaśpiewałem(-am) ją kadrze gromady.',
                        'Zrobiłem(-am) tabelkę z pięcioma słowami, które potrafię powiedzieć i zapisać w trzech różnych językach.',
                        'Zrobiłem(-am) słowniczek ze słowami niezbędnymi do porozumiewania się w dowolnym języku obcym.',
                        'Każdemu zuchowi z gromady (o ile to możliwe) podałem(-am) w kręgu rady odpowiednik jego imienia w języku, którego się uczę.',
                        'Przetłumaczyłem(-am) na język polski kilka obcojęzycznych etykietek różnych produktów.',
                      ]),
                  SprawData(
                      id: 'poliglota',
                      title: 'Poliglota',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Nauczyłem(-am) się wybranego wiersza w innym języku. Wyrecytowałem(-am) go w kręgu rady.',
                        'Koresponduję z kolegą z innego kraju. Narysowałem(-am), jak wyobrażam sobie jego/jej miejsce zamieszkania itp.',
                        'Nauczyłem(-am) gromadę pląsu po angielsku.',
                        'Zrobiłem(-am) tabelkę z dziesięcioma słowami, które potrafię mówić i pisać w trzech różnych językach.',
                        'Mam swoją ulubioną piosenkę w języku obcym. Zaśpiewałem(-am) ją kadrze gromady.',
                        'Przetłumaczyłem(-am) na język polski kilka obcojęzycznych etykietek różnych produktów.',
                      ]),
                ]
            ),

// 15. naukowo-hobbystyczna PRZEWODNIK PO...
            SprawFamilyData(
                id: '15',
                requirements: [
                  'Opowiedziałem(-am) podanie, historię lub legendę związaną z moją miejscowością.',
                  'Znam najciekawsze obiekty w mojej miejscowości. Potrafię wskazać do nich drogę.',
                  'Wiem, gdzie jest najbliższy przystanek, apteka, poczta, straż pożarna, przychodnia (szpital), siedziba władz miasta, dzielnicy lub gminy.',
                  'Umiem dojść lub dojechać do określonego miejsca w mojej miejscowości.',
                  'Oprowadziłem(-am) wycieczkę lub gościa po mojej miejscowości.',
                  'Wykonałem(-am) prosty plan mojej miejscowości.',
                  'Prowadziłem(-am) dla zuchów z gromady punkt informacji turystycznej o mojej miejscowości.',
                  'Zaplanowałem(-am) trasy wycieczek po mojej miejscowości.',
                  'Mam w swojej kolekcji mapę, zdjęcia oraz foldery dotyczące mojej miejscowości. Przeczytałem(-am) o niej w przewodniku.',
                  'Przestrzegam przepisów poruszania się po drogach.',
                  'Umiem opowiadać jak przewodnik, dobierając informacje oraz język do zainteresowań i poziomu uczestników wycieczki.',
                ],
                notesForLeaders: [
                  'Zuch „Przewodnik po…” ma obszerną wiedzę na wiele tematów. Interesuje się podróżami i zwiedzaniem ciekawych miejsc. Lubi przygody. Łatwo nawiązuje kontakty z innymi ludźmi. Nie boi się mówić do wielu słuchaczy.',
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu sprawność „Geoposzukiwacza”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Przewodnika po…”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze."',
                ],
                sprawData: [

                  SprawData(
                      id: 'przewodnik_po',
                      title: 'Przewodnik po...',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) na zbiórce podanie, historię lub legendę związaną z moją miejscowością.',
                        'Narysowałem(-am) najciekawszy budynek znajdujący się w mojej miejscowości.',
                        'Wykonałem(-am) prosty plan okolicy. Zaznaczyłem(-am) na nim najbliższy przystanek, aptekę, pocztę, straż pożarną, przychodnię (szpital), siedzibę władz miasta, dzielnicy lub gminy.',
                        'Zaplanowałem(-am) trasę niedzielnego spaceru z rodzicami po okolicy.',
                        'Rozpocząłem(-am) zbieranie pocztówek, magnesów lub pamiątek związanych z moją miejscowością.',
                      ]),
                  SprawData(
                      id: 'przewodnik_po',
                      title: 'Przewodnik po...',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) na zbiórce podanie, historię lub legendę związaną z moją miejscowością.',
                        'Znam najciekawsze obiekty w okolicy i potrafię wskazać do nich drogę.',
                        'Wykonałem(-am) prosty plan okolicy. Zaznaczyłem(-am) na nim najbliższy przystanek, aptekę, pocztę, straż pożarną, przychodnię (szpital), siedzibę władz miasta, dzielnicy lub gminy.',
                        'Oprowadziłem(-am) rodzinę z innego miasta po mojej okolicy. Opowiadałem(-am) jak przewodnik, dobierając informacje i język do zainteresowań oraz poziomu uczestników wycieczki.',
                        'Zrobiłem(-am) mały przewodnik turystyczny dla zuchów z mojej szóstki.',
                        'Mam w swojej kolekcji mapę, zdjęcia oraz foldery dotyczące mojej miejscowości. Przeczytałem(-am) o niej w przewodniku.',
                        'Zrobiłem(-am) prezentacje na zbiórce, podczas której opowiedziałem(-am), jak należy zachowywać się na drodze. Pokazałem(-am) również, jak wykonać odblask i gdzie należy go nosić.',
                      ]),
                  SprawData(
                      id: 'przewodnik_po',
                      title: 'Przewodnik po...',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) na zbiórce podanie, historię lub legendę związaną z moją miejscowością.',
                        'Znam najciekawsze obiekty w okolicy. Potrafię wskazać do nich drogę.',
                        'Wykonałem(-am) prosty plan okolicy. Wiem, gdzie jest najbliższy przystanek, apteka, poczta, straż pożarna, przychodnia (szpital), siedziba władz miasta, dzielnicy lub gminy.',
                        'Spotkałem(-am) się z przyjacielem w wybranym przez niego miejscu w naszej okolicy. Uzgodniłem(-am) z rodzicami wyjście z domu i samodzielnie do niego dotarłem(-am).',
                        'Oprowadziłem(-am) rodzinę z innego miasta po okolicy, opowiadałem(-am) jak przewodnik, dobierając informacje i język do zainteresowań i poziomu uczestników wycieczki.',
                        'Zrobiłem(-am) mały przewodnik turystyczny dla zuchów z gromady.',
                        'Zaplanowałem(-am) trasę wycieczki dla gromady.',
                        'Mam w swojej kolekcji mapę, zdjęcia oraz foldery dotyczące mojej miejscowości. Przeczytałem(-am) o niej w przewodniku.',
                        'Zrobiłem(-am) filmik, w którym opowiadam, jak należy zachowywać się na drodze. Pokazałem(-am) w nim, jak wykonać odblask i gdzie należy go nosić.',
                      ]),
                ]
            ),

// 16. naukowo-hobbystyczna PRZYJACIEL KSIĄŻEK
            SprawFamilyData(
                id: '16',
                requirements: [
                  'Lubię czytać książki. Potrafię wymienić autorów moich ulubionych książek.',
                  'Mam kartę w bibliotece.',
                  'Mam biblioteczkę domową, dbam o nią i staram się ją powiększać.',
                  'Pomagałem(-am) w szkolnej bibliotece lub prowadziłem(-am) bibliotekę na kolonii zuchowej.',
                  'Naprawiałem(-am) drobne uszkodzenia książek. Wykonałem(-am) zakładkę do książek.',
                  'Uczestniczyłem(-am) w konkursie czytelniczym.',
                  'Mam swojego ulubionego bohatera książkowego. Opowiedziałem(-am) o nim kolegom. Zachęciłem(-am) do przeczytania jego przygód.',
                  'Obejrzałem(-am) film na motywach znanej mi książki. Wskazałem(-am) różnice między książką i filmem oraz wady i zalety adaptacji filmowej.',
                ],
                notesForLeaders: [
                  'Zdobywając sprawność „Przyjaciela książek”, zuch poszerza wiedzę o świecie, rozwija wyobraźnię, kształci mowę i doskonali technikę czytania. Uczy się operowania słowem i budowania zdań.',
                  '„Przyjaciel książek” chętnie pomaga w bibliotece, dlatego ważne jest, aby kadra drużyny nawiązała kontakt z bibliotekarzem w szkole.',
                  'Zuch zdobywający sprawność może prezentować ulubionych bohaterów w różnej formie, np. w gawędzie, teatrze zuchowym lub pracy plastycznej.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, zdobywając sprawność „Przyjaciela książki”: "Zuch pamięta o swoich obowiązkach.", "Wszystkim jest z zuchem dobrze.", "Zuch stara się być coraz lepszy."',
                ],
                sprawData: [

                  SprawData(
                      id: 'przyjaciel_ksiazek',
                      title: 'Przyjaciel książek',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) kartę w bibliotece.',
                        'Przeczytałem(-am) trzy książki.',
                        'Opowiedziałem(-am) na zbiórce o przygodach mojego ulubionego książkowego bohatera.',
                        'Wykonałem(-am) zakładkę do książki.',
                        'Uporządkowałem(-am) książki w mojej domowej biblioteczce.',
                        'Obejrzałem(-am) film na motywach znanej mi książki.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_ksiazek',
                      title: 'Przyjaciel książek',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) kartę w bibliotece.',
                        'Przeczytałem(-am) pięć książek.',
                        'Opowiedziałem(-am) na zbiórce o mojej ulubionej książce i jej autorze.',
                        'Zaprojektowałem(-am) okładkę książki. Dokonałem(-am) drobnej naprawy książki.',
                        'Uporządkowałem(-am) książki w mojej domowej biblioteczce. Zrobiłem(-am) listę książek, które chciał(a)bym pozyskać do mojej kolekcji.',
                        'Obejrzałem(-am) film na motywach znanej mi książki. Opowiedziałem(-am) o książce i filmie na zbiórce.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_ksiazek',
                      title: 'Przyjaciel książek',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Założyłem(-am) kartę w bibliotece.',
                        'Przeczytałem(-am) siedem książek.',
                        'Opowiedziałem(-am) na zbiórce o dwóch ulubionych książkach i ich autorach.',
                        'Pomagałem(-am) w szkolnej bibliotece lub prowadziłem(-am) bibliotekę na kolonii zuchowej.',
                        'Uporządkowałem(-am) książki w mojej domowej biblioteczce. Zrobiłem(-am) listę książek, które chciał(a)bym pozyskać do mojej kolekcji.',
                        'Obejrzałem(-am) film na motywach znanej mi książki, opowiedziałem(-am) o niej na zbiórce.',
                        'Odwiedziłem(-am) antykwariat lub osobę posiadającą stary księgozbiór.',
                      ]),
                ]
            ),
          ]),

      SprawGroupData(
          id: 'spoleczno_obywatelskie',
          title: 'Społeczno-obywatelskie',
          tags: ['#ojczyzna', '#służba', '#empatia', '#praca nad sobą', '#umiejętność życia w społeczeństwie', '#mała ojczyzna'],
          familyData: [

            SprawFamilyData(
                id: '1',
                requirements: [
                  'Opowiedziałem(-am) bajkę młodszym dzieciom.',
                  'Opiekowałem(-am) się młodszymi dziećmi.',
                  'Stworzyłem(-am) zbiór gier i zabaw. Zgromadziłem(-am) w nim gry, ćwiczenia, zabawy i pląsy, które zaproponowałem(-am) młodszym dzieciom.',
                  'Nauczyłem(-am) pląsu młodsze rodzeństwo lub dzieci, którymi się opiekuję.',
                  'Zorganizowałem(-am) na podwórku zabawę dla młodszych dzieci. Naprawiłem(-am) zepsute zabawki.',
                  'Naprawiłem(-am) zepsute zabawki.',
                  'Wykonałem(-am) zabawkę (puzzle, kukiełkę).',
                  'Udzieliłem(-am) pierwszej pomocy przy skaleczeniu.',
                  'Ubrałem(-am) i uczesałem(-am) młodsze dziecko.',
                  'Opiekowałem(-am) się osobą chorą lub starszą.',
                ],
                notesForLeaders: [
                  'Sprawność uczy zucha pomocy i wrażliwości na innych. Dzięki realizowanym zadaniom zuch może poczuć się ważny i potrzebny.',
                  'Zuch zdobywający sprawność systematycznie zajmuje się młodszym rodzeństwem lub inną osobą potrzebującą opieki.',
                  'Zadania należy dobrać w taki sposób, aby były dla zucha czymś więcej niż codziennym obowiązkiem nałożonym przez rodziców.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Dobrego opiekuna”: „Wszystkim jest z zuchem dobrze.”, „Zuch stara się być coraz lepszy.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'dobry_opiekun',
                      title: 'Dobry opiekun',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Nauczyłem(-am) pląsu młodsze rodzeństwo lub dzieci, którymi się opiekuję.',
                        'Zorganizowałem(-am) na podwórku zabawę dla młodszych dzieci.',
                        'Naprawiłem(-am) zepsutą zabawkę.',
                        'Opiekowałem(-am) się młodszymi dziećmi.',
                      ]),
                  SprawData(
                      id: 'dobry_opiekun',
                      title: 'Dobry opiekun',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) bajkę młodszym dzieciom.',
                        'Stworzyłem(-am) zbiór gier i zabaw. Zgromadziłem(-am) w nim gry, ćwiczenia, zabawy i pląsy, które zaproponowałem(-am) młodszym dzieciom.',
                        'Wykonałem(-am) zabawkę (puzzle, kukiełkę).',
                        'Udzieliłem(-am) pierwszej pomocy przy skaleczeniu.',
                        'Opiekowałem(-am) się młodszymi dziećmi.',
                        'Pełniłem(-am) rolę opiekuna młodszego zucha na wyjeździe z gromadą.',
                      ]),
                  SprawData(
                      id: 'dobry_opiekun',
                      title: 'Dobry opiekun',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-am) bajkę młodszym dzieciom.',
                        'Stworzyłem(-am) zbiór gier i zabaw. Zgromadziłem(-am) w nim gry, ćwiczenia, zabawy i pląsy, które zaproponowałem(-am) młodszym dzieciom.',
                        'Opiekowałem(-am) się młodszymi dziećmi.',
                        'Udzieliłem(-am) pierwszej pomocy przy skaleczeniu.',
                        'Ubrałem(-am) i uczesałem(-am) młodsze dziecko.',
                        'Opiekowałem(-am) się osobą chorą lub starszą.',
                        'Pełniłem(-am) rolę opiekuna młodszego zucha na wyjeździe z gromadą.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '2',
                requirements: [
                  'Znam pięć kolęd. Umiem je zaśpiewać.',
                  'Wiem, co symbolizują kolędy.',
                  'Brałem(-am) udział w jasełkach.',
                  'Potrafię powiedzieć, jakie postacie są prezentowane przez kolędników i dlaczego. Samodzielnie lub z pomocą rodzica przygotowałem(-am) sobie strój kolędnika.',
                  'Zaprezentowałem(-am) swój strój i kolędę na zbiórce wigilijnej.',
                  'W okresie świątecznym razem z kolegami chodziłem(-am) i kolędowałem(-am), niosąc radość ludziom w mojej okolicy.',
                  'Wiem, jak dawniej wyglądało kolędowanie na terenach, na których mieszkam. Dowiedziałem(-am) się, jakie panowały wtedy obrzędy i zwyczaje świąteczne.',
                  'Nauczyłem(-am) inne zuchy przynajmniej jednej kolędy.',
                  'Mam śpiewnik lub nagrania z kolędami.',
                ],
                notesForLeaders: [
                  'Sprawność wpływa na rozwój duchowy dzieci, a także pomaga poznać zwyczaje i obrzędy staropolskie.',
                  'Mimo że „Kolędnik” to sprawność indywidualna, zuchy mogą zdobywać ją w grupach, najlepiej w szóstkach - w ten sposób łatwiej im będzie przygotować przedstawienie. Przy zdobywaniu sprawności zuchom potrzebna jest znaczna pomoc kadry gromady.',
                  'Należy zwrócić szczególną uwagę na bezpieczeństwo zuchów podczas kolędowania, dlatego najlepiej odwiedzać rodziny zuchów i przyjaciół gromady, poruszając się w okolicy, którą dzieci dobrze znają.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Kolędnika”: „Zuch kocha Boga i Polskę”, „Wszystkim jest z zuchem dobrze.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'kolednik',
                      title: 'Kolędnik',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Potrafię zaśpiewać trzy kolędy. Zapisałem(-am) ich tytuły.',
                        'Brałem(-am) udział w jasełkach.',
                        'Brałem(-am) udział w kolędowaniu np. na zbiórce wigilijnej gromady lub w szkole.',
                        'Narysowałem(-am) postacie trzech kolędników. Podpisałem(-am), jak się nazywają.',
                        'Mam swój śpiewnik lub nagrania z kolędami. Zaprezentowałem(-am) go/je na zbiórce.',
                      ]),
                  SprawData(
                      id: 'kolednik',
                      title: 'Kolędnik',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Potrafię zaśpiewać pięć kolęd. Zapisałem(-am) ich tytuły.',
                        'Brałem(-am) udział w jasełkach.',
                        'W okresie świątecznym wspólnie z kolegami chodziłem(-am) i kolędowałem(-am), niosąc radość ludziom w mojej okolicy.',
                        'Narysowałem(-am) postacie pięciu kolędników. Podpisałem(-am), jak się nazywają.',
                        'Mam swój śpiewnik lub nagrania z kolędami. Zaprezentowałem(-am) go/je na zbiórce.',
                      ]),
                  SprawData(
                      id: 'kolednik',
                      title: 'Kolędnik',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Potrafię zaśpiewać pięć kolęd. Nauczyłem(-am) jednej kolędy młodsze zuchy.',
                        'Brałem(-am) udział w jasełkach.',
                        'Opowiedziałem(-am) młodszym zuchom, jak w dawnych czasach wyglądała tradycja kolędowania.',
                        'Samodzielnie lub z pomocą rodzica przygotowałem(-am) sobie strój kolędnika. Zaprezentowałem(-am) go na zbiórce.',
                        'W okresie świątecznym wspólnie z kolegami chodziłem(-am) i kolędowałem(-am), niosąc radość ludziom w mojej okolicy.',
                        'Mam swój śpiewnik lub nagrania z kolędami. Zaprezentowałem(-am) go/je na zbiórce.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                requirements: [
                  'Znam symbole narodowe i hymn Polski.',
                  'Wiem, gdzie znajduje się urząd miasta lub gminy. Byłem(-am) w nim.',
                  'Z gromadą lub rodziną brałem(-am) udział w obchodach świąt państwowych.',
                  'Wiem, jak powinien zachowywać się współczesny patriota.',
                  'Znam dokonania sławnych Polaków.',
                  'Wiem, gdzie w mojej okolicy znajdują się miejsca upamiętniające zasłużone postaci lub ważne wydarzenia.',
                  'Pomagam w pożytecznych pracach na rzecz mojej wsi, miasta lub dzielnicy.',
                ],
                notesForLeaders: [
                  'Zdobywając tę sprawność, zuch poznaje swoje środowisko, uczy się dostrzegać problemy rówieśników i wspólnoty lokalnej, a także poszukiwać pokojowych i nowoczesnych rozwiązań. Staje się świadomym i aktywnym uczestnikiem oraz kreatorem życia codziennego w XXI wieku.',
                  'Kadra gromady powinna zwrócić uwagę na fakt, że współczesny patriota to człowiek otwarty, tolerancyjny, dbający o środowisko i język ojczysty, znający historię i kultywujący tradycje. Patriota szanuje swoją małą ojczyznę - rodzinę, nauczycieli, kolegów oraz miejscowość, w której mieszka. Tworzy świat oparty na podstawowych wartościach: wolności, samorządności i demokracji.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Młodego patrioty”: „Zuch pamięta o swoich obowiązkach.”, „Wszystkim jest z zuchem dobrze.”, „Zuch kocha Polskę i czyni dobro.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'mlody_patriota',
                      title: 'Młody Patriota',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Narysowałem(-am) flagę i godło Polski. Przedstawiłem(-am) je w kręgu rady.',
                        'Razem z rodzicami wywiesiliśmy flagę na święto państwowe. Zdjęciem wywieszonej flagi pochwaliłem(-am) się w kręgu rady.',
                        'Narysowałem(-am) plakat przedstawiający zasłużonego Polaka. Pokazałem(-am) plakat w kręgu rady.',
                        'Wraz z członkiem rodziny odszukałem(-am) w Internecie ważne historyczne miejsca w okolicy. Wspólnie je zwiedziliśmy. Narysowałem(-am) pocztówkę z tej przygody i zaprezentowałem(-am) ją w kręgu rady.',
                        'Podjąłem (Podjęłam) wyzwanie „wiecznego worka” - w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-am) worek znalezionymi śmieciami, dbając o czyste środowisko.',
                      ]),
                  SprawData(
                      id: 'mlody_patriota',
                      title: 'Młody Patriota',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'W kręgu rady opowiedziałem(-am) legendę o powstaniu Państwa Polskiego.',
                        'Odwiedziłem(-am) urząd miasta lub gminy. Wiem, jakie sprawy można tam załatwić.',
                        'Pamiętam o wywieszeniu flagi podczas świąt państwowych. Zrobiłem(-am) zdjęcie wywieszonej flagi i pokazałem(-am) je w kręgu rady.',
                        'Razem z gromadą uczestniczyłem(-am) w obchodach święta państwowego. Dowiedziałem(-am) się, dlaczego radośnie świętujemy ten dzień.',
                        'Nauczyłem(-am) szóstkę piosenki „Grzeczne słówka” i zaśpiewaliśmy ją całej gromadzie.',
                        'Narysowałem(-am) plakat przedstawiający dokonania zasłużonego Polaka. Pokazałem(-am) plakat w kręgu rady.',
                        'Wraz z członkiem rodziny odszukałem(-am) w Internecie miejsca ważne historycznie znajdujące się w okolicy. Wspólnie je zwiedziliśmy. Narysowałem(-am) pocztówkę z tej przygody i zaprezentowałem(-am) ją w kręgu rady.',
                        'Podjąłem(-am) wyzwanie „wiecznego worka” - w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-am) worek znalezionymi śmieciami, dbając o czyste środowisko.',
                      ]),
                  SprawData(
                      id: 'mlody_patriota',
                      title: 'Młody Patriota',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam hymn Polski i wiem, w jaki sposób trzeba zachowywać się podczas jego śpiewania. Zaśpiewałem(-am) hymn i opowiedziałem(-am) o tym drużynowemu.',
                        'Odwiedziłem(-am) urząd miasta lub gminy. Wiem, jakie sprawy można tam załatwić.',
                        'Wiem, kto jest prezydentem Polski i jakie są jego obowiązki.',
                        'Pamiętam o wywieszaniu flagi w święta państwowe. Nakręciłem(-am) krótki film o tym, dlaczego wywieszamy flagę np. w dniu 11 listopada. Filmik pokazałem(-am) w kręgu rady.',
                        'Razem z gromadą uczestniczyłem(-am) w obchodach święta państwowego. Dowiedziałem(-am) się, dlaczego radośnie świętujemy ten dzień.',
                        'Narysowałem(-am) plakat przedstawiający dokonania zasłużonego Polaka. Pokazałem(-am) plakat w kręgu rady.',
                        'Wraz z członkiem rodziny odszukałem(-am) w Internecie miejsca ważne historycznie znajdujące się w okolicy. Wspólnie je zwiedziliśmy. Narysowałem(-am) pocztówkę z tej przygody i zaprezentowałem(-am) ją w kręgu rady.',
                        'Podjąłem(-am) wyzwanie „wiecznego worka” - w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-am) worek znalezionymi śmieciami, dbając o czyste środowisko. Zaprosiłem(-am) do tego wyzwania moją szóstkę.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '4',
                requirements: [
                  'Wiem, co to jest Unia Europejska i po co powstała.',
                  'Znam Hymn Unii Europejskiej.',
                  'Wiem, ile państw należy do Unii Europejskiej. Umiem wymienić dziesięć z nich.',
                  'Wykonałem(-am) flagę Unii Europejskiej. Wytłumaczyłem(-am) kolegom, co oznaczają gwiazdki na fladze UE.',
                  'Znam walutę, którą posługuje się większość państw zjednoczonych w UE i potrafię ją odróżnić od innych walut.',
                  'Wiem, gdzie znajduje się siedziba władz UE.',
                  'Znam datę przystąpienia Polski do Unii Europejskiej.',
                ],
                notesForLeaders: [
                  'Sprawność ma uświadomić zuchowi, czym jest Unia Europejska, jakie są jej cele i dlaczego Polska została jej członkiem.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Obywatela Unii Europejskiej”: „Zuch kocha Polskę i czyni dobro.”, „Zuch pamięta o swoich obowiązkach.”, „Wszystkim jest z zuchem dobrze.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'obywatel_unii_europejskiej',
                      title: 'Obywatel Unii Europejskiej',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest Unia Europejska i po co powstała. Przygotowałem(-am) do zuchówki plakat o UE.',
                        'Zaśpiewałem(-am) Hymn Unii Europejskiej.',
                        'Wykonałem(-am) flagę Unii Europejskiej. Wyjaśniłem(-am) swojej szóstce, co oznacza liczba gwiazdek na tej fladze oraz jak nazywa się waluta, którą posługuje się większość państw należących do Unii Europejskiej.',
                      ]),
                  SprawData(
                      id: 'obywatel_unii_europejskiej',
                      title: 'Obywatel Unii Europejskiej',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest Unia Europejska i po co powstała. Przygotowałem(-am) do zuchówki gazetkę o UE.',
                        'Zaśpiewałem(-am) Hymn Unii Europejskiej.',
                        'Wykonałem(-am) flagę Unii Europejskiej. Wyjaśniłem(-am) na zbiórce, co oznacza liczba gwiazdek na tej fladze.',
                        'Zaznaczyłem(-am) na mapie Europy państwa wchodzące w skład Unii Europejskiej.',
                        'Wyjaśniłem(-am) zuchom, od kiedy Polska należy do Unii Europejskiej.',
                      ]),
                  SprawData(
                      id: 'obywatel_unii_europejskiej',
                      title: 'Obywatel Unii Europejskiej',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest Unia Europejska i po co powstała. Przygotowałem(-am) do zuchówki gazetkę o UE.',
                        'Zaśpiewałem(-am) Hymn Unii Europejskiej.',
                        'Wykonałem(-am) flagę Unii Europejskiej. Wyjaśniłem(-am) swojej szóstce, co oznacza liczba gwiazdek na tej fladze.',
                        'Zaznaczyłem(-am) na mapie Europy państwa wchodzące w skład Unii Europejskiej oraz siedzibę instytucji UE.',
                        'Opowiedziałem(-am) zuchom, od kiedy Polska należy do Unii Europejskiej.',
                        'Wiem, jak wygląda waluta Unii Europejskiej. Zaprezentowałem(-am) ją gromadzie, opowiadając, czym różni się euro w różnych krajach członkowskich.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '5',
                requirements: [
                  'Opiekowałem(-am) się osobą niepełnosprawną lub starszą.',
                  'Systematycznie odwiedzałem(-am) osobę niepełnosprawną lub starszą.',
                  'Pomagałem(-am) odrabiać lekcje koledze.',
                  'Opowiedziałem(-am) o tym, co się dzieje w szkole lub w gromadzie niepełnosprawnemu koledze.',
                  'Nauczyłem(-am) niepełnosprawnego kolegę piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                  'Wspólnie z niepełnosprawnym kolegą zorganizowałem(-am) coś dla innych dzieci (turniej, zabawy itp.).',
                  'Zrobiłem(-am) coś miłego dla osoby niepełnosprawnej lub starszej.',
                  'Opowiedziałem(-am) w gromadzie o moich kontaktach z osobą niepełnosprawną lub starszą.',
                  'Pomogłem(-am) niepełnosprawnemu koledze przyjść na zbiórkę.',
                  'Pomagałem(-am) w czynnościach życiowych niepełnosprawnej lub starszej osobie, np. zrobiłem(-am) zakupy, czytałem(-am) niewidomemu.',
                ],
                notesForLeaders: [
                  'Sprawność może zdobywać zuch, który ma kontakt z osobą niepełnosprawną - dorosłą lub rówieśnikiem (w rodzinie, w sąsiedztwie, w klasie lub w gromadzie).',
                  'Podczas zdobywania tej sprawności zuch stara się zrozumieć potrzeby innych, utrwala dobre wzorce zachowań, uczy się odpowiedzialności za podjęte działania.',
                  'Dzięki tej sprawności zuch ma okazję uwrażliwić się na potrzeby innych osób.',
                  'Zuchowi, który wybrał tę sprawność, należy uświadomić, że jego działanie ma charakter ciągły, jest służbą, którą trzeba pełnić systematycznie. Jeśli zuch pomaga osobie spoza gromady, należy ułatwić mu przyprowadzenie tej osoby na zbiórkę i zapewnić jej możliwość normalnego uczestnictwa. W kręgu rady i w innych sprzyjających sytuacjach należy podkreślać wartość działań podejmowanych na rzecz osób niepełnosprawnych.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Przyjaciela Nieznanego Świata”: „Wszystkim jest z zuchem dobrze.”, „Zuch stara się być coraz lepszy.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'przyjaciel_nieznanego_swiata',
                      title: 'Przyjaciel Nieznanego Świata',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Opiekowałem(-am) się osobą niepełnosprawną lub starszą i pomagałem(-am) w prostych czynnościach domowych.',
                        'Systematycznie odwiedzałem(-am) osobą niepełnosprawną lub starszą przez dwa tygodnie.',
                        'Pomagałem(-am) odrabiać lekcje koledze z niepełnosprawnością.',
                        'Opowiedziałem(-am) o tym, co się dzieje w szkole lub w gromadzie koledze z niepełnosprawnością.',
                        'Zrobiłem(-am) coś miłego dla osoby niepełnosprawnej lub starszej.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_nieznanego_swiata',
                      title: 'Przyjaciel Nieznanego Świata',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opiekowałem(-am) się osobą niepełnosprawną lub starszą i pomagałem(-am) jej w prostych czynnościach domowych.',
                        'Systematycznie odwiedzałem(-am) osobę niepełnosprawną lub starszą przez miesiąc.',
                        'Nauczyłem(-am) kolegę z niepełnosprawnością piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                        'Wspólnie z kolegą z niepełnosprawnością zorganizowałem(-am) coś dla innych dzieci (turniej, zabawy itp.).',
                        'Zrobiłem(-am) coś miłego dla osoby niepełnosprawnej lub starszej.',
                        'Opowiedziałem(-am) o moich kontaktach z osobą niepełnosprawną lub starszą zuchom w gromadzie lub w szóstce.',
                        'Pomogłem(-am) koledze z niepełnosprawnością przyjść na zbiórkę.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_nieznanego_swiata',
                      title: 'Przyjaciel Nieznanego Świata',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opiekowałem(-am) się osobą niepełnosprawną lub starszą i pomagałem(-am) w prostych czynnościach domowych.',
                        'Systematycznie odwiedzałem(-am) osobą niepełnosprawną lub starszą przez dwa miesiące.',
                        'Nauczyłem(-am) kolegę z niepełnosprawnością piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                        'Wspólnie z kolegą z niepełnosprawnością zorganizowałem(-am) coś dla innych dzieci (turniej, zabawy itp.).',
                        'Opowiedziałem(-am) o moich kontaktach z osobą niepełnosprawną lub osobą starszą zuchom w gromadzie lub w szóstce.',
                        'Pomogłem(-am) koledze z niepełnosprawnością przyjść na zbiórkę.',
                        'Pomagałem(-am) w czynnościach życiowych osobie niepełnosprawnej lub starszej (zrobiłem zakupy, czytałem niewidomemu).',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '6',
                requirements: [
                  'Znam kilka kolęd i pieśni adwentowych.',
                  'Spełniłem(-am) w adwencie kilka dobrych uczynków i podjąłem(-am) osobiste postanowienie.',
                  'Wspólnie z kolegami wykonałem(-am) szopkę.',
                  'Uczestniczyłem(-am) w przedstawieniu jasełek lub kolędowaniu.',
                  'Wykonałem(-am) lampion dla Światła Betlejemskiego.',
                  'Pełniłem(-am) straż przy Świetle Betlejemskim. Uczestniczyłem(-am) w jego przekazywaniu.',
                  'Wykonałem(-am) kartkę ze świątecznymi życzeniami. Podarowałem(-am) ją lub wysłałem(-am) komuś.',
                  'Zaniosłem(-am) Światło Betlejemskie swojej rodzinie i zadbałem(-am), by płonęło na wigilijnym stole.',
                ],
                notesForLeaders: [
                  'Sprawność uczy radości dawania, uczynności, braterstwa i pracy nad sobą. Może ją zdobywać każdy zuch w okresie poprzedzającym święta Bożego Narodzenia.',
                  '„Strażnik Betlejemskiego Światła Pokoju” wie, na czym polega dobre przygotowanie do świąt oraz jak ważne jest podejmowanie osobistych postanowień i ich dotrzymywanie.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Strażnika Betlejemskiego Światła Pokoju”: „Zuch pamięta o swoich obowiązkach.” , „Zuch stara się być coraz lepszy.” „Wszystkim jest z zuchem dobrze.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'straznik_betlejemskiego_swiatla_pokoju',
                      title: 'Strażnik Betlejemskiego Światła Pokoju',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Razem z moją gromadą lub klasą wziąłem(wzięłam) udział we wspólnym kolędowaniu.',
                        'Spełniłem(-am) dobry uczynek dla domowników, zuchów z szóstki lub kolegów z klasy.',
                        'Nauczyłem(-am) szóstkę wybranej kolędy lub pieśni adwentowej.',
                        'Brałem(-am) udział w przekazaniu Betlejemskiego Światła Pokoju.',
                        'Wykonałem(-am) lampion dla Światła Betlejemskiego.',
                        'Z pomocą starszego zucha lub dorosłego wykonałem(-am) i wypisałem(-am) kartkę świąteczną, którą wysłałem(-am) do wybranej osoby.',
                      ]),
                  SprawData(
                      id: 'straznik_betlejemskiego_swiatla_pokoju',
                      title: 'Strażnik Betlejemskiego Światła Pokoju',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Razem z moją gromadą lub klasą uczestniczyłem(-am) we wspólnym kolędowaniu.',
                        'Spełniłem(-am) dobry uczynek dla domowników, zuchów z szóstki lub kolegów z klasy.',
                        'W czasie adwentu podjąłem(-am) osobiste tygodniowe postanowienie.',
                        'Nauczyłem(-am) gromadę wybranej kolędy lub pieśni adwentowej.',
                        'Brałem(-am) udział w przekazaniu Betlejemskiego Światła Pokoju.',
                        'Wykonałem(-am) lampion dla Światła Betlejemskiego.',
                        'Zaniosłem(-am) Światło Betlejemskie do domu, by płonęło na wigilijnym stole.',
                        'Samodzielnie wykonałem(-am) i wypisałem(-am) kartki świąteczne, które wysłałem(-am) do kilku wybranych osób.',
                        'Uczestniczyłem(-am) w jasełkach lub innym świątecznym przedstawieniu.',
                      ]),
                  SprawData(
                      id: 'straznik_betlejemskiego_swiatla_pokoju',
                      title: 'Strażnik Betlejemskiego Światła Pokoju',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Razem z gromadą lub klasą uczestniczyłem(-am) we wspólnym kolędowaniu.',
                        'Spełniłem(-am) dobry uczynek dla domowników, zuchów z szóstki lub kolegów z klasy.',
                        'W czasie adwentu podjąłem(-am) osobiste tygodniowe postanowienie.',
                        'Nauczyłem(-am) gromadę wybranej kolędy lub pieśni adwentowej.',
                        'Brałem(-am) udział w przekazaniu Betlejemskiego Światła Pokoju, pełniąc przy tym szczególną rolę.',
                        'Wykonałem(-am) lampion dla Światła Betlejemskiego.',
                        'Zaniosłem(-am) Światło Betlejemskie do domu i dbałem(-am), by płonęło na wigilijnym stole.',
                        'Ułożyłem(-am) świąteczny wierszyk z życzeniami. Samodzielnie wykonałem(-am) kartki świąteczne, które wysłałem(-am) do kilku wybranych osób.',
                        'Brałem(-am) udział w jasełkach lub innym świątecznym przedstawieniu.',
                        'Poznałem(-am) historię Betlejemskiego Światła Pokoju. Wiem, skąd pochodzi i jak trafia do Polski. Opowiedziałem(-am) o nim mojej gromadzie.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '7',
                requirements: [
                  'Znam tradycje związane ze Świętami Wielkanocnymi. Zaprezentowałem(-am) je kolegom.',
                  'Wiem, na pamiątkę jakiego zdarzenia obchodzi się Święta Wielkanocne. Opowiedziałem(-am) o tym na zbiórce.',
                  'Wykonałem(-am) samodzielnie lub z pomocą palmę wielkanocną.',
                  'Pomagałem(-am) rodzinie w wielkich porządkach przedświątecznych.',
                  'Znam kilka technik wykonywania pisanek i kraszanek. Zrobiłem(-am) farby do jajek z cebuli, dębu lub zboża.',
                  'Przygotowałem(-am) wspólnie z rodzicami koszyczek wielkanocny, który poświęciłem(-am) w Wielką Sobotę.',
                  'Znam tradycję śmigusa-dyngusa. Chętnie brałem(-am) udział w wielkoponiedziałkowych zabawach. Pamiętałem(-am) jednak o umiarze w żartach - tak, by nikogo nie skrzywdzić.',
                  'Wiem, dlaczego wielkanocnymi symbolami są: jajko, kurczaczek, baranek i zajączek. Opowiedziałem(-am) o nich na zbiórce.',
                  'Potrafię wymienić kilka wielkanocnych potraw. Opowiedziałem(-am) o nich w szóstce.',
                  'Samodzielnie lub z pomocą przygotowałem(-am) świąteczną babę lub mazurka.',
                  'Przygotowałem(-am) mapę Polski z zaznaczonymi charakterystycznymi dla danego regionu zwyczajami wielkanocnymi.',
                  'Rozmawiałem(-am) z rodzicami lub dziadkami na temat zwyczajów wielkanocnych z czasów ich dzieciństwa.',
                  'Znam zwyczaj przynoszenia słodyczy przez wielkanocnego zajączka. Zrobiłem(-am) miłą niespodziankę komuś bliskiemu.',
                ],
                notesForLeaders: [
                  'Sprawność pomaga kształtować pracowitość i chęć pomocy. Inspiruje zuchy do twórczego myślenia przy pracy nad pisankami i ozdobami. Poznawanie i kultywowanie tradycji w dużym stopniu wpływa na rozwój duchowy dzieci.',
                  'Zuch uczy się (przy okazji śmigusa-dyngusa) dostrzegać granicę po przekroczeniu której zabawa zmienia się w krzywdzenie, poniżanie, a nawet znęcanie się nad innymi jej uczestnikami.',
                  'Sprawność należy zdobywać przed Świętami Wielkanocnymi i podczas nich. Mogą ją zdobywać zuchy różnych wyznań i ateiści. Drużynowy powinien pomóc dzieciom tak dobrać zadania, aby dotyczyły tradycji i obrzędów wielkanocnych.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Wielkanocnego Baranka”: „Wszystkim jest z zuchem dobrze.”, „Zuch pamięta o swoich obowiązkach.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'wielkanocny_baranek',
                      title: 'Wielkanocny Baranek',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam tradycje związane ze Świętami Wielkanocnymi. Przedstawiłem(-am) je na plakacie.',
                        'Wykonałem(-am) samodzielnie lub z pomocą palmę wielkanocną.',
                        'Pomagałem(-am) rodzinie w wielkich porządkach przedświątecznych.',
                        'Własnoręcznie ozdobiłem(-am) pisankę dowolną metodą. Zrobiłem(-am) farby z cebuli, dębu lub zboża.',
                        'Przygotowałem(-am) wraz z rodzicami koszyczek wielkanocny, który poświęciłem(-am) w Wielką Sobotę.',
                        'Potrafię wymienić kilka wielkanocnych potraw. Opowiedziałem(-am) o nich w szóstce.',
                        'Znam zwyczaj przynoszenia słodyczy przez wielkanocnego zajączka. Zrobiłem(-am) miłą niespodziankę komuś bliskiemu.',
                      ]),
                  SprawData(
                      id: 'wielkanocny_baranek',
                      title: 'Wielkanocny Baranek',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, na pamiątkę jakiego zdarzenia obchodzi się Święta Wielkanocne. Opowiedziałem(-am) o tym na zbiórce.',
                        'Wykonałem(-am) samodzielnie lub z pomocą palmę wielkanocną.',
                        'Pomagałem(-am) rodzinie w wielkich porządkach przedświątecznych.',
                        'Znam kilka technik wykonywania pisanek i kraszanek. Zrobiłem(-am) farby z cebuli, dębu lub zboża. Samodzielnie ozdobiłem(-am) pisankę lub kraszankę.',
                        'Przygotowałem(-am) wspólnie z rodzicami koszyczek wielkanocny, który poświęciłem(-am) w Wielką Sobotę.',
                        'Rozmawiałem(-am) z rodzicami lub dziadkami na temat zwyczajów wielkanocnych z czasów ich dzieciństwa.',
                        'Znam zwyczaj przynoszenia słodyczy przez wielkanocnego zajączka. Zrobiłem(-am) miłą niespodziankę komuś bliskiemu.',
                      ]),
                  SprawData(
                      id: 'wielkanocny_baranek',
                      title: 'Wielkanocny Baranek',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wykonałem(-am) samodzielnie lub z pomocą palmę wielkanocną.',
                        'Pomagałem(-am) rodzinie w wielkich porządkach przedświątecznych.',
                        'Znam kilka technik wykonywania pisanek i kraszanek. Zrobiłem(-am) farby z cebuli, dębu lub zboża. Samodzielnie ozdobiłem(-am) pisankę lub kraszankę.',
                        'Przygotowałem(-am) wspólnie z rodzicami koszyczek wielkanocny, który poświęciłem(-am) w Wielką Sobotę.',
                        'Samodzielnie lub z pomocą przygotowałem(-am) świąteczną babę lub mazurka.',
                        'Przygotowałem(-am) mapę Polski z zaznaczonymi charakterystycznymi dla danego regionu zwyczajami wielkanocnymi.',
                        'Rozmawiałem(-am) z rodzicami lub dziadkami na temat zwyczajów wielkanocnych z czasów ich dzieciństwa.',
                        'Znam zwyczaj przynoszenia słodyczy przez wielkanocnego zajączka. Zrobiłem(-am) miłą niespodziankę komuś bliskiemu.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '8',
                requirements: [
                  'Zorganizowałem(-am) teatr min w swojej szóstce.',
                  'Samodzielnie lub z szóstką zaprezentowałem(-am) krótką scenkę komediową.',
                  'Przeprowadziłem(-am) w gromadzie konkurs na najładniejszy uśmiech „po cytrynie”.',
                  'Wykonałem(-am) niezauważony(-na) przynajmniej trzy dobre uczynki, które wywołały uśmiech na czyjejś twarzy. Opowiedziałem(-am) o tym na zbiórce.',
                  'Zorganizowałem(-am) kabareton w gromadzie. Zaprosiłem(-am) do niego rodziców.',
                  'Umiem zachować umiar w swoich żartach, mam poczucie dobrego smaku, nie drwię z nikogo, nie śmieję się z cudzego nieszczęścia. Wszyscy dobrze czują się w moim towarzystwie.',
                  'Stworzyłem(-am) kodeks lub poradnik „Śmieszka”.',
                ],
                notesForLeaders: [
                  'Sprawność pomaga dziecku optymistycznie patrzeć na świat. Uczy radzić sobie z przeciwnościami losu i nie załamywać się w trudnych sytuacjach. Wspiera pozytywne zachowania i pozytywne myślenie oraz postawy koleżeństwa i pomagania innym. Zdobywając ją, zuch powinien nauczyć się umiaru w żartach, a także - kiedy trzeba - zachowania powagi.',
                  'Sprawność ta może być zdobywana przez zucha w każdym wieku, zarówno na kolonii czy biwaku, jak i na zbiórkach.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Śmieszka”: „Wszystkim jest z zuchem dobrze.”, „Zuch stara się być coraz lepszy.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'smieszek',
                      title: 'Śmieszek',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zorganizowałem(-am) teatr min w swojej szóstce.',
                        'Samodzielnie lub z szóstką zaprezentowałem(-am) krótką scenkę komediową.',
                        'Przeprowadziłem(-am) w gromadzie konkurs na najładniejszy uśmiech „po cytrynie”.',
                        'Wykonałem(-am) niezauważony(-na) przynajmniej dwa dobre uczynki, które wywołały uśmiech na czyjejś twarzy. Opowiedziałem(-am) o tym na zbiórce.',
                        'Brałem(-am) udział w zabawie „Mój mały, biedny, czarny kotku”, w której powstrzymywałem(-am) się od śmiechu.',
                      ]),
                  SprawData(
                      id: 'smieszek',
                      title: 'Śmieszek',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zorganizowałem(-am) teatr min w swojej szóstce.',
                        'Samodzielnie lub z szóstką zaprezentowałem(-am) krótką scenkę komediową.',
                        'Przeprowadziłem(-am) w gromadzie konkurs na najładniejszy uśmiech „po cytrynie”.',
                        'Wykonałem(-am) niezauważony(-na) przynajmniej trzy dobre uczynki, które wywołały uśmiech na czyjejś twarzy. Opowiedziałem(-am) o tym na zbiórce.',
                        'Umiem zachować umiar w moich żartach, mam poczucie dobrego smaku, nie drwię z nikogo, nie śmieję się z cudzego nieszczęścia. Wszyscy dobrze czują się w moim towarzystwie. Ułożyłem(-am) kodeks lub poradnik „Śmieszka”.',
                        'Brałem(-am) udział w zabawie „Mój mały, biedny, czarny kotku”, w której powstrzymywałem(-am) się od śmiechu.',
                      ]),
                  SprawData(
                      id: 'smieszek',
                      title: 'Śmieszek',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zorganizowałem(-am) teatr min w swojej szóstce.',
                        'Samodzielnie lub z szóstką zaprezentowałem(-am) krótką scenkę komediową.',
                        'Przeprowadziłem(-am) w gromadzie konkurs na najładniejszy uśmiech „po cytrynie”.',
                        'Wykonałem(-am) niezauważalnie przynajmniej trzy dobre uczynki, które wywołały uśmiech na czyjejś twarzy. Opowiedziałem(-am) o tym na zbiórce.',
                        'Zorganizowałem(-am) kabareton w gromadzie. Zaprosiłem(-am) do niego rodziców.',
                        'Umiem zachować umiar w żartach, mam poczucie dobrego smaku, nie drwię z nikogo, nie śmieję się z cudzego nieszczęścia. Wszyscy dobrze czują się w moim towarzystwie. Ułożyłem(-am) kodeks lub poradnik „Śmieszka”.',
                        'Brałem(-am) udział w zabawie „Mój mały, biedny, czarny kotku”, w której powstrzymywałem(-am) się od śmiechu.',
                      ]),
                ]
            ),

          ]),

    ]
).build();
