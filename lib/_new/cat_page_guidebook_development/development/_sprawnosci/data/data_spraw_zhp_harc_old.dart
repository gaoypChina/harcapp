import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_group.dart';

SprawBook sprawBookZHPOld = SprawBookData(
    id: SprawBookData.ZHP_HARC_OLD_ID,
    org: Org.zhp,
    title: 'Sprawności harcerskie ZHP',
    source: 'Regulamin i programy sprawności przyjęte uchwałą Głównej Kwatery ZHP nr 24/2014 z dnia 11 czerwca 2014',
    color: SprawBookData.SPRAW_BOOK_ZHP_HARC_OLD_COLOR,
    icon: SprawBookData.SPRAW_BOOK_ZHP_HARC_OLD_ICON,
    male: true,
    female: true,
    groupData: [

      SprawGroupData(
          id: 'spraw_artyst',
          title: 'Artystyczne',
          familyData: [
            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'spiewak',
                      title: 'Śpiewak',
                      level: 1,
                      tasks: [
                        'Rozpoczął śpiew kilku piosenek na zbiórce zastępu.',
                        'Nauczył zastęp jednej piosenki.',
                        'Zaśpiewał z pamięci dziesięć piosenek (np. harcerskich lub żołnierskich).',
                        'Występował z zastępem, śpiewając kilka piosenek oraz brał udział w inscenizacji piosenki.',
                        'Prowadzi na bieżąco swój śpiewnik harcerski, ma w nim zapisanych co najmniej 20 piosenek.',
                      ]),
                  SprawData(
                      id: 'piesniarz',
                      title: 'Pieśniarz',
                      level: 2,
                      tasks: [
                        'Przedstawił prowadzony przez siebie śpiewnik lub swoją płytotekę.',
                        'Śpiewał na uroczystościach harcerskich, szkolnych lub kościelnych.',
                        'Nauczył zastęp lub drużynę kilku tradycyjnych i współczesnych piosenek harcerskich oraz turystycznych.',
                        'Wymienił swoich ulubionych piosenkarzy, śpiewaków i zespoły, uzasadniając wybór w sposób przekonujący.',
                      ]),
                  SprawData(
                      id: 'wodzirej',
                      title: 'Wodzirej',
                      level: 3,
                      tasks: [
                        'Przygotował program i przeprowadził pięć ognisk harcerskich dla szczepu lub kilku drużyn, w tym co najmniej dwa ogniska tematyczne.',
                        'Zorganizował bal harcerski, tematyczną zabawę taneczną lub dyskotekę, zapewniając w przerwach konkursy, zabawy i pląsy.',
                        'Przedstawił prowadzony przez siebie notatnik, w którym zapisuje pomysły pląsów, zabaw i okrzyków.',
                        'Przygotował młodszych do próby na sprawności "tancerza", "muzyka" lub "piosenkarza".',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'grajek',
                      title: 'Grajek',
                      level: 2,
                      tasks: [
                        'Nauczył się grać przynajmniej na jednym instrumencie, zagrał na nim melodię.',
                        'Brał udział w przygotowaniu uroczystości harcerskiej, organizując orkiestrę.',
                        'Nauczył zastęp lub drużynę piosenki na podstawie zapisu nutowego.',
                        'Zorganizował w drużynie naukę piosenek, akompaniując na instrumencie.',
                      ]),
                  SprawData(
                      id: 'muzyk',
                      title: 'Muzyk',
                      level: 3,
                      tasks: [
                        'Zagrał kilka melodii na wybranym instrumencie.',
                        'Scharakteryzował okresy w dziejach polskiej muzyki, wymieniając najsłynniejszych kompozytorów i ich utwory.',
                        'Zorganizował wyjście drużyny na koncert do filharmonii lub opery.',
                        'Akompaniował na ognisku, dobierając wcześniej związany z tematem zestaw piosenek.',
                      ]),
                  SprawData(
                      id: 'artysta',
                      title: 'Artysta',
                      level: 4,
                      tasks: [
                        'Doskonale orientuje się w życiu artystycznym i kulturalnym swojego regionu i Polski.',
                        'Animuje działalność artystyczną w swoim środowisku harcerskim.',
                        'Brał udział w warsztatach specjalistycznych, doskonalących umiejętności w wybranej przez siebie dziedzinie artystycznej.',
                        'Odniósł sukces na festiwalu, przeglądzie, konkursie, wystawie itp..',
                        'Wyznaczył sobie dodatkowe zadania mistrzowskie.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'plastyk',
                      title: 'Plastyk',
                      level: 1,
                      tasks: [
                        'Nauczył się wykonywać różnymi technikami rysunki, plakaty i obrazy, loga, napisy (co najmniej pięć rodzajów).',
                        'Wykonał ilustrację do kroniki i plakat reklamowy.',
                        'Rozpoznał wskazane dzieła rzeźby i malarstwa polskiego.',
                        'Wykonał ozdobę do harcówki lub totem obozowy.',
                      ]),
                  SprawData(
                      id: 'dekorator',
                      title: 'Dekorator',
                      level: 2,
                      tasks: [
                        'Nauczył się wykonywać różnymi technikami rysunki, plakaty i obrazy, loga, napisy (co najmniej dziesięć rodzajów technik plastycznych).',
                        'Rozpoznał różne style w malarstwie.',
                        'Przygotował dekorację wybranej sali według projektu.',
                        'Wymienił filmy, które mają najciekawszą jej lub jego zdaniem scenografię.',
                        'przedstawił zaprojektowane przez siebie urządzenie pokoju, harcówki, namiotu, świetlicy obozowej.',
                      ]),
                  SprawData(
                      id: 'scenograf',
                      title: 'Scenograf',
                      level: 3,
                      tasks: [
                        'Poznał zasady projektowania kostiumów i dekoracji.',
                        'Opracował scenografię do przedstawienia w sali i w plenerze, opracował rzuty do scenografii.',
                        'Zorganizował wykonanie oraz pokierował zespołami wykonującymi dekorację wystawy lub innej imprezy kulturalnej.',
                        'Wykonał detal scenograficzny, wykorzystując różne materiały.',
                        'Przygotował młodszych do zdobycia sprawności "plastyka" lub "dekoratora".',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'recytator',
                      title: 'Recytator',
                      level: 1,
                      tasks: [
                        'Uczestniczył w pracach koła żywego słowa lub konkursie recytatorskim.',
                        'Zaprezentował utwory swoich ulubionych autorów na zbiórce zastępu.',
                        'Umiejętnie zinterpretował nieznany sobie utwór poetycki lub prozatorski, dobierając barwę głosu, modulację, tempo i rytm.',
                        'Uczestniczył w przygotowaniu wieczoru poezji, prezentując na nim swoje ulubione utwory.',
                      ]),
                  SprawData(
                      id: 'aktor',
                      title: 'Aktor',
                      level: 2,
                      tasks: [
                        'Opowiedział na zbiórce o swoich ulubionych aktorach i ich największych rolach.',
                        'Przygotował kostium i rekwizyty, charakteryzując się do wybranej roli i zagrał ją w trakcie przedstawienia w szkole lub drużynie.',
                        'Uczęszcza na kółko teatralne lub wziął udział w przedstawieniu przygotowanym przez drużynę.',
                        'Zaprezentował się w różnych formach na scenie, np. monolog, dialog, pantomima.',
                      ]),
                  SprawData(
                      id: 'rezyser',
                      title: 'Reżyser',
                      level: 3,
                      tasks: [
                        'Skompletował literaturę, materiały repertuarowe i recenzje na temat widowisk scenicznych.',
                        'Opracował reżyserię wybranej przez siebie sztuki lub programu, planując wykorzystanie sceny, zagospodarowanie planu, ruch sceniczny, miejsce muzyki i tańca w przedstawieniu i oczekiwania wobec scenografa oraz ustalając próby.',
                        'Przygotował do wystawienia sztukę lalkową, program kabaretowy lub montaż literacki.',
                        'Zna nazwiska słynnych reżyserów polskich i światowych. Zaprezentował sylwetkę jednego z nich na zbiórce zastępu lub drużyny.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'lalkarz',
                      title: 'Lalkarz',
                      level: 2,
                      tasks: [
                        'Wykonał różne lalki, np. pacynki, marionetki, kukiełki.',
                        'Urządził scenę i dekoracje dla teatru lalek.',
                        'Zorganizował z zastępem przedstawienie kukiełkowe.',
                        'Zagrał rolę w teatrzyku kukiełkowym, poruszając lalką, lub w teatrzyku cieni.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'gawedziarz',
                      title: 'Gawędziarz',
                      level: 2,
                      tasks: [
                        'Poznał legendy, opowieści ludowe i  wykorzystał je w swoich gawędach.',
                        'Interesująco opowiedział jedną z przeczytanych w czasie próby książek.',
                        'Opowiadając na ogniskach i kominkach, każdą historię wzbogacił o morał, przysłowie.',
                        'Opowiedział "na zamówienie" trzy gawędy: jedną na wskazany temat, drugą na podstawie zaobserwowanego wydarzenia i trzecią dostosowaną do sytuacji, w której się aktualnie znalazł.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'tancerz',
                      title: 'Tancerz',
                      level: 1,
                      tasks: [
                        'Poprowadził kilka pląsów i zabaw z muzyką na zbiórce zastępu.',
                        'Zatańczył publicznie wybrany taniec narodowy, ludowy, towarzyski, dyskotekowy.',
                        'Nauczył tańczyć wybrany taniec koleżanki lub kolegów w zastępie lub drużynie.',
                        'Zaimprowizował ruchy taneczne do melodii.',
                      ]),
                  SprawData(
                      id: 'mistrz_tanca',
                      title: 'Mistrz tańca',
                      level: 2,
                      tasks: [
                        'Rozróżnił melodię i kroki dziesięciu tańców.',
                        'Uczestniczył w zajęciach klubu lub zespołu tanecznego.',
                        'Wziął udział w konkursie tanecznym, starając się uzyskać najlepszą ocenę.',
                        'Przeprowadził kurs tańca w drużynie lub klasie.',
                        'Zna nazwiska słynnych tancerek i tancerzy. Przedstawił sylwetkę jednego z nich na zbiórce zastępu.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '8',
                sprawData: [
                  SprawData(
                      id: 'fotoamator',
                      title: 'Fotoamator',
                      level: 1,
                      tasks: [
                        'Poznał budowę aparatu fotograficznego, rodzaje aparatów fotograficznych oraz zasady wykonywania zdjęć.',
                        'Wykonał zdjęcie tematyczne, odpowiednio ustawiając aparat.',
                        'Na biwaku lub obozie robił zdjęcia drużynie, a następnie wybierał najlepsze na wystawę.',
                        'Przygotował na konkurs lub wystawę w szkole lub w szczepie własny serwis zdjęciowy.',
                      ]),
                  SprawData(
                      id: 'fotograf',
                      title: 'Fotograf',
                      level: 2,
                      tasks: [
                        'przedstawił album zdjęć przez siebie wykonanych.',
                        'Fotografując, stosował prawidłowe ustawienie aparatu i oświetlenia.',
                        'Wykonał portret osoby lub zjawiska przyrody.',
                        'Zorganizował wystawę fotograficzną w drużynie (szkole, szczepie]), prezentując na niej również swoje prace.',
                      ]),
                  SprawData(
                      id: 'mistrz_obiektywu',
                      title: 'Mistrz obiektywu',
                      level: 3,
                      tasks: [
                        'Poznał zasady działania kamery, wykonując na niej film, dokumentujący wydarzenie w drużynie, szkole lub rodzinie.',
                        'Rozróżnił zaprezentowane gatunki filmowe, potrafi zareklamować film stosownie do oczekiwań odbiorcy.',
                        'Nakręcił film (telefonem komórkowym, kamerą cyfrową) według własnego scenariusza i przygotował go samodzielnie do prezentacji.',
                        'Zorganizował w drużynie lub szczepie wieczór filmowy, prezentujący filmy nakręcone w trakcie różnych przedsięwzięć harcerskich lub szkolnych. Zachęcił innych do dokumentowania wydarzeń za pomocą filmów.',
                      ])
                ]
            )
          ]),

      SprawGroupData(
          id: 'spraw_duch',
          title: 'Duchowe',
          familyData: [
            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'betlejemskie_swiatlo_pokoju',
                      title: 'Betlejemskie światło pokoju',
                      level: 1,
                      tasks: [
                        'Poznał Dobra Nowinę związaną z narodzinami Jezusa oraz przesłanie Betlejemskiego Światła Pokoju. Wie, jaką drogą dociera ono do Polski.',
                        'Poznał tradycje bożonarodzeniowe oraz uczestniczył w wigilii harcerskiej.',
                        'Pomógł w zorganizowaniu w swoim domu świąt Bożego Narodzenia.',
                        'Uczestniczył w uroczystości przekazania Betlejemskiego Światła Pokoju (np. w hufcu, w instytucjach miejskich, w szkole, na harcerskiej mszy).',
                      ]),
                  SprawData(
                      id: 'opiekun_betlejemskiego_swiatla_pokoju',
                      title: 'Opiekun betlejemskiego światła pokoju',
                      level: 2,
                      tasks: [
                        'Zapoznał drużynę z przesłaniem Betlejemskiego Światła Pokoju.',
                        'Samodzielnie lub z zastępem odwiedził samotną osobę mieszkającą w sąsiedztwie, przekazując jej Światło.',
                        'Przyniósł Betlejemskie Światło Pokoju do swego domu i zapoznał rodzinę z jego ideą. wysłał kartki z życzeniami bożonarodzeniowymi rodzinie lub przyjaciołom.',
                        'Zorganizował wspólnie z zastępem wigilię dla zaprzyjaźnionego środowiska harcerskiego, przekazując mu Światło.',
                      ]),
                  SprawData(
                      id: 'straznik_betlejemskiego_swiatla_pokoju',
                      title: 'Strażnik betlejemskiego światła pokoju',
                      level: 3,
                      tasks: [
                        'Wspólnie z drużyną co roku organizuje zbiórkę, na której zapoznaje zaprzyjaźnioną drużynę z przesłaniem i tradycjami Betlejemskiego Światła Pokoju.',
                        'Zorganizował udział drużyny w przekazaniu Betlejemskiego Światła Pokoju do kościołów, urzędów i innych instytucji oraz mieszkańcom.',
                        'Wspólnie z drużyną pomógł w zorganizowaniu wigilii dla osób samotnych podczas której przekazano im Betlejemskie Światło Pokoju.',
                        'W porozumieniu z rodziną lub drużyną zaprosił na kolację wigilijną do domu lub na zbiórkę wigilijną samotną osobę z sąsiedztwa, przekazując jej Betlejemskie Światło Pokoju.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'przewodnik_duchowy',
                      title: 'Przewodnik duchowy',
                      level: 3,
                      tasks: [
                        'Brał udział jako przedstawiciel drużyny lub hufca w służbach (medycznej, porządkowej itp.) w swojej parafi i lub diecezji. Zaangażował do tej służby chętnych harcerzy ze swojego środowiska.',
                        'Zadbał, by wszyscy przygotowali się do tych wydarzeń od strony duchowej (sakrament pokuty, czynny udział w nabożeństwach, przyjęcie komunii św.).',
                        'Przeczytał Dzieje Apostolskie. W gawędzie przedstawił drużynie losy jednego z apostołów, np. podróże misyjne św. Pawła.',
                        'Wspólnie z chętnymi osobami z drużyny nawiązał kontakt z duszpasterzami w swojej parafii, zaoferował pomoc i współpracę (np. organizowanie spotkań modlitewnych, wieczorów skupienia, służby liturgicznej, znalezienie kapelana dla hufca).',
                        'Zadbał o zorganizowanie rekolekcji dla harcerzy ze swego środowiska.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'mlody_pielgrzym',
                      title: 'Młody pielgrzym',
                      level: 2,
                      tasks: [
                        'Potrafi wyjaśnić, jaki jest cel pielgrzymowania.',
                        'Uczestniczył w dwóch pielgrzymkach harcerskich (pieszych lub autokarowych]), zrealizowanych od chwili otwarcia próby.',
                        'W czasie pielgrzymki brał czynny udział w rekolekcjach (zaangażowanie w życie grupy, przygotowanie duchowe, przyjęcie sakramentów).',
                        'Opisał swoje doświadczenia pielgrzymkowe i przedstawił na zbiórce zastępu.',
                      ]
                  ),
                  SprawData(
                      id: 'pielgrzym',
                      title: 'Pielgrzym',
                      level: 3,
                      tasks: [
                        'Zapoznał się z historią pielgrzymowania. przedstawił ją w formie gawędy na zbiórce drużyny.',
                        'Zorganizował wyjazd drużyny na pielgrzymkę harcerską (pieszą lub autokarową).',
                        'Zorganizował wyjazdowe rekolekcje dla harcerzy ze swojego środowiska.',
                        'Opracował mapę ciekawych miejsc w Polsce, do których pielgrzymują wierni. przedstawił ją w drużynie (w szczepie, w hufcu itp.) i opowiedział o swoich doświadczeniach pielgrzymowania.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'przyjaciel_liturgii',
                      title: 'Przyjaciel liturgii',
                      level: 2,
                      tasks: [
                        'Pobożnie i aktywnie uczestniczy w nabożeństwie lub mszy św, stanowiąc wzór dla innych.',
                        'Potrafi posługiwać się kalendarzem liturgicznym. Wie, kiedy obchodzi się podstawowe święta i jakie nabożeństwa są odprawiane w ciągu roku liturgicznego.',
                        'Pomagał w przygotowaniu nabożeństwa mszy św., tzn. komentarze do czytań, procesję z darami, dobrać odpowiednie pieśni, ułożyć modlitwę wiernych itp..',
                        'Nauczył chętnych harcerzy z drużyny odpowiedniego zachowania na nabożeństwie mszy.',
                        'Uczestniczył w budowaniu ołtarza polowego na obozie drużyny. Zadbał o urządzenie miejsca wokół niego, tak by atmosfera sprzyjała wyciszeniu i modlitwie.',
                      ]
                  ),
                  SprawData(
                      id: 'znawca_liturgii',
                      title: 'Znawca liturgii',
                      level: 3,
                      tasks: [
                        'Zna strukturę mszy św. (np. nabożeństwa protestanckiego, mszy prawosławnej]), poprawnie odmawia modlitwy i wykonuje gesty podczas uczestnictwa w takiej mszy.',
                        'Zna podstawowe paramenty liturgiczne i umie wyjaśnić ich znaczenie (np. lichtarz, krzyż procesyjny, trybularz, cyborium). Umie przygotować ołtarz do nabożeństwa mszy św. (odpowiednio do wybranej religii).',
                        'Zna ceremoniał sztandarowy stosowany podczas uroczystości religijnych (odpowiednio do wybranej religii). Potrafi wydawać odpowiednie komendy pocztom sztandarowym.',
                        'Nauczył chętnych harcerzy z drużyny odpowiedniego zachowania na mszy lub nabożeństwie, z uwzględnieniem również tych, którzy nie są bezpośrednio zaangażowani religijnie w liturgię.',
                        'Zadbał wspólnie z chętnymi osobami o urządzenie na obozie lub biwaku miejsca modlitwy (skupienia, wyciszenia]), w którym każdy może realizować swoje potrzeby duchowe (np. ołtarza polowego, kapliczki obozowej, namiotu skupienia, gdzie można udostępnić odpowiednie lektury ku pokrzepieniu ducha, polany, na której można pobyć sam na sam z sobą i z naturą).',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'mlody_religioznawca',
                      title: 'Młody religioznawca',
                      level: 2,
                      tasks: [
                        'Wie, jak nazywa się pięć głównych religii świata. Opowiedział o nich zainteresowanym osobom z drużyny (zastępu).',
                        'Wie, gdzie w okolicy znajdują się świątynie lub miejsca modlitwy różnych wyznań. Zorganizował wycieczkę zastępu do jednego z tych miejsc i przedstawił w interesujący sposób podstawowe informacje z nim związane.',
                        'Zapoznał się z życiorysem założyciela wybranej religii i przedstawił jego osobę na zbiórce drużyny.',
                        'Nawiązał kontakt z osobą z kręgów skautowych lub harcerskich, która wyznaje inną religię.',
                      ]
                  ),
                  SprawData(
                      id: 'religioznawca',
                      title: 'Religioznawca',
                      level: 3,
                      tasks: [
                        'Potrafi wymienić pięć głównych religii świata i ich założycieli. Umie wyjaśnić ich główne dogmaty wiary. Wskaże w Polsce miejsca głównych skupisk wyznawców różnych religii.',
                        'Zorganizował wyjście zastępu lub drużyny do świątyni wyznawców wybranej religii (meczet, synagoga itp.) i przedstawił kilka informacji z nią związanych.',
                        'Przeprowadził w zastępie lub w drużynie dyskusję na temat tolerancji religijnej (na czym ona polega, jakie są skutki nietolerancji w społeczeństwie itp.).',
                        'Zapoznał się z najważniejszymi dokumentami na temat dialogu międzyreligijnego (np. Deklaracja o stosunku Kościoła katolickiego do religii niechrześcijańskich, Deklaracja o wolności religijnej).',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'mlody_ekumenista',
                      title: 'Młody ekumenista',
                      level: 3,
                      tasks: [
                        'Umie wyjaśnić, czym jest ekumenizm.',
                        'Zapoznał zastęp z ideą Tygodnia Modlitw o Jedność Chrześcijan.',
                        'Poznał zwyczaje świąteczne wybranych wyznań chrześcijańskich, np. Boże Narodzenie u katolików i prawosławnych lub obchody świąt maryjnych w różnych rejonach Polski i zapoznał z nimi zainteresowane osoby z drużyny.',
                        'Zapoznał się z treścią jednego z dokumentów kościelnych autorstwa Jana Pawła II na temat ekumenizmu i w przystępny sposób przedstawi swoje przemyślenia na ten temat na zbiórce drużyny.',
                        'Nauczył się modlitwy "Ojcze nasz" w obcym języku.',
                      ]
                  ),
                  SprawData(
                      id: 'ekumenista',
                      title: 'Ekumenista',
                      level: 4,
                      tasks: [
                        'Umie wyjaśnić, czym jest ekumenizm. Zna istotne różnice między najważniejszymi wyznaniami chrześcijańskimi (katolicyzm, prawosławie, protestantyzm).',
                        'Zorganizował w zastępie lub w drużynie dyskusję z udziałem przedstawicieli różnych wyznań chrześcijańskich.',
                        'Wziął udział w spotkaniu ekumenicznym (np. w Taizè) lub w obchodach Tygodnia Modlitw o Jedność Chrześcijan. Nauczył się trzech kanonów śpiewanych przez braci z Taizè.',
                        'Zapoznał się z nauczaniem Jana Pawła II na temat dialogu ekumenicznego.',
                        'Umie przygotować modlitwę ekumeniczną dla zastępu (drużyny, obozu, na biwaku]), np. na zakończenie dnia.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'poszukujacy_wartosci',
                      title: 'Poszukujący wartości',
                      level: 2,
                      tasks: [
                        'Umie opowiedzieć, czym jest rozwój duchowy i religijny, potrafi wyjaśnić różnicę między pojęciami "duchowość" i "religijność".',
                        'Prowadzi dzienniczek, w którym dokumentuje swoje przemyślenia i doświadczenia duchowe.',
                        'Nauczył się wybierać wartościową lekturę, fi lmy, spektakle teatralne i opowiedział o swoich przeżyciach z tym związanych.',
                        'Wie, jak nazywa się pięć głównych religii świata. Potrafi wyjaśnić, dlaczego na świecie jest wiele tradycji religijnych i duchowych.',
                        'Zorganizował dla zastępu lub drużyny zbiórkę, w czasie której harcerze mogli porozmawiać o swoim światopoglądzie i nauczyć się tolerowania różnic w tym względzie.',
                      ]),
                  SprawData(
                      id: 'poszukujacy_autorytetu',
                      title: 'Poszukujący autorytetu',
                      level: 3,
                      tasks: [
                        'Zapoznał się z biografią osoby znanej z etycznego postępowania, której życiowe dokonania inspirują do podążania tą samą drogą, np. świętego, mędrca, autorytetu moralnego.',
                        'Zapoznał się z filozofią życia, poglądami tej osoby oraz z metodami pracy nad sobą, które stosowała ona w swoim życiu.',
                        'Opracował na tej podstawie plan osobistego rozwoju duchowego i zastosował ten program w swoim życiu.',
                        'Zorganizował kominek, na którym interesująco przedstawił biografię wybranej osoby harcerzom swojej drużyny.',
                        'Przeczytał lekturę z zakresu duchowości, np. A. Glassa Podstawy duchowości instruktora harcerskiego, Dzienniki św. Tereski od Dzieciątka Jezus, pisma R. Cantalamessa, opowiadania B. Ferrero.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '8',
                sprawData: [
                  SprawData(
                      id: 'szara_lilijka',
                      title: 'Szara lilijka',
                      level: 2,
                      tasks: [
                        'Na 24 godziny oderwał się od codziennych spraw, nie kontaktował się z nikim (polecana samotna wycieczka na cały dzień do lasu). W tym czasie przemyślał Prawo Harcerskie i swój dotychczasowy do niego stosunek, ocenił swoją wolę wypełniania Przyrzeczenia i Prawa Harcerskiego całym życiem (w każdej chwili, w każdym miejscu, każdym swoim czynem).',
                        'Zastanowił się też nad swoimi wadami i pomyślał nad tym, jak skuteczniej z nimi walczyć. Zdobywający przyznają sobie sprawność sami, jeżeli szczerze potwierdzą w swoim sumieniu, że chcą żyć zgodnie z zasadami harcerskimi zawartymi w Przyrzeczeniu i Prawie Harcerskim.',
                        'Obrzędowe przyznanie sprawności można połączyć z odnowieniem Przyrzeczenia.',
                        'Sprawność tę trzeba zdobywać co roku od nowa. Po upływie terminu jej "ważności" wymagana jest powtórna próba lub przystąpienie do zdobywania sprawności "mężnego" lub "chwata".',
                      ]),
                  SprawData(
                      id: 'mezny',
                      title: 'Mężny',
                      level: 3,
                      tasks: [
                        'Przez siedem dni od chwili przystąpienia do próby (po otrzymaniu od opiekuna lub drużynowego listu otwierającego próbę) w tajemnicy przed osoba zdobywająca tę sprawność prowadzi walkę z wadą, słabością, kompleksem, który w szczególny sposób komplikuje jej współżycie z innymi ludźmi (np. kłótliwość, zarozumiałość, nietolerancja, nieśmiałość, spóźnianie się, nierzetelność).',
                        'Sprawność przyznaje drużyna po wysłuchaniu relacji z przebiegu próby, jej ocenie i wniosku harcerza o przyznanie sprawności.',
                      ]),
                  SprawData(
                    id: 'chwat',
                    title: 'Chwat',
                    level: 3,
                    tasks: [
                      'Słowo "chwat" tworzą pierwsze litery następujących nazw cech charakteru:'
                          '\n• C − cnota (postępowanie zgodne z zasadami moralnymi]),'
                          '\n• H − hart (wytrwałość wobec przeciwności losu]),'
                          '\n• W − wola (siła woli, umiejętność konsekwentnego dążenia do celu]),'
                          '\n• A − altruizm (poświęcanie swoich talentów na rzecz innych]),'
                          '\n• T − tężyzna (ćwiczenie sprawnego i wytrzymałego ciała i ducha).',
                    ],
                    comment: 'Aby zdobyć tę sprawność, harcerz musi się zastanowić, brak których z wymienionych cech jest jej lub jego wadą. Następnie opracowuje zadania (dla każdej litery po jednym]), które mogą pomóc w walce z tymi słabościami. Powinny to być zadania realizowane specjalnie na potrzeby tej sprawności, niepowtarzające się np. przy zdobywaniu stopnia. Kiedy już harcerz wymyśli zadania, wybiera opiekuna próby (przyjaciela, kogoś zaufanego]), którego zapoznaje z wybranymi zadaniami. Bardzo ważne jest, by opiekunem została osoba, która będzie umiała wspierać i motywować podopiecznego w walce ze słabością.'
                        '\n\nCzas realizacji próby nie powinien być dłuższy niż pół roku. Kiedy osoba zdobywająca sprawność osiągnie cel swoich zmagań, występuje do rady drużyny o jej przyznanie. Wykonanie zadań potwierdza opiekun.',
                  )
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_fin_eko',
          title: 'Finansowo-ekonomiczne',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'oszczedny',
                      title: 'Oszczędny',
                      level: 1,
                      tasks: [
                        'Wie, jakie są podstawowe miesięczne opłaty domowe.',
                        'Zaoszczędził pieniądze na wybrany przez siebie cel.',
                        'Współuczestniczył w organizowaniu akcji zarobkowej.',
                        'Wymienił surowce wtórne, które zbierał i segregował.',
                        'Oszczędnie gospodaruje wszelkimi materiałami.',
                      ]),
                  SprawData(
                      id: 'skarbnik',
                      title: 'Skarbnik',
                      level: 2,
                      tasks: [
                        'Poznał przepisy finansowe ZHP obowiązujące drużynę.',
                        'Opracował preliminarz finansowy imprezy drużyny.',
                        'Zorganizował akcję zarobkową zastępu.',
                        'Przyjął składki członkowskie zastępu i prawidłowo je wpisał do książki finansowej drużyny.',
                        'Nauczył się prawidłowo wypełniać książkę finansową drużyny.',
                      ]),
                  SprawData(
                      id: 'finansista',
                      title: 'Finansista',
                      level: 3,
                      tasks: [
                        'Opracował plan finansowy drużyny na rok harcerski i przedstawił swoją koncepcję radzie drużyny.',
                        'Przygotował i zrealizował projekt mający na celu zachęcenie do oszczędzania.',
                        'Zarządzał finansami biwaku drużyny: przygotował preliminarz, prawidłowo rozliczył wydatki.',
                        'przedstawił koleżankom i kolegom sposoby oszczędzania i gospodarowania własnymi środkami finansowymi.',
                        'Funkcje sprawności mistrzowskich pełnią uprawnienia samodzielnego księgowego oraz uprawnienia do prowadzenia ksiąg przychodów i rozchodów.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'bankier',
                      title: 'Bankier',
                      level: 1,
                      tasks: [
                        'Wie, z jakiego banku korzystają rodzice, gdzie się znajduje i jakie usługi oferuje.',
                        'Opłacił w banku lub na poczcie rachunki domowe.',
                        'Poznał dostępne dla siebie sposoby oszczędzania pieniędzy i przedstawił je na zbiórce zastępu.',
                        'Zaoszczędził wyznaczoną kwotę pieniędzy, przeznaczając ją na wybrany przez siebie cel.',
                      ]),
                  SprawData(
                      id: 'bankowiec',
                      title: 'Bankowiec',
                      level: 2,
                      tasks: [
                        'Zebrał informacje o ofertach różnych banków. Wie, jakie usługi oferują i na jakich warunkach, oraz które z nich mają oferty skierowane do młodzieży.',
                        'Wie, co to jest: kredyt, pożyczka, lokata, przelew, konto bankowe.',
                        'Potrafi wypłacić pieniądze z bankomatu. Potrafi , korzystając z Internetu, dokonać przelewu bankowego.',
                        'Potrafi wypełnić druk przekazu i przelewu pocztowego, wie, jaka jest różnica między nimi.',
                        'Przez okres dwóch miesięcy zbierał systematycznie składki w zastępie lub drużynie i właściwie rozliczył je ze skarbnikiem drużyny.',
                      ]),
                  SprawData(
                      id: 'znawca_bankowosci',
                      title: 'Znawca bankowości',
                      level: 3,
                      tasks: [
                        'Zna historię pieniądza i zaprezentował ją w ciekawej formie drużynie.',
                        'Wie, co to jest: ROR, prowizja, stopa procentowa, kapitalizacja odsetek.',
                        'Na podstawie zebranych informacji na temat ofert banków (w tym internetowych) wybrał propozycję najdogodniejszą dla siebie oraz zaprezentował swój wybór drużynie i uzasadnił go.',
                        'Założył konto w banku i dokonał na nim podstawowych operacji. Systematycznie planuje i rozlicza swoje wydatki.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'mlody_pracownik',
                      title: 'Młody pracownik',
                      level: 3,
                      tasks: [
                        'Zna różne techniki określania predyspozycji zawodowych. Dokonał samooceny i określił swoje predyspozycje zawodowe.',
                        'Zapoznał się z ofertami rynku pracy w wybranej przez siebie dziedzinie. Wie, jakie są oczekiwania potencjalnego pracodawcy.',
                        'przedstawił drużynie techniki autoprezentacji przydatne w rozmowach z pracodawcą.',
                        'Zorganizował szkolenie dla członków zastępu z zakresu pisania CV i listów motywacyjnych.',
                        'Zorganizował w drużynie "harcerskie pośrednictwo pracy".',
                      ]),
                  SprawData(
                      id: 'przewodnik_po_rynku_pracy',
                      title: 'Przewodnik po rynku pracy',
                      level: 4,
                      tasks: [
                        'Systematycznie prowadzi szkolenia dla swojego środowiska harcerskiego lub klasy na temat przygotowania do podjęcia pierwszej pracy.',
                        'Współpracuje z lokalnym Urzędem Pracy w celu aktualizowania bazy ofert pracy i systematycznego przedstawiania jej w hufcu (np. gazetka, tablica ogłoszeń).',
                        'Opracował młodzieżowy poradnik, dotyczący przygotowania do podjęcia pierwszej pracy.',
                        'Zapoznał się z możliwościami podejmowania przez młodzież pracy za granicą, wie, jakie firmy tym się zajmują. przedstawił propozycje w hufcu.',
                      ]),
                ]),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'mlody_makler',
                      title: 'Młody makler',
                      level: 3,
                      tasks: [
                        'Wie, co oznaczają następujące pojęcia: akcja, dywidenda, obligacja. Zna rodzaje obligacji i wie, które są notowane na giełdzie.',
                        'Wie, co to jest system WARSET.',
                        'Zna podstawowe indeksy na giełdzie warszawskiej, ich specyfikę i potrafi podać nazwy pięciu kolejnych spółek z największym udziałem w dwóch podstawowych indeksach (WIG20, TECHWIG).',
                        'Potrafi krótko przedstawić rodzaje portfeli inwestycyjnych zarządzania aktywami, ich budowę oraz stopy zwrotu od początku roku podane przez trzy najlepsze w tej dziedzinie domy maklerskie.',
                        'Przez miesiąc śledził notowania na giełdzie wybranej spółki, ocenił szanse opłacalności inwestycji w jej akcje i przedstawił je na zbiórce drużyny.',
                        'Przeprowadził w drużynie grę "Giełda".',
                      ]),
                  SprawData(
                      id: 'makler',
                      title: 'Makler',
                      level: 4,
                      tasks: [
                        'Wie, co oznaczają pojęcia: futures, warrant, opcja.',
                        'Systematycznie czyta informacje prasowe oraz korzysta z informacji w Internecie na tematy giełdowe.',
                        'Poznał techniki gry na giełdzie, wybrał najlepszą dla siebie.',
                        'Zna wszystkie typy zleceń oraz ich dodatkowe warunki, potrafi dokładnie wyjaśnić specyfikę zleceń z limitem aktywacji.',
                        'Zna wszystkie instrumenty finansowe notowane na giełdzie warszawskiej.',
                        'Potrafi podać nazwy głównych indeksów giełd światowych.',
                        'Otworzyła własne konto w domu maklerskim, złożył zlecenie. Doświadczenia przedstawił na zbiórce drużyny.',
                      ])
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_gluch',
          title: 'Dla harcerek i harcerzy głuchych',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'mowie_i_migam',
                      title: 'Mówię i migam',
                      level: 0,
                      tasks: [
                        'Opanował język migowy polski w stopniu wystarczającym do porozumiewania się w życiu codziennym.',
                        'Stale pogłębia znajomość zunifikowanego języka migowego.',
                        'Potrafi swobodnie porozumieć się językiem polskim w sprawach życia codziennego. Rozumie, co do niego mówią i jest rozumiany przez słyszących.',
                        'Wywiązał się z roli tłumacza "na żywo" podczas spotkania grupy osób głuchych i grupy osób słyszących.',
                        'Pomógł osobie głuchej, słabo mówiącej, załatwić sprawy np. w urzędzie lub dziecku głuchemu porozumieć się z osobą dorosłą nieznającą "migów".',
                      ]),
                  SprawData(
                      id: 'tlumacz_na_migi',
                      title: 'Tłumacz na migi',
                      level: 0,
                      tasks: [
                        'Opanował język migowy polski i wybrany język migowy obcy w stopniu wystarczającym do porozumiewania się w życiu codziennym.',
                        'Był tłumaczem "na migi" w czasie spotkania grupy głuchych polskich z wycieczką głuchych obcokrajowców.',
                        'Opowiedział "na migi" wycieczce głuchych obcokrajowców o pracy drużyny, do której należy.',
                        'Stale pogłębia znajomość zunifikowanego języka migowego.',
                      ])
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_hobby',
          title: 'Hobbystyczne',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'przyjaciel_ksiazki',
                      title: 'Przyjaciel książki',
                      level: 1,
                      tasks: [
                        'Systematycznie czyta książki. Zgromadził własną biblioteczkę ulubionych pozycji.',
                        'Samodzielnie wykonał kilka zakładek do swoich książek.',
                        'Brał udział w konkursie czytelniczym organizowanym np. w szkole, drużynie, przez redakcję czasopisma lub portalu internetowego.',
                        'Wykonał drobne naprawy introligatorskie kilku książek, pełnił dyżur w bibliotece szkolnej lub publicznej.',
                      ]),
                  SprawData(
                      id: 'bibliotekarz',
                      title: 'Bibliotekarz',
                      level: 2,
                      tasks: [
                        'Prowadził w czasie próby na sprawność bibliotekę drużyny (szczepu) lub obozu.',
                        'W czasie dyżurów w bibliotece szkolnej lub publicznej sprawnie posługiwał się katalogiem książek. Przygotował dla osoby prowadzącej zajęcia materiały na określony temat.',
                        'Zorganizował wieczór literacki w drużynie, szkole, domu kultury.',
                        'Zorganizował w szczepie lub szkole kiermasz książek.',
                      ]),
                  SprawData(
                      id: 'bibliofil',
                      title: 'Bibliofil',
                      level: 3,
                      tasks: [
                        'Zgromadził własny księgozbiór i prowadzi jego katalog.',
                        'Wykonał ekslibris do biblioteki domowej, szkolnej lub publicznej.',
                        'Urządził w drużynie wystawę ciekawych książek, prezentując na niej także własne zbiory.',
                        'Urządził w szkole lub szczepie wieczór wspólnego czytania wybranej książki, spotkanie z autorem lub podobną imprezę.',
                        'Nawiązał kontakt z antykwariatem, poznał sposoby gromadzenia wydawnictw antykwarycznych i przechowywania oraz zabezpieczania starodruków.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'kronikarz',
                      title: 'Kronikarz',
                      level: 1,
                      tasks: [
                        'Prowadził w okresie próby kronikę zastępu (drużyny), posługując się kilkoma rodzajami pisma.',
                        'Sporządził notatki z wydarzeń na podstawie relacji świadków.',
                        'Dopilnował przez co najmniej jeden rok, aby kronika była zawsze tam, gdzie drużyna.',
                        'Zapoznał się z twórczością najbardziej znanych polskich kronikarzy.',
                      ]),
                  SprawData(
                      id: 'reporter',
                      title: 'Reporter',
                      level: 2,
                      tasks: [
                        'Przygotował rzeczowe relacje z biwaku lub obozu drużyny, z uroczystości szkolnej, z wydarzeń mających miejsce w okolicy.',
                        'Posługiwał się sprzętem reporterskim (dyktafon, aparat fotograficzny, kamera), przygotowując materiały dla szkolnego (lokalnego) radia, telewizji, gazety.',
                        'Napisał dwa reportaże: na wybrany i na zadany temat. Dobrał ilustrujące je rysunki lub zdjęcia. Przedstawił je w drużynie.',
                      ]),
                  SprawData(
                      id: 'dziennikarz',
                      title: 'Dziennikarz',
                      level: 3,
                      tasks: [
                        'Poznał cechy, jakimi powinni charakteryzować się dziennikarze oraz zasady, jakie obowiązują w ich zawodzie.',
                        'Przeprowadził wywiad na określony temat.',
                        'Przez okres próby brał udział w pracy redakcji harcerskiej, pisząc do wybranego działu.',
                        'Nawiązał stały kontakt z gazetą młodzieżową lub dla dzieci i systematycznie dostarcza jej swoje artykuły.',
                        'Przekazał napisany przez siebie reportaż z imprezy harcerskiej do lokalnej gazety.',
                      ]),
                  SprawData(
                      id: 'wydawca',
                      title: 'Wydawca',
                      level: 4,
                      tasks: [
                        'Poznał pracę redakcji gazety lub wydawnictwa książkowego.',
                        'Rozróżnił rodzaje czcionek drukarskich i typy edytorów komputerowych, stosując je w swojej gazecie lub publikacjach książkowych.',
                        'Złożył na komputerze gazetę lub inną publikację.',
                        'Rozprowadzał wydawnictwa przygotowane przez drużynę, hufiec, szkołę, dom kultury itp..',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'milosnik_architektury',
                      title: 'Miłośnik architektury',
                      level: 2,
                      tasks: [
                        'Rozpoznaje sześć podstawowych nowożytnych stylów w architekturze. Odwiedził znajdujące się w okolicy budowle charakterystyczne dla tych stylów. Wyniki zwiadu zaprezentował na zbiórce zastępu.',
                        'Zorganizował wyprawę do ciekawego obiektu, opowiedział o cechach charakterystycznych tej budowli, jej stylu i historii.',
                        'Zorganizował zbiórkę poświęconą znanym polskim architektom.',
                        'Zaprojektował rozmieszczenie mebli i wystrój swego pokoju.',
                      ]),
                  SprawData(
                      id: 'architekt',
                      title: 'Architekt',
                      level: 3,
                      tasks: [
                        'Umie opowiedzieć o prekursorach poszczególnych stylów w architekturze.',
                        'Wykonał rejestr lub przewodnik po ciekawych budynkach nowoczesnych i zabytkowych w swojej miejscowości lub gminie.',
                        'Zorganizował wyprawę (zastępu lub drużyny) do innej miejscowości w celu zwiedzenia ciekawych budowli. Przygotował wystawę fotograficzną lub inną formę prezentacji ciekawych rozwiązań architektonicznych, które mogłyby być zastosowane na tym terenie.',
                        'Pomógł innym harcerzom w zaprojektowaniu urządzenia ich pokoi.',
                        'Zaprojektował wygląd i rozmieszczenie namiotów oraz urządzeń na obozie drużyny. Swój projekt przedstawił radzie drużyny.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'igielka',
                      title: 'Igiełka',
                      level: 1,
                      tasks: [
                        'Wykonał drobne prace: przyszył guziki do koszuli, obrębił chusteczkę, naszył łatę na spodnie, zacerował dziurę w swetrze.',
                        'Uszył ręcznie lub na maszynie drobny przedmiot, np. łapki do garnków, kieszeń na grzebienie w łazience, fartuszek kuchenny, worek na kapcie.',
                        'Wyszył swój monogram lub znaczek sprawności na rękawie munduru.',
                      ]),
                  SprawData(
                      id: 'krawiec',
                      title: 'Krawiec',
                      level: 2,
                      tasks: [
                        'Rozróżnił podstawowe rodzaje tkanin: bawełna, wełna, jedwab, sztuczne tworzywa.',
                        'Nauczył się szyć na maszynie. Uszył według gotowego wykroju spódnicę lub szorty, obrębił obrus, wszył suwak, uszył poszewkę na poduszkę.',
                        'Nauczył się konserwować maszynę do szycia.',
                        'Uszył chusty dla drużyny lub zastępu.',
                      ]),
                  SprawData(
                      id: 'mistrz_igly',
                      title: 'Mistrz igły',
                      level: 3,
                      tasks: [
                        'Zaprezentował własny styl ubierania się, szyjąc samodzielnie lub adaptując gotowe ubrania do własnych potrzeb.',
                        'Uszył samodzielnie bluzkę, mundur, szorty lub spodnie, pobierając uprzednio miarę i przygotowując wykrój.',
                        'Zorganizował pokaz mody na zbiórce, wykorzystując ubrania członków zastępu i posługując się aktualnymi żurnalami.',
                        'Przeprowadził w drużynie naukę podstaw szycia.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'mistrz_robotek_recznych',
                      title: 'Mistrz robótek ręcznych',
                      level: 2,
                      tasks: [
                        'Wykonał różne prace: na drutach lub na maszynie dziewiarskiej lub splótł makramę według własnego wzoru.',
                        'przedstawił na zbiórce zastępu lub drużyny własnoręcznie wykonane prace.',
                        'Zorganizował w drużynie (szczepie lub w szkole) wystawę robótek ręcznych, zapraszając na nią znanych w okolicy mistrzów i mistrzynie.',
                        'Nauczył młodszych wykonania prostych makram.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'prezentant_mody',
                      title: 'Prezentant mody',
                      level: 2,
                      tasks: [
                        'Wymienił kilku polskich i zagranicznych projektantów mody.',
                        'Czyta systematycznie w czasopismach i w Internecie artykuły prezentujące aktualne trendy w modzie.',
                        'przedstawił swoje zbiory projektów ubrań i wykrojów.',
                        'Przedstawił zaprojektowany samodzielnie strój na zbiórce zastępu lub drużyny.',
                        'Zaprezentował cztery stylizacje, np.: do szkoły (pracy]), na dyskotekę, na wycieczkę, na ważne spotkanie. Wyjaśnił w zastępie lub drużynie zasady doboru stroju odpowiedniego do okazji, typu urody, sylwetki.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'kolekcjoner',
                      title: 'Kolekcjoner',
                      level: 3,
                      tasks: [
                        'Posiada własne zbiory.',
                        'Opracował system katalogowania własnych zbiorów i posługuje się nim, uzupełniając swoją kolekcję.',
                        'Skompletował specjalistyczną biblioteczkę i utrzymuje kontakty z innymi kolekcjonerami o podobnym hobby.',
                        'Zorganizował wystawę swoich eksponatów.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '8',
                sprawData: [
                  SprawData(
                      id: 'rowerzysta',
                      title: 'Rowerzysta',
                      level: 1,
                      tasks: [
                        'Potrafi jeździć na rowerze.',
                        'Zdobył kartę rowerową.',
                        'Konserwował rower przed wycieczką i po niej.',
                        'Uczestniczył w trzech całodniowych wycieczkach rowerowych.',
                      ]),
                  SprawData(
                      id: 'cyklista',
                      title: 'Cyklista',
                      level: 2,
                      tasks: [
                        'Zna zasady bezpiecznego poruszania się pieszych i rowerzystów po drogach.',
                        'Zna budowę i potrafi konserwować rower. Potrafi zmienić dętkę.',
                        'Brał udział w kilku wycieczkach rowerowych.',
                        'Wie, jaka jest różnica pomiędzy wymijaniem, omijaniem i wyprzedzaniem oraz zna zasady pierwszeństwa przejazdu (m.in. na skrzyżowaniach). Poznał dziesięć znaków poziomych (na jezdni) i pokazał je zastępowi podczas wycieczki po mieście.',
                        'Wykonał planszę ze znakami drogowymi, obejmującą: 10 znaków ostrzegawczych, 10 znaków zakazu, 12 znaków nakazu oraz 10 znaków informacyjnych. Wytłumaczył ich znaczenie na zbiórce zastępu.',
                      ]),
                  SprawData(
                      id: 'znawca_ruchu_drogowego',
                      title: 'Znawca ruchu drogowego',
                      level: 3,
                      tasks: [
                        'W okresie próby systematycznie pełnił służbę ruchu w miejscach i przy okazjach tego wymagających.',
                        'Uczestniczył w spotkaniu z policjantem na temat bezpieczeństwa na drogach i obowiązujących przepisów.',
                        'Zorganizował wraz z zastępem zawody na rowerowym torze przeszkód lub w miasteczku ruchu drogowego, popularyzując w ten sposób obowiązujące przepisy w drużynie, szczepie lub szkole.',
                        'Zorganizował dla młodszych kolegów pokaz prawidłowego poruszania się po drogach, połączony z konkursem.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '9',
                sprawData: [
                  SprawData(
                      id: 'straznik_bezpieczenstwa',
                      title: 'Strażnik bezpieczeństwa',
                      level: 2,
                      tasks: [
                        'Zapoznał się, wspólnie z osobą dorosłą, ze stanem technicznym maszyn używanych w gospodarstwie.',
                        'Spisał, jakich napraw należy dokonać, aby wszystkie urządzenia były bezpieczne. Wnioski przedstawił osobie dorosłej.',
                        'Zapoznał się ze znakami oznaczającymi niebezpieczne narzędzia, miejsca oraz czynności.',
                        'Przygotował i przedstawił na zbiórce drużyny zasady bezpiecznego posługiwania się sprzętem w gospodarstwie.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '10',
                sprawData: [
                  SprawData(
                      id: 'mlody_strateg',
                      title: 'Młody strateg',
                      level: 1,
                      tasks: [
                        'Zagrał co najmniej w trzy różne gry planszowe lub karciane, w tym przynajmniej jedną o tematyce harcerskiej lub historycznej, dobrze zna zasady tych gier.',
                        'Wziął udział w turnieju gier planszowych lub karcianych.',
                        'Wie, na czym polega system szwajcarski.',
                        'Zaprezentował i zagrał z zastępem lub drużyną w wybraną przez siebie grę planszową lub karcianą.',
                      ]),
                  SprawData(
                      id: 'strateg',
                      title: 'Strateg',
                      level: 2,
                      tasks: [
                        'Zagrał w pięć różnych gier planszowych lub karcianych, w tym w co najmniej dwie gry o tematyce historycznej lub harcerskiej. Potrafi wytłumaczyć ich zasady.',
                        'Na zbiórce drużyny zaprezentował historię, twórców oraz rodzaje gier planszowych i karcianych.',
                        'Zorganizował w swoim środowisku (drużyna, szkoła, kółko zainteresowań) akcję promującą gry planszowe i karciane.',
                        'Wziął udział w konkursie organizowanym przez wydawnictwo gier planszowych lub karcianych.',
                      ]),
                  SprawData(
                      id: 'trzy_kosci',
                      title: 'Trzy kości',
                      level: 3,
                      tasks: [
                        'Zorganizował warsztaty dla co najmniej ośmiu osób na temat gier planszowych i karcianych, przeprowadził podczas nich turniej w wybraną grę.',
                        'Opracował grę planszową lub karcianą z dziedziny swoich zainteresowań lub zaadaptował już istniejącą grę. Upowszechnił grę w swoim środowisku (szczepie, hufcu, szkole).',
                        'Wziął udział w konwencie lub festiwalu, którego tematów były gry planszowe lub karciane.',
                        'Zorganizował wraz z zastępem lub drużyną akcję zarobkową, z której dochód przeznaczył na zakup gry planszowej lub karcianej dla drużyny lub zastępu.',
                      ]),
                  SprawData(
                      id: 'mistrz_gry',
                      title: 'Mistrz gry',
                      level: 4,
                      tasks: [
                        'Zorganizował turniej gier planszowych lub karcianych na poziomie hufca, szkoły, domu kultury.',
                        'Samodzielnie lub wraz z zespołem stworzył grę planszową lub karcianą o tematyce harcerskiej i upowszechnił ją w środowisku harcerskim.',
                        'Zdobył fundusze na zakup pięciu gier lub pozyskał pięć gier dla swojego środowiska. Regularnie powiększa zbiór gier drużyny (szczepu, hufca).',
                        'Stworzył grupę lub uczestniczy w grupie miłośników gier planszowych, z którą regularnie prowadził otwarte spotkania i warsztaty gier.',
                      ])
                ]
            )
          ]
      ),

      SprawGroupData(
          id: 'spraw_jezdz_kawal',
          title: 'Jezdzieckie i kawaleryjskie',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'sanitariusz_weterynaryjny',
                      title: 'Sanitariusz weterynaryjny',
                      level: 2,
                      tasks: [
                        'Poznał ogólną budowę kostnoszkieletową konia i położenie najważniejszych narządów wewnętrznych.',
                        'Potrafi zmierzyć temperaturę, tętno i liczbę oddechów konia, zna ich prawidłowe wartości.',
                        'Udzielił pierwszej pomocy w przypadku zranienia konia, ochwatu, morzyska (kolki).',
                        'Zna skład apteczki weterynaryjnej. Wie, jak się stosuje podstawowe leki i maście.',
                      ]
                  ),
                  SprawData(
                    id: 'weterynarz',
                    title: 'Weterynarz',
                    level: 3,
                    tasks: [
                      'Zna dokładną budowę konia (szkielet, położenie narządów).',
                      'Udzielił pierwszej pomocy przy zranieniu, ochwacie, kolce, zmierzyć temperaturę, tętno i liczbę oddechów.',
                      'Przygotował pacjenta i środki potrzebne do zabiegu przed przybyciem lekarza.',
                      'Pełnił służbę weterynaryjną na obozie.'
                    ],
                    comment: 'Funkcję sprawności mistrzowskiej pełni odznaka lub uprawnienie: projektowana odznaka ratownika weterynaryjnego Polskiego Związku Jeździeckiego.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'szermierz',
                      title: 'Szermierz',
                      level: 1,
                      tasks: [
                        'Dobrze jeździ konno.',
                        'Poznał rodzaje białej broni i techniki władania nią, zademonstrował podstawowe pchnięcia (pieszo).',
                        'Poznał zasady bezpieczeństwa i przepisy sportowe dotyczące władania białą bronią.',
                        'Swoje umiejętności zaprezentował zastępowi lub drużynie.',
                        'W ciekawej formie przedstawił klasie, drużynie lub zastępowi historię wybranego pułku kawalerii II RP.',
                      ]),
                  SprawData(
                      id: 'lansjer',
                      title: 'Lansjer',
                      level: 2,
                      tasks: [
                        'Bardzo dobrze jeździ konno.',
                        'Poznał budowę i zastosowanie lancy. Zna kilka wzorów szabel.',
                        'Przygotował pokaz władania lancą dla swojego środowiska (drużyny, szczepu]), prezentując prawidłowe pchnięcia i zasłony, pomagał w szkoleniu jeździeckim i nauczył władania lancą swój zastęp.',
                        'Rozróżnił proporczyki pułków kawalerii 20-lecia.',
                        'przedstawił w ciekawy sposób na szerszym forum (np. w formie strony www, spotkania w domu kultury) historię wybranego pułku kawalerii, uzasadniając swój wybór i korzystając ze źródeł.',
                      ]),
                  SprawData(
                      id: 'szwolezer',
                      title: 'Szwoleżer',
                      level: 3,
                      tasks: [
                        'Opanował podstawowe ćwiczenia woltyżerskie.',
                        'Poznał budowę szabli i zasady walki z konia: cięcie łóz w cwale, cięcie glinianej gomóły, cięcie z góry w prawo, w prawo od ucha, z dołu i z góry w lewo. Opanował pchnięcia i zasłony.',
                        'Złożył egzamin składający się z pokazu władania szablą konno i woltyżerki.',
                        'Przygotował młodszych kolegów do zdobycia sprawności "szermierza" lub "lansjera". Nauczył ich musztry z szablą pieszo.',
                        'Potrafi prawidłowo stroczyć i założyć na konia rząd wojskowy (szeregowego) wz. 36.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'pomocnik_podkuwacza',
                      title: 'Pomocnik podkuwacza',
                      level: 1,
                      tasks: [
                        'Poznał zasady postępowania w przypadku gnicia strzałki i obluzowania podków.',
                        'Poznał rodzaje podków i ich przeznaczenie oraz zasady prawidłowego podkuwania koni.',
                        'Pomagał podczas rozczyszczania kopyta konia, wykonując polecenia podkuwacza (kowala). Umie prawidłowo trzymać nogi konia.',
                      ]),
                  SprawData(
                      id: 'podkuwacz',
                      title: 'Podkuwacz',
                      level: 2,
                      tasks: [
                        'Poznał budowę anatomiczną końskiego kopyta i występujące w nim nieprawidłowości oraz zasadę narastania rogu kopytnego.',
                        'Uczestniczył w podkuwaniu koni, zdejmując stare podkowy, prawidłowo rozczyszczając kopyto.',
                        'Nauczył młodszych kolegów zasady trzymania nóg do podkuwania i pielęgnacji kopyt.',
                      ]),
                  SprawData(
                      id: 'kowal',
                      title: 'Kowal',
                      level: 3,
                      tasks: [
                        'Zna budowę anatomiczną końskiego kopyta.',
                        'Poznał narzędzia kowalskie i nauczył się nimi posługiwać.',
                        'Nauczył młodszych harcerzy zasad obchodzenia się z końskimi kopytami podczas podkuwania (rozczyszczanie, zdejmowanie starych podków).',
                        'Podkuł samodzielnie dwie nogi konia (pod okiem fachowca!]), prawidłowo dobierając rozmiar podkowy.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'stajenny',
                      title: 'Stajenny',
                      level: 1,
                      tasks: [
                        'Poznał podstawowe zasady bezpieczeństwa pracy przy koniach.',
                        'Rozróżnił stanowisko i boks, omawiając ich wady i zalety, potrafi je prawidłowo pościelić.',
                        'Poznał zasady żywienia koni.',
                        'Pielęgnował konia, czyszcząc i siodłając go, zadając paszę i pojąc według przyjętej kolejności, ścieląc stanowisko, sprzątając stajnię.',
                      ]),
                  SprawData(
                      id: 'masztalerz',
                      title: 'Masztalerz',
                      level: 2,
                      tasks: [
                        'Poznał pasze stosowane w żywieniu koni i potrafi prawidłowo zaplanować dzienną dawkę pokarmową w zależności od pracy wykonanej przez konia.',
                        'Poznał zagadnienia z zakresu hodowli koni: najważniejsze rasy hodowlane w Polsce i na świecie, okres trwania ciąży u konia, termin przeprowadzania stanówki i odsadzania źrebiąt.',
                        'Zna podstawowe narowy i nałogi u koni i potrafi im zapobiegać.',
                        'Współopiekował się koniem przez wyznaczony czas (czyszczenie, siodłanie, karmienie, pojenie, ścielenie boksu lub stanowiska]), zachowując zasady bezpieczeństwa.',
                      ]),
                  SprawData(
                      id: 'koniuszy',
                      title: 'Koniuszy',
                      level: 3,
                      tasks: [
                        'Kierował pracą wachty stajennej na obozie lub w klubie.',
                        'Kierował żywieniem koni, stosując zasady zmian pasz (pod nadzorem instruktora).',
                        'Opiekował się jednym lub kilkoma końmi.',
                        'Brał udział w ujeżdżaniu młodych koni pod siodłem lub w zaprzęgu.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'adept_jezdziecki',
                      title: 'Adept jeździecki',
                      level: 1,
                      tasks: [
                        'Poznał budowę zewnętrzną, maści i odmiany koni. Wiedzę tę przekazał swojemu zastępowi podczas zbiórki.',
                        'Zna zasady bezpieczeństwa podczas jazdy konnej i przebywania z końmi, stosuje je w praktyce.',
                        'Poznał budowę siodła ogólnoużytkowego i rozróżnia typy nachrapników: polski, hanowerski i meksykański.',
                        'Czyścił konia i prawidłowo zakładał urząd jeździecki (siodło i ogłowie). Wie, jak zapobiec zapoprężeniu i grudzie.',
                        'Jeżdżąc konno, prawidłowo trzymał się w stępie i kłusie, potrafi anglezować na prawidłową nogę.',
                      ]),
                  SprawData(
                      id: 'jezdziec',
                      title: 'Jeżdziec',
                      level: 2,
                      tasks: [
                        'Poznał sposoby użytkowania, typy i rasy koni w Polsce.',
                        'Rozróżnia typy i rodzaje siodeł.',
                        'Pielęgnował konia czyszcząc go przed i po jeździe.',
                        'Poznał zasady poruszania się konno w terenie.',
                        'Kreślił figury na ujeżdżalni w każdym chodzie konia.',
                      ]),
                  SprawData(
                    id: 'jezdziec_doskonaly',
                    title: 'Jeździec doskonały',
                    level: 3,
                    tasks: [
                      'Potrafi udzielić pierwszej pomocy.',
                      'Wymienił główne regiony hodowli koni na świecie, poznał zwyczaje, tradycje i piosenki jeździeckie.',
                      'Wykonywał wszelkie prace stajenne, pomagając przy żniwach lub zwózce siana, konserwując sprzęt jeździecki, zadając paszę i sprzątając stanowiska lub boksy koni. Nauczył zastęp podstawowych umiejętności w zakresie obsługi koni.',
                      'Poznał ważniejsze schorzenia koni, potrafi im zapobiec i udzielić pierwszej pomocy weterynaryjnej.',
                      'Wykonał zwroty na przodzie i na zadzie, ustępowanie od łydki, branie przeszkody (do 100 cm]), potrafi prowadzić konia kontrgalopem.',
                      'Dodatkowe wymaganie dla dziewcząt:'
                          '\n\nZna budowę siodła damskiego (wskazane, by potrafi ła na nim jeździć).',
                      'Dodatkowe wymaganie dla chłopców:'
                          '\n\nZna budowę rzędu wojskowego wz. 36, potrafi go poprawnie stroczyć i założyć na konia, prawidłowo wsiadać i zsiadać na komendy.',
                    ],
                    comment: 'Funkcję sprawność mistrzowskiej pełnią odznaki jeździeckie PZJ.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'skornik',
                      title: 'Skórnik',
                      level: 1,
                      tasks: [
                        'Wyczyścił, zmiękczył, zakonserwował skórzane elementy ekwipunku jeździeckiego.',
                        'Poznał podstawowe narzędzia pracy rymarskiej (igły rymarskie, szydło, koń rymarski, nóż, dratwa, dziurkacz]), posłużył się nimi.',
                        'Prawidłowo przygotował dratwę do szycia, szył na dwie igły.',
                        'Wszył oderwaną sprzączkę, wyciął nową dziurkę w skórze.',
                        'Poznał ogólną budowę siodła ogólnoużytkowego i rozróżnił typy nachrapników: polski, hanowerski, meksykański.',
                      ]),
                  SprawData(
                      id: 'czeladnik_rymarski',
                      title: 'Czeladnik rymarski',
                      level: 2,
                      tasks: [
                        'Połączył skórę różnymi sposobami.',
                        'Zszył rozerwany kantar lub uzdę, puśliska lub przystuły.',
                        'Poznał różne rodzaje rzędów jeździeckich, rozróżnia różne rodzaje uprzęży.',
                        'Wykonał najprostszy kantar dla konia (np. z taśmy, ze sznurka).',
                      ]),
                  SprawData(
                      id: 'rymarz',
                      title: 'Rymarz',
                      level: 3,
                      tasks: [
                        'Rozróżnił różne rodzaje skóry, poznał ich cechy i przeznaczenie.',
                        'Posługując się sprawnie narzędziami rymarskimi, połączył skórę nitami, zastosował jedną z technik zdobienia skóry.',
                        'Wykonał kantar ze skóry, ozdobił go według własnego pomysłu.',
                        'Nauczył harcerzy prostych prac rymarskich.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'pomocnik_luzaka',
                      title: 'Pomocnik luzaka',
                      level: 1,
                      tasks: [
                        'Potrafi rozpoznać trzy różne rodzaje kiełzna, zna ich działanie.',
                        'Wie, czym różnią się szory od chomąta.',
                        'Ppiekował się koniem podczas zawodów lub pokazu, czyszcząc go, zaplatając grzywę i ogon, pojąc, karmiąc i ścieląc boks.',
                        'Pomagał przy zaprzęganiu konia, zapoznając się z budową użytkowanej uprzęży.',
                      ]),
                  SprawData(
                      id: 'luzak',
                      title: 'Luzak',
                      level: 2,
                      tasks: [
                        'Wymienił rodzaje uprzęży i typy pojazdów, rozpoznając je na rysunkach lub zdjęciach.',
                        'Poznał zasady zaprzęgania koni w pojedynkę i w parze, powożąc w łatwym terenie.',
                        'Ubierał konia w szory i chomąto, rozróżniając prawidłowo poszczególne części uprzęży.',
                        'Brał udział w przygotowaniach do zawodów zaprzęgów, pełniąc funkcję luzaka.',
                      ]),
                  SprawData(
                      id: 'woznica',
                      title: 'Woźnica',
                      level: 3,
                      tasks: [
                        'Poznał budowę uprzęży. Wie, co to jest munsztuk zaprzęgowy, pehlam liverpool, fasculce itp.',
                        'Rozróżnił style zaprzęgów: angielski, węgierski, bałagulski i inne.',
                        'Jeździł parokonnym zaprzęgiem w różnorodnym terenie.',
                        'Prowadził wóz taborowy podczas rajdu konnego.',
                        'Potrafi opisać zasady zawodów w powożeniu. W ciekawy sposób przedstawił je na forum drużyny.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '8',
                sprawData: [
                  SprawData(
                      id: 'adept_woltyzerki',
                      title: 'Adept woltyżerki',
                      level: 1,
                      tasks: [
                        'Bez problemu wsiada i zsiada z konia zarówno z lewej, jak i prawej strony.',
                        'Prawidłowo wykonuje następujące ćwiczenia:'
                            '\n• na koniu gimnastycznym: nożyce, wskok, sztandar, stanie na siodle,'
                            '\n• na stojącym koniu: 4 strony świata, martwy Indianin, rybka w przód i w tył,'
                            '\n• na koniu chodzącym na lonży: ćwiczenia na równowagę, jazda bokiem i tyłem.',
                        'Potrafi nazwać ćwiczenia woltyżerskie (wykonywane przez kogoś innego, na filmie itp.).',
                      ]),
                  SprawData(
                      id: 'woltyzer',
                      title: 'Woltyżer',
                      level: 2,
                      tasks: [
                        'Regularnie jeździ konno (stęp, kłus, galop).',
                        'Zna zasady bezpieczeństwa podczas jazdy konnej i stosuje się do nich.',
                        'Wykonał następujące ćwiczenia:'
                            '\n• na koniu stojącym: stanie na siodle, nożyce, wskok, sztandar,'
                            '\n• na koniu chodzącym na lonży (stęp, kłus, galop): 4 strony świata, martwy Indianin, rybka w przód i w tył.',
                        'Zna budowę rzędu woltyżerskiego.',
                      ]),
                  SprawData(
                      id: 'woltyzer_doskonaly',
                      title: 'Woltyżer doskonały',
                      level: 3,
                      tasks: [
                        'Ukończył podstawowy kurs jazdy konnej i regularnie jeździ konno.',
                        'Poznał przepisy dotyczące bezpieczeństwa ćwiczeń woltyżerskich i stosuje je w praktyce.',
                        'Wykonał następujące ćwiczenia:'
                            '\n\n• na konia stojącego: wskok trzema sposobami,'
                            '\n• na konia chodzącego na lonży w stępie, kłusie i galopie: wskok, zeskok, zeskok-wyskok, rybka, nożyce, stanie na siodle, sztandar, przeskok przez konia,'
                            '\n• na konia biegnącego luzem: wskok.',
                        'Prawidłowo założył rząd woltyżerski.',
                        'Nauczył młodszych podstawowych ćwiczeń na koniu gimnastycznym.',
                      ])
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_jezyk',
          title: 'Językowe',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'jezykoznawca',
                      title: 'Językoznawca',
                      level: 1,
                      tasks: [
                        'Wyraża się poprawnie, nauczył się umiejętnie korzystać ze słowników języka polskiego i poprawnej polszczyzny.',
                        'Nauczył się podstawowych zwrotów grzecznościowych w językach: angielskim, francuskim, niemieckim, rosyjskim.',
                        'W wybranym przez siebie języku obcym nauczył się podstawowego słownictwa związanego z harcerstwem (co najmniej 20 słówek).',
                        'Uczy się systematycznie wybranego języka obcego.',
                      ]),
                  SprawData(
                      id: 'tlumacz',
                      title: 'Tłumacz',
                      level: 2,
                      tasks: [
                        'Pogłębił w czasie próby znajomość języka obcego.',
                        'Przetłumaczył na język polski kilka gier skautowych.',
                        'Napisał słowniczek o tematyce harcerskiej, zawierający ok. 100 słówek w języku, którego się uczy.',
                        'Uczestnicząc w spotkaniu skautowym, pomagał innym porozumieć się w języku, którego się uczy.',
                      ]),
                  SprawData(
                      id: 'poliglota',
                      title: 'Poliglota',
                      level: 3,
                      tasks: [
                        'Potrafi porozumieć się w podstawowych sprawach w co najmniej dwóch językach obcych i tłumaczyć rozmowę z wybranego języka.',
                        'Przetłumaczył artykuły o tematyce skautowej, upowszechniając ich treść w swoim środowisku.',
                        'Zaoferował swoją służbę jako tłumacz podczas spotkania skautowego organizowanego przez szczep, hufiec lub chorągiew.',
                        'Nauczył młodszych kilku zwrotów obcojęzycznych.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskich pełnią certyfikaty językowe.'
                  )
                ]
            )
          ]),

      SprawGroupData(
          id: 'spraw_komputer',
          title: 'Komputerowe',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'komputerowiec',
                      title: 'Komputerowiec',
                      level: 1,
                      tasks: [
                        'Wykonał podstawowe czynności na komputerze:'
                            '\n• napisał tekst w edytorze tekstu,'
                            '\n• korzystając z arkusza kalkulacyjnego, wykonał prostą operację, np. sumowanie komórek,'
                            '\n• założył własną skrzynkę e-mail, napisał i wysłał wiadomość pocztą elektroniczną.',
                        'Zebrał biblioteczkę informatyczną i przygotował do wykorzystania w drużynie.',
                        'Znalazł w Internecie informacje z dziedziny, którą się interesuje.',
                        'Zainstalował nowy program komputerowy i skonfigurował go do własnych potrzeb.',
                        'Obsługując komputer, przestrzega zasad higieny pracy.',
                      ]),
                  SprawData(
                      id: 'znawca_komputerow',
                      title: 'Znawca komputerów',
                      level: 2,
                      tasks: [
                        'Wskazał najlepsze modele monitorów, skanerów, drukarek, modemów oraz innych podzespołów komputerowych w zależności od potrzeb i możliwości użytkownika, uzasadnił swój wybór. Systematycznie czyta prasę komputerową.',
                        'Zainstalował w komputerze i właściwie skonfigurował dodatkowy sprzęt: kartę muzyczną, twardy dysk, CD-ROM, skaner.',
                        'Zaradził w kilku przypadkach awarii sprzętu komputerowego.',
                        'Zaprezentował młodszym harcerzom budowę i zasadę działania komputera oraz innych urządzeń, np. drukarki, skanera.',
                        'Poznaje dowolny język programowania, wykorzystując nabyte umiejętności napisał prostą aplikację.',
                      ]),
                  SprawData(
                    id: 'informatyk',
                    title: 'Informatyk',
                    level: 3,
                    tasks: [
                      'Przedstawił młodszym harcerzom rolę i perspektywy rozwoju informatyki we współczesnym świecie. Zorganizował w drużynie (szczepie) zajęcia z obsługi wybranego programu użytkowego.',
                      'Poznał co najmniej jeden język programowania, uczy się następnego, opracował aplikację na użytek drużyny, szczepu, hufca.',
                      'Poznał podstawowe rodzaje licencji na oprogramowanie komputerowe, promuje stosowanie legalnych programów.',
                      'Samodzielnie złożył komputer i właściwie go skonfigurował (na poziomie BIOS-u i systemu operacyjnego).',
                      'Pełni stałą służbę opartą na wiedzy informatycznej, np. administrator stron www (hufca, szczepu, drużyny), serwisant sprzętu komputerowego w komendzie hufca, administrator elektronicznej bazy danych.'
                    ],
                    comment: 'Funkcję sprawności mistrzowskich pełni zdobycie specjalistycznych certyfikatów.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'internauta',
                      title: 'Internauta',
                      level: 2,
                      tasks: [
                        'Wskazał najciekawsze jego zdaniem strony w Internecie i uzasadnił swój wybór. Odszukał strony zaprzyjaźnionych środowisk harcerskich.',
                        'Znalazł w Internecie potrzebne mu informacje,  wykorzystał je na zbiórce.',
                        'Skonfigurował konto w programie pocztowym, przesłał i odebrał informacje za pomocą poczty elektronicznej, subskrybuje minimum jedną grupę dyskusyjną.',
                        'Zapoznał się z popularnymi nazwami związanymi z Internetem.',
                        'Umie znaleźć w sieci potrzebne oprogramowanie, zna rodzaje licencji i stosuje się do nich.',
                      ]),
                  SprawData(
                      id: 'mistrz_internetu',
                      title: 'Mistrz Internetu',
                      level: 3,
                      tasks: [
                        'Samodzielnie przygotował komputer do korzystania z Internetu, skonfigurował urządzenia i oprogramowanie.',
                        'Zabezpieczył komputer przed atakami z sieci i wirusami, stosując darmowe oprogramowanie dostępne w Internecie, uzasadnił wybór instalowanych pakietów.',
                        'Sprawnie posługuje się fachową terminologią: protokół, ftp, lista dyskusyjna, domena itp.',
                        'Wykonał stronę internetową drużyny lub szczepu. Przygotował teksty oraz grafikę, opublikował stronę w Internecie.',
                        'Nauczył młodszych harcerzy obsługi wybranych programów internetowych.',
                      ]),
                  SprawData(
                      id: 'webmaster',
                      title: 'Webmaster',
                      level: 4,
                      tasks: [
                        'Nawiązał współpracę z zespołem GK ZHP zajmującym się Internetem, uczestniczył w zadaniu realizowanym przez ten zespół.',
                        'Zna zasady budowania ośrodków www z zakresu wizualizacji projektu, zagadnień PR i oprogramowania.',
                        'Skompletował zespół do realizacji projektu internetowego (serwisu www]), rozdzielił zadania w zespole: przygotowanie i korekta tekstów, przygotowanie grafiki, kodowanie serwisu, promocja itp., gotowy serwis opublikował w Internecie.',
                        'Stale rozwija swoje umiejętności w zakresie języków programowania stosowanych w budowaniu ośrodków www, zna co najmniej dwa, w tym jeden z grupy języków server-side, przygotował layout strony stosując optymalizację grafiki.',
                        'Przeprowadził formę kształceniową dotyczącą tematyki Internetu.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'dtp-owiec',
                      title: 'DTP-owiec',
                      level: 3,
                      tasks: [
                        'Sprawnie posługuje się fachową terminologią: bękart, interlinia, szeryf, kerning, punktura, tekstura itp.',
                        'Zna zasady składu komputerowego i wykorzystuje je w wykonywanych pracach.',
                        'Wykonał zaawansowane prace DTP i zaprezentował je na zbiórce lub w szkole.',
                        'Swoje umiejętności  wykorzystał, przygotowując śpiewnik, poradnik lub inne wydawnictwo dla drużyny, szczepu, hufca.',
                        'Na zbiórce wytłumaczył młodszym, jakie zagrożenia wynikają z piractwa komputerowego.',
                      ]),
                  SprawData(
                      id: 'grafik_komputerowy',
                      title: 'Grafik komputerowy',
                      level: 4,
                      tasks: [
                        'Samodzielnie wykonał zaawansowane prace graficzne na komputerze i zaprezentował je na zbiórce lub w szkole.',
                        'Swoje umiejętności  wykorzystał, wykonując prace graficzne dla drużyny, szczepu, hufca.',
                        'Potrafi sprawnie wykonać zaawansowane operacje: skanować i obrabiać grafikę, importować do i eksportować z innych programów, przygotować dokument do druku, wykonywać retusze itp.',
                        'Nauczył młodszych harcerzy podstaw obsługi programu graficznego.',
                        'Na zbiórce wytłumaczył zagrożenia wynikające z piractwa komputerowego, zna zasady dotyczące ochrony praw autorskich do grafiki komputerowej.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'znawca_programu_komputerowego',
                      title: 'Znawca programu komputerowego',
                      level: 3,
                      tasks: [
                        'Zainstalował wybrany program, poznał jego tajniki, skonfigurował program odpowiednio do swoich potrzeb.',
                        'Zgromadził biblioteczkę informatyczną związaną z wybranym programem.',
                        'Wykonał w wybranym programie materiały i pomoce potrzebne drużynie, szczepowi, hufcowi.',
                        'Nauczył młodszych harcerzy podstawowej obsługi wybranego programu, zaprezentował efekty swojej pracy z programem.',
                        'Na zbiórce wytłumaczył istotę i zagrożenia wynikające z piractwa komputerowego.',
                      ]),
                  SprawData(
                      id: 'programista',
                      title: 'Programista',
                      level: 4,
                      tasks: [
                        'Poznał genezę i historię wybranego języka programowania, wskazał najważniejsze udoskonalenia w jego ostatnich wersjach.',
                        'Zgromadził biblioteczkę informatyczną związaną z wybranym językiem programowania.',
                        'Samodzielnie napisał dużą aplikację i zaprezentował ją w szkole, na studiach lub w drużynie.',
                        'Napisał program pomocny w pracy drużyny, szczepu, hufca.',
                        'Zna wymagania dotyczące praw autorskich do programów komputerowych i kodów źródłowych.',
                      ])
                ]
            )
          ]),

      SprawGroupData(
          id: 'spraw_kuch',
          title: 'Kucharskie',
          familyData: [
            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'kuchcik',
                      title: 'Kuchcik',
                      level: 1,
                      tasks: [
                        'Przygotował w terenie posiłek dla zastępu, korzystając z kuchni polowej lub kuchenki turystycznej.',
                        'Zadbał o estetyczny wygląd polowego "stołu".',
                        'Przestrzegał zasad higieny przy sporządzaniu posiłków i zapoznał z nimi zastęp.',
                        'Przygotował śniadanie lub kolację dla domowników.',
                        'Przygotował podwieczorek według własnego pomysłu.',
                      ]),
                  SprawData(
                      id: 'kucharz',
                      title: 'Kucharz',
                      level: 2,
                      tasks: [
                        'Prawidłowo posługiwał się sprzętem kuchennym (nożami, tłuczkami, maszynką do mielenia, garnkami i patelniami, cedzakiem).',
                        'Ułożył urozmaicony jadłospis na kilkudniowy biwak lub na tydzień obozu dla całej drużyny.',
                        'Przygotował dwudaniowy obiad dla rodziny, estetycznie go podając.',
                        'Wybrał na biwaku miejsce na kuchnię, urządził ją funkcjonalnie.',
                      ]),
                  SprawData(
                      id: 'kuchmistrz',
                      title: 'Kuchmistrz',
                      level: 3,
                      tasks: [
                        'Rozplanował i urządził blok kuchenny na obozie drużyny lub kilkudniowym biwaku.',
                        'Kierował co najmniej przez trzy dni służbą kuchenną na obozie lub na biwaku: układał jadłospisy, gotował każdego dnia inną zupę, przygotowywał dania mięsne i jarskie.',
                        'Poznał zasady racjonalnego żywienia dzieci i dorosłych.',
                        'Ułożył wybraną dietę (np. niskokaloryczną, dla cukrzyków) oraz wyliczył podstawowe wartości odżywcze w stosunku do tej diety.',
                        'Przygotował młodszych do próby na sprawność "kuchcika".',
                      ])
                ]
            )
          ]),

      SprawGroupData(
          id: 'spraw_kwater',
          title: 'Kwatermistrzowskie',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'sobieradek_obozowy',
                      title: 'Sobieradek obozowy',
                      level: 1,
                      tasks: [
                        'Rozbił samodzielnie mały namiot.',
                        'Uczestniczył w budowie urządzeń namiotowych, posługując się sprzętem pionierskim.',
                        'Samodzielnie wykonał przedmiot przydatny na obozie, np. kosz na śmieci, wieszak, tablicę rozkazów.',
                        'Rozpalił ogień w bezpiecznym miejscu i zatarł dokładnie ślady po zakończeniu ogniska.',
                      ]),
                  SprawData(
                      id: 'technik_obozowy',
                      title: 'Technik obozowy',
                      level: 2,
                      tasks: [
                        'Umiejętnie posługiwał się zakonserwowanym przez siebie sprzętem pionierskim przy budowie urządzeń namiotowych.',
                        'Zbudował urządzenie obozowe własnego pomysłu, stosując węzły i gwoździe odpowiedniej wielkości.',
                        'Wraz z zastępem rozstawiał namioty różnego typu i wielkości.',
                        'Po zakończeniu obozu wraz z zastępem składał namioty, przygotowując je do przechowywania w magazynie (suszył, naprawiał, talkował).',
                      ]),
                  SprawData(
                      id: 'wyga_obozowy',
                      title: 'Wyga obozowy',
                      level: 3,
                      tasks: [
                        'Uczestniczył w zwiadzie kwatermistrzowskim przed obozem drużyny.',
                        'Kierował rozstawieniem obozu, właściwie dobierając miejsca na namioty mieszkalne, kuchnie i sanitariaty.',
                        'Zapoznał się z możliwościami zastosowania różnego rodzaju drewna do budowy urządzeń obozowych.',
                        'Budował urządzenia obozowe ogólnego użytkowania, np. kuchnię, pomosty, stołówkę.',
                        'Brał udział w kwaterce obozowej.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'majsterklepka',
                      title: 'Majsterklepka',
                      level: 1,
                      tasks: [
                        'Skompletował zestaw podstawowych narzędzi do majsterkowania i umie się nimi bezpiecznie posługiwać.',
                        'Oczyścił przedmioty z drewna, metalu i tworzyw sztucznych, nie niszcząc ich.',
                        'Skleił rozbitą porcelanę, plastik, metal. przedstawił swoje sposoby drobnych napraw na zbiórce zastępu.',
                        'Wykonał proste prace, jak np. ostrzenie noży, wymiana baterii w latarce, kalkulatorze, radiu, wymiana uszczelki w kranie, naoliwienie zamka.',
                      ]),
                  SprawData(
                      id: 'gospodarz',
                      title: 'Gospodarz',
                      level: 2,
                      tasks: [
                        'Opiekował się harcówką przez okres próby: dokonał w niej drobnych napraw lub zaproponował nowe funkcjonalne i estetyczne rozmieszczenie wyposażenia.',
                        'Konserwował sprzęt pionierski, sportowy lub obozowy.',
                        'Skompletował sprzęt potrzebny na obozie drużyny lub szczepu.',
                        'Wie, na czym polega inwentaryzacja, brał udział w spisie z natury.',
                        'Prowadził magazyn sprzętu na obozie drużyny lub w ciągu roku wraz z dokumentacją.',
                      ]),
                  SprawData(
                      id: 'kwatermistrz',
                      title: 'Kwatermistrz',
                      level: 3,
                      tasks: [
                        'Stosuje zasady logistyki w życiu codziennym − korzysta z tej wiedzy przy planowaniu prac drużyny.',
                        'Uczestniczył w organizowaniu obozu drużyny pod względem kwatermistrzowskim, zadbał o zaplecze dla obozu.',
                        'Był odpowiedzialny za organizacyjną stronę biwaku lub rajdu szczepu.',
                        'Przez okres co najmniej sześciu miesięcy pełnił funkcję kwatermistrza drużyny lub szczepu.',
                        'Nauczył młodszych konserwować sprzęt pionierski i porządkować magazyn sprzętu oraz posługiwać się narzędziami zgodnie z podstawowymi zasadami bezpieczeństwa.',
                      ]),
                  SprawData(
                      id: 'logistyk',
                      title: 'Logistyk',
                      level: 4,
                      tasks: [
                        'Odpowiadał za logistyczne przygotowanie obozu, przeprowadzając zwiad i organizując zaplecze dla obozu, przygotował niezbędne dokumenty.',
                        'Pełnił funkcję kwatermistrza lub zaopatrzeniowca na obozie.',
                        'Przygotował preliminarz i współuczestniczył w rozliczeniu obozu.',
                        'Podsumował roczną działalność drużyny lub szczepu pod względem organizacyjnym: przeprowadził inwentaryzację, ocenił ilościowo i jakościowo zaplecze sprzętowe, skontrolował i uzupełnił dokumentację. Wnioski i propozycje przedstawił radzie drużyny lub szczepu.',
                        'Wyznaczył sobie dodatkowe zadania mistrzowskie.',
                      ])
                ]
            )
          ]),

      SprawGroupData(
          id: 'spraw_lacznosc',
          title: 'Łącznościowe',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'goniec',
                      title: 'Goniec',
                      level: 1,
                      tasks: [
                        'Wskazał drogę do urzędów i ważnych miejsc w swojej miejscowości.',
                        'Dostarczył list lub ustną wiadomość do adresata w wyznaczonym terminie.',
                        'Nadał na poczcie: list polecony, przekaz pieniężny, paczkę.',
                        'Bezbłędnie przekazał meldunek w czasie gry terenowej, posługując się wybranymi sposobami łączności.',
                        'Odebrał i wysłał wiadomość pocztą internetową.',
                      ]),
                  SprawData(
                      id: 'lacznik',
                      title: 'Łącznik',
                      level: 2,
                      tasks: [
                        'Znalazł w książce telefonicznej lub w Internecie adresy i numery telefonów dowolnych instytucji, dysponując tylko ich nazwą.',
                        'Obsługując centralkę telefoniczną, utrzymał łączność w terenie.',
                        'Wykonał przyrząd do sygnalizacji w terenie, nadając i odbierając za jego pomocą depeszę napisaną alfabetem Morse’a.',
                        'Opracował szyfr dla zastępu (drużyny).',
                      ]),
                  SprawData(
                      id: 'zwiadowca',
                      title: 'Zwiadowca',
                      level: 3,
                      tasks: [
                        'W nieznanym terenie niedostrzeżenie podszedł wskazany obiekt.',
                        'Przeprowadził zwiad, sporządzając szczegółowy raport z opisem wykonanych zadań i zaobserwowanych zdarzeń.',
                        'Nawiązał łączność za pomocą radia CB, przekazał informacje zdobyte podczas zwiadu.',
                        'Wie, jakie są zasady i sposoby przekazywania oraz gromadzenia poufnych informacji (np. danych osobowych]), szczególnie w Internecie.',
                        'Przeprowadził w zastępie lub drużynie szkolenie z łączności.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'sygnalista',
                      title: 'Sygnalista',
                      level: 1,
                      tasks: [
                        'Sprawnie nadał i odebrał telegram alfabetem Morse’a za pomocą chorągiewek i latarki.',
                        'Podał treść informacji w zwięzłej formie.',
                        'Poznał zasady szyfrowania i rozszyfrowywania, posługując się szyfrem w grach harcerskich.',
                        'Pełnił służbę łączności na wycieczce lub w grze polowej.',
                        'Przeprowadził zajęcia z sygnalizacji dla zastępu lub drużyny.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'nasluchowiec',
                      title: 'Nasłuchowiec',
                      level: 1,
                      tasks: [
                        'Scharakteryzował międzynarodowy podział pasm radiowych i służby je użytkujące.',
                        'Poznał zakresy amatorskich pasm KF i ich wewnętrzny podział oraz podstawowe wyrazy Q-kodu i podstawowe skróty służbowe.',
                        'Poznał zasady budowy znaków rozpoznawczych i prefi ksy minimum pięciu państw.',
                        'Obsługiwał odbiornik komunikacyjny, pełnił dyżur nasłuchowy w pracy sieci i odebrał kierowany doń radiogram.',
                        'Dokonał stu nasłuchów z co najmniej dziesięciu krajów.',
                      ]),
                  SprawData(
                      id: 'radiooperator',
                      title: 'Radiooperator',
                      level: 2,
                      tasks: [
                        'Przeprowadził na stacji klubowej co najmniej dwadzieścia łączności.',
                        'Poznał procedurę pracy amatorskiej, międzynarodowy system głoskowania, sposoby budowy znaków rozpoznawczych oraz pamięta prefiksy krajów sąsiadujących z Polską, krajów Unii Europejskiej oraz USA. Zna organizację krótkofalarstwa w Polsce.',
                        'Pracował w sieci służbowej łączności radiotelefonicznej i przekazał co najmniej dwadzieścia radiogramów, zna procedurę pracy służbowej oraz sposób prowadzenia dokumentacji stacyjnej (radiogramy, log).',
                        'Poznał zasady rozchodzenia się fal KF i UKF, wybrał właściwe miejsce w terenie dla usytuowania anteny oraz dobrał odpowiedni typ anteny w zależności od wymaganego zasięgu.',
                        'Przygotował do pracy przenośną radiostację i przeprowadził szkolenie zastępu w tym zakresie.',
                      ]),
                  SprawData(
                    id: 'radiotelegrafista',
                    title: 'Radiotelegrafista',
                    level: 3,
                    tasks: [
                      'Odebrał i nadał kluczem 60 znaków na minutę według PARIS.',
                      'Poznał minimum 20 znaków Q-kodu oraz znaki służbowe dotyczące korespondencji radiowej.',
                      'Nawiązał co najmniej 20 łączności telegrafią na radiostacji klubowej i przekazał telegrafią co najmniej 10 radiogramów podczas pracy amatorskiej lub służbowej.',
                      'Pracował co najmniej raz z terenowego stanowiska (obóz, biwak]), utrzymując łączność z wybranym korespondentem w macierzystej miejscowości.',
                      'Wykonał proste urządzenie telegraficzne, np. generator do nauki telegrafii,  wykorzystał je podczas swoich zajęć z zastępem.',
                    ],
                    comment: 'Funkcję sprawności mistrzowskiej pełni odznaka lub uprawnienie: licencja radiooperatora w służbie radiokomunikacyjnej amatorskiej klasy A, B, C i D.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'elektrotechnik',
                      title: 'Elektrotechnik',
                      level: 2,
                      tasks: [
                        'Poznał zasady działania maszyn elektrycznych: prądnicy, transformatora, prostownika, akumulatora, silnika.',
                        'Zna i stosuje się do przepisów BHP w pracy w zakresie prądów silnych.',
                        'Wykrył − poszukując w systematyczny sposób − uszkodzenia w urządzeniach elektrycznych codziennego użytku (lampa, żelazko itp.]), naprawił popsute urządzenie.',
                        'Wykonał poprawnie sam lub w zespole aparat, urządzenie lub część instalacji elektrycznej, np. napęd elektryczny do modelu, oświetlenie na obozie.',
                        'Nauczył młodszych kolegów obsługi lub naprawy prostego urządzenia elektrycznego.',
                      ]),
                  SprawData(
                      id: 'radioamator',
                      title: 'Radioamator',
                      level: 3,
                      tasks: [
                        'Wykonał prosty odbiornik nasłuchowy lub radiolokacyjny.',
                        'Korzystał z prostych schematów radiowych, wytłumaczył na ich podstawie zasadę pracy urządzenia.',
                        'Poznał zasady racjonalnej eksploatacji sprzętu elektronicznego, którym się posługuje, zademonstrował drużynie poprawną obsługę.',
                        'Poznał i stosuje podstawowe zasady bezpieczeństwa w zakresie pracy ze sprzętem łączności.',
                        'Poznał zasady miernictwa, posługując się miernikiem uniwersalnym i generatorem−falomierzem.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'radiotropiciel',
                      title: 'Radiotropiciel',
                      level: 1,
                      tasks: [
                        'Startował w radiowych "łowach na lisa" i wytropił wszystkie ukryte nadajniki.',
                        'Przeprowadził skuteczne radionamierzanie "lisa" i wykreślił jego stanowisko na mapie. Oszacował błąd pomiaru.',
                        'Zorientował mapę w terenie za pomocą radionamierzania na stacje radiofoniczne średnio- i długofalowe.',
                        'Przeprowadził pokaz wykrywania nadajnika "lisa" w terenie.',
                      ]
                  )
                ]
            )
          ]),

      SprawGroupData(
          id: 'spraw_lotnicze',
          title: 'Lotnicze',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'modelarz_kartonowy',
                      title: 'Modelarz kartonowy',
                      level: 1,
                      tasks: [
                        'Wyjaśnił, jakie siły działają na szybowiec w locie.',
                        'Wyważył i wyregulował latający kartonowy model szybowca, aby wykonał lot prosty.',
                        'Na modelu zademonstrował działanie sterów i lotek.',
                        'Wykonał z papieru strzałę i gołębia oraz model latający szybowca z kartonu bez użycia kleju.',
                        'Brał udział w zawodach kartonówek.',
                      ]),
                  SprawData(
                      id: 'modelarz_redukcyjny',
                      title: 'Modelarz redukcyjny',
                      level: 2,
                      tasks: [
                        'Rozpoznaje pięć najważniejszych typów polskich szybowców i dziesięć typów używanych w Polsce samolotów.',
                        'Wykazał się znajomością nazw części samolotu, wyjaśnił działanie sterów.',
                        'Zbudował latający model sylwetkowy (tj. o sylwetce istniejącego samolotu lub szybowca) z kartonu lub styropianu na procę lub na wędkę oraz brał udział w zawodach akrobacji modeli.',
                        'Skleił estetycznie plastikowy model z gotowego zestawu oraz prawidłowo umieścił na nim znaki i numery.',
                        'Wziął udział w konkursie modeli samolotów z tworzyw sztucznych lub zademonstrował swoje modele w zastępie.',
                      ]),
                  SprawData(
                      id: 'modelarz_konstruktorski',
                      title: 'Modelarz konstruktorski',
                      level: 3,
                      tasks: [
                        'Rozpoznaje typy współczesnych szybowców, samolotów i śmigłowców polskiej konstrukcji i używanych w Polsce oraz najważniejsze zagraniczne.',
                        'Rozpoznaje rodzaje drewna i tworzyw sztucznych (styropian, polistyren, szkło organiczne]), potrafi je kleić i obrabiać.',
                        'Zbudował trzy modele z drewna lub kartonu wiernie oddające wygląd samolotów lub skleił pięć modeli plastikowych, estetycznie i prawidłowo je malując.',
                        'Wykazując się znajomością zasad rysunku technicznego, narysował plan samolotu, którego model zbudował, uzupełniając go o szczegóły konstrukcji i malowanie według fotografii.',
                        'Opowiedział o dziejach, konstrukcji i osiągnięciach samolotów, śmigłowców, szybowców, których modele zbudował.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'konstruktor_latawcow',
                      title: 'Konstruktor latawców',
                      level: 1,
                      tasks: [
                        'Rozpoznaje różne rodzaje latawców. Wie, jaka jest konstrukcja każdego z nich i zna ich zastosowania dawniej i dziś.',
                        'Wyjaśnił, jakie siły działają na latawce w locie i od czego zależy prawidłowy lot.',
                        'Potrafi wyregulować latawiec, aby prawidłowo wzbijał się w powietrze i latał.',
                        'Zbudował dwa latawce − płaski i skrzynkowy. Zbudował wyciąg do latawca i zastosował go.',
                        'Uczestniczył ze swym latawcem w zawodach latawcowych, np. z okazji Święta Latawca.',
                      ]),
                  SprawData(
                      id: 'radiomodelarz',
                      title: 'Radiomodelarz',
                      level: 2,
                      tasks: [
                        'Zna przynajmniej dwa systemy zdalnego sterowania. Wie, czym się charakteryzują. Wie, jaką rolę w urządzeniu zdalnie sterowanym spełniają przekaźniki elektromechaniczne, czujniki i silniki elektryczne.',
                        'Wyjaśnił, gdzie i na jakich warunkach można uzyskać zezwolenie na budowę urządzeń nadawczo-odbiorczych do sterowania radiomodelarskiego.',
                        'Narysował i objaśnił schemat blokowy jednokanałowego nadajnika i odbiornika sterowania falami radiowymi.',
                        'Zademonstrował  na zbiórce zastępu lub drużyny funkcjonowanie zestawu zdalnego sterowania modeli, wyjaśnił kolegom, na czym ono polega.',
                        'Przeprowadził pokaz akrobacji lotniczej z wykorzystaniem zestawu zdalnego sterowania.',
                      ]),
                  SprawData(
                      id: 'konstruktor_lotniczy',
                      title: 'Konstruktor lotniczy',
                      level: 3,
                      tasks: [
                        'Opowiedział o kilku najnowszych osiągnięciach techniki lotniczej, rodzajach doświadczalnych samolotów i różnych układach aerodynamicznych samolotów. Objaśnił zasady lotu różnych rodzajów statków latających.',
                        'Wyjaśnił, jaką rolę spełniają poszczególne elementy konstrukcyjne i urządzenia aerodynamiczne samolotów.',
                        'Objaśnił, do czego służy wirnik ogonowy śmigłowca oraz jak się steruje śmigłowcem. Wyważył i wyregulował model o układzie nietypowym: kaczki lub bezogonowca.',
                        'Zbudował model latający o układzie nietypowym: kaczki lub bezogonowca.',
                        'Zbudował model doświadczalny własnego pomysłu dowolnego statku powietrznego (np. śmigłowiec, pionowzlot, samolot skróconego startu, poduszkowiec) lub ze specjalnymi urządzeniami aerodynamicznymi (sploty, zaburzacze, hamulce aerodynamiczne, interceptory zamiast lotek itp.) i zademonstrował jego działanie.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'mlody_baloniarz',
                      title: 'Młody baloniarz',
                      level: 1,
                      tasks: [
                        'Wyjaśnił zasady unoszenia się balonu w powietrzu oraz budowę balonu sportowego.',
                        'Rozpoznaje rodzaje balonów i zna ich zastosowanie.',
                        'Stosuje przepisy bezpiecznego wypuszczania balonów na ogrzane powietrze.',
                        'Zbudował razem z kolegami balon z bibułki na ogrzane powietrze.',
                        'Brał udział w pokazie wypuszczania balonu na ogrzane powietrze lub w zawodach balonów.',
                      ]),
                  SprawData(
                      id: 'technik_balonowy',
                      title: 'Technik balonowy',
                      level: 2,
                      tasks: [
                        'Opowiedział o dziejach baloniarstwa w Polsce i na świecie.',
                        'Rozpoznał różne rodzaje balonów oraz wykazał się znajomością ich budowy, teorii lotu oraz sposobów kierowania nimi.',
                        'Wykazał się umiejętnością obsługi balonu na ogrzane powietrze przy starcie.',
                        'Brał czynny udział w przygotowaniach do wzlotu balonu.',
                        'Jako pasażer brał udział w locie balonem na ogrzane powietrze.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskiej pełnią uprawnienia pilotów i mechaników balonowych według przepisów Urzędu Lotnictwa Cywilnego i Aeroklubu Polskiego.'
                  ),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'aspirant_szybowcowy',
                      title: 'Aspirant szybowcowy',
                      level: 1,
                      tasks: [
                        'Zna najważniejsze fakty z historii sportu szybowcowego i największe osiągnięcia w tej dziedzinie.',
                        'Wie, w jakich konkurencjach odbywają się szybowcowe loty wyczynowe, zna nazwiska polskich szybowników, zdobywców Medalu Lilienthala.',
                        'Wyjaśnił, jakie wymagania pod względem zdrowia, cech psychicznych i cech charakteru stawiane są pilotowi. Zna i stosuje zasady higieny lotniczej.',
                        'Wie, jak wyglądają odznaki szybowcowe i jakie wymagania trzeba na nie spełnić.',
                        'Rozpoznaje rodzaje i typy szybowców produkowanych w Polsce. Prawidłowo nazwał poszczególne elementy konstrukcji szybowca i potrafi określić ich rolę w czasie lotu szybowca lub modelu.',
                      ]),
                  SprawData(
                      id: 'mlody_szybownik',
                      title: 'Młody szybownik',
                      level: 2,
                      tasks: [
                        'Wie, jakie siły działają na szybowiec w locie i jakie warunki sprzyjają lotom szybowcowym. W terenie lub na mapie wskaże, gdzie powstają prądy wznoszące.',
                        'Zna zasady bezpieczeństwa obowiązujące na starcie szybowcowym. Pełnił funkcję dyżurnego i chronometrażysty na starcie.',
                        'Uczestniczył w wykładaniu, wyhangarowywaniu i transporcie szybowca, wykładaniu znaków startowych i przygotowywaniu szybowca do lotu − samodzielnie podpinał linę holowniczą i wypuszczał szybowiec przy starcie.',
                        'Zapoznał się z co najmniej jedną książką o tematyce szybowcowej.',
                        'Wykonał lot pasażerski szybowcem.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskiej pełnią uprawnienia pilotów i mechaników szybowcowych według przepisów Urzędu Lotnictwa Cywilnego i Aeroklubu Polskiego.'
                  ),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'aspirant_lotniczy',
                      title: 'Aspirant lotniczy',
                      level: 1,
                      tasks: [
                        'Wymienił wymagania zdrowotne i psychiczne stawiane lotnikom. Zna warunki przyjęcia na szkolenia lotnicze (wiek, wykształcenie) i główne rodzaje pracy w lotnictwie.',
                        'Zna nazwy głównych części samolotu.',
                        'Rozpoznaje polskie cywilne i wojskowe odznaki lotnicze.',
                        'Potrafi poruszać się po lotnisku zgodnie z obowiązującymi zasadami i rozpoznaje znaki startowe.',
                        'Odbył lot pasażerski samolotem sportowym lub turystycznym.',
                      ]),
                  SprawData(
                      id: 'mlody_lotnik',
                      title: 'Młody lotnik',
                      level: 2,
                      tasks: [
                        'Określił nawigacyjną prędkość, meteorologiczny kierunek i prędkość wiatru oraz możliwości latania w danych warunkach.',
                        'Zna przeznaczenie dźwigara, kesonu, wręgi, żebra, okucia i pokrycia.',
                        'Scharakteryzuje różnice w konstrukcji kratownicowej i półskorupowej.',
                        'Zademonstruje ruchy sterami samolotu oraz opisze główne przyrządy pokładowe.',
                        'Wskaże podstawowe typy silników lotniczych i najpopularniejszych producentów.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskiej pełnią uprawnienia pilotów oraz mechaników samolotowych według przepisów Urzędu Lotnictwa Cywilnego i Aeroklubu Polskiego.'
                  ),
                ]
            ),

            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'obserwator_lotniczy',
                      title: 'Obserwator lotniczy',
                      level: 1,
                      tasks: [
                        'Rozpoznaje podstawowe rodzaje statków powietrznych, zna ich prawidłowe nazwy oraz podział samolotów według ich przeznaczenia i budowy.',
                        'Zna meteorologiczne warunki odbywania lotów dziennych i nocnych, zasady obserwacji nieba oraz zasadę działania urządzeń radiolokacyjnych.',
                        'Zna sygnały alarmowe obrony cywilnej i wie, jak się zachować po ich usłyszeniu.',
                        'Zmierzył wysokość lotu samolotu za pomocą lornetki polowej oraz ocenił "na oko" w przybliżeniu wysokość, na jakiej leci samolot, jego prędkość i kierunek lotu.',
                        'Potrafi rozpoznać najważniejsze polskie i zagraniczne samoloty (co najmniej piętnaście typów) cywilne i wojskowe oraz rozróżnić znaki rozpoznawcze i rejestracyjne samolotów przynajmniej dziesięciu państw.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskiej pełnią patenty obserwatora lotniczego i aspiranta-nawigatora pokładowego.'
                  ),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'aspirant_lotniarz',
                      title: 'Aspirant lotniarz',
                      level: 1,
                      tasks: [
                        'Wyjaśnił zasady lotu i pilotażu lotni.',
                        'Wykazał, że zna siły działające na lotnię w locie oraz wie, w jakich warunkach można wykonywać loty. Zna podstawowe zasady wykonywania lotów.',
                        'Rozróżnił przynajmniej trzy rodzaje uprzęży dla pilotów lotniowych i ich zastosowanie.',
                        'Opowiedział o najważniejszych faktach z historii lotniarstwa i sportu lotniarskiego.',
                        'Wymienił najważniejsze zawody lotniowe organizowane w Polsce.',
                      ]),
                  SprawData(
                      id: 'mlody_lotniarz',
                      title: 'Młody lotniarz',
                      level: 2,
                      tasks: [
                        'Określił kierunek i prędkość wiatru względem zbocza oraz możliwości latania w danych warunkach.',
                        'Zademonstrował  i wyjaśnił kolegom zasady sterowania lotnią.',
                        'Brał udział w składaniu i rozkładaniu lotni i przygotowaniu jej do lotów. Prawidłowo założył i przypiął uprząż do lotni.',
                        'Wykonał ćwiczenia przygotowawcze do wstępnego szkolenia w pilotażu lotni (rozbieg i dobieg z lotnią, utrzymanie lotni w łożu wiatru, lot latawcowy na uwięzi).',
                      ],
                      comment: 'Funkcję sprawności mistrzowskiej pełnią uprawnienia pilotów według przepisów Urzędu Lotnictwa Cywilnego i Aeroklubu Polskiego.'
                  ),
                ]
            ),

            SprawFamilyData(
                id: '8',
                sprawData: [
                  SprawData(
                      id: 'dyzurny_startu_spadochronowego',
                      title: 'Dyżurny startu spadochronowego',
                      level: 2,
                      tasks: [
                        'Zna przepisy organizacji skoków spadochronowych w zakresie obowiązującym skoczków uczniów.',
                        'Zna obowiązki dyżurnego startu spadochronowego i zrzutowiska, a także obowiązki i zakres uprawnień osób funkcjonujących na starcie spadochronowym.',
                        'Zna wszystkie obowiązujące znaki i sygnały używane podczas prowadzenia skoków spadochronowych.',
                        'Potrafi w terenie i na podstawie mapy dokonać wyboru lądowiska i zrzutowiska oraz określić, jakim powinno odpowiadać warunkom.',
                        'Pełnił obowiązki dyżurnego lub pomocnika dyżurnego na starcie spadochronowym lub zrzutowisku, wykładał znaki, dokonywał pomiaru wiatru anemometrem, określał jego kierunek meteorologiczny i nawigacyjny.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskiej pełnią: uprawnienia układacza i technika spadochronowego, Harcerski Znak Spadochronowy, tytuł, klasy i licencja skoczka spadochronowego.'
                  )
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_meteoro',
          title: 'Meteorologiczne',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'aspirant_meteorologiczny',
                      title: 'Aspirant meteorologiczny',
                      level: 1,
                      tasks: [
                        'Potrafi zauważyć nadchodzący szkwał (burzę).',
                        'Potrafi wyjaśnić zjawisko rosy naturalnej i na okularach po wejściu zimą do ciepłego pomieszczenia.',
                        'Potrafi rozpoznać i nazwać chmury deszczowe.',
                      ]),
                  SprawData(
                      id: 'metereolog',
                      title: 'Metereolog',
                      level: 2,
                      tasks: [
                        'Potrafi ocenić siłę wiatru w skali Bouforta (lub m/s).',
                        'Na planie akwenu szkoleniowego (lub strefy pilotażowej) zaznaczy lokalne, specyficzne obszary wiatrowe (oraz prądy wstępujące).',
                        'Potrafi nazwać widoczne na niebie chmury i powiedzieć, skąd się wzięły (jak powstały) i co zwiastują.',
                        'Rozpoznał różne rodzaje chmur i określił ich wysokość. Rozróżnia rodzaje mas powietrza.',
                      ]),
                  SprawData(
                      id: 'mlody_synoptyk',
                      title: 'Młody synoptyk',
                      level: 3,
                      tasks: [
                        'Potrafi na podstawie układu chmur i innych zjawisk określić sytuację baryczną (np. nadejście ciepłego frontu).',
                        'Potrafi rozpoznać moment przejścia frontu i podać przewidywany rozwój sytuacji meteorologicznej.',
                        'Potrafi odebrać i wyjaśnić specjalistyczną (morską, lotniczą) prognozę pogody. Wie, gdzie ją można znaleźć.',
                        'Przyjmie i zapisze telefoniczną prognozę pogody.',
                        'Przeprowadził obserwacje meteorologiczne i zapisywał wyniki pomiarów co najmniej przez dwa tygodnie.',
                      ]),
                  SprawData(
                      id: 'synoptyk',
                      title: 'Synoptyk',
                      level: 4,
                      tasks: [
                        'Na podstawie mapki synoptycznej sporządził krótkoterminową prognozę.',
                        'Zna typowe trasy niżów i statystyczny rozkład kierunków wiatru na terenie Polski w różnych porach roku.',
                        'Potrafi odebrać i zrozumieć prognozę meteo w języku obcym.',
                        'Potrafi odczytać i zinterpretować prognozę NAVTEX lub ATIS.',
                        'Zinterpretował zarejestrowany przez siebie barogram w odniesieniu do panujących warunków meteorologicznych.',
                      ])
                ]
            )
          ]
      ),

      SprawGroupData(
          id: 'spraw_nauk',
          title: 'Naukowe',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'szperacz',
                      title: 'Szperacz',
                      level: 1,
                      tasks: [
                        'Przygotowując żądaną informację, umiejętnie posłużył się przewodnikiem, encyklopedią, Internetem.',
                        'Zlokalizował wybrany obiekt w nieznanym terenie, wykorzystując dostępne źródła informacji.',
                        'Przeprowadził wywiad dotyczący ciekawostek wybranej miejscowości i zaprezentował go na zbiórce zastępu.',
                        'W czasie obozu, biwaku lub rajdu zebrał ciekawostki na temat odwiedzanych miejsc i ludzi, prezentując je potem kolegom.',
                      ]),
                  SprawData(
                      id: 'poszukiwacz',
                      title: 'Poszukiwacz',
                      level: 2,
                      tasks: [
                        'Wybrał dziedzinę swoich zainteresowań i stale pogłębia swą wiedzę, odwiedzając miejsca związane z tym tematem.',
                        'Zorganizował wycieczkę zastępu (drużyny) do miejsc, w których znajdują się eksponaty z dziedziny jej lub jego zainteresowań.',
                        'Przeprowadził zwiad społeczny w czasie obozu lub biwaku, zdobywając wiedzę na temat historii i ważnych spraw mieszkańców regionu.',
                        'Wykazał się znajomością krain geograficznych i okresów dziejowych Polski.',
                      ]),
                  SprawData(
                      id: 'badacz',
                      title: 'Badacz',
                      level: 3,
                      tasks: [
                        'Wykazał się zainteresowaniami w wybranej dziedzinie (doświadczenia fizyczne, chemiczne, biologiczne, badania etnograficzne, archeologiczne, historyczne, religioznawcze, geologiczne itp.).',
                        'Interesująco przedstawił dziedzinę swoich zainteresowań.',
                        'Spopularyzował w drużynie (w szkole) wybrane odkrycie naukowe lub wydarzenie historyczne (społeczne]), wyjątkowo ważne dla dziejów ludzkości.',
                        'Zorganizował młodzieżową debatę naukową na wybrany przez siebie temat.',
                      ])
                ]
            )
          ]
      ),

      SprawGroupData(
          id: 'spraw_niedowidz',
          title: 'Dla harcerek i harcerzy niedowidzących',
          familyData: [
            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'uwazny_pieszy',
                      title: 'Uważny pieszy',
                      level: 0,
                      tasks: [
                        'Poznał zasady ruchu drogowego w mieście, uczestnicząc w zajęciach organizowanych w miasteczku ruchu drogowego.',
                        'Samodzielnie, pod okiem drużynowego, przeprowadził zastęp przez dwa ruchliwe skrzyżowania oznakowane sygnalizacją świetlną.',
                        'Poznał zasady poruszania się w terenie niezabudowanym i zastosował je w praktyce, np. prowadząc zastęp na wędrówce.',
                        'Spopularyzował wśród kolegów w interesującej formie podstawowe zasady bezpiecznego poruszania się po ulicach i drogach.',
                      ]),
                  SprawData(
                      id: 'maly_optyk',
                      title: 'Mały optyk',
                      level: 0,
                      tasks: [
                        'Poznał zasady higieny wzroku i przestrzega ich podczas pracy, nauki, w domu, na wycieczce itp., a także propaguje je wśród kolegów.',
                        'Poznał rodzaje szkieł optycznych i zrealizował co najmniej trzy recepty okulistyczne.',
                        'Dokonał drobnych napraw okularów swoich i kolegów.',
                        'Wyczyścił za pomocą odpowiednich środków szkła korekcyjne, utrzymuje je w czystości.',
                      ])
                ]
            )
          ]
      ),

      SprawGroupData(
          id: 'spraw_niewidz',
          title: 'Dla harcerek i harcerzy niewidzących',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'kucharz_domowy',
                      title: 'Kucharz domowy',
                      level: 0,
                      tasks: [
                        'Poznał cechy podstawowych produktów żywnościowych i potrafi zakupić ich potrzebną ilość.',
                        'Potrafi obsługiwać urządzenia grzejne (kuchnie gazowe, elektryczne, grzałkę).',
                        'Potrafi samodzielnie przygotować śniadanie i kolację:'
                            '\n• pokroił chleb,'
                            '\n• przygotował kanapki (kroił wędlinę, ser itp.]),'
                            '\n• parzył herbatę,'
                            '\n• ugotował jajka, przygotował jajecznicę.',
                        'Nakrył do stołu prawidłowo i estetycznie.',
                        'Przestrzegał zasad higieny przy przygotowaniu posiłków.',
                      ]),
                  SprawData(
                      id: 'wioslarz',
                      title: 'Wioślarz',
                      level: 0,
                      tasks: [
                        'Poznał co najmniej dwa typy jednostek wiosłowych (kajak, ponton, łódź]), potrafi przygotować jednostkę do pływania, prawidłowo wiosłować, wykonywać podstawowe manewry za pomocą steru i bez steru.',
                        'Poznał i prawidłowo stosuje podstawowy sprzęt ratowniczy (potrafi prawidłowo założyć kamizelkę ratunkową). Poznał zasady bezpieczeństwa na wodzie.',
                        'Poznał zasady prawidłowego biwakowania nad wodą i spędził co najmniej siedem dni nad wodą.',
                        'Potrafi zaśpiewać trzy piosenki wodniackie, upowszechnił w swoim środowisku sporty wodniackie.',
                        'Wie, co to jest PTTK. Zna zasady zdobywania turystycznej odznaki kajakowej.',
                      ],
                      comment: 'Sprawność zalecana jest dla umiejących pływać; wszelkie ćwiczenia na wodzie (pkt. l, 2, 3,) należy wykonywać pod opieką instruktora i ratownika.'
                  ),
                  SprawData(
                      id: 'chodze_sam',
                      title: 'Chodzę sam',
                      level: 0,
                      tasks: [
                        'Potrafi dojść do wyznaczonych punktów na terenie ośrodka, pomagał słabszym w trafieniu do wyznaczonego miejsca.',
                        'Przestrzega przepisów bezpiecznego poruszania się na terenie ośrodka.',
                        'Potrafi rozróżnić rodzaje podłoża.',
                        'Umie korzystać z pomocy przewodnika.',
                        'Umie określić słuchowo na ulicy (drodze) kierunek i rodzaj jadącego pojazdu, potrafi np. za pomocą węchu określić mijane obiekty.',
                        'Poznał zasady poruszania się w ruchu ulicznym.',
                      ])
                ]
            )
          ]
      ),

      SprawGroupData(
          id: 'spraw_poczt',
          title: 'Pocztowe',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'pocztowiec',
                      title: 'Pocztowiec',
                      level: 2,
                      tasks: [
                        'Poznał zasady działania poczt harcerskich oraz ich historię.',
                        'Poznał zasady kolekcjonowania zbiorów filatelistycznych.',
                        'Wykonał projekt wydawnictwa poczty harcerskiej do druku.',
                        'Przygotował własne zbiory wydawnictw poczty harcerskiej do wystawy.',
                        'Brał czynny udział w przygotowaniu wystawy.',
                      ]),
                  SprawData(
                      id: 'pocztylion',
                      title: 'Pocztylion',
                      level: 3,
                      tasks: [
                        'Poznał zasady prowadzenia dokumentacji poczty harcerskiej i różne techniki powielania (drukowania).',
                        'Wykonał samodzielnie klisze lub pieczątkę dla poczty harcerskiej (np. linoryt).',
                        'Zorganizował sieć obsługi pocztowej na obozie lub złazie.',
                        'Nawiązał współpracę z inną pocztą harcerską.',
                        'Poznał zakres zadań, jakimi zajmuje się współcześnie Poczta Polska.',
                      ]),
                  SprawData(
                      id: 'poczmistrz',
                      title: 'Poczmistrz',
                      level: 4,
                      tasks: [
                        'Kierował co najmniej kilkoma projektami tematycznymi poczty.',
                        'Współpracował z Pocztą Polską, Polskim Związkiem Filatelistycznym lub odpowiednią organizacją lub firmą spedycyjną lub logistyczną.',
                        'Nadesłał wydawnictwa swojej poczty do Centralnego Archiwum Poczt Harcerskich.',
                        'Wyznaczył sobie dodatkowe zadanie mistrzowskie w porozumieniu z naczelnikiem macierzystej PH.',
                      ])
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_przyr',
          title: 'Przyrodnicze',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'przyrodnik',
                      title: 'Przyrodnik',
                      level: 1,
                      tasks: [
                        'Rozpoznał po sylwetkach i liściach dziesięć drzew (np. dąb, brzozę, klon, leszczynę, wierzbę, topolę, lipę, sosnę, świerk, jodłę, modrzew).',
                        'Rozpoznał na rysunku lub zdjęciu po pięć gatunków roślin i zwierząt chronionych występujących w Polsce.',
                        'Uczestniczył w wycieczce do lasu, ułożył i przedstawił w zastępie pięć zasad zachowania się w lesie.',
                        'Samodzielnie lub z zastępem zasadził drzewko w pobliżu swojego domu, na działce lub przy szkole.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_przyrody',
                      title: 'Przyjaciel przyrody',
                      level: 2,
                      tasks: [
                        'Wskazał na mapie Polski parki narodowe oraz znajdujące się w okolicy (np. w gminie lub powiecie) rezerwaty przyrody, parki krajobrazowe i wybrane pomniki przyrody. Wyjaśnił cele, dla których je utworzono.',
                        'Uczestniczył w wycieczce do rezerwatu przyrody lub parku narodowego. Zachowywał się zgodnie z obowiązującym tam regulaminem.',
                        'Brał udział w pracy na rzecz środowiska naturalnego, np. w parku, na szlaku turystycznym, podczas imprezy ekologicznej.',
                        'W swoim domu oszczędza wodę i energię elektryczną, dba o wykorzystanie surowców wtórnych.',
                      ]),
                  SprawData(
                      id: 'znawca_przyrody',
                      title: 'Znawca przyrody',
                      level: 3,
                      tasks: [
                        'Skompletował biblioteczkę (książki, artykuły, foldery, adresy stron internetowych) o tematyce ekologicznej.',
                        'Poznał zasady ekologicznego obozowania. Zastosował je w praktyce.',
                        'Wziął udział w akcji na rzecz ratowania lub ochrony środowiska naturalnego.',
                        'Przygotował i przeprowadził zbiórkę na temat znaczenia przyrody dla zdrowia człowieka oraz potrzeby jej ochrony przed zagrożeniami cywilizacyjnymi.',
                        'Zapoznał się z celami i działaniami kilku wybranych organizacji ekologicznych.',
                      ]),
                  SprawData(
                      id: 'ekolog',
                      title: 'Ekolog',
                      level: 4,
                      tasks: [
                        'Poznał systematykę roślin i zwierząt. Poznał rośliny i zwierzęta chronione w Polsce.',
                        'przedstawił w interesującej formie bogactwo polskich lasów oraz znaczenie lasów dla przyszłości człowieka na Ziemi.',
                        'Wskazał występujące w polskich lasach zagrożenia dotyczące drzew, ptaków i zwierząt.',
                        'Poznał zasady ekologicznego obozowania. Zastosował je w praktyce.',
                        'Wyznaczył sobie dodatkowe zadania mistrzowskie.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'przyjaciel_roslin',
                      title: 'Przyjaciel roślin',
                      level: 1,
                      tasks: [
                        'Opiekował się roślinami w domu, w harcówce, w szkolnej pracowni lub na działce przez cały okres próby na sprawność.',
                        'Odwiedził ogród botaniczny (był na łące, w lesie, w polu itp.) i opowiedział na zbiórce o swoich obserwacjach dotyczących występującej tam roślinności.',
                        'Rozpoznał na zdjęciach i w naturze po pięć roślin trujących, leczniczych, chwastów i zbóż.',
                        'Zna rośliny i owoce jadalne występujące w lesie. Przygotował z nich posiłek, np. podwieczorek dla zastępu.',
                      ]),
                  SprawData(
                      id: 'zielarz',
                      title: 'Zielarz',
                      level: 2,
                      tasks: [
                        'Prowadził zbiór roślin (zna kalendarz ich zbierania i wie, jakie części roślin należy zbierać). Zbiera, suszy i przechowuje rośliny tak, aby nie straciły swoich właściwości.',
                        'Przygotował do apteczki drużyny zestaw ziół oraz krótki opis sposobu ich stosowania.',
                        'Przygotował informację o wybranych 15 roślinach chronionych występujących w Polsce i przedstawił ją na zbiórce zastępu, drużyny lub w klasie.',
                        'Przyrządził ziołowy środek przydatny w leczeniu, kosmetyce lub gospodarstwie domowym.',
                        'Rozpoznał grzyby jadalne i trujące.',
                      ]),
                  SprawData(
                      id: 'botanik',
                      title: 'Botanik',
                      level: 3,
                      tasks: [
                        'przedstawił na zbiórce drużyny wybrane gatunki występujących na świecie roślin zagrożonych wyginięciem ("czerwona księga").',
                        'Opowiedział w drużynie o interesujących roślinach, występujących w rezerwacie lub parku narodowym w swojej okolicy.',
                        'przedstawił zastępowi lub drużynie swoje zbiory: albumy, atlasy i inne publikacje na temat roślin, zaprezentował ich zawartość.',
                        'Zorganizował i poprowadził wyprawę drużyny (lub klasy) w celu poznania środowiska roślinnego (np. lasu, łąki) lub wyprawę do ogrodu botanicznego albo muzeum przyrodniczego.',
                        'Wykonał projekt przydomowego, działkowego lub przyszkolnego ogródka.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'kwiaciarz',
                      title: 'Kwiaciarz',
                      level: 2,
                      tasks: [
                        'W bukiecie 15 kwiatów rozpoznał kwiaty ogrodowe, doniczkowe, polne i chwasty.',
                        'Wie, w jakich miesiącach i porach roku kwitną w Polsce poszczególne kwiaty.',
                        'Założył w czasie próby własny ogródek kwiatowy, np. na klombie, w doniczkach, na działce.',
                        'Ułożył bukiet z kwiatów lub przedstawił na zbiórce foldery, zdjęcia i rysunki najciekawszych okazów.',
                      ]),
                  SprawData(
                      id: 'milosnik_kwiatow',
                      title: 'Miłośnik kwiatów',
                      level: 3,
                      tasks: [
                        'Ułożył bukiety ze świeżych kwiatów na różne okazje.',
                        'Wie, co to jest ikebana. Wykonał kwiatową dekorację na wybraną uroczystość w rodzinie, szkole lub drużynie.',
                        'Zastosował suszone rośliny do wykonania różnych ozdób.',
                        'Pielęgnował w czasie próby rzadki lub trudny w uprawie okaz rośliny. Swoje doświadczenia z uprawy przedstawił w zastępie.',
                        'Wie, jakie kwiaty można uprawiać w Polsce i jakie sprowadza się z zagranicy.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'lesnik',
                      title: 'Leśnik',
                      level: 3,
                      tasks: [
                        'Obserwował życie lasu o świcie, o zmierzchu i w nocy. Wytropił zwierzę, wskazał jego legowisko (norę, gniazdo]), rozpoznaje jego głos, zna jego zwyczaje.',
                        'Odbył z leśniczym obchód lasu, wykazał się znajomością drzew i umiejętnością rozpoznawania ich wieku.',
                        'Zorganizował dla młodszych zwiad lub wycieczkę do lasu, pokazał jego bogactwo.',
                        'Uczestniczył w pracach leśnych − np. w szkółce, przy oczyszczaniu pasów przeciwpożarowych lub sadzeniu drzew.',
                        'przedstawił na zbiórce drużyny bogactwo polskich lasów i ich znaczenie dla przyszłości człowieka na Ziemi. Wskazał występujące w polskich lasach zagrożenia drzew, ptaków i zwierząt.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'ogrodnik',
                      title: 'Ogrodnik',
                      level: 3,
                      tasks: [
                        'Na zbiórce zastępu przedstawił znaczenie gleby i nawożenia dla uprawy warzyw.',
                        'Rozpoznał nasiona marchwi, pietruszki, sałaty, ogórków i buraczków. Wyhodował własne rośliny z nasion i rozsady.',
                        'Przygotował kompost z odpadów ogrodniczych.',
                        'Zaplanował siew i zbieranie plonów na działce lub w ogrodzie.',
                        'Przygotował wybrane warzywa do przechowania podczas zimy.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'sadownik',
                      title: 'Sadownik',
                      level: 3,
                      tasks: [
                        'Rozpoznał po pniach i liściach popularne drzewa owocowe: jabłonie, grusze, śliwy, wiśnie, czereśnie.',
                        'Zerwał i ułożył w skrzynce owoce, przygotowując je do transportu.',
                        'Przygotował owoce do składowania przez zimę.',
                        'Brał udział w pielęgnacji sadu, szczepieniu drzewek i zabezpieczeniu go przed szkodnikami.',
                        'Przedstawił na zbiórce zastępu lub drużyny zebrane przez siebie artykuły i poradniki dotyczące sadownictwa.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'przyjaciel_zwierzat',
                      title: 'Przyjaciel zwierząt',
                      level: 1,
                      tasks: [
                        'Dowiedział się, jakie zwierzęta zamieszkują najbliższe lasy i którym z nich należy pomagać zimą. Wziął udział w zimowym dokarmianiu.',
                        'Rozpoznał tropy kilku dzikich zwierząt, np. dzika, sarny, zająca.',
                        'Był na wycieczce w lesie, w polu lub na łące. Rozpoznał głosy pięciu żyjących tam zwierząt. Nagrał głosy zwierząt i odtworzył je na zbiórce drużyny.',
                        'Obserwował przez miesiąc życie zwierząt domowych, zapisywał najciekawsze spostrzeżenia, opowiedział o nich na zbiórce zastępu.',
                      ]),
                  SprawData(
                      id: 'znawca_zwierzat',
                      title: 'Znawca zwierząt',
                      level: 2,
                      tasks: [
                        'Rozpoznał na zdjęciach i rysunkach 15 gatunków zwierząt.',
                        'Przygotował informację o zwierzętach chronionych w Polsce oraz o zwierzętach niebezpiecznych zamieszkujących w Polsce i przedstawił ją na zbiórce zastępu lub drużyny.',
                        'Pomógł w przetrwaniu zimy potrzebującym zwierzętom (ptakom, zwierzętom w lesie, bezdomnym psom).',
                        'Wie, jakie niebezpieczne zwierzęta żyją w Polsce. Opowiedział koleżankom lub kolegom, jak należy postępować w przypadku spotkania z nimi.',
                      ]),
                  SprawData(
                      id: 'zoolog',
                      title: 'Zoolog',
                      level: 3,
                      tasks: [
                        'przedstawił wybrane gatunki zwierząt żyjących na całym świecie, zagrożonych wyginięciem ("czerwona księga").',
                        'Zna systematykę zwierząt. przedstawił na zbiórce lub na lekcji życie wybranego gatunku.',
                        'Zaprezentował zastępowi lub drużynie swoje zbiory: albumy, atlasy i inne publikacje na temat zwierząt, opowiedział o ich zawartości.',
                        'Zorganizował dla zastępu wyprawę do zoo, muzeum przyrodniczego lub lasu, opowiedział o wybranych gatunkach zwierząt. Nauczył zastęp sposobów obserwacji zwierząt.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '8',
                sprawData: [
                  SprawData(
                      id: 'pszczelarz',
                      title: 'Pszczelarz',
                      level: 3,
                      tasks: [
                        'Od wiosny do jesieni pracował w pasiece i prowadził notatnik swoich czynności.',
                        'Nauczył się zabezpieczać pszczoły przed zimą.',
                        'Potrafi postępować w przypadku użądlenia przez owady.',
                        'Opowiedział na zbiórce o właściwościach leczniczych produktów wytwarzanych przez pszczoły.',
                        'Urządził w harcówce, szkole lub w gminie wystawę wydawnictw dotyczących pszczelarstwa i produktów wytworzonych przez pszczoły.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '9',
                sprawData: [
                  SprawData(
                      id: 'hodowca',
                      title: 'Hodowca',
                      level: 2,
                      tasks: [
                        'Przeczytał literaturę dotyczącą hodowli wybranych zwierząt.',
                        'Przygotował dla swoich zwierząt pomieszczenia i utrzymuje je w stałej czystości.',
                        'Zaprezentował na zbiórce zastępu wyhodowane przez siebie zwierzęta, opowiedział o ich zwyczajach, sposobach żywienia i zapobiegania chorobom.',
                        'Zwraca uwagę osobom, które źle odnoszą się do zwierząt i ptaków.',
                      ]
                  )
                ]
            )
          ]
      ),

      SprawGroupData(
          id: 'spraw_samaryt',
          title: 'Samarytańskie',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'higienista',
                      title: 'Higienista',
                      level: 1,
                      tasks: [
                        'Założył opatrunek, nakleił plaster z opatrunkiem, zabandażował kończynę, wykorzystał do założenia opatrunku chustę trójkątną.',
                        'Zabezpieczył się przed przeziębieniem, odmrożeniem.',
                        'Potrafi prawidłowo postąpić w przypadku skaleczenia, otarcia nogi, niewielkiego oparzenia, krwotoku z nosa, użądlenia przez pszczołę lub osę.',
                        'Zmierzył temperaturę. Wie, jaka jest prawidłowa temperatura ciała.',
                        'Poznał alarmowe numery telefonów. Wie, kiedy i w jaki sposób należy z nich korzystać.',
                      ]),
                  SprawData(
                      id: 'sanitariusz',
                      title: 'Sanitariusz',
                      level: 2,
                      tasks: [
                        'Poznał zasady kompletowania apteczki. Skompletował apteczkę osobistą.',
                        'Potrafi prawidłowo postąpić w przypadku:'
                            '\n• krwotoku (np. z kończyny), stłuczenia, zaprószenia oka, omdlenia,'
                            '\n• konieczności unieruchomienia kończyny,'
                            '\n• konieczności udrożnienia górnych dróg oddechowych.',
                        'Pełnił służbę samarytańską na wycieczce, biwaku lub obozie.',
                        'Prawidłowo sprawdził tętno.',
                      ]),
                  SprawData(
                      id: 'ratownik',
                      title: 'Ratownik',
                      level: 3,
                      tasks: [
                        'Skompletował torbę pierwszej pomocy dla drużyny na rajd, wycieczkę lub biwak.',
                        'Wie, jak postąpić w przypadku zatrucia pokarmowego (substancjami chemicznymi, grzybami, zepsutą żywnością).',
                        'Potrafi udzielić pomocy w przypadku utraty przytomności. Ułożył poszkodowanego w pozycji bocznej bezpiecznej.',
                        'Umie zorganizować transport chorego. Zastosował różne sposoby przenoszenia rannych. Kierując patrolem noszowym, pokonał kilka przeszkód (zejście do dołu, podejście pod górę, pokonanie ogrodzenia).',
                        'Brał udział w zawodach w ratownictwie lub ratowniczej grze terenowej. Pełnił służbę w ambulatorium obozowym lub podczas dużej imprezy, opiekował się chorym.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskiej pełni odznaka "Ratownik ZHP".'
                  ),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'lider_zdrowia',
                      title: 'Lider zdrowia',
                      level: 3,
                      tasks: [
                        'Włączył do swojego postępowania jak najwięcej elementów zdrowego stylu życia (np. zdrowe odżywianie, higiena nauki i pracy, zwalczanie stresu, uprawianie sportu).',
                        'Wskazał rówieśnikom korzyści płynące ze zdrowego trybu życia.',
                        'Zorganizował i przeprowadził z drużyną akcję promującą zdrowy tryb życia.',
                        'Potrafi wymienić metody i ośrodki leczenia uzależnienia od nikotyny, alkoholu i narkotyków.',
                        'Wykorzystuje posiadaną wiedzę na temat uzależnień − od nikotyny, alkoholu i narkotyków − w codziennym postępowaniu i kontaktach z innymi ludźmi.',
                      ])
                ]
            )
          ]),

      SprawGroupData(
          id: 'spraw_hsg',
          title: 'Harcerska służba graniczna',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'straznik_granicy',
                      title: 'Strażnik granicy',
                      level: 1,
                      tasks: [
                        'Zna podstawowe zadania Straży Granicznej i jej strukturę.',
                        'Zna numer telefonu najbliższej jednostki Straży Granicznej.',
                        'Zna przebieg linii granicy w rejonie zamieszkania i potrafi wskazać jej charakterystyczne punkty.',
                        'Potrafi skrycie obserwować innych (samemu nie będąc widzianym). Sporządził meldunek z zaobserwowanych zdarzeń.',
                        'Potrafi wymienić nazwy kilku miejscowości na terytorium państwa sąsiedniego w pobliżu swojego miejsca zamieszkania.',
                      ]),
                  SprawData(
                      id: 'tropiciel_sladow',
                      title: 'Tropiciel śladów',
                      level: 2,
                      tasks: [
                        'Umie rozpoznawać ślady ludzi, określając przy tym: ich wiek, kierunek marszu, długość kroku i sposób poruszania się.',
                        'Przeprowadził wywiad z funkcjonariuszem Straży Granicznej na temat rozpoznawania i zabezpieczania śladów.',
                        'Przeprowadził w terenie zajęcia dla zastępu z rozpoznawania śladów.',
                        'Samotnie spędził w terenie 8 godzin, opisując ślady ujawnione na drogach dojazdu do linii granicy.',
                        'Sporządził odlew gipsowy śladu człowieka.',
                      ]),
                  SprawData(
                      id: 'pogranicznik',
                      title: 'Pogranicznik',
                      level: 3,
                      tasks: [
                        'Zna podział pogranicza (pas drogi granicznej, strefa nadgraniczna).',
                        'Umie wymienić elementy służby granicznej.',
                        'Zna strukturę Straży Granicznej.',
                        'Potrafi wymienić nazwy przejść granicznych w swoim województwie.',
                        'Zna podstawowe fakty z historii polskich formacji granicznych.',
                      ])
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_spol_obyw',
          title: 'Społeczne i obywatelskie',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'mlody_obywatel',
                      title: 'Młody obywatel',
                      level: 1,
                      tasks: [
                        'Poznał historię godła i barw narodowych. Wie, co oznaczają i potrafi się wobec nich zachować.',
                        'Potrafi zaśpiewać hymn państwowy.',
                        'Odszukał na mapie Polski miejsca, które dotąd odwiedził lub chciałby odwiedzić.',
                        'Zapoznał się z częścią statutu szkoły, zawierającą prawa i obowiązki ucznia. Angażuje się w życie swojej klasy.',
                        'Poznał daty polskich świąt narodowych. Wie, na pamiątkę jakich wydarzeń zostały ustanowione. Przygotował z zastępem zbiórkę z okazji jednego z nich.',
                      ]),
                  SprawData(
                      id: 'obywatel',
                      title: 'Obywatel',
                      level: 2,
                      tasks: [
                        'Współpracuje z samorządem szkolnym. Przygotował kampanię promującą prawa i obowiązki uczniowskie.',
                        'Angażuje się w życie szkoły.',
                        'Poznał najważniejsze fakty z historii najnowszej Polski.',
                        'Dowiedział się, gdzie znajdują się najważniejsze urzędy w jej lub jego miejscowości i gminie. Przygotował mapę miasta przedstawiającą ich lokalizację oraz główne sprawy, jakimi się zajmują.',
                        'Zorganizował dla drużyny wycieczkę do urzędu gminy lub miasta.',
                      ]),
                  SprawData(
                      id: 'obywatel_rzeczypospolitej',
                      title: 'Obywatel Rzeczypospolitej',
                      level: 3,
                      tasks: [
                        'Zapoznał się z najważniejszymi prawami i obowiązkami obywateli Rzeczypospolitej Polskiej.',
                        'Wie, na czym polega demokracja. Brał udział w demokratycznym podejmowaniu decyzji.',
                        'Zgromadził własną biblioteczkę książek o historii najnowszej Polski. W drużynie, zastępie, klasie przygotował i przeprowadził grę o historii najnowszej kraju.',
                        'Orientuje się w bieżących wydarzeniach politycznych, gospodarczych i kulturalnych kraju. Zapoznał się z podziałem polskiej sceny politycznej. Dowiedział się, kto sprawuje najważniejsze funkcje państwowe.',
                        'Angażuje się w pracę parlamentu młodzieży lub jednej z młodzieżowych organizacji. W swojej działalności godnie reprezentuje ZHP.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'znawca_wlasnej_miejscowosci',
                      title: 'Znawca własnej miejscowości',
                      level: 2,
                      tasks: [
                        'Na podstawie wywiadów z mieszkańcami ustalił najważniejsze wydarzenia w swojej miejscowości w XX wieku.',
                        'Dowiedział się, czy istnieje w jej lub jego miejscowości lista honorowych mieszkańców. Wie, kto jest na tej liście i dlaczego.',
                        'przedstawił historię swojej miejscowości w formie pisanej (artykuł w gazecie) lub ustnej (gawęda na zbiórce).',
                        'Zorganizował wraz z zastępem grę miejską dla drużyny.',
                        'Dowiedział się, jak przedstawia się aktualna sytuacja mieszkańców (gdzie pracują, jak spędzają czas wolny, co robią najmłodsi mieszkańcy itd.).',
                      ]),
                  SprawData(
                      id: 'przewodniczka_po_regionie',
                      title: 'Przewodniczka po regionie',
                      level: 2,
                      tasks: [
                        'Wziął udział w zwiadzie etnograficznym zastępu w wybranej okolicy. Zwrócił uwagę na styl budownictwa, elementy sztuki ludowej, język mieszkańców.',
                        'Zaprezentował drużynie swoje spostrzeżenia, zdjęcia, szkice oraz co najmniej jeden przedmiot będący wyrobem rzemiosła ludowego z wybranej okolicy.',
                        'Skompletował biblioteczkę zawierającą pozycje opisujące interesujący ją lub jego region.',
                        'Poznał co najmniej jeden taniec, piosenkę lub przyśpiewkę ludową z wybranego regionu.',
                      ]),
                  SprawData(
                      id: 'znawca_regionu',
                      title: 'Znawca regionu',
                      level: 3,
                      tasks: [
                        'Zwiedził z zastępem muzeum regionalne lub skansen.',
                        'Wskazał atuty kulturowe regionu i zagrożenia dla jego rozwoju.',
                        'Poznał główne problemy ochrony środowiska swojego regionu. Zainicjował w drużynie działania zmierzające do ich rozwiązania.',
                        'Odwiedza strony internetowe własnego województwa. Śledzi na bieżąco ukazujące się tam informacje.',
                        'Nawiązał kontakt z redakcją lokalnego radia lub gazety, pomógł w przygotowaniu cyklu artykułów o ciekawostkach regionu lub zamieścił artykuł o regionie na portalu dziennikarstwa obywatelskiego.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'etnograf',
                      title: 'Etnograf',
                      level: 3,
                      tasks: [
                        'Poznał gwarę regionu, w którym mieszka, lub język mniejszości zamieszkującej na tym terenie i inne charakterystyczne elementy kultury regionu.',
                        'przedstawił swoje zbiory opowieści i pieśni ludowych oraz publikacji o działalności twórców ludowych, zespołów folklorystycznych.',
                        'Na wycieczce drużyny pełnił rolę przewodnika po obiektach kultury ludowej.',
                        'Zaznaczył na mapie Polski regiony etnograficzne oraz scharakteryzował je.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'mlody_europejczyk',
                      title: 'Młody Europejczyk',
                      level: 1,
                      tasks: [
                        'Dowiedział się, kim był Robert Schuman i czym jest Unia Europejska.',
                        'Przygotował do harcówki mapę Polski z zaznaczonymi sąsiadami naszego kraju.',
                        'Przygotował dla zastępu lub drużyny lub szkoły konkurs na najlepszy plakat o Europie.',
                        'Zna symbole jednoczącej się Europy. Wykonał flagę europejską do harcówki.',
                      ]),
                  SprawData(
                      id: 'europejczyk',
                      title: 'Europejczyk',
                      level: 2,
                      tasks: [
                        'Dowiedział się, czym była Deklaracja Schumana i jakie miała znaczenie w pokojowym jednoczeniu kontynentu.',
                        'Umie wymienić kraje należące do Unii Europejskiej.',
                        'Przygotował dla drużyny kwiz o Europie, którego pytania dotyczyły krajów, stolic, głównych rzek i najbardziej znanych zabytków.',
                        'Poznał hymn Unii Europejskiej. Na zbiórce nauczył innych go śpiewać.',
                        'Poznał główne instytucje zjednoczonej Europy.',
                      ]),
                  SprawData(
                      id: 'obywatel_europy',
                      title: 'Obywatel Europy',
                      level: 3,
                      tasks: [
                        'Poznał główne etapy tworzenia się Unii Europejskiej. Potrafił wymienić założycieli zjednoczonej Europy. Dowiedział się, jaki mieli wkład w integrowanie Europy.',
                        'Poznał instytucje europejskie oraz ich kompetencje. Przygotował do harcówki planszę przedstawiającą te instytucje.',
                        'Dowiedział się, czym jest obywatelstwo europejskiej i jakie płyną z niego korzyści.',
                        'Rozumie proces integracji Polski z instytucjami europejskimi.',
                        'Przygotował dla drużyny debatę nad przyszłością Europy.',
                      ]),
                  SprawData(
                      id: 'znawca_europy',
                      title: 'Znawca Europy',
                      level: 4,
                      tasks: [
                        'Poznał wkład polskich myślicieli w proces jednoczenia Europy.',
                        'Poznał historię integracji europejskiej. Rozumie różne podejścia do przyszłości Europy.',
                        'Dowiedział się, jaka jest procedura podejmowania decyzji w Unii Europejskiej oraz jaka jest waga polskiego głosu.',
                        'Przygotował warsztaty na temat integracji europejskiej lub zagadnienia szczegółowego dla wybranej grupy.',
                        'Dowiedział się, jakie instytucje oraz organizacje w Polsce zajmują się tematyką integracji europejskiej. Zgłosił się do współpracy z Regionalnym Centrum Integracji Europejskiej lub inną instytucją.',
                        'Poznał sposoby pozyskiwania funduszy europejskich, np. program "Młodzież", programy dla studentów.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'znawca_praw_czlowieka',
                      title: 'Znawca praw człowieka',
                      level: 2,
                      tasks: [
                        'Wie, czym są prawa i wolności człowieka. Rozumie pojęcie godności.',
                        'Wie, jakie dokumenty międzynarodowe ustanawiają podstawowe prawa i wolności człowieka. Przygotował do harcówki lub klasy plakat z katalogiem podstawowych praw i wolności człowieka.',
                        'Wie, jakie organizacje pozarządowe w Polsce podejmują tematykę praw człowieka.',
                        'Wie, w których krajach prawa człowieka nadal są łamane. Przygotował wraz z drużyną akcję propagującą prawa człowieka. W tym celu nawiązał współpracę z organizacją zajmującą się tą problematyką.',
                      ]),
                  SprawData(
                      id: 'obronca_praw_czlowieka',
                      title: 'Obrońca praw człowieka',
                      level: 3,
                      tasks: [
                        'Wie, skąd pochodzi idea praw człowieka oraz jakie wydarzenia miały największy wpływ na ich rozwój. Rozumie, czym są kolejne generacje praw człowieka.',
                        'Zna najważniejsze dokumenty międzynarodowe dotyczące praw człowieka. Wie, które organizacje międzynarodowe odpowiadają za przestrzeganie praw człowieka.',
                        'Wybrał jedną dziedzinę praw człowieka, którą poznał szczególnie dokładnie (np. prawa kobiet, prawa dzieci, prawa uchodźców).',
                        'Przygotował zbiórkę drużyny na temat wybranej grupy i jej praw oraz akcję (w szczepie, hufcu, szkole) na rzecz ochrony tej grupy. W tym celu nawiązał współpracę z Amnesty International lub inną organizacją.',
                        'Wie, w jakich krajach prawa człowieka są nadal łamane. Przygotował w dowolnej formie prezentację na ten temat, przedstawił ją na zbiórce drużyny.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'mlody_wyborca',
                      title: 'Młody wyborca',
                      level: 3,
                      tasks: [
                        'Wyraził i uzasadnił swoje zdanie na temat udziału harcerzy i harcerek w samorządzie szkolnym.',
                        'Określił, w jaki sposób jej lub jego zastęp i zastępowy uczestniczą w samorządnym realizowaniu zadań w drużynie.',
                        'Wziął udział w tworzeniu programu wyborczego do samorządu szkolnego.',
                        'Zapoznał się z podstawowymi zasadami wyborczymi w Polsce. Wie, jakie wybory odbywają się w naszym kraju i co to jest referendum.',
                      ]),
                  SprawData(
                      id: 'wyborca',
                      title: 'Wyborca',
                      level: 4,
                      tasks: [
                        'Wyraził i uzasadnił swoje zdanie na temat udziału obywateli w formach demokratycznego sprawowania władzy samorządowej i państwowej. Zna istotę społeczeństwa obywatelskiego.',
                        'Potrafi wskazać, na czym polega samorządność drużyny w realizacji zadań.',
                        'Prześledził programy partii politycznych w Polsce, zwracając uwagę na główne problemy społeczne, na które one odpowiadają. Zapoznał się z układami sił partyjnych w Niemczech, Anglii i Francji oraz w innych krajach.',
                        'Wziął udział w wyborach do samorządu uczniowskiego lub władz samorządowych i państwowych.',
                        'Rozumie mechanizmy sprawowania władzy w państwie demokratycznym, rolę wyborów i zasadę pomocniczości państwa.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'negocjator',
                      title: 'Negocjator',
                      level: 3,
                      tasks: [
                        'Przeprowadził ćwiczenie, dyskusję lub debatę, podczas której skuteczne negocjował między dorosłymi a dziećmi.',
                        'przedstawił zastępowi podstawowe zasady negocjacji.',
                        'Przeprowadził dla zastępu warsztaty z komunikacji.',
                        'Doprowadził do porozumienia między stronami konfliktu.',
                        'Łagodził konflikty w zastępie, klasie lub drużynie różnymi sposobami.',
                      ]),

                ]
            ),
            SprawFamilyData(
                id: '8',
                sprawData: [

                  SprawData(
                      id: 'organizator_nauki',
                      title: 'Organizator nauki',
                      level: 1,
                      tasks: [
                        'Opracował tygodniowy rozkład zajęć, w którym uwzględnił wszystkie swoje zajęcia (lekcje, zajęcia pozalekcyjne, obowiązki domowe, czas odpoczynku).',
                        'Zorganizował sobie miejsce do nauki w domu (oświetlenie, ustawienie krzesła itp.).',
                        'przedstawił kolegom zestaw ćwiczeń odprężających, stosowanych podczas przerw w nauce.',
                        'Dowiedział się, w jakich zajęciach pozalekcyjnych i na jakich zasadach można brać udział w szkole, okolicznych klubach lub domach kultury. Wyniki zwiadu przedstawił na zbiórce zastępu. Zrobił mapkę okolicy, z informacjami, gdzie odbywają się zajęcia pozalekcyjne.',
                        'Dowiedział się, jakie czasopisma popularnonaukowe są dostępne na rynku, zastanowił się, które są przeznaczone dla niego, przeczytał jeden wybrany numer i zaprezentował zastępowi najciekawszy artykuł w dowolnej formie, zwracając uwagę na różne możliwości poszerzania wiedzy.',
                      ]),
                  SprawData(
                      id: 'organizator_czasu',
                      title: 'Organizator czasu',
                      level: 2,
                      tasks: [
                        'Planując swój czas, korzysta z kalendarza i terminarza.',
                        'przedstawił zastępowi różne propozycje aktywnego spędzenia wolnego czasu i zorganizował wybraną przez zastęp propozycję wspólnego spędzenia czasu.',
                        'Przeprowadził sondę wśród uczniów klasy lub szkoły na temat spędzania wolnego czasu, z wynikami sondy zapoznał drużynę.',
                        'Zna zasady gospodarowania czasem.',
                      ]),
                  SprawData(
                      id: 'planista',
                      title: 'Planista',
                      level: 3,
                      tasks: [
                        'Zorganizował dla drużyny udział w wybranym przedsięwzięciu pozaharcerskim.',
                        'Współorganizował biwak drużyny, brał udział w podziale zadań, był odpowiedzialny za wybrane zadania (np. lista zakupów, dojazdy, zamówienie autokaru).',
                        'Sporządził plan, program i preliminarz wybranego przedsięwzięcia drużyny.',
                        'Zaplanował kilka ciekawych propozycji do planu pracy drużyny, propozycje przedstawił radzie drużyny, a po zatwierdzeniu uczestniczył w ich realizacji.',
                      ]),

                ]
            ),
            SprawFamilyData(
                id: '9',
                sprawData: [

                  SprawData(
                      id: 'starsza_siostra_-_starszy_brat',
                      title: 'Starsza siostra - Starszy brat',
                      level: 1,
                      tasks: [
                        'Opiekował się młodszym dzieckiem przez kilka godzin, umiejętnie je zabawiając.',
                        'Pod opieką rodziców zadbał o powierzone dziecko:'
                            '\n• przestrzegał godzin karmienia,'
                            '\n• przygotował do wyjścia na spacer w odpowiednim ubraniu,'
                            '\n• towarzyszył przy toalecie porannej i wieczornej,'
                            '\n• ułożył do snu.',
                        'Potrafi zapewnić bezpieczeństwo zabawy w domu i na spacerze.',
                        'Przygotował i przeprowadził grę lub zabawę dla dzieci w wieku przedszkolnym.',
                      ]),
                  SprawData(
                      id: 'piastun',
                      title: 'Piastun',
                      level: 2,
                      tasks: [
                        'Systematycznie opiekował się młodszym dzieckiem (rodzeństwem, dzieckiem sąsiadów itp.) przez dłuższy okres (miesiąc, wakacje):'
                            '\n• przygotowywał odpowiednie posiłki,'
                            '\n• wyprowadzał na spacer w odpowiednim ubraniu,'
                            '\n• mył i kładł do snu,'
                            '\n• zapewniał bezpieczną zabawę,'
                            '\n• pomagał w nauce (w przypadku opieki nad dzieckiem w wieku szkolnym).',
                        'Własnoręcznie przygotował niespodziankę dla dziecka (zabawka, ubranko, ulubiony podwieczorek).',
                        'Opracował krótki wykaz książek, dotyczących opieki nad dzieckiem. Zapoznał zastęp z jedną z nich.',
                        'Opracował kilka interesujących zabaw i gier dla dzieci.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '10',
                sprawData: [
                  SprawData(
                      id: 'pomocna_dlon',
                      title: 'Pomocna dłoń',
                      level: 1,
                      tasks: [
                        'Opiekował się młodszym rodzeństwem lub innym dzieckiem pod nieobecność rodziców, zapewniając bezpieczeństwo i przygotowując posiłki.',
                        'Pomagał rodzicom w organizacji dużego rodzinnego wydarzenia (remont, uroczystość, przeprowadzka).',
                        'Opiekował się chorym domownikiem lub sąsiadem, podając posiłki i lekarstwa oraz umilając czas.',
                        'Wyręczył inną osobę w wykonaniu jakiegoś jej obowiązku.',
                      ]),
                  SprawData(
                      id: 'uczynny',
                      title: 'Uczynny',
                      level: 2,
                      tasks: [
                        'Samodzielnie lub razem z zastępem dotarł do osób potrzebujących pomocy w okolicy (osoby starsze, niepełnosprawne, samotne]), przedstawił wykaz takich osób radzie drużyny.',
                        'Sprawdził, jakiej pomocy potrzebują od niego członkowie rodziny (rodzice, dziadkowie, rodzeństwo]), przyjął na siebie kolejny, nowy obowiązek rodzinny (np. pomoc w nauce rodzeństwu, pomoc w ogrodzie dziadkom, mycie samochodu rodziców) i wypełniał go rzetelnie przez co najmniej miesiąc.',
                        'Przez dłuższy okres, np. zimą, w wakacje, pomagał osobie starszej, niepełnosprawnej, samotnej, potrzebującej opieki.',
                        'Pełnił służbę w szkolnej stołówce, świetlicy lub bibliotece, pomagając młodszym.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '11',
                sprawData: [
                  SprawData(
                      id: 'domownik',
                      title: 'Domownik',
                      level: 1,
                      tasks: [
                        'Estetycznie nakrył stół do codziennego posiłku i uroczystego obiadu rodzinnego.',
                        'Posprzątał kuchnię, umieszczając wszystko na właściwym miejscu.',
                        'Zabezpieczył przed zepsuciem wędliny, masło, pieczywo, mleko.',
                        'Odkurzył mieszkanie, stosując właściwy sprzęt i środki do podłóg, mebli, dywanów.',
                        'Przygotował podwieczorek dla członków rodziny, zadbał o właściwy wystrój miejsca spożywania posiłku.',
                        'Pielęgnował kwiaty domowe (podlewanie, przesadzanie).',
                      ]),
                  SprawData(
                      id: 'gospodarz',
                      title: 'Gospodarz',
                      level: 2,
                      tasks: [
                        'Zrobił pranie, prawidłowo segregując rzeczy do prania, stosując odpowiednie proszki i płyny.',
                        'Pod opieką osoby dorosłej umył okna.',
                        'Zna środki czystości używane do utrzymania porządku w domu, wie, jak się je stosuje. Zna domowe sposoby i środki stosowane do czyszczenia, mycia różnych urządzeń domowych, zabezpieczania przed owadami itp.',
                        'Nauczył się posługiwać sprzętem gospodarstwa domowego.',
                        'Zrobił listę zakupów oraz zakupy potrzebne do całodziennego wyżywienia rodziny. Samodzielnie przygotował posiłek dla domowników.',
                      ]),
                  SprawData(
                      id: 'pani_domu_(pan_domu)',
                      title: 'Pani domu (Pan domu)',
                      level: 3,
                      tasks: [
                        'Przez kilka dni zajmował się prowadzeniem domu:'
                            '\n• utrzymywał czystość i porządek w mieszkaniu,'
                            '\n• przyrządzał wszystkie posiłki zgodnie z opracowanym przez siebie tygodniowym jadłospisem,'
                            '\n• zorganizował tygodniowe zakupy według wcześniej przygotowanej listy.',
                        'Zorganizował uroczystość rodzinną dla kilku osób, przygotował potrawy. Zadał o odpowiednią oprawę przyjęcia (muzyka, eleganckie nakrycie, wystrój pokoju).',
                        'Skompletował lub przejrzał apteczką domową. Po uzgodnieniu z rodzicami uzupełnił ewentualne braki.',
                        'Dokonał miesięcznych opłat za mieszkanie, telefon, gaz.',
                        'Odczytał liczniki na wodę i gaz, przygotował dom do dłuższej nieobecności (wyłączenie wody, gazu, zabezpieczenie mieszkania przed kradzieżą, zalaniem).',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '12',
                sprawData: [
                  SprawData(
                      id: 'opiekun_chorych',
                      title: 'Opiekun chorych',
                      level: 2,
                      tasks: [
                        'Opiekował się chorym w domu lub na obozie. Wykonywał następujące czynności:'
                            '\n• sprzątał w pomieszczeniu, w którym przebywał chory,'
                            '\n• ścielił łóżko i zmieniał pościel,'
                            '\n• podawał posiłki i lekarstwa według zaleceń lekarza.',
                        'Przygotował dietetyczny posiłek odpowiedni do rodzaju choroby osoby, którą się opiekował.',
                        'Pomógł chorej osobie w załatwieniu spraw osobistych, np. przekazując wiadomości do szkoły lub pracy, robiąc zakupy.',
                        'Zorganizował choremu rozrywkę, starając się ulżyć jego dolegliwościom.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '13',
                sprawData: [
                  SprawData(
                      id: 'historyk_rodzinny',
                      title: 'Historyk rodzinny',
                      level: 2,
                      tasks: [
                        'Poznał historię swojej rodziny, wykonał wykaz ważnych rodzinnych wydarzeń.',
                        'Uporządkował album rodzinny, opisał zdjęcia, ułożył je chronologicznie.',
                        'Odtworzył drzewo genealogiczne swojej rodziny przynajmniej trzy pokolenia wstecz, korzystając np. z ksiąg kościelnych lub dokumentów rodzinnych. Uporządkował dokumentację i pamiątki rodzinne (świadectwa, dyplomy, listy, pamiątki).',
                        'Prowadził kronikę rodziny, zapisał w niej np. kilka ciekawych przygód rodziny, wywiady przeprowadzone ze starszymi członkami rodziny, słowniczek pierwszych słów młodszego rodzeństwa.',
                        'Współorganizował i uczestniczył w rodzinnej wycieczce do miejsc ważnych dla rodziny (np. miejscowość, z której pochodzą dziadkowie, kościół, w którym brali ślub, miejsce, gdzie poznali się rodzice, miejsce walki, w której uczestniczył ktoś z rodziny).',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '14',
                sprawData: [
                  SprawData(
                      id: 'poszukiwacz_nieznanego_swiata',
                      title: 'Poszukiwacz nieznanego świata',
                      level: 2,
                      tasks: [
                        'Dowiedział się, gdzie w najbliższej okolicy mieszkają osoby niepełnosprawne.',
                        'Nawiązał kontakt z dzieckiem (rówieśnikiem) niepełnosprawnym, dowiedział się, na czym polega jego niepełnosprawność.',
                        'Zaprosił niepełnosprawnego kolegę na zbiórkę.',
                        'W dowolnej formie pomagał niepełnosprawnej koleżance lub niepełnosprawnemu koledze.',
                        'Poznał kilka zwrotów grzecznościowych w języku migowym.',
                      ]),
                  SprawData(
                      id: 'odkrywca_nieznanego_swiata',
                      title: 'Odkrywca nieznanego świata',
                      level: 3,
                      tasks: [
                        'Poznał system pomocy społecznej w swojej gminie, odnalazł instytucje wspomagające osoby niepełnosprawne.',
                        'Wraz z zastępem przeprowadził zwiad po swojej miejscowości, odnalazł miejsca trudne do pokonania przez osoby niepełnosprawne ruchowo. przedstawił projekt ich likwidacji.',
                        'Przygotował oraz przeprowadził kilka gier i zabaw na zbiórce zastępu, w której uczestniczyły też dzieci niepełnosprawne.',
                        'Przeprowadził krótką rozmowę w języku migowym, poznał technikę posługiwania się alfabetem Braille’a.',
                        'Brał udział w kweście ulicznej, sprzedaży cegiełek lub innej akcji zbierania pieniędzy na cele społeczne.',
                      ]),
                ]
            ),
            SprawFamilyData(
                id: '15',
                sprawData: [
                  SprawData(
                      id: 'znawca_krwiodawstwa',
                      title: 'Znawca krwiodawstwa',
                      level: 2,
                      tasks: [
                        'Wie, co to jest krew i zna jej rolę w organizmie człowieka.',
                        'Wie, kto może zostać honorowym dawcą krwi i gdzie w najbliższej okolicy można oddać krew.',
                        'Zaprosił na zbiórkę zastępu lub drużyny zasłużonego honorowego dawcę krwi.',
                        'Przygotował program na uroczystość lub apel z okazji Dni Honorowego Krwiodawstwa PCK albo wykonał plakat zachęcający do honorowego oddawania krwi.',
                        'Namówił co najmniej dwie osoby do oddania krwi.',
                      ]),
                  SprawData(
                      id: 'popularyzator_krwiodawstwa',
                      title: 'Popularyzator krwiodawstwa',
                      level: 3,
                      tasks: [
                        'Wie, jakie znaczenie mają poszczególne składniki krwi dla prawidłowego funkcjonowania organizmu człowieka oraz jakie choroby leczone są z wykorzystaniem leków krwiopochodnych i w jakich sytuacjach wykorzystywania jest krew dla ratowania zdrowia i życia człowieka.',
                        'Wie, jakie organizacje i instytucje zajmują się promocją krwiodawstwa i pobieraniem krwi.',
                        'Wraz z zastępem lub drużyną odwiedził regionalne centrum krwiodawstwa i krwiolecznictwa (punkt krwiodawstwa) lub wziął udział w otwartej akcji poboru krwi. Poznał procedury związane z pobieraniem krwi.',
                        'Przygotował prezentację multimedialną promującą honorowe krwiodawstwo, którą zaprezentował na zbiórce drużyny lub przed swoją klasą. Prezentację zamieścił na stronie internetowej.',
                        'Do oddania krwi namówił co najmniej trzy osoby.',
                      ]),
                  SprawData(
                      id: 'ambasador_krwiodawstwa',
                      title: 'Ambasador krwiodawstwa',
                      level: 4,
                      tasks: [
                        'Zna budowę tkanki krwi i rolę składników krwi dla prawidłowego funkcjonowania organizmu człowieka. Wie, jakie jest wykorzystanie poszczególnych składników krwi dla ratowania zdrowia i życia człowieka.',
                        'Potrafi omówić historię leczenia z wykorzystaniem krwi ludzkiej, w tym rozwój krwiodawstwa w Polsce. Zna zadania organizacji i instytucji zajmujących się organizacją i promocją krwiodawstwa w Polsce.',
                        'Odnalazł w swoim otoczeniu osobę, która otrzymała krew lub preparaty krwiopochodne. Przeprowadził z nią wywiad, który zaprezentował swojej drużynie.',
                        'Nawiązał kontakt z Klubem Honorowych Dawców Krwi PCK lub placówką publicznej służby krwi. Poznał drogę krwi od dawcy do biorcy, potrafi omówić etapy pobierania krwi i jej przygotowania dla celów leczniczych.',
                        'Zorganizował w środowisku szkolnym lub lokalnym akcję promującą honorowe krwiodawstwo. Do oddania krwi namówił co najmniej cztery osoby.',
                        'Do wyboru:'
                            '\na) chce oddać honorowo krew, prowadzi zdrowy styl życia, zapoznał się z kwestionariuszem dla krwiodawcy i sprawdził, czy spełnia wymagania dla dawcy (oprócz wieku) – dla osób poniżej 18 roku życia,'
                            '\nb) oddał honorowo krew – dla osób, które ukończyły 18 lat (nie dotyczy osób, który z powodów zdrowotnych nie zostały zakwalifikowane do oddania krwi).',
                      ])
                ]
            ),
          ]),

      SprawGroupData(
          id: 'spraw_sport',
          title: 'Sportowe',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'sportowiec',
                      title: 'Sportowiec',
                      level: 1,
                      tasks: [
                        'Interesuje się wybraną dyscypliną sportu i popularyzuje ją, wymienił nazwiska swoich ulubionych sportowców.',
                        'Codziennie wykonuje poranną gimnastykę.',
                        'Zademonstrował  swój zestaw ćwiczeń treningowych.',
                        'Zorganizował spotkanie z zawodnikiem lub trenerem wybranej dyscypliny albo zaprezentował film o życiu sportowców.',
                        'Spełnienie powyższych warunków jest podstawą do zdobywania następnych sprawności.',
                      ]),
                  SprawData(
                      id: 'nazwa_dyscypliny_np_pilkarz',
                      title: '[Nazwa dyscypliny] np. Piłkarz, Narciarz',
                      level: 2,
                      tasks: [
                        'Uprawia wybraną dyscyplinę sportu.',
                        'Zademonstrował  swoje umiejętności w tej dyscyplinie.',
                        'Zorganizował dla harcerzy zajęcia zapoznające z uprawianą dyscypliną sportu (pokazy, zawody, naukę zasad i techniki itd.).',
                        'Uczestniczył kilkakrotnie w zawodach sportowych, zawsze przestrzegając zasady fair play.',
                        'Stara się systematycznie poprawiać swoje wyniki.',
                      ]),
                  SprawData(
                      id: 'olimpijczyk',
                      title: 'Olimpijczyk',
                      level: 3,
                      tasks: [
                        'Uprawia wybraną dyscyplinę sportu pod fachowym kierunkiem.',
                        'Uczestniczył w olimpiadzie sportowej (np. szkolnej, obozowej, między szkolnej]), poprawiając swoje wyniki.',
                        'Spopularyzował ideę olimpijską w swoim środowisku: w szkole, w drużynie (szczepie).',
                        'Reprezentował szkołę na zawodach sportowych, starając się przyczynić do sukcesów swojej drużyny.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskich pełnią sportowe klasy mistrzowskie, uprawnienia trenera i instruktora wybranej dyscypliny sportu.'
                  ),


                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [

                  SprawData(
                      id: 'gimnastyk',
                      title: 'Gimnastyk',
                      level: 1,
                      tasks: [
                        'Opracował własne zestawy ćwiczeń w domu i na powietrzu.',
                        'Poznał sławne gimnastyczki i gimnastyków i ich kariery sportowe.',
                        'Prowadził gimnastykę zastępu, drużyny, grupy dzieci.',
                        'Brał udział w zawodach sportowych w drużynie, starając się osiągać najlepsze wyniki.',
                      ]),
                  SprawData(
                      id: 'mistrz_gimnastyki',
                      title: 'Mistrz gimnastyki',
                      level: 2,
                      tasks: [
                        'Nauczył się poprawnie wykonywać ćwiczenia z wybranego rodzaju gimnastyki.',
                        'Zrozumiał rolę ćwiczeń gimnastycznych dla organizmu.',
                        'Uczestniczy regularnie w zajęciach wybranej gimnastyki prowadzonych przez fachowca.',
                        'Dobrał muzykę do uprawianych przez siebie codziennie ćwiczeń.',
                        'Przeprowadził gimnastykę zastępu lub drużyny na obozie lub biwaku, zwracając uwagę na dokładność wykonywania ćwiczeń.',
                      ]),


                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [

                  SprawData(
                      id: 'mlody_plywak',
                      title: 'Młody pływak',
                      level: 1,
                      tasks: [
                        'Przepłynął 100 m, w tym połowę na plecach.',
                        'Wytrzymał pod wodą 20 sekund.',
                        'Nauczył się prawidłowo zakładać kamizelkę ratunkową.',
                        'Poznał zasady bezpieczeństwa i higieny kąpieli.',
                      ]),
                  SprawData(
                      id: 'plywak',
                      title: 'Pływak',
                      level: 2,
                      tasks: [
                        'Przepłynął 200 m, w tym połowę na plecach.',
                        'Skoczył do wody z wysokości co najmniej 1 m i przepłynął pod lustrem wody 10 m.',
                        'Wyciągnął przedmiot znajdujący się 1,5 m pod wodą.',
                        'Nauczył młodszych zakładania kamizelki ratunkowej i podawania koła ratunkowego.',
                        'Poznał zasady bezpieczeństwa kąpieli oraz ratowania tonącego.',
                      ]),


                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [

                  SprawData(
                      id: 'plywak_doskonaly',
                      title: 'Pływak doskonały',
                      level: 3,
                      tasks: [
                        'Przepłynął 400 m (dziewczęta) i 600 m (chłopcy) w wodzie stojącej lub 800 m (dziewczęta) i 1000 m (chłopcy) z prądem co najmniej dwoma stylami.',
                        'Przepłynął pod wodą 15 metrów.',
                        'Uczestniczył w wyznaczaniu kąpieliska zgodnie z przepisami.',
                        'Zademonstrował  w wodzie sposób ratowania tonącego.',
                      ],
                      comment: 'Funkcje sprawności mistrzowskich pełnią uprawnienia młodszego ratownika WOPR, ratownika WOPR i specjalna karta pływacka.'
                  )
                ]),
          ]),

      SprawGroupData(
          id: 'spraw_straz',
          title: 'Strażackie',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'strazak',
                      title: 'Strażak',
                      level: 1,
                      tasks: [
                        'Zna stopnie Państwowej Straży Pożarnej oraz stopnie funkcyjnych Ochotniczej Straży Pożarnej.',
                        'Potrafi wymienić podstawowe przyczyny powstawania pożarów.',
                        'Potrafi szybko ubrać się w osobiste uzbrojenie strażaka.',
                        'Zna rodzaje i wyposażenie węży oraz sprzęt do ich obsługi i zasady konserwacji.',
                        'Wspólnie z zastępem budował linię wężową.',
                      ]),
                  SprawData(
                      id: 'mechanik_sprzetu_pozarniczego',
                      title: 'Mechanik sprzętu pożarniczego',
                      level: 2,
                      tasks: [
                        'Zna zasady działania, budowę i obsługę motopompy.',
                        'Sprawnie posługuje się gaśnicą, hydronetką, kocem gaśniczym, bosakiem, sprzętem burzącym i tłumicą.',
                        'Potrafi wymienić środki transportowe używane przez straże pożarne.',
                        'Potrafi rozwinąć skróty określeń samochodów strażackich.',
                        'Potrafi udzielić pierwszej pomocy w przypadku oparzenia i porażenia prądem.',
                      ]),
                  SprawData(
                      id: 'strazak_ratownik',
                      title: 'Strażak ratownik',
                      level: 3,
                      tasks: [
                        'Potrafi zebrać informacje o stanie zaopatrzenia miejscowości w wodę oraz ustalić najdogodniejsze miejsce na ustawienie motopompy.',
                        'Zna rodzaje prądów gaśniczych wodnych.',
                        'Kierował budową linii wężowej oraz gaszeniem przez zastęp ognia podczas ćwiczeń.',
                        'Ukończył kurs pierwszej pomocy.',
                        'Prowadził służbową korespondencję radiową używając kryptonimów.',
                      ])
                ]
            )

          ]
      ),

      SprawGroupData(
          id: 'spraw_teren_krajozn_turyst',
          title: 'Terenoznawcze, krajoznawcze i turystyczne',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'obserwator',
                      title: 'Obserwator',
                      level: 1,
                      tasks: [
                        'Wyznaczył strony świata za pomocą busoli, słońca, gwiazd i drzew.',
                        'Poruszał się bezszelestnie po pomieszczeniu zamkniętym i w terenie, czołgając się i maskując swoją obecność. Rozpoznał w lesie ślady ludzi, zwierząt i pojazdów.',
                        'Uczestniczył w biegu terenowym poruszając się według znaków patrolowych.',
                        'Zapamiętał przebytą drogę w terenie leśnym i w mieście, wrócił nią samodzielnie bez błądzenia.',
                      ]),
                  SprawData(
                      id: 'terenoznawca',
                      title: 'Terenoznawca',
                      level: 2,
                      tasks: [
                        'Ocenił prawidłowo odległość od wyznaczonego punktu, wykorzystując zasady określania odległości w terenie.',
                        'Dokonał pomiaru niedostępnych obiektów w terenie: wysokości drzewa, szerokości rzeki.',
                        'Trafił do wyznaczonego miejsca w nieznanym terenie na podstawie szkicu lub mapy.',
                        'Poprowadził patrol w terenie, posługując się busolą i bezbłędnie docierając do miejsca oznaczonego na mapie.',
                        'Wytypował w nowym terenie miejsce na biwak drużyny, rozplanowując jego rozbicie.',
                      ]),
                  SprawData(
                      id: 'topograf',
                      title: 'Topograf',
                      level: 3,
                      tasks: [
                        'Wyznaczył strony świata według przedmiotów terenowych w nocy i w dzień oraz według słońca i zegarka.',
                        'Trafił według mapy do odległego o kilka kilometrów obiektu, wykonując w czasie marszu szkic drogi z zastosowaniem właściwej skali.',
                        'Naniósł na powiększony przez siebie wycinek mapy lub planu miasta uzyskane w czasie zwiadu terenowego informacje o znajdujących się tam ważnych obiektach.',
                        'Uzyskał informacje o ważnych obiektach w nieznanym terenie, korzystając z Internetu i naniósł je na przygotowywany dla potrzeb drużyny fragment planu miasta.',
                        'Przeszkolił młodszych w zakresie znajomości znaków patrolowych i topograficznych.',
                      ]),
                  SprawData(
                      id: 'kartograf',
                      title: 'Kartograf',
                      level: 4,
                      tasks: [
                        'Wykonał z pamięci szkic sytuacyjny terenu.',
                        'Dokonał pomiaru terenu nadającego się na urządzenie obozu lub dziecięcego placu zabaw. Wykonał dokładny plan.',
                        'Wykreślił mapę wybranego terenu (zaktualizował starą mapę) na potrzeby obozu, gry terenowej, rajdu itp.',
                        'Przygotował trasę imprezy na orientację i biegu terenowego z przeszkodami.',
                        'Przeprowadził w drużynie (szczepie) szkolenie z terenoznawstwa.',
                        'Wyznaczył sobie dodatkowe zadania mistrzowskie.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'wskazidroga',
                      title: 'Wskazidroga',
                      level: 1,
                      tasks: [
                        'W czasie gry lub zwiadu terenowego poprowadził zastęp do określonego miejsca odległego o 2−3 km, odszukał wyznaczony obiekt.',
                        'Na planie zaznaczył nazwy ulic i placów oraz ważne obiekty − ośrodek zdrowia, aptekę, pocztę, straż pożarną, posterunek policji itp.',
                        'Poznał najbliższy obiekt godny zwiedzenia (zabytek, muzeum, osobliwość przyrodniczą itp.) i opowiedział o nim na zbiórce zastępu.',
                        'Wyszukał interesujące informacje o swojej miejscowości w przewodniku, encyklopedii, Internecie oraz przedstawił je zastępowi.',
                      ]),
                  SprawData(
                      id: 'przewodnik_po...',
                      title: 'Przewodnik po...',
                      level: 2,
                      tasks: [
                        'Poznał historię swojego regionu. W sposób szczególny interesuje się wybranym okresem lub miejscem.',
                        'Opracował trasę kilkugodzinnej wycieczki i wykonał projekt folderu turystycznego o niej.',
                        'Nawiązał niezbędne kontakty z gospodarzem terenu oraz obiektów i placówek ujętych w opracowaniu propozycji trasy wycieczkowej.',
                        'Prowadził dla kolegów i koleżanek ze swojego środowiska lub przyjezdnych wycieczkę opracowaną przez siebie trasą.',
                      ]),
                  SprawData(
                      id: 'krajoznawca',
                      title: 'Krajoznawca',
                      level: 3,
                      tasks: [
                        'Oprowadził trzy wycieczki po swoim mieście (okolicy]), wykazując się znajomością jego historii, zabytków i ciekawych obiektów.',
                        'Pokierował sporządzeniem informacji o walorach turystycznych okolicy na podstawie zajęć terenowych i literatury (geografia i historia okolicy, system połączeń komunikacyjnych, przemysł i rolnictwo, obiekty historyczne i przyrodnicze, sztuka, zwyczaje ludowe itp.).',
                        'Zaplanował cykl wycieczek do miejsc ciekawych pod względem historycznym, przyrodniczym lub geograficznym, posługując się mapami i przewodnikami.',
                        'Zorganizował dla młodszych zwiad etnograficzny lub konkursy, np. znajomości stylów architektonicznych, z zakresu historii ruchu krajoznawczego, historii sztuki regionu.',
                        'Uczestniczył w trzech wycieczkach krajoznawczych w różnych regionach Polski.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'lazik',
                      title: 'Łazik',
                      level: 1,
                      tasks: [
                        'Skompletował ekwipunek turystyczny.',
                        'Uczestniczył w kilku wycieczkach, ubierając się stosownie do warunków terenowych i pogodowych, zabezpieczając się przed przegrzaniem, przemoczeniem oraz otarciem stóp.',
                        'Poprawnie spakował plecak, zabierając tylko rzeczy przydatne na wyprawie.',
                        'Poznał zasady poruszania się po drogach.',
                        'Uczestnicząc w wycieczkach i rajdach, zawsze zachowuje pogodę ducha, mimo trudów wędrowania.',
                      ]),
                  SprawData(
                      id: 'tramp',
                      title: 'Tramp',
                      level: 2,
                      tasks: [
                        'Odbył co najmniej pięć samodzielnych wypraw w promieniu kilku kilometrów od miejsca zamieszkania.',
                        'Poznał zasady bezpiecznego marszu (tempo, odpoczynek, obciążenie, przepisy ruchu drogowego).',
                        'Nocował w lesie bez namiotu, a także w nieznanej miejscowości, korzystając np. ze schroniska PTSM.',
                        'Zorganizował biwak zastępu (drużyny]), rozbijając go, a następnie likwidując bez pozostawienia śladów.',
                      ]),
                  SprawData(
                    id: 'wedrowiec',
                    title: 'Wędrowiec',
                    level: 3,
                    tasks: [
                      'Przedstawił na zbiórce drużyny najpiękniejsze regiony turystyczne w Polsce.',
                      'Zorganizował dla drużyny wycieczki o różnej tematyce, m.in. krajoznawcze, przyrodnicze, historyczne.',
                      'W czasie obozów wędrownych zainteresował się historią poznawanych miejsc i żyjących tam ludzi.',
                      'Zorganizował rajd według opracowanego przez siebie programu i trasy.',
                    ],
                    comment: 'Funkcje sprawności mistrzowskich pełnią uprawnienia PTTK:'
                        '\n• przewodnik po obiekcie, np. po pałacu w Wilanowie, kopalni soli w Wieliczce,'
                        '\n• przewodnik po mieście, np. po Krakowie,'
                        '\n• przewodnik terenowy, np. po regionie,'
                        '\n• przewodnik górski po wybranym paśmie,'
                        '\n• przodownik turystyki pieszej,'
                        '\n• przodownik turystyki górskiej.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'wloczega_nizinny',
                      title: 'Włóczęga nizinny',
                      level: 2,
                      tasks: [
                        'Spędził dziesięć dni na wycieczkach, przemierzając pieszo szlaki nizinne.',
                        'Wskazał na mapie trasy trzech ostatnich wędrówek przebytych z drużyną.',
                        'Zapoznał się z publikacjami dotyczącymi atrakcji turystycznych swojego regionu (np. przewodniki, strony internetowe). Najciekawsze przedstawił na zbiórce zastępu.',
                        'Uczestniczył w dwóch kilkudniowych wycieczkach pieszych w terenie nizinnym.',
                      ]),
                  SprawData(
                    id: 'wyga',
                    title: 'Wyga',
                    level: 3,
                    tasks: [
                      'Poprowadził dwie przynajmniej trzydniowe wędrówki grupy po zaplanowanym przez siebie szlaku, pod opieką pełnoletniego opiekuna.',
                      'Zdobył srebrną Odznakę Turystyki Pieszej.',
                      'W charakterze wyczynu odbył w terenie nizinnym wielogodzinną, nieprzerwaną wędrówkę.',
                      'Ukończył kurs pierwszej pomocy.'
                    ],
                    comment: 'Funkcję sprawności mistrzowskiej pełnią uprawnienia młodzieżowego organizatora turystyki PTTK lub organizatora turystyki PTTK.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'wloczega_gorski',
                      title: 'Włóczęga górski',
                      level: 2,
                      tasks: [
                        'Zdobył pięć szczytów wybranego pasma górskiego.',
                        'Spędził dziesięć dni na całodniowych wycieczkach górskich.',
                        'Prawidłowo wypełnił książeczkę Górskiej Odznaki Turystycznej.',
                        'Zapoznał się z publikacjami dotyczącymi atrakcji turystycznych swojego regionu (np. przewodniki, strony internetowe). Zachęcił harcerzy z drużyny do zwiedzania proponowanych atrakcji.',
                      ]),
                  SprawData(
                      id: 'wyga_gorski',
                      title: 'Wyga górski',
                      level: 3,
                      tasks: [
                        'Zdobył trzy szczyty wybranych dwóch pasm górskich.',
                        'Ukończył kurs pierwszej pomocy. Stosuje zasady racjonalnego uprawiania turystyki górskiej, umie obliczyć czas marszu, zna niebezpieczeństwa gór.',
                        'Ma ekwipunek turystyczny niezbędny do wędrówki po górach i odpowiednio go konserwuje.',
                        'Wykonał kronikę kilkudniowej wędrówki w wybranym paśmie górskim, uzupełnił ją o informacje z fachowej literatury i przedstawił ją na forum drużyny.',
                        'Był na dwóch obozach wędrownych w górach.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'wspinacz',
                      title: 'Wspinacz',
                      level: 2,
                      tasks: [
                        'Zna terminologię wspinaczkową (nazwy sprzętu, komendy, slang wspinaczkowy).',
                        'Poznał biografię wybitnego alpinisty i przedstawił jego sylwetkę na zbiórce zastępu.',
                        'Regularnie uczestniczy w zajęciach na ściance wspinaczkowej.',
                        'Pod opieką instruktora pogłębia swoje umiejętności, pokonując coraz trudniejsze trasy.',
                      ]),
                  SprawData(
                    id: 'wspinacz_doskonaly',
                    title: 'Wspinacz doskonały',
                    level: 3,
                    tasks: [
                      'Skompletował podstawowy sprzęt wspinaczkowy (uprząż, przyrząd asekuracyjny, karabinek, buty wspinaczkowe, karabinek, ewentualnie lina).',
                      'Przeczytał wybraną pozycję dotyczącą wspinaczki skałkowej.',
                      'Przeprowadził zbiórkę zastępu lub drużyny przybliżającą techniki wspinaczki oraz asekuracji.',
                      'Systematycznie podnosi swoją sprawność fizyczną, uprawiając wybraną dyscyplinę sportu. Regularnie trenuje na ściance wspinaczkowej.',
                      'Pod opieką doświadczonego instruktora wspinaczki pokonał trasę skalną o trudności minimum VI.'
                    ],
                    comment: 'Funkcję sprawności mistrzowskiej pełnią karta wspinacza i karta taternika.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'geolog',
                      title: 'Geolog',
                      level: 3,
                      tasks: [
                        'Na podstawie swoich obserwacji i wiedzy zdobytej w podróżach i wycieczkach scharakteryzował podstawowe typy krajobrazu Polski: wysokogórski, górski, wyżynny, nadmorski, pojezierza i nizinny.',
                        'Odwiedził teren wydmowy (nadmorski lub sandrowy]), oglądając meandry rzeczne i pradolinę rzeki.',
                        'Zwiedził jaskinię. Wie, jakie procesy ją kształtowały. Potrafi nazwać podstawowe formy naciekowe.',
                        'Rozróżnił kilka rodzajów skał, prezentując kolegom swoje zbiory kamieni.',
                        'Przygotował prezentację dla zastępu lub drużyny na temat wybranego zagadnienia geologicznego.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '8',
                sprawData: [
                  SprawData(
                      id: 'turysta_rowerowy',
                      title: 'Turysta rowerowy',
                      level: 1,
                      tasks: [
                        'Zna zasady bezpiecznego poruszania się pojazdu jednośladowego po drodze.',
                        'Potrafi rozróżnić części roweru, konserwować je i wykonać drobne naprawy.',
                        'Wzięł udział w rajdach rowerowych, zdobywając co najmniej 30 punktów na Kolarską Odznakę Turystyczną.',
                        'Poznał szlaki i ścieżki rowerowe w pobliżu miejsca swojego zamieszkania, opisał je w dzienniczku turysty rowerowego do własnego użytku.',
                        'Przygotował rower i ekwipunek do wyprawy (światła, koła, apteczka, mapa).',
                      ]),
                  SprawData(
                      id: 'kolarz',
                      title: 'Kolarz',
                      level: 2,
                      tasks: [
                        'Zdobył kartę rowerową lub motorowerową. Umie czytać mapę i posługiwać się busolą.',
                        'Zdobył małą brązową Kolarską Odznakę Turystyczną.',
                        'Zorganizował dla zastępu lub drużyny zbiórkę popularyzującą turystykę rowerową, przedstawił na niej sprzęt rowerowy i pamiątki ze swoich wypraw.',
                        'Opracował plan i przeprowadził ciekawą wycieczkę z biwakowaniem, uwzględniając różnice wzniesień i nawierzchni oraz przygotowanie turystyczne uczestników wyprawy rowerowej.',
                      ]),
                  SprawData(
                      id: 'kolarz_turysta',
                      title: 'Kolarz turysta',
                      level: 3,
                      tasks: [
                        'Zdobył małą srebrną Kolarską Odznakę Turystyczną. Wziął udział w rowerowym obozie wędrownym.',
                        'Przedstawił dziennik swoich wypraw lub inne materiały (fotografie, szkice, rysunki, itp.) dotyczące historii, osobliwości przyrodniczych oraz geologicznych zwiedzanych miejscowości.',
                        'Zorganizował rajd rowerowy dla drużyny.',
                        'Poznał zasady konserwacji sprzętu rowerowego i propaguje tę wiedzę w swojej drużynie.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '9',
                sprawData: [
                  SprawData(
                      id: 'narciarz_klasyczny',
                      title: 'Narciarz klasyczny',
                      level: 1,
                      tasks: [
                        'Poznał dwa kroki biegowe na nartach.',
                        'Wykonał zjazd pod bramkami z kijów, zmieniając kierunek jazdy przestępowaniem i hamując pługiem.',
                        'Rozróżnił trzy gatunki śniegu i umie przygotować narty do różnych warunków śniegowych.',
                        'Potrafi wymienić olimpijskie dyscypliny narciarskie.',
                        'Uczestniczył w wycieczkach narciarskich, przebywając jednorazowo co najmniej 5 km, a w sumie minimum 30 km.',
                      ]),
                  SprawData(
                      id: 'narciarz_biegowy',
                      title: 'Narciarz biegowy',
                      level: 2,
                      tasks: [
                        'Uczestniczył w co najmniej pięciu wycieczkach narciarskich, podczas których przebył jednorazowo minimum 10 km.',
                        'Opracował trasę wycieczki narciarskiej na podstawie mapy topograficznej, zaplanował ekwipunek indywidualny i zbiorowy na trasę.',
                        'Potrafi udzielić pierwszej pomocy w wypadku narciarskim.',
                        'Zna zasady bezpiecznego poruszania się na nartach w terenie.',
                      ]),
                  SprawData(
                      id: 'narciarz_turysta',
                      title: 'Narciarz turysta',
                      level: 3,
                      tasks: [
                        'Zjeżdżał w skos i na wprost stoku, zmieniając kierunek jazdy przestępowaniem.',
                        'Zjeżdżał pługiem, wykonując łuki z pługu, cristianię do stoku i od stoku oraz "w tył zwrot" na stoku.',
                        'Scharakteryzował kombinację klasyczną i alpejską.',
                        'Zaplanował wycieczkę narciarską, biorąc pod uwagę możliwości uczestników. Podczas wycieczek przebył w sumie 75 km.',
                        'Ukończył kurs pierwszej pomocy, przestrzega zasad poruszania się w terenie górskim w czasie zimy. Zna rejony działania GOPR i TOPR oraz ich telefony alarmowe, wie, jak wezwać pomoc w inny sposób (Międzynarodowy Kod Górski, race, flary).',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '10',
                sprawData: [
                  SprawData(
                      id: 'wioslarz',
                      title: 'Wioślarz',
                      level: 1,
                      tasks: [
                        'Scharakteryzował zasady bezpieczeństwa na wodzie i komendy żeglarskie oraz zasady pokonywania przeszkód wodnych.',
                        'Wykonał następujące czynności: przygotowanie kajaka, kanadyjki lub łodzi wiosłowej do rejsu, rozlokowanie niezbędnego ładunku, wodowanie, wsiadanie i wysiadanie.',
                        'Wiosłował na kajaku.',
                        'Wiosłował jednym i dwoma wiosłami w dulkach,'
                            'Umie wiosłować "na śrubkę" i "na pych".',
                      ]),
                  SprawData(
                      id: 'kajakarz',
                      title: 'Kajakarz',
                      level: 2,
                      tasks: [
                        'Zdobył kartę pływacką.',
                        'Płynął 200 m kajakiem, utrzymując kurs.',
                        'Uczestniczył w całodniowej wycieczce kajakowej, przygotowując wcześniej kajak i wyposażenie do wyprawy.',
                        'Poznał przepisy bezpieczeństwa na wodzie, sposoby zachowania się w przypadku przewrócenia kajaka i udzielania pierwszej pomocy poszkodowanym (postępowanie z tonącym, pierwsza pomoc w przypadku udaru słonecznego i cieplnego, oparzenia, wychłodzenia organizmu).',
                        'Konserwował kajak przed sezonem i po nim, wykonując przy tym drobne naprawy.',
                      ]),
                  SprawData(
                      id: 'kajakarz_turysta',
                      title: 'Kajakarz turysta',
                      level: 3,
                      tasks: [
                        'Przebył co najmniej trzy szlaki kajakowe, stosując się do śródlądowego prawa drogi.',
                        'Zna kryteria oceny oraz umiejętnie ocenił stan wody, nurt, mieliznę i głębię. Do wniosków płynących z oceny sytuacji dostosował swoje zachowanie na wodzie.',
                        'Zorganizował wycieczkę wodną, przygotowując apteczkę, ekwipunek i wyposażenie kajaka lub łodzi, planując zaprowiantowanie stosownie do warunków zaopatrzenia na trasie.',
                        'Potrafi zachować się w przypadku przewrócenia kajaka, w razie potrzeby udzielić pierwszej pomocy.',
                        'Wiosłował w kajaku, szalupie lub łodzi, na jedno i dwa wiosła, "na pych" i "na śrubę".',
                      ])
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_wodn_zegl',
          title: 'Wodne i żeglarskie',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'zalogant',
                      title: 'Załogant',
                      level: 1,
                      tasks: [
                        'Nazwał części jachtu mieczowego.',
                        'Zna zasady bezpiecznego zachowania się na pokładzie jachtu.',
                        'Potrafi określić kurs względem wiatru, wyjaśnić zasady działania miecza i steru.',
                        'W czasie żeglugi obsługiwał ster, trzymał żagle i balastował przy przechyłach łodzi.',
                      ]),
                  SprawData(
                      id: 'junga',
                      title: 'Junga',
                      level: 2,
                      tasks: [
                        'Poznał regulamin i zasady służby jachtowej oraz komendy żeglarskie.',
                        'Pełnił wachtę w czasie rejsu zatokowego.',
                        'Wykonywał manewry proste i złożone jachtem dwumasztowym.',
                        'Klarował jacht przed i po pływaniu.',
                      ]),
                  SprawData(
                      id: 'szyper',
                      title: 'Szyper',
                      level: 3,
                      tasks: [
                        'Zna teorię manewrowania jachtem mieczowym o powierzchni żagla do 20 m2 i komendy żeglarskie.',
                        'Wykonał proste i złożone manewry jachtem mieczowym.',
                        'Pełnił funkcje załogi na wszystkich stanowiskach manewrowych.',
                        'Brał udział w kilku wielodniowych rejsach żeglarskich.',
                        'Zna zasady bezpieczeństwa podczas rejsu, potrafi udzielić pomocy tonącemu, przy udarze słonecznym i cieplnym oraz przy wychłodzeniu organizmu. Potrafi wezwać pomoc, znajdując się na wodzie, zna numer telefonu alarmowego WOPR.',
                      ],
                      comment: 'Funkcję sprawności mistrzowskiej pełni odznaka lub uprawnienie: "patent żeglarza jachtowego", "patent sternika jachtowego".'
                  ),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'szkutnik',
                      title: 'Szkutnik',
                      level: 1,
                      tasks: [
                        'Poznał zasady budowy jachtów, konstrukcję łodzi i nazewnictwo jej części oraz rodzaje poszycia, drzewca, osprzętu, olinowania i ożaglowania.',
                        'Zna konstrukcję pięciu najczęściej używanych łodzi żaglowych.',
                        'Brał udział w zabezpieczaniu sprzętu wodnego przed zimą.',
                        'Wykonał sploty lin miękkich, zeszlifował na równo laminowany element.',
                        'Malował elementy jachtu farbami rozpuszczalnikowymi, zadbał o narzędzia po zakończeniu malowania.',
                      ]),
                  SprawData(
                      id: 'bosman',
                      title: 'Bosman',
                      level: 2,
                      tasks: [
                        'Poznał zasady bezpieczeństwa podczas prac bosmańskich w porcie oraz w czasie pływania.',
                        'Zna konstrukcję i budowę najpopularniejszych typów łodzi żaglowych i wiosłowych.',
                        'Remontował sprzęt żeglarski naprawiając również uszkodzenia żagli.',
                        'Zacumował jacht w różnych warunkach, stosując podstawowe węzły.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'sygnalista_morski',
                      title: 'Sygnalista morski',
                      level: 1,
                      tasks: [
                        'Rozpoznał polskie bandery i flagi: marynarki wojennej i handlowej, PZŻ, klubowe jednostki pływającej.',
                        'Poznał zasady ceremoniału morskiego i etykiety jachtowej.',
                        'Poznał zasady wywieszania banderek odwiedzanych państw oraz flag kodu MKS przy wejściu do obcego portu.',
                        'Umie wezwać pomoc według MPZZM.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'mlody_nawigator',
                      title: 'Młody nawigator',
                      level: 1,
                      tasks: [
                        'Zna instrumenty nawigacyjne.',
                        'Umie odczytać głębokość na mapie, wysokość latarni.',
                        'Zna zasadę podziału kuli ziemskiej z siatką geograficzną.',
                        'Potrafi zmierzyć szybkość jachtu i głębokość wody.',
                        'Potrafi porównać wskazanie kompasu jachtowego oraz kompasu wniesionego i trzymanego w różnych miejscach.',
                      ]),
                  SprawData(
                      id: 'nawigator',
                      title: 'Nawigator',
                      level: 2,
                      tasks: [
                        'Potrafi odczytać z mapy długość i szerokość geograficzną wskazanego punktu oraz zaznaczyć punkt o podanych współrzędnych.',
                        'Potrafi odczytać z mapy morskiej odległość między dwoma wskazanymi punktami.',
                        'Potrafi wyznaczyć pozycję obserwowaną z dwóch namiarów (rzeczywistych) jednoczesnych.',
                        'Potrafi prowadzić nawigację zliczeniową i przenieść pozycję zliczoną na określoną pozycję obserwowaną.',
                        'Potrafi prawidłowo opisać na mapie czynności z pkt. 3−4.',
                      ]),
                  SprawData(
                    id: 'morski_nawigator',
                    title: 'Morski nawigator',
                    level: 3,
                    tasks: [
                      'Odczytał z mapy morskiej: przebieg farwaterów, występujące przeszkody nawigacyjne i wartość deklinacji w roku.',
                      'Zmierzył szybkość logiem burtowym i głębokość sondą ręczną.',
                      'Posługiwał się polskimi locjami i spisem świateł. W nocy na podstawie widocznych świateł określił swą pozycję.',
                      'Wykreślił na mapie namiary, zaznaczając pozycję obserwowaną oraz kursy, odkładając przebytą drogę i zaznaczając pozycję zliczoną',
                      'Przeliczył kursy i namiary kompasowe na rzeczywiste, dokonał zapisów w dzienniku jachtowym.',
                      'Prowadził zliczeniówkę podczas rejsu; po określeniu różnicy pozycji obserwowanej i zliczonej (np. po nocy) potrafił ją wytłumaczyć.'
                    ],
                    comment: 'Funkcję sprawności mistrzowskiej pełnią uprawnienia młodszego ratownika WOPR.',
                  )
                ]
            )

          ]),

      SprawGroupData(
          id: 'spraw_wyrob_harc',
          title: 'Wyrobienie harcerskie',
          familyData: [
            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'robinson',
                      title: 'Robinson',
                      level: 2,
                      tasks: [
                        'Przeprowadził w pobliżu obozu w samotności kilkugodzinną obserwację życia lasu o wschodzie Słońca.',
                        'W dowolnej formie udokumentował swoje spostrzeżenia (zauważone zwierzęta i ich tropy, zjawiska przyrody, występujące rośliny chronione, jadalne itp.]), zaprezentował je na zbiórce zastępu.',
                        'Przygotował dla zastępu posiłek, korzystając z zebranych owoców lasu.',
                        'Wraz z kolegą lub koleżanką biwakował w pobliżu obozu przez 24 godziny.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [
                  SprawData(
                      id: 'lesny_czlowiek',
                      title: 'Leśny człowiek',
                      level: 3,
                      tasks: [
                        'Odbył samotną wędrówkę po lesie (od świtu do zmroku]), żywiąc się wyłącznie owocami lasu, odnalazł wyznaczone przez drużynowego miejsce bez posługiwania się mapą, kierując się tylko znakami przyrody.',
                        'Korzystając z samotności, przemyślał swoje dotychczasowe życie harcerskie.',
                        'Powrócił niepostrzeżenie do ogniska i na podstawie obserwacji oraz przemyśleń z wędrówki opowiedział gawędę o życiu lasu.',
                        'W czasie tej wędrówki znalazł ciekawe miejsce, by pokazać je potem harcerzom z drużyny.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [
                  SprawData(
                      id: 'trzy_piora',
                      title: 'Trzy pióra',
                      level: 4,
                      tasks: [
                        'Przeszedł pomyślnie trzy próby − milczenia, głodu i samotności − przez kolejne trzy doby:'
                            '\n• w czasie pierwszej doby powstrzymał się od spożywania jakichkolwiek pokarmów i napojów (z wyjątkiem czystej wody]), uczestnicząc we wszystkich zajęciach obozowych,'
                            '\n• w czasie drugiej doby zachował całkowite milczenie,'
                            '\n• trzecią dobę spędził w lesie, niezauważony przez ludzi, żywiąc się pokarmem leśnym.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'harcownik',
                      title: 'Harcownik',
                      level: 1,
                      tasks: [
                        'Uczestniczył w pięciu grach terenowych, przestrzegał obowiązujących w nich zasad.',
                        'Poznał 10 ćwiczeń rozwijających spostrzegawczość, refleks, pamięć.',
                        'Uczestniczył razem z zastępem w zawodach, turnieju, meczu lub innej formie współzawodnictwa między zastępami.',
                        'Brał udział w INO, grze ekologicznej lub biegu patrolowym.',
                      ]
                  ),
                  SprawData(
                      id: 'organizator_harcow',
                      title: 'Organizator harców',
                      level: 2,
                      tasks: [
                        'Przeprowadził dziesięć gier terenowych i sportowych, ucząc kolegów zasad w nich obowiązujących.',
                        'Zorganizował dla zastępu (drużyny) ćwiczenia typu "kim" w harcówce i w terenie.',
                        'Zorganizował mecz, olimpiadę lub inne zawody między zastępami.',
                        'Prowadzi własny notatnik zawierający zbiór gier i ćwiczeń do wykorzystania w pomieszczeniu i w terenie.',
                      ]),
                  SprawData(
                      id: 'mistrz_harcow',
                      title: 'Mistrz harców',
                      level: 3,
                      tasks: [
                        'Przedstawił zestaw gier i ćwiczeń, zebranych w czasie próby.',
                        'Przeprowadził po kilkanaście gier terenowych i świetlicowych w drużynie (szczepie) lub dla dzieci spoza ZHP.',
                        'Przygotował trasę i program harcerskiego biegu terenowego, sprawdzającego znajomość technik harcerskich.',
                        'Nauczył młodszych kilku gier i ćwiczeń do wykorzystania na zbiórkach i w szkole.'
                      ],
                      comment: 'Funkcję sprawności mistrzowskich pełnią uprawnienia animatora pedagogiki zabawy "Klanza" i uprawnienia sędziego INO.'
                  ),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'znawca_obrzedow_i_zwyczajow_druzyny',
                      title: 'Znawca obrzędów i zwyczajów drużyny',
                      level: 1,
                      tasks: [
                        'Poznał znaczenie słów "zwyczaje" i "obrzędy".',
                        'Poznał historię swojej drużyny.',
                        'Dotarł do kroniki lub kronik drużyny, przeczytał je.',
                        'Pozyskane informacje dotyczące zwyczajów swojej drużyny przedstawił na zbiórce zastępu.',
                        'Poznał harcerskie piosenki śpiewane w drużynie, nauczył się ich.',
                      ]),
                  SprawData(
                      id: 'znawca_zwyczajow_i_tradycji_harcerstwa',
                      title: 'Znawca zwyczajów i tradycji harcerstwa',
                      level: 2,
                      tasks: [
                        'Wie, jak powstała pieśń "Wszystko, co nasze".',
                        'Wie, skąd wywodzi się tradycja pozdrowienia "czuwaj" i co ono oznacza. Przygotował krótką gawędę dla zastępu na ten temat.',
                        'Poznał harcerskie zwyczaje związane z ogniskiem, napisał artykuł do gazetki hufca (drużyny, szkoły) o tych zwyczajach.',
                        'Zna pieśni obrzędowe, np. "Bratnie słowo", "Płonie ognisko". Nauczył młodszego harcerza tych pieśni.',
                        'Zorganizował przedsięwzięcie dotyczące historii lub tradycji harcerstwa (dla harcerzy,społeczności lokalnej, koleżanek i kolegów w szkole).',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '6',
                sprawData: [
                  SprawData(
                      id: 'bi-pi',
                      title: 'Bi-Pi',
                      level: 1,
                      tasks: [
                        'Wie, co oznacza zwyczaj zawiązywania węzełka na chuście. Przestrzega tego zwyczaju.',
                        'Wie, do jakich organizacji skautowych należy ZHP oraz jakie są ich symbole (lilia i koniczyna). Zaprezentował je drużynie (np. w postaci prezentacji multimedialnej lub planszy do harcówki).',
                        'Poznał życiorys twórcy skautingu gen. Roberta Baden-Powella. Podczas zbiórki zastępu przedstawił w dowolnej formie jedną z jego przygód.',
                      ]),
                  SprawData(
                      id: 'lilijka_i_koniczyna',
                      title: 'Lilijka i koniczyna',
                      level: 2,
                      tasks: [
                        'Zna symbolikę skautowej lilijki i koniczynki, wie, jak wyglądają oraz jaka jest ich historia.',
                        'Wie, kiedy powstał skauting i kto go założył.',
                        'Wie, co oznaczają skróty WOSM i WAGGGS (nauczył się pełnej nazwy obu organizacji w języku angielskim).',
                        'Zdobył informacje o organizacji skautowej w wybranym kraju. Wybrane informacje przedstawił na zbiórce drużyny',
                        'Wziął udział w przygotowaniu zbiórki z okazji Dnia Myśli Braterskiej. Wysłał kartkę z życzeniami do wybranej organizacji skautowej, drużyny lub skauta.',
                      ]),
                  SprawData(
                      id: 'znawca_skautingu',
                      title: 'Znawca skautingu',
                      level: 3,
                      tasks: [
                        'Zna historię skautingu − wie, jak powstał skauting i jak rozwinął się w ruch ogólnoświatowy.',
                        'Wie, na czym polega działanie światowych organizacji skautowych (WOSM i WAGGGS).',
                        'Zna najważniejsze organizacje skautowe działające w krajach europejskich.',
                        'Dobrze poznał wybraną organizację skautową − zna jej historię i współczesną działalność, nawiązał kontakt ze skautami tej organizacji.',
                        'Samodzielnie przygotował zbiórkę na temat skautingu.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '7',
                sprawData: [
                  SprawData(
                      id: 'rzecznik_druzyny',
                      title: 'Rzecznik drużyny',
                      level: 3,
                      tasks: [
                        'Zdobył podstawową wiedzę dotyczącą przekazu informacji, dowiedział się, jak należy formułować informacje.',
                        'Zredagował kilka ogłoszeń lub informacji związanych z działalnością drużyny, wywiesił je w szkole, w hufcu lub zamieścił na stronie internetowej drużyny.',
                        'Napisał artykuł o drużynie do lokalnego pisma (wychodzącego w mieście, gminie lub powiecie).',
                        'Systematycznie pisze artykuły o drużynie do gazetki hufca (gazetki szkolnej) lub zamieszcza teksty na stronie internetowej drużyny.',
                      ]),
                  SprawData(
                      id: 'rzecznik_harcerstwa',
                      title: 'Rzecznik harcerstwa',
                      level: 4,
                      tasks: [
                        'Przeczytał trzy pozycje książkowe dotyczące przekazywania informacji.',
                        'Poznał specyfi kę strony internetowej ZHP, śledził na bieżąco informacje dotyczące ZHP.',
                        'Napisał artykuł do lokalnej gazety o przebiegu dowolnego przedsięwzięcia hufca, chorągwi.',
                        'Zaprosił lokalnych dziennikarzy i opiekował się nimi w czasie imprezy hufca.',
                        'Ukończył warsztaty dziennikarskie. Uczestniczy w pracach zespołu promocji i informacji w hufcu lub w chorągwi.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '8',
                sprawData: [
                  SprawData(
                      id: 'znawca_musztry',
                      title: 'Znawca musztry',
                      level: 2,
                      tasks: [
                        'Zapoznał się z zasadami musztry.',
                        'Nienagannie wydaje i wykonuje komendy.',
                        'Przeprowadził zajęcia z musztry z zastępem lub drużyną.',
                        'Brał udział w pokazie musztry zastępu, drużyny lub obozu.',
                      ]
                  ),
                  SprawData(
                      id: 'mistrz_musztry',
                      title: 'Mistrz musztry',
                      level: 3,
                      tasks: [
                        'Poznał regulamin musztry i ceremoniału harcerskiego, przestrzega go.',
                        'Przygotował drużynę do uroczystości na placu, ucząc musztry i dopilnowując regulaminowego umundurowania.',
                        'Przeprowadził pokaz musztry drużyny.',
                        'Przeprowadził szkolenie zastępowych z zakresu musztry.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '9',
                sprawData: [
                  SprawData(
                      id: 'wartownik',
                      title: 'Wartownik',
                      level: 2,
                      tasks: [
                        'Zna i stosuje zasady służby wartowniczej ZHP.',
                        'Pełnił bez zarzutu służbę wartowniczą łącznie przez 12 godzin w nocy i 8 godzin w dzień.',
                        'Pełnił wartę na posterunku honorowym podczas trwania uroczystości.',
                        'Wie, jakie znaczenie ma służba wartownicza dla bezpieczeństwa osób i mienia znajdującego się na terenie obozu (biwaku).',
                        'Brał udział w przynajmniej pięciu grach doskonalących czujność, spostrzegawczość itp.',
                      ]),
                  SprawData(
                      id: 'dowodca_warty',
                      title: 'Dowódca warty',
                      level: 3,
                      tasks: [
                        'Zdobył sprawność "wartownika".',
                        'Pełnił funkcję dowódcy warty (instruktora służbowego na obozie, biwaku). Pokierował budową wartowni obozowej.',
                        'Potrafi rozstawić wartowników, dokonać zmiany warty. Dokonał zmiany wartowników na posterunku honorowym podczas trwania uroczystości.',
                        'Zorganizował co najmniej pięć gier doskonalących czujność oraz spostrzegawczość.',
                        'Opiekował się harcerką lub harcerzem zdobywającym sprawność "wartownika".',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '10',
                sprawData: [
                  SprawData(
                      id: 'ognik',
                      title: 'Ognik',
                      level: 1,
                      tasks: [
                        'Zapoznał się ze znaczeniem odkrycia i poskromienia ognia.',
                        'Pod opieką zastępowego ułożył ognisko i rozpalił je.',
                        'Pełnił funkcję strażnika ognia.',
                        'Zna gatunki drewna odpowiedniego do budowania ognisk harcerskich.',
                        'Zatarł ślady ogniska po jego wygaszeniu, zabezpieczył zapałki przed zamoknięciem.',
                      ]),
                  SprawData(
                      id: 'straznik_ognia',
                      title: 'Strażnik ognia',
                      level: 2,
                      tasks: [
                        'Pełnił trzy służby przy ognisku, umiejętnie podkładając drwa lub gałęzie, regulując wysokość płomienia i ograniczając iskrzenie.',
                        'Poznał przepisy przeciwpożarowe na obozach i biwakach. Dowiedział się, jak ugasić na człowieku płonące ubranie. Nauczył się posługiwać podstawowym sprzętem gaśniczym.',
                        'Poprawnie zbudował podstawowe stosy ogniskowe.',
                        'Poznał obrzędowość związaną z harcerskim ogniskiem.',
                        'Rozróżnia trzy podstawowe stopnie oparzenia i potrafi udzielić pierwszej pomocy w przypadku oparzenia.',
                      ]),
                  SprawData(
                      id: 'mistrz_ognisk',
                      title: 'Mistrz ognisk',
                      level: 3,
                      tasks: [
                        'Rozpoznaje różne gatunki drewna. Wie, czym się charakteryzują i jak się palą.',
                        'Wygłosił gawędę na temat ognia i zasad zachowania się przy ognisku harcerskim.',
                        'Przygotował strażników ognia do pełnienia obowiązków przy ognisku.',
                        'Poznał różne rodzaje stosów ogniskowych, nauczył się je układać.',
                        'Nauczył się rozpalać ognisko w trudnych warunkach atmosferycznych (wiatr, deszcz, śnieg).',
                      ])
                ]
            )

          ]),

    ]
).build();
