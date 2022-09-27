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
    groupData: [

      SprawGroupData(
          id: 'spraw_artystyczne',
          title: 'Artystyczne',
          tags: ['#zdolności manualne', '#kreatywność', '#wyrażanie siebie', '#wyobraźnia', '#estetyka', '#tworzę', '#artysta'],
          familyData: [
            SprawFamilyData(
                id: '1',
                requirements: [
                  'Często słucham muzyki. Mam ulubionego twórcę (wykonawcę).',
                  'Potrafię określić rodzaj muzyki (poważna, ludowa, rozrywkowa).',
                  'Potrafię rozpoznać instrument po brzmieniu.',
                  'Byłem(-łam) na koncercie.',
                  'Umiem zagrać na instrumencie dwie lub trzy proste melodie.',
                  'Potrafię zagrać gamę C-dur, a-moll, zapisać ją i nazwać dźwięki.',
                  'Dbam o własny instrument.',
                  'Wykonałem(-łam) koncert dla mojej gromady.',
                  'Przygotowałem(-łam) akompaniament do występu gromady, klasy lub szkoły.',
                  'Brałem(-łam) udział w muzycznej imprezie szkolnej.'
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
                        'Opowiedziałem(-łam) innym zuchom, czym zajmują się charakteryzatorzy i gdzie pracują.',
                        'Narysowałem(-łam) lub zaprezentowałem(-łam) w kręgu rady przedmioty potrzebne w pracy charakteryzatora.',
                        'Ucharakteryzowałem(-łam) innego zucha do teatrzyku.',
                        'Wykonałem(-łam) jeden prosty element charakteryzacji twarzy.',
                      ]),
                  SprawData(
                      id: 'charakteryzator',
                      title: 'Charakteryzator',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-łam) innym zuchom, czym zajmują się charakteryzatorzy i gdzie pracują oraz jakie są dziedziny ich pracy.',
                        'Zaprezentowałem(-łam) w kręgu rady przedmioty potrzebne w pracy charakteryzatora.',
                        'Ucharakteryzowałem/ucharakteryzowałam moją szóstkę do teatrzyku.',
                        'Własnoręcznie wykonałem(-łam) elementy charakteryzacji twarzy do wybranej postaci.',
                        'Przygotowałem(-łam) naturalne farby do charakteryzacji i zaprezentowałem(-łam) je w praktyce.',
                        'Zmyłem(-łam) makijaż po charakteryzacji.',
                      ]),
                  SprawData(
                      id: 'charakteryzator',
                      title: 'Charakteryzator',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-łam) innym zuchom, czym zajmują się charakteryzatorzy, gdzie pracują i jakie są dziedziny ich pracy. Zaprezentowałem(-łam) najlepsze, moim zdaniem, efekty pracy charakteryzatorów w filmie lub teatrze.',
                        'Zaprezentowałem(-łam) w kręgu rady przedmioty potrzebne w pracy charakteryzatora. Pokazałem(-łam) chętnym zuchom, jak należy się nimi posługiwać.',
                        'Ucharakteryzowałem(-łam) moją szóstkę do teatrzyku. Czuwałem(-łam) nad charakteryzacją zuchów z gromady, służąc innym radą i wskazówkami.',
                        'Własnoręcznie wykonałem(-łam) elementy charakteryzacji dla wybranej postaci.',
                        'Przygotowałem(-łam) naturalne farby i materiały do charakteryzacji. Zaprezentowałem(-łam) je w praktyce.',
                        'Zmyłem(-łam) makijaż po charakteryzacji.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '2',
                requirements: [
                  'Zbieram materiały przydatne do majsterkowania i dekorowania, np. ścinki materiałów, kolorowe papiery, wstążki.',
                  'Udekorowałem(-łam) scenę na przedstawienie, salę na bal lub uroczystość szkolną.',
                  'Zrobiłem(-łam) wycinankę lub inną ozdobę.',
                  'Uczestniczyłem(-łam) w wykonaniu wystroju zuchówki lub klasy.',
                  'Przygotowałem(-łam) gazetkę ścienną.',
                  'Zrobiłem(-łam) ozdobną okładkę na książkę lub zeszyt.',
                  'Ułożyłem(-łam) kwiaty.',
                  'Przygotowałem(-łam) stół do posiłku.',
                  'Zaprojektowałem(-łam) i zrobiłem(-łam) kartę do kroniki.',
                  'Zaprojektowałem(-łam) i wykonałem(-łam) zabawkę.',
                  'Zapakowałem(-łam) prezent.',
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
                        'Własnoręcznie ozdobiłem(-łam) pudełko, w którym zbieram materiały przydatne do majsterkowania i dekorowania, np. ścinki materiałów, kolorowe papiery, wstążki.',
                        'Zrobiłem(-łam) wycinankę i zaprezentowałem(-łam) ją na zbiórce gromady.',
                        'Ułożyłem(-łam) kwiaty lub suche liście w wazonie.',
                        'Własnoręcznie zapakowałem(-łam) prezent.',
                        'Narysowałem(-łam) pokój moich marzeń.',
                      ]),
                  SprawData(
                      id: 'dekorator',
                      title: 'Dekorator',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Własnoręcznie ozdobiłem(-łam) pudełko, w którym zbieram materiały przydatne do majsterkowania i dekorowania, np. ścinki materiałów, kolorowe papiery, wstążki.',
                        'Udekorowałem(-łam) scenę na przedstawienie, salę na bal lub uroczystość szkolną.',
                        'Zrobiłem(-łam) ozdobną okładkę na książkę lub zeszyt.',
                        'Zaprojektowałem(-łam) i wykonałem(-łam) ozdobę do domu.',
                        'Zaprojektowałem(-łam) i zrobiłem(-łam) kartę do kroniki.',
                      ]),
                  SprawData(
                      id: 'dekorator',
                      title: 'Dekorator',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Własnoręcznie ozdobiłem(-łam) pudełko, w którym zbieram materiały przydatne do majsterkowania i dekorowania, np. ścinki materiałów, kolorowe papiery, wstążki.',
                        'Uczestniczyłem(-łam) w wykonaniu wystroju zuchówki lub klasy.',
                        'Przygotowałem(-łam) stół do posiłku gromady na kolonii lub biwaku. Udekorowałem(-łam) go kwiatami lub własnoręcznie zrobionymi ozdobami. Pokazałem(-łam) innym zuchom, jak składać serwetki w fantazyjne kształty.',
                        'Zaprojektowałem(-łam) i własnoręcznie wykonałem(-łam) prezent dla bliskiej osoby lub dla zwierzaka.',
                        'Przygotowałem(-łam) gazetkę ścienną do zuchówki lub klasy.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '3',
                requirements: [
                  'Wiem, co to jest pięciolinia, nuta, klucz wiolinowy i pauza. Potrafię odróżnić całą nutę, półnutę, ćwierćnutę i ósemkę. Wyjaśniłem(-łam) mojej gromadzie znane mi znaki muzyczne.',
                  'Znam podział instrumentów na dęte, perkusyjne i strunowe.',
                  'Samodzielnie wykonałem(-łam) z dostępnych materiałów (garnki, puszki, patyki itp.) prosty instrument perkusyjny i grałem(-łam) na nim podczas piosenki śpiewanej przez gromadę.',
                  'W swoim otoczeniu znalazłem(-łam) kilka przedmiotów, które wydają ciekawe dźwięki.',
                  'Rozpoznałem(-łam) dźwięki wydawane przez różne przedmioty, np. garnek, kartka papieru, szklanka.',
                  'Umiem wystukać proste rytmy. Akompaniowałem(-łam) gromadzie do różnych piosenek.',
                  'Przygotowałem(-łam) koncert z wykorzystaniem niekonwencjonalnych instrumentów (grzebień, piła, pokrywki, puszki z grochem).',
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
                        'Wiem, czym jest pięciolinia, nuta i pauza. Opowiedziałem(-łam) zuchom w kręgu rady, do czego służą.',
                        'Znam podział instrumentów na dęte, perkusyjne i strunowe. Wymieniłem(-łam) przynajmniej jeden instrument z każdej z tych grup.',
                        'Samodzielnie wykonałem(-łam) prosty instrument muzyczny z dostępnych materiałów. Zagrałem(-łam) na nim podczas piosenki śpiewanej przez gromadę.',
                        'Zaprezentowałem(-łam) mojej szóstce trzy przedmioty, które wydają ciekawy dźwięk.'
                      ]),
                  SprawData(
                      id: 'grajek',
                      title: 'Grajek',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, czym jest pięciolinia, nuta, pauza, klucz wiolinowy. Opowiedziałem(-łam) zuchom w kręgu rady, do czego służą. Wyjaśniłem(-łam) na plakacie, czym różni się cała nuta od półnuty, ćwierćnuty i ósemki.',
                        'Znam podział instrumentów na dęte, perkusyjne i strunowe. Wymieniłem(-łam) przynajmniej trzy instrumenty z każdej z tych grup.',
                        'Samodzielnie wykonałem(-łam) prosty instrument muzyczny z dostępnych materiałów. Zagrałem(-łam) na nim podczas piosenki śpiewanej przez gromadę.',
                        'Umiem wystukać prosty rytm. Nauczyłem(-łam) tego młodsze zuchy z gromady i wspólnie stworzyliśmy akompaniament do wybranej piosenki.',
                        'Umiem rozpoznać dźwięki wydawane przez różne przedmioty. Wykorzystałem(-łam) przynajmniej dwa takie dźwięki do wspólnego muzykowania z gromadą.',
                      ]),
                  SprawData(
                      id: 'grajek',
                      title: 'Grajek',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, czym jest pięciolinia, nuta, pauza, klucz wiolinowy. Opowiedziałem(-łam) zuchom w kręgu rady, do czego służą. Wyjaśniłem(-łam), czym różni się cała nuta od półnuty, ćwierćnuty i ósemki, wyklaskując ich wartości.',
                        'Znam podział instrumentów na dęte, perkusyjne i strunowe. Wymieniłem(-łam) przynajmniej pięć instrumentów z każdej z tych grup.',
                        'Samodzielnie wykonałem(-łam) z dostępnych materiałów prosty instrument muzyczny. Zagrałem(-łam) na nim podczas piosenki śpiewanej przez gromadę. Zagrałem(-łam) na nim także wymyśloną przez siebie melodię.',
                        'Umiem wystukać prosty rytm. Nauczyłem(-łam) tego młodsze zuchy z gromady i wspólnie stworzyliśmy akompaniament do wybranej piosenki.',
                        'Umiem rozpoznać dźwięki wydawane przez różne przedmioty. Wykorzystałem(-łam) przynajmniej trzy takie dźwięki do wspólnego muzykowania z gromadą.',
                        'Wraz z szóstką przygotowałem(-łam) koncert niekonwencjonalnych instrumentów. Wykorzystaliśmy podczas niego kilka przedmiotów, które wydają ciekawe dźwięki.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '4',
                requirements: [
                  'Znam rodzaje lalek (pacynki, marionetki, jawajki, kukły, lalki do teatru cieni). Wiem, jak się nimi posługiwać.',
                  'Zaprojektowałem(-łam) lalkę do konkretnego przedstawienia.',
                  'Samodzielnie wykonałem(-łam) lalkę do wybranego rodzaju przedstawienia.',
                  'Przygotowałem(-łam) scenę, stroje i dekoracje do wybranego przedstawienia.',
                  'Zorganizowałem(-łam) przedstawienie dla młodszych kolegów, zuchów z gromady lub rodziców.',
                  'Znam kilka piosenek i wierszy, które można zainscenizować za pomocą lalek.',
                  'Umiem podkładać głos swoim lalkom.',
                ],
                notesForLeaders: [
                  'Sprawność jest przeznaczona dla zuchów zainteresowanych teatrem i lubiących majsterkować. Rozwija zdolności manualne i fantazję oraz pobudza do tworzenia.',
                  'Zuchom nieśmiałym daje okazję do aktywnego włączenia się w artystyczne przedsięwzięcia gromady.',
                  'Zuchowi zainteresowanemu teatrem i plastyką można polecić także sprawności „Mima” i „Dekoratora”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Lalkarza/Lalkarki”: „Zuch pamięta o swoich obowiązkach.”, „Wszystkim jest z zuchem dobrze.”, „Zuch stara się być coraz lepszy”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'lalkarz',
                      title: 'Lalkarz',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam rodzaje lalek i wiem, do jakich przedstawień ich się używa. Zaprezentowałem(-łam) je mojej szóstce w wybranej formie.',
                        'Wykonałem(-łam) wybrany typ lalki.',
                        'Wykonałem(-łam) wybrany element dekoracji do przygotowanego w gromadzie lub szkole przedstawienia.',
                        'Pokazałem(-łam) w kręgu rady, jak podkładam głos mojej lalce.',
                      ]),
                  SprawData(
                      id: 'lalkarz',
                      title: 'Lalkarz',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam rodzaje lalek i wiem, do jakich przedstawień ich się używa. Zaprezentowałem(-łam) je mojej szóstce w wybranej formie.',
                        'Samodzielnie zaprojektowałem(-łam) i wykonałem(-łam) lalkę do wybranego typu przedstawienia.',
                        'Wykonałem(-łam) wybrany element dekoracji i stroju do przygotowanego w gromadzie lub szkole przedstawienia.',
                        'Zaprezentowałem(-łam) gromadzie zainscenizowaną za pomocą lalki piosenkę.',
                        'Zaprezentowałem(-łam) w kręgu rady, jak podkładam głos mojej lalce i jak ją animuję.',
                      ]),
                  SprawData(
                      id: 'lalkarz',
                      title: 'Lalkarz',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam rodzaje lalek i wiem, do jakich przedstawień ich się używa. Zaprezentowałem(-łam) je mojej gromadzie w wybranej formie.',
                        'Samodzielnie zaprojektowałem(-łam) i wykonałem(-łam) lalki do wybranego typu przedstawienia.',
                        'Wykonałem(-łam) wybrany element dekoracji i stroju oraz scenę do przygotowanego w gromadzie lub szkole przedstawienia.',
                        'Zaprezentowałem(-łam) gromadzie kilka piosenek zainscenizowanych za pomocą lalki.',
                        'Przedstawiłem(-łam) w kręgu rady, jak podkładam głos mojej lalce i jak ją animuję. Umiem „zagrać” lalką różne emocje.',
                        'Zorganizowałem(-łam) przedstawienie dla młodszych kolegów i koleżanek, zuchów z gromady lub rodziców.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '5',
                requirements: [
                  'Wiem, czym zajmuje się mim. Widziałem(-łam) przedstawienie pantomimiczne na żywo lub w telewizji.',
                  'Wiem, jak wygląda mim, jaki nosi strój, dlaczego podczas przedstawień ma twarz pomalowaną na biało.',
                  'Wiem, jak ważne są gesty oraz mimika w porozumiewaniu się ludzi. Za ich pomocą wyraziłem(-łam) różne uczucia: smutek, złość, radość, zawstydzenie.',
                  'Przedstawiłem(-łam) za pomocą gestów ręki lub całego ciała kilka scenek z codziennego życia.',
                  'Stale i regularnie ćwiczę moje ciało, by doskonalić się w sztuce mimów. Wymyśliłem(-łam) krótką gimnastykę buzi i języka oraz palców i dłoni.',
                  'Wspólnie z kolegami przygotowałem(-łam) krótki spektakl pantomimiczny.',
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
                        'Opowiedziałem(-łam) szóstce, czym zajmuje się mim, jak się ubiera i jak się charakteryzuje.',
                        'Obejrzałem(-łam) przedstawienie pantomimiczne. Zaprezentowałem(-łam) zuchom w dowolnej formie jego najciekawszy fragment i opowiedziałem(-łam), czego dotyczyło.',
                        'Zagrałem(-łam) dla zuchów z mojej szóstki pantomimę, wyrażając przynajmniej trzy różne uczucia i scenki z życia codziennego.',
                        'Zaprezentowałem(-łam) zuchom wymyśloną przez siebie gimnastykę buzi i języka.',
                      ]),
                  SprawData(
                      id: 'mim',
                      title: 'Mim',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-łam) gromadzie, czym zajmuje się mim, jak się ubiera i jak się charakteryzuje.',
                        'Obejrzałem(-łam) przedstawienie pantomimiczne. Zaprezentowałem(-łam) zuchom w dowolnej formie najciekawszy jego fragment i opowiedziałem(-łam), czego dotyczyło.',
                        'Mam ulubionego mima. Przedstawiłem(-łam) w kręgu rady jego sylwetkę i kilka przedstawień, w których grał.',
                        'Zagrałem(-łam) dla zuchów z mojej gromady pantomimę, wyrażając przynajmniej pięć różnych uczuć i scenek z życia codziennego.',
                        'Zaprezentowałem(-łam) zuchom wymyśloną przez siebie gimnastykę buzi i języka oraz palców i dłoni.',
                        'Razem z szóstką przygotowałem(-łam) krótki spektakl pantomimiczny.',
                      ]),
                  SprawData(
                      id: 'mim',
                      title: 'Mim',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-łam) gromadzie, czym zajmuje się mim, jak się ubiera i jak charakteryzuje.',
                        'Obejrzałem(-łam) przedstawienie pantomimiczne. Zaprezentowałem(-łam) zuchom w dowolnej formie najciekawszy jego fragment i opowiedziałem(-łam), czego dotyczyło.',
                        'Mam swojego ulubionego mima. Przedstawiłem(-łam) w kręgu rady jego sylwetkę i kilka przedstawień, w których grał.',
                        'Zagrałem(-łam) dla zuchów z mojej gromady pantomimę, wyrażając przynajmniej pięć różnych uczuć i scenek z życia codziennego. Nauczyłem(-łam) chętne zuchy wybranych ruchów.',
                        'Zaprezentowałem(-łam) zuchom wymyśloną przez siebie gimnastykę buzi i języka, palców i dłoni oraz ciała.',
                        'Razem z szóstką przygotowałem(-łam) krótki spektakl pantomimiczny.',
                        'Przygotowałem(-łam) zuchy z mojej szóstki do przedstawienia, poprowadziłem(-łam) gimnastykę oraz zaproponowałem(-łam) ruchy i miny.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '6',
                requirements: [
                  'Często słucham muzyki. Mam ulubionego twórcę (wykonawcę).',
                  'Potrafię określić rodzaj muzyki (poważna, ludowa, rozrywkowa).',
                  'Potrafię rozpoznać instrument po brzmieniu.',
                  'Byłem(-łam) na koncercie.',
                  'Umiem zagrać na instrumencie dwie lub trzy proste melodie.',
                  'Potrafię zagrać gamę C-dur, a-moll, zapisać ją i nazwać dźwięki.',
                  'Dbam o własny instrument.',
                  'Wykonałem(-łam) koncert dla mojej gromady.',
                  'Przygotowałem(-łam) akompaniament do występu gromady, klasy lub szkoły.',
                  'Brałem(-łam) udział w muzycznej imprezie szkolnej.',
                ],
                notesForLeaders: [
                  'Sprawność kształtuje zdolności muzyczne i wyrabia wrażliwość na piękno.',
                  'Zuch „Miłośnik/Miłośniczka muzyki” jest znawcą muzyki − jednego lub kilku jej rodzajów (np. pop, rock, muzyka klasyczna, jazz). Potrafi zagrać na jakimś instrumencie. Należy zróżnicować poziom wymagań dla zuchów, które chodzą do szkoły muzycznej i samouków.',
                  'Zadania realizowane przez zucha można wykorzystać np. na uroczystych zbiorkach gromady lub podczas przygotowań do festiwalu piosenki.',
                  'Aby dalej rozwijać zainteresowania zucha, można polecić mu sprawności „Grajka” i „Śpiewaka”.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Miłośnika muzyki”: „Zuch stara się być coraz lepszy”, „Wszystkim jest z zuchem dobrze”.',
                ],
                sprawData: [
                  SprawData(
                      id: 'milosnik_muzyki',
                      title: 'Miłośnik muzyki',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Rozpoznałem(-łam) po brzmieniu trzy instrumenty. Narysowałem(-łam) te instrumenty.',
                        'Zagrałem(-łam) na instrumencie gamę C-dur i jedną melodię.',
                        'Narysowałem(-łam), jak dbam o swój instrument.',
                        'Brałem(-łam) udział w szkolnej imprezie muzycznej. Narysowałem(-łam) obrazek przedstawiający tę imprezę i opowiedziałem(-łam) o niej innym zuchom.',
                      ]),
                  SprawData(
                      id: 'milosnik_muzyki',
                      title: 'Miłośnik muzyki',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zagrałem(-łam) na instrumencie gamę C-dur. Zapisałem(-łam) gamę C-dur na pięciolinii i podpisałem(-łam) dźwięki.',
                        'Narysowałem(-łam), jak dbam o swój instrument.',
                        'Byłem(-łam) na koncercie. Narysowałem(-łam) to i napisałem(-łam), jaka muzyka była wykonywana.',
                        'Mam ulubionego wykonawcę muzyki. Narysowałem(-łam) go i napisałem(-łam), jaki rodzaj muzyki wykonuje.',
                        'Zagrałem(-łam) gromadzie dwie melodie',
                      ]),
                  SprawData(
                      id: 'milosnik_muzyki',
                      title: 'Miłośnik muzyki',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zagrałem(-łam) na instrumencie dwie melodie. Zapisałem(-łam) do nich nuty na pięciolinii i podpisałem(-łam) dźwięki.',
                        'Narysowałem(-łam), jak dbam o swój instrument.',
                        'Byłem(-łam) na koncercie. Narysowałem(-łam) to i napisałem(-łam), jaka muzyka była wykonywana.',
                        'Mam swojego ulubionego wykonawcę muzyki. Opowiedziałem(-łam) o nim na zbiórce i przygotowałem(-łam) krótką audycję muzyczną z melodiami, które wykonuje.',
                        'Przygotowałem(-łam) akompaniament do występu gromady, klasy lub szkoły',
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
                  'Nauczyłem(-łam) inne zuchy podstawowego węzła makramy.',
                  'Wymyśliłem(-łam) własny węzeł przydatny do wykonania makramy.',
                  'Zorganizowałem(-łam) wystawę własnych prac.',
                  'Wykonałem(-łam) element zdobnictwa do wykorzystania w zuchówce.',
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
                        'Wiem, co to jest makrama i do czego można ją wykorzystać. Opowiedziałem(-łam) o tym w kręgu rady.',
                        'Nauczyłem(-łam) się wiązać przynajmniej trzy węzły.',
                        'Nauczyłem(-łam) innego zucha podstawowego węzła makramy.',
                        'Wykonałem(-łam) własną makramę.',
                      ]),
                  SprawData(
                      id: 'mistrz_makramy',
                      title: 'Mistrz makramy',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest makrama i do czego można ją wykorzystać. Opowiedziałem(-łam) o tym w kręgu rady.',
                        'Nauczyłem(-łam) się wiązać przynajmniej trzy węzły.',
                        'Nauczyłem(-łam) inne zuchy podstawowego węzła makramy.',
                        'Dobrałem(-łam) odpowiedni sznurek, aby wykonać makramę.',
                        'Wykorzystałem(-łam) rysunki o sztuce makramy, aby wykonać własną makramę.',
                      ]),
                  SprawData(
                      id: 'mistrz_makramy',
                      title: 'Mistrz makramy',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest makrama i do czego można ją wykorzystać. Opowiedziałem(-łam) o tym w kręgu rady.',
                        'Nauczyłem(-łam) się wiązać przynajmniej trzy węzły.',
                        'Nauczyłem(-łam) inne zuchy podstawowego węzła makramy.',
                        'Wymyśliłem(-łam) własny węzeł przydatny do wykonania makramy.',
                        'Zorganizowałem(-łam) wystawę własnych prac makramy.',
                        'Wykonałem(-łam) element zdobnictwa do wykorzystania w zuchówce',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '8',
                requirements: [
                  'Wiem, skąd wywodzi się origami. Przygotowałem(-łam) plakat lub opowiedziałem(-łam) o tym swojej szóstce.',
                  'Zgromadziłem(-łam) zbiór ilustracji i opisy nowych figur.',
                  'Znam podstawy origami (bazy wyjściowe, np. lody). Zaprezentowałem(-łam) je na zbiórce lub w klasie.',
                  'Nauczyłem(-łam) inne zuchy składać figury.',
                  'Wymyśliłem(-łam) własną figurę.',
                  'Stale poszerzam kolekcję własnoręcznie wykonanych prac. Zorganizowałem(-łam) wystawę zuchowych prac origami.',
                  'Upiększyłem(-łam) swój pokój, zuchówkę, klasę lub inne wybrane miejsce własnoręcznie wykonanymi figurami.',
                  'Podczas teatru wykorzystałem(-łam) lalki wykonane techniką origami.',
                  'Zorganizowałem(-łam) konkurs na najładniejszą i najciekawszą figurę origami.',
                  'Wykonałem(-łam) techniką origami upominek dla kogoś bliskiego.',
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
                        'Przygotowałem(-łam) plakat dotyczący sztuki origami, przedstawiający jej historię i pochodzenie.',
                        'Zgromadziłem(-łam) zbiór ilustracji i opisy nowych figur.',
                        'Znam podstawy origami i zaprezentowałem(-łam) je swojej szóstce.',
                        'Upiększyłem(-łam) swój pokój figurami wykonanymi z origami.',
                      ]),
                  SprawData(
                      id: 'mistrz_origami',
                      title: 'Mistrz origami',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaprezentowałem(-łam) na zbiórce historię i pochodzenie origami',
                        'Zgromadziłem(-łam) zbiór ilustracji i opisy nowych figur.',
                        'Znam podstawy origami (bazy wyjściowe, np. lody). Zaprezentowałem(-łam) je na zbiórce lub w klasie.',
                        'Zorganizowałem(-łam) wystawę swoich prac wykonanych techniką origami.',
                        'Upiększyłem(-łam) zuchówkę pracami wykonanymi techniką origami.',
                        'Podczas teatru wykorzystałem(-łam) lalki wykonane techniką origami.'
                      ]),
                  SprawData(
                      id: 'mistrz_origami',
                      title: 'Mistrz origami',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zaprezentowałem(-łam) na zbiórce historię i pochodzenie origami.',
                        'Zgromadziłem(-łam) zbiór ilustracji i opisy nowych figur.',
                        'Znam podstawy origami (bazy wyjściowe, np. lody). Zaprezentowałem(-łam) je na zbiórce lub w klasie.',
                        'Nauczyłem(-łam) inne zuchy składać figury.',
                        'Wymyśliłem(-łam) własną figurę i zaprezentowałem na zbiórce.',
                        'Zorganizowałem(-łam) wystawę zuchowych prac origami.',
                        'Upiększyłem(-łam) zuchówkę pracami wykonanymi techniką origami.',
                        'Podczas teatru wykorzystałem(-łam) lalki wykonane techniką origami.',
                        'Wykonałem(-łam) techniką origami upominek dla kogoś bliskiego.',
                      ]),
                ]
            ),

            // SprawFamilyData(
            //     id: '',
            //     sprawData: [
            //       SprawData(
            //           id: '',
            //           title: '',
            //           level: '1',
            //           requirements: requirementsCostam,
            //           notesForLeaders: notesForLeadersCostam,
            //           tasksAreExamples: true,
            //           tasks: [
            //             '',
            //           ]),
            //       SprawData(
            //           id: '',
            //           title: '',
            //           level: '2',
            //           requirements: requirementsCostam,
            //           notesForLeaders: notesForLeadersCostam,
            //           tasksAreExamples: true,
            //           tasks: [
            //             ''
            //           ]),
            //       SprawData(
            //           id: '',
            //           title: '',
            //           level: '3',
            //           requirements: requirementsCostam,
            //           notesForLeaders: notesForLeadersCostam,
            //           tasksAreExamples: true,
            //           tasks: [
            //             '',
            //           ]),
            //     ]
            // ),
          ]),

      SprawGroupData(
          id: 'spraw_sportowe',
          title: 'Sportowe',
          tags: ['#aktywność fizyczna', '#rekreacja' '#zdrowa rywalizacja' '#zdrowy tryb życia', '#praca nad sobą', '#ruch to zdrowie', '#w zdrowym ciele zdrowy duch'],
          familyData: [

          ]),

      SprawGroupData(
          id: 'spraw_zaradnosc_zyciowa',
          title: 'Zaradność życiowa',
          tags: ['#samodzielność', '#obowiązkowość', '#rodzina', '#dom', '#empatia', '#umiejętność życia w społeczeństwie', '#zróbtosam'],
          familyData: [

          ]),

      SprawGroupData(
          id: 'spraw_przyrodnicze',
          title: 'Przyrodnicze',
          tags: ['#bliskość natury', '#szacunek do przyrody', '#ekologia', '#natura ', '#las', '#cudnatury'],
          familyData: [

          ]),

      SprawGroupData(
          id: 'spraw_naukowo_hobbystyczne',
          title: 'Naukowo-hobbystyczne',
          tags: ['#ciekawość świata', '#różnorodność', '#kultura', '#nauka', '#praca nad sobą', '#zawody', '#pasje', '#pomysłowość'],
          familyData: [

          ]),

      SprawGroupData(
          id: 'spraw_spoleczno_obywatelskie',
          title: 'Społeczno-obywatelskie',
          tags: ['#ojczyzna', '#służba', '#empatia', '#praca nad sobą', '#umiejętność życia w społeczeństwie', '#mała ojczyzna'],
          familyData: [

            SprawFamilyData(
                id: '1',
                requirements: [
                  'Opowiedziałem(-łam) bajkę młodszym dzieciom.',
                  'Opiekowałem(-łam) się młodszymi dziećmi.',
                  'Stworzyłem(-łam) zbiór gier i zabaw. Zgromadziłem(-łam) w nim gry, ćwiczenia, zabawy i pląsy, które zaproponowałem(-łam) młodszym dzieciom.',
                  'Nauczyłem(-łam) pląsu młodsze rodzeństwo lub dzieci, którymi się opiekuję.',
                  'Zorganizowałem(-łam) na podwórku zabawę dla młodszych dzieci. Naprawiłem(-łam) zepsute zabawki.',
                  'Naprawiłem(-łam) zepsute zabawki.',
                  'Wykonałem(-łam) zabawkę (puzzle, kukiełkę).',
                  'Udzieliłem(-łam) pierwszej pomocy przy skaleczeniu.',
                  'Ubrałem(-łam) i uczesałem(-łam) młodsze dziecko.',
                  'Opiekowałem(-łam) się osobą chorą lub starszą.',
                ],
                notesForLeaders: [
                  'Sprawność uczy zucha pomocy i wrażliwości na innych. Dzięki realizowanym zadaniom zuch może poczuć się ważny i potrzebny.',
                  'Zuch zdobywający sprawność systematycznie zajmuje się młodszym rodzeństwem lub inną osobą potrzebującą opieki.',
                  'Zadania należy dobrać w taki sposób, aby były dla zucha czymś więcej niż codziennym obowiązkiem nałożonym przez rodziców.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Dobrego opiekuna/Dobrej opiekunki”: „Wszystkim jest z zuchem dobrze.”, „Zuch stara się być coraz lepszy.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'dobry_opiekun',
                      title: 'Dobry opiekun/Dobra opiekunka',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Nauczyłem(-łam) pląsu młodsze rodzeństwo lub dzieci, którymi się opiekuję.',
                        'Zorganizowałem(-łam) na podwórku zabawę dla młodszych dzieci.',
                        'Naprawiłem(-łam) zepsutą zabawkę.',
                        'Opiekowałem(-łam) się młodszymi dziećmi.',
                      ]),
                  SprawData(
                      id: 'dobry_opiekun',
                      title: 'Dobry opiekun/Dobra opiekunka',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-łam) bajkę młodszym dzieciom.',
                        'Stworzyłem(-łam) zbiór gier i zabaw. Zgromadziłem(-łam) w nim gry, ćwiczenia, zabawy i pląsy, które zaproponowałem(-łam) młodszym dzieciom.',
                        'Wykonałem(-łam) zabawkę (puzzle, kukiełkę).',
                        'Udzieliłem(-łam) pierwszej pomocy przy skaleczeniu.',
                        'Opiekowałem(-łam) się młodszymi dziećmi.',
                        'Pełniłem(-łam) rolę opiekuna młodszego zucha na wyjeździe z gromadą.',
                      ]),
                  SprawData(
                      id: 'dobry_opiekun',
                      title: 'Dobry opiekun/Dobra opiekunka',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opowiedziałem(-łam) bajkę młodszym dzieciom.',
                        'Stworzyłem(-łam) zbiór gier i zabaw. Zgromadziłem(-łam) w nim gry, ćwiczenia, zabawy i pląsy, które zaproponowałem(-łam) młodszym dzieciom.',
                        'Opiekowałem(-łam) się młodszymi dziećmi.',
                        'Udzieliłem(-łam) pierwszej pomocy przy skaleczeniu.',
                        'Ubrałem(-łam) i uczesałem(-łam) młodsze dziecko.',
                        'Opiekowałem(-łam) się osobą chorą lub starszą.',
                        'Pełniłem(-łam) rolę opiekuna młodszego zucha na wyjeździe z gromadą.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '2',
                requirements: [
                  'Znam pięć kolęd. Umiem je zaśpiewać.',
                  'Wiem, co symbolizują kolędy.',
                  'Brałem(-łam) udział w jasełkach.',
                  'Potrafię powiedzieć, jakie postacie są prezentowane przez kolędników i dlaczego. Samodzielnie lub z pomocą rodzica przygotowałem(-łam) sobie strój kolędnika.',
                  'Zaprezentowałem(-łam) swój strój i kolędę na zbiórce wigilijnej.',
                  'W okresie świątecznym razem z kolegami i koleżankami chodziłem(-łam) i kolędowałem(-łam), niosąc radość ludziom w mojej okolicy.',
                  'Wiem, jak dawniej wyglądało kolędowanie na terenach, na których mieszkam. Dowiedziałem(-łam) się, jakie panowały wtedy obrzędy i zwyczaje świąteczne.',
                  'Nauczyłem(-łam) inne zuchy przynajmniej jednej kolędy.',
                  'Mam śpiewnik lub nagrania z kolędami.',
                ],
                notesForLeaders: [
                  'Sprawność wpływa na rozwój duchowy dzieci, a także pomaga poznać zwyczaje i obrzędy staropolskie.',
                  'Mimo że „Kolędnik/Kolędniczka” to sprawność indywidualna, zuchy mogą zdobywać ją w grupach, najlepiej w szóstkach – w ten sposób łatwiej im będzie przygotować przedstawienie. Przy zdobywaniu sprawności zuchom potrzebna jest znaczna pomoc kadry gromady.',
                  'Należy zwrócić szczególną uwagę na bezpieczeństwo zuchów podczas kolędowania, dlatego najlepiej odwiedzać rodziny zuchów i przyjaciół gromady, poruszając się w okolicy, którą dzieci dobrze znają.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Kolędnika/Kolędniczki”: „Zuch kocha Boga i Polskę”, „Wszystkim jest z zuchem dobrze.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'kolednik',
                      title: 'Kolędnik/Kolędniczka',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Potrafię zaśpiewać trzy kolędy. Zapisałem(-łam) ich tytuły.',
                        'Brałem(-łam) udział w jasełkach.',
                        'Brałem(-łam) udział w kolędowaniu np. na zbiórce wigilijnej gromady lub w szkole.',
                        'Narysowałem(-łam) postacie trzech kolędników. Podpisałem(-łam), jak się nazywają.',
                        'Mam swój śpiewnik lub nagrania z kolędami. Zaprezentowałem(-łam) go/je na zbiórce.',
                      ]),
                  SprawData(
                      id: 'kolednik',
                      title: 'Kolędnik/Kolędniczka',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Potrafię zaśpiewać pięć kolęd. Zapisałem(-łam) ich tytuły.',
                        'Brałem(-łam) udział w jasełkach.',
                        'W okresie świątecznym wspólnie z kolegami i koleżankami chodziłem(-łam) i kolędowałem(-łam), niosąc radość ludziom w mojej okolicy.',
                        'Narysowałem(-łam) postacie pięciu kolędników. Podpisałem(-łam), jak się nazywają.',
                        'Mam swój śpiewnik lub nagrania z kolędami. Zaprezentowałem(-łam) go/je na zbiórce.',
                      ]),
                  SprawData(
                      id: 'kolednik',
                      title: 'Kolędnik/Kolędniczka',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Potrafię zaśpiewać pięć kolęd. Nauczyłem(-łam) jednej kolędy młodsze zuchy.',
                        'Brałem(-łam) udział w jasełkach.',
                        'Opowiedziałem(-łam) młodszym zuchom, jak w dawnych czasach wyglądała tradycja kolędowania.',
                        'Samodzielnie lub z pomocą rodzica przygotowałem(-łam) sobie strój kolędnika. Zaprezentowałem(-łam) go na zbiórce.',
                        'W okresie świątecznym wspólnie z kolegami i koleżankami chodziłem(-łam) i kolędowałem(-łam), niosąc radość ludziom w mojej okolicy.',
                        'Mam swój śpiewnik lub nagrania z kolędami. Zaprezentowałem(-łam) go/je na zbiórce.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                requirements: [
                  'Znam symbole narodowe i hymn Polski.',
                  'Wiem, gdzie znajduje się urząd miasta lub gminy. Byłem(-łam) w nim.',
                  'Z gromadą lub rodziną brałem(-łam) udział w obchodach świąt państwowych.',
                  'Wiem, jak powinien zachowywać się współczesny patriota.',
                  'Znam dokonania sławnych Polaków.',
                  'Wiem, gdzie w mojej okolicy znajdują się miejsca upamiętniające zasłużone postaci lub ważne wydarzenia.',
                  'Pomagam w pożytecznych pracach na rzecz mojej wsi, miasta lub dzielnicy.',
                ],
                notesForLeaders: [
                  'Zdobywając tę sprawność, zuch poznaje swoje środowisko, uczy się dostrzegać problemy rówieśników i wspólnoty lokalnej, a także poszukiwać pokojowych i nowoczesnych rozwiązań. Staje się świadomym i aktywnym uczestnikiem oraz kreatorem życia codziennego w XXI wieku.',
                  'Kadra gromady powinna zwrócić uwagę na fakt, że współczesny patriota to człowiek otwarty, tolerancyjny, dbający o środowisko i język ojczysty, znający historię i kultywujący tradycje. Patriota szanuje swoją małą ojczyznę – rodzinę, nauczycieli, koleżanki i kolegów oraz miejscowość, w której mieszka. Tworzy świat oparty na podstawowych wartościach: wolności, samorządności i demokracji.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Młodego patrioty/Młodej patriotki”: „Zuch pamięta o swoich obowiązkach.”, „Wszystkim jest z zuchem dobrze.”, „Zuch kocha Polskę i czyni dobro.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'mlody_patriota',
                      title: 'Młody Patriota/Młoda Patriotka',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Narysowałem(-łam) flagę i godło Polski. Przedstawiłem(-łam) je w kręgu rady.',
                        'Razem z rodzicami wywiesiliśmy flagę na święto państwowe. Zdjęciem wywieszonej flagi pochwaliłem(-łam) się w kręgu rady.',
                        'Narysowałem(-łam) plakat przedstawiający zasłużonego Polaka/zasłużoną Polkę. Pokazałem(-łam) plakat w kręgu rady.',
                        'Wraz z członkiem rodziny odszukałem(-łam) w Internecie ważne historyczne miejsca w okolicy. Wspólnie je zwiedziliśmy. Narysowałem(-łam) pocztówkę z tej przygody i zaprezentowałem(-łam) ją w kręgu rady.',
                        'Podjąłem (Podjęłam) wyzwanie „wiecznego worka” – w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-łam) worek znalezionymi śmieciami, dbając o czyste środowisko.',
                      ]),
                  SprawData(
                      id: 'mlody_patriota',
                      title: 'Młody Patriota/Młoda Patriotka',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'W kręgu rady opowiedziałem(-łam) legendę o powstaniu Państwa Polskiego.',
                        'Odwiedziłem(-łam) urząd miasta lub gminy. Wiem, jakie sprawy można tam załatwić.',
                        'Pamiętam o wywieszeniu flagi podczas świąt państwowych. Zrobiłem(-łam) zdjęcie wywieszonej flagi i pokazałem(-łam) je w kręgu rady.',
                        'Razem z gromadą uczestniczyłem(-łam) w obchodach święta państwowego. Dowiedziałem(-łam) się, dlaczego radośnie świętujemy ten dzień.',
                        'Nauczyłem(-łam) szóstkę piosenki „Grzeczne słówka” i zaśpiewaliśmy ją całej gromadzie.',
                        'Narysowałem(-łam) plakat przedstawiający dokonania zasłużonego Polaka/zasłużonej Polki. Pokazałem(-łam) plakat w kręgu rady.',
                        'Wraz z członkiem rodziny odszukałem(-łam) w Internecie miejsca ważne historycznie znajdujące się w okolicy. Wspólnie je zwiedziliśmy. Narysowałem(-łam) pocztówkę z tej przygody i zaprezentowałem(-łam) ją w kręgu rady.',
                        'Podjąłem(-łam) wyzwanie „wiecznego worka” – w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-łam) worek znalezionymi śmieciami, dbając o czyste środowisko.',
                      ]),
                  SprawData(
                      id: 'mlody_patriota',
                      title: 'Młody Patriota/Młoda Patriotka',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Znam hymn Polski i wiem, w jaki sposób trzeba zachowywać się podczas jego śpiewania. Zaśpiewałem(-łam) hymn i opowiedziałem(-łam) o tym drużynowemu/drużynowej.',
                        'Odwiedziłem(-łam) urząd miasta lub gminy. Wiem, jakie sprawy można tam załatwić.',
                        'Wiem, kto jest prezydentem Polski i jakie są jego obowiązki.',
                        'Pamiętam o wywieszaniu flagi w święta państwowe. Nakręciłem(-łam) krótki film o tym, dlaczego wywieszamy flagę np. w dniu 11 listopada. Filmik pokazałem(-łam) w kręgu rady.',
                        'Razem z gromadą uczestniczyłem(-łam) w obchodach święta państwowego. Dowiedziałem(-łam) się, dlaczego radośnie świętujemy ten dzień.',
                        'Narysowałem(-łam) plakat przedstawiający dokonania zasłużonego Polaka/zasłużonej Polki. Pokazałem(-łam) plakat w kręgu rady.',
                        'Wraz z członkiem rodziny odszukałem(-łam) w Internecie miejsca ważne historycznie znajdujące się w okolicy. Wspólnie je zwiedziliśmy. Narysowałem(-łam) pocztówkę z tej przygody i zaprezentowałem(-łam) ją w kręgu rady.',
                        'Podjąłem(-łam) wyzwanie „wiecznego worka” – w plecaku lub w kieszeni zawsze mam worek lub siateczkę na śmieci. Podczas spacerów, drogi do domu, szkoły, zbiórki i zabawy na dworze zapełniałem(-łam) worek znalezionymi śmieciami, dbając o czyste środowisko. Zaprosiłem(-łam) do tego wyzwania moją szóstkę.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '4',
                requirements: [
                  'Wiem, co to jest Unia Europejska i po co powstała.',
                  'Znam Hymn Unii Europejskiej.',
                  'Wiem, ile państw należy do Unii Europejskiej. Umiem wymienić dziesięć z nich.',
                  'Wykonałem(-łam) flagę Unii Europejskiej. Wytłumaczyłem(-łam) kolegom, co oznaczają gwiazdki na fladze UE.',
                  'Znam walutę, którą posługuje się większość państw zjednoczonych w UE i potrafię ją odróżnić od innych walut.',
                  'Wiem, gdzie znajduje się siedziba władz UE.',
                  'Znam datę przystąpienia Polski do Unii Europejskiej.',
                ],
                notesForLeaders: [
                  'Sprawność ma uświadomić zuchowi, czym jest Unia Europejska, jakie są jej cele i dlaczego Polska została jej członkiem.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Obywatela/Obywatelki Unii Europejskiej”: „Zuch kocha Polskę i czyni dobro.”, „Zuch pamięta o swoich obowiązkach.”, „Wszystkim jest z zuchem dobrze.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'obywatal_unii_europejskiej',
                      title: 'Obywatel/Obywatelka Unii Europejskiej',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest Unia Europejska i po co powstała. Przygotowałem(-łam) do zuchówki plakat o UE.',
                        'Zaśpiewałem(-łam) Hymn Unii Europejskiej.',
                        'Wykonałem(-łam) flagę Unii Europejskiej. Wyjaśniłem(-łam) swojej szóstce, co oznacza liczba gwiazdek na tej fladze oraz jak nazywa się waluta, którą posługuje się większość państw należących do Unii Europejskiej.',
                      ]),
                  SprawData(
                      id: 'obywatal_unii_europejskiej',
                      title: 'Obywatel/Obywatelka Unii Europejskiej',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest Unia Europejska i po co powstała. Przygotowałem(-łam) do zuchówki gazetkę o UE.',
                        'Zaśpiewałem(-łam) Hymn Unii Europejskiej.',
                        'Wykonałem(-łam) flagę Unii Europejskiej. Wyjaśniłem(-łam) na zbiórce, co oznacza liczba gwiazdek na tej fladze.',
                        'Zaznaczyłem(-łam) na mapie Europy państwa wchodzące w skład Unii Europejskiej.',
                        'Wyjaśniłem(-łam) zuchom, od kiedy Polska należy do Unii Europejskiej.',
                      ]),
                  SprawData(
                      id: 'obywatal_unii_europejskiej',
                      title: 'Obywatel/Obywatelka Unii Europejskiej',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, co to jest Unia Europejska i po co powstała. Przygotowałem(-łam) do zuchówki gazetkę o UE.',
                        'Zaśpiewałem(-łam) Hymn Unii Europejskiej.',
                        'Wykonałem(-łam) flagę Unii Europejskiej. Wyjaśniłem(-łam) swojej szóstce, co oznacza liczba gwiazdek na tej fladze.',
                        'Zaznaczyłem(-łam) na mapie Europy państwa wchodzące w skład Unii Europejskiej oraz siedzibę instytucji UE.',
                        'Opowiedziałem(-łam) zuchom, od kiedy Polska należy do Unii Europejskiej.',
                        'Wiem, jak wygląda waluta Unii Europejskiej. Zaprezentowałem(-łam) ją gromadzie, opowiadając, czym różni się euro w różnych krajach członkowskich.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '5',
                requirements: [
                  'Opiekowałem(-łam) się osobą niepełnosprawną lub starszą.',
                  'Systematycznie odwiedzałem(-łam) osobę niepełnosprawną lub starszą.',
                  'Pomagałem(-łam) odrabiać lekcje koledze/koleżance.',
                  'Opowiedziałem(-łam) o tym, co się dzieje w szkole lub w gromadzie niepełnosprawnemu koledze/koleżance.',
                  'Nauczyłem(-łam) niepełnosprawnego kolegę/koleżankę piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                  'Wspólnie z niepełnosprawnym kolegą/koleżanką zorganizowałem(-łam) coś dla innych dzieci (turniej, zabawy itp.).',
                  'Zrobiłem(-łam) coś miłego dla osoby niepełnosprawnej lub starszej.',
                  'Opowiedziałem(-łam) w gromadzie o moich kontaktach z osobą niepełnosprawną lub starszą.',
                  'Pomogłem(-łam) niepełnosprawnemu koledze/koleżance przyjść na zbiórkę.',
                  'Pomagałem(-łam) w czynnościach życiowych niepełnosprawnej/starszej osobie, np. zrobiłem(-łam) zakupy, czytałem(-łam) niewidomemu.',
                ],
                notesForLeaders: [
                  'Sprawność może zdobywać zuch, który ma kontakt z osobą niepełnosprawną – dorosłą lub rówieśnikiem (w rodzinie, w sąsiedztwie, w klasie lub w gromadzie).',
                  'Podczas zdobywania tej sprawności zuch stara się zrozumieć potrzeby innych, utrwala dobre wzorce zachowań, uczy się odpowiedzialności za podjęte działania.',
                  'Dzięki tej sprawności zuch ma okazję uwrażliwić się na potrzeby innych osób.',
                  'Zuchowi, który wybrał tę sprawność, należy uświadomić, że jego działanie ma charakter ciągły, jest służbą, którą trzeba pełnić systematycznie. Jeśli zuch pomaga osobie spoza gromady, należy ułatwić mu przyprowadzenie tej osoby na zbiórkę i zapewnić jej możliwość normalnego uczestnictwa. W kręgu rady i w innych sprzyjających sytuacjach należy podkreślać wartość działań podejmowanych na rzecz osób niepełnosprawnych.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Przyjaciela/Przyjaciółki Nieznanego Świata”: „Wszystkim jest z zuchem dobrze.”, „Zuch stara się być coraz lepszy.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'przyjaciel_nieznanego_swiata',
                      title: 'Przyjaciel/Przyjaciółka Nieznanego Świata',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Opiekowałem(-łam) się osobą niepełnosprawną lub starszą i pomagałem(-łam) w prostych czynnościach domowych.',
                        'Systematycznie odwiedzałem(-łam) osobą niepełnosprawną lub starszą przez dwa tygodnie.',
                        'Pomagałem(-łam) odrabiać lekcje koledze/koleżance z niepełnosprawnością.',
                        'Opowiedziałem(-łam) o tym, co się dzieje w szkole lub w gromadzie koledze/koleżance z niepełnosprawnością.',
                        'Zrobiłem(-łam) coś miłego dla osoby niepełnosprawnej lub starszej.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_nieznanego_swiata',
                      title: 'Przyjaciel/Przyjaciółka Nieznanego Świata',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Opiekowałem(-łam) się osobą niepełnosprawną lub starszą i pomagałem(-łam) jej w prostych czynnościach domowych.',
                        'Systematycznie odwiedzałem(-łam) osobę niepełnosprawną lub starszą przez miesiąc.',
                        'Nauczyłem(-łam) kolegę/koleżankę z niepełnosprawnością piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                        'Wspólnie z kolegą/koleżanką z niepełnosprawnością zorganizowałem(-łam) coś dla innych dzieci (turniej, zabawy itp.).',
                        'Zrobiłem(-łam) coś miłego dla osoby niepełnosprawnej lub starszej.',
                        'Opowiedziałem/(-łam) o moich kontaktach z osobą niepełnosprawną lub starszą zuchom w gromadzie lub w szóstce.',
                        'Pomogłem(-łam) koledze/koleżance z niepełnosprawnością przyjść na zbiórkę.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_nieznanego_swiata',
                      title: 'Przyjaciel/Przyjaciółka Nieznanego Świata',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Opiekowałem(-łam) się osobą niepełnosprawną lub starszą i pomagałem(-łam) w prostych czynnościach domowych.',
                        'Systematycznie odwiedzałem(-łam) osobą niepełnosprawną lub starszą przez dwa miesiące.',
                        'Nauczyłem(-łam) kolegę/koleżankę z niepełnosprawnością piosenki, pląsu, gry dostosowanej do jego/jej możliwości.',
                        'Wspólnie z kolegą/koleżanką z niepełnosprawnością zorganizowałem(-łam) coś dla innych dzieci (turniej, zabawy itp.).',
                        'Opowiedziałem(-łam) o moich kontaktach z osobą niepełnosprawną lub osobą starszą zuchom w gromadzie lub w szóstce.',
                        'Pomogłem(-łam) koledze/koleżance z niepełnosprawnością przyjść na zbiórkę.',
                        'Pomagałem(-łam) w czynnościach życiowych osobie niepełnosprawnej/starszej (zrobiłem zakupy, czytałem niewidomemu).',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '6',
                requirements: [
                  'Znam kilka kolęd i pieśni adwentowych.',
                  'Spełniłem(-łam) w adwencie kilka dobrych uczynków i podjąłem(-łam) osobiste postanowienie.',
                  'Wspólnie z kolegami wykonałem(-łam) szopkę.',
                  'Uczestniczyłem(-łam) w przedstawieniu jasełek lub kolędowaniu.',
                  'Wykonałem(-łam) lampion dla Światła Betlejemskiego.',
                  'Pełniłem(-łam) straż przy Świetle Betlejemskim. Uczestniczyłem(-łam) w jego przekazywaniu.',
                  'Wykonałem(-łam) kartkę ze świątecznymi życzeniami. Podarowałem(-łam) ją lub wysłałem(-łam) komuś.',
                  'Zaniosłem(-łam) Światło Betlejemskie swojej rodzinie i zadbałem(-łam), by płonęło na wigilijnym stole.',
                ],
                notesForLeaders: [
                  'Sprawność uczy radości dawania, uczynności, braterstwa i pracy nad sobą. Może ją zdobywać każdy zuch w okresie poprzedzającym święta Bożego Narodzenia.',
                  '„Strażnik/Strażniczka Betlejemskiego Światła Pokoju” wie, na czym polega dobre przygotowanie do świąt oraz jak ważne jest podejmowanie osobistych postanowień i ich dotrzymywanie.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Strażnika/Strażniczki Betlejemskiego Światła Pokoju”: „Zuch pamięta o swoich obowiązkach.” , „Zuch stara się być coraz lepszy.” „Wszystkim jest z zuchem dobrze.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'straznik_betlejemskiego_swiatla_pokoju',
                      title: 'Strażnik/Strażniczka Betlejemskiego Światła Pokoju',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Razem z moją gromadą lub klasą wziąłem/wzięłam udział we wspólnym kolędowaniu.',
                        'Spełniłem(-łam) dobry uczynek dla domowników, zuchów z szóstki lub kolegów z klasy.',
                        'Nauczyłem(-łam) szóstkę wybranej kolędy lub pieśni adwentowej.',
                        'Brałem(-łam) udział w przekazaniu Betlejemskiego Światła Pokoju.',
                        'Wykonałem(-łam) lampion dla Światła Betlejemskiego.',
                        'Z pomocą starszego zucha lub dorosłego wykonałem(-łam) i wypisałem(-łam) kartkę świąteczną, którą wysłałem(-łam) do wybranej osoby.',
                      ]),
                  SprawData(
                      id: 'straznik_betlejemskiego_swiatla_pokoju',
                      title: 'Strażnik/Strażniczka Betlejemskiego Światła Pokoju',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Razem z moją gromadą lub klasą uczestniczyłem(-łam) we wspólnym kolędowaniu.',
                        'Spełniłem(-łam) dobry uczynek dla domowników, zuchów z szóstki lub kolegów z klasy.',
                        'W czasie adwentu podjąłem(-łam) osobiste tygodniowe postanowienie.',
                        'Nauczyłem(-łam) gromadę wybranej kolędy lub pieśni adwentowej.',
                        'Brałem(-łam) udział w przekazaniu Betlejemskiego Światła Pokoju.',
                        'Wykonałem(-łam) lampion dla Światła Betlejemskiego.',
                        'Zaniosłem(-łam) Światło Betlejemskie do domu, by płonęło na wigilijnym stole.',
                        'Samodzielnie wykonałem(-łam) i wypisałem(-łam) kartki świąteczne, które wysłałem(-łam) do kilku wybranych osób.',
                        'Uczestniczyłem(-łam) w jasełkach lub innym świątecznym przedstawieniu.',
                      ]),
                  SprawData(
                      id: 'straznik_betlejemskiego_swiatla_pokoju',
                      title: 'Strażnik/Strażniczka Betlejemskiego Światła Pokoju',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Razem z gromadą lub klasą uczestniczyłem(-łam) we wspólnym kolędowaniu.',
                        'Spełniłem(-łam) dobry uczynek dla domowników, zuchów z szóstki lub kolegów z klasy.',
                        'W czasie adwentu podjąłem(-łam) osobiste tygodniowe postanowienie.',
                        'Nauczyłem(-łam) gromadę wybranej kolędy lub pieśni adwentowej.',
                        'Brałem(-łam) udział w przekazaniu Betlejemskiego Światła Pokoju, pełniąc przy tym szczególną rolę.',
                        'Wykonałem(-łam) lampion dla Światła Betlejemskiego.',
                        'Zaniosłem(-łam) Światło Betlejemskie do domu i dbałem(-łam), by płonęło na wigilijnym stole.',
                        'Ułożyłem(-łam) świąteczny wierszyk z życzeniami. Samodzielnie wykonałem(-łam) kartki świąteczne, które wysłałem(-łam) do kilku wybranych osób.',
                        'Brałem(-łam) udział w jasełkach lub innym świątecznym przedstawieniu.',
                        'Poznałem(-łam) historię Betlejemskiego Światła Pokoju. Wiem, skąd pochodzi i jak trafia do Polski. Opowiedziałem(-łam) o nim mojej gromadzie.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '7',
                requirements: [
                  'Znam tradycje związane ze Świętami Wielkanocnymi. Zaprezentowałem(-łam) je kolegom i koleżankom.',
                  'Wiem, na pamiątkę jakiego zdarzenia obchodzi się Święta Wielkanocne. Opowiedziałem(-łam) o tym na zbiórce.',
                  'Wykonałem(-łam) samodzielnie lub z pomocą palmę wielkanocną.',
                  'Pomagałem(-łam) rodzinie w wielkich porządkach przedświątecznych.',
                  'Znam kilka technik wykonywania pisanek i kraszanek. Zrobiłem(-łam) farby do jajek z cebuli, dębu lub zboża.',
                  'Przygotowałem(-łam) wspólnie z rodzicami koszyczek wielkanocny, który poświęciłem(-łam) w Wielką Sobotę.',
                  'Znam tradycję śmigusa-dyngusa. Chętnie brałem(-łam) udział w wielkoponiedziałkowych zabawach. Pamiętałem(-łam) jednak o umiarze w żartach – tak, by nikogo nie skrzywdzić.',
                  'Wiem, dlaczego wielkanocnymi symbolami są: jajko, kurczaczek, baranek i zajączek. Opowiedziałem(-łam) o nich na zbiórce.',
                  'Potrafię wymienić kilka wielkanocnych potraw. Opowiedziałem(-łam) o nich w szóstce.',
                  'Samodzielnie lub z pomocą przygotowałem(-łam) świąteczną babę lub mazurka.',
                  'Przygotowałem(-łam) mapę Polski z zaznaczonymi charakterystycznymi dla danego regionu zwyczajami wielkanocnymi.',
                  'Rozmawiałem(-łam) z rodzicami lub dziadkami na temat zwyczajów wielkanocnych z czasów ich dzieciństwa.',
                  'Znam zwyczaj przynoszenia słodyczy przez wielkanocnego zajączka. Zrobiłem(-łam) miłą niespodziankę komuś bliskiemu.',
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
                        'Znam tradycje związane ze Świętami Wielkanocnymi. Przedstawiłem(-łam) je na plakacie.',
                        'Wykonałem(-łam) samodzielnie lub z pomocą palmę wielkanocną.',
                        'Pomagałem(-łam) rodzinie w wielkich porządkach przedświątecznych.',
                        'Własnoręcznie ozdobiłem(-łam) pisankę dowolną metodą. Zrobiłem(-łam) farby z cebuli, dębu lub zboża.',
                        'Przygotowałem(-łam) wraz z rodzicami koszyczek wielkanocny, który poświęciłem(-łam) w Wielką Sobotę.',
                        'Potrafię wymienić kilka wielkanocnych potraw. Opowiedziałem(-łam) o nich w szóstce.',
                        'Znam zwyczaj przynoszenia słodyczy przez wielkanocnego zajączka. Zrobiłem(-łam) miłą niespodziankę komuś bliskiemu.',
                      ]),
                  SprawData(
                      id: 'wielkanocny_baranek',
                      title: 'Wielkanocny Baranek',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Wiem, na pamiątkę jakiego zdarzenia obchodzi się Święta Wielkanocne. Opowiedziałem(-łam) o tym na zbiórce.',
                        'Wykonałem(-łam) samodzielnie lub z pomocą palmę wielkanocną.',
                        'Pomagałem(-łam) rodzinie w wielkich porządkach przedświątecznych.',
                        'Znam kilka technik wykonywania pisanek i kraszanek. Zrobiłem(-łam) farby z cebuli, dębu lub zboża. Samodzielnie ozdobiłem(-łam) pisankę lub kraszankę.',
                        'Przygotowałem(-łam) wspólnie z rodzicami koszyczek wielkanocny, który poświęciłem(-łam) w Wielką Sobotę.',
                        'Rozmawiałem(-łam) z rodzicami lub dziadkami na temat zwyczajów wielkanocnych z czasów ich dzieciństwa.',
                        'Znam zwyczaj przynoszenia słodyczy przez wielkanocnego zajączka. Zrobiłem(-łam) miłą niespodziankę komuś bliskiemu.',
                      ]),
                  SprawData(
                      id: 'wielkanocny_baranek',
                      title: 'Wielkanocny Baranek',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Wykonałem(-łam) samodzielnie lub z pomocą palmę wielkanocną.',
                        'Pomagałem(-łam) rodzinie w wielkich porządkach przedświątecznych.',
                        'Znam kilka technik wykonywania pisanek i kraszanek. Zrobiłem(-łam) farby z cebuli, dębu lub zboża. Samodzielnie ozdobiłem(-łam) pisankę/kraszankę.',
                        'Przygotowałem(-łam) wspólnie z rodzicami koszyczek wielkanocny, który poświęciłem(-łam) w Wielką Sobotę.',
                        'Samodzielnie lub z pomocą przygotowałem(-łam) świąteczną babę lub mazurka.',
                        'Przygotowałem(-łam) mapę Polski z zaznaczonymi charakterystycznymi dla danego regionu zwyczajami wielkanocnymi.',
                        'Rozmawiałem(-łam) z rodzicami lub dziadkami na temat zwyczajów wielkanocnych z czasów ich dzieciństwa.',
                        'Znam zwyczaj przynoszenia słodyczy przez wielkanocnego zajączka. Zrobiłem(-łam) miłą niespodziankę komuś bliskiemu.',
                      ]),
                ]
            ),


            SprawFamilyData(
                id: '8',
                requirements: [
                  'Zorganizowałem(-łam) teatr min w swojej szóstce.',
                  'Samodzielnie lub z szóstką zaprezentowałem(-łam) krótką scenkę komediową.',
                  'Przeprowadziłem(-łam) w gromadzie konkurs na najładniejszy uśmiech „po cytrynie”.',
                  'Wykonałem(-łam) niezauważony(-na) przynajmniej trzy dobre uczynki, które wywołały uśmiech na czyjejś twarzy. Opowiedziałem(-łam) o tym na zbiórce.',
                  'Zorganizowałem(-łam) kabareton w gromadzie. Zaprosiłem(-łam) do niego rodziców.',
                  'Umiem zachować umiar w swoich żartach, mam poczucie dobrego smaku, nie drwię z nikogo, nie śmieję się z cudzego nieszczęścia. Wszyscy dobrze czują się w moim towarzystwie.',
                  'Stworzyłem(-łam) kodeks lub poradnik „śmieszka/śmieszki”.',
                ],
                notesForLeaders: [
                  'Sprawność pomaga dziecku optymistycznie patrzeć na świat. Uczy radzić sobie z przeciwnościami losu i nie załamywać się w trudnych sytuacjach. Wspiera pozytywne zachowania i pozytywne myślenie oraz postawy koleżeństwa i pomagania innym. Zdobywając ją, zuch powinien nauczyć się umiaru w żartach, a także – kiedy trzeba – zachowania powagi.',
                  'Sprawność ta może być zdobywana przez zucha w każdym wieku, zarówno na kolonii czy biwaku, jak i na zbiórkach.',
                  'Punkty Prawa Zucha, na które zwracamy szczególną uwagę, realizując sprawność „Śmieszka/Śmieszki”: „Wszystkim jest z zuchem dobrze.”, „Zuch stara się być coraz lepszy.”',
                ],
                sprawData: [

                  SprawData(
                      id: 'smieszek',
                      title: 'Śmieszek/Śmieszka',
                      level: '1',
                      tasksAreExamples: true,
                      tasks: [
                        'Zorganizowałem(-łam) teatr min w swojej szóstce.',
                        'Samodzielnie lub z szóstką zaprezentowałem(-łam) krótką scenkę komediową.',
                        'Przeprowadziłem(-łam) w gromadzie konkurs na najładniejszy uśmiech „po cytrynie”.',
                        'Wykonałem(-łam) niezauważony(-na) przynajmniej dwa dobre uczynki, które wywołały uśmiech na czyjejś twarzy. Opowiedziałem(-łam) o tym na zbiórce.',
                        'Brałem(-łam) udział w zabawie „Mój mały, biedny, czarny kotku”, w której powstrzymywałem(-łam) się od śmiechu.',
                      ]),
                  SprawData(
                      id: 'smieszek',
                      title: 'Śmieszek/Śmieszka',
                      level: '2',
                      tasksAreExamples: true,
                      tasks: [
                        'Zorganizowałem(-łam) teatr min w swojej szóstce.',
                        'Samodzielnie lub z szóstką zaprezentowałem(-łam) krótką scenkę komediową.',
                        'Przeprowadziłem(-łam) w gromadzie konkurs na najładniejszy uśmiech „po cytrynie”.',
                        'Wykonałem(-łam) niezauważony(-na) przynajmniej trzy dobre uczynki, które wywołały uśmiech na czyjejś twarzy. Opowiedziałem(-łam) o tym na zbiórce.',
                        'Umiem zachować umiar w moich żartach, mam poczucie dobrego smaku, nie drwię z nikogo, nie śmieję się z cudzego nieszczęścia. Wszyscy dobrze czują się w moim towarzystwie. Ułożyłem(-łam) kodeks lub poradnik „śmieszka/śmieszki”.',
                        'Brałem(-łam) udział w zabawie „Mój mały, biedny, czarny kotku”, w której powstrzymywałem(-łam) się od śmiechu.',
                      ]),
                  SprawData(
                      id: 'smieszek',
                      title: 'Śmieszek/Śmieszka',
                      level: '3',
                      tasksAreExamples: true,
                      tasks: [
                        'Zorganizowałem(-łam) teatr min w swojej szóstce.',
                        'Samodzielnie lub z szóstką zaprezentowałem(-łam) krótką scenkę komediową.',
                        'Przeprowadziłem(-łam) w gromadzie konkurs na najładniejszy uśmiech „po cytrynie”.',
                        'Wykonałem(-łam) niezauważalnie przynajmniej trzy dobre uczynki, które wywołały uśmiech na czyjejś twarzy. Opowiedziałem(-łam) o tym na zbiórce.',
                        'Zorganizowałem(-łam) kabareton w gromadzie. Zaprosiłem(-łam) do niego rodziców.',
                        'Umiem zachować umiar w żartach, mam poczucie dobrego smaku, nie drwię z nikogo, nie śmieję się z cudzego nieszczęścia. Wszyscy dobrze czują się w moim towarzystwie. Ułożyłem(-łam) kodeks lub poradnik „śmieszka/śmieszki”.',
                        'Brałem(-łam) udział w zabawie „Mój mały, biedny, czarny kotku”, w której powstrzymywałem(-łam) się od śmiechu.',
                      ]),
                ]
            ),

          ]),

    ]
).build();
