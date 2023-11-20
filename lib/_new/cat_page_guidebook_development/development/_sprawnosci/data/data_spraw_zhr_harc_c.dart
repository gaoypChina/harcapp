import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_group.dart';

SprawBook sprawBookZHRC = SprawBookData(
    id: SprawBookData.ZHR_HARC_C,
    org: Org.zhr_c,
    title: 'Sprawności harcerzy ZHR',
    source: 'Sprawności harcerzy, Związek Harcerstwa Rzeczpospolitej, 1 czerwca 2020',
    color: SprawBookData.SPRAW_BOOK_ZHR_H_RZE_COLOR,
    icon: SprawBookData.SPRAW_BOOK_ZHR_H_RZE_ICON,
    male: true,
    groupData: [

      SprawGroupData(
          id: 'ozdobnictwo_i_przyroda',
          title: 'Obozownictwo i przyroda',
          familyData: [
            SprawFamilyData(
                id: 'rozpalanie_ognia',
                title: 'Rozpalanie ognia',
                tags: ['#ogień', '#woda', '#wiatr', '#las', '#spryt', '#survival', '#technika', '#obrzęd', '#oddech', '#odpowiedzialność', '#narzędzia'],
                fragment: 'Tu zapalimy ognisko – rzekł wódz. Na hasło to cała gromada rozbiega się, by poszukać materiału potrzebnego do budowy ogniska. Wódz zaznacza pierwszy krąg – Krąg Ognia. Koło ułożone z kamieni, symbol doskonałości, koło życia. W kręgu tym zapalą ogień – Symbol Kultu, Wielkiej Mocy (dawne ogniska ofiarne). W kręgu tym dzieją się najważniejsze obrzędy harcerskie: przyrzeczenie i nadanie miana wodzowi. Do kręgu nie wejdzie nikt do tego nieuprawniony. Do ognia nikt śmieci dorzucać nie będzie, nie wolno tam także podgrzewać strawy.',
                fragmentAuthor: 'Leopold Ungeheuer, „Próby Wodzów”',
                sprawData: [

                  SprawData(
                      id: 'plomien',
                      title: 'Płomień',
                      level: 1,
                      tasks: [
                        'Umie ułożyć i rozpalić ognisko.',
                        'Potrafi umiejętnie podkładać drwa lub gałęzie, regulując wysokość płomienia i ograniczając iskrzenie.',
                        'Umie zatrzeć ślady ogniska po jego całkowitym wygaszeniu.',
                        'Potrafi obchodzić się z ogniem ostrożnie. Umie posługiwać się podstawowym sprzętem gaśniczym oraz wezwać straż pożarną.',
                      ]
                  ),

                  SprawData(
                      id: 'straznik_ognia',
                      title: 'Strażnik Ognia',
                      level: 2,
                      tasks: [
                        'Potrafi ułożyć i rozpalić różne typy ognisk, takie jak ognisko do gotowania, do podtrzymania żaru, do oświetlenia kręgu, stos na mokry teren.',
                        'Umie podtrzymywać ogień odpowiednio do potrzeb i sytuacji. Zna zasady zachowania w kręgu ogniskowym.',
                        'Potrafi przygotować drewno przed ogniskiem: porąbać lub połamać odpowiedni zapas i przygotować rozpałkę odpowiednią do warunków.',
                        'Umie zabezpieczyć przybory do rozpalania ognia przed deszczem i wilgocią.',
                        'Potrafi rozpoznać i opatrzyć oparzenia różnych stopni, posiada sprawność *Higienisty ze ścieżki „Samarytanka”.'
                      ]
                  ),

                  SprawData(
                      id: 'ogniowiec',
                      title: 'Ogniowiec',
                      level: 3,
                      tasks: [
                        'Umie rozpalić ogień w niesprzyjających warunkach (np. w ulewnym deszczu, przy silnym wietrze lub w głębokim śniegu).',
                        'Potrafi rozpalić ogień bez zapałek, samodzielnie wykonanym narzędziem (np. łukiem ogniowym lub własnoręcznie zrobionym krzesiwem).',
                        'Umie wykorzystać specyficzne cechy różnych rodzajów i gatunków drewna do rozpalania i podtrzymywania ognia.',
                        'Potrafi przygotować pochodnię, która będzie płonęła 2 godziny.',
                        'Umie posłużyć się kilkoma rodzajami podręcznych środków gaśniczych, w tym gaśnicami różnych typów. Wie, jakie środki gaśnicze stosować w różnych sytuacjach.'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'orientacja_w_terenie',
                title: 'Orientacja w terenie',
                tags: ['#szlak', '#mapa', '#droga', '#obserwacja', '#las', '#spryt', '#góry', '#technika', '#pamięć', '#wyobraźnia'],
                fragment: 'Zorientowanie się w nieznanej okolicy, czyli zdanie sobie dokładnie sprawy, gdzie się w danej chwili znajduję, przedstawia nieraz wielkie trudności. Nie zawsze dysponuje się mapą, która w wysokim stopniu orientację ułatwia, nieraz tylko pobieżnym szkicem okolicy. Często otrzymuje się tylko bardzo ogólne objaśnienie o drodze, nie posiada się nawet kompasu i jest się zdanym na swój własny zmysł orientacyjny.',
                fragmentAuthor: 'Zygmunt Wyrobek, „Harcerz w polu”',
                sprawData: [

                  SprawData(
                      id: 'obserwator',
                      title: 'Obserwator',
                      level: 1,
                      tasks: [
                        'Umie posłużyć się mapą papierową (tj. zorientować ją i odczytać), żeby trafić za dnia do wyznaczonego miejsca.',
                        'Potrafi wyznaczyć kierunki świata według busoli, słońca (w dzień) i gwiazd (w nocy).',
                        'Umie ocenić przebytą odległość, mierząc ją krokami.',
                      ]
                  ),

                  SprawData(
                      id: 'terenoznawca',
                      title: 'Terenoznawca',
                      level: 2,
                      tasks: [
                        'Potrafi w dzień i w nocy odnaleźć się na mapie w nieznanym terenie według ukształtowania terenu i przedmiotów terenowych (np. skrzyżowań, budowli, cieków wodnych).',
                        'Umie zmierzyć odległość na mapie i trafnie ocenić odległość „na oko” w terenie.',
                        'Potrafi nanieść na mapę trasę wędrówki, narysować szkic terenu i przebytej drogi.',
                        'Umie zapamiętać trasę zaznaczoną na mapie, a następnie bez pomocy mapy ją pokonać.'
                      ]
                  ),

                  SprawData(
                      id: 'topograf',
                      title: 'Topograf',
                      level: 3,
                      tasks: [
                        'Potrafi wykonać odpowiednie pomiary i staranny szkic wskazanego terenu z zachowaniem skali.',
                        'Potrafi zmierzyć wysokość drzewa i szerokość rzeki bez użycia specjalistycznych narzędzi.',
                        'Umie posłużyć się dalmierzem lub niwelatorem.',
                        'Potrafi z pamięci narysować dokładny szkic przebytej drogi.'
                      ]
                  ),

                  SprawData(
                      id: 'mistrz_orientacji',
                      title: 'Mistrz Orientacji',
                      level: 3,
                      tasks: [
                        'Umie w każdych warunkach trafić do wyznaczonego miejsca – w dzień i w nocy, w górach i na nizinie, niezależnie od warunków pogodowych i pory roku, z pomocą map, lokalizatora GPS, kompasu albo bez nich.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'samarytanka',
                title: 'Samarytanka',
                tags: ['#pomoc', '#technika', '#odpowiedzialność', '#narzędzia', '#obserwacja', '#opanowanie', '#survival'],
                fragment: 'Lecz Kmicic sam pić nie mógł, bo i mówił nawet z trudnością - tak mu rana dolegała. Widząc to, stary rzekł: — Nie idzie miód na ranę, chybaby samą zalać, żeby się prędzej wypaliła. Wasza miłość pozwoli obejrzeć i opatrzyć, bo to ja się nie gorzej cyrulika znam na tym? Kmicic zgodził się, więc Kiemlicz zdjął obwiązki i począł patrzeć pilnie. — Skóra starta, nic to! Kula po wierzchu przeszła, ale przecie napuchło. — Toteż jeno dlatego dolega. — Ale to i dwóch dni nie ma. Matko Najświętsza! Musiał ktoś okrutnie blisko do waszej miłości strzelić. — A po czym miarkujesz? — Bo się i wszystek proch nie zdążył spalić i ziarnka, jako czarnuszka, pod skórą siedzą. To waszej miłości już zostanie. Teraz jeno chleba z pajęczyną przyłożyć. Okrutnie blisko ktoś strzelił, dobrze, że waszej miłości nie zabił! — Nie było mi jeszcze pisane. Zagniećże chleba z pajęczyną, panie Kiemlicz, i przyłóż co prędzej, bo mam z tobą pogadać, a szczęki bolą.',
                fragmentAuthor: 'Henryk Sienkiewicz, „Potop”',
                sprawData: [

                  SprawData(
                      id: 'higienista',
                      title: 'Higienista',
                      level: 1,
                      tasks: [
                        'Potrafi opatrzyć drobne zranienie, oparzenie i lekki uraz.',
                        'Umie ułożyć poszkodowanego w pozycji bezpiecznej.',
                        'Zna numery alarmowe i potrafi wezwać pomoc w różnych sytuacjach.',
                      ]
                  ),

                  SprawData(
                      id: 'sanitariusz',
                      title: 'Sanitariusz',
                      level: 2,
                      tasks: [
                        'Umie zaradzić w sytuacji wyziębienia, udaru cieplnego, omdlenia i oparzeń.',
                        'Potrafi zaradzić w przypadku urazu kończyny (np. skręcenie lub złamanie), a w razie konieczności umie ją unieruchomić przy pomocy improwizowanego sprzętu.',
                        'Umie poprawnie przeprowadzić resuscytację krążeniowo-oddechową.',
                        'Potrafi skompletować apteczkę zastępu na całodniową wycieczkę i korzystać z jej zawartości.'
                      ]
                  ),

                  SprawData(
                      id: 'ratownik',
                      title: 'Ratownik',
                      level: 3,
                      tasks: [
                        'Potrafi pokierować małym zespołem sanitariuszy w czasie akcji ratowniczej.',
                        'Umie udzielić pierwszej pomocy w przypadku ran i krwotoków.',
                        'Potrafi postępować w przypadku podejrzenia urazu kręgosłupa. Umie unieruchomić kończynę przy pomocy szyny (np. szyny Kramera lub szyny typu Splint).',
                        'Potrafi rozpoznać objawy udaru mózgu i zawału serca.',
                        'Umie zebrać informacje od osoby poszkodowanej według schematu SAMPLE.',
                        'Podczas ćwiczeń potrafi przeprowadzić triaż – segregację medyczną poszkodowanych.',
                        'Potrafi poprawnie się zachować w razie wypadku komunikacyjnego (np. samochodowego).',
                        'Umie skompletować apteczkę drużyny i określić sposób przechowywania leków.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'musztra',
                title: 'Musztra',
                tags: ['#porządek', '#współpraca', '#zespół', '#karność', '#rytm', '#melodia', '#pamięć', '#dyscyplina', '#słowo', '#oddech', '#zasady'],
                fragment: '– Bij! Zabij! Na pohybel . . . . . ! – A równo mi! – ryczał Barclay Els – Równy krok! Dzierż szyk! I kupą! Kupą! Nie uwierzą mi, pomyślał kornet Aubry. Nigdy mi nie uwierzą, gdy będę o tym opowiadał. Ten czworobok walczy w pełnym okrążeniu… Otoczony ze wszystkich stron kawalerią, szarpany, sieczony, tłuczony i dźgany… I ten czworobok idzie. Idzie, równy, zwarty, pawęż przy pawęży. Idzie, depcząc i przestępując trupy, pcha przed sobą konnicę, pcha przed sobą elitarną dywizję „Ard Feainn”… I idzie! – Bij! – Równy krok! Równy krok! – Ryczał Barclay Els. – Dzierż szyk! Pieśń, . . . . . , pieśń! Nasza pieśń! Naprzód, Mahakam! Z kilku tysięcy krasnoludzkich gardeł wydarła się słynna mahakamska pieśń bojowa. Hooouuuu! Hooouuu! Hou! Czekajcie, klienty! Wnet wam pójdzie w pięty! Rozleci się ten . . . . . Aż po fundamenty! Hoooouuuu! Hooouuu! Hou!',
                fragmentAuthor: 'Andrzej Sapkowski, „Pani Jeziora” (Saga o Wiedźminie)',
                sprawData: [
                  SprawData(
                      id: 'mistrz_musztry',
                      title: 'Mistrz musztry',
                      level: 1,
                      tasks: [
                        'Umie prawidłowo wykonać wszystkie komendy musztry harcerskiej w czasie zbiórki, apelu i przemarszu.',
                        'Potrafi zadbać o wygląd i czystość swojego munduru, a także wytłumaczyć symbolikę jego elementów.',
                        'Potrafi stawić się na zbiórkę alarmową w wyznaczonym czasie.',
                      ]
                  ),

                  SprawData(
                      id: 'chorazy',
                      title: 'Chorąży',
                      level: 2,
                      tasks: [
                        'Umie poruszać się i wykonywać chwyty sztandarem lub proporcem zgodnie z regulaminem musztry.',
                        'Potrafi bezpiecznie przechowywać i zadbać o proporzec lub sztandar, zarówno w warunkach polowych, jak i w harcówce lub w domu.',
                        'Umie wyjaśnić symbolikę proporca lub sztandaru, który mu powierzono.',
                      ]
                  ),

                  SprawData(
                      id: 'dowodca',
                      title: 'Dowódca',
                      level: 3,
                      tasks: [
                        'Potrafi poprowadzić apel drużyny zgodnie z regulaminem musztry.',
                        'Umie dowodzić drużyną podczas przemarszu, uroczystości lub pokazu musztry.',
                        'Potrafi sprawnie zwołać i opanować drużynę w czasie paniki lub zamieszania.',
                        'Umie zaplanować i zorganizować udział sztandaru w przemarszu lub uroczystości.'
                      ]
                  ),

                  SprawData(
                      id: 'dobosz',
                      title: 'Dobosz',
                      level: 3,
                      tasks: [
                        'Potrafi dobrać i nadać kolumnie odpowiednie tempo wybijając rytm na instrumencie perkusyjnym w marszu.',
                        'Potrafi poprowadzić asystę perkusyjną, wybijając odpowiedni rytm na wejście pocztu sztandarowego, złożenie wieńca i apel poległych.',
                        'Posiada sprawność * Muzykanta ze ścieżki „Gra na instrumentach”.',
                      ]
                  ),

                  SprawData(
                      id: 'trebacz',
                      title: 'Trębacz',
                      level: 3,
                      tasks: [
                        'Zna i umie zagrać kilka sygnałów Wojska Polskiego np. Pobudkę, Baczność, Spocznij, Hasło Wojska Polskiego.',
                        'Potrafi zastosować odpowiednie sygnały do kierowania drużyną.',
                        'Posiada sprawność *Muzykanta ze ścieżki „Gra na instrumentach”.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'lacznosc',
                title: 'Łączność',
                tags: ['#pamięć', '#rozmowa', '#współpraca', '#odpowiedzialność', '#technika', '#słowo', '#technologia', '#obserwacja'],
                fragment: 'Łączność w wojsku podczas wojennych wypadków jest taką samą bronią jak armata, karabin maszynowy, jak kuchnia polowa, jak wóz amunicyjny kompanji. Jest nawet więcej i więcej znaczy dla działań wojennych niż te wszystkie wymienione rodzaje służb czy broni. Bez łączności bowiem niema i być nie może skoordynowanej pracy wojska, niema i być nie może złączenia wysiłków krwawych żołnierza dla odniesienia zwycięstwa i krew ludzka leje się darmo, leje się niepotrzebnie, tak jak w jakiejś awanturze karczemnej, bezcelowo i bez żadnej korzyści dla celu postawionego wojsku: szukania zwycięstwa nad nieprzyjacielem. Dlatego też powtarzać zawsze będę, że lepsza jest dobra łączność niż armata, niż karabin maszynowy, niż kuchnia polowa i wóz amunicyjny.',
                fragmentAuthor: 'Józef Piłsudski, rozkaz z 27 marca 1929',
                sprawData: [
                  SprawData(
                      id: 'lacznik',
                      title: 'Łącznik',
                      level: 1,
                      tasks: [
                        'Umie bezbłędnie zapamiętać i przenieść wiadomość ustną złożoną z kilkunastu słów.',
                        'Potrafi zaszyfrować i odczytać wiadomość trzema różnymi szyframi.',
                      ]
                  ),

                  SprawData(
                      id: 'sygnalista',
                      title: 'Sygnalista',
                      level: 2,
                      tasks: [
                        'Umie nadać i odebrać wiadomość zakodowaną alfabetem Morse’a przy pomocy chorągiewek, sygnałów dźwiękowych oraz świetlnych. Umie wykonać prowizoryczny sygnalizacyjny (np. chorągiewkę lub pochodnię).',
                        'Potrafi zakodować i rozkodować wiadomość przy pomocy alfabetu Morse’a.',
                        'Umie obsługiwać radiotelefon lub telefon polowy.',
                        'Potrafi wymyślić własny szyfr i nauczyć go kolegów.'
                      ]
                  ),

                  SprawData(
                      id: 'lacznosciowiec',
                      title: 'Łącznościowiec',
                      level: 3,
                      tasks: [
                        'Umie zorganizować w terenie sprawną sieć łączności opartą na urządzeniach kablowych lub radiowych: przygotować i rozstawić sprzęt, ustalić zasady korzystania z sieci, przeszkolić operatorów.',
                        'Potrafi zorganizować kilkuosobową stację sygnalizacyjną do płynnego nadawania i odbierania wiadomości alfabetem Morse’a: wyznaczyć zadania, podzielić i zorganizować pracę.',
                        'Umie złamać prosty szyfr (np. szyfr Cezara).',
                      ]
                  ),

                  SprawData(
                      id: 'krotkofalarz',
                      title: 'Krótkofalarz',
                      level: 3,
                      tasks: [
                        'Potrafi posłużyć się alfabetem fonetycznym ICAO (tzw. alfabet fonetyczny NATO) oraz jego polskim odpowiednikiem.',
                        'Zna kilkanaście kodów Q najczęściej używanych przez krótkofalarzy oraz kilka wyrażeń z tzw. slangu amatorskiego. Umie przekazać raport RST oraz informacje o własnym QTH Locator.',
                        'Potrafi obsługiwać sprzęt łączności z zachowaniem zasad BHP.',
                        'Umie zmierzyć prąd, napięcie, WFS oraz moc wychodzącą do anteny. Posiada sprawność *Diodaka ze ścieżki „Elektrotechnika”.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'biwakowanie',
                title: 'Biwakowanie',
                tags: ['#plecak', '#natura', '#las', '#współpraca', '#survival', '#dzikość', '#góry', '#zima', '#technika', '#ogień', '#mapa', '#narzędzia'],
                fragment: 'Osobiście nie dostrzegam niczego przyjemnego w biwakowaniu na świeżym powietrzu. Na kemping nie dowożą pizzy, a po krzakach włóczą się podejrzane stwory. Nie mówiąc już o tym, że telewizory na baterie mają słaby odbiór. No i jeszcze te ohydne robale. Bzyczą, skradają się i pełzają. Są bardziej natrętne niż najgorsi akwizytorzy. I po co komu ognisko? W domu mam piekarnik, w którym można upiec trzy kilo ziemniaków i żadnego nie spalić. Jedźcie na biwak sami. Jeżeli będę chciał nocować w ekstremalnych warunkach, wybiorę hotel bez obsługi pokoi.',
                fragmentAuthor: 'kot Garfield. Mark Acey, Scott Nickel, „Alfabet Garfielda”',
                sprawData: [

                  SprawData(
                      id: 'biwakowicz',
                      title: 'Biwakowicz',
                      level: 1,
                      tasks: [
                        'Umie dobrze spakować się na biwak.',
                        'Potrafi rozbić namiot turystyczny.',
                        'Umie zapewnić sobie komfort cieplny podczas biwakowania, m.in. poprzez odpowiednią izolację od ziemi, wybór śpiwora dopasowanego do temperatury.',
                        'Potrafi zbudować kuchnię polową i zagotować na niej wodę.'
                      ]
                  ),

                  SprawData(
                      id: 'traper',
                      title: 'Traper',
                      level: 2,
                      tasks: [
                        'Umie przygotować namiot na różne warunki atmosferyczne takie jak mocny wiatr czy burza oraz odpowiednio wybrać i przygotować miejsce do jego rozstawienia.',
                        'Umie wykorzystać 3 węzły przydatne podczas biwakowania (np. do zbudowania zadaszenia z plandeki biwakowej).',
                        'Potrafi przygotować ciepły posiłek w warunkach polowych, umie posługiwać się turystyczną kuchenką gazową.',
                        'Umie przygotować listę ekwipunku niezbędnego na biwak zastępu i odpowiednio rozdzielić go między uczestników.'
                      ]
                  ),

                  SprawData(
                      id: 'wloczykij',
                      title: 'Włóczykij',
                      level: 3,
                      tasks: [
                        'Potrafi przygotować się, skompletować ekwipunek i biwakować w każdych warunkach terenowych.',
                        'Umie w warunkach polowych wysuszyć ubranie i obuwie.',
                        'Potrafi wybrać dobre miejsce do biwakowania, uwzględniając dostępność wody, odległość od skupisk ludzkich, osłonięcie od wiatru itd..',
                        'Posiada sprawność **Strażnika Ognia ze ścieżki „Rozpalanie ognia”.'
                      ]
                  ),

                  SprawData(
                      id: 'polarnik',
                      title: 'Polarnik',
                      level: 3,
                      tasks: [
                        'Umie skompletować i spakować ekwipunek odpowiedni do biwakowania w warunkach zimowych.',
                        'Potrafi przygotować legowisko, które przy ujemnej temperaturze pozwoli mu spędzić noc w komforcie cieplnym.',
                        'W zimie, w warunkach polowych umie przygotować sobie ciepły posiłek.',
                        'Potrafi udzielić pierwszej pomocy w przypadku odmrożeń i hipotermii, posiada sprawność **Sanitariusza ze ścieżki „Samarytanka”.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'kwatermistrzostwo',
                title: 'Kwatermistrzostwo',
                tags: ['#fach', '#umysł', '#majsterkowanie', '#współpraca', '#plecak', '#technika', '#odpowiedzialność', '#technologia', '#narzędzia'],
                fragment: 'Aleksander Mackenzie był pierwszym białym, który przemierzył całą Amerykę Północną. (...) Przy wyborze ekwipunku kierował się metodą, którą warto polecić także i dzisiaj. „Po dojrzałym namyśle sporządziłem trzy wykazy – donosił kuzynowi Roderykowi Mackenzie – na trzech osobnych arkuszach papieru. Pierwszy wykaz obejmuje wszystko, co jest niezbędne, drugi wszystko, co absolutnie konieczne, podczas gdy na trzecim arkuszu spisałem wyłącznie to, co wydawało mi się nieodzowne, żeby móc przeżyć. Potem strąciłem ze stołu dwa pierwsze wykazy, a na trzecim napisałem: zredukować o połowę.” Zostało więc to, czego Mackenzie naprawdę potrzebował. (...) po gruntownym przemyśleniu osobno zapakował sprzęt i prowiant, a każdy niósł tylko tyle, ile mógł dźwigać bez nadmiernego wysiłku. Pakunki były tak pomyślane, że w razie potrzeby do wszystkiego można się było dostać. Rzeczy poukładane na sobie w takiej kolejności, w jakiej ich się zwykle używa. Nie trzeba było tracić czasu na szukanie.',
                fragmentAuthor: 'Hans-Otto Meissner, „Sztuka życia i przetrwania”',
                sprawData: [

                  SprawData(
                      id: 'sakwa',
                      title: 'Sakwa',
                      level: 1,
                      tasks: [
                        'Umie odłożyć pieniądze na zaplanowany wydatek. Potrafi oszacować, ile czasu będzie mu potrzebne na zebranie określonej kwoty.',
                        'Umie bezpiecznie przechowywać pieniądze.',
                        'Potrafi zadbać o powierzony sprzęt biwakowy i pionierski, tj. właściwie go przechowywać, transportować i kompletować.',
                      ]
                  ),

                  SprawData(
                      id: 'gospodarz',
                      title: 'Gospodarz',
                      level: 2,
                      tasks: [
                        'Umie skompletować narzędzia dla zastępu na biwak lub obóz.',
                        'Potrafi konserwować narzędzia pionierskie a także odpowiednio je oznakować. Umie prowadzić wykaz sprzętu zastępu.',
                        'Potrafi rozliczyć się z powierzonych pieniędzy (np. składek zastępu na wycieczkę). Umie prowadzić zeszyt wpływów i wydatków (np. w Excelu).',
                      ]
                  ),

                  SprawData(
                      id: 'kwatermistrz',
                      title: 'Kwatermistrz',
                      level: 3,
                      tasks: [
                        'Potrafi zaplanować budżet wyjazdu lub biwaku, sprawować nadzór nad wydatkami i rozliczyć powierzone środki.',
                        'Umie przygotować kompletną listę zadań kwatermistrzowskich związanych z organizacją biwaku lub wędrówki, takich jak dojazd, aprowizacja, noclegi. Każde z tych zadań potrafi wykonać samodzielnie.',
                        'Umie zamówić usługę lub dokonać zakupu przez internet, wykonać przelew i wypłacić pieniądze z bankomatu.',
                        'Wie, do czego służy książka inwentarzowa i finansowa, i umie prawidłowo dokonać w nich wpisu.',
                        'Potrafi opisywać faktury oraz przypisać wydatki do odpowiednich kategorii: materiały, żywność, wyposażenie itd..'
                      ]
                  ),

                  SprawData(
                      id: 'magazynier',
                      title: 'Magazynier',
                      level: 3,
                      tasks: [
                        'Potrafi wykonać prace konserwacyjne sprzętu takiego jak namioty, sprzęt pływający, kanadyjki. Umie pokierować wykonaniem takich prac przez drużynę.',
                        'Potrafi wysuszyć namioty różnych typów, zabezpieczyć je przed zawilgoceniem i właściwie przygotować do magazynowania.',
                        'Umie właściwie przygotować i spakować sprzęt drużyny do transportu (np. w ciężarówce) i praktycznie ułożyć go w magazynie.',
                        'Umie prowadzić kompletną ewidencję sprzętu, potrafi dokonać wpisu w książce inwentarzowej i oznakować sprzęt.',
                        'Posiada sprawność **Technika ze ścieżki „Rzemiosło techniczne”.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'obozownictwo',
                title: 'Obozownictwo',
                tags: ['#las', '#majsterkowanie', '#twórczość', '#porządek', '#współpraca', '#survival', '#plecak', '#dzikość', '#harmonia', '#technika', '#obrzęd', '#ogień', '#wyobraźnia', '#technologia', '#narzędzia', '#natura'],
                fragment: 'Obozowanie jest prostym życiem, ograniczonym do rzeczywistych potrzeb i jest równocześnie najwyższym stopniem przebywania w przyrodzie. Autentyczne obozowanie nie jest dziś bardzo lubiane, dlatego że mężczyźni uważają, że w tym celu potrzebny jest wyjazd gdzieś bardzo daleko do odległych miejsc i za duże pieniądze, a kobiety uznają je za niewygodne, niehigieniczne, a czasami nawet niebezpieczne. Są to błędne wyobrażenia, a powstały dlatego, że ludzie nie pojmują obozowania jako rodzaju sztuki. Rozsądnie przeprowadzone obozowanie powinno wykazać się jako przyjemne odprężenie ciała i ducha ludzi, wyczerpanych pośpiechem i nerwowością życia.',
                fragmentAuthor: 'Ernest Thompson Seton, „Zwitek kory brzozowej woodcraftu”',
                sprawData: [

                  SprawData(
                      id: 'sobieradek_obozowy',
                      title: 'Sobieradek Obozowy',
                      level: 1,
                      tasks: [
                        'Potrafi sprawnie posługiwać się narzędziami pionierskimi: młotkiem, toporkiem i piłą. Umie zabezpieczyć je po skończonej pracy.',
                        'Umie zaprojektować i wykonać drobny przedmiot pionierki obozowej (np. drogowskaz, wieszak lub ławkę).',
                        'Potrafi wyregulować odciągi i podwinąć poły w namiocie dziesięcioosobowym.',
                      ]
                  ),

                  SprawData(
                      id: 'zdobnik',
                      title: 'Zdobnik',
                      level: 2,
                      tasks: [
                        'Umie samodzielnie wykonać prosty totem lub inny element zdobnictwa obozowego z wykorzystaniem materiałów znalezionych w terenie.',
                        'Posiada sprawność *Plastyka ze ścieżki „Rzemiosło plastyczne”.',
                      ]
                  ),

                  SprawData(
                      id: 'technik_obozowy',
                      title: 'Technik Obozowy',
                      level: 2,
                      tasks: [
                        'Umie zaprojektować oraz pokierować wykonaniem pomysłowego i estetycznego urządzenia obozowego (np. bramy, latryny lub pionierki w namiocie).',
                        'Umie pokierować rozstawieniem namiotu dziesięcioosobowego.',
                      ]
                  ),

                  SprawData(
                      id: 'wyga_obozowy',
                      title: 'Wyga Obozowy',
                      level: 3,
                      tasks: [
                        'Potrafi zaprojektować i pokierować budową dużego urządzenia obozowego (np. pomostu, zadaszenia kuchni, stołówki, elektrowni solarnej, pieca lub wieży ciśnień).',
                        'Umie sprawnie pokierować rozstawieniem namiotów według określonego planu (np. w kręgu, w kwadracie lub szeregu).',
                        'Potrafi pracować używając do pomiarów jedynie sznurka i własnego ciała.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrz_zdobnictwa',
                      title: 'Mistrz Zdobnictwa',
                      level: 3,
                      tasks: [
                        'Umie wykonać totem przedstawiający w rozpoznawalny sposób charakterystyczne zwierzę lub konkretną postać, z wykorzystaniem materiałów znalezionych w terenie.',
                        'Umie opracować dokładny projekt plastyczny i na jego podstawie wykonać samodzielnie trwały element zdobniczy (np. proporzec, rzeźbioną buławę, herb, inny element obrzędowy).',
                        'Potrafi stosować różne puszczańskie techniki zdobnicze takie jak wyplatanie, rzeźbienie, opalanie.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'podchody_i_zwiady',
                title: 'Podchody i zwiady',
                tags: ['#zwinność', '#spryt', '#oddech', '#opanowanie', '#emocje', '#las', '#współpraca', '#współzawodnictwo', '#ruch', '#wytrzymałość', '#ciekawość', '#pamięć', '#dyscyplina', '#zagadka', '#obserwacja', '#zasady'],
                fragment: 'Nazajutrz późnym popołudniem, po lekcji stenografii, plan wojennych działań był gotowy. (...) – Słuchajcie – powiedział Boka – musimy uprzedzić ich natarcie i udowodnić im, że jesteśmy tak samo odważni jak oni. Wezmę ze sobą dwóch najodważniejszych i razem pójdziemy do Ogrodu Botanicznego. Przedostaniemy się na ich wyspę i przybijemy na drzewie tę kartkę. Wyciągnął z kieszeni kartkę czerwonego papieru, na której drukowanymi literami było wypisane: TU BYLI CHŁOPCY Z PLACU BRONI Wszyscy z podziwem spojrzeli na kartkę. (...) – Dobrze byłoby jeszcze dopisać coś obraźliwego. Boka przecząco potrząsnął głową. – Nie wolno. W żadnym wypadku nie będziemy postępować tak, jak Feri Acz, który zabrał naszą chorągiew. My tylko pokażemy, że się ich nie boimy, że mamy odwagę wkroczyć na ich teren, gdzie przeprowadzają zebrania i gdzie ukrywają swoją broń. Ta czerwona kartka będzie naszą wizytówką, którą im zostawimy dla przestrogi. Głos zabrał Czele. – Słyszałem, że oni o tej porze wieczorem są na wyspie i bawią się w policjantów i złodziei. – Nie szkodzi. Feri Acz też przyszedł do nas o takiej porze, kiedy wiedział, że będziemy na Placu. Kto się boi, ten niech nie idzie ze mną. Ale nikt się nie bał.',
                fragmentAuthor: 'Ferenc Molnár, „Chłopcy z Placu Broni”',
                sprawData: [
                  SprawData(
                      id: 'lekka_stopa',
                      title: 'Lekka Stopa',
                      level: 1,
                      tasks: [
                        'Umie poruszać się bezszelestnie w różnych warunkach terenowych.',
                        'Potrafi sprawnie pokonać różne przeszkody (np. wejść na drzewo, przeskoczyć rów o szerokości 1,5 m, przejść przez ogrodzenie).',
                        'Umie zapamiętać przebytą drogę i samodzielnie nią powrócić.',
                      ]
                  ),

                  SprawData(
                      id: 'tropiciel',
                      title: 'Tropiciel',
                      level: 2,
                      tasks: [
                        'Potrafi zamaskować się w terenie tak, by pozostać niezauważonym.',
                        'Potrafi posprzątać i zamaskować miejsce odpoczynku lub biwaku, by nie zostawić po sobie śladów.',
                        'Bezbłędnie rozpoznaje znaki patrolowe stosowane w drużynie, umie je wykorzystać do oznakowania trasy.',
                        'Potrafi z pamięci wykonać szkic przebytej trasy i opisać wygląd napotkanych osób.',
                        'Na podstawie śladów ludzkiej bytności umie wywnioskować możliwie dużo informacji (np. kierunek marszu i szacunkową liczbę osób lub czas biwaku i działania jego uczestników).',
                      ]
                  ),

                  SprawData(
                      id: 'zwiadowca',
                      title: 'Zwiadowca',
                      level: 3,
                      tasks: [
                        'Potrafi zdobywać informacje za pomocą różnych technik wywiadowczych, takich jak rozmowa, obserwacja, śledzenie, badanie śladów, analiza map i dokumentów.',
                        'Potrafi zorientować się, gdy jest śledzony. Umie zmylić pościg.',
                        'Umie zlokalizować obiekt w terenie, kierując się jedynie orientacyjnymi wskazówkami na jego temat (np. potrafi odnaleźć obóz harcerski dysponując jedynie nazwą miejscowości, w której się on znajduje).',
                        'Potrafi z pamięci lub na podstawie obserwacji z ukrycia stworzyć szkic strzeżonego terenu lub obiektu (np. obozu).',
                        'Potrafi zwięźle i precyzyjnie przekazać zdobyte informacje. Umie to zrobić różnymi sposobami, w tym za pomocą szkicu, zaszyfrowanego meldunku i znaków patrolowych.',
                        'Posiada sprawność ** Terenoznawcy ze ścieżki „Terenoznawstwo”.'
                      ]
                  ),

                  SprawData(
                      id: 'nieuchwytny',
                      title: 'Nieuchwytny',
                      level: 3,
                      tasks: [
                        'Potrafi w dzień i w nocy trafić do wyznaczonego miejsca na podstawie pobieżnego szkicu lub zapamiętanej trasy, bez użycia narzędzi nawigacyjnych i mapy.',
                        'Potrafi skrycie podejść strzeżony teren lub obiekt, a następnie wycofać się niepostrzeżenie, nie pozostawiając po sobie śladów. Umie wykorzystać uzyskane zawczasu informacje do zaplanowania podchodów.',
                        'Zauważony przez wartownika potrafi postąpić honorowo.',
                        'Posiada sprawność **Wartownika ze ścieżki „Bezpieczeństwo obozowe” i **Terenoznawcy ze ścieżki „Terenoznawstwo”.'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'bezpieczenstwo_obozowe',
                title: 'Bezpieczeństwo obozowe',
                tags: ['#obserwacja', '#opanowanie', '#odpowiedzialność', '#spryt', '#las', '#współpraca', '#pomoc', '#karność', '#dyscyplina', '#wiatr'],
                fragment: 'Major Brown, uspokojony brakiem śladów Indian, polecił na noc rozłożyć obóz w Brzozowym Wąwozie w pobliżu brzegu rzeki. Wąwóz ten ciągnął się kilka mil przez prerię, aż do nadrzecznych wzgórz. Z południowej strony obozu, o jakieś dwieście lub trzysta kroków, znajdowały się nadbrzeżne drzewa i gęste zarośla. Zaś od północy obóz okalała falista preria, uniemożliwiająca spostrzeżenie z dala nadciągającego wroga. Jednakże major Brown nie podejrzewał nawet, że może grozić im jakieś niebezpieczeństwo. Przecież nie tylko nie natrafił na Indian, ale nawet nie znalazł ich śladów. (...) Ledwo niebo poczęło szarzeć na wschodzie Santee Dakotowie rozpoczęli podchody. Mieli oni zamiar podkraść się najpierw do wartowników i unieszkodliwić ich po cichu, a potem niespodziewanie uderzyć na śpiący obóz. Stało się jednak inaczej. Otóż jeden z białych wartowników usłyszał jakieś podejrzane szelesty w suchej trawie i, nie namyślając się, wystrzelił z karabinu. Jeszcze nie przebrzmiało echo strzału, gdy w ciszy nocnej rozległ się przeraźliwy okrzyk wojenny Dakotów: „Hokka-hey!”',
                fragmentAuthor: 'Krystyna i Alfred Szklarscy, „Ostatnia Walka Dakotów”',
                sprawData: [

                  SprawData(
                      id: 'czujka',
                      title: 'Czujka',
                      level: 1,
                      tasks: [
                        'Potrafi prawidłowo pełnić służbę wartowniczą w dzień i w nocy.',
                        'Umie poruszać się w nocy nie wykorzystując sztucznych źródeł światła. Potrafi wyłącznie przy pomocy słuchu określić, z której strony zbliża się człowiek.',
                        'Umie zachować się w wypadku zauważenia w obozie obcych osób, pożaru bądź gwałtownej zmiany pogody. Umie skutecznie ogłosić alarm.',
                        'Potrafi w razie konieczności wezwać telefonicznie pomoc oraz zdać rzeczowy raport służbom.'
                      ]
                  ),

                  SprawData(
                      id: 'wartownik',
                      title: 'Wartownik',
                      level: 2,
                      tasks: [
                        'Umie samodzielnie pełnić nocną służbę wartowniczą. Obudzony potrafi szybko i sprawnie wstać oraz przygotować się do służby.',
                        'Zna i potrafi stosować zasady harcerskich podchodów. Umie ocenić strzeżony teren i wybrać najlepsze stanowiska do pełnienia warty.',
                        'Potrafi wykonać prosty i bezpieczny wykrywacz (np. suche gałęzie lub ukryty dzwonek).',
                        'Umie przyjąć obozowych gości oraz wizytację zgodnie z właściwymi procedurami oraz należytymi manierami.',
                        'Potrafi złożyć dowódcy warty prawidłowy raport z wykonanej służby.'
                      ]
                  ),

                  SprawData(
                      id: 'dowodca_warty',
                      title: 'Dowódca Warty',
                      level: 3,
                      tasks: [
                        'Gdy rozkłada z zastępem obozowisko, potrafi umiejscowić je tak, aby było jak najlepiej zakamuflowane.',
                        'Umie ustalić grafik wart. Wie, w których godzinach warta jest najtrudniejsza, i potrafi adekwatnie dobrać wartowników.',
                        'Umie przygotować plan obrony obozu, zawierający procedury na wypadek zauważenia w obozie intruzów, zagrożenia pogodowego, podchodów itp., a następnie przeszkolić drużynę i przećwiczyć wykonanie tego planu.',
                        'Potrafi przygotować i przeprowadzić próbę alarmów obozowych: ewakuacja, alarm wartowniczy, stan zagrożenia pogodowego.',
                        'Umie przygotować obóz na nagłą zmianę warunków atmosferycznych. Posiada sprawność **Meteorologa ze ścieżki „Obserwacja nieba”.'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'tropienie_zwierzat',
                title: 'Tropienie zwierząt',
                tags: ['#las', '#dzikość', '#obserwacja', '#natura', '#spryt', '#survival', '#ruch', '#książka', '#ciekawość', '#harmonia', '#wiatr', '#obiektyw'],
                fragment: 'Od ściany lasu oderwała się czarna ruchoma plama. Brnąc po łopatki w śniegu, stary dzik-odyniec pruł wolno lecz wytrwale białą powłoką bagna. Zatrzymywał się, prychał i znowu szedł kierując się ku brzegom rzeczułki. (...) W ścianie Puszczy pary ogników zapalały się i gasły. Od czarnej, posuwającej się wolno plamy, oddzielała je jeszcze duża przestrzeń gładkiej powierzchni. Nagle czarna plama zatrzymała się. Krępe cielsko odyńca zamarło w bezruchu. Koniec ryja wyciągniętego ku ścianie Puszczy drgał nerwowo – wietrzył. Fuknął groźnie, zawrócił gwałtownie i w pełnym galopie rzucił się bruzdą z powrotem ku rzeczułce. Wilczyca ruszyła naprzód, a za nią ruszyła cała zgraja. Rozpoczął się pościg za odyńcem.',
                fragmentAuthor: 'Jan Jerzy Karpiński, „W prastarej Puszczy”',
                sprawData: [

                  SprawData(
                      id: 'bystre_oko',
                      title: 'Bystre Oko',
                      level: 1,
                      tasks: [
                        'Umie rozpoznać na podstawie sylwetki lub odgłosów 12 gatunków zwierząt, w tym 6 ptaków, występujących na wolności w polskich lasach.',
                        'Potrafi wykorzystać atlas lub inne źródła do rozpoznania każdego, nawet nieznanego sobie zwierzęcia zaobserwowanego wcześniej w terenie.',
                      ]
                  ),

                  SprawData(
                      id: 'tropiciel_zwierzyny',
                      title: 'Tropiciel Zwierzyny',
                      level: 2,
                      tasks: [
                        'Umie zaplanować i przeprowadzić udaną obserwację zwierzyny.',
                        'Potrafi rozpoznać tropy lub ślady bytowania 10 zwierząt występujących na wolności w polskich lasach.',
                        'Umie rozpoznać na podstawie charakterystycznych cech kilka ściśle chronionych gatunków zwierząt.',
                        'Potrafi odpowiednio zachowywać się w lesie, aby nie płoszyć zwierząt i nie tworzyć dla nich zagrożenia.'
                      ]
                  ),

                  SprawData(
                      id: 'znawca_zwierzyny',
                      title: 'Znawca Zwierzyny',
                      level: 3,
                      tasks: [
                        'Umie odnaleźć zwierzynę w terenie wyłącznie na podstawie tropów i śladów.',
                        'Na podstawie znalezionych w lesie tropów i śladów potrafi wysnuć wnioski i opisać zdarzenie z udziałem zwierząt.',
                        'Potrafi wyznaczyć i przygotować stanowisko do wielogodzinnej obserwacji zwierząt, przeprowadzić taką obserwację i ją udokumentować (np. w formie notatek, zdjęć, rysunków lub filmu).',
                        'Dobrze zna zwyczaje zwierząt z 6 gatunków występujących na wolności w Polsce. Zna określenia na samców i samice tych gatunków, ich zwyczaje godowe, sposób chowu potomstwa i preferencje dotyczące pokarmu. Potrafi udzielić wskazówek jak odnaleźć takie zwierzę w terenie i po czym je rozpoznać.'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'zielarstwo',
                title: 'Zielarstwo',
                tags: ['#las', '#dzikość', '#survival', '#ciekawość', '#harmonia', '#ogień', '#przepis', '#obserwacja', '#natura'],
                fragment: 'Wracając do kanapek: lebiodę, lipę i pokrzywę proponuję z chlebem, masłem i na przykład serem lub bez niczego przy każdej okazji. Krwawnik zaś, babkę, łopian, szczaw, szczypiorek, a także te trzy już wspomniane, radzę drobno pokroić, dodać śmietany, można wkroić w to jajko na twardo lub twarożek i stosować jako pastę lub sałatkę. Zasada doboru składników: wedle smaku i tego, co rośnie w okolicy. Może to być nawet sama pokrzywa wkrojona do pasztetu z puszki albo sama lebioda w twarożku ze śmietaną (...) Zwróć też uwagę, ażeby zastęp za bardzo nie wczuwał się w roślinne wyżywienie, bo zamiast na obiad będziesz ich musiał wyprowadzać na pastwisko. Krzysztof Kowalczyk, „Podręcznik ekologicznego obozowania” --- Uwaga! Sprawności *Przyrodnika i **Botanika należy zdobywać pod czujnym okiem ***Zielarza bądź innej osoby przeszkolonej w zakresie rozpoznawania trujących roślin i grzybów. Zioła lecznicze, niewłaściwie wykorzystane mogą okazać się trujące.',
                fragmentAuthor: null,
                sprawData: [

                  SprawData(
                      id: 'przyrodnik',
                      title: 'Przyrodnik',
                      level: 1,
                      tasks: [
                        'Umie przy pomocy atlasu roślin rozpoznać w lesie 6 roślin jadalnych (np. malina, jeżyna, borówka czarna, poziomka, lipa, pokrzywa, mięta, komosa biała, szczawik zajęczy, szczaw, stokrotka) oraz 3 trujące (np. wilcza jagoda, cis pospolity, czeremcha, kruszyna, bluszcz, bylicę piołun, glistnik jaskółcze ziele, jaskier, wrotycz).',
                        'Potrafi przygotować danie na zimno z samodzielnie zebranych darów lasu.',
                      ]
                  ),

                  SprawData(
                      id: 'botanik',
                      title: 'Botanik',
                      level: 2,
                      tasks: [
                        'Umie przygotować napar (herbatę) z pospolicie występującej rośliny (np. z liści pokrzywy lub mięty, liści lub pędów malin czy koszyczków rumianku).',
                        'Umie rozpoznać i wykorzystać 12 roślin jadalnych. Wie, które części tych roślin są jadalne, a jeżeli wymagają przed spożyciem specjalnej obróbki, to potrafi ją przeprowadzić (dotyczy to np. jarzębiny i liści mniszka lekarskiego).',
                        'Potrafi rozpoznać w naturze 5 roślin trujących podobnych do roślin jadalnych i wskazać cechy, które je odróżniają.',
                        'Umie odszukać w terenie 6 roślin ściśle chronionych.'
                      ]
                  ),

                  SprawData(
                      id: 'zielarz',
                      title: 'Zielarz',
                      level: 3,
                      tasks: [
                        'Z wykorzystaniem samodzielnie zebranych dziko rosnących ziół i owoców z 8 różnych gatunków potrafi przygotować 10 dań, w tym 3 na ciepło.',
                        'Umie rozpoznać 5 ziół o właściwościach leczniczych i zna ich zastosowanie. Potrafi odnaleźć 3 z nich w terenie.',
                        'Zna zastosowanie i potrafi wykorzystać w celu innym niż spożycie 5 roślin - np. natrzeć się wrotyczem w celu uchronienia się przed ukąszeniami komarów, przyłożyć cebulę do ukąszenia osy w celu uśmierzenia bólu, wykorzystać mydlnicę lekarską do wyprania ubrań.',
                        'Ma podstawową wiedzę o systematyce roślin występujących w Polsce, umie posłużyć się atlasem roślin dla odszukania lub opisania danego gatunku.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'puszczanstwo',
                title: 'Puszczaństwo',
                tags: ['#las', '#spryt', '#survival', '#dzikość', '#harmonia', '#ogień', '#zwinność', '#natura'],
                fragment: 'Któż zbadał puszcz litewskich przepastne krainy aż do samego środka, do jądra gęstwiny? Rybak ledwie u brzegów nawiedza dno morza; myśliwiec krąży koło puszcz litewskich łoża, zna je ledwie po wierzchu, ich postać, ich lice, lecz obce mu ich wnętrzne serca tajemnice; wieść tylko albo bajka wie, co się w nich dzieje. Bo gdybyś przeszedł bory i podszyte knieje, trafisz w głębi na wielki wał pniów, kłod, korzeni, obronny trzęsawicą, tysiącem strumieni i siecią zielsk zarosłych, i kopcami mrowisk, gniazdami os, szerszeniów, kłębami wężowisk. (...) Za temi jeziorkami już nie tylko krokiem, ale daremnie nawet zapuszczać się okiem, bo tam już wszystko mglistym zakryte obłokiem, co się wiecznie ze trzęskich oparzelisk wznosi. A za tą mgłą na koniec (jak wieść gminna głosi) ciągnie się bardzo piękna, żyzna okolica: główna królestwa zwierząt i roślin stolica. (...) Słychać, że tam w stolicy, między zwierzętami dobre są obyczaje, bo rządzą się sami; jeszcze cywilizacją ludzką nie popsuci, nie znają praw własności, która świat nasz kłóci, nie znają pojedynków ni wojennej sztuki. Jak ojce żyły w raju, tak dziś żyją wnuki, dzikie i swojskie razem, w miłości i zgodzie, nigdy jeden drugiego nie kąsa ni bodzie. (...) Te puszcz stołeczne, ludziom nie znane tajniki w języku swoim strzelcy zowią: m a t e c z n i k i.',
                fragmentAuthor: '"Adam Mickiewicz, „Pan Tadeusz”',
                sprawData: [

                  SprawData(
                      id: 'chatka_robinsona',
                      title: 'Chatka Robinsona',
                      level: 1,
                      tasks: [
                        'Potrafi poradzić sobie w czasie 24 godzinnej wyprawy zastępu do lasu, bez namiotu lub innego gotowego zadaszenia.',
                        'Potrafi zabezpieczyć prowiant i swój ekwipunek na czas bytowania w lesie (np. przed deszczem, zwierzętami).',
                      ]
                  ),

                  SprawData(
                      id: 'lesny_czlowiek',
                      title: 'Leśny Człowiek',
                      level: 2,
                      tasks: [
                        'Potrafi zbudować szałas pozwalający na przetrwanie deszczowej nocy i spędzić w nim noc.',
                        'Umie zamaskować ślady swojego pobytu.',
                        'Posiada sprawność * Przyrodnika ze ścieżki „Zielarstwo”.',
                      ]
                  ),

                  SprawData(
                      id: 'rosomak',
                      title: 'Rosomak',
                      level: 3,
                      tasks: [
                        'Potrafi w terenie pozyskać wodę zdatną do picia.',
                        'Potrafi przygotować ciepły posiłek mając do dyspozycji jedynie nóż, zapałki i butelkę wody.',
                        'Potrafi z surowców naturalnych samodzielnie wytworzyć użyteczne narzędzie lub element ekwipunku biwakowego (np. naczynie na wodę, kosz pleciony, linę).',
                        'Potrafi bytować w lesie w sposób niezauważalny dla osób postronnych.',
                        'Posiada sprawność ** Botanika ze ścieżki „Zielarstwo” oraz **Tropiciela Zwierzyny ze ścieżki „Tropienie zwierząt”.'
                      ]
                  ),

                ]
            )

          ]
      ),

      SprawGroupData(
          id: 'muzyka_i_ekspresja',
          title: 'Muzyka i ekspresja',
          familyData: [

            SprawFamilyData(
                id: 'gra_na_gitarze',
                title: 'Gra na gitarze',
                tags: ['#rytm', '#melodia', '#twórczość', '#harmonia', '#technika', '#wyobraźnia'],
                fragment: '– Umiesz grać na gitarze, prawda? – No, chyba tak… Spróbował. Łatwo się na niej grało. Właściwie zła gra była prawie niemożliwa. Miał wrażenie, że nieważne, jak dotyka strun, i tak gitara wygrywała melodię rozbrzmiewającą mu w duszy. Była urzeczywistnieniem instrumentu, o jakim się marzy, kiedy człowiek zaczyna się uczyć muzyki, takim, na którym można grać bez ćwiczeń. Pamiętał, że kiedy pierwszy raz wziął harfę i uderzył w struny, zarozumiale oczekując tych głębokich tonów, jakie wydobywali z niej starsi bardowie, uzyskał jedynie dysonansowe jęki. Ale teraz dostał instrument, o jakim śnił… – Trzymajmy się piosenek, które wszyscy znają – instruował krasnolud. – „Laska maga” i „Zbierając rabarbar”. Takie rzeczy. Ludzie lubią piosenki, przy których mogą rechotać do rytmu. Imp rzucił okiem na salę. Zaczynała się powoli wypełniać. Ale jego uwagę zwrócił duży orangutan, który przysunął sobie krzesło tuż pod scenę i trzymał w rękach torbę owoców. – Buog, jakaś małpa na nas patrzy. – I co? – zdziwił się krasnolud, rozpinając siatkę. – To małpa! – A to jest Ankh-Morpork. Takie rzeczy się zdarzają. – Zdjął hełm i wyjął coś ze środka. – Po co ci ta siatka? – zdziwił się Imp. – Owoce to owoce. Oszczędnością i pracą krasnoludy się bogacą. Gdyby rzucali jajkami, staraj się je wyłapywać.',
                fragmentAuthor: 'Terry Pratchett, “Muzyka Duszy”',
                sprawData: [

                  SprawData(
                      id: 'szarpidrut',
                      title: 'Szarpidrut',
                      level: 1,
                      tasks: [
                        'Potrafi zagrać na gitarze 2 piosenki. Umie zagrać i nazwać 5 akordów.',
                        'Potrafi nastroić gitarę (np. przy pomocy stroika) oraz bezpiecznie ją przechowywać.',
                      ]
                  ),

                  SprawData(
                      id: 'grajek',
                      title: 'Grajek',
                      level: 2,
                      tasks: [
                        'Umie akompaniować na gitarze do 5 piosenek.',
                        'Potrafi chwytać akordy barowe oraz płynnie przechodzić między akordami.',
                        'Umie zaśpiewać do własnego akompaniamentu. Potrafi ocenić czy śpiewany utwór jest w dobrej tonacji dla grupy.',
                        'Przy użyciu podanego dźwięku (np. z kamertonu) umie nastroić gitarę ze słuchu.',
                        'Potrafi założyć struny w gitarze.',
                      ]
                  ),

                  SprawData(
                      id: 'gitarzysta',
                      title: 'Gitarzysta',
                      level: 3,
                      tasks: [
                        'Umie poprowadzić muzycznie ognisko lub śpiewanki, nawet w razie braku śpiewnika z akordami. Potrafi poprowadzić grupę kilku akompaniatorów.',
                        'Umie dobrać technikę gry do nastroju piosenki. Potrafi zastosować różne techniki lewej i prawej ręki (np. ozdobniki, legato, różne rodzaje bicia, tremolo).',
                        'Zna zasady budowy akordów. Umie wymyślić, jak zagrać na gitarze dowolny akord i potrafi przetransponować akordy z jednej tonacji do drugiej.',
                        'Potrafi ze słuchu dobrać akordy do piosenki.'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'gra_na_instrumentach',
                title: 'Gra na instrumentach',
                tags: ['#rytm', '#melodia', '#harmonia', '#twórczość', '#współpraca', '#zespół', '#technika', '#wyobraźnia'],
                fragment: '– Jestem zbyt delikatny – powiedział – mam to już od dziecka, że jestem delikatny. (…) Poza tym łatwo się wzruszam. Podczas ostatniej walki ze Szlają bardzo się wzruszyłem, bo Szekspir czytał na lekcji wypracowanie o Janku Muzykancie. Pomyślałem sobie, że ja też jestem takim Jankiem Muzykantem i że tylko brak mi skrzypiec, i przez całą walkę żałowałem, że moja pięść nie jest smyczkiem, a nos Szlai kontrabasem. – To mówiąc Wątłusz Pierwszy spojrzał na swoje muskularne łapska z pewnym rozrzewnieniem. – Czy nie uważacie, że marnowałem się w boksie? (…) Twój stary, Zasępa, jest w orkiestrze, prawda? – zapytał nagle. – Tak, w orkiestrze tramwajarzy – powiedział Zasępa. – Czy nie mógłbyś pożyczyć od niego dla mnie skrzypiec, przynajmniej raz w tygodniu? (…) – Mój stary nie gra na skrzypcach – powiedział Zasępa. – A na czym? – Na flecie. Czy to ci odpowiada? Myślę, że subtelny i żałosny płacz fletu doskonale wyraziłby twój nastrój. – Nie… nie… nie wspominaj mi o flecie – zatrząsł się Wątłusz – nie mógłbym grać na flecie. Rozpłakałbym się od razu, jestem zbyt wrażliwy. – Czy musisz koniecznie grać? Może wystarczyłoby ci słuchać muzyki z płyt? – powiedział Zasępa. Ale Wątłusz Pierwszy pokręcił smutno głową. – Nie, ja jestem Jankiem Muzykantem. Mój talent marnuje się nędznie z powodu braku instrumentu. Chyba, że zostanę poetą. Edmund Niziurski, „Sposób na Alcybiadesa” --- Sprawności z tej ścieżki zdobywa się, grając na wybranym instrumencie. Można je zdobywać wielokrotnie zmieniając instrument.',
                sprawData: [

                  SprawData(
                      id: 'muzykant',
                      title: 'Muzykant',
                      level: 1,
                      tasks: [
                        'Potrafi zagrać na wybranym instrumencie dwie piosenki, melodie lub rytmy, a także zagrać i nazwać kilka akordów lub dźwięków.',
                        'Umie przygotować instrument do grania (np. złożyć lub nastroić przy pomocy stroika) oraz odpowiednio go zabezpieczyć (np. na czas transportu).',
                      ]
                  ),

                  SprawData(
                      id: 'instrumentalista',
                      title: 'Instrumentalista',
                      level: 2,
                      tasks: [
                        'Potrafi na podstawie zapisu (np. nutowego lub tabulaturowego) samodzielnie nauczyć się grać wybrany utwór.',
                        'Umie grać w kilkuosobowym zespole, trzymając wspólny rytm i tonację.',
                        'Potrafi dbać o instrument i go konserwować. Jeśli instrument wymaga częstego strojenia, umie to robić.'
                      ]
                  ),

                  SprawData(
                      id: 'akompaniator',
                      title: 'Akompaniator',
                      level: 2,
                      tasks: [
                        'Umie akompaniować do 5 piosenek, stosując różne techniki gry i ozdobniki.',
                        'Potrafi zaśpiewać do własnego akompaniamentu i ocenić, czy śpiewany utwór jest w dobrej tonacji dla grupy.',
                        'Umie dbać o instrument i go konserwować. Jeśli instrument wymaga częstego strojenia, potrafi to robić.'
                      ]
                  ),

                  SprawData(
                      id: 'bebniarz',
                      title: 'Bębniarz',
                      level: 2,
                      tasks: [
                        'Umie zagrać na instrumencie perkusyjnym wybrany rytm na podstawie zapisu nutowego. Potrafi powtórzyć kilkutaktowy rytm zagrany przez kogoś innego.',
                        'Umie stosować różne rodzaje artykulacji dźwięku na instrumentach perkusyjnych, w tym tremolo.',
                        'Potrafi akompaniować rytmicznie do kilku piosenek. Umie w zespole nadać odpowiednie tempo i utrzymać je (tj. nie przyspieszać ani zwalniać, jeśli nie jest to przewidziane).'
                      ]
                  ),

                  SprawData(
                      id: 'wirtuoz',
                      title: 'Wirtuoz',
                      level: 3,
                      tasks: [
                        'Potrafi przygotować się i wystąpić przed publicznością.',
                        'Umie zagrać 3 utwory, każdy o innym charakterze, wymagające kilku różnych technik gry.',
                        'Potrafi zagrać melodię z nut a vista.',
                        'Ma swojego ulubionego kompozytora którego utwory umie zinterpretować. Potrafi opowiedzieć, dlaczego ceni konkretnych wykonawców i jakie techniki gry go inspirują.'
                      ]
                  ),

                  SprawData(
                      id: 'czlowiek_orkiestra',
                      title: 'Człowiek Orkiestra',
                      level: 3,
                      tasks: [
                        'Umie zaplanować i poprowadzić akompaniament instrumentalny podczas ogniska lub śpiewanek. Potrafi poprowadzić grupę kilku akompaniatorów.',
                        'Potrafi dobrać technikę gry do nastroju piosenki.',
                        'Umie ze słuchu ułożyć akompaniament do piosenki.',
                        'Zna zasady budowy akordów, umie wymyślić jak zagrać na instrumencie dowolny akord.',
                        'Zna podstawowe zależności harmoniczne między akordami, potrafi znaleźć tonację równoległą (molową lub durową), a także przetransponować akordy z jednej tonacji do drugiej.'
                      ]
                  ),

                  SprawData(
                      id: 'improwizator',
                      title: 'Improwizator',
                      level: 3,
                      tasks: [
                        'Umie improwizować do akompaniamentu.',
                        'Potrafi wymyślić i zagrać własną melodię (np. do istniejącego tekstu).',
                        'Umie ułożyć i zagrać solo melodię w wybranej skali (np. bluesowej).',
                        'Potrafi poruszać się po pentatonice i dwóch innych skalach (np. modalnych).',
                      ]
                  ),

                  SprawData(
                      id: 'perkusista',
                      title: 'Perkusista',
                      level: 3,
                      tasks: [
                        'Umie na zestawie perkusyjnym improwizować do utworów w wybranym stylu muzycznym, takim jak rock, jazz, metal, R’n’B lub reggae.',
                        'Potrafi wyjaśnić różnice między różnymi stylami muzyki popularnej (np. rockiem, jazzem, metalem, reggae, r’n’b) oraz w jaki sposób przekłada się to na grę na zestawie (dobór instrumentów, pałeczek, rytmów, styl gry).',
                        'Zna poszczególne elementy perkusji, potrafi je nazwać i opisać ich funkcje. Umie rozstawić i złożyć zestaw perkusyjny (lub podłączyć zestaw padów perkusji elektronicznej) i dopasować ułożenie instrumentów do swoich potrzeb. W razie potrzeby potrafi go wygłuszyć.',
                        'Potrafi wskazać wybitnego perkusistę, ulubione utwory i techniki gry, które go inspirują.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'spiew',
                title: 'Śpiew',
                tags: ['#rytm', '#melodia', '#harmonia', '#twórczość', '#oddech', '#słowo', '#współpraca', '#zespół', '#książka', '#ludzie', '#siła', '#technika', '#pamięć', '#obrzęd', '#ogień', '#wyobraźnia'],
                fragment: 'Ciemności wypełniły pokój, ogień zgasł, cienie zniknęły – a krasnoludy grały jeszcze. Nagle któryś zaczął śpiewać do wtóru melodii, potem inni przyłączyli swe głosy, niskie, przytłumione głosy krasnoludów przyzwyczajonych z dawnych czasów do śpiewania w swoich głębokich podziemnych siedzibach (…) Tam gdzie chłód i gdzie zamglony szczyt, Musimy iść, nim przyjdzie świt. w otchłanie grot i w jaskiń mrok, Gdzie złoty skarb – nasz dawny mit. Na zboczach góry jęczał las, Wył wiatr ponury w nocny czas. Płomieni ślad naznaczył świat, Z płonących sosen iskier blask. (…) Gdy tak śpiewali, Bilbo poczuł, że budzi się w nim miłość do pięknych rzeczy, które powstają dzięki pracy rąk, zręczności i czarom, namiętna i zazdrosna miłość, najgorętsza pożądliwość serc krasnoludzkich. Coś z dziedzictwa Tuków ocknęło się w hobbicie, zapragnął ruszyć w świat, zobaczyć wysokie góry, usłyszeć szum sosen i potoków, zbadać głębie jaskiń, miecz nosić u boku zamiast laski. (…)',
                fragmentAuthor: 'J.R.R. Tolkien, „Hobbit czyli tam i z powrotem”',
                sprawData: [

                  SprawData(
                      id: 'spiewak',
                      title: 'Śpiewak',
                      level: 1,
                      tasks: [
                        'Potrafi zaśpiewać 5 wybranych piosenek, zna ich teksty na pamięć.',
                        'W swoim śpiewie trzyma się rytmu i melodii.',
                      ]
                  ),

                  SprawData(
                      id: 'zapiewajlo',
                      title: 'Zapiewajło',
                      level: 2,
                      tasks: [
                        'Umie zaśpiewać 10 wybranych piosenek.',
                        'Potrafi powtórzyć melodię ze słuchu i wystukać do niej rytm.',
                        'Umie zaintonować śpiew w grupie (np. zastępie lub drużynie).',
                        'Potrafi zaśpiewać zadaną melodię od podanego dźwięku.',
                        'Umie wykonać 3 ćwiczenia na rozśpiewanie.',
                      ]
                  ),

                  SprawData(
                      id: 'wokalista',
                      title: 'Wokalista',
                      level: 3,
                      tasks: [
                        'Potrafi zaśpiewać 3 utwory o zróżnicowanym charakterze i nastroju (np. utwór poetycki, piosenkę musicalową i pieśń modlitewną) odpowiednio je interpretując. Umie wymienić autorów i kompozytorów tych utworów.',
                        'Potrafi wystąpić solo przed publicznością.',
                        'Umie zaśpiewać krótką melodię z nut.',
                        'Potrafi śpiewać w chórze, na głosy.',
                        'Zna podstawowe zasady emisji głosu i umie zastosować je w śpiewie.',
                      ]
                  ),

                  SprawData(
                      id: 'wodzirej',
                      title: 'Wodzirej',
                      level: 3,
                      tasks: [
                        'Potrafi poprowadzić ognisko lub kominek, tj. dobrać repertuar, ustalić scenariusz, zaintonować piosenki.',
                        'Umie zebrać i pokierować zespołem, który poprowadzi imprezę (np. leśny festiwal teatralny lub festyn w szkole).',
                        'W każdym gronie potrafi poprowadzić kilka zabaw towarzyskich.',
                        'Umie poprowadzić zaśpiew w marszu.',
                        'Posiada sprawność **Gawędziarza ze ścieżki „Aktorstwo i teatr”.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'taniec',
                title: 'Taniec',
                tags: ['#rytm', '#ludzie', '#ruch', '#zwinność', '#twórczość', '#współpraca', '#zespół', '#melodia', '#harmonia', '#technika', '#ogień', '#wyobraźnia'],
                fragment: 'Poloneza czas zacząć. – Podkomorzy rusza, I zlekka zarzuciwszy wyloty kontusza I wąsa pokręcając, podał rękę Zosi, I skłoniwszy się grzecznie w pierwszą parę prosi. Za Podkomorzym szereg w pary się gromadzi; Dano hasło, zaczęto taniec: on prowadzi. Nad murawą czerwone połyskają buty, Bije blask z karabeli, świeci się pas suty, A on stąpa powoli, niby odniechcenia; Ale z każdego kroku, z każdego ruszenia, Można tancerza czucia i myśli wyczytać. Oto stanął, jak gdyby chciał swą damę pytać, Pochyla ku niej głowę, chce szepnąć do ucha; Dama głowę odwraca, wstydzi się, nie słucha; On zdjął konfederatkę, kłania się pokornie, Dama raczyła spojrzeć, lecz milczy upornie; On krok zwalnia, oczyma jej spojrzenia śledzi, I zaśmiał się nakoniec, rad z jej odpowiedzi Stąpa prędzej, pogląda na rywalów zgóry,I swą konfederatkę z czaplinemi pióry To na czole zawiesza, to nad czołem wstrząsa. Aż włożył ją na bakier i pokręcił wąsa.',
                fragmentAuthor: 'Adam Mickiewicz, „Pan Tadeusz”',
                sprawData: [

                  SprawData(
                      id: 'holubiec',
                      title: 'Hołubiec',
                      level: 1,
                      tasks: [
                        'Potrafi zatańczyć krok podstawowy i 2 figury w wybranym stylu tańca.',
                        'Umie określić rytmikę swojego tańca i rozliczyć rytmicznie znane figury.',
                      ]
                  ),

                  SprawData(
                      id: 'tancerz',
                      title: 'Tancerz',
                      level: 2,
                      tasks: [
                        'Potrafi zatańczyć krok podstawowy i 6 figur w wybranym stylu tańca towarzyskiego.',
                        'Umie zatańczyć do piosenki i utrzymać rytm przez cały czas jej trwania.',
                        'Potrafi poprosić dziewczynę do tańca.'
                      ]
                  ),

                  SprawData(
                      id: 'krol_parkietu',
                      title: 'Król Parkietu',
                      level: 3,
                      tasks: [
                        'Zna i umie zatańczyć krok podstawowy i 5 figur w 3 różnych stylach tanecznych, towarzyskich lub solowych.',
                        'Potrafi nie gubiąc rytmu improwizować i łączyć figury taneczne w spójną całość.',
                        'Umie poprowadzić partnerkę w tańcu. Potrafi nauczyć drugą osobę podstawowych kroków tanecznych.',
                        'Potrafi dobrać muzykę odpowiednią do kilku wybranych styli tanecznych.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'aktorstwo_i_teatr',
                title: 'Aktorstwo i teatr',
                tags: ['#wyobraźnia', '#emocje', '#ludzie', '#twórczość', '#współpraca', '#zespół', '#technika', '#pamięć', '#słowo', '#obserwacja', '#rozmowa'],
                fragment: 'Na przedzie maszerują karły. Ciała ich potwornie rozdęte, nogi wykrzywione w pałąk, a głowy wciśnięte w tułów. Postacie te wyglądają tak, jakby kształtująca je moc w ostatnim twórczym dotknięciu uderzała olbrzymią dłonią z góry i wysokość zmniejszyła o połowę. W rękach niosą długie i cienkie oszczepy. W takt marszu wykrzykują; „Karła marła bum bum bum! Karła marła bum bum bum!” Za nimi idą wielkoludy. O ile poprzedni oddział robił ważenie tworów od góry spłaszczonych, o tyle ten drugi składa się z istot jakby nadmiernie w górę wyciąganych. (...) Za wielkoludami pełznie bazyliszek. Olbrzymie cielsko, długości kilkunastu metrów, posuwa się wężowymi skrętami. Raz po raz otwiera się straszna paszcza i odzywa się przeraźliwy ryk. Jedne oko świeci na przemian światłem czerwonym i zielonym. (...) Najpierw orszak Złych Mocy obszedł dookoła ognisko, a potem na musztrujący ryk bazyliszka zaczął zmieniać szyki i defilować przed potworem.',
                fragmentAuthor: 'Antoni Wasilewski, „Pod totemem słońca”',
                sprawData: [

                  SprawData(
                      id: 'debiutant',
                      title: 'Debiutant',
                      level: 1,
                      tasks: [
                        'Umie nauczyć się roli i ją odegrać (np. podczas przedstawienia szkolnego lub ogniska).',
                        'Potrafi wykonać element stroju lub rekwizyt potrzebny do odgrywanej roli.',
                      ]
                  ),

                  SprawData(
                      id: 'komediant',
                      title: 'Komediant',
                      level: 2,
                      tasks: [
                        'Umie przygotować się do pierwszoplanowej roli w krótkim przedstawieniu (nauczyć się dialogów, odtworzyć charakter i motywacje postaci) oraz śmiało tę rolę odegrać.',
                        'Potrafi posługiwać się różnymi formami wyrazu (np. wykonać scenkę pantomimiczną, zinterpretować piosenkę, wydeklamować wiersz).',
                        'Umie wykonać kilka ćwiczeń dykcji i emisji głosu.'
                      ]
                  ),

                  SprawData(
                      id: 'gawedziarz',
                      title: 'Gawędziarz',
                      level: 2,
                      tasks: [
                        'Potrafi przed publicznością wygłosić krótką wypowiedź na zadany temat (np. relację z wędrówki), zachowując logiczny ciąg i płynność wypowiedzi.',
                        'W trakcie wypowiedzi umie zachować właściwą postawę ciała i utrzymać kontakt ze słuchaczami.',
                        'Potrafi wykonać kilka ćwiczeń dykcji i emisji głosu.'
                      ]
                  ),

                  SprawData(
                      id: 'aktor',
                      title: 'Aktor',
                      level: 3,
                      tasks: [
                        'Potrafi przygotować się do występu scenicznego przed publicznością (np. teatru amatorskiego), współpracując przy tym z reżyserem i scenografem.',
                        'Umie wymyślić i nadać realizowanej postaci cechy szczególne, zarówno w dykcji jak i w ruchach. Potrafi pokazać różne emocje.',
                        'Potrafi wymienić kilku lubianych przez siebie aktorów teatralnych lub filmowych, wskazać ich najlepsze role i uzasadnić swoje zdanie.',
                        'Zna i umie poprowadzić kilka ćwiczeń aktorskich (np. z teatru improwizowanego).'
                      ]
                  ),

                  SprawData(
                      id: 'mowca',
                      title: 'Mówca',
                      level: 3,
                      tasks: [
                        'Potrafi przygotować i wygłosić wypowiedź (np. gawędę lub referat) dotyczącą wybranego tematu. Umie w przekonujący i porywający sposób przekazać swoją myśl w czasie nie dłuższym niż 7 minut.',
                        'Potrafi dobrać formę i ton (np. modulację głosu, ułożenie treści, dynamikę wypowiedzi, argumentację, postawę) adekwatne do tematu wypowiedzi i grona słuchaczy.',
                        'Umie używać figur retorycznych (np. pytań retorycznych, porównań, metafor).',
                        'Potrafi wypowiedzieć się na wybrany temat w krótkiej improwizowanej formie, nie korzystając z notatek.',
                        'Przygotowując wypowiedź, umie korzystać z różnych źródeł i w trakcie wypowiedzi umiejętnie się na nie powołać.'
                      ]
                  ),

                ]
            )

          ]
      ),

      SprawGroupData(
          id: 'sport_turystyka_i_krajoznawstwo',
          title: 'Sport, turystyka i krajoznawstwo',
          familyData: [

            SprawFamilyData(
                id: 'krajoznawstwo_i_wedrowanie',
                title: 'Krajoznawstwo i wędrowanie',
                tags: ['#szlak', '#plecak', '#mapa', '#droga', '#ruch', '#wytrzymałość', '#ciekawość', '#obserwacja', '#góry', '#las', '#zima', '#dzikość', '#woda', '#ogień', '#natura'],
                fragment: 'Poszukiwani mężczyźni na niebezpieczną wyprawę. Niskie wynagrodzenie, siarczysty mróz, długie godziny w zupełnej ciemności. Powrót wielce niepewny. Honor i uznanie w przypadku powodzenia.',
                fragmentAuthor: 'Ogłoszenie zamieszczone zimą 1913 roku w jednej z brytyjskich gazet w związku z rekrutacją załogi na ekspedycję na Biegun Południowy pod kierownictwem polarnika, podróżnika i brytyjskiego oficera Sir Ernesta Shackletona.',
                sprawData: [

                  SprawData(
                      id: 'lazik',
                      title: 'Łazik',
                      level: 1,
                      tasks: [
                        'Umie odpowiednio się ubrać, skompletować ekwipunek i poradzić sobie podczas całodniowej wędrówki.',
                        'Potrafi opowiedzieć o poznanych w czasie wędrówki zabytkach lub osobliwościach przyrodniczych.',
                        'Na planie miasta lub mapie turystycznej umie wskazać ważne obiekty oznaczone w legendzie i do nich dotrzeć.',
                      ]
                  ),

                  SprawData(
                      id: 'wloczega',
                      title: 'Włóczęga',
                      level: 2,
                      tasks: [
                        'Potrafi, posługując się mapą, odwiedzić wskazane miejsca i zdobyć informacje na temat ich historii, wartości kulturowych lub przyrodniczych.',
                        'Umie poprowadzić zastęp trasą wyznaczoną według mapy lub planu miasta.',
                        'Potrafi zaplanować podróż różnymi środkami komunikacji. Umie spośród różnych form podróżowania na zadanej trasie wybrać najszybszy, najtańszy lub najkrótszy wariant.',
                        'Potrafi spakować się na kilkudniową wędrówkę.'
                      ]
                  ),

                  SprawData(
                      id: 'wskazidroga',
                      title: 'Wskazidroga',
                      level: 2,
                      tasks: [
                        'Korzystając z różnych źródeł (np. internetowe mapy, rozkłady jazdy) potrafi wskazać odpowiednio najkrótszą, najszybszą, najtańszą czy najwygodniejszą drogę we wskazane miejsce.',
                        'Doskonale zna swoją okolicę (np. miejscowość, dzielnicę), wie gdzie znajdują się w ważne i interesujące obiekty publiczne, takie jak teatr, kino, dom kultury, sklep, biblioteka, bank, dworzec czy kościół i potrafi szczegółowo opisać z pamięci jak do nich dotrzeć.',
                        'Potrafi opowiedzieć, skąd wzięła się nazwa rodzinnej miejscowości oraz narysować jej herb (jeśli miejscowość go posiada).',
                      ]
                  ),

                  SprawData(
                      id: 'wedrowiec',
                      title: 'Wędrowiec',
                      level: 3,
                      tasks: [
                        'Potrafi zaplanować i przeprowadzić kilkudniową wędrówkę w nieznanym regionie, obejmującą poznanie historii, zabytków kultury, etnografii lub wartości przyrodniczo-krajobrazowych.',
                        'Umie do przygotowania wędrówki wykorzystać różne źródła informacji (np. książki historyczne, przewodniki, informacje z Internetu).',
                        'Potrafi zorganizować zdalnie nocleg, posiłek i przewodnika po danym miejscu; umie rozliczyć wycieczkę.',
                        'Umie dobrać ekwipunek adekwatny do planowanej wyprawy.',
                      ]
                  ),

                  SprawData(
                      id: 'wedrowiec_gorski',
                      title: 'Wędrowiec Górski',
                      level: 3,
                      tasks: [
                        'Potrafi zaplanować i przeprowadzić kilkudniową górską wędrówkę. Zna i stosuje zasady bezpieczeństwa w górach, m.in. zwraca uwagę na pogodę, prowiant, ubiór i samopoczucie zespołu.',
                        'Potrafi ocenić trudność szlaku oraz dobrać odpowiednią dla danej grupy trasę. Na podstawie przewyższenia i długości trasy umie oszacować czas marszu (np. przeliczając długość i przewyższenie na punkty GOT). Zna przepisy dotyczące poruszania się po górach powyżej 1000 m n.p.m.',
                        'Posiada sprawność **Sanitariusza ze ścieżki „Samarytanka”.',
                      ]
                  ),

                  SprawData(
                      id: 'przewodnik',
                      title: 'Przewodnik',
                      level: 3,
                      tasks: [
                        'Potrafi zaplanować, zorganizować i przeprowadzić tematyczną wycieczkę po rodzinnym mieście lub regionie.',
                        'Zna w swoim mieście lub regionie 10 miejsc, które warto odwiedzić, i umie o nich opowiedzieć.',
                        'Potrafi znaleźć w dostępnych źródłach (np. w internecie, książkach lub przewodnikach) informacje poszerzające jego wiedzę na temat miasta lub regionu.',
                        'Posiada sprawność **Gawędziarza ze ścieżki „Aktorstwo i teatr”.'
                      ]
                  ),

                  SprawData(
                      id: 'nartobiegacz',
                      title: 'Nartobiegacz',
                      level: 3,
                      tasks: [
                        'Umie sprawnie poruszać się na nartach biegowych stylem klasycznym i łyżwowym. Potrafi poprawnie posługiwać się kijami i dobrać ich wysokość. Umie iść na nartach w kopnym śniegu, bez przetartego śladu.',
                        'Potrafi nie wypinając nart obrócić się w miejscu w trzech ruchach bez utraty równowagi. Jadąc na nartach z plecakiem umie utrzymać równowagę.',
                        'Potrafi zaplanować kilkudniową wędrówkę narciarską, skompletować potrzebny ekwipunek i poradzić sobie w jej trakcie.',
                        'Umie wykonać drobne prace serwisowe przy nartach (np. wymienić zepsute wiązanie lub nasmarować narty).'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'jazda_na_rowerze',
                title: 'Jazda na rowerze',
                tags: ['#droga', '#ruch', '#siła', '#szlak', '#wytrzymałość', '#ciekawość', '#technika', '#oddech', '#mapa', '#narzędzia'],
                fragment: 'Po dwóch latach B-P otrzymał urlop na wyjazd do kraju. Miał zamiar wreszcie porządnie wypocząć, ponieważ nieustanna aktywność w czasie służby i po niej bardzo go wyczerpała. (…) Od razu po powrocie zauważył, że z ulic Londynu zniknęły przedpotopowe rowery z ogromnymi przednimi kołami i maleńkimi tylnymi. Pojawiły się za to niższe rowery z wolnobieżką, hamulcem uruchamianym pedałami i niemal jednakowymi kołami. Produkowano je od dwóch lat i to one decydowały teraz o wyglądzie miasta. B-P kupił sobie zaraz taki rower i często pedałował na nim po ulicach Londynu. „Rower w wielkim mieście jest jak wierzchowiec na stepie – powiedział do jednego z przyjaciół. – Pozwala szybko przebywać duże odległości, więcej przeżyć i więcej zobaczyć. I ma tę zaletę, że nie trzeba go karmić.',
                fragmentAuthor: 'Walter Hansen, „Wilk, który nigdy nie śpi”',
                sprawData: [

                  SprawData(
                      id: 'rowerzysta',
                      title: 'Rowerzysta',
                      level: 1,
                      tasks: [
                        'Potrafi przygotować rower i ekwipunek na jednodniową wyprawę rowerową.',
                        'Umie przejechać na rowerze 30 km w ciągu jednego dnia.',
                        'Potrafi wykonać przy rowerze drobne prace, takie jak smarowanie łańcucha, zamontowanie oświetlenia lub błotnika. Umie wymienić dętkę.'
                      ]
                  ),

                  SprawData(
                      id: 'cyklista',
                      title: 'Cyklista',
                      level: 2,
                      tasks: [
                        'Potrafi przygotować się i poradzić sobie podczas kilkudniowej wyprawy rowerowej.',
                        'Umie samodzielnie wyregulować hamulce i przerzutki oraz wykonać prace takie jak zamontowanie bagażnika czy dokręcenie pedału.',
                        'Potrafi poruszać się rowerem zgodnie z przepisami ruchu drogowego.'
                      ]
                  ),

                  SprawData(
                      id: 'kolarz',
                      title: 'Kolarz',
                      level: 3,
                      tasks: [
                        'Umie przejechać na rowerze 100 km w ciągu jednego dnia.',
                        'Potrafi zaplanować kilkudniową wyprawę rowerową, umiejętnie dobierając potrzebny ekwipunek (np. namioty, narzędzia do naprawy rowerów, części zapasowe) i rozdzielając go między uczestników wyprawy.',
                        'Umie naprawić rower w trasie podczas wyprawy.',
                        'Potrafi udzielić pierwszej pomocy w przypadku urazów typowych dla rowerzystów. Posiada sprawność **Sanitarusza ze ścieżki „Samarytanka”.'
                      ]
                  ),

                  SprawData(
                      id: 'kurier_rowerowy',
                      title: 'Kurier rowerowy',
                      level: 3,
                      tasks: [
                        'Potrafi efektywnie poruszać się rowerem po mieście stosując się do zasad ruchu drogowego, nie utrudniając poruszania się pieszym i samochodom.',
                        'Umie dobrać trasę przejazdu w taki sposób, aby jak najrzadziej się zatrzymywać i schodzić z roweru.',
                        'Potrafi dobrze oszacować czas przejazdu na zadanej trasie z uwzględnieniem warunków drogowych, pogodowych, pory dnia, kondycji i wytrzymałości sprzętu.',
                        'Umie samodzielnie złożyć rower.',
                        'Umie w bezpieczny i szybki sposób przewieźć na rowerze przesyłkę (np. pudło lub rulon).'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'plywanie',
                title: 'Pływanie',
                tags: ['#woda', '#ruch', '#oddech', '#wytrzymałość', '#rytm', '#siła', '#technika', '#woda', '#oddech', '#odpowiedzialność', '#natura'],
                fragment: 'Zwycięstwo sportowe imponuje otoczeniu. Zośka był niemal zawsze zwycięzcą. Zwycięstwa kierowały nań spojrzenia kolegów. Równocześnie zaczęto stwierdzać rzecz inną: Zośka był uparty, uparty w sposób niezwykle drażniący. Rzadko to się zdarzało. Przeważnie albo nie zajmował stanowiska wobec rozgrywających się wypadków, albo też ustępował nalegającym. Gdy jednak zaciął się w jakiej decyzji – nic go nie mogło przełamać. Szczególnie gdy upór wsparł się o inny potężny czynnik duszy Zośki – o ambicję. Zośka w dzieciństwie bał się wody. Rzeka, jezioro, morze – odpychały go od siebie z jakąś przemożną siłą. Nie chciał nigdy wchodzić do wody powyżej piersi. Aż ktoś kiedyś poruszył w nim nutę ambicji i wywołał decyzję. Już przy końcu sezonu Zośka pływał bez niczyjej pomocy, zbudował kajak, w dwa lata potem był dobrym pływakiem i wreszcie w zawodach pływackich, jako najlepszy z „Buków”, zaczął reprezentować zespół. Sporty, ambicja, upór wyrabiały mu, rzecz oczywista, pewną sławę. Sława jednak koleżeńska był czymś, o co Zośka mało dbał. Aleksander Kamiński, „Kamienie na szaniec” --- UWAGA! Spełniając wymagania na Pływaka ** bez problemu możesz podjąć się zdobycia państwowej Karty Pływackiej. Tak samo posiadając sprawność Delfina *** z łatwością zdobędziesz “Żółty Czepek”. Na obozie poproś Ratownika WOPR o organizację stosownego egzaminu!',
                sprawData: [

                  SprawData(
                      id: 'kijanka',
                      title: 'Kijanka',
                      level: 1,
                      tasks: [
                        'Potrafi przepłynąć bez przerwy dystans 100 m w wodzie stojącej lub dystans 200 m z nurtem.',
                        'Umie stabilnie utrzymywać się na powierzchni wody.',
                        'Potrafi skoczyć do wody z wysokości 0,5 m.',
                        'Umie wstrzymać oddech pod wodą przez 10 s.'
                      ]
                  ),

                  SprawData(
                      id: 'plywak',
                      title: 'Pływak',
                      level: 2,
                      tasks: [
                        'Potrafi przepłynąć dystans 200 m w wodzie stojącej, w tym przynajmniej 50 m stylem grzbietowym, lub dystans 400 m z nurtem, w tym przynajmniej 100 m stylem grzbietowym.',
                        'Umie przepłynąć pod wodą dystans 5 m w wodzie stojącej lub 15 m z nurtem.',
                        'Potrafi bezpiecznie wskoczyć do wody z wysokości 0,7 m.',
                        'Umie przepłynąć 20 m w ubraniu.',
                        'Potrafi wyłowić z głębokości 2 m przedmiot wielkości menażki.',
                        'Umie wyjść z wody na łódkę lub ponton.'
                      ]
                  ),

                  SprawData(
                      id: 'plywak_doskonaly',
                      title: 'Pływak Doskonały',
                      level: 3,
                      tasks: [
                        'Potrafi przepłynąć w wodzie dystans 1000 m co najmniej dwoma stylami.',
                        'Umie przepłynąć 15 m pod wodą, a także zdjąć w wodzie ubranie: koszulę, spodnie i buty.',
                        'Potrafi wyznaczyć i przygotować bezpieczne kąpielisko (np. wyznaczyć granice, oczyścić dno) dla osób w różnym wieku.',
                        'Umie pływać z płetwami oraz maską i rurką oraz wyłowić z głębokości 3 m przedmiot wielkości menażki.',
                        'Potrafi posługiwać się kołem ratunkowym, rzutką, linką ratowniczą.',
                        'Umie udzielić pierwszej pomocy osobie podtopionej, posiada sprawność **Sanitariusza ze ścieżki „Samarytanka”.'
                      ]
                  ),

                  SprawData(
                      id: 'delfin',
                      title: 'Delfin',
                      level: 3,
                      tasks: [
                        'Potrafi przepłynąć 50 m w czasie nie dłuższym niż 45 s.',
                        'Umie poprawnie pływać co najmniej czterema stylami w tym stylem motylkowym (tzw. delfinem).',
                        'Potrafi przepłynąć w wodzie stojącej dystans 1500 m, płynąc co najmniej dwoma stylami, z czego przynajmniej 200 m stylem grzbietowym.',
                        'Umie wykonać bezpieczny skok do wody z wysokości 1 m.',
                        'Potrafi zanurkować na głębokość 3 m i przepłynąć 20 m pod wodą.'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'kajakarstwo',
                title: 'Kajakarstwo',
                tags: ['#woda', '#współpraca', '#ruch', '#wytrzymałość', '#las', '#plecak', '#szlak', '#góry', '#ciekawość', '#siła', '#technika', '#mapa', '#narzędzia', '#natura'],
                fragment: 'Biebrza, wijąc się kręto wśród łąk zielonych i gęstych stogów siana, w brzasku porannym dymiła ławami oparów. Różowa łuna rannej zorzy zwiastowała dolinie rychłe przybycie zza lasu słońca, któremu przyroda zgotowała na powitanie nieporównaną woń świeżości łąk i gajów nadbiebrzańskich. Oddychałem głęboko całą piersią i myślałem sobie w tej chwili, jacy też to są biedni i godni politowania ci mieszczanie po wielkich miastach, którzy w swych okazałych kazamatach, w kajdanach puchowych pościeli i w zaduchu pachnideł, nigdy tak uroczego wschodu słońca nie widzą i krwi swojej wonią rosy porannej nie krzepią, ani duszy widokami tej dziewiczej natury, która wychowuje na niwie umysłu najszlachetniejszy ze wszystkich kwiatów, kwiat miłości do rodzinnej zagrody i domowego ogniska ojców swoich.',
                fragmentAuthor: 'Zygmunt Gloger, „Dolinami rzek”',
                sprawData: [

                  SprawData(
                      id: 'wioslarz',
                      title: 'Wioślarz',
                      level: 1,
                      tasks: [
                        'Umie wiosłować i wykonywać podstawowe manewry: skręcać, cofać i obracać się w miejscu.',
                        'Potrafi się odpowiednio przygotować i poradzić sobie podczas całodniowej wycieczki kajakowej lub na dystansie 10 km.',
                        'Umie wsiąść do kajaka z brzegu i z pomostu.'
                      ]
                  ),

                  SprawData(
                      id: 'kajakarz',
                      title: 'Kajakarz',
                      level: 2,
                      tasks: [
                        'Umie przygotować się i poradzić sobie w czasie kilkudniowego spływu kajakowego, w tym zabezpieczyć bagaż przed przemoczeniem.',
                        'Potrafi pokonać przeszkody na rzece takie jak zwalone drzewa, płycizny, mosty, bystry nurt itp..',
                        'Umie wejść do kajaka z wody, nie wywracając go.',
                        'Potrafi poradzić sobie w razie wywrotki i wypadnięcia z kajaka.',
                        'Umie zacumować kajak we wskazanym miejscu, zadbać o sprzęt i go zabezpieczyć (np. wylać wodę z kajaka i go osuszyć).',
                        'Posiada sprawność *Kijanki ze ścieżki „Pływanie”.'
                      ]
                  ),

                  SprawData(
                      id: 'kajakarz_doskonaly',
                      title: 'Kajakarz doskonały',
                      level: 3,
                      tasks: [
                        'Potrafi zaplanować i przeprowadzić kilkudniowy i kilkuosobowy spływ (zorganizować mapy, wyposażenie biwakowe, rozdział ekwipunku na kajaki, miejsca noclegowe itd.).',
                        'Umie dbać o bezpieczeństwo spływu w różnych warunkach terenowych, umie pełnić funkcję otwierającego spływ.',
                        'Potrafi pomóc załodze wywróconego kajaka, umie holować kajakarza na dziobie swojego kajaka.',
                        'Zna i stosuje przepisy dotyczące turystyki kajakowej.',
                        'Umie naprawić podstawowe uszkodzenia kajaka i wiosła.',
                        'Potrafi udzielić pierwszej pomocy osobie podtopionej, posiada sprawność **Sanitariusza ze ścieżki „Samarytanka”.'
                      ]
                  ),

                  SprawData(
                      id: 'kajakarz_gorski',
                      title: 'Kajakarz górski',
                      level: 3,
                      tasks: [
                        'Umie spłynąć jednoosobowym kajakiem z fartuchem rzeką z odcinkami górskimi.',
                        'Potrafi przygotować się do niebezpiecznego spływu (kask, odpowiedni ubiór, odpowiedni kajak itd.).',
                        'Potrafi zrobić eskimoskę i w razie potrzeby wyjść z kajaka z fartuchem w razie wywrotki.',
                        'Zna zasady spływania po rzece górskiej, wie jak zachować się w trudnych sytuacjach.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'zeglarstwo',
                title: 'Żeglarstwo',
                tags: ['#woda', '#wiatr', '#współpraca', '#zespół', '#obserwacja', '#ruch', '#wytrzymałość', '#plecak', '#dzikość', '#karność', '#ciekawość', '#technika', '#słowo #mapa', '#narzędzia', '#natura'],
                fragment: 'Dom na Bellamy Cay wzniesiono z kamienia zebranego na nadbrzeżach okolicznych wysp i jest to pierwszy kamienny dom na całych Karaibach. Zbudował go Władysław Wagner, Polak. Pierwszy nasz rodak, który w latach 1932–39 pod żaglami opłynął świat dookoła. Na Beef Island zbudował pierwsze na Wyspach Dziewiczych lotnisko. I o tym też mało kto wie. Zatarły się ślady, już nikt nie pamięta. A warto je odgrzebać.(…) Zaczyna się ta historia w lipcu 1932 roku w Gdyni. Z dopiero co wybudowanego portu w dalekomorski rejs wypływa jacht „Zjawa” z dwuosobową załogą. Dowodzi nim Władysław Wagner, dwudziestoletni harcerz z Gdyni, pomysłodawca całego przedsięwzięcia, oraz Rudolf Korniowski z tej samej morskiej drużyny harcerskiej im. Jana Sobieskiego. Dwóch innych członków zrejterowało. Obaj z niewielkim jeszcze morskim doświadczeniem i na niezbyt doskonałym jachcie z wielkimi trudami przepłynęli Bałtyk, Morze Północne, poradzili sobie na wodach zawsze wściekłej Zatoki Biskajskiej, aż dotarli do… krańca wytrzymałości finansowych. Zatrzymali się w hiszpańskim porcie Santander. Bez pieniędzy i na mocno zdezelowanym jachcie. (…) W tym czasie Władek wysłał do „Kuriera Krakowskiego” propozycję reportaży z rejsu z pierwszą oficjalnie podaną do Polski informacją, że jest to rejs dookoła świata.',
                fragmentAuthor: 'Zbigniew Turkiewicz, „Zjawy czyli odyseja Władysława Wagnera”',
                sprawData: [

                  SprawData(
                      id: 'szotmen',
                      title: 'Szotmen',
                      level: 1,
                      tasks: [
                        'Potrafi wykorzystywać podstawowe węzły żeglarskie, w tym: prosty, szotowy i cumowniczy.',
                        'Umie obsługiwać (wybierać, luzować, knagować) szoty i talie.',
                        'Potrafi posługiwać się pagajami i wykonywać prawidłowo polecenia sternika na pagaje.',
                        'Umie prawidłowo posługiwać się odbijaczami, bosakiem, a także nabrać wodę do wiadra podczas żeglugi.',
                        'Przestrzega zasad bezpieczeństwa na jachcie.'
                      ]
                  ),

                  SprawData(
                      id: 'mlodszy_sternik',
                      title: 'Młodszy Sternik',
                      level: 2,
                      tasks: [
                        'Potrafi sterować na wiatr, na punkt i wg. kompasu, umie ostrzyć i odpadać, a także wykonywać wszelkie komendy na ster podczas manewrów.',
                        'Umie pokierować stawianiem, zrzucaniem i klarowaniem żagli.',
                        'Potrafi prawidłowo refować żagle, wie do czego służy czynność refowania.',
                        'Umie prawidłowo zacumować łódź, wydając właściwe komendy na cumy i szpringi.'
                      ]
                  ),

                  SprawData(
                      id: 'sternik_manewrowy',
                      title: 'Sternik Manewrowy',
                      level: 3,
                      tasks: [
                        'Potrafi wykonać prawidłowo zwrot przez sztag i przez rufę, wydając właściwe komendy załodze.',
                        'Umie wykonać prawidłowo podejście oraz odejście od i do nabrzeża (pomostu) na żaglach wydając odpowiednie komendy załodze.',
                        'Potrafi pokierować jachtem (wykonać manewr) w trakcie alarmu „człowiek za burtą”.',
                        'Umie poprawnie stanąć na kotwicy i z niej zejść.',
                        'Potrafi dokonać przeglądu stanu jachtu (takielunek, kadłub, ster) przed i po pływaniu.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'sporty_zespolowe',
                title: 'Sporty zespołowe',
                tags: ['#współpraca', '#zespół', '#współzawodnictwo', '#ruch', '#wytrzymałość', '#harmonia', '#technika', '#słowo', '#odpowiedzialność', '#emocje', '#zwinność', '#zasady', '#rozmowa'],
                fragment: 'Do przerwy wynik meczu nie uległ zmianie. Gdy sędziowski gwizdek oznajmił początek drugiej połowy meczu, Maniuś zacisnął mocno pięści i wyszeptał: – Teraz albo nigdy. Roziskrzonymi z podniecenia oczami wodził za żółtą piłką. Raz był przy niej gracz w biało-czarnym dresie, raz czerwona koszulka „antylopiarza”. (…) – „Syrenka”! „Syrenka”! „Syrenka”! – wrzeszczeli kibice z Woli. Momentalnie odpowiadali im mieszkańcy Muranowa, którzy skupili się przy bramce swej ukochanej drużyny. – „Antylopa!” „Antylopa!” „Antylopa!” – odzywał się chór dobrze zgranych głosów. A na boisku trwała zacięta walka. „Syrenka” pragnęła za wszelką cenę wyrównać, „Antylopa” zaś za wszelką cenę utrzymać wynik i zejść zwycięsko z boiska. – Może teraz – szepnął do siebie Paragon. Mietek Gralewski bił właśnie rzut rożny. Wziął kilka kroków rozbiegu i miękkim kopnięciem posłał piłkę w pole. Zatoczyła łuk nad głowami graczy. Bramkarz „Antylopy” wyskoczył wysoko, chcąc ją złapać w swe dłonie, ale wymknęła mu się. Mandżaro wyprysnął jak spod ziemi i głową skierował piłkę do bramki. (…) Za bramką „Syrenki” pofrunęły do góry czapki niby chmara gołębi. Na boisku chłopcy obskoczyli Mandżaro ściskając go i całując. Wszędzie szeptano: „Teraz będzie ciekawy mecz. Zobaczymy, kto wygra.” (…) – „Syrenka”, gola! Gooola! Adam Bahdaj, „Do przerwy 0:1” --- Sprawności z tej ścieżki zdobywa się w wybranej dyscyplinie sportu. Można je zdobywać wielokrotnie zmieniając dyscyplinę.',
                sprawData: [

                  SprawData(
                      id: 'sportowiec',
                      title: 'Sportowiec',
                      level: 1,
                      tasks: [
                        'Umie aktywnie uczestniczyć w rozgrywce wybranej gry zespołowej i stosować się do jej zasad.',
                        'Rozróżnia funkcje poszczególnych graczy i potrafi objąć różne role w zespole.'
                      ]
                  ),

                  SprawData(
                      id: 'zawodnik',
                      title: 'Zawodnik',
                      level: 2,
                      tasks: [
                        'Umie grać na wybranej pozycji lub w wybranej roli w zespole stosując specjalistyczne techniki gry z nią związane (np. piąstkowanie bramkarza w piłce nożnej, krótki atak w siatkówce, rzut za 3 pkt w koszykówce).',
                        'Zna dokładnie zasady wybranego sportu zespołowego zgodne z międzynarodowym regulaminem.',
                        'Zawsze gra fair play i potrafi przekonać do tego innych członków zespołu.',
                        'Umie prawidłowo rozgrzać się wykonując kilka ćwiczeń przed rozgrywką.'
                      ]
                  ),

                  SprawData(
                      id: 'trener',
                      title: 'Trener',
                      level: 3,
                      tasks: [
                        'Umie przygotować zespół (np. zastęp) do zawodów sportowych: zaznajomić graczy z zasadami, ustalić i omówić strategię gry, przydzielić role i zadania, opracować i przeprowadzić plan treningowy (systematyczne spotkania, odpowiednie ćwiczenia itd.).',
                        'Potrafi przeprowadzić prawidłową rozgrzewkę zespołu.',
                        'Posiada sprawność Rozjemcy ze ścieżki „Komunikacja”.',
                      ]
                  ),

                  SprawData(
                      id: 'sedzia',
                      title: 'Sędzia',
                      level: 3,
                      tasks: [
                        'Umie sędziować, zachowując bezstronność i nie przeszkadzając w rozgrywce.',
                        'Potrafi skoordynować pracę zespołu sędziowskiego (np. sędziów liniowych, pomocników i sekretarza).',
                        'Umie ocenić jakość i przygotowanie obiektu (np. sali gimnastycznej, boiska) do przeprowadzenia zawodów.',
                        'Posiada sprawność Rozjemcy ze ścieżki „Komunikacja”.'
                      ]
                  ),

                  SprawData(
                      id: 'organizator_sportowy',
                      title: 'Organizator Sportowy',
                      level: 3,
                      tasks: [
                        'Potrafi zorganizować i przeprowadzić rozgrywki w wybranej dyscyplinie sportu zespołowego: przygotować boisko i sprzęt sportowy, załogę sędziowską, nagrody, regulamin, zorganizować zapisy, podsumować wyniki itd..',
                        'Zna zasady działania lig i turniejów w swojej dyscyplinie sportowej (np. sposób wyłaniania drużyn w turniejach, zasady losowania grup, zasady poruszania się zawodników między ligą narodową a klubową lub okna transferowe).',
                        'Umie zadbać o bezpieczeństwo graczy i widzów podczas zawodów.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'bieganie',
                title: 'Bieganie',
                tags: ['#ruch', '#wytrzymałość', '#siła #rytm', '#szlak', '#technika', '#dyscyplina', '#oddech'],
                fragment: 'Tego dnia, tak bez przyczyny, postanowiłem trochę pobiegać. Pobiegłem do końca drogi, a kiedy tam dotarłem, pomyślałem, że pobiegnę na koniec miasta. A kiedy tam dotarłem, pomyślałem sobie, że przebiegnę przez hrabstwo Greenbow. A skoro dotarłem aż tak daleko, dlaczego miałbym nie przebiec przez cały stan Alabama? Tak właśnie zrobiłem. Przebiegłem przez Alabamę. Bez żadnego powodu. Po prostu biegłem dalej. Dobiegłem do oceanu. Pomyślałem, że skoro przebiegłem taki szmat drogi, to równie dobrze mógłbym zawrócić i biec dalej. Kiedy dotarłem do drugiego oceanu pomyślałem, że skoro jestem aż tutaj, to mógłbym równie dobrze zawrócić i biec z powrotem. Kiedy się zmęczyłem, szedłem spać. Kiedy zgłodniałem, jadłem. Kiedy musiałem pójść do… no wie pani… to szedłem.',
                fragmentAuthor: 'Winston Groom, „Forrest Gump”',
                sprawData: [

                  SprawData(
                      id: 'truchcik',
                      title: 'Truchcik',
                      level: 1,
                      tasks: [
                        'Umie przygotować się do wysiłku poprzez prawidłową rozgrzewkę.',
                        'Potrafi przebiec bez przerwy dystans 1 km.'
                      ]
                  ),

                  SprawData(
                      id: 'sprinter',
                      title: 'Sprinter',
                      level: 2,
                      tasks: [
                        'Umie przebiec dystans 100 m w czasie poniżej 16 s.',
                        'Umie przebiec bez przerwy dystans 2 km.',
                        'Potrafi wystartować do biegu ze startu niskiego i wysokiego.',
                        'Umie wykonać 5 ćwiczeń przydatnych w treningu siłowym dla biegacza.'
                      ]
                  ),

                  SprawData(
                      id: 'biegacz',
                      title: 'Biegacz',
                      level: 3,
                      tasks: [
                        'Potrafi pokonać dystans 5 km w czasie krótszym niż 25 min.',
                        'Umie przygotować swój organizm do konkretnego treningu, takiego jak trening siłowy, kondycyjny, wysokogórski, rozciąganie.',
                        'Potrafi obliczyć swoje tętno maksymalne, wie co to jest głód tlenowy.',
                        'Umie wykonać 10 ćwiczeń siłowych uzupełniających trening biegowy (np. skipy, przysiady, wykroki lub pajacyki).',
                        'Potrafi przygotować się do biegania w zależności od rodzaju terenu i typu treningu (np. dobrać odpowiednie obuwie).'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'akrobatyka',
                title: 'Akrobatyka',
                tags: ['#ruch', '#zwinność', '#technika', '#wytrzymałość', '#harmonia', '#siła'],
                fragment: 'Podczas podnoszenia bandery na gaflu linka, nie dowiązana jeszcze do dolnego końca, wysunęła się z ręki jednego z uczniów i bandera poleciała do góry. Na rufie koło kapitana stał pilot, Niemiec. Ci z „narodu” którzy byli na rufie, odczuli to jak wystawienie się na pośmiewisko. Najszybciej zorientował się nasz wicemistrz Warszawy w boksie, Siaś, o cerze dziecka i błękitnych, niewinnych oczach (im to zawdzięczał tego “Siasia”). Skoczył do liny, po której można było dostać się na wierzchołek gafla, i na rękach tylko, bez pomocy nóg przebył tę kilkunastometrową odległość, jak gdyby to było zwykłe, nic nie znaczące ćwiczenie. Złapał koniec linki, która „uciekła” do góry, po czym tak samo lekko i zwinnie wrócił na dół. Pilot zwrócił się kapitana ze słowami uznania dla takiego wyczynu. Ale kapitan, podobnie jak i „naród”, był zbyt pod wrażeniem okazanej przy podnoszeniu bandery nieuwagi, by zaliczyć wyczyn Siasia do zjawisk odbiegających od normalnych na „Lwowie”.',
                fragmentAuthor: 'Karol Olgierd Borchardt, „Znaczy Kapitan”',
                sprawData: [

                  SprawData(
                      id: 'gibki',
                      title: 'Gibki',
                      level: 1,
                      tasks: [
                        'Umie sprawnie wykonać poprawny przewrót w przód i w tył oraz 15 pompek, 25 przysiadów i 20 brzuszków.',
                        'Potrafi zawisnąć na drążku przez 20 s na rękach oraz 10 s trzymając się wyłącznie nogami.'
                      ]
                  ),

                  SprawData(
                      id: 'gimnastyk',
                      title: 'Gimnastyk',
                      level: 2,
                      tasks: [
                        'Umie podciągnąć się oburącz na drążku podchwytem i nachwytem.',
                        'Potrafi stabilnie stać na rękach, opierając nogi o ścianę.',
                        'Umie przeskoczyć przeszkodę sięgającą do pasa, opierając się o nią wyłącznie rękami.',
                        'Potrafi przejść kilka metrów po naciągniętej linie, trzymając się drugiej liny, lub po linie typu slackline.',
                        'Umie poprowadzić prawidłową rozgrzewkę, uwzględniając różne ćwiczenia i partie ciała.',
                      ]
                  ),

                  SprawData(
                      id: 'akrobata',
                      title: 'Akrobata',
                      level: 3,
                      tasks: [
                        'Potrafi na drążku zawisnąć przez 60 s, wykonać wymyk przodem oraz wejście siłowe (tzw. muscle up).',
                        'Umie bez podparcia nogami stabilnie ustać na rękach przez kilkanaście sekund.',
                        'Potrafi, stosując odpowiednią technikę, bezpiecznie wejść po linie na wysokość 4 m.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'wspinaczka',
                title: 'Wspinaczka',
                tags: ['#siła', '#technika', '#oddech', '#współpraca', '#ruch', '#pomoc', '#wytrzymałość', '#góry', '#odpowiedzialność', '#droga', '#zwinność', '#narzędzia', '#opanowanie', '#natura'],
                fragment: 'Każdy chłopiec lubi się wspinać, a jeśli się wspinanie uprawia stale i nabierze w nim wprawy, będzie się je lubiło zawsze. Większość wielkich wspinaczy górskich rozpoczęła w chłopięcym wieku od wspinania się na linach i palach oraz po drzewach. Potem, ale znacznie potem – bo jeśli nie uzyskasz dużej wprawy i nie wzmocnisz należycie muskułów, to możesz spaść na łeb i wziąć udział w pogrzebie jako główny aktor - zaczyna się wspinaczkę po skałach i po górach.',
                fragmentAuthor: 'Robert Baden Powell, „Skauting dla chłopców”',
                sprawData: [

                  SprawData(
                      id: 'klama',
                      title: 'Klama',
                      level: 1,
                      tasks: [
                        'Umie poprawnie założyć uprząż, przywiązać się do liny węzłem „ósemka”, wspinać się z asekuracją górną („na wędkę”) z zachowaniem podstawowych zasad bezpieczeństwa, takich jak utrzymywanie kontaktu z asekurującym i wzajemna kontrola bezpieczeństwa przed rozpoczęciem wspinania.',
                        'Po osiągnięciu końcowego punktu drogi wspinaczkowej potrafi sprawnie i bezpiecznie zjechać na dół.',
                        'Umie przeprowadzić rozgrzewkę i rozciąganie przed oraz po wspinaczce.'
                      ]
                  ),

                  SprawData(
                      id: 'oblak',
                      title: 'Oblak',
                      level: 2,
                      tasks: [
                        'Potrafi przeprowadzić asekurację górną z użyciem samoblokującego się przyrządu asekuracyjnego (np. grigri).',
                        'Umie wspinać się z asekuracją dolną, potrafi samodzielnie skompletować sprzęt przed tego rodzaju wspinaczką, m.in. policzyć potrzebne expressy i pętle.',
                        'Potrafi porównać trudność dróg wspinaczkowych, sprawdzając w przewodniku ich wycenę według dowolnej skali.',
                        'Umie dbać o sprzęt wspinaczkowy i dokonać jego przeglądu pod kątem bezpieczeństwa.',
                      ]
                  ),

                  SprawData(
                      id: 'wspinacz',
                      title: 'Wspinacz',
                      level: 3,
                      tasks: [
                        'Potrafi wspinać się zarówno na ściance wspinaczkowej, jak i w naturalnych skałach.',
                        'Podczas wspinaczki z asekuracją dolną umie samodzielnie dokonać przewiązania na końcowym punkcie drogi wspinaczkowej z wykorzystaniem dowolnej techniki autoasekuracji.',
                        'Potrafi przeprowadzić asekurację dolną z użyciem samoblokującego się przyrządu asekuracyjnego.',
                        'Umie wykonać samodzielny zjazd po linie z użyciem przyrządu asekuracyjnego.',
                        'Potrafi udzielić pierwszej pomocy w przypadku urazów typowych dla wspinaczy. Posiada sprawność **Sanitariusza ze ścieżki „Samarytanka”.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'narty_i_snowboard',
                title: 'Narty i snowboard',
                tags: ['#zima', '#ruch', '#góry', '#technika', '#zwinność', '#oddech', '#las', '#szlak', '#wytrzymałość', '#natura'],
                fragment: 'Zaraz za mostem schowaliśmy jednak broń, kijki przepisowo w ręce, i teraz już ostrym krokiem, prawie biegiem, ku granicy, cały czas wzdłuż Stryja, zbłądzić nie można, najwyżej tylko wpaść na kogoś nieproszonego. Zmęczenie. Ale żadnych tu słabości, żadnych odpoczynków, długi płaski bieg aż do samotnej chaty, pod górę do znajomego stodu, do płotu, przeleźć przez ten płot do sadu, slalom między drzewami aż do stoku góry, ostre łyżwowe podejście, bardzo ostre, ale trzeba szybko, jak się nie da, to bokiem, schodkami: kijek, narta, narta, kijek, mozolnie, ale pewnie, potem pole, zakosami przez nie, potem lasek, znów pole i… grzbiet góry. Jeśli nas na tym polu nikt nie zatrzyma, to nigdy już nie zatrzyma, to będzie znaczyć, że się udało, bo tu… granica. Stoją tu gdzieś jeszcze betonowe słupki z literą „P” od północy, a „CS” od południa, ostatni raz widzieliśmy taki jeden, ale teraz pewnie przysypane są śniegiem. (…) No to mamy grzbiet, wysoko się zdaje, pachnie już tu Pikujem, który ma ponad 1400 metrów, więc bieg zjazdowy będzie nielichy. Panowie zawodnicy, nie czekajcie na strzał startowy, bezpieczniej bez strzałów. I w dół, w dół, aż do samej Laturki, tam nasza meta. Tymczasem już jesteśmy na terytorium Węgier.',
                fragmentAuthor: 'Marek Celt, „Biali Kurierzy”',
                sprawData: [

                  SprawData(
                      id: 'zjazd',
                      title: 'Zjazd',
                      level: 1,
                      tasks: [
                        'Umie przejechać na łagodnym stoku przynajmniej 15 m i w razie potrzeby bezpiecznie upaść.',
                        'Potrafi wstać po upadku, nie wypinając nart lub deski.',
                        'Umie samodzielnie przygotować się do aktywności na stoku: założyć wszystkie elementy stroju, zapiąć kask, założyć gogle, założyć buty i zapiąć je w wiązaniach.',
                        'Potrafi chodzić w butach narciarskich lub snowboardowych i odpowiednio przenosić sprzęt.',
                      ]
                  ),

                  SprawData(
                      id: 'szus',
                      title: 'Szus',
                      level: 2,
                      tasks: [
                        'Umie bez wywrotki przejechać przynajmniej 100 m na stoku o małym nachyleniu (np. na trasie „niebieskiej”), wykonując przy tym płynne skręty w obie strony i omijając przeszkody.',
                        'Potrafi wjechać na stok przy pomocy wyciągu orczykowego lub krzesełkowego.',
                        'Potrafi zatrzymać się w wyznaczonym miejscu.',
                        'Umie utrzymać w trakcie jazdy poprawną pozycję narciarską lub snowboardową.',
                      ]
                  ),

                  SprawData(
                      id: 'snowboardzista',
                      title: 'Snowboardzista',
                      level: 3,
                      tasks: [
                        'Potrafi przejechać trudną trasę zjazdową (np. czerwoną) utrzymując poprawną pozycję, korzystając z takich technik jak jazda na krawędzi i skręty cięte.',
                        'Umie jeździć z tylną nogą z przodu (tzw. switch) z zachowaniem poprawnej pozycji.',
                        'Potrafi przeskoczyć nad małą przeszkodą, taką jak mulda śniegu. Umie pokonać przeszkodę typu box.',
                        'Zna różne techniki jazdy na desce, wie jakie mają zastosowania i potrafi dopasować sprzęt do wybranej z nich.',
                      ]
                  ),

                  SprawData(
                      id: 'narciarz',
                      title: 'Narciarz',
                      level: 3,
                      tasks: [
                        'Potrafi przejechać trudną trasę zjazdową (np. czerwoną) utrzymując poprawną pozycję, korzystając z technik takich jak jazda na krawędziach, skręt długi i krótki.',
                        'Umie sprawnie i poprawnie technicznie przejechać slalom wymagający co najmniej kilkunastu skrętów (np. ustawiony z kijków).',
                        'Potrafi przejechać 20 m na jednej narcie oraz 30 m tyłem do przodu.',
                        'Umie samodzielnie wykonać drobne prace przy nartach (np. wyregulować długość i siłę wypinania wiązań i naostrzyć krawędzie).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'lyzwiarstwo',
                title: 'Łyżwiarstwo',
                tags: ['#zima', '#ruch', '#technika', '#zwinność', '#wytrzymałość', '#oddech'],
                fragment: '– Naprawdę nie znasz tej historii? – Nie. Opowiedz. Crach an Craite wychylił róg, zaśmiał się do swoich wspomnień. – Dzieciaki z Ard Skellig – zaczął – uwielbiają zimą bawić się na łyżwach, doczekać się nie mogą na mróz. Pierwsze wyłażą na lód, ledwo skuje jezioro, na taflę tak cienką, że dorosłych by nie utrzymała. Ma się rozumieć, najlepszą zabawą są wyścigi. Rozpędzić się i gnać, ile sił, z jednego krańca jeziora na drugi. Chłopaki zaś urządzają zawody w tak zwanym „skoku łososia”. Polega to na skakaniu na łyżwach przez przybrzeżne skałki, sterczące z lodu jak rekinie zęby. Tak jak łosoś, gdy skacze przez progi wodospadów. (…) W czasie, który nas bardziej interesuje, czempionem bywał mój syn, Hjalmar. Skakał przez takie kamienie, przez które żaden z chłopaków nie ośmielał się skoczyć. I chodził z zadartym nosem, wyzywając wszystkich, by próbowali go pokonać. I podjęto jego wyzwanie. Ciri, córka Pavetty z Cintry. (…) – Skoczyła – domyśliła się czarodziejka. – Skoczyła. Skoczyło to małe cintryjskie półdiablę. Prawdziwe Lwiątko z krwi Lwicy. A Hjalmar, by nie narazić się na pośmiewisko, musiał zaryzykować skok przez jeszcze dłuższy rząd kamieni. Zaryzykował. Złamał nogę, złamał rękę, złamał cztery żebra i rozwalił twarz. Do końca życia zostanie mu blizna. Hjalmar Krzywogęby!',
                fragmentAuthor: 'Andrzej Sapkowski, „Wieża Jaskółki” (Saga o Wiedźminie)',
                sprawData: [

                  SprawData(
                      id: 'ploza',
                      title: 'Płoza',
                      level: 1,
                      tasks: [
                        'Umie stabilnie stać na łyżwach i jeździć do przodu po lodowisku bez asekuracji.',
                        'Potrafi odpowiednio dobrać rozmiar i prawidłowo ubrać się w łyżwy, tak aby uniknąć odcisków i otarć.',
                      ]
                  ),

                  SprawData(
                      id: 'lyzwiarz',
                      title: 'Łyżwiarz',
                      level: 2,
                      tasks: [
                        'Umie jeździć tzw. przeplatanką oraz płynnie pokonać slalom.',
                        'Potrafi przejechać dystans równy 5 długościom pełnowymiarowego boiska bez żadnego upadku. Umie zmienić kierunek jazdy o 180 stopni wykonując łuk w lewo lub w prawo.',
                        'Potrafi zatrzymać się we wskazanym miejscu.',
                        'Po jeździe potrafi odpowiednio osuszyć i zadbać o łyżwy.',
                      ]
                  ),

                  SprawData(
                      id: 'lyzwiarz_doskonaly',
                      title: 'Łyżwiarz Doskonały',
                      level: 3,
                      tasks: [
                        'Umie płynnie (w ruchu) zmieniać styl z jazdy przodem na jazdę tyłem, a także przejechać dowolną odległość każdym z nich.',
                        'Potrafi jeździć przeplatanką zarówno przodem jak i tyłem.',
                        'Umie bez zatrzymania podnieść przedmiot z lodowiska (np. upuszczoną czapkę).',
                        'Potrafi hamować ślizgiem.',
                        'Umie ocenić czy łyżwy są właściwie naostrzone.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'strzelectwo',
                title: 'Strzelectwo',
                tags: ['#opanowanie', '#obserwacja', '#odpowiedzialność', '#wiatr', '#współzawodnictwo', '#karność', '#rytm', '#technika', '#oddech', '#zasady'],
                fragment: 'Tomek strzelał szybko i celnie. Bosman zdziwiony postępami powiedział z uznaniem: – No, braciszku, widzę, że niewiele już skorzystasz ode mnie. Teraz chyba tylko Smuga mógłby nauczyć cię czegoś nowego. – To pan Smuga tak dobrze strzela? – zdziwił się Tomek. – Myślałem, że nikt już lepiej nie potrafi jak pan. – Ho, ho! Smuga to mistrz nad mistrzami! Nawet najmniejsze bydlę trafia między ślepia – odparł bosman pewnym tonem, chociaż wszystko, co wiedział o Smudze, pochodziło z opowiadań ojca Tomka. Oczywiście Wilmowski nigdy nie mówił bosmanowi o „strzelaniu między ślepia”, lecz Nowickiemu zdawało się, że taka nieścisłość nie sprawi chłopcu różnicy. Tomek jednak już poprzednio postanowił we wszystkim wiernie naśladować wielkiego łowcę. Zamyślił się więc nad słowami bosmana. W wyniku rozmyślań wyszukiwał jak najmniejsze puszki, rysował na nich dwa kółka, które miały być „ślepiami zwierząt” i zaczął od nowa ćwiczenia. Robił to w najściślejszej tajemnicy nawet przed bosmanem. Alfred Szklarski, „Tomek w krainie kangurów” --- Uwaga! Zajęcia i sprawności strzeleckie mogą odbywać się wyłącznie pod okiem właściwie przygotowanego instruktora. Zajęcia z bronią palną mogą być prowadzone wyłącznie przez instruktora strzelectwa.',
                sprawData: [

                  SprawData(
                      id: 'fuks',
                      title: 'Fuks',
                      level: 1,
                      tasks: [
                        'Umie posługiwać się wiatrówką lub karabinkiem pneumatycznym, zgodnie z zasadami bezpieczeństwa. Umie wytłumaczyć zasady wynikające z rozwinięcia skrótu BLOS: broń, lufa, otoczenie, spust.',
                        'Strzelając z wiatrówki lub karabinku pneumatycznego potrafi trafić z odległości 10 m do celu o średnicy ok. 15 cm.',
                      ]
                  ),

                  SprawData(
                      id: 'strzelec',
                      title: 'Strzelec',
                      level: 2,
                      tasks: [
                        'Potrafi posługiwać się bronią palną, wiatrówkami lub replikami broni, przestrzegając dodatkowych zasad bezpieczeństwa specyficznych dla danego rodzaju broni. Umie zastosować adekwatne środki ochrony oczu, słuchu, twarzy i ciała.',
                        'Potrafi celnie strzelać z wybranej broni (np. strzelając z wiatrówki z odległości 10 m do standardowej tarczy o średnicy 155,5 mm osiągnie wynik powyżej 70/100 punktów).',
                        'Potrafi obsługiwać, czyścić i konserwować replikę broni lub wiatrówkę.',
                        'Potrafi zorganizować bezpieczne miejsce do strzelania.',
                      ]
                  ),

                  SprawData(
                      id: 'snajper',
                      title: 'Snajper',
                      level: 3,
                      tasks: [
                        'Potrafi rozłożyć i złożyć karabin oraz pistolet i wytłumaczyć ich działanie.',
                        'Potrafi samodzielnie bezpiecznie obsługiwać broń palną, w tym zająć stanowisko, załadować, odbezpieczyć i ustawić przyrządy celownicze.',
                        'Potrafi naprawić drobne usterki i wyregulować replikę broni lub wiatrówkę (np. wyregulować przyrządy celownicze).',
                        'Umie strzelać w postawie leżącej, stojącej i klęczącej.',
                        'Potrafi udzielić pierwszej pomocy w przypadku ran postrzałowych, umie korzystać z wojskowej opaski uciskowej (tzw. stazy taktycznej). Posiada sprawność **Sanitariusza ze ścieżki „Samarytanka”.',
                      ]
                  ),

                ]
            )

          ]
      ),

      SprawGroupData(
          id: 'sztuka_i_technika',
          title: 'Sztuka i technika',
          familyData: [

            SprawFamilyData(
                id: 'rzemioslo_techniczne',
                title: 'Rzemiosło techniczne',
                tags: ['#majsterkowanie', '#narzędzia', '#umysł', '#technologia', '#technika', '#fach', '#twórczość', '#ciekawość', '#wyobraźnia'],
                fragment: 'Drugiego dnia rano zebrałem się do fabrykowania oleju. Na gładkim kamieniu tłukłem naprzód ziarna kokosowe na miazgę, ogrzewałem potem w rynce przy ogniu, mieszając, aby się nie przypaliły. Nareszcie, umieściwszy w woreczku od zboża i zawiązawszy go sznurkiem, wygniatałem pomiędzy dwoma kamieniami. Tym sposobem otrzymałem przeszło pół kwarty tłuszczu. (…) Tak znowu mogłem przez cztery dni cieszyć się światłem mojej lampy. Z tym wszystkim siedzenie na ziemi było mi nieznośne, brak stołu i krzesła wciąż odczuć się dawał, a nie wiedziałem, jak mu zaradzić. O nogi mniejsza, te można było zrobić z gałęzi, ale skąd wziąć deski, wszakże jej nożem nie wystrugam. A gdybyś uplótł sobie płyty na stół i krzesło z prętów, koszykarską robotą? (…) Natychmiast naciąłem gałązek z drzewa nieco do wierzby podobnego, zacząłem pleść, a po kilku próbach udało się sklecić upragnioną płytę. (…) Teraz należało zrobić stołek przenośny. Namęczyłem się nad nim krwawo, nie umiejąc sobie poradzić. Nareszcie wybrawszy cztery równe paliki, powiązałem je poprzeczkami u góry i dołu. Tak powstało rusztowanie, na którym położyłem płytę. Mając stół i krzesło, mogłem zasiąść sobie po europejsku przy lampie do wieczerzy i w istocie niepodobna wypowiedzieć, z jakim ukontentowaniem to robiłem. Ręczę, że Aleksander Wielki nie z większą uciechą siadał na Dariuszowym tronie.',
                fragmentAuthor: 'Daniel Defoe, „Przypadki Robinsona Crusoe”',
                sprawData: [

                  SprawData(
                      id: 'majster',
                      title: 'Majster',
                      level: 1,
                      tasks: [
                        'Potrafi wykonać element wyposażenia pokoju, mieszkania lub namiotu (np. świecznik, przybornik, pudełko).',
                        'Umie zorganizować miejsce do wygodne majsterkowania, dbając o porządek i bezpieczeństwo',
                      ]
                  ),

                  SprawData(
                      id: 'technik',
                      title: 'Technik',
                      level: 2,
                      tasks: [
                        'Umie wykonać praktyczny mebel (np. stołek lub stojak na proporce) lub naprawić uszkodzony przedmiot.',
                        'Potrafi posługiwać się narzędziami ręcznymi oraz elektronarzędziami z zachowaniem zasad bezpieczeństwa pracy.',
                        'Umie zastosować różne rodzaje połączeń mechanicznych (np. zbijanie, skręcanie i sklejanie).',
                        'Potrafi naostrzyć nóż i naoliwić zamek lub kłódkę.',
                      ]
                  ),

                  SprawData(
                      id: 'kreslarz',
                      title: 'Kreślarz',
                      level: 3,
                      tasks: [
                        'Potrafi sporządzić w określonej skali i opisać plan (np. domu, pomieszczenia lub ogrodu).',
                        'Umie wykorzystać zasady perspektywy dla odwzorowania rzeczywistości.',
                        'Potrafi wykonać model mebla, konstrukcji lub pomieszczenia w odpowiedniej skali i z zachowaniem precyzji adekwatnej do przedmiotu zadania.',
                      ]
                  ),

                  SprawData(
                      id: 'architekt',
                      title: 'Architekt',
                      level: 3,
                      tasks: [
                        'Umie wykonać projekt urządzenia pomieszczenia lub zagospodarowania terenu, w sposób pozwalający na realizację prac kilkuosobowemu zespołowi, z wykorzystaniem rzutowania, rysunków przekrojowych, wymiarowania i opisów.',
                        'Potrafi precyzyjnie oszacować ilość potrzebnych materiałów do kompletnego wykonania opracowanego projektu.',
                        'Umie wymodelować swój projekt w prostym programie do modelowania 3D (np. SketchUp).',
                        'Zna kilka współczesnych obiektów architektonicznych i potrafi o nich opowiedzieć (np. podać autora, wymienić cechy charakterystyczne).',
                        'Zna główne style architektoniczne, umie opisać ich cechy i je rozpoznawać.',
                      ]
                  ),

                  SprawData(
                      id: 'stolarz',
                      title: 'Stolarz',
                      level: 3,
                      tasks: [
                        'Potrafi samodzielnie wykonać solidny mebel odpowiadający proporcjom człowieka z wykorzystaniem różnych stolarskich technik łączenia elementów.',
                        'Umie posługiwać się narzędziami stolarskimi: heblem, ściskiem, imadłem, dłutem i pilnikiem.',
                        'Potrafi w odpowiedni sposób zabezpieczyć drewno, np. przed działaniami warunków atmosferycznych. Umie ochronić drogi oddechowe przed oparami środków impregnujących.',
                        'Zna 5 różnych rodzajów drewna oraz kilka różnych materiałów drewnopochodnych, potrafi je rozpoznać i wskazać, jakie mają zastosowanie.',
                      ]
                  ),

                  SprawData(
                      id: 'inzynier',
                      title: 'Inżynier',
                      level: 3,
                      tasks: [
                        'Umie samodzielnie wykonać maszynę prostą, taką jak kołowrót, przekładnia lub wielokrążek, składającą się z różnych materiałów, używając własnoręcznie wykonanego szkicu technicznego, suwmiarki oraz narzędzi ręcznych.',
                        'Potrafi wyjaśnić zasadę działania różnych maszyn prostych.',
                        'Umie samodzielnie złożyć urządzenie mechaniczne przydatne w codziennym użytku (np. pompę „abisynkę” lub rower).',
                        'Sprawnie korzysta ze wzorów stosowanych w geometrii, potrafi wykreślać różne figury i bryły geometryczne oraz obliczać ich objętość i pole powierzchni.',
                      ]
                  ),

                  SprawData(
                      id: 'mechanik',
                      title: 'Mechanik',
                      level: 3,
                      tasks: [
                        'Potrafi złożyć urządzenie spalinowe (np. pompę lub piłę spalinową), wymienić uszkodzoną część, wykonać podstawowy serwis (np. naostrzyć łańcuch, przygotować odpowiednią mieszankę).',
                        'Potrafi samodzielnie dokonać podstawowych czynności obsługowych pojazdu: sprawdzić i uzupełnić płyny eksploatacyjne, wymienić koło, zmienić przepaloną żarówkę, wymienić dowolny filtr.',
                        'Zna zasady działania i umie wytłumaczyć różnice w pracy skrzyni biegów manualnej i automatycznej, silnika o zapłonie samoczynnym i zapłonie iskrowym oraz silnika dwusuwowego i czterosuwowego.',
                      ]
                  ),

                  SprawData(
                      id: 'robotyk',
                      title: 'Robotyk',
                      level: 3,
                      tasks: [
                        'Potrafi samodzielnie zaprojektować i wykonać układ automatyczny, taki jak fotokomórka lub migająca lampka, posługując się stworzonym przez siebie schematem, multimetrem, lutownicą i innymi potrzebnymi narzędziami.',
                        'Zna podstawy jednego z języków programowania i potrafi je zastosować do stworzenia użytecznego programu na platformie Arduino, Raspberry Pi lub innej tego typu.',
                        'Umie zbudować i zaprogramować robota typu sumo, line follower lub podobnego.',
                        'Posiada sprawność **Elektronika ze ścieżki „Elektrotechnika” lub **Programisty ze ścieżki „Programowanie”.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'elektrotechnika',
                title: 'Elektrotechnika',
                tags: ['#majsterkowanie', '#ciekawość', '#fach', '#technika', '#technologia', '#odpowiedzialność', '#narzędzia', '#umysł'],
                fragment: 'Facet wiedział, że naprawiam radia, więc przyjechał po mnie. (…) – Co się dzieje z radiem? – Przez chwilę trochę hałasuje, kiedy włączam, potem przestaje (…). Myślę sobie: „Kurcze, chyba mógłby jakoś przeboleć, że mu przez chwilę hałasuje”. (…) Ale kiedy dojechaliśmy na miejsce i włączyłem radio, wszystko zrozumiałem. Trochę hałasuje? Jejku! Nic dziwnego, że biedak miał tego dość. Radio po prostu ryczało i całe podskakiwało – BU-RUM-DU-DUM. S t r a s z n i e hałasowało. Potem się uspokajało. „Skąd to się może brać?” – myślałem. Zacząłem spacerować po pokoju i główkować. Wreszcie wymyśliłem, że jest tylko jedno wytłumaczenie: lampy rozgrzewają się w złej kolejności. (…) Facet mówi do mnie: – Co ty robisz? Przyszedłeś naprawić radio i chodzisz sobie po pokoju? – Myślę! – odpowiadam. Potem powiedziałem do siebie: „Dobra, wyjmij wszystkie lampy i powkładaj w dokładnie odwrotnej kolejności”. (…) Zmieniłem kolejność lamp, obszedłem radio dokoła, włączyłem – cichutkie jak baranek: czeka, aż wszystko się rozgrzeje, a potem gra czyściutko, bez żadnych hałasów. (…) Facet załatwiał mi potem inne zlecenia i wszystkim powtarzał, jaki ze mnie geniusz: „Ten chłopak naprawia radia m y ś l e n i e m!” Richard P. Feynmann, „Pan raczy żartować, panie Feynman!” --- Uwaga! Sprawności **Elektryka i ***Elektrotechnika powinno zdobywać się pod okiem osoby przeszkolonej w zakresie obsługi instalacji elektrycznych.',
                sprawData: [

                  SprawData(
                      id: 'diodak',
                      title: 'Diodak',
                      level: 1,
                      tasks: [
                        'Potrafi wykonać prosty obwód elektryczny. Przykłady: zabawkowy silnik elektryczny (z magnesu, baterii i drutu), elektromagnes (z baterii, gwoździa i grubego izolowanego drutu), prymitywny próbnik przewodności elektrycznej (z baterii, żarówki i kabelków).',
                        'Potrafi bezpiecznie wymienić żarówkę.',
                      ]
                  ),

                  SprawData(
                      id: 'elektronik',
                      title: 'Elektronik',
                      level: 2,
                      tasks: [
                        'Umie zbudować na płytce prototypowej prosty układ elektroniczny i wyjaśnić jego działanie.',
                        'Potrafi rozpoznać podstawowe elementy elektroniczne, takie jak diody, oporniki i kondensatory. Umie określić polaryzację diod i kondensatorów elektrolitycznych.',
                        'Potrafi w bezpieczny sposób posługiwać się lutownicą.',
                        'Umie dokonać naprawy bądź modyfikacji urządzenia zasilanego bateryjnie (np. zabawki, alarmu lub budzika).',
                      ]
                  ),

                  SprawData(
                      id: 'elektryk',
                      title: 'Elektryk',
                      level: 2,
                      tasks: [
                        'Umie bezpiecznie wykonać pracę przy domowej lub polowej instalacji elektrycznej (np. zamontować wtyczkę, podłączyć akumulator do ładowania, podłączyć baterie słoneczne).',
                        'Potrafi narysować schemat zadanego obwodu elektrycznego (np. obozowej instalacji elektrycznej). Umie na podstawie schematu zestawić działający obwód.',
                        'Potrafi za pomocą multimetru dokonać pomiaru podstawowych wielkości elektrycznych: napięcia, natężenia prądu, oporu elektrycznego.',
                        'Zna i stosuje zasady bezpiecznej pracy z urządzeniami elektrycznymi i wie jak się zachować w przypadku porażenia prądem.',
                      ]
                  ),

                  SprawData(
                      id: 'ukladowiec',
                      title: 'Układowiec',
                      level: 3,
                      tasks: [
                        'Potrafi zaprojektować płytkę PCB i wytrawić ją w domu bądź zlecić jej wyprodukowanie.',
                        'Umie prawidłowo zlutować i uruchomić zaprojektowany układ.',
                        'Potrafi dostosować do własnych potrzeb schemat układu elektronicznego (np. znaleziony w Internecie) i uruchomić go na płytce prototypowej.',
                        'Umie programować mikrokontrolery. Potrafi w oparciu o mikrokontroler zaprojektować i zrealizować przydatny układ (np. czujnik lub sterownik).',
                      ]
                  ),

                  SprawData(
                      id: 'komputerowiec',
                      title: 'Komputerowiec',
                      level: 3,
                      tasks: [
                        'Umie złożyć komputer z podzespołów i zainstalować w nim system operacyjny.',
                        'Potrafi zlokalizować i wymienić uszkodzony element komputera, laptopa lub tabletu (np. baterię, płytę główną, procesor lub dysk twardy) oraz dokonać jego rozbudowy (np. zwiększenia pamięci RAM lub zainstalowania karty graficznej).',
                        'Umie lutować elementy SMD za pomocą gorącego powietrza.',
                        'Potrafi wyjaśnić, jakie funkcje spełniają poszczególne podzespoły komputera i w jaki sposób działają.',
                      ]
                  ),

                  SprawData(
                      id: 'elektrotechnik',
                      title: 'Elektrotechnik',
                      level: 3,
                      tasks: [
                        'Umie bezpiecznie i prawidłowo przygotować do pracy (w tym uziemić) oraz obsłużyć urządzenia, które mogą dostarczać energii elektrycznej w terenie (np. agregat prądotwórczy, baterie słoneczne). Potrafi zaprojektować i uruchomić polową instalację elektryczną a także zabezpieczyć ją przed wpływem warunków pogodowych.',
                        'Umie wykorzystać prawo Ohma i potrafi obliczyć moc prądu elektrycznego.',
                        'Wie jak jest zbudowana domowa instalacja elektryczna, rozumie jaką rolę pełnią w niej obwody oświetleniowe, zasilające, trójfazowe i tablica rozdzielcza. Rozumie zasadę działania wyłączników nadprądowych i różnicowych i potrafi sprawdzić ich działanie.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'programowanie',
                title: 'Programowanie',
                tags: ['#technologia', '#umysł', '#technika', '#twórczość', '#narzędzia', '#porządek', '#spryt', '#ciekawość', '#fach', '#pamięć', '#wyobraźnia'],
                fragment: 'Zdarzyło się raz Trurlowi zbudować maszynę do liczenia, która okazała się zdolna tylko do jednego działania, mnożyła mianowicie dwa przez dwa, a i to fałszywie. Jak to jest opowiedziane w innym miejscu, maszyna ta była jednak bardzo ambitna i jej spór z własnym twórcą omal nie skończył się dlań tragicznie. Od tamtego czasu Klapaucjusz obrzydzał Trurlowi żywot, docinając mu tak i owak, aż ów zawziął się i postanowił wybudować maszynę, która będzie pisała wiersze. W tym celu zgromadził Trurl osiemset dwadzieścia ton literatury cybernetycznej oraz dwanaście tysięcy ton poezji i zabrał się do studiów. Kiedy już nie mógł wytrzymać od cybernetyki, przerzucał się do liryki, i na odwrót. Po pewnym czasie pojął, iż zbudowanie samej maszyny jest zupełną fraszką w porównaniu z jej zaprogramowaniem. Program, który ma w głowie zwykły poeta, stworzyła cywilizacja, w której przyszedł na świat; tę cywilizację wydała inna, ta, co ją poprzedziła, tamtą – wcześniejsza, i tak do samego początku Wszechświata, kiedy to informacje o przyszłym poecie krążyły jeszcze bezładnie w jądrze pierwotnej mgławicy. Aby zatem zaprogramować maszynę, należało wpierw powtórzyć – jeśli nie cały Kosmos od początku, to co najmniej sporą jego część. Każdego innego na miejscu Trurla zadanie to skłoniłoby do rezygnacji, lecz dzielny konstruktor ani myślał rejterować.',
                fragmentAuthor: 'Stanisław Lem, „Cyberiada”',
                sprawData: [

                  SprawData(
                      id: 'koder',
                      title: 'Koder',
                      level: 1,
                      tasks: [
                        'Potrafi napisać i uruchomić program, który pobiera od użytkownika tekst i wyświetla go na ekranie.',
                        'Umie podłączyć do komputera urządzenia peryferyjne, takie jak monitor, mikrofon, głośniki lub drukarka.',
                      ]
                  ),

                  SprawData(
                      id: 'programista',
                      title: 'Programista',
                      level: 2,
                      tasks: [
                        'Potrafi napisać program (np. wykonujący działania matematyczne, szyfrujący wiadomość lub przeliczający jednostki miary) i umie wytłumaczyć jego działanie.',
                        'Potrafi zabezpieczyć plik hasłem i przesłać go mailem.',
                      ]
                  ),

                  SprawData(
                      id: 'webjunior',
                      title: 'Webjunior',
                      level: 2,
                      tasks: [
                        'Umie stworzyć pojedynczą stronę internetową, korzystając z języków HTML i CSS.',
                        'Potrafi umieścić swoją stronę w Internecie. Umie utworzyć jej kopię zapasową oraz wgrać ją z powrotem na serwer.',
                        'Potrafi stworzyć prosty serwis internetowy korzystający z systemu zarządzania treścią (np. z Wordpressa) i skonfigurować jego podstawowe funkcje, takie jak system newsów, logowanie użytkowników, import plików i zdjęć.',
                      ]
                  ),

                  SprawData(
                      id: 'deweloper',
                      title: 'Deweloper',
                      level: 3,
                      tasks: [
                        'Umie napisać program złożony z kilku podprogramów lub obiektów, wykorzystujący biblioteki programistyczne i złożone typy danych.',
                        'Potrafi zabezpieczyć program przed wprowadzeniem niepoprawnych danych. Umie skonstruować jego intuicyjną instrukcję obsługi (np. w formie wyświetlanych komunikatów lub osobnej dokumentacji).',
                        'Potrafi skompilować program lub przygotować go do łatwego uruchomienia na innym komputerze.',
                        'Umie umieszczać w kodzie komentarze i wybierać treściwe nazwy dla zmiennych i funkcji tak, by kod programu był czytelny i zrozumiały.',
                        'Potrafi wskazać najważniejsze cechy języka programowania, którego używa, i porównać go z innym wybranym językiem.',
                      ]
                  ),

                  SprawData(
                      id: 'webmaster',
                      title: 'Webmaster',
                      level: 3,
                      tasks: [
                        'Potrafi uruchomić witrynę WWW opartą o popularny system zarządzania treścią (np. Wordpress, Joomla, Media Wiki). Umie znaleźć i zainstalować moduły i dodatki, które zwiększą możliwości i atrakcyjność witryny.',
                        'Potrafi skonfigurować połączenie HTTPS, wie czym różni się od HTTP.',
                        'Umie uruchomić serwer WWW (np. Apache) w swojej sieci lokalnej oraz wywołać go w tej sieci z innego komputera.',
                        'Potrafi połączyć się zdalnie z serwerem (np. przez FTP) i umieścić pliki na serwerze.',
                        'Umie wdrożyć dowolny mechanizm zwiększający bezpieczeństwo strony WWW (np. filtr antyspamowy, wymuszenie bezpiecznych haseł lub weryfikację importowanych plików).',
                      ]
                  ),

                  SprawData(
                      id: 'administrator',
                      title: 'Administrator',
                      level: 3,
                      tasks: [
                        'Potrafi zaprojektować oraz skonfigurować bezpieczną sieć lokalną, przewodową lub bezprzewodową, z dostępem do Internetu.',
                        'Umie zainstalować i skonfigurować ogólnodostępny serwer (np. WWW lub wymiany plików), dobierając odpowiedni system operacyjny.',
                        'Posługuje się wybranym językiem skryptowym, który pomaga zautomatyzować czynności administracyjne.',
                        'Potrafi podzielić dysk twardy na partycje, zainstalować system operacyjny oraz przygotować go do pracy, w tym zainstalować oprogramowanie i skonfigurować połączenie sieciowe.',
                        'Umie uruchomić usługę pulpitu zdalnego, a następnie połączyć się z innym komputerem, wykorzystując tę metodę.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'rzemioslo_plastyczne',
                title: 'Rzemiosło plastyczne',
                tags: ['#twórczość', '#wyobraźnia', '#fach', '#majsterkowanie', '#narzędzia', '#ciekawość', '#rytm', '#harmonia', '#technika', '#obserwacja', '#obraz'],
                fragment: 'Tomek zaczął coś rysować na tabliczce, lewą ręką zasłaniając przed nią swe dzieło. Przez chwilę udawała, że nic ją to nie obchodzi, ale wkrótce zwykła ludzka ciekawość wzięła górę. Chłopiec pracował dalej. Dziewczynka nieśmiało zerknęła na tabliczkę, ale on udawał, że nic nie zauważył. Wreszcie uległa i szepnęła niepewnym głosem: – Pokaż… Tomek odsłonił nieudolną karykaturę domu z dwoma szczytami dachu i wychodzącym z komina dymem w kształcie korkociągu. To wspaniałe dzieło zainteresowało dziewczynkę i zapomniała o wszystkim. Gdy skończył, przyjrzała się rysunkowi i szepnęła: – Śliczne. Teraz narysuj człowieka. Artysta dorysował człowieka, olbrzymiego potwora, który spokojnie mógłby przejść ponad domem. Ale dziewczynka nie była pedantką. Potwór zupełnie ją zadowalał. Szepnęła: – Pysznie! Zrób jeszcze mnie, jak przychodzę. Tomek namalował coś podobnego do klepsydry z głową jak księżyc w pełni i słomkami zamiast rąk i nóg. Rozcapierzone palce uzbroił w potężny wachlarz. – Ach, jakie to śliczne! – powiedziała dziewczynka. – Chciałabym tak umieć rysować! – To zupełnie łatwe – odszepnął Tomek. – Jak chcesz, mogę cię nauczyć. – Naprawdę? Kiedy? – W południe. Czy idziesz do domu na obiad? – Zostanę, jeśli chcesz. – Wspaniale. Jak się nazywasz? – Becky Thatcher. A ty? Ach, prawda, wiem: Tomasz Sawyer. – Tak się nazywam, gdy dostaję lanie. Kiedy jestem grzeczny, nazywam się Tomek.',
                fragmentAuthor: 'Mark Twain, “Przygody Tomka Sawyera”',
                sprawData: [

                  SprawData(
                      id: 'plastyk',
                      title: 'Plastyk',
                      level: 1,
                      tasks: [
                        'Umie przygotować odpowiednie narzędzia i materiały do wybranych działań plastycznych (np. modelowania lub rysowania).',
                        'Potrafi wykonać model albo rysunek na podstawie opisu lub szczegółowo odwzorować przedmiot z natury (np. liść lub totem).',
                        'Umie przygotować swoją pracę do publicznej prezentacji (np. oprawić ilustrację samodzielnie wykonaną ramką lub wypalić gliniany model).',
                      ]
                  ),

                  SprawData(
                      id: 'grafik',
                      title: 'Grafik',
                      level: 2,
                      tasks: [
                        'Potrafi wykonać szkic z natury z zachowaniem proporcji i odwzorowaniem charakterystycznych cech szkicowanego obiektu lub postaci.',
                        'Umie zaprojektować i wykonać plakat, ogłoszenie lub ozdobną kartę kroniki, zwracając uwagę na czytelność informacji, kompozycję i precyzję wykonania.',
                        'Potrafi wykorzystać 3 różne techniki plastyczne do wykonania ilustracji lub innej formy graficznej.',
                      ]
                  ),

                  SprawData(
                      id: 'rekodzielnik',
                      title: 'Rękodzielnik',
                      level: 2,
                      tasks: [
                        'Umie samodzielnie wykonać za pomocą scyzoryka lub innego narzędzia drobny element ozdobny lub użytkowy z drewna lub kory (np. pierścień, list na korze czy pieczęć zastępu).',
                        'Potrafi wykonać według własnego projektu ozdobny element aranżacji pokoju, namiotu lub harcówki (np. abażur, skrzynkę lub wieszak na proporce).',
                        'Umie sprawnie i estetycznie naprawić lub przerobić przedmiot (np. wymienić guziki w koszuli, naprawić uszkodzoną okładkę książki lub przemalować niewielki mebel).',
                      ]
                  ),

                  SprawData(
                      id: 'ilustrator',
                      title: 'Ilustrator',
                      level: 3,
                      tasks: [
                        'Umie przedstawić historię lub zobrazować tekst ilustracją bądź sekwencją ilustracji, akcentując charakterystyczne i ważne dla narracji elementy.',
                        'Potrafi posługiwać się 5 różnymi technikami plastycznymi, takimi jak rysunek węglem, pastele, akwarele, malarstwo olejne lub temperowe, linoryt, grafika rastrowa lub wektorowa. Umie dobrać odpowiednią technikę do realizowanego dzieła.',
                        'Zna podstawowe zasady kompozycji, wie co to jest złota proporcja, wie jak wygląda koło barw i co to są barwy dopełniające, jak powstają kolory pochodne itp. Potrafi wykorzystać znajomość tych zasad w swoich pracach.',
                        'Umie wykonać reprodukcję własnych ilustracji z wykorzystaniem techniki cyfrowej.',
                        'Zna twórczość wybranych ilustratorów, malarzy i grafików. Potrafi wskazać, co mu się w nich podoba i czym charakteryzuje się ich twórczość.',
                      ]
                  ),

                  SprawData(
                      id: 'scenograf',
                      title: 'Scenograf',
                      level: 3,
                      tasks: [
                        'Potrafi stworzyć kompletną wizję i zaprojektować scenografię na potrzeby przedstawienia, w którym występuje wiele postaci a akcja toczy się w różnych miejscach.',
                        'Umie przygotować oświetlenie, rekwizyty i dekoracje w taki sposób, aby jak najlepiej podkreślić treść przedstawienia.',
                        'Potrafi samodzielnie wykonać element scenografiii, taki jak strój, dekoracja lub rekwizyt.',
                        'W cenionych przez siebie sztukach teatralnych lub filmach umie wskazać i scharakteryzować zabiegi scenograficzne, które wpływają na atrakcyjności i siłę przekazu.',
                      ]
                  ),

                  SprawData(
                      id: 'rzezbiarz',
                      title: 'Rzeźbiarz',
                      level: 3,
                      tasks: [
                        'Potrafi samodzielnie wykonać model obiektu z natury z odwzorowaniem jego charakterystycznych cech i proporcji, wykorzystując do tego materiały takie jak glina, gips, masa plastyczna lub drewno.',
                        'Umie posługiwać się narzędziami rzeźbiarskimi do drewna, takimi jak dłuto, rylec, tarnik. Zna przynajmniej 3 rodzaje drewna przydatne w rzeźbie i potrafi je scharakteryzować.',
                        'Umie zaprojektować i wykonać w technice rzeźby lub linorytu ilustrację (np. na podstawie cytatu z książki lub opisu wydarzenia).',
                        'Zna twórczość wybranych rzeźbiarzy, potrafi opowiedzieć o głównych tematach rzeźbiarskich od antyku po czasy współczesne, umie rozpoznać charakterystyczne cechy rzeźby z różnych epok.',
                      ]
                  ),

                  SprawData(
                      id: 'modelarz',
                      title: 'Modelarz',
                      level: 3,
                      tasks: [
                        'Potrafi złożyć i – jeśli to konieczne pomalować – model pojazdu, budynku lub innego obiektu w przynajmniej 2 technikach.',
                        'Umie wykonać dioramę z zachowaniem skali i precyzji adekwatnej do przedstawianego wydarzenia oraz wybranej techniki lub wykonać ruchomy model napędzany mechanicznie lub elektrycznie.',
                        'Zdobył sprawność **Technika ze ścieżki „Rzemiosło techniczne”.',
                      ]
                  ),

                  SprawData(
                      id: 'krawiec',
                      title: 'Krawiec',
                      level: 3,
                      tasks: [
                        'Umie zaprojektować i wykonać element garderoby. Potrafi przy tym skorzystać z wykrojników i odpowiednio dobrać technikę łączenia.',
                        'Potrafi sprawnie posłużyć się igłą i nicią. Umie obsługiwać maszynę do szycia (np. wykonać szwy różnymi ściegami).',
                        'Potrafi skorzystać z umiejętności krawieckich w warunkach polowych (np. naprawić plecak, wszyć troczki w namiot albo zszyć żagiel).',
                        'Potrafi przy wykorzystaniu umiejętności krawieckich samodzielnie wykonać użytkowy element aranżacji wnętrza (np. zasłonę lub poduszkę).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'fotografia',
                title: 'Fotografia',
                tags: ['#obraz', '#obiektyw', '#obserwacja', '#twórczość', '#fach', '#harmonia', '#technika', '#pamięć', '#wyobraźnia', '#technologia', '#narzędzia', '#natura'],
                fragment: 'Gotfryd podszedł do fotografa i zapytał: – Co to za aparat? Fotograf uśmiechnął się i powiedział: – To takie pudełko, z którego wyfrunie ptaszek, mój malutki. – To stary grat – powiedział Gotfryd. (…) Fotograf zrobił zdumioną minę, już się nie uśmiechał, tylko powiedział, żeby Gotfryd poszedł na swoje miejsce. (…) Wreszcie ustawiliśmy się. Ja siedziałem na ziemi obok Alcesta. (…) Właśnie zajadał bułkę z dżemem i fotograf powiedział, żeby przestał jeść, ale Alcest odpowiedział, że on się musi odżywiać. – Zostaw tę bułkę! – krzyknęła pani, która siedziała tuż za Alcestem. Alcest tak się przestraszył, że bułka wysunęła mu się z ręki na koszulę. (…) Pani powiedziała, że nie pozostaje nam nic innego, jak tylko posłać Alcesta do ostatniego rzędu, żeby nie było widać plamy na koszuli. – Euzebiuszu – powiedziała pani – ustąp miejsca twemu koledze. – To nie jest mój kolega – odpowiedział Euzebiusz – i nie ustąpię mu miejsca; niech stanie tyłem, żeby nie było widać jego plamy i jego tłustej gęby. (…) Pani zaczęła wszystkim rozdzielać kary – wszyscy dostaliśmy do napisania kilka linijek i w końcu pani powiedziała: – A teraz może wreszcie uspokoicie się. Jeżeli będziecie bardzo grzeczni, daruję wam wszystkie kary. (…) Ale i tak nic nie wyszło wtedy z tej fotografii, która miała być najmilszą pamiątką na całe życie, bo zobaczyliśmy, że nie ma fotografa. Nic nie powiedział, tylko sobie poszedł.',
                fragmentAuthor: 'Jean-Jacques Sempé, René Goscinny, „Mikołajek”',
                sprawData: [

                  SprawData(
                      id: 'migawka',
                      title: 'Migawka',
                      level: 1,
                      tasks: [
                        'Umie przygotować relację z wydarzenia w formie zestawu najwyżej 10 zdjęć, w taki sposób, by ze zdjęć można było się dowiedzieć, kto uczestniczył w wydarzeniu i na czym ono polegało.',
                        'Potrafi zrobić ciekawe zdjęcie na zadany temat lub inspirując się abstrakcyjnym hasłem (np. „wzrok”, „fale”, „przyjaźń” itp.).',
                      ]
                  ),

                  SprawData(
                      id: 'fotograf',
                      title: 'Fotograf',
                      level: 2,
                      tasks: [
                        'Umie zrobić serię zdjęć portretowych (np. harcerzom swojej drużyny). Potrafi zadbać przy tym o odpowiednie dobranie parametrów (np. tła, światła i głębi ostrości) aparatu, aby zdjęcia były spójne wizualnie.',
                        'Umie dobrać odpowiedni tryb aparatu do fotografowanej sceny: np. pejzaż, ruch, sport, portret, portret zbiorowy, scenę na ulicy.',
                        'Potrafi dokonać podstawowej obróbki zdjęć w wybranym programie graficznym, posługując się takimi parametrami jak kontrast, jasność, ostrość, kadrowanie, nasycenie kolorów itp..',
                        'Umie przygotować swoje zdjęcia do publikacji w Internecie oraz do druku. Potrafi sporządzić wydruk swoich fotografii.',
                      ]
                  ),

                  SprawData(
                      id: 'fotografik',
                      title: 'Fotografik',
                      level: 3,
                      tasks: [
                        'Umie posługiwać się trybem manualnym swojego aparatu: odpowiednio do fotografowanej sytuacji ustawić przysłonę, czas naświetlania, czułość i balans bieli. Potrafi kreatywnie wykorzystać te parametry, aby osiągnąć zamierzony efekt wizualny.',
                        'Umie opowiedzieć historię w formie fotoreportażu składającego się z 6–8 zdjęć. Potrafi przygotować wydruk swojego fotoreportażu w formacie wystawowym.',
                        'Umie dobrać sprzęt fotograficzny (np. obiektyw, filtry i lampę błyskową) do fotografowanej sytuacji.',
                        'Potrafi wywołać zdjęcia dowolną techniką analogową.',
                        'Zna twórczość wybranych fotografów, umie wskazać co podoba mu się w ich pracach i czym charakteryzuje się ich twórczość.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'film_i_kino',
                title: 'Film i kino',
                tags: ['#ruch', '#obraz', '#obiektyw', '#twórczość', '#współpraca', '#zespół', '#rytm', '#fach', '#melodia', '#harmonia', '#technika', '#pamięć', '#słowo', '#wyobraźnia', '#emocje', '#technologia', '#narzędzia', '#obserwacja', '#rozmowa'],
                fragment: 'Dibbler wytrzeszczył oczy. Nie wiedział, skąd się biorą te myśli, ale teraz, kiedy się zastanowił, miał bardzo wyraźny obraz tego, co należy umieścić w ruchomych obrazkach. Na początek tysiąc słoni byłoby całkiem niezłym pociągnięciem. – Nie ma słoni? – upewnił się. – Raczej nie. – A może są jakieś tancerki? – Hm... Nie. – A może szaleńcze pościgi i ludzie wiszący na czubkach palców nad przepaściami? Silverfish ożywił się lekko. – W jednej scenie jest balkon – powiedział. – Tak? Czy ktoś zwisa z niego na czubkach palców? – Chyba nie. Melisanda się z niego wychyla. – No tak, ale czy publiczność wstrzyma oddech ze strachu, że wypadnie? – Mam nadzieję, że będą patrzeć na mowę Peliasa – odparł kwaśnym tonem Silverfish. – Musieliśmy ją zapisać na pięciu planszach. Małymi literami. Dibbler westchnął. – Myślę, że wiem, czego chcą ludzie – powiedział. – Na pewno nie mnóstwa małych literek. Chcą widowiska! – A te literki im zasłaniają? – spytał ironicznie Victor. – Chcą tancerek! Chcą dreszczu emocji! Chcą słoni! Chcą ludzi spadających z dachów! Chcą marzeń! Świat jest pełen małych ludzików z wielkimi marzeniami!',
                fragmentAuthor: 'T. Pratchett, „Ruchome obrazki”',
                sprawData: [

                  SprawData(
                      id: 'klaps',
                      title: 'Klaps',
                      level: 1,
                      tasks: [
                        'Potrafi nakręcić scenę opowiadającą krótką historię lub obrazującą działania zespołu (np. wideorelacja z gry terenowej albo scena wyjaśniająca genezę nazwy zastępu).',
                      ]
                  ),

                  SprawData(
                      id: 'filmowiec',
                      title: 'Filmowiec',
                      level: 2,
                      tasks: [
                        'Potrafi zrealizować krótką, składającą się z kliku scen etiudę lub klip według własnej wizji.',
                        'Potrafi zebrać zespół, podzielić zadania (operator, aktorzy itd.) i czuwać nad ich realizacją.',
                        'Nakręcony materiał filmowy umie zmontować i zaprezentować publiczności (np. pokazać na zbiórce drużyny lub udostępnić w Internecie).'
                      ]
                  ),

                  SprawData(
                      id: 'rezyser',
                      title: 'Reżyser',
                      level: 3,
                      tasks: [
                        'Potrafi wyreżyserować krótki (5–15 min.) film fabularny lub dokumentalny. W czasie jego powstawania jest w stanie kierować całą ekipą filmową, dawać wskazówki, instruować aktorów, dbać o spójność stylu i obrazu.',
                        'Zna podstawy języka filmowego (np. rodzaje planów, techniki montażu, techniki aktorskie) i umie z nich świadomie korzystać przy realizacji filmu wywołując u widza zamierzone emocje.',
                        'Potrafi przekazać swoją wizję na film reszcie ekipy filmowej np. za pomocą scenariusza, opisu scen czy storyboardu.',
                      ]
                  ),

                  SprawData(
                      id: 'operator_filmowy',
                      title: 'Operator Filmowy',
                      level: 3,
                      tasks: [
                        'Potrafi pełnić funkcję operatora (reżysera obrazu) przy realizacji krótkiego filmu fabularnego lub dokumentalnego.',
                        'Umie kierować pracą kamery: potrafi ją obsługiwać, zna jej ograniczenia i walory techniczne.',
                        'Umiejętnie komponuje kadry, dobiera odpowiednie plany i światła. Potrafi twórczo współpracować z reżyserem filmu.',
                        'Posiada sprawność *Migawki ze ścieżki „Fotografia”.',
                      ]
                  ),

                  SprawData(
                      id: 'animator',
                      title: 'Animator',
                      level: 3,
                      tasks: [
                        'Umie zrealizować krótki (1–2 min.) film animowany, wykorzystując dowolną technikę, taką jak animacja rysunkowa, animacja poklatkowa, animacja cyfrowa 2D lub 3D.',
                        'Zna różne zasady teoretyczne i sztuczki animacyjne oraz potrafi z nich korzystać w swoich dziełach (np. 12 podstawowych technik animacyjnych z książki „Animacja Disneya: Iluzja Życia”).',
                        'Posiada sprawność *Plastyka ze ścieżki „Rzemiosło plastyczne”.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'hodowla',
                title: 'Hodowla',
                tags: ['#odpowiedzialność', '#pomoc', '#natura', '#ciekawość', '#fach', '#pamięć', '#dyscyplina', '#woda', '#narzędzia', '#obserwacja'],
                fragment: 'Wreszcie bóg cisnął mięso w śnieg. Pies powąchał je starannie, ale nie patrzał na nie. Wąchając nie spuszczał z oczu boga. Nie stało się nic. Wziął więc zwolna mięso zębami. Połknął. Lecz nawet teraz nie stało się nic. Bóg podawał drugi kawałek mięsa. Pies znowu odmówił wzięcia z ręki, wobec czego mięso po raz drugi zostało rzucone na ziemię. Powtórzyło się to kilkakrotnie. Przyszła jednak chwila, kiedy bóg odmówił rzucania mięsa, ale uparcie proponował je z ręki. Mięso było smaczne, Biały Kieł zaś - głodny. Powoli, ostrożnie cal po calu zbliżał się do ręki. Wreszcie zdecydował, że mięso zje. Nie spuszczał z oczu boga, podchodząc z wyciągniętą głową, opuszczonymi w dół uszami i mimo woli zjeżoną sierścią. Poza tym leciutki pomruk kłębił się w gardzieli, jakby na znak, że nic złego zamyślać nie należy. Zjadł mięso i nie stało się nic. Jadł dalej kawałek po kawałku i znów się nic nie stało. Widocznie karę odłożono na później. (…) Tak oto rozpoczął się dla Białego Kła początek końca - końca starego życia w państwie nienawiści. Nadchodziło nowe, niezrozumiałe piękniejsze. Weedon Scott użyć musiał na to wiele rozwagi i mieć nieskończoną ilość cierpliwości.',
                fragmentAuthor: 'Jack London, „ Biały Kieł”',
                sprawData: [

                  SprawData(
                      id: 'opiekun_zwierzat',
                      title: 'Opiekun Zwierząt',
                      level: 1,
                      tasks: [
                        'Umie samodzielnie wykonać czynności związane z codzienną opieką nad zwierzęciem, takie jak karmienie, czesanie, wyprowadzanie na spacer, czyszczenie kuwety.',
                      ]
                  ),

                  SprawData(
                      id: 'hodowca',
                      title: 'Hodowca',
                      level: 2,
                      tasks: [
                        'Potrafi samodzielnie zaopiekować się zwierzęciem przez kilka tygodni: właściwie odmierzyć, przygotować i podać karmę, dbać o czystość i higienę itd..',
                        'Umie wykonać skomplikowaną czynność związaną z regularną opieką nad zwierzęciem (np. przyciąć szpony, wykąpać lub wyczyścić akwarium).',
                        'Potrafi opisać, jak tryb życia zwierzęcia (np. pory czuwania i odpoczynku, sposób zdobywania pokarmu i środowisko bytowania) wpływa na opiekę nad nim.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrz_chowu',
                      title: 'Mistrz chowu',
                      level: 3,
                      tasks: [
                        'Umie wykonywać wszystkie czynności wiążące się ze stałą opieką nad zwierzęciem, zgodnie z wymogami gatunku i rasy. Potrafi posługiwać się kalendarzem szczepień, zna przepisy prawa związane z danym gatunkiem. Wie, jaki stan wskazuje na problemy zdrowotne.',
                        'Potrafi przewieźć duże zwierzę (np. psa, kota lub dużego szczura) komunikacją zbiorową zgodnie z przepisami prawa.',
                        'Umie rozróżnić kilka podgatunków lub ras zwierzęcia którym się stale opiekuje lub gatunku którym się interesuje.',
                        'Potrafi podać kilka przykładów korzyści z hodowli różnych zwierząt i umie powiedzieć, jakie warunki należy im zapewnić.',
                        'Umie wykonać czynności związane z hodowlą dwóch gatunków zwierząt gospodarskich (np. wydoić krowę, wyczesać konia, ostrzyc owcę lub nakarmić świnię).',
                      ]
                  ),

                  SprawData(
                      id: 'akwarysta_terrarysta',
                      title: 'Akwarysta/Terrarysta',
                      level: 3,
                      tasks: [
                        'Potrafi dobrać gatunki ryb i roślin do akwarium, aby utrzymywać jego bioróżnorodność przez dłuższy czas albo potrafi właściwie przygotować terrarium dla hodowanych gadów, płazów, owadów lub pajęczaków, aby odtworzyć biotop charakterystyczny dla gatunku.',
                        'Potrafi sprawdzić i kontrolować parametry w akwarium lub terrarium: umie wyjaśnić jakie parametry powinien spełniać mikroklimat dla hodowanego gatunku.',
                        'Umie wyczyścić akwarium lub terrarium.',
                        'Zna przepisy dotyczące hodowli gadów, płazów i pajęczaków w Polsce, wie jak sprawdzić jakie warunki powinny być zapewnione dla zwierząt bytujących w terrariach, umie opisać te, których spełnienie jest niezbędne dla gatunków które hoduje.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'ogrodnictwo',
                title: 'Ogrodnictwo',
                tags: ['#natura', '#eksperyment', '#obserwacja', '#ciekawość', '#fach', '#pamięć', '#dyscyplina', '#woda', '#odpowiedzialność', '#wiatr', '#narzędzia'],
                fragment: 'Otóż na planecie Małego Księcia, tak jak na wszystkich innych planetach, były dobre rośliny i chwasty. A zatem były tam dobre nasiona dobrych roślin i złe nasiona chwastów. Ale nasiona są niewidoczne. Śpią ukryte w ziemi do czasu, gdy któremuś zachce się obudzić. Wtedy się przeciąga i wypuszcza nieśmiało w stronę słońca śliczny, mały, niewinny kiełek. Jeśli to kiełek rzodkiewki albo róży – można mu pozwolić, by rósł do woli. Lecz jeśli to chwast – trzeba go wyrwać natychmiast, gdy tylko rozpozna się roślinę. Otóż na planecie Małego księcia były straszliwe nasiona… Nasiona baobabów zaatakowały glebę planety. A jeśli zabrać się za późno za baobab, to już nigdy nie można się go pozbyć. Rozpycha się na całej planecie. Przebija ją korzeniami. A gdy baobabów jest za dużo a planeta jest za mała, to rozpada się ona na kawałki. „To sprawa dyscypliny – powiedział mi później Mały Książę. – Po każdej porannej toalecie trzeba starannie wyczyścić planetę. Trzeba się zmusić do tego, by regularnie wyrywać baobaby, gdy tylko odróżni się je od róż, do których we wcześniej są bardzo podobne. To bardzo nudna, ale bardzo łatwa robota.” (…) Czasami nie ma znaczenia, że odkładamy jakąś pracę na później. Lecz gdy chodzi o baobaby to zawsze jest katastrofa.',
                fragmentAuthor: 'Antoine de Saint-Exupery, „Mały Książę”',
                sprawData: [

                  SprawData(
                      id: 'ogrodnik',
                      title: 'Ogrodnik',
                      level: 1,
                      tasks: [
                        'Umie zadbać o roślinę przez kilka tygodni, dbając o jej właściwe usytuowanie oraz odpowiednią porę podlewania i ilość wody.',
                        'Potrafi samodzielnie przesadzić sadzonkę.',
                      ]
                  ),

                  SprawData(
                      id: 'siewca',
                      title: 'Siewca',
                      level: 2,
                      tasks: [
                        'Umie wyhodować 5 gatunków roślin z rozsady lub z nasion.',
                        'Potrafi samodzielnie wyhodować dwa szybko rosnące warzywa (np. rzodkiew lub szczaw) i zebrać plon pozwalający na przygotowanie posiłku.',
                        'Umie przyciąć wybrany krzew w odpowiedni sposób i w odpowiednim okresie.',
                        'Potrafi posługiwać się narzędziami ogrodniczymi, takimi jak sekator, łopata, nożyce.',
                      ]
                  ),

                  SprawData(
                      id: 'plantator',
                      title: 'Plantator',
                      level: 3,
                      tasks: [
                        'Potrafi wyhodować 5 różnych warzyw i zebrać z każdego z nich plon, pozwalający na przygotowanie posiłku.',
                        'Wie co decyduje o efektywności hodowli, umie samodzielnie zapylić kwiaty i odpowiednio zasilić rośliny nawozem lub kompostem.',
                        'Umie samodzielnie rozmnożyć 5 gatunków roślin (w tym 3 przez sadzonki).',
                        'Potrafi posługiwać się kalendarzem ogrodniczym, wie kiedy dane gatunki warzyw i owoców sadzi się w gruncie i kiedy zbiera plon.',
                        'Umie wykorzystać symbiozę międzygatunkową(np. pomiędzy pomidorami i fasolą).',
                        'Potrafi wykonać system nawadniania działający w warunkach domowych, pozwalający pozostawić roślinę doniczkową bez opieki na kilka dni.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'gotowanie',
                title: 'Gotowanie',
                tags: ['#przepis', '#fach', '#technika', '#ludzie', '#twórczość', '#woda', '#ogień', '#szlak', '#harmonia', '#wyobraźnia', '#narzędzia'],
                fragment: 'Sam jednak wcale nie uważał, że już za późno na śniadanie, i jasno to Gollumowi oznajmił. Zwłaszcza jeśli są widoki na potrawkę z królika! Wszyscy hobbici umieją oczywiście gotować, bo tę sztukę wpajają im rodzice jeszcze przed abecadłem – do abecadła zresztą nie każdy dochodzi – Sam wszakże był wyjątkowo dobrym kucharzem nawet wśród hobbitów i nabył dodatkowej wprawy przyrządzając polowym sposobem posiłki w czasie tej wędrówki, ilekroć miał co do garnka włożyć. Nie tracąc nadziei wciąż nosił w swoim worku sprzęt kuchenny: hubkę, dwa małe płytkie rondelki tak dobrane, że jeden mieścił się w drugim, a prócz tego drewnianą łyżkę, krótki dwuzębny widelec i parę szpikulców; na dnie tobołka w płaskim drewnianym pudełeczku miał schowany skarb, cenny i już mocno nadszarpnięty: szczyptę soli. Potrzebował jeszcze ognia i pewnych dodatków. Wyciągnął nóż, otarł go do czysta, naostrzył na kamieniu i zaczął oprawiać króliki, zastanawiając się, co dalej zrobić.',
                fragmentAuthor: 'J. R. R. Tolkien, „Władca Pierścieni”',
                sprawData: [

                  SprawData(
                      id: 'kuchcik',
                      title: 'Kuchcik',
                      level: 1,
                      tasks: [
                        'Umie przygotować potrawę na ciepło, taką jak jajecznica na boczku, naleśniki lub jajko sadzone z ziemniakami.',
                        'Potrafi nakryć do stołu i podać potrawę w estetycznej formie (w warunkach domowych lub polowych).'
                      ]
                  ),

                  SprawData(
                      id: 'kucharz',
                      title: 'Kucharz',
                      level: 2,
                      tasks: [
                        'Umie przyrządzić smaczny, trzydaniowy posiłek dla 4–6 osób (np. rodziny lub zastępu).',
                        'Rozpoznaje i potrafi korzystać w swoich potrawach z podstawowych przypraw.'
                      ]
                  ),

                  SprawData(
                      id: 'cukiernik',
                      title: 'Cukiernik',
                      level: 2,
                      tasks: [
                        'Potrafi przygotować i atrakcyjnie podać deser (np. ciasto, ciastka lub tort).',
                        'Umie wykonać element dekoracyjny deseru (np. wzór z kandyzowanych owoców lub bitej śmietany).',
                      ]
                  ),

                  SprawData(
                      id: 'wek',
                      title: 'Wek',
                      level: 2,
                      tasks: [
                        'Umie przygotować proste przetwory (np. dżem lub ogórki kiszone).',
                        'W warunkach polowych potrafi zabezpieczyć żywność (np. nabiał, mięso, owoce) przed zepsuciem przez 3 dni.',
                        'Potrafi zadbać o odpowiednie warunki przechowywania i transportu produktów lub przetworzonej żywności.',
                      ]
                  ),

                  SprawData(
                      id: 'kuchmistrz',
                      title: 'Kuchmistrz',
                      level: 3,
                      tasks: [
                        'Umie ugotować 10 różnych dań.',
                        'Potrafi zaplanować i przygotować kierując kilkuosobowym zespołem obiad dla 15–20 osób (np. dla drużyny), składający się z dwóch dań. Umie obliczyć ilość potrzebnych produktów tak, aby wszyscy się najedli.',
                        'Rozpoznaje i potrafi korzystać z kilkunastu przypraw, wie które są podstawowe dla poszczególnych kuchni regionalnych.',
                        'Potrafi przygotować listę zakupów obejmującą wszystkie posiłki w ciągu dnia.',
                        'W przygotowywanych posiłkach umie zadbać o odpowiednie proporcje produktów i składników odżywczych.',
                      ]
                  ),

                  SprawData(
                      id: 'cukiermistrz',
                      title: 'Cukiermistrz',
                      level: 3,
                      tasks: [
                        'Potrafi przygotować 10 różnych deserów.',
                        'Umie dobrać i przygotować deser na wyjątkową okazję dla grupy kilkunastu osób (np. podczas święta obozu, rodzinnego spotkania albo urodzin znajomego).',
                        'Potrafi zachować balans smaków (np. słodyczy i kwaśności).',
                        'Umie samodzielnie przygotować wyjątkową dekorację deseru, taką jak fantazyjne wzory z kremu, trójwymiarowe kształty z czekolady, żywe jadalne kwiaty.',
                      ]
                  ),

                  SprawData(
                      id: 'przetwornik',
                      title: 'Przetwornik',
                      level: 3,
                      tasks: [
                        'Umie samodzielnie przygotować smaczne i zdrowe wyżywienie, które nie zepsuje się czasie kilkudniowej wędrówki (np. suszone mięso i owoce, własnoręcznie przygotowane batoniki energetyczne lub weki).',
                        'Potrafi przygotować 5 różnych przetworów, w tym słodkie i słone.',
                        'Wie, na czym polega pasteryzacja, i umie ją przeprowadzić.',
                        'Potrafi przygotować jadłospis na kilkudniowy wyjazd z uwzględnieniem zwiększonego zapotrzebowania kalorycznego grupy.',
                      ]
                  ),

                ]
            )

          ]
      ),

      SprawGroupData(
          id: 'nauka_i_kultura',
          title: 'Nauka i kultura',
          familyData: [

            SprawFamilyData(
                id: 'nauka',
                title: 'Nauka',
                tags: ['#eksperyment', '#ciekawość', '#wyobraźnia', '#umysł', '#zagadka', '#spryt', '#książka', '#harmonia', '#dyscyplina', '#narzędzia', '#obiektyw', '#obserwacja', '#natura', '#las'],
                fragment: 'W moim pokoju w Princeton było okno wykuszowe z półokrągłym parapetem. Pewnego dnia weszły na parapet mrówki i wałęsały się na wszystkie strony. Zainteresowało mnie, jak znajdują drogę, skąd wiedzą, dokąd mają iść? Czy umieją się nawzajem informować, gdzie jest jedzenie, tak jak pszczoły? Czy mają jakieś poczucie geometrii? Czysta amatorszczyzna: wszyscy znają odpowiedź na te pytania, ale ja nie znałem, więc rozciągnąłem nad parapetem sznurek i podwiesiłem tuż nad parapetem trochę cukru na tekturce. Chodziło o to, żeby mrówki nie znalazły cukru przypadkiem – eksperyment był kontrolowany. (…) Porozkładałem papierki na parapecie w dwóch grupach: koło cukru (wiszącego na sznurku) i koło mrówek, które zgromadziły się gdzie indziej. Siedziałem całe popołudnie, czytając i zerkając, czy jakaś mrówka nie zabłąkała się na któryś z moich papierowych „promów”. Jeżeli tak, przenosiłem ją w pobliże cukru. Kiedy kilka mrówek zostało przetransportowanych w pobliże cukru, jedna z nich przypadkiem znów weszła na prom, więc odniosłem ją z powrotem. Chciałem sprawdzić, czy pozostałe mrówki otrzymają informację, że trzeba się udać do „terminalu promów”. Z początku szło powoli, ale po jakimś czasie bez przerwy transportowałem mrówki tam i z powrotem.',
                fragmentAuthor: 'Richard P. Feynman, „Pan raczy żartować Panie Feynman”',
                sprawData: [

                  SprawData(
                      id: 'eksperymentator',
                      title: 'Eksperymentator',
                      level: 1,
                      tasks: [
                        'Umie przeprowadzić ciekawy eksperyment naukowy i pokazać go kolegom (np. harcerzom z zastępu).',
                      ]
                  ),

                  SprawData(
                      id: 'fizyk',
                      title: 'Fizyk',
                      level: 2,
                      tasks: [
                        'Potrafi w eksperymencie zademonstrować jedno z praw fizycznych (np. prawo Archimedesa, zasadę zachowania pędu lub wytwarzanie pola magnetycznego przez prąd elektryczny).',
                        'Umie podać praktyczne przykłady, gdzie to prawo ma zastosowanie.',
                      ]
                  ),

                  SprawData(
                      id: 'chemik',
                      title: 'Chemik',
                      level: 2,
                      tasks: [
                        'Umie w bezpieczny sposób przeprowadzić reakcję chemiczną (np. mieszanie sody oczyszczonej z octem lub spalanie cukru).',
                        'Potrafi wskazać praktyczne zastosowania tej reakcji.',
                      ]
                  ),

                  SprawData(
                      id: 'biolog',
                      title: 'Biolog',
                      level: 2,
                      tasks: [
                        'Potrafi przeprowadzić eksperyment, żeby zademonstrować wybrane zjawisko ze świata bakterii, grzybów, roślin lub zwierząt (np. wpływ temperatury i wilgotności na pleśnienie jedzenia albo zjawisko osmozy).',
                        'Umie zaprezentować wnioski z przeprowadzonego eksperymentu.',
                      ]
                  ),

                  SprawData(
                      id: 'newton',
                      title: 'Newton',
                      level: 3,
                      tasks: [
                        'Potrafi samodzielnie zaplanować i przeprowadzić eksperyment, żeby potwierdzić jedno z praw fizycznych (np. prawo Ohma lub drugą zasadę dynamiki) albo zmierzyć wartość jakiejś stałej fizycznej (np. prędkości dźwięku lub przyspieszenia ziemskiego).',
                        'Umie przeanalizować wyniki doświadczenia oraz wytłumaczyć ewentualną niezgodność wyników z teorią.',
                        'Potrafi ocenić niepewność wykonywanych pomiarów.',
                      ]
                  ),

                  SprawData(
                      id: 'mendelejew',
                      title: 'Mendelejew',
                      level: 3,
                      tasks: [
                        'Umie w warunkach domowych lub polowych wytworzyć substancję (np. atrament sympatyczny lub mydło) albo przeprowadzić eksperyment chemiczny (np. węże faraona z sody i cukru) samodzielnie dobierając składniki w odpowiednich proporcjach, przygotowując i przeprowadzając cały proces.',
                        'Potrafi wyjaśnić przebieg doświadczenia, wskazać jakie reakcje chemiczne miały miejsce i zapisać ich równania.',
                        'W czasie pracy umie zastosować zasady bezpieczeństwa. Zna sposoby oznakowania substancji niebezpiecznych.',
                      ]
                  ),

                  SprawData(
                      id: 'linneusz',
                      title: 'Linneusz',
                      level: 3,
                      tasks: [
                        'Potrafi zaplanować eksperyment z dziedziny biologii: wyznaczyć cel, sformułować hipotezę, przygotować potrzebne materiały i składniki. Przykładowo: wpływ różnych czynników (np. wilgotności, światła lub obecności osobników innych gatunków) na kiełkowanie nasion albo wpływ mydlin na wzrost roślin lądowych i wodnych.',
                        'Umie przeprowadzić zaplanowany eksperyment zgodnie z wymogami rzetelnej pracy naukowej: m.in. minimum 20 powtórzeń w próbie (np. 20 nasion hodowanych w tych samych warunkach), porównanie z próbą kontrolną.',
                        'Potrafi przeprowadzić analizę statystyczną otrzymanych wyników, wyciągnąć z nich wnioski i zaprezentować je w czytelnej postaci (np. wykresu).',
                        'Umie obsługiwać mikroskop optyczny i wykorzystać go do obserwowania przygotowanych przez siebie preparatów, takich jak skórka cebuli, liść, pyłki lub włosy.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'obserwacja_nieba',
                title: 'Obserwacja nieba',
                tags: ['#obserwacja', '#umysł', '#mapa', '#wiatr', '#ruch', '#wyobraźnia', '#narzędzia', '#obiektyw', '#szlak', '#ciekawość', '#harmonia', '#woda', '#odpowiedzialność', '#natura', '#survival'],
                fragment: 'Spośród licznych i rozmaitych nauk i sztuk zasilających umysł ludzki, zdaniem moim, te nade wszystko zasługują, ażeby im się poświęcić i oddać z całą usilnością, które mają za przedmiot rzeczy najpiękniejsze i najgodniejsze poznania. Takimi są nauki, których przedmiotem są cudowne obroty świata, biegi planet, ich wielkości i odległości, ich wschody i zachody oraz przyczyny innych zjawisk na niebie dostrzeganych, które ostatecznie całą budowę świata wyjaśniają. Cóż bowiem piękniejszego nad niebo, ponad to zbiorowisko wszystkich piękności, na co wskazują już same wyrazy caelum i mundus, z których drugi oznacza czystość i ozdobę, a pierwszy misterne sklepienie, przez wielu filozofów dla swojej nadzwyczajnej wspaniałości widzialnym bóstwem nazwane. Otóż jeżeli zechcemy oceniać nauki według wartości przedmiotu, jakim się każda zajmuje, ta najpierwsze otrzyma miejsce, którą jedni astronomią, inni astrologią, wielu zaś spośród starożytnych szczytem nauk matematycznych nazywają.',
                fragmentAuthor: 'Mikołaj Kopernik, „O obrotach sfer niebieskich”',
                sprawData: [

                  SprawData(
                      id: 'obserwator_nieba',
                      title: 'Obserwator nieba',
                      level: 1,
                      tasks: [
                        'Umie odnaleźć na niebie Gwiazdę Polarną, a także rozpoznać 3 gwiazdozbiory.',
                        'Potrafi rozpoznać chmury z rodzaju Cumulus.',
                      ]
                  ),

                  SprawData(
                      id: 'astronom',
                      title: 'Astronom',
                      level: 2,
                      tasks: [
                        'Zna i umie samodzielnie odnaleźć na niebie 5 gwiazdozbiorów, w tym po jednym charakterystycznym dla nieba letniego i zimowego.',
                        'Potrafi wykorzystać mapę nieba, aby odnaleźć lub nazwać widoczne gwiazdozbiory i najjaśniejsze gwiazdy.',
                        'Umie przy pomocy danych astronomicznych (np. z Internetu) odnaleźć na niebie widoczne akurat planety.',
                      ]
                  ),

                  SprawData(
                      id: 'meteorolog',
                      title: 'Meteorolog',
                      level: 2,
                      tasks: [
                        'Umie na podstawie zjawisk na lądzie lub morzu ocenić siłę wiatru w skali Beauforta.'
                            'Potrafi odczytać z barometru ciśnienie atmosferyczne. Na podstawie kilku kolejnych pomiarów umie ocenić, czy ciśnienie rośnie, spada czy utrzymuje się na stałym poziomie.'
                            'Potrafi rozpoznać oznaki zbliżającej się burzy.'
                            'Umie rozpoznać 3 rodzaje chmur.',
                      ]
                  ),

                  SprawData(
                      id: 'kopernik',
                      title: 'Kopernik',
                      level: 3,
                      tasks: [
                        'Potrafi używać teleskopu: wie do czego służą jego poszczególne części, jak go przechowywać i przygotować do obserwacji.',
                        'Umie przez teleskop obserwować ciała niebieskie (np. bliskie galaktyki, powierzchnię Księżyca, księżyce Jowisza) i zjawiska astronomiczne (np. fazy Wenus). Potrafi pokazać je kolegom.',
                        'Umie pokrótce wytłumaczyć wybrane zagadnienie współczesnej astronomii (np. przesunięcie ku czerwieni widma odległych obiektów, soczewkowanie grawitacyjne czy badanie składu chemicznego i ewolucji gwiazd).',
                        'Potrafi wyjaśnić zaobserwowany ruch planet po niebie za pomocą teorii heliocentrycznej.',
                      ]
                  ),

                  SprawData(
                      id: 'synoptyk',
                      title: 'Synoptyk',
                      level: 3,
                      tasks: [
                        'Umie zorganizować stację meteorologiczną, która umożliwi pomiar temperatury powietrza, ciśnienia atmosferycznego i kierunku wiatru. Na podstawie odczytu z barometru potrafi obliczyć ciśnienie zredukowane do poziomu morza. Umie wykorzystać wyniki pomiarów do orientacyjnego przewidywania pogody.',
                        'Potrafi rozpoznać niebezpieczne zmiany siły i kierunku wiatru, takie jak szkwał, odbicie i dysza; umie wyjaśnić zjawisko bryzy porannej i wieczornej; wie, jakie kierunki wiatru dominują w Polsce. Potrafi wykorzystać tę wiedzę w praktyce (np. w czasie żeglugi lub rozstawiania obozowiska).',
                        'Umie rozpoznać rodzaj chmury ze względu na kształt i wysokość występowania. Potrafi wskazać zjawiska pogodowe związane z występowaniem różnych rodzajów chmur.',
                        'Potrafi korzystać z ogólnodostępnych numerycznych prognoz pogody, umie zinterpretować mapy pogody i meteogramy.',
                        'Potrafi wyjaśnić zjawisko powstawania układów barycznych oraz frontów atmosferycznych i ich wpływ na pogodę.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'badanie_swiata',
                title: 'Badanie świata',
                tags: ['#zagadka', '#obserwacja', '#spryt', '#eksperyment', '#ludzie', '#ciekawość', '#pamięć', '#słowo', '#wyobraźnia', '#narzędzia', '#rozmowa', '#natura'],
                fragment: 'Wielu ludzi ma poczucie, że świat jest równie niepojęty jak sztuka czarodzieja, nagle wyciągającego królika z pustego przed chwilą cylindra. Jeśli chodzi o królika, rozumiemy, że czarodziej musiał nas oszukać, i pragniemy odkryć, w jaki sposób tego dokonał. Ze światem sprawa przedstawia się nieco inaczej. Wiemy, że świat to nie żadne szachrajstwo i bujda, bo przecież chodzimy po Ziemi, sami jesteśmy częścią świata. Właściwie to my sami jesteśmy białym królikiem wyciągniętym z cylindra. Różnimy się od białego królika tylko tym, że on nie zdaje sobie sprawy, iż bierze udział w sztuczce. Z nami jest inaczej. My uważamy, że uczestniczymy w czymś zagadkowym i chcielibyśmy dowiedzieć się, jak właściwie sprawy się mają.',
                fragmentAuthor: 'Jostein Gaarder, „Świat Zofii”',
                sprawData: [

                  SprawData(
                      id: 'poszukiwacz',
                      title: 'Poszukiwacz',
                      level: 1,
                      tasks: [
                        'Umie znaleźć prawdopodobną przyczynę ciekawego zjawiska zaobserwowanego w najbliższym otoczeniu (np. popularności piosenek na ogniskach lub tras, którymi koledzy chodzą do szkoły).',
                        'Potrafi użyć do sprawdzenia swojej hipotezy narzędzi badawczych (np. cyklicznej obserwacji lub ankiety).',
                      ]
                  ),

                  SprawData(
                      id: 'badacz',
                      title: 'Badacz',
                      level: 2,
                      tasks: [
                        'Umie określić cel w planowanym badaniu (np. ocena zadowolenia harcerzy z posiłków na ostatnim obozie lub atrakcyjności zajęć pozalekcyjnych dostępnych w szkole).',
                        'Potrafi zrealizować badanie odpowiadające na postawiony cel za pomocą przygotowanych przez siebie narzędzi badawczych (np. ankiety, eksperymentu lub serii wywiadów osobistych).',
                        'Potrafi wyciągnąć wnioski z przeprowadzonych badań.',
                        'W swojej pracy badawczej potrafi zachować obiektywizm (np. nie sugeruje odpowiedzi na zadawane przez siebie pytania).',
                      ]
                  ),

                  SprawData(
                      id: 'socjolog',
                      title: 'Socjolog',
                      level: 3,
                      tasks: [
                        'Umie przygotować scenariusz i na jego podstawie przeprowadzić osobisty wywiad pogłębiony, a także wypisać wnioski z niego płynące.',
                        'Potrafi przygotować kwestionariusz do badania, unikając typowych błędów (np. sugerowania odpowiedzi, niejasnych pytań oraz nieprzemyślanej kolejności pytań). Umie przeprowadzić badanie ankietowe w wybranej formie (np. ankieta papierowa lub internetowa).',
                        'Na podstawie zebranych przez siebie danych potrafi zaobserwować ciekawe tendencje, wyciągnąć wnioski i przedstawić je w formie graficznej.',
                        'Umie zebrać opinie, wykorzystując odpowiednią formę (np. ankietę, pudełko na postulaty, plakat na wpisywanie pomysłów lub głosowanie przez stawianie kropek).',
                      ]
                  ),

                  SprawData(
                      id: 'moderator',
                      title: 'Moderator',
                      level: 3,
                      tasks: [
                        'Potrafi przygotować scenariusz i materiały pomocnicze (np. dane statystyczne związane z tematem) a następnie przeprowadzić dyskusję moderowaną w gronie co najmniej 4 osób. Umie określić zasady spotkania (np. kolejność oraz czas wypowiedzi) i pilnować ich w czasie dyskusji.',
                        'Potrafi napisać sprawozdanie lub artykuł z przeprowadzonej dyskusji, uwzględniając w nim różne pojawiające się w niej punkty widzenia, problemy lub pomysły i zaplanowane rozwiązania.',
                        'Umie zadawać pytania otwarte, które mogą pomóc uczestnikom dyskusji w opisaniu ich pomysłów.',
                        'Posiada sprawność **Rozjemcy ze ścieżki „Komunikacja”.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'kronikarstwo_i_historia',
                title: 'Kronikarstwo i historia',
                tags: ['#pamięć', '#słowo', '#ludzie', '#obserwacja', '#twórczość', '#książka', '#ciekawość', '#odpowiedzialność', '#wyobraźnia', '#droga', '#rozmowa'],
                fragment: 'Herodot zaczyna swoją książkę od zdania, w którym wyjaśnia, dlaczego w ogóle ją napisał: „Herodot z Halikarnasu przedstawia tu wyniki swych badań, żeby ani dzieje ludzkości z biegiem czasu nie zatarły się w pamięci, ani wielkie i podziwu godne dzieła, jakich Grecy, bądź barbarzyńcy dokonali, nie przebrzmiały bez echa, między innymi szczególnie wyjaśniając, dlaczego oni ze sobą walczyli.” To zdanie jest kluczem do całej książki. Po pierwsze, Herodot informuje w nim, że prowadził jakieś badania (czy raczej wolałbym użyć słowa “dociekania”). Dziś wiemy, że poświęcił im całe – długie jak na owe czasy -życie. Dlaczego to zrobił? (…) Człowiek współczesny nie troszczy się o własną pamięć, ponieważ żyje otoczony pamięcią zmagazynowaną. Wszystko ma na wyciągnięcie ręki – encyklopedie, podręczniki, słowniki kompendia. biblioteki, i muzea, antykwariaty i archiwa. Taśmy dźwiękowe i filmowe, internet. (…) W świecie Herodota niemal jedynym depozytariuszem pamięci jest człowiek. Żeby więc dotrzeć do tego co zapamiętane, trzeba dojść do człowieka, a jeżeli mieszka on daleko od nas, musimy do niego pójść, wyruszyć w drogę, a kiedy już się spotkamy – usiąść razem i wysłuchać, co nam powie, wysłuchać, zapamiętać, może zapisać. Tak zaczyna się reportaż, z takiej rodzi się sytuacji.',
                fragmentAuthor: 'Ryszard Kapuściński, „Podróże z Herodotem”',
                sprawData: [

                  SprawData(
                      id: 'skryba',
                      title: 'Skryba',
                      level: 1,
                      tasks: [
                        'Umie w ciekawy i poprawny językowo sposób opisać wydarzenie, w którym uczestniczył.',
                        'Potrafi opracować wpis do kroniki (papierowej lub elektronicznej) w formie relacji zawierającej tekst i zdjęcia lub ilustracje oraz wykonać go w estetyczny sposób.',
                      ]
                  ),

                  SprawData(
                      id: 'kronikarz',
                      title: 'Kronikarz',
                      level: 2,
                      tasks: [
                        'Umie opisać wydarzenia, których był świadkiem, dbając nie tylko o fakty, ale także oddając nastrój i towarzyszące im emocje, korzystając z własnych wspomnień, a także konfrontując ze sobą relacje uczestników (np. członków przeciwnych zespołów w relacji z gry terenowej).',
                        'Potrafi zaplanować i wykonać cykl kronikarski (np. na stronie lub fanpage’u drużyny) opisujący kilka wydarzeń i łączący się w spójną stylistycznie całość.',
                        'Umie zbadać i opisać wydarzenie z przeszłości, posługując się różnymi źródłami informacji (np. wspomnieniami uczestników, zdjęciem, artykułem prasowym lub książką).',
                        'Zna i stosuje zasady kompozycji tekstu i fotografii.',
                      ]
                  ),

                  SprawData(
                      id: 'kopista',
                      title: 'Kopista',
                      level: 2,
                      tasks: [
                        'Umie płynnie i czytelnie pisać odręcznie, zachowując stałą wysokość liter małych i wielkich.',
                        'Potrafi korzystać z narzędzi pisarskich o różnych końcówkach (np. flamastrów o końcówkach okrągłych i ściętych).',
                        'Umie wykonać odręcznie ozdobny inicjał lub tytuł. Sprawnie posługuje się wybranym krojem pisma ozdobnego.',
                      ]
                  ),

                  SprawData(
                      id: 'reporter',
                      title: 'Reporter',
                      level: 3,
                      tasks: [
                        'Potrafi wybrać interesujący go temat, dotrzeć do świadków związanych z nim wydarzeń oraz zebrać i opracować ich relacje, posługując się dyktafonem lub kamerą.',
                        'Umie rzetelnie i ciekawie opisać fakty na podstawie zebranych relacji, dokumentów i materiałów multimedialnych.',
                        'Potrafi zredagować i przygotować zebrane przez siebie informacje i relacje do publikacji.',
                        'Umie ocenić przeczytane reportaże pod względem przygotowania i rzetelności autorów, wiarygodności źródeł informacji i wagi poruszanego tematu.',
                      ]
                  ),

                  SprawData(
                      id: 'historyk',
                      title: 'Historyk',
                      level: 3,
                      tasks: [
                        'Potrafi napisać tekst (np. artykuł), w którym skonfrontuje ze sobą dwa różne opisy tego samego wydarzenia historycznego i wskaże różnice między nimi.',
                        'Umie przygotować rozmowę ze świadkiem historii, wie, jakie powinien zebrać informacje wcześniej. Potrafi zadać pytania w sposób pozwalający na swobodną wypowiedź.',
                        'Umie zredagować tekst historyczny z użyciem przypisów, spisu treści, spisu źródeł i spisu ilustracji. Potrafi sporządzić opis bibliograficzny.',
                        'Umie tworzyć i modyfikować treści dostępne w otwartych encyklopediach internetowych (np. Wikipedia), korzystając ze źródeł książkowych lub archiwalnych, podając źródła z jakich korzystał.',
                        'Potrafi posłużyć się internetowym katalogiem biblioteki uniwersyteckiej, miejskiej i Biblioteki Narodowej (w razie konieczności z pomocą osoby pełnoletniej).',
                      ]
                  ),

                  SprawData(
                      id: 'kaligraf',
                      title: 'Kaligraf',
                      level: 3,
                      tasks: [
                        'Potrafi płynnie posługiwać się przynajmniej dwoma odręcznymi krojami pisma w odmianie prostej i pochyłej. Zna i umie wykorzystać w swoim piśmie różne rodzaje szeryfów.',
                        'Wie czym są i do czego służą inicjały, a także potrafi wykonać ozdobny inicjał każdej litery.',
                        'Zna pojęcia takie jak szeryf, wersalik, kapitalik, majuskuła i umie znaleźć (np. w Internecie) krój pisma o interesujących go parametrach.',
                        'Potrafi posługiwać się różnymi narzędziami do kaligrafii, w tym piórem o stalówce ściętej oraz miękkiej.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'literatura',
                title: 'Literatura',
                tags: ['#słowo', '#emocje', '#wyobraźnia', '#umysł', '#twórczość', '#książka', '#ciekawość', '#rytm', '#harmonia', '#technika'],
                fragment: 'Bard skończył śpiewać. Pochyliwszy lekko głowę, powtórzył na lutni motyw przewodni ballady, delikatnie, cicho, o ton wyżej od akompaniującego mu ucznia. (…) – Dzięki ci, mistrzu Jaskrze – powiedział dźwięcznie, choć niegłośno. – Niechaj to ja, Radcliffe z Oxenfurtu, Mistrz Arkanów Magicznych, niechybnie jako wyraziciel opinii wszystkich tu obecnych, wypowiem słowa podziękowania i uznania dla twej wielkiej sztuki i twego talentu. (…) Wzruszone niewiasty pociągały nosami i ocierały oczy, czym mogły, w zależności od stanu, profesji i majętności: wieśniaczki przedramieniem lub wierzchem dłoni, żony kupców lnianymi chustami, elfki i szlachcianki batystem, a trzy córki komesa Viliberta, który dla występu słynnego trubadura przerwał wraz z całym swym orszakiem polowanie z sokołami, smarkały donośnie i przejmująco w gustowne wełniane szaliczki w kolorze zgnitej zieleni. (…) Bezbłędnie wyczuwając właściwy moment, trubadur mrugnął do ucznia. Chłopiec odłożył lutnię i podjął z ziemi szkatułeczkę służącą do zbierania wśród słuchaczy bardziej wymiernych wyrazów uznania. Zawahał się, powiódł wzrokiem po tłumie, po czym odłożył szkatułeczkę i chwycił stojący obok spory ceber. Mistrz Jaskier łaskawym uśmiechem zaaprobował roztropność młodzieńca. (…) – Mistrzu Jaskrze, jakże to tak? Zostawiacie nas w niepewności? Przecie to nie koniec waszej ballady? Zaśpiewajcież nam o tym, co dalej było! – Pieśni i ballady – skłonił się artysta – nie kończą się nigdy, o Pani, bo poezja jest wieczna i nieśmiertelna, nie zna ni początku, ni końca...',
                fragmentAuthor: 'Sapkowski Andrzej, „Krew Elfów” (Saga o Wiedźminie)',
                sprawData: [

                  SprawData(
                      id: 'pioro',
                      title: 'Pióro',
                      level: 1,
                      tasks: [
                        'Umie napisać krótką historyjkę, komiks lub wierszyk albo przerobić tekst piosenki, zachowując zasady poprawnej pisowni.',
                        'Potrafi przygotować swój tekst do prezentacji innym (np. w gazetce, na tablicy obozowej lub stronie internetowej).',
                      ]
                  ),

                  SprawData(
                      id: 'pisarz',
                      title: 'Pisarz',
                      level: 2,
                      tasks: [
                        'Umie napisać utwór w wybranej przez siebie formie literackiej na podstawie inspiracji (np. wiersz na podstawie zdjęcia, opowiadanie na podstawie obrazu lub piosenki) albo przerobić lub uzupełnić istniejącą historię (np. napisać alternatywne zakończenie książki, opisać dalsze losy bohatera lub rozwinąć epizod).',
                        'Potrafi stosować trójpodział narracji (wstęp, rozwinięcie i zakończenie) w swoich utworach literackich (np. opowiadaniach, felietonach).',
                        'Umie przy pomocy słowników sprawdzić tekst pod kątem ortograficznym, gramatycznym, stylistycznym i językowym.',
                      ]
                  ),

                  SprawData(
                      id: 'poeta',
                      title: 'Poeta',
                      level: 3,
                      tasks: [
                        'Potrafi napisać wiersz lub piosenkę na zadany temat, świadomie wykorzystując różne środki stylistyczne, takie jak metafora, parafraza, onomatopeja itp., w celu wywołania konkretnych emocji u odbiorcy.',
                        'Umie zaimprowizować kilkuwersową formę poetycką (np. haiku lub limeryk).',
                        'Potrafi napisać wiersz w narzuconej formie, uwzględniając rytmikę, układ zwrotek i rymów (np. tekst piosenki do istniejącej melodii lub klasyczną formę poetycką, taką jak sonet).',
                        'Zna twórczość wybranych poetów i umie opisać konkretne stosowane przez nich zabiegi stylistyczne, które mu się podobają.',
                        'Potrafi rozróżnić i scharakteryzować kilka lirycznych gatunków literackich, takich jak elegia, fraszka, hymn, oda, pieśń, sonet, tren czy psalm.',
                      ]
                  ),

                  SprawData(
                      id: 'powiesciopisarz',
                      title: 'Powieściopisarz',
                      level: 3,
                      tasks: [
                        'Umie stworzyć opowieść z wieloma wątkami i postaciami w wybranej konwencji literackiej (np. detektywistyczną, fantasy lub science-fiction).',
                        'Potrafi wykreować i opisać atrakcyjny i przekonujący świat przedstawiony, wypełniony bohaterami o określonych cechach i motywacjach.',
                        'Umie pisać dialogi między postaciami tak, aby wynikał z niego styl i sposób wypowiedzi charakterystyczny dla każdej z nich.',
                        'Potrafi wskazać kilku pisarzy, którzy go inspirują, i opisać konkretne, stosowane przez nich zabiegi stylistyczne, które mu się podobają.',
                        'Umie rozróżnić i scharakteryzować kilka epickich i dramatycznych gatunków literackich, takich jak nowela, opowiadanie, powieść, bajka, komedia lub tragedia.',
                      ]
                  ),

                  SprawData(
                      id: 'popularyzator',
                      title: 'Popularyzator',
                      level: 3,
                      tasks: [
                        'Potrafi napisać porywający a jednocześnie rzetelny artykuł popularnonaukowy na temat, który go interesuje.',
                        'Umie zweryfikować prawdziwość informacji z dziedziny, którą się interesuje, a także ocenić i potwierdzić wiarygodność źródeł, z których korzysta.',
                        'Potrafi przygotować swój artykuł do publikacji (np. w gazetce szkolnej): opatrzyć przypisami, podać bibliografię, sprawdzić terminologię.',
                        'Umie wskazać cenione przez siebie wydawnictwa lub portale popularyzatorskie i uargumentować, dlaczego uważa je za wartościowe.',
                        'Posiada sprawność ** w dziedzinie, którą popularyzuje.',
                      ]
                  ),

                  SprawData(
                      id: 'scenarzysta',
                      title: 'Scenarzysta',
                      level: 3,
                      tasks: [
                        'Umie przygotować scenariusz adaptowany bądź oryginalny, zawierający opisy scen, dialogi i didaskalia, na którym może oprzeć się praca ekipy filmowej bądź teatralnej.',
                        'Potrafi stworzyć narrację, w której bohaterowie wchodzą w różnego rodzaju konflikty (np. wewnętrzne, lokalne, zewnętrzne) budujące napięcie i dynamizujące akcję.',
                        'W cenionych przez siebie filmach lub sztukach teatralnych umie scharakteryzować zabiegi narracyjne, które decydują o atrakcyjności i sile przekazu.',
                        'Posiada dowolną sprawność ze ścieżki „Film” lub „Aktorstwo i teatr”.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'lingwistyka',
                title: 'Lingwistyka',
                tags: ['#rozmowa', '#słowo', '#umysł', '#książka', '#ludzie', '#ciekawość', '#melodia', '#pamięć'],
                fragment: 'W każdym razie B-P zdecydował się poznać język hindi. Brał prywatne lekcje u pewnego Hindusa i gdy potrafił się już dostatecznie dobrze porozumieć, udawał się do zamieszkiwanych przez krajowców dzielnic dawnego miasta królewskiego, w nieznane zaułki i skryte uliczki, do studni i zjazdów, na rynki i bazary, gdzie mężczyźni i kobiety wystawiali gawędząc ze sobą albo krzycząc i gestykulując targowali się o towary. Krajowcy, początkowo zdumienie niezwykłym zachowaniem oficera kolonialnego w swej dzielnicy, szybko nabrali do niego zaufania jedynie dlatego, że rozumiał ich mowę. Po wstępnych wahaniach zaczęli szczerze opowiadać mu o swoim życiu, o nędzy i problemach, o radościach i o pociechach, których dostarczała im wiara, mity i magia, tradycja i więzy rodzinne. B-P pojmował stopniowo, jakie błędy popełniało wielu władców kolonialnych w ciągu stuleci: traktowali Hindusów jak ludzi podobnych sobie, jak Anglików, tylko mniej wykształconych, mniej kulturalnych oraz uboższych niż oni sami - nie domyślając się, że byli oni ludźmi z zupełnie innego kręgu kulturowego, o innym sposobie myślenia i innej tradycji. Walter Hansen, „Wilk który nigdy nie śpi” --- Sprawności z tej ścieżki zdobywa się dla wybranego języka obcego. Można je zdobywać wielokrotnie zmieniając język.',
                sprawData: [

                  SprawData(
                      id: 'rozmowka',
                      title: 'Rozmówka',
                      level: 1,
                      tasks: [
                        'Potrafi załatwić kilka spraw w obcym języku, np. dogadać się w sklepie, zapytać o drogę.',
                        'Umie w obcym języku krótko opowiedzieć o sobie i o wydarzeniu, w którym uczestniczył (np. ostatniej zbiórce drużyny, wycieczce klasowej).',
                      ]
                  ),

                  SprawData(
                      id: 'tlumacz',
                      title: 'Tłumacz',
                      level: 2,
                      tasks: [
                        'Umie porozmawiać w języku obcym na kilka tematów (np. szkoła, zainteresowania, wakacje czy miejscowość z której pochodzi).',
                        'Potrafi zrozumieć obcojęzyczny film z napisami w danym języku.',
                        'Umie pisemnie porozumieć się w języku obcym, np. pisząc komentarze na internetowym forum.',
                        'Potrafi czytać ze zrozumieniem krótkie teksty w obcym języku, np. artykuły z interesującej go dziedziny lub wpisy na blogach.',
                      ]
                  ),

                  SprawData(
                      id: 'lingwista',
                      title: 'Lingwista',
                      level: 3,
                      tasks: [
                        'Umie przeprowadzić prezentację w języku obcym (np. oprowadzić obcokrajowców po swoim mieście albo zaprezentować klasie lub drużynie swoje hobby).',
                        'Potrafi ze zrozumieniem przeczytać tekst w języku obcym (np. opowiadanie czy krótką książkę).',
                        'Potrafi napisać w języku obcym tekst, taki jak relacja z obozu lub artykuł na interesujący go temat.',
                        'Rozumie i potrafi korzystać z wyrażeń potocznych, slangu i wyrażeń specjalistycznych w interesującej go dziedzinie (np. oglądając i komentując vlogi czy teksty związane z jego zainteresowaniami).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'komunikacja',
                title: 'Komunikacja',
                tags: ['#rozmowa', '#ludzie', '#harmonia', '#siła', '#słowo', '#emocje', '#współpraca', '#obrzęd', '#ogień', '#oddech', '#odpowiedzialność', '#narzędzia', '#opanowanie'],
                fragment: 'Wódz Mały Kruk porwał się na równe nogi. – To jawna zdrada! – zawołał rozgniewany. Shakopee i inni wodzowie byli nie mniej oburzeni od niego. Jedni dobyli noży, inni maczug. Tylko Żółty Kamień i Wielki Orzeł zachowali spokój. Mały Kruk z innymi chcieli wybiec z tipi, ale Żółty Kamień zastąpił im drogę (…) Mały Kruk doprowadzony do ostateczności tym oporem poszarzał na twarzy. Usta mu drżały, a prawa dłoń silniej zaciskała się na rękojeści noża, ale Żółty Kamień nie uląkł się jego gniewu. Skrzyżował bezbronne ręce na piersiach i stał jak posąg zagradzając rozgniewanym drogę. W tej pełnej napięcia chwili Wielki Orzeł stanął u boku Żółtego Kamienia. – Nie trzeba nam teraz zwady! Żółty Kamień ma rację! – powiedział, spoglądając prosto w oczy Małemu Krukowi. Mały Kruk wzburzony ciężko oddychał. Już sobie uprzytomnił, że sporu z Żółtym Kamieniem nie można rozstrzygnąć pchnięciem noża.',
                fragmentAuthor: 'Krystyna i Alfred Szklarscy, „Ostatnia Walka Dakotów”',
                sprawData: [

                  SprawData(
                      id: 'zgodny',
                      title: 'Zgodny',
                      level: 1,
                      tasks: [
                        'Umie rozwiązać konflikt z kolegą lub koleżanką uwzględniając zarówno potrzeby własne, jak i drugiej osoby.',
                        'W różnych sytuacjach potrafi nazwać swoje uczucia i wskazać ich źródła.',
                      ]
                  ),

                  SprawData(
                      id: 'rozjemca',
                      title: 'Rozjemca',
                      level: 2,
                      tasks: [
                        'Umie oddzielić fakty od opinii i ocen (np. podsumowując grę potrafi wskazać realne przyczyny zwycięstwa lub porażki oraz zaproponować rozwiązania na przyszłość).',
                        'W swoich wypowiedziach potrafi opisać zdarzenie wyraźnie rozgraniczając fakty od emocji, które kierowały jego uczestnikami. Umie wykorzystać tę umiejętność do opisu konfliktu, którego był świadkiem bądź uczestnikiem.',
                      ]
                  ),

                  SprawData(
                      id: 'mediator',
                      title: 'Mediator',
                      level: 3,
                      tasks: [
                        'Potrafi rozwiązać konflikt podejmując się roli mediatora.',
                        'Aby zwiększyć szanse nawiązania kontaktu i porozumienia potrafi prowadzić dialog stosując 4 kroki komunikacji bez przemocy: 1) zaobserwować i opisać fakty w konkretnej sytuacji, 2) nazwać własne uczucia, 3) ocenić jakie jego potrzeby zostały spełnione bądź nie, 4) wyrazić prośby i oczekiwania na przyszłość.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'obywatelstwo',
                title: 'Obywatelstwo',
                tags: ['#pomoc', '#ludzie', '#słowo', '#odpowiedzialność', '#wyobraźnia', '#narzędzia', '#obserwacja', '#rozmowa'],
                fragment: 'Nie konstytucja, nie koncepcje reform – lecz człowiek decyduje o losach kraju. Dobry ustrój państwowy dopomaga, a zły ustrój – utrudnia rozwój kraju, ale fundamentem, na którym zbudowana jest siła lub słabość państwa to człowiek i jego charakter. Charakter człowieka przejawia się w sposobie postępowania, w jego pracy, w rozrywkach, zainteresowaniach, układzie dnia, stosunku do otoczenia. Wszystko to razem składa się na postawę życiową człowieka, na styl jego życia.',
                fragmentAuthor: 'Aleksander Kamiński, „Wielka Gra”',
                sprawData: [

                  SprawData(
                      id: 'swojak',
                      title: 'Swojak',
                      level: 1,
                      tasks: [
                        'Umie doprowadzić do zgodnego podjęcia decyzji w gronie kolegów (np. w zastępie), którą zaakceptują także nieprzekonani.',
                        'Potrafi przeprowadzić uczciwe wybory lub losowanie (np. prezentów na Mikołajki w zastępie).',
                      ]
                  ),

                  SprawData(
                      id: 'niewidzialna_reka',
                      title: 'Niewidzialna ręka',
                      level: 2,
                      tasks: [
                        'Na podstawie obserwacji i rozmów umie zaplanować zadanie służące konkretnej osobie lub społeczności (np. pomoc starszej osobie lub naprawa uszkodzonej ławki na podwórku), a następnie zrealizować je samodzielnie lub w grupie kolegów. Potrafi zrobić to w taki sposób, aby adresat działania nie wiedział, kto je wykonał.',
                      ]
                  ),

                  SprawData(
                      id: 'obywatel',
                      title: 'Obywatel',
                      level: 3,
                      tasks: [
                        'Umie skutecznie zainicjować i doprowadzić do realizacji przedsięwzięcia związanego z życiem szkoły lub życiem sąsiedzkim (np. obchody święta szkoły lub porządkowanie podwórka).',
                        'Potrafi skutecznie przeprowadzić akcję promującą aktywność obywatelską (np. akcja „Wywieś Flagę” lub akcja Szlachetna Paczka).',
                        'Umie znaleźć informację o aktualnych konsultacjach społecznych lub innych formach dialogu społecznego prowadzonych w swojej miejscowości.',
                        'Potrafi na piśmie złożyć pytanie lub zgłosić sprawę dotyczącą społeczności lokalnej lub przestrzeni wspólnej (np. niedziałająca sygnalizacja świetlna). Umie ustalić, kto jest odpowiedzialny za daną kwestię na szczeblu samorządu lokalnego, spółdzielczego lub osiedlowego.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'kolekcjonerstwo',
                title: 'Kolekcjonerstwo',
                tags: ['#ciekawość', '#pamięć', '#obserwacja', '#książka', '#dyscyplina', '#wyobraźnia', '#mapa', '#narzędzia', '#obserwacja'],
                fragment: 'Dziadek nie jadł jeszcze kolacji, głodny jak wilk i wyraźnie czymś przejęty. (…) Nie macie pojęcia, jaka afera się wykryła! – Jaka afera? – zainteresował się Rafał. (…) – Filatelistyczna – rzekł dziadek. (…) Wyobraźcie sobie, że ktoś fałszuje nadruki na znaczkach i dziś właśnie złapaliśmy sfałszowany Honduras! – Nie…! – krzyknął Rafał, okropnie poruszony. – Ten z nadrukiem “poczta lotnicza”? – Ten właśnie.(…) Cała rodzina zażądała stanowczo, żeby dziadek natychmiast wyjaśnił, co to znaczy i na czym polega. – No wiecie, tego… – rzekł Rafał z roziskrzonym wzrokiem i wypiekami na twarzy. – Znaczki są różne, jednych jest mało, a drugich dużo. Te, co ich jest mało, są droższe, nie? Czasami bywa, że z jakiejś okazji potrzebny jest nagle inny znaczek, z inną ceną albo z jakimś napisem. Nie zdąży się na poczekaniu wydrukować nowego znaczka, więc drukuje się odpowiedni napis na takim istniejącym, a nowy wychodzi dopiero później. I taki znaczek z nadrukiem to już jest zupełnie co innego, a jeżeli było tego mało, robi się bardzo drogi. Niektórzy specjalnie zbierają same znaczki z nadrukiem. No i ten Honduras to był taki sobie zwyczajny znaczek, tani, byle jaki, i w 1925 roku nadrukowali na nim „poczta lotnicza”… – Po polsku? – zaciekawił się Pawełek. – Coś ty, głupi? Po portugalsku chyba. „Aereo correo”, znaczy poczta lotnicza.',
                fragmentAuthor: 'Joanna Chmielewska, „Nawiedzony dom”',
                sprawData: [

                  SprawData(
                      id: 'zbieracz',
                      title: 'Zbieracz',
                      level: 1,
                      tasks: [
                        'Umie zebrać kolekcję tematyczną i wyjaśnić, co łączy poszczególne przedmioty w kolekcji.',
                        'Potrafi zaprezentować kolegom swoją kolekcję.',
                      ]
                  ),

                  SprawData(
                      id: 'hobbysta',
                      title: 'Hobbysta',
                      level: 2,
                      tasks: [
                        'Umie opisać kilka elementów swojego zbioru za pomocą 3 kryteriów (np. kraj pochodzenia, rok wykonania, miejsce wydania).',
                        'Potrafi określić ramy gromadzonej kolekcji oraz wyróżnić i scharakteryzować w niej podzbiory, a także barwnie i szczegółowo opowiedzieć historię związaną z wybranym jej elementem.',
                        'Umie zgodnie ze sztuką przechowywać i konserwować swoje zbiory.',
                        'Potrafi wskazać źródła, z których można pozyskiwać nowe elementy zbiorów.',
                      ]
                  ),

                  SprawData(
                      id: 'kolekcjoner',
                      title: 'Kolekcjoner',
                      level: 3,
                      tasks: [
                        'Umie skatalogować swój zbiór poprzez opis wykorzystujący informacje encyklopedyczne, profesjonalne katalogi i inne dane źródłowe.',
                        'Potrafi ciekawie opowiedzieć o różnych elementach swojej kolekcji (np. w kontekście historycznym, geograficznym lub artystycznym).',
                        'Wie, gdzie można obejrzeć zbiory z dziedziny jaką się interesuje oraz jakie instytucje lub osoby zajmują się gromadzeniem podobnych zbiorów.',
                        'Umie praktycznie wykorzystać wiedzę o swoich zbiorach (np. do przygotowania zadań w ramach gry zastępu lub drużyny).',
                        'Potrafi zdobyć nowe elementy do kolekcji różnymi sposobami i z różnych źródeł.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'gry',
                title: 'Gry',
                tags: ['#zasady', '#wyobraźnia', '#twórczość', '#spryt', '#współpraca', '#zespół', '#współzawodnictwo', '#ruch', '#wytrzymałość', '#technika', '#emocje', '#mapa', '#zwinność', '#zagadka'],
                fragment: 'Pułkownik Custer bódł wierzchowca ostrogami wspinając się na stok góskiego pasma. Dopiero na samym szczycie ostro osadził konia w miejscu. W dole na zachodzie ukazały się brzegi Little Bighorn. Custer dobył lunetę. Spoglądał dłuższą chwilę po czym zerwał pilśniowy, czarny kapelusz z głowy i powiewając nim w powietrzu, zawołał: – Hurra…! Indianie ucinają sobie poobiednią drzemkę! Mamy ich! (…) Pułkownik Custer ruszył w dół zbocza. Batalion rozciągnął się szwadronami w linię bojową na długości prawie jednej mili. Szwadron porucznika Smitha wysunął się do przodu w celu wyszukania dogodnego miejsca do przeprawy. Zanim jednak zdołał dotrzeć do brzegu rzeki, dziesiątki indian poderwały się z traw i zaczęły ostrzeliwać go z karabinów i łuków. Szwadron zatrzymał się w miejscu. Trębacze unieśli połyskujące w słońcu trąby. Rozbrzmiała bojowa pieśń Siódmego Pułku Kawalerii, roznoszona echem po górach. (…) Zrozumieli, że widoczny z daleka obóz na północnym krańcu doliny, w którym Indianie rzekomo ucinali drzemkę, był podstępem wojennym. Za późno jednak było na odwrót.',
                fragmentAuthor: 'Krystyna i Alfred Szklarscy, „Ostatnia Walka Dakotów”',
                sprawData: [

                  SprawData(
                      id: 'harcownik',
                      title: 'Harcownik',
                      level: 1,
                      tasks: [
                        'Umie wytłumaczyć zasady i uczestniczyć w 6 różnych grach (np. terenowych, słownych, planszowych lub logicznych).',
                        'We wszelkich grach potrafi postępować honorowo.',
                      ]
                  ),

                  SprawData(
                      id: 'taktyk',
                      title: 'Taktyk',
                      level: 2,
                      tasks: [
                        'Potrafi dowodzić zespołem podczas gry terenowej.',
                        'Umie przeanalizować zasady gry terenowej i na tej podstawie ustalić taktykę oraz przydzielić zadania członkom zespołu. Potrafi w trakcie gry na bieżąco oceniać sytuację i przeprowadzać zmiany w przyjętym planie.',
                        'Potrafi wspólnie z zespołem wyciągnąć z rozgrywki wnioski na przyszłość.',
                        'Potrafi przygotować i przeprowadzić 5 różnych gier (np. terenowych, słownych lub logicznych) dla kilku kolegów.',
                      ]
                  ),

                  SprawData(
                      id: 'strateg',
                      title: 'Strateg',
                      level: 2,
                      tasks: [
                        'Umie grać w przynajmniej jedną grę wymagającą logicznego myślenia (np. szachy, brydż lub go). Potrafi wytłumaczyć jej zasady i nauczyć podstaw gry nowicjusza.',
                        'Umie stosować typowe zagrania taktyczne w wybranej grze logiczno-strategicznej (np. impas brydżowy, pułapki szachowe, groźba ko w go).',
                        'Potrafi zastosować przemyślaną strategię w grze terenowej, planszowej, karcianej lub komputerowej. Umie wyjaśnić na czym polegała, jakie miała zalety i jakie wady, jak wysokie było ryzyko z nią związane.',
                      ]
                  ),

                  SprawData(
                      id: 'organizator_gier_terenowych',
                      title: 'Organizator Gier Terenowych',
                      level: 3,
                      tasks: [
                        'Potrafi wymyślić, przygotować i przeprowadzić minimum godzinną grę terenową dla kilku zespołów (np. zastępów w drużynie) uwzględniając jej mechanikę, estetykę (np. rekwizytów lub instrukcji) i fabułę.',
                        'Umie sporządzić plan gry i listę potrzebnych rzeczy, które pozwolą na jej odtworzenie przez osobę, która wcześniej jej nie znała.',
                        'Potrafi wskazać, jakie umiejętności ćwiczy dana gra (np. orientację w terenie, współpracę, logiczne myślenie) i dobrać grę do zamierzonego celu.',
                        'Umie przerobić i dostosować znaną sobie grę do potrzeb sytuacji (np. dopasowując mechanikę do liczby graczy, miejsca rozgrywki lub fabuły).',
                      ]
                  ),

                  SprawData(
                      id: 'tworca_gier',
                      title: 'Twórca gier',
                      level: 3,
                      tasks: [
                        'Umie wymyślić i stworzyć własną, atrakcyjną grę planszową lub logiczną dla grupy 4–10 osób, uwzględniając jej mechanikę, estetykę (np. planszy lub kart) i fabułę.',
                        'Potrafi opracować instrukcję do swojej gry, która umożliwi samodzielne zrozumienie i rozegranie gry osobom, które jej nie znają.',
                        'Potrafi wskazać, jakie umiejętności ćwiczy dana gra (np. pamięć, współpracę, logiczne myślenie) i dobrać grę do zamierzonego celu.',
                      ]
                  ),

                  SprawData(
                      id: 'arcymistrz',
                      title: 'Arcymistrz',
                      level: 3,
                      tasks: [
                        'Umie przeanalizować strategię lub taktyczne zagrania przeciwnika w wybranej grze logiczno-strategicznej, wskazać wady i zalety tych zagrań i zastosować odpowiednie kontry.',
                        'Zna zasady turniejowe wybranej przez siebie gry logiczno-strategicznej. Potrafi taki turniej zorganizować.',
                        'Umie pokazać analogie między wybraną grą logiczno-strategiczną, a strategią wojskową lub gospodarczą.',
                        'Potrafi obiektywnie ocenić swoje umiejętności w wybranej grze logiczno-strategicznej w odniesieniu do powszechnie stosowanych rankingów lub kategorii.',
                      ]
                  ),

                ]
            )

          ]
      ),

      SprawGroupData(
          id: 'duch_i_charakter',
          title: 'Duch i charakter',
          familyData: [

            SprawFamilyData(
                id: 'rozwaga',
                title: 'Rozwaga',
                tags: ['#opanowanie', '#siła', '#umysł', '#ludzie', '#harmonia', '#oddech', '#odpowiedzialność', '#słowo', '#rozmowa'],
                fragment: '(...) Prawa legowiska: Pierwszą zasadą gromady puszczańskiej Przemyszków, Kaziuków i innych znających drogi i ścieżki i tropy puszczy jest: „Jeden za wszystkich, wszyscy za jednego”, a drugą: „Co powiedział Stary Wilk – powiedział” i trzecią „Wszyscy myślą, jeden mówi i razem czynią”. Niechaj się więc nikt z gromady puszczańskiej nie waży w czemkolwiek szukać swego żeru z krzywdą drugiego lub zapomnieniem o którymkolwiek z braci ani zmienić choćby na jotę co powiedzianem zostało przez wodzów gromady, ani oddawać się bezmyślności i składaniu na innych, lub bezczynności albo zbytniej gadaninie – a zaś wszędzie ma panować miłość uczynna, karność żelazna, ład i porządek i roztropność i współdziałanie i wielka moc i siła, aby wszystko stężało, zjędrniało, wzmocniło się jak ściana boru nieugięta, jak toń jeziora nieprzenikliwa.(...)',
                fragmentAuthor: 'Arkadiusz Awin, „Tradycja i spuścizna kursów nad Wigrami”',
                sprawData: [

                  SprawData(
                      id: 'chudy_jastrzab',
                      title: 'Chudy Jastrząb',
                      level: 1,
                      tasks: [
                        'Umie spierać się z szacunkiem do rozmówcy w dyskusji na żywo i w Internecie. Potrafi wypowiadać się tak, by być dobrze zrozumianym i nie urazić innych.',
                        'Potrafi przedstawić konkretne argumenty potwierdzające jego zdanie lub opinię.',
                      ]
                  ),

                  SprawData(
                      id: 'czarna_pantera',
                      title: 'Czarna Pantera',
                      level: 2,
                      tasks: [
                        'Umie zauważyć popełniane przez siebie lub innych błędy poznawcze (np. uprzedzenia, generalizowanie, myślenie czarnobiałe itd.) i potrafi wyjaśnić, na czym polegają i jak się ich wystrzegać.',
                        'Potrafi przedstawić różne racje i spojrzenia na tę samą sprawę oraz wyjaśnić jakie mogą być przyczyny różnych poglądów.',
                        'Umie ocenić i zweryfikować wiarygodność zasłyszanej informacji, konfrontując różne źródła.',
                      ]
                  ),

                  SprawData(
                      id: 'stary_wilk',
                      title: 'Stary Wilk',
                      level: 3,
                      tasks: [
                        'Potrafi poprowadzić debatę, w której obowiązują określone zasady.',
                        'Umie przedstawić swoje racje, również w sytuacji kiedy są niepopularne w grupie.',
                        'Potrafi wysłuchać cudzych argumentów i zważyć różne racje w odniesieniu do zagadnień moralnych np. wynikających z Prawa Harcerskiego.',
                        'Posiada sprawność **Rozjemcy ze ścieżki „Komunikacja”.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'dzielnosc',
                title: 'Dzielność',
                tags: ['#dyscyplina', '#zasady', '#karność', '#harmonia', '#siła', '#słowo', '#odpowiedzialność'],
                fragment: 'Dzielność osobista – to obok karności – druga właściwość charakteru, która powinna stać się ideałem cnót, w jakie wpatrzone są polskie oczy. Ona to właśnie zapewni nam powodzenie w życiu osobistym, a naszemu narodowi – wielkość. Ona – ta dzielność – wypełnić będzie zdolna obniżające naszą wartość wygodnictwo, próżniactwo, powierzchowność w myśleniu i w działaniu. (...) I na zakończenie – wskazanie praktyczne: przeczytać to wszystko i zrozumieć – to mało. Z przeczytania i zrozumienia żadnych praktycznych korzyści nie będzie, trzeba, rzecz zrozumiawszy, wcielać je w czyn.',
                fragmentAuthor: 'Aleksander Kamiński, „Wielka Gra”',
                sprawData: [

                  SprawData(
                      id: 'kamyk',
                      title: 'Kamyk',
                      level: 1,
                      tasks: [
                        'Umie zaplanować swój dzień tak, aby zrealizować swoje regularne obowiązki oraz mieć czas na przyjemności i odpoczynek.',
                        'Potrafi przez określony czas (np. dwóch tygodni) dotrzymać zobowiązania lub postanowienia (np. nowego obowiązku domowego lub systematycznych ćwiczeń).',
                      ]
                  ),

                  SprawData(
                      id: 'glaz',
                      title: 'Głaz',
                      level: 2,
                      tasks: [
                        'Umie na określony czas (np. miesiąc) zrezygnować z konkretnej przyjemności, żeby zrealizować postawiony sobie cel.',
                        'Potrafi zaplanować i przeprowadzić działanie, które zajmuje czas kilkunastu dni lub kilku tygodni (np. konieczna jest systematyczna codzienna praca przez 2 lub 3 tygodnie).',
                      ]
                  ),

                  SprawData(
                      id: 'skala',
                      title: 'Skała',
                      level: 3,
                      tasks: [
                        'Potrafi wyrobić sobie nowy pożyteczny nawyk.',
                        'Umie wskazać swoje mocne i słabe strony oraz uwzględnić je w podejmowanych działaniach, aby jak najlepiej wykorzystać swój potencjał.',
                        'Potrafi wyznaczyć sobie realny do osiągnięcia cel, wspierający rozwój jednej z mocnych stron lub niwelujący jedną ze słabości, a następnie go zrealizować, wyznaczając konkretne zadania i terminy.',
                        'Umie właściwie ocenić swoje możliwości przy przyjmowaniu nowych zobowiązań tak, aby móc ich dotrzymywać bez zaniedbywania swoich dotychczasowych potrzeb i obowiązków.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'sluzba_liturgiczna',
                title: 'Służba liturgiczna',
                tags: ['#Bóg', '#pomoc', '#słowo', '#współpraca', '#karność', '#melodia', '#woda', '#obrzęd', '#odpowiedzialność'],
                fragment: 'Z murów zachowały się tylko niektóre kolumny, wspomnienie po ziejących pustką arkadach. Najwyraźniej Urząd Ochrony Zabytków spisał tę budowlę na straty, zadowalając się postawieniem ochronnych płotków wysokości człowieka w miejscach, gdzie budowla groziła zawaleniem. Jedynie prezbiterium z trzema łukami sklepienia, wedle starego obyczaju zwrócone tyłem do wschodu, pozostało nienaruszone, ale mury kończyły się na wysokości głównego ołtarza, z którego pozostał tylko samotny cokół. Właśnie przez szparę w płocie chorąży Plassard spostrzegł postaci trzech mężczyzn, którzy tworzyli w świetle księżyca jakby żywy obraz. Jeden z nich klęczał tyłem do Plassarda. Dwaj inni stali twarzą do niego, jeden nieco z tyłu, jakby z szacunku dla swego towarzysza, który trwał nieruchomo z ramionami wyciągniętymi nad głową klęczącego mężczyzny. Na ile Plassard zdołał dojrzeć, w tym półmroku i z tej odległości, nikt z tej trójki nie był ubrany w jakiś szczególny sposób. Główna postać tego zdumiewającego trio wyróżniała się jednak jakąś czerwoną szarfą na szyi. Głosy umilkły. Jeśli odbywała się tu jakaś ceremonia, to właśnie dobiegła końca.',
                fragmentAuthor: 'Jean Raspail, „Pierścień Rybaka”',
                sprawData: [

                  SprawData(
                      id: 'ministrant',
                      title: 'Ministrant',
                      level: 1,
                      tasks: [
                        'Umie służyć do Mszy Świętej (m.in. obsłużyć dzwonki, ampułki, kielich).',
                      ]
                  ),

                  SprawData(
                      id: 'ministrant_oltarza',
                      title: 'Ministrant Ołtarza',
                      level: 2,
                      tasks: [
                        'Potrafi wypełniać obowiązki asysty ministranckiej w trakcie uroczystej Mszy Świętej (m.in. obsłużyć trybularz, akolitki, ewangeliarz) oraz innych nabożeństw.',
                      ]
                  ),

                  SprawData(
                      id: 'liturgista',
                      title: 'Liturgista',
                      level: 3,
                      tasks: [
                        'Umie zorganizować uroczystą liturgię jako ceremoniarz i potrafi do niej służyć.',
                        'Umie zorganizować Mszę Świętą w warunkach polowych, aby zapewnić jej godne sprawowanie.',
                        'Zna nazwy ksiąg liturgicznych i wie kiedy się ich używa.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'slowo_boze',
                title: 'Słowo Boże',
                tags: ['#Bóg', '#słowo', '#rozmowa', '#siła', '#droga', '#ciekawość', '#rytm', '#melodia', '#książka', '#harmonia', '#obrzęd', '#umysł'],
                fragment: 'Czemuż dotknął mnie Bóg w ten sposób? Czymże zawiniłem? Wobec tego pytania poczułem wyrzut sumienia i głos jakiś potężny zawołał we mnie: – Nędzniku! Pytasz czym zawiniłeś? Spójrz wstecz na swe zmarnowane życie i spytaj raczej czym nie zawiniłeś! Spytaj, czemu Bóg w słusznym gniewie nie ukarał cię już dotąd śmiercią, czemu nie zginąłeś w przystani Yarmouth lub pod tą wyspą nie zatonąłeś w falach jak twoi nieszczęśni towarzysze! Jak śmiesz pytać o swoje winy? Wziąłem do rąk jedną z Biblii wyratowanych z okrętu i zacząłem czytać. Ale umysł mój tak był wyczerpany chorobą, że przez czas długi zrozumieć nie mogłem słów Pisma Świętego. W końcu oczy me spoczęły na zdaniu: – Wzywaj mnie w potrzebie, ja cię ocalę, ty zaś wielbĳ imię moje! Uczyniło to na mnie niesłychanie silne wrażenie. Po raz pierwszy w życiu ukląkłem i roniąc gorące łzy zacząłem błagać Boga, by spełnił obietnicę i ocalił mnie, bowiem wzywałem go z taką wiarą w złej chwili.',
                fragmentAuthor: 'Daniel Defoe, „Przypadki Robinsona Crusoe”',
                sprawData: [

                  SprawData(
                      id: 'biblista',
                      title: 'Biblista',
                      level: 1,
                      tasks: [
                        'Umie odnaleźć właściwy fragment Pisma Świętego na podstawie skrótów biblijnych (sigla).',
                        'Potrafi godnie odczytać fragment Pisma Świętego (np. podczas Mszy Świętej lub obchodów święta w domu).',
                      ]
                  ),

                  SprawData(
                      id: 'librysta',
                      title: 'Librysta',
                      level: 2,
                      tasks: [
                        'Umie poprawnie pod względem interpretacji, intonacji, odpowiednio stawianych akcentów zdaniowych, dykcji i emisji głosu, proklamować Słowo Boże.',
                        'Potrafi znaleźć i zaznaczyć odpowiednie czytania w lekcjonarzu i ewangeliarzu oraz przygotować potrzebne księgi liturgiczne do celebracji. Potrafi o nie zadbać z należytym szacunkiem tak w czasie liturgii, jak i poza nią.',
                        'Umie streścić wybrany fragment Pisma Świętego (np. przypowieść) i wytłumaczyć, jak go rozumie.',
                      ]
                  ),

                  SprawData(
                      id: 'lektor',
                      title: 'Lektor',
                      level: 3,
                      tasks: [
                        'Potrafi korzystać z różnych interpretacji i komentarzy do Pisma Świętego.',
                        'Umie przeprowadzić rozważania modlitewne lub dyskusję w oparciu o odpowiednio dobrane fragmenty Pisma Świętego.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
              id: 'ogien_ducha',
              title: 'Ogień Ducha',
              tags: ['#Bóg', '#ludzie', '#obrzęd', '#słowo', '#ruch', '#plecak', '#szlak', '#wytrzymałość', '#melodia', '#pamięć', '#ogień', '#mapa', '#droga', '#natura'],
              fragment: 'Kapliczkę obozową zrobił Sękolub. Od Jura otrzymał takie wskazówki: „Zrobisz ją w stylu kapliczek ludowych. W środku będzie krzyż. Zamiast Ukrzyżowanego dasz symboliczne słońce z promieniami. Po obu bokach krzyża trzeba umieścić jakieś kornie modlące się postacie. To wszystko trzeba czymś obramować.” Ta właśnie rama zdecydowała o ostatecznym kształcie. Dwie karłowate sosenki, o pniach symetrycznie wykrzywionych w kształt sierpa (spotyka się takie bardzo często), połączone zostały w ten sposób, że utworzyły strzeliste obramowanie krzyża i dwóch klęczących aniołków (co prawda, żartowano z Sękoluba, że to nie aniołkowie a dwaj rabini w lisich czapach, ale stylizowane skrzydła mówiły dość jasno o intencjach autora). Wszystkie linie kapliczki są szlachetnie zharmonizowane i tworzą bardzo estetyczną całość.',
              fragmentAuthor: 'Antoni Wasilewski, „Pod totemem słońca”',
              sprawData: [

                SprawData(
                    id: 'iskra',
                    title: 'Iskra',
                    level: 1,
                    tasks: [
                      'Umie poprowadzić modlitwę zastępu lub drużyny w różnych sytuacjach (np. modlitwę przed posiłkiem, poranną i wieczorną).',
                    ]
                ),

                SprawData(
                    id: 'zagiew',
                    title: 'Żagiew',
                    level: 2,
                    tasks: [
                      'Zna różne rodzaje i formy modlitwy oraz potrafi ją animować w życiu drużyny.',
                      'Umie zapewnić odpowiednią oprawę do modlitwy, dbając o takie elementy jak miejsce, symbole, wystrój i muzyka.',
                    ]
                ),

                SprawData(
                    id: 'luczywo',
                    title: 'Łuczywo',
                    level: 3,
                    tasks: [
                      'Potrafi zorganizować wydarzenie związane z życiem religijnym w drużynie (np. czuwanie adwentowe, spotkanie wigilijne drużyny, drogę krzyżową) dbając przy tym o scenariusz, wykorzystanie obrzędów i element skupienia (rozważania i modlitwę).',
                    ]
                ),

                SprawData(
                    id: 'pielgrzym',
                    title: 'Pielgrzym',
                    level: 3,
                    tasks: [
                      'Umie określić duchową intencję pielgrzymowania, dobierając odpowiednią trasę i cel.',
                      'Potrafi opowiedzieć innym pątnikom o znaczeniu religijnym i historii miejsca, będącego celem pielgrzymki.',
                      'Umie poprowadzić modlitwę różańcową.',
                      'Zna trzy piosenki, które da się wykonać w czasie marszu. Posiada sprawność *Śpiewaka ze ścieżki „Śpiew”.',
                      'Posiada sprawność **Włóczęgi ze ścieżki „Krajoznawstwo i wędrowanie” lub **Cyklisty ze ścieżki „Jazda na rowerze”.',
                    ]
                ),

              ],

            )

          ]
      ),

    ]
).build();
