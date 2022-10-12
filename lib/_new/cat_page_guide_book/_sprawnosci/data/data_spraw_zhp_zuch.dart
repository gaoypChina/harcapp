import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';

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
                        'Zorganizowałem(-am) przedstawienie dla młodszych kolegów i koleżanek, zuchów z gromady lub rodziców.',
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

          ]),

      SprawGroupData(
          id: 'spraw_sportowe',
          title: 'Sportowe',
          tags: ['#aktywność fizyczna', '#rekreacja', '#zdrowa rywalizacja', '#zdrowy tryb życia', '#praca nad sobą', '#ruch to zdrowie', '#w zdrowym ciele zdrowy duch'],
          familyData: [

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
                  'Zrobiłam gazetkę na temat savoir-vivre’u lub opowiedziałam o zasadach savoir-vivre’u kolegom i koleżankom.',
                  'Spory rozwiązuję w sposób kulturalny. Zorganizowałam obrady okrągłego stołu, w czasie których rozstrzygaliśmy problem, przestrzegając zasad kulturalnej dyskusji.',
                  'Przygotowałam dla papierowych lalek ubranka na różne okazje.',
                  'Umiem ubrać się odpowiednio do okazji. Przygotowałam pokaz mody w gromadzie lub klasie.',
                  'Nakrywałam do stołu w domu, na kolonii zuchowej, podczas święta klasowego lub w gromadzie.',
                  'Zaprosiłam koleżanki i kolegów na herbatkę (urodziny). Urządziłam przyjęcie.',
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
                        'Zrobiłam gazetkę na temat savoir-vivre’u lub opowiedziałam o zasadach savoir-vivre’u kolegom i koleżankom.',
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
                        'Zrobiłam gazetkę na temat savoir-vivre’u lub opowiedziałam o zasadach savoir-vivre’u kolegom i koleżankom.',
                        'Umiem ubrać się odpowiednio do okazji. Przygotowałam pokaz mody w gromadzie lub klasie.',
                        ' Nakrywałam do stołu w domu, na kolonii zuchowej, podczas święta klasowego lub w gromadzie.',
                        'Zaprosiłam koleżanki i kolegów na herbatkę (urodziny). Urządziłam przyjęcie.',
                        'Potrafię rozmawiać przez telefon. Zaprezentowałam na zbiórce podstawowe zasady kulturalnej rozmowy telefonicznej.',
                      ]),
                  SprawData(
                      id: 'dama',
                      title: 'Dama',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Przeczytałam książkę lub artykuł z czasopisma dla dzieci o zasadach savoir-vivre’u. Ułożyłam kodeks damy, który zaprezentowałam koleżankom z klasy lub gromady.',
                        'Zrobiłam gazetkę na temat savoir-vivre’u lub opowiedziałam o zasadach savoir-vivre’u kolegom i koleżankom.',
                        'Spory rozwiązuję w sposób kulturalny. Zorganizowałam obrady okrągłego stołu, w czasie których rozstrzygaliśmy problem, przestrzegając zasad kulturalnej dyskusji.',
                        'Umiem ubrać się odpowiednio do okazji. Przygotowałam pokaz mody w gromadzie lub w klasie.',
                        'Nakrywałam do stołu w domu, na kolonii zuchowej, podczas święta klasowego lub w gromadzie.',
                        'Zaprosiłam koleżanki i kolegów na herbatkę (urodziny). Urządziłam przyjęcie.',
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
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Epidemiologa/Epidemiolożki”: "Zuch pamięta o swoich obowiązkach" Wszystkim jest z zuchem dobrze" "Zuch jest dzielny".',

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
                  'Sprzedawałem(-am) w sklepiku zuchowym lub na kiermaszu prowadzonym przez gromadę/klasę.',
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
                        'Dowiedziałem(-am) się, w jaki sposób można oszczędzać pieniądze i opowiedziałem(-am) o tym drużynowemu/drużynowej.',
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
                        'Sprzedawałem(-am) w sklepiku zuchowym lub na kiermaszu prowadzonym przez gromadę/klasę.',
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
                        'Sprzedawałem(-am) w sklepiku zuchowym lub na kiermaszu prowadzonym przez gromadę/klasę.',
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
                  'Opowiedziałem(-am) kolegom i koleżankom, jak należy dbać o higienę.',
                  'Sprawdzałem(-am) stan czystości na kolonii.',
                  'Zmierzyłem(-am) temperaturę i oceniłem(-am), czy jest prawidłowa.',
                  'Dbam o swój pokój/kącik. Potrafię uporządkować swoje miejsce pracy.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje postawę dbałości o zdrowie. Uczy zucha troski o higienę swojego ciała i miejsca, w którym przebywa.',
                  'Zuch „Higienista/Higienistka” może następnie zdobyć sprawność „Śnieżnobiały uśmiech”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Higienisty/Higienistki”: "Zuch stara się być coraz lepszy.", "Zuch pamięta o swoich obowiązkach." ',
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
                        'Samodzielnie umyłem(-am) włosy podczas wyjazdu gromady lub w domu pod okiem rodziców. Efekty zaprezentowałem(-am) drużynowemu/drużynowej.',
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
                        'Samodzielnie umyłem(-am) włosy podczas wyjazdu gromady lub w domu pod okiem rodziców. Efekty zaprezentowałem(-am) drużynowemu/drużynowej.',
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
                        'Samodzielnie umyłem(-am), a następnie uczesałem(-am) włosy podczas wyjazdu gromady lub w domu pod okiem rodziców. Efekty zaprezentowałem(-am) drużynowemu/drużynowej.',
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
                  'Sprawność jest przeznaczona dla dzieci, które lubią pomagać w kuchni. Zdobywającyą zuch na pewno chętnie umieści swoje ulubione przepisy we własnej książce ucharskiej, pochwali się kolorowym fartuszkiem lub przygotuje plakat, który pokaże olegom i koleżankom z gromady lub klasy, aby przekonać ich, że bardzo ważne jest to, o jedzą.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność "Kuchmistrza/Kuchmistrzyni”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze." ',
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
                        'Samodzielnie przygotowałem(-am) zdrowy deser dla rodziny lub kolegi/koleżanki.',
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
                        'Samodzielnie przygotowałem(-am) zdrowy deser dla rodziny lub kolegi/koleżanki.',
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
                  'Aby dalej rozwijać zainteresowania zucha, można wskazać mu sprawności „Złotej rączki” i „Kuchmistrza/Kuchmistrzyni”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Perfekcyjnego pana domu/Perfekcyjnej pani domu”: "Zuch pamięta o swoich obowiązkach.", "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze." ',
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
                  'Zuchowi można zaproponować następnie sprawność „Rowerzysty/Rowerzystki”.',
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
                        'Znam telefon na policję, straż pożarną i pogotowie. Wiem, jak wezwać pomoc. Przedstawiłem(-am) to drużynowemu/drużynowej.',
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
                  'Zuch „Przewodnik/Przewodniczka po szkole” jest odpowiedzialny nie tylko za siebie, ale także za innych. Łatwo nawiązuje kontakty z rówieśnikami i chętnie pomaga innym. Warto zwrócić uwagę zucha na pierwszoklasistów oraz nowych uczniów.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Przewodnika/Przewodniczki po szkole”: "Zuch stara się być coraz lepszy.", "Wszystkim jest z zuchem dobrze." ',
                ],
                sprawData: [
                  SprawData(
                      id: 'przewodnik_po_szkole',
                      title: 'Przewodnik po szkole',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, gdzie jest moja klasa. Sam(a) do niej trafiłem(-am).',
                        'Znam imię i nazwisko wychowawcy/wychowawczyni.',
                        'Wiem, kto jest patronem mojej szkoły. Opowiedziałem(-am) na lekcji/zbiórce o jego zasługach.',
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
                        'Przyprowadziłem(-am) na zbiórkę młodszego kolegę/młodszą koleżankę.',
                        'Pokazałem(-am) pierwszoklasiście, gdzie pracują różni pracownicy szkoły (dyrektor, pielęgniarka, woźna, dozorca, sekretarka, pedagog, bibliotekarka, kucharki). Wyjaśniłem(-am), do kogo z nich może zwracać się w różnych sprawach.',
                        'Pokazałem(-am) pierwszoklasistom, jak dbać o naszą szkołę.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '10',
                requirements: [
                  'Wziąłem/wzięłam udział w kolonii zuchowej.',
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
                        'Wziąłem/wzięłam udział w kolonii zuchowej lub leśnym biwaku.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać narzędziami. Opowiem o tym drużynowemu/drużynowej.',
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
                        'Wziąłem/wzięłam udział w kolonii zuchowej lub leśnym biwaku.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać narzędziami. Opowiedziałem(-am) o tym drużynowemu/drużynowej.',
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
                        'Wziąłem/wzięłam udział w kolonii zuchowej lub leśnym biwaku.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać narzędziami. Opowiedziałem(-am) o tym w kręgu rady.',
                        'Samodzielnie rozłożyłem(-am) i pościeliłem(-am) kanadyjkę. Przez cały wyjazd dbałem(-am) o swoje miejsce do spania.',
                        'Samodzielnie złożyłem(-am) i rozłożyłem(-am) swój śpiwór.',
                        'Zaprojektowałem(-am) element zdobnictwa, np. tablicę ogłoszeń. Pokierowałem(-am) jej wykonaniem przez szóstkę.',
                        'Nauczyłem(-am) się bezpiecznie posługiwać scyzorykiem. Wykonałem(-am) majsterkę lub zdobnictwo z jego użyciem.',
                        'Bez użycia latarki trafiłem(-am) po ciemku do swojego namiotu/domku. Nauczyłem(-am) tej umiejętności zucha z mojego domku/namiotu.',
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
                  'Wykonałem(-am) kilka zabawek i podarowałem(-am) je młodszym kolegom  i koleżankom.',
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
                  'Razem z kolegami i koleżankami zaopiekowałem(-am) się klombem lub trawnikiem.',
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
                  'Znam zasady przebywania w lesie. Opowiedziałem(-am) o nich kolegom i koleżankom.',
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
                  'Opowiedziałem(-am) kolegom i koleżankom o życiu ptaków.',
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
          id: 'spraw_naukowo_hobbystyczne',
          title: 'Naukowo-hobbystyczne',
          tags: ['#ciekawość świata', '#różnorodność', '#kultura', '#nauka', '#praca nad sobą', '#zawody', '#pasje', '#pomysłowość'],
          familyData: [

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
                  'W okresie świątecznym razem z kolegami i koleżankami chodziłem(-am) i kolędowałem(-am), niosąc radość ludziom w mojej okolicy.',
                  'Wiem, jak dawniej wyglądało kolędowanie na terenach, na których mieszkam. Dowiedziałem(-am) się, jakie panowały wtedy obrzędy i zwyczaje świąteczne.',
                  'Nauczyłem(-am) inne zuchy przynajmniej jednej kolędy.',
                  'Mam śpiewnik lub nagrania z kolędami.',
                ],
                notesForLeaders: [
                  'Sprawność wpływa na rozwój duchowy dzieci, a także pomaga poznać zwyczaje i obrzędy staropolskie.',
                  'Mimo że „Kolędnik” to sprawność indywidualna, zuchy mogą zdobywać ją w grupach, najlepiej w szóstkach – w ten sposób łatwiej im będzie przygotować przedstawienie. Przy zdobywaniu sprawności zuchom potrzebna jest znaczna pomoc kadry gromady.',
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
                        'W okresie świątecznym wspólnie z kolegami i koleżankami chodziłem(-am) i kolędowałem(-am), niosąc radość ludziom w mojej okolicy.',
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
                        'W okresie świątecznym wspólnie z kolegami i koleżankami chodziłem(-am) i kolędowałem(-am), niosąc radość ludziom w mojej okolicy.',
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
                  'Kadra gromady powinna zwrócić uwagę na fakt, że współczesny patriota to człowiek otwarty, tolerancyjny, dbający o środowisko i język ojczysty, znający historię i kultywujący tradycje. Patriota szanuje swoją małą ojczyznę – rodzinę, nauczycieli, koleżanki i kolegów oraz miejscowość, w której mieszka. Tworzy świat oparty na podstawowych wartościach: wolności, samorządności i demokracji.',
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
                        'Podjąłem (Podjęłam) wyzwanie „wiecznego worka” – w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-am) worek znalezionymi śmieciami, dbając o czyste środowisko.',
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
                        'Podjąłem(-am) wyzwanie „wiecznego worka” – w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-am) worek znalezionymi śmieciami, dbając o czyste środowisko.',
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
                        'Podjąłem(-am) wyzwanie „wiecznego worka” – w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-am) worek znalezionymi śmieciami, dbając o czyste środowisko. Zaprosiłem(-am) do tego wyzwania moją szóstkę.',
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
                  'Pomagałem(-am) odrabiać lekcje koledze lub koleżance.',
                  'Opowiedziałem(-am) o tym, co się dzieje w szkole lub w gromadzie niepełnosprawnemu koledze lub koleżance.',
                  'Nauczyłem(-am) niepełnosprawnego kolegę lub koleżankę piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                  'Wspólnie z niepełnosprawnym kolegą lub koleżanką zorganizowałem(-am) coś dla innych dzieci (turniej, zabawy itp.).',
                  'Zrobiłem(-am) coś miłego dla osoby niepełnosprawnej lub starszej.',
                  'Opowiedziałem(-am) w gromadzie o moich kontaktach z osobą niepełnosprawną lub starszą.',
                  'Pomogłem(-am) niepełnosprawnemu koledze lub koleżance przyjść na zbiórkę.',
                  'Pomagałem(-am) w czynnościach życiowych niepełnosprawnej/starszej osobie, np. zrobiłem(-am) zakupy, czytałem(-am) niewidomemu.',
                ],
                notesForLeaders: [
                  'Sprawność może zdobywać zuch, który ma kontakt z osobą niepełnosprawną – dorosłą lub rówieśnikiem (w rodzinie, w sąsiedztwie, w klasie lub w gromadzie).',
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
                        'Pomagałem(-am) odrabiać lekcje koledze lub koleżance z niepełnosprawnością.',
                        'Opowiedziałem(-am) o tym, co się dzieje w szkole lub w gromadzie koledze lub koleżance z niepełnosprawnością.',
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
                        'Nauczyłem(-am) kolegę lub koleżankę z niepełnosprawnością piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                        'Wspólnie z kolegą lub koleżanką z niepełnosprawnością zorganizowałem(-am) coś dla innych dzieci (turniej, zabawy itp.).',
                        'Zrobiłem(-am) coś miłego dla osoby niepełnosprawnej lub starszej.',
                        'Opowiedziałem(-am) o moich kontaktach z osobą niepełnosprawną lub starszą zuchom w gromadzie lub w szóstce.',
                        'Pomogłem(-am) koledze lub koleżance z niepełnosprawnością przyjść na zbiórkę.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_nieznanego_swiata',
                      title: 'Przyjaciel Nieznanego Świata',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opiekowałem(-am) się osobą niepełnosprawną lub starszą i pomagałem(-am) w prostych czynnościach domowych.',
                        'Systematycznie odwiedzałem(-am) osobą niepełnosprawną lub starszą przez dwa miesiące.',
                        'Nauczyłem(-am) kolegę lub koleżankę z niepełnosprawnością piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                        'Wspólnie z kolegą lub koleżanką z niepełnosprawnością zorganizowałem(-am) coś dla innych dzieci (turniej, zabawy itp.).',
                        'Opowiedziałem(-am) o moich kontaktach z osobą niepełnosprawną lub osobą starszą zuchom w gromadzie lub w szóstce.',
                        'Pomogłem(-am) koledze lub koleżance z niepełnosprawnością przyjść na zbiórkę.',
                        'Pomagałem(-am) w czynnościach życiowych osobie niepełnosprawnej/starszej (zrobiłem zakupy, czytałem niewidomemu).',
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
                  'Znam tradycje związane ze Świętami Wielkanocnymi. Zaprezentowałem(-am) je kolegom i koleżankom.',
                  'Wiem, na pamiątkę jakiego zdarzenia obchodzi się Święta Wielkanocne. Opowiedziałem(-am) o tym na zbiórce.',
                  'Wykonałem(-am) samodzielnie lub z pomocą palmę wielkanocną.',
                  'Pomagałem(-am) rodzinie w wielkich porządkach przedświątecznych.',
                  'Znam kilka technik wykonywania pisanek i kraszanek. Zrobiłem(-am) farby do jajek z cebuli, dębu lub zboża.',
                  'Przygotowałem(-am) wspólnie z rodzicami koszyczek wielkanocny, który poświęciłem(-am) w Wielką Sobotę.',
                  'Znam tradycję śmigusa-dyngusa. Chętnie brałem(-am) udział w wielkoponiedziałkowych zabawach. Pamiętałem(-am) jednak o umiarze w żartach – tak, by nikogo nie skrzywdzić.',
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
                        'Znam kilka technik wykonywania pisanek i kraszanek. Zrobiłem(-am) farby z cebuli, dębu lub zboża. Samodzielnie ozdobiłem(-am) pisankę/kraszankę.',
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
                  'Sprawność pomaga dziecku optymistycznie patrzeć na świat. Uczy radzić sobie z przeciwnościami losu i nie załamywać się w trudnych sytuacjach. Wspiera pozytywne zachowania i pozytywne myślenie oraz postawy koleżeństwa i pomagania innym. Zdobywając ją, zuch powinien nauczyć się umiaru w żartach, a także – kiedy trzeba – zachowania powagi.',
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
