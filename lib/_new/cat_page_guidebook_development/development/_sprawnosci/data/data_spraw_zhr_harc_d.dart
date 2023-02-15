import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_group.dart';

SprawBook sprawBookZHRD = SprawBookData(
    id: SprawBookData.ZHR_HARC_D,
    title: 'Sprawności harcerek ZHR',
    source: 'Regulamin sprawności harcerek, 22 lutego 2006',
    color: SprawBookData.SPRAW_BOOK_ZHR_H_RKI_COLOR,
    icon: SprawBookData.SPRAW_BOOK_ZHR_H_RKI_ICON,
    female: true,
    groupData: [

      SprawGroupData(
          id: 'spraw_ducha',
          title: 'Sprawności ducha',
          description: 'Sprawności ducha mają na celu rozwój duchowy młodego człowieka. Zbudowane na wskaza niach ewangelicznych uczą pokory, prawdziwej służby i czystości intencji, skoro czasem całprzebieg zdobywania sprawności jest zakryty przed otoczeniem. Wymagają one szczególnie wrażliwego i umiejętnego prowadzenia przez drużynową, aby np. „obdarzanie uśmiechem" nie zmieniło się w zaliczenie kilkunastu uśmiechów. CZTEROLISTNA KONICZYNA jest okazją do przyjrzenia się, jak straszne spustoszenie wywołuje plotka, obmowa, oszczerstwo, jak łatwo ten łańcuch uruchomić, a jak trudno go przerwać. Przy zdobywaniu TARCZY i WŁÓCZNI ŚW. JERZEGO trzeba pilnie uważać, by kształtowana w tych sprawnościach odwaga przekonań była odpowiedzią na wezwanie do bycia „zimnym albo gorącym", by nie rodziła wrogości i niechęci, lecz uczyła miłości nieprzyjaciół. Sprawności MAŁY KSIĄŻĘ to szansa na pogłębienie swoich motywacji - do bycia radosnym, do Życia Ewangelią, do samozaparcia. Rozumiejąc głęboki sens formacji duchowej zachęcajmy harcerki do zdobywania sprawności ducha, które nadają kierunek całej aktywności i twórczości dziewcząt - kierunek ku Bogu i drugiemu człowiekowi.',
          familyData: [
            SprawFamilyData(
                id: '1',
                sprawData: [

                  SprawData(
                      id: 'dwulistna_koniczyna',
                      title: 'Dwulistna koniczyna',
                      level: '1',
                      tasks: [
                        'W trudnej sytuacji np. w czasie prac pionierskich, męczącej wędrówki zadba o dobry nastrój grupy (z zachowaniem tajemnicy zdobywania sprawności).'
                      ]
                  ),

                  SprawData(
                      id: 'trzylistna_koniczyna',
                      title: 'Trzylistna koniczyna',
                      level: '2',
                      tasks: [
                        'Zorganizuje dla zastępu jednorazową służbę w wybranej przez siebie miejscowości.',
                        'W czasie poszukiwania służby obdarzy życzliwym uśmiechem wszystkie osoby, z którymi będzie rozmawiać.',
                        'Będzie przykładem dla harcerek z zastępu w zaangażowaniu i chęci do pracy.',
                      ]
                  ),

                  SprawData(
                      id: 'czterolistna_koniczyna',
                      title: 'Czterolistna koniczyna',
                      level: '3',
                      tasks: [
                        'Przerwie łańcuch plotki i obmowy lub atmosferę niechęci i stworzy w środowisku nastrój przychylności i życzliwości do wybranej osoby.'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: '2',
                sprawData: [

                  SprawData(
                      id: 'tarcza_sw_jerzego',
                      title: 'Tarcza św. Jerzego',
                      level: '2',
                      tasks: [
                        'Wystąpi odważnie sama przeciwko dużej grupie rówieśniczej (klasa lub jej część, grupa podwórzowa itp.) broniąc słusznej sprawy lub potępiając czyn moralnie zły.'
                      ]
                  ),

                  SprawData(
                      id: 'wlocznia_sw_jerzego',
                      title: 'Włócznia św. Jerzego',
                      level: '3',
                      tasks: [
                        'Sama lub z wybraną grupą dziewcząt podejmie długotrwałą walkę szlachetnymi metodami z „paczką” rówieśniczą mającą zły wpływ na innych.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: '3',
                sprawData: [

                  SprawData(
                      id: 'male_ksiaze_1',
                      title: 'Mały książę',
                      level: '1',
                      tasks: [
                        'Mając za pokarm jedynie chleb i wodę, pozbawiona obuwia i w prostej odzieży, zachowa przez cały dzień obozowy radość życia i zapał do pracy.'
                      ]
                  ),

                  SprawData(
                      id: 'male_ksiaze_2',
                      title: 'Mały książę',
                      level: '2',
                      tasks: [
                        'Na ognisku drużyny, w czasie otwarcia próby, przeczyta 3 wybrane losowo fragmenty Ewangelii i w przeciągu 3 godzin nocnego czuwania na osobności rozważy je w odniesieniu do własnego życia. Przemyślenia przedstawi kapelanowi lub drużynowej.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [

                  SprawData(
                      id: 'pollyanna',
                      title: 'Pollyanna',
                      level: '1',
                      tasks: [
                        'W czasie trwania próby będzie odnajdywała dobre strony we wszystkich trudnych sytuacjach, jakie ją spotkają.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'szara_lilijka',
                sprawData: [

                  SprawData(
                      id: 'szara_lilijka_1',
                      title: 'Szara lilijka',
                      level: '1',
                      tasks: [
                        'Zachowa w tajemnicy swój spory sukces, jeśli był on jednocześnie porażką dla innego człowieka.'
                      ]
                  ),

                  SprawData(
                      id: 'szara_lilijka_2',
                      title: 'Szara lilijka',
                      level: '2',
                      tasks: [
                        'W ciągu całego dnia, we wszystkich rozmowach prowadzonych z ludźmi, będzie uważną słuchaczką i czujną odbiorczynią ich problemów, w których postara się zaradzić lub przynajmniej pocieszyć. Nie będzie w tym dniu mówić o własnych sprawach.'
                      ],
                      comment: 'w przypadku zapomnienia lub przeoczenia próbę można powtórzyć w dniu następnym (do 3 kolejnych dni).'
                  ),

                  SprawData(
                      id: 'szara_lilijka_3',
                      title: 'Szara lilijka',
                      level: '3',
                      tasks: [
                        'Spośród grona rówieśniczek wybierze 2 osoby najbardziej potrzebujące pomocy (osamotnione, o trudnym charakterze, niezdolne, pozostające w konflikcie z rodziną itp.), podejmie długotrwałą pomoc, która zostanie uwieńczona pewnymi sukcesami.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'milczek',
                sprawData: [

                  SprawData(
                      id: 'milczek_1',
                      title: 'Milczek',
                      level: '1',
                      tasks: [
                        'Przez całą dobę zachowa milczenie.',
                        'Nie będzie używać kartki i długopisu w celu kontaktowania się z innymi.',
                        'Przez cały dzień milczenia rozważać będzie myśl (np. z Pisma Świętego), zaproponowaną przez drużynową i podzieli się z nią swoimi przemyśleniami pod koniec dnia.'
                      ],
                      comment: 'Sprawności "Milczek" mogą być zdobywane minimum po upływie trzech miesięcy, jednak nie częściej niż dwa razy w roku.'
                  ),

                  SprawData(
                      id: 'milczek_2',
                      title: 'Milczek',
                      level: '2',
                      tasks: [
                        'Przez całą dobę zachowa milczenie, w czasie, którego rozważy cztery fragmenty z Pisma Świętego lub nauczania Ojca Świętego.',
                        'Przemyśleniami podzieli się z kapelanem w kontekście swojego życia – znajdzie i przedstawi motto, które będzie jej towarzyszyło przez najbliższy rok.'
                      ],
                      comment: 'Sprawności "Milczek" mogą być zdobywane minimum po upływie trzech miesięcy, jednak nie częściej niż dwa razy w roku.'
                  ),

                  SprawData(
                      id: 'milczek_3',
                      title: 'Milczek',
                      level: '3',
                      tasks: [
                        'Weźmie udział w rekolekcjach milczenia, na których będzie się porozumiewała jedynie z przewodnikiem duchowym (np. rekolekcje w zgromadzeniach zakonnych reguł franciszkańskich, benedyktyńskich, rekolekcje ignacjańskie).'
                      ],
                      comment: 'Sprawności "Milczek" mogą być zdobywane minimum po upływie trzech miesięcy, jednak nie częściej niż dwa razy w roku.'
                  ),
                ]
            ),

          ]
      ),

      SprawGroupData(
          id: 'spraw_religijne',
          title: 'Sprawności religijne',
          description: 'Sprawności religijne mają na celu głównie rozwój wiedzy religijnej. Ważną sprawą jest by ich zdobywanie nie ograniczyło się tylko do tego. Drużynowa powinna, więc zwrócić uwagę, aby harcerka zdobywająca tę sprawność nie potraktowała jej czysto technicznie, by nie zaszła np. taka sytuacja, w której ZNAWCZYNI BIBILII nie ma nic wspólnego z przykazaniem miłości Boga i bliźniego, zaś HAGIOGRAFKA w gruncie rzeczy uważa, że świętość jest zarezerwowana dla wybranych. Dlatego w sprawnościach religijnych szczególnie troskliwego potraktowania wyma- gają punkty, które są szansą na bezpośrednie spotkanie z Bogiem (przeprowadzenie modlitwy, rozważań, pełne uczestnictwo we mszy św., itp.) oraz na spotkanie z Bogiem poprzez drugiego człowieka (dekorowanie kościoła, służba ołtarza, spotkanie z grupą parafialną, patrzenie na innych oczyma Maryi, itp.).',
          familyData: [

            SprawFamilyData(
                id: 'maryjne',
                sprawData: [

                  SprawData(
                      id: 'corka_maryi',
                      title: 'Córka Maryi',
                      level: '1',
                      tasks: [
                        'Zna różaniec – części, tajemnice, dni, w których się je odmawia, podjęła odmawianie różańca w uzgodnionym czasie i wymiarze.',
                        'Zna przynajmniej 3 święta maryjne, w tym Święto Matki Bożej Królowej Polski, umie o nich opowiedzieć (geneza, tradycja, sposób ich obchodzenia).',
                        'Zna 5 sanktuariów maryjnych, umie o nich opowiedzieć. Odwiedzi wybrane miejsce kultu Maryi w najbliższej okolicy.',
                        'Wyszuka w Piśmie Świętym 3 fragmenty mówiące o Maryi, zauważy jakąś Jej cechę, którą postara się naśladować przez 2 tygodnie.',
                        'Postara się w ciągu tygodnia patrzeć uważnie oczyma Maryi i zauważać potrzeby innych.',
                      ]
                  ),

                  SprawData(
                      id: 'poslaniec_maryi',
                      title: 'Posłaniec Maryi',
                      level: '2',
                      tasks: [
                        'Zna przynajmniej 3 wydarzenia historyczne związane z modlitwą różańcową, opowie o nich na kominku.',
                        'Potrafi wymienić najważniejsze święta maryjne.',
                        'Zna 10 piosenek lub pieśni maryjnych. Jednej z nich nauczy zastęp.',
                        'Zapozna zastęp z 3 wybranymi orędziami Maryi płynącymi z miejsc Jej objawienia.',
                        'Przez okres 2 tygodni wszystkie swoje trudności postara się zawierzać Maryi.',
                        'W ważnej intencji podejmie modlitwę różańcową i zachęci do jej odmawiania przynajmniej jedną osobę.',
                        'Przygotuje album pt. „Sanktuaria Maryjne w Polsce i na świecie” i podaruje go katechecie swojej parafii jako pomoc katechetyczną.',
                      ]
                  ),

                  SprawData(
                      id: 'miriam',
                      title: 'Miriam',
                      level: '3',
                      tasks: [
                        'Przeczyta adhortację apostolską Pawła VI „Marialis cultus” lub encyklikę Jana Pawła II „Redemptoris Mater” oraz ułoży komentarze do tajemnic różańca św. i poprowadzi na ich podstawie modlitwę różańcową swojej drużyny.',
                      ]
                  ),

                  SprawData(
                      id: 'apostolka_maryi',
                      title: 'Apostołka Maryi',
                      level: '4',
                      tasks: [
                        'Zainicjuje modlitwę żywym różańcem w wybranej intencji podczas obozu lub przez miesiąc w ciągu roku szkolnego.',
                        'Zna dogmaty maryjne.',
                        'Przyjrzy się 3 osobom, których rozwój duchowy opierał się na oddaniu się Maryi.',
                        'Odbędzie pielgrzymkę do sanktuarium maryjnego w wybranej przez siebie intencji.',
                        'Zapozna się z Aktem Zawierzenia ZHR Matce Bożej i zastanowi się, w czym szczególnie jej drużyna powinna się zmienić biorąc pod uwagę obietnice w niej zawarte. Podejmie konkretne działanie, które pomoże to zrealizować.',
                        'Przez okres 3 tygodni podejmując różne decyzje będzie kierować się tym, co Matka Boża zrobiłaby w tej konkretnej sytuacji.',
                        'Zorganizuje i poprowadzi dyskusję panelową (lub inne spotkanie) z udziałem osób zaangażowanych  w szerzenie kultu maryjnego nt. „Maryja wzorem czystej miłości dla współczesnej nastolatki”.'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'biblijne',
                sprawData: [

                  SprawData(
                      id: 'biblistka',
                      title: 'Biblistka',
                      level: '2',
                      tasks: [
                        'Ma Biblię i zna historię jej powstania.',
                        'Wie, co to są parametry i wg nich potrafi znaleźć fragment tekstu.',
                        'Przygotuje swoją modlitwę poranną i wieczorną w oparciu o Biblię.',
                        'Wykorzysta znajomość Biblii w pracy zastępu (gawęda, scenka, dyskusja, konkurs).',
                        'weźmie udział w przygotowaniu nabożeństwa lub rekolekcji harcerskich.',
                      ]
                  ),

                  SprawData(
                      id: 'znawczyni_biblii',
                      title: 'Znawczyni biblii',
                      level: '3',
                      tasks: [
                        'Zdobędzie wiedzę na temat tłumaczeń Pisma Świętego.',
                        'Zna najstarsze rękopisy Pisma Świętego.',
                        'Czyta regularnie Biblię posługując się komentarzem w niej zawartym.',
                        'Poprowadzi dla innych modlitwę, rozważanie lub czuwanie w oparciu o fragmenty Biblii.',
                        'Odnajdzie ślady inspiracji Biblią w kulturze (np. malarstwo, literatura, film, teatr) podzieli się tym z innymi.',
                        'Przygotuje i poprowadzi zajęcia dla harcerek ukazujące bogactwo Biblii.',
                        'Zna historię Zbawienia.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'hagiograficzne',
                sprawData: [

                  SprawData(
                      id: 'hagiografka',
                      title: 'Hagiografka',
                      level: '2',
                      tasks: [
                        'Zna patrona swojej miejscowości.',
                        'Zna swoją patronkę (jeśli jest to święta) lub etymologię swojego imienia.',
                        'Zna patronów Polski i potrafi wymienić kilku innych błogosławionych i świętych.',
                        'Potrafi wytłumaczyć, co to jest beatyfikacja i kanonizacja.',
                        'Przygotuje i przeprowadzi konkurs, quiz, itp. związany z postaciami świętych.',
                        'Przeczyta książkę o wybranym świętym.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'parafialne',
                sprawData: [

                  SprawData(
                      id: 'parafianka_1',
                      title: 'Parafianka',
                      level: '1',
                      tasks: [
                        'Wie  gdzie mieści się jej parafia   i pod jakim jest wezwaniem.',
                        'Zna obecnych duszpasterzy parafii.',
                        'Przeprowadzi zwiad na terenie swojej parafii (liczba parafian, duszpasterstwa, plany na przyszłość, pole służby, itp.).',
                        'Wykona pracę na rzecz parafii (porządki przy kościele, dekoracja, gazetka ścienna, artykuł do gazety parafialnej).',
                        'Weźmie udział w spotkaniu harcerek z inną grupą parafialną np. Oaza, ministranci, Grupa Apostolska.',
                      ]
                  ),

                  SprawData(
                      id: 'parafianka_2',
                      title: 'Parafianka',
                      level: '2',
                      tasks: [
                        'Weźmie udział w spotkaniu z inną grupą parafialną (np. Oaza, ministranci, Grupa Apostolska).',
                        'Zna historię swojej parafii.',
                        'Potrafi opowiedzieć o patronie / wezwaniu swojej parafii.',
                        'Wraz z drużyną będzie uczestniczyła w akcji pomocy najuboższym w parafii.',
                      ]
                  ),

                  SprawData(
                      id: 'parafianka_3',
                      title: 'Parafianka',
                      level: '3',
                      tasks: [
                        'Zorganizuje spotkanie harcerek z inną grupą parafialną (np. Oaza, ministranci, Grupa Apostolska).',
                        'Włączy się z drużyną w organizację święta w swojej parafii (np. zbuduje ołtarz na Boże Ciało, ognisko w Wielką Sobotę, budowa Grobu Pańskiego).',
                        'Poprowadzi przygotowanie obstawy liturgii Mszy św. w swojej parafii.',
                        'Zorganizuje we współpracy z parafią pomoc dla najuboższych w swojej parafii.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'liturgiczne',
                sprawData: [

                  SprawData(
                      id: 'liturgistka',
                      title: 'liturgistka',
                      level: '2',
                      tasks: [
                        'Wie, z jakich części składa się msza św. i w pełni w niej uczestniczy.',
                        'Zna okresy roku liturgicznego, symbolikę koloru szat liturgicznych, święta obowiązkowe i uroczystości kościelne.',
                        'Weźmie udział w dekorowaniu kościoła (dekoracja ołtarza, Grobu Pańskiego, szopki, itp.).',
                        'Ozdobi ołtarz obozowy lub weźmie udział w budowie kapliczki obozowej.',
                        'Weźmie udział w służbie ołtarza (czytanie lekcji, śpiew psalmu, czytanie modlitwy wiernych, przyniesienie darów ofiarnych).',
                        'Poprowadzi zbiórkę poświęconą liturgii.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'choralne',
                sprawData: [

                  SprawData(
                      id: 'choralistka',
                      title: 'Choralistka',
                      level: '3',
                      tasks: [
                        'Zapozna się z muzyką religijną różnych okresów od chorału po muzykę gospel i dzieła współczesne.',
                        'Potrafi odróżnić pieśni liturgiczne od przygodnych.',
                        'Zna przynajmniej 4 melodie psalmów i aklamacji',
                        '„Alleluja”, śpiewa Godzinki i Gorzkie Żale.',
                        'Przygotuje zestaw pieśni liturgicznych i oprawę do Mszy św. na każdy okres Roku Liturgicznego. Zaśpiewa psalm podczas liturgii.',
                        'Nauczy młodsze harcerki kilku piosenek religijnych.',
                        'Przygotuje spotkanie dla drużyny z okazji Świąt Bożego Narodzenia, Wielkanocnych z elementami pieśni i tekstów właściwych dla danego okresu (wigilia, jasełka, dzielenie jajkiem, Droga Krzyżowa, itp.).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'ekumeniczne',
                sprawData: [

                  SprawData(
                      id: 'mloda_ekumenistka',
                      title: 'Młoda ekumenistka',
                      level: '1',
                      tasks: [
                        'Odwiedzi świątynię innego wyznania chrześcijańskiego (Cerkiew prawosławną, zbór, itp.).',
                        'Wie, czym różnią się nabożeństwa w różnych kościołach.',
                        'Wie, na czym polega ekumenizm.',
                        'Przez czas próby będzie się modliła o pokój między wyznawcami Chrystusa.',
                      ]
                  ),

                  SprawData(
                      id: 'ekumenistka',
                      title: 'Ekumenistka',
                      level: '2',
                      tasks: [
                        'Będzie uczestniczyła w nabożeństwie w innym kościele chrześcijańskim.',
                        'Pozna główne różnice między kościołami chrześcijańskimi (zwyczaje, dogmaty, architektura sakralna).',
                        'Weźmie udział w modlitwach ekumenicznych.',
                      ]
                  ),

                  SprawData(
                      id: 'propagatorka_ekumenizmu',
                      title: 'Propagatorka ekumenizmu',
                      level: '3',
                      tasks: [
                        'Przeprowadzi dla harcerek z drużyny zbiórkę o innych kościołach chrześcijańskich i ekumenizmie.',
                        'Będzie współorganizowała spotkanie młodych chrześcijan z różnych kościołów.',
                        'Zna nauczanie kościoła dotyczące ekumenizmu.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'karol_wojtyla',
                sprawData: [

                  SprawData(
                      id: 'lolek',
                      title: 'Lolek',
                      level: '1',
                      tasks: [
                        'Zna  najważniejsze  wydarzenia z życia Karola Wojtyły.',
                        'Odwiedziła miejsce związane z Karolem Wojtyłą, zna jego historię.',
                        'Wie, kim w Kościele jest papież. Wie, w jakich latach tę posługę sprawował Karol Wojtyła jako Jan Paweł II.',
                        'Zapozna się z wybranym dokumentem pontyfikatu Jana Pawła II (fragmentem książki, listem do wiernych, homilią).',
                        'Zna ulubione modlitwy Jana Pawła II, uczy się je odmawiać.',
                      ]
                  ),

                  SprawData(
                      id: 'wujek',
                      title: 'Wujek',
                      level: '2',
                      tasks: [
                        'Wie, jakie były najważniejsze wydarzenia pontyfikatu Jana Pawła II.',
                        'Przeczyta „List do dzieci «Tra Pochi Giorno»” lub inny dokument papieski.',
                        'Zna przesłania poszczególnych pielgrzymek Jana Pawła II do ojczyzny.',
                        'Zorganizuje zbiórkę, spotkanie o Janie Pawle II wykorzystując multimedia (np. film o papieżu, projekcję zdjęć, nagrań, pieśni).',
                        'Zna ciekawostki związane z życiem Jana Pawła II: symbolikę herbu papieskiego, anegdoty, sławne powiedzenia, itd. Opowie o ich znaczeniu i roli, jaką odegrały.',
                      ]
                  ),

                  SprawData(
                      id: 'jpii',
                      title: 'JP II',
                      level: '3',
                      tasks: [
                        'Zorganizuje pielgrzymkę (dla drużyny, zastępu, grupy przyjaciół) śladami Jana Pawła II, wzbogaconą o rozważanie jego myśli, przesłań i biografii.',
                        'Poprowadzi modlitwę różańcową opartą na refleksjach i dokumentach Jana Pawła II.',
                        'Przeczyta dowolną książkę Jana Pawła II.',
                        'Zapozna się z „Listem Jana Pawła II do kobiet”.',
                        'Zapozna się z jedną z postaci beatyfikowanych bądź kanonizowanych przez Jana Pawła II. Swoją wiedzą podzieli się z innymi.',
                      ]
                  ),

                  SprawData(
                      id: 'wielki_jpii',
                      title: 'Wielki JP II',
                      level: '4',
                      tasks: [
                        'Stworzy projekt propagujący nauczanie i refleksje nad przesłaniem Jana Pawła II w swoim środowisku. Zadba o jego realizację.',
                        'Wzbogaci pracę harcerską o myśli, przesłania Jana Pawła II.',
                        'Przeczyta dzieło literackie (np. sztukę teatralną) Jana Pawła II.',
                        'Zapozna się z 5 dokumentami papieskimi, wskaże jak mogą być one inspiracją do praktyki codziennego życia.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'moja_patronka',
                sprawData: [

                  SprawData(
                      id: 'moja_patronka',
                      title: 'Moja patronka',
                      level: '1',
                      tasks: [
                        'Zna życiorys swojej patronki, opowie kim była.',
                        'Postara się odwiedzić miejsce z nią związane lub kościół pod jej wezwaniem.',
                        'Pracuje nad sobą, stara się być coraz lepsza.',
                        'Podejmie stałą (np. przez okres próby) modlitwę za ludzi nie ochrzczonych. Będzie modliła się za wstawiennictwem swej patronki.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'adalbertus',
                sprawData: [

                  SprawData(
                      id: 'adalbertus',
                      title: 'Adalbertus',
                      level: '2',
                      tasks: [
                        'Wie kim był i co robił św. Wojciech oraz jakie jest znaczenie wydarzeń sprzed 1000 lat dla współczesnej Polski.',
                        'Opracuje z zastępem turystyczną trasę związaną ze św. Wojciechem, zaprezentuje ją w szkole, parafii lub opublikuje w prasie.',
                        'Zapozna się ze współczesną działalnością misyjną.',
                        'Weźmie aktywny udział w spotkaniu z misjonarzem lub przygotowującym się do misji.',
                        'Odbędzie wędrówkę do miejsc związanych z postacią św. Wojciecha (w szczególnej sytuacji może to być np. wystawa w miejscu zamieszkania lub w jego pobliżu).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'jadwiga',
                sprawData: [

                  SprawData(
                      id: 'jadwiga_1',
                      title: 'Jadwiga',
                      level: '1',
                      tasks: [
                        'Zna podstawowe fakty z życia świętej królowej Jadwigi – patronki polskich harcerek.',
                        'Zna legendy o królowej Jadwidze, na ich podstawie potrafi powiedzieć, jakie cechy charakteru miała święta królowa Jadwiga.',
                        'Przez trzy tygodnie będzie pracować nad pozytywną cechą charakteru lub umiejętnością.',
                        'Odnajdzie w okolicy swojego miejsca zamieszkania (w miejscach publicznych) wizerunki królowej Jadwigi lub odszuka reprodukcje portretów, nagrobka, pieczęci Jadwigi w albumach bądź w Internecie. Zaprezentuje je zastępowi razem z przedstawieniem w dowolnej formie jednej z legend o Jadwidze (może w to włączyć inne harcerki).',
                      ]
                  ),

                  SprawData(
                      id: 'jadwiga_2',
                      title: 'Jadwiga',
                      level: '2',
                      tasks: [
                        'Pogłębia swoją wiedzę o królowej Jadwidze, zna jej dokonania – zapozna się z treścią homilii Jana Pawła II ze Mszy Kanonizacyjnej, przeczyta książkę lub inny utwór literacki o królowej Jadwidze (np. Jadwiga i Jagienka, Litwin i Andegawenka).',
                        'Św. Jadwiga modląc się przed czarnym krucyfiksem w wawelskiej katedrze usłyszała słowa „Fac quo vides – czyń, co widzisz”, które zainspirowały ją do intensywnej służby drugiemu człowiekowi. Zgodnie z jej przykładem harcerka podejmie trzytygodniową służbę bliźniemu w zakresie ustalonym z drużynową.',
                        'Przejdzie krakowskimi śladami królowej Jadwigi.',
                        'Wie skąd się wzięło powiedzenie „wojsko królowej Jadwigi”, wzorując się na Niej zażegna lub zakończy konflikt w zastępie, drużynie lub klasie.',
                      ]
                  ),

                  SprawData(
                      id: 'jadwiga_3',
                      title: 'Jadwiga',
                      level: '3',
                      tasks: [
                        'Zapozna się z listem Henryka Bitterfelda do królowej Jadwigi.',
                        'W czasie modlitwy przed Czarnym Krucyfiksem w katedrze wawelskiej rozważy fragment Ewangelii (Łk 10, 38-42) kierując się wskazówkami z listu Henryka do Jadwigi. Zastanowi się, jak ten fragment odnosi się do jej osobistej sytuacji, podejmie postanowienie, służbę związaną z wnioskami z rozważań, zgodnie z ideą Marii i Marty.',
                        'Odwiedzi inne niż Kraków miejsce pobytu Królowej Jadwigi.',
                        'Zorganizuje służbę kościelną (warty przy Grobie Pańskim, oprawę muzyczną Mszy św., itp.).',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'wicek',
                sprawData: [

                  SprawData(
                      id: 'wicek_1',
                      title: 'Wicek',
                      level: '1',
                      tasks: [
                        'Zna życiorys Błogosławionego.',
                        'Potrafi wytłumaczyć dlaczego bł. Stefan Wincenty Frelichowski jest harcerskim patronem oraz wymienić innych patronów harcerskich.',
                        'Postara się odwiedzić grób lub inne miejsca związane z osobą Błogosławionego.',
                        'Weźmie udział w uroczystościach związanych z Błogosławionym.',
                        'Uczestniczy w harcerskich formach życia religijnego.',
                        'Odmawia codziennie dodatkową modlitwę w wybranej intencji lub o kanonizację bł. Frelichowskiego.',
                      ]
                  ),

                  SprawData(
                      id: 'wicek_2',
                      title: 'Wicek',
                      level: '2',
                      tasks: [
                        'Zna życiorys Błogosławionego oraz miejsca związane z jego osobą.',
                        'Potrafi wytłumaczyć, dlaczego bł. Stefan Wincenty Frelichowski jest harcerskim patronem oraz jaka jest„rola patrona” w życiu człowieka.',
                        'Odwiedzi grób lub miejsca związane z osobą Błogosławionego.',
                        'Zaangażuje się w uroczystości religijne związane z Błogosławionym w swoim środowisku.',
                        'Zaprezentuje w dowolnie wybrany sposób osobę – dzieło Błogosławionego.',
                        'Uczestniczy w harcerskich formach życia religijnego, rozwijając własne życie duchowe.',
                        'Zorganizuje lub weźmie udział w niesieniu pomocy potrzebującym.',
                        'Odmawia codziennie dodatkową modlitwę w wybranej intencji lub o kanonizację bł. Frelichowskiego.',
                      ]
                  ),

                  SprawData(
                      id: 'wicek_3',
                      title: 'Wicek',
                      level: '3',
                      tasks: [
                        'Zna życiorys i inne opracowania dotyczące Błogosławionego (szczególnie homilię Ojca Świętego).',
                        'Potrafi wytłumaczyć, dlaczego bł. Stefan Wincenty Frelichowski został patronem harcerstwa i porównać jego życie z innymi patronami harcerskimi (np. Św. Jerzym).',
                        'Doskonali własny rozwój duchowy poszukując inspiracji wśród postaci Świętych (szczególnie kobiet).',
                        'Zorganizuje wyjazd do miejsc związanych z osobą Błogosławionego.',
                        'Będzie współorganizowała uroczystości religijne związane z Błogosławionym w swoim środowisku.',
                        'Zaprezentuje w dowolny sposób osobę – dzieło Błogosławionego w szerszym środowisku.',
                        'Współtworzy życie religijne swojego środowiska doskonaląc własny rozwój duchowy.',
                        'Wskaże i zorganizuje pole służby.',
                        'Odmawia codziennie dodatkową modlitwę w wybranej intencji lub o kanonizację bł. Frelichowskiego.',
                      ]
                  ),

                ]
            ),

          ]
      ),

      SprawGroupData(
          id: 'tradycja_narodowa',
          title: 'Tradycja narodowa',
          familyData: [

            SprawFamilyData(
                id: 'historyczne_1',
                sprawData: [

                  SprawData(
                      id: 'poszukiwaczka_korzeni',
                      title: 'Poszukiwaczka korzeni',
                      level: '1',
                      tasks: [
                        'Zna rodowód swojej rodziny, z informacji rodziców i dziadków stworzy drzewo genealogiczne, opowie o najciekawszych postaciach wśród swoich przodków.',
                        'Odwiedzi miejsce, gdzie rozegrało się jakieś ważne wydarzenie historyczne, potrafi o nim opowiedzieć.',
                        'Odwiedzi miejscowy cmentarz, odnajdzie groby znanych ludzi.',
                        'Weźmie udział w grze historycznej, wieczornicy historycznej lub obchodach ważnej rocznicy.',
                      ]
                  ),

                  SprawData(
                      id: 'tropicielka_dziejow',
                      title: 'Tropicielka dziejów',
                      level: '2',
                      tasks: [
                        'Zna historię swojej miejscowości, wie, kiedy powstała, jakie są jej najważniejsze budowle i pamiątki, jakie sławne postacie są z nią związane.',
                        'Zwiedzi co najmniej: 1 zamek królewski, 2 pałace magnackie, dwór szlachecki, 3 kościoły z różnych epok, obejrzy kamieniczki staromiejskie w dowolnie wybranym mieście Polski.',
                        'Potrafi podzielić historię Polski na okresy, scharakteryzuje każdy z nich.',
                        'Zorganizuje grę historyczną dla zastępu, której wątkiem będzie konkretne wydarzenie historyczne (ślub Jadwigi i Jagiełły, przyjazd Księżnej Kingi, odsiecz Wiednia, itp.).',
                      ]
                  ),

                  SprawData(
                      id: 'historyczka',
                      title: 'Historyczka',
                      level: '3',
                      tasks: [
                        'Przeczyta co najmniej 20 książek o tematyce historycznej.',
                        'Zapozna się z jednym z zabytków archeologicznych Polski z okresu słowiańskiego lub przedsłowiańskiego (Biskupin, Ostrów Tumski, Ostrów Lednicki lub inne).',
                        'Opowie 3 gawędy biorąc za wątek ciekawe i pouczające wydarzenia historyczne.',
                        'Zorganizuje w drużynie obchody jednego ze świąt narodowych nawiązując w wieczornicy, grze lub biegu do wydarzeń z dawnych lat.',
                        'Wprowadzi do obrzędowości obozowej lub na biwaku jeden z okresów historycznych (pokieruje wystrojem obozu, nazewnictwem, scenkami odgrywanymi przez zastępy na podstawie lektur, itp.).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'historyczne_2',
                sprawData: [

                  SprawData(
                      id: 'szperacz_historyczny',
                      title: 'Szperacz historyczny',
                      level: '1',
                      tasks: [
                        'Poszerza swoją wiedzę ponad materiał obowiązujący w szkole.',
                        'Wykona drzewo genealogiczne postaci ważnej dla Polski, uzupełni je w miarę możliwości wizerunkami.',
                        'Odwiedzi miejsce związane z historycznym wydarzeniem.',
                        'Na obozie, biwaku, wcieli się w jedną z postaci historycznych, swoim zachowaniem, strojem oddając klimat tamtych czasów.',
                        'W czasie zbiórki opowie historię związaną z jakimś starym przedmiotem: kronika, proporzec, itp.',
                        'Przeczyta książkę o tematyce historycznej.',
                      ]
                  ),

                  SprawData(
                      id: 'badaczka_historii_polski',
                      title: 'Badaczka historii Polski',
                      level: '2',
                      tasks: [
                        'Zapozna się z datami panowania poszczególnych królów Polski, wie, z jakich dynastii pochodzili.',
                        'Przygotuje plan wycieczki po rodzinnej miejscowości, uwzględniając miejsca ciekawe historycznie.',
                        'Wykona mapę Polski, na której zaznaczy jak zmieniały się granice Polski.',
                        'Opowie 3 legendy związane z historią Polski.',
                        'Przedstawi sposób życia i funkcjonowania pierwszych osadników na ziemiach polskich w dowolnej formie (opowiadanie, komiks, kroniki, itp.).',
                        'Przedstawi proces kształtowania się godła państwowego na przestrzeni wieków.',
                      ]
                  ),

                  SprawData(
                      id: 'historyczka_polski',
                      title: 'Historyczka Polski',
                      level: '3',
                      tasks: [
                        'Zapozna się z powstaniami, które zapisały się na kartach historii. Potrafi opowiedzieć o ich zasługach, przyporządkować je do odpowiednich epok. Odnajdzie grób powstańców.',
                        'Przeprowadzi wywiad z osobą będącą świadkiem ważnych wydarzeń historycznych i opublikuje go.',
                        'Zorganizuje wystawę historyczną dla drużyny.',
                        'Przygotuje dla hufca grę o tematyce historycznej, związaną z obchodami święta narodowego.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'historyczne_2',
                sprawData: [

                  SprawData(
                      id: 'mala_historycznka',
                      title: 'Mała historyczka',
                      level: '1',
                      tasks: [
                        'Wie na czym polega praca historyka, gromadzi pomoce przydatne w pracy historyka (np. atlas, itp.)',
                        'Umie zaznaczyć na osi czasu poszczególne wydarzenia. Prawidłowo przelicza lata na wieki.',
                        'Umie ustalić datę powstania prostych przedmiotów (monet, książek, itp.).',
                        'Narysuje lub wykona inną techniką dowolny herb  i umie opowiedzieć o nim.',
                        'Odnajdzie w domu, harcówce stary przedmiot – wyszuka informacje o jego historii i opowie o nim harcerkom z zastępu.',
                      ]
                  ),

                  SprawData(
                      id: 'badaczka_przeszlosci',
                      title: 'Badaczka przeszłości',
                      level: '2',
                      tasks: [
                        'Poszerza swoją wiedzę o pracy historyków dziś i w przeszłości.',
                        'Umie określać w przybliżeniu w jakiej epoce historycznej powstały wskazane budynki czy przedmioty.',
                        'Opracuje drzewo genealogiczne rodziny z uwzględnieniem różnych śródeł (rozmowa z rodziną, napisy na grobach, akty urodzenia, itp.).',
                        'Zna 10 podstawowych herbów i opowie o ich symbolice.',
                        'Umie przeprowadzić analizę tekstu historycznego (treść, język, styl). Opowie, czego tekst dotyczył, kto jest autorem, itp.',
                        'Ceni stare przedmioty (w domu, harcówce, itp.) czerpie z nich wiedzę, którą wykorzystuje w pracy np. zastępu (stare kroniki, zdjęcia, nagrania, proporce, księgi, itp.).',
                      ]
                  ),

                  SprawData(
                      id: 'badaczka_dziejow',
                      title: 'Badaczka dziejów',
                      level: '3',
                      tasks: [
                        'Stale pracuje nad poszerzaniem warsztatu pracy historyka.',
                        'Umie opowiedzieć o trudnościach czekających na badacza przeszłości.',
                        'Zdobędzie wiedzę praktyczną; np. nauczy się wyznaczać datę Wielkanocy w poszczególnych latach lub przeliczać kalendarz, itp. Zdobyte wiadomości wykorzysta w pracy drużyny.',
                        'Umie wykorzystać wiedzę o heraldyce, numizmatyce, genealogii do tego, by pasją historyczną zarazić młodsze dziewczęta.',
                        'Zgodnie z zasadami pracy historyka (krytyka śródeł, bezstronność, itp.) opracuje np. część historii drużyny. Swą pracę udostępni innym (opowie, umieści na www, itp.)',
                        'Przeczyta książkę o tematyce związanej z badaniami historycznymi.',
                      ]
                  ),

                  SprawData(
                      id: 'historiografka',
                      title: 'Historiografka',
                      level: '4',
                      tasks: [
                        'Swą pracą historyczną wniesie wkład w badania związane z historią harcerstwa, rodziny lub miejscowości.',
                        'Pracę skonsultuje z profesjonalnym historykiem, wzbogaci ją badaniem różnorodnych śródeł.',
                        'Swą pracę opublikuje w prasie lub Internecie.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'solidarnosc',
                sprawData: [

                  SprawData(
                      id: 'solidarnosc_1',
                      title: 'Solidarność',
                      level: '1',
                      tasks: [
                        'Wie czym był Niezależny Samorządny Związek Zawodowy (NSZZ) „Solidarność” w latach 1980 – 1989.',
                        'Zna najważniejsze fakty z walki NSZZ „S” o niepodległość Polski.',
                        'Wymieni nazwiska 3 osób które przewodziły tej walce.',
                        'Zna 3 pieśni śpiewane w stanie wojennym.',
                        'Wykona dowolną techniką stempel ze znakiem Polski Walczącej.',
                        'Odnajdzie ślady działalności NSZZ „Solidarność” w swojej miejscowości lub okolicy.',
                      ]
                  ),

                  SprawData(
                      id: 'solidarnosc_2',
                      title: 'Solidarność',
                      level: '2',
                      tasks: [
                        'Wie czym był NSZZ „Solidarność” w latach 1980 – 1989, zna najważniejsze fakty z  walki  NSZZ  „S”  o niepodległość Polski.',
                        'Wymieni nazwiska 6 osób  które przewodziły tej walce i krótko o nich opowie.',
                        'Wie co to jest wydawnictwo „drugiego obiegu”. Przeczyta co najmniej 1 pozycję z tej literatury (ulotka, książka, gazeta).',
                        'Przeczyta książkę „Wielka Gra” A. Kamińskiego – pozna tajniki konspiracji.',
                        'Zna 5 pieśni śpiewanych w stanie wojennym.',
                        'Odda hołd (zapali znicz, złoży kwiaty) w miejscu pamięci związanym z NSZZ „Solidarność”.',
                      ]
                  ),

                  SprawData(
                      id: 'solidarnosc_3',
                      title: 'Solidarność',
                      level: '3',
                      tasks: [
                        'Zna historię walki NSZZ „Solidarność” o niepodległość Polski w latach 1980 – 1989.',
                        'Wymieni nazwiska 10 osób które przewodziły tej walce, krótko o nich opowie. Wyjaśni rolę Jana Pawła II w obaleniu komunizmu.',
                        'Wie co to jest wydawnictwo „drugiego obiegu”. Przeczyta co najmniej 5 pozycji z tej literatury (ulotka, książka, gazeta).',
                        'Przeczyta książkę „Folwark zwierzęcy” G. Orwella – na jej podstawie potrafi scharakteryzować zasadnicze elementy systemu komunistycznego i historii ruchu komunistycznego.',
                        'Zgromadzi zbiór min. 20 pieśni śpiewanych w stanie wojennym i zaśpiewa co najmniej 5 z nich.',
                        'Wyjaśni znaczenie powstania i walki NSZZ „Solidarność” dla współczesnej Polski i jej obywateli.',
                        'Przedstawi udział harcerstwa w walce z komunizmem w latach 1945 – 1989.',
                      ]
                  ),

                  SprawData(
                      id: 'solidarnosc_4',
                      title: 'Solidarność',
                      level: '4',
                      tasks: [
                        'Zna historię walki NSZZ „Solidarność” o niepodległość Polski w latach 1980 – 1989.',
                        'Zna nazwiska 20 osób przewodzących tej walce i przedstawicieli władz komunistycznych, krótko o nich opowie. Wyjaśni rolę Jana Pawła II w obaleniu komunizmu.',
                        'Wie co to jest wydawnictwo „drugiego obiegu”. Zgromadzi zbiór co najmniej 10 pozycji z tej literatury (ulotka, książka, gazeta) i zaprezntuje w swoim środowisku w dowolnej formie.',
                        'Przeczyta książkę lub obejrzy film na podstawie którego będzie potrafiła scharakteryzować postawy Polaków wobec władzy komunistycznej.',
                        'Zgromadzi zbiór min. 20 pieśni śpiewanych w stanie wojennym i zaśpiewa co najmniej 5 z nich.',
                        'Wyjaśni znaczenie powstania i walki NSZZ „Solidarność” dla współczesnej Polski i jej obywateli, przeprowadzi zbiórkę na ten temat, z zaproszeniem osoby, która brała czynny udział w tej walce.',
                        'Przedstawi udział harcerstwa w walce z komunizmem w latach 1980 – 1989 (artykuł, prezentacja multimedialna, gra, zbiórka, gawęda).',
                        'Przeprowadzi wywiad z 1 instruktorką/em harcerskim zaangażowanym w działalność niezależnego harcerstwa lub podziemnej „Solidarności”. Dokumentację z tego wywiadu (zapis komputerowy na płycie CD) prześle do Zespołu Historycznego ZHR.',
                      ],
                      comment: 'Pieśni śpiewane w stanie wojennym:'
                          '\n- „Ojczyno ma”,'
                          '\n- „Solidarni”,'
                          '\n- „Każdy Twój wyrok”,'
                          '\n- „Piosenka dla córki”,'
                          '\n- „Mury”,'
                          '\n- „Ballada o Janku Wiśniewskim”,'
                          '\n- „Zbroja”,'
                          '\n- „Obława”,'
                          '\n- „Zielona wrona”,'
                          '\n- „Nie chcemy komuny”,'
                          '\n- „Źródło”,'
                          '\n- „Pieśń konfederatów barskich”,'
                          '\n- „Brygadzista Albin”,'
                          '\n- „Dezyderata”,'
                          '\n- „Żeby Polska była Polską”.'
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'wiez_pokolen',
                sprawData: [

                  SprawData(
                      id: 'wiez_pokolen_1',
                      title: 'Więź pokoleń',
                      level: '1',
                      tasks: [
                        'Z szacunkiem odnosi się do ludzi starszych.',
                        'Rozumie pojęcie patriotyzmu, zna swoje powinności względem Polski.',
                        'Potrafi wskazać na swoim osiedlu (w swojej miejscowości) miejsca związane z walkami o niepodległość Polski.',
                        'Wraz z zastępem (drużyną) odwiedzi i uporządkuje mogiły, pomnik lub inne miejsce pamięci.',
                        'Weźmie udział w spotkaniu z seniorami.',
                        'Weźmie udział razem z drużyną w obchodach uroczystości patriotycznych.',
                      ]
                  ),

                  SprawData(
                      id: 'wiez_pokolen_2',
                      title: 'Więź pokoleń',
                      level: '2',
                      tasks: [
                        'Potrafi uszanować miejsca pamięci narodowej. Daje przykład postawy patriotycznej w swojej rodzinie.',
                        'Zgłębia, poprzez kontakt z seniorami, przedwojenne zwyczaje i tradycje polskie w tym również harcerskie. Przeczyta książkę na temat II Wojny Światowej, w ciekawy sposób przedstawi zdobytą wiedzę na zbiórce zastępu lub drużyny.',
                        'Rozumie pojęcie „Więś Pokoleń”.',
                        'Przygotuje zbiórkę zastępu dotyczącą miejsc związanych z działaniami wojennymi.',
                        'Pełni służbę na rzecz seniorów.',
                        'Będzie pełniła służbę w czasie uroczystości patriotycznych (wartę honorową, służbę w poczcie sztandarowym, itp.).',
                      ]
                  ),

                  SprawData(
                      id: 'wiez_pokolen_3',
                      title: 'Więź pokoleń',
                      level: '3',
                      tasks: [
                        'Własną postawą daje wyraz patriotyzmu i pamięci narodowej w swoim środowisku. Może być przykładem dla innych.',
                        'Wie, czym była druga konspiracja młodzieży, przeczytała na jej temat wybraną książkę, obejrzała film.',
                        'Pogłębia swoją wiedzę nt. działań harcerskich w czasie II Wojny Światowej (np. przeczyta kolejne książki, przeprowadzi wywiady), zna powojenne losy wybranych postaci.',
                        'W ciekawy sposób zaprezentuje zdobyte materiały i wiedzę (wystawa, film, gazetka, itp.).',
                        'Nawiąże trwały kontakt z seniorką, seniorem lub środowiskiem seniorów (zorganizuje pole służby, pozna tradycje, przeprowadzi ankietę, itp.).',
                        'Zorganizuje i poprowadzi harcerskie obchody uroczystości patriotycznych na szczeblu  lokalnym (w miejscowości, gminie, wraz z drużyną, hufcem).',
                      ]
                  ),

                  SprawData(
                      id: 'wiez_pokolen_4',
                      title: 'Więź pokoleń',
                      level: '4',
                      tasks: [
                        'Wie, jak współcześnie rozumieć pojęcie patriotyzmu. Potrafi w swojej postawie łączyć pamięć o przeszłości z bieżącą służbą Polsce.',
                        'Zbiera i prezentuje materiały dotyczące dziedzictwa organizacji harcerskich. Współpracuje w tym zakresie z odpowiednimi archiwami.',
                        'Zbuduje ogniwo „Więzi Pokoleń” lub będzie koordynowała pracę ogniwa już istniejącego przez przynajmniej 3 m-ce (trwała współpraca konkretnych środowisk, przekazanie barw, sztandaru, przyjęcie patrona, itp.).',
                        'Skoordynuje harcerskie obchody uroczystości patriotycznych na dużą skalę (chorągiew, cała organizacja).',
                        'Posiada konkretne pole służby, w którym uczy innych postawy patriotycznej (w harcerstwie lub w innych organizacjach, ruchach, grupach).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'kresy',
                sprawData: [

                  SprawData(
                      id: 'kresy_1',
                      title: 'Kresy',
                      level: '1',
                      tasks: [
                        'Wie, co to są Kresy. Interesuje się tą tematyką, zbiera materiały na temat Kresów',
                        'Weźmie udział w służbie na rzecz Polaków na Kresach.',
                        'Weźmie udział w zbiórce harcerskiej poświęconej tematyce kresowej.',
                        'Zaprezentuje na zbiórce zastępu album lub książkę poświęconą jednemu z polskich miast kresowych lub historii Kresów.'
                      ]
                  ),

                  SprawData(
                      id: 'kresy_2',
                      title: 'Kresy',
                      level: '2',
                      tasks: [
                        'Odwiedzi dawne Kresy Rzeczypospolitej lub nawiąże kontakt z Polakami na Kresach.',
                        'Potrafi krótko opowiedzieć o sytuacji Polaków mieszkających na Łotwie, Litwie, Białorusi i Ukrainie.',
                        'Weźmie udział w służbie na Kresach lub na ich rzecz.',
                        'Będzie współorganizowała spotkanie związane z tematyką kresową.',
                        'Zapozna się z 1 książką o tematyce kresowej.',
                      ]
                  ),

                  SprawData(
                      id: 'kresy_3',
                      title: 'Kresy',
                      level: '3',
                      tasks: [
                        'Zorganizuje lub weźmie udział w organizacji wyjazdu na Kresy RP.',
                        'Odnajdzie i przygotuje dla jednostki harcerskiej służbę na Kresach lub na ich rzecz.',
                        'Zorganizuje wydarzenie edukacyjne promujące tematykę Kresową.',
                        'Napisze i zamieści w jednym z wydawnictw harcerskich recenzję książki poświęconej Kresom.',
                        'Weźmie udział w programie dotyczącym Kresów.',
                        'Podejmie współpracę ze stowarzyszeniem działającym na rzecz Polaków poza Krajem.',
                      ]
                  ),

                  SprawData(
                      id: 'kresy_4',
                      title: 'Kresy',
                      level: '4',
                      tasks: [
                        'Będzie koordynowała chorągwianą lub ogólnopolską służbę na rzecz Kresów.',
                        'Wniesie trwały wkład w porządkowanie i promowanie wiedzy o Kresach.',
                        'Utrzymuje kontakt z polskim środowiskiem na Kresach.',
                        'Współpracuje ze stowarzyszeniem działającym na rzecz Polaków na Wschodzie.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'golgota_wschodu',
                sprawData: [

                  SprawData(
                      id: 'golgota_wschodu_1',
                      title: 'Golgota wschodu',
                      level: '2',
                      tasks: [
                        'Odwiedzi miejsca związane z „Golgotą Wschodu” w swojej okolicy. Przy jednym z nich podejmie służbę (trzymanie warty, sprzątanie).',
                        'Wyjaśni pojęcie „Golgota Wschodu”. Przedstawi, w dowolnej formie, w środowisku pozaharcerskim informacje dotyczące Zbrodni Katyńskiej.',
                        'Weźmie udział w uroczystościach związanych z „Golgotą Wschodu”.',
                        'Razem z zastępem nawiąże kontakt ze środowiskiem Rodziny Katyńskiej, który zaowocuje konkretnymi działaniami.',
                        'Ćwiczy hart ducha, jest wierna wartościom narodowym.',
                      ]
                  ),

                  SprawData(
                      id: 'golgota_wschodu_2',
                      title: 'Golgota wschodu',
                      level: '3',
                      tasks: [
                        'Jest przewodnikiem po miejscach związanych z „Golgotą Wschodu” w swojej okolicy.',
                        'Zbierze jak najwięcej informacji dotyczących „Golgoty Wschodu” i zaprezentuje je w środowisku pozaharcerskim podczas seminarium, debaty historycznej, itp.',
                        'Weźmie udział w wyjeśdzie do Katynia.',
                        'Wraz z drużyną weźmie udział w uroczystościach związanych z „Golgotą Wschodu”.',
                        'Nawiąże kontakt ze środowiskiem Rodziny Katyńskiej, który zaowocuje konkretnymi działaniami.',
                        'Potrafi zdefiniować, czym są dla niej wartości narodowe.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'symbole_narodowe',
                sprawData: [

                  SprawData(
                      id: 'flaga',
                      title: 'Flaga',
                      level: '1',
                      tasks: [
                        'Umie zaśpiewać 4 zwrotki hymnu narodowego. Wie jak zachować się przy śpiewaniu hymnu.',
                        'Zna historię godła narodowego, potrafi je naszkicować.',
                        'Weźmie udział w obchodach święta narodowego.',
                        'Posiada flagę, wie, kiedy ją wywiesić i pamięta o tym obowiązku.',
                        'Jest dumna z tego, że jest Polką.',
                      ]
                  ),

                  SprawData(
                      id: 'odkrywca_symboli_narodowych',
                      title: 'Odkrywca symboli narodowych',
                      level: '2',
                      tasks: [
                        'Zna historię powstania hymnu narodowego, umie wymienić poprzednie pieśni pełniące rolę hymnu.',
                        'Wykona godło narodowe ciekawą techniką.',
                        'Przeprowadzi w zastępie ciekawą zbiórkę z okazji święta narodowego.',
                        'Wraz z harcerkami z zastępu przeprowadzi akcję „Flaga” promującą wywieszanie flag na święta narodowe.',
                        'Odwiedzi miejsce związane z hymnem narodowym lub wystawę związaną z polskimi symbolami narodowymi.',
                        'Umie wytłumaczyć, dlaczego jest dumna z tego, że jest Polką.',
                      ]
                  ),

                  SprawData(
                      id: 'znawczyni_symboli_narodowych',
                      title: 'Znawczyni symboli narodowych',
                      level: '3',
                      tasks: [
                        'Przeprowadzi ciekawe obchody święta narodowego dla drużyny lub hufca.',
                        'Odwiedzi Muzeum Hymnu Narodowego w Będominie.',
                        'Wykaże się znajomością historii polskich symboli narodowych. Wie jakie miały znaczenie w historii narodu polskiego.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'patriotka',
                sprawData: [

                  SprawData(
                      id: 'patriotka',
                      title: 'Patriotka',
                      level: '3',
                      tasks: [
                        'Aktywnie uczestniczy w tworzeniu współczesnej kultury polskiej  w skali lokalnej. Swoje uczestnictwo potrafi udokumentować.',
                        'Nawiąże kontakt z polskim harcerstwem poza granicami kraju.',
                        'Zorganizuje wycieczkę dla harcerek w miejsce ważne dla polskiej historii.',
                        'Zrealizuje projekt reklamowania kultury  polskiej w społeczności lokalnej (szkole, dzielnicy, itd.).'
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'polska_w',
                sprawData: [

                  SprawData(
                      id: 'polska_w_europie',
                      title: 'Polska w Europie',
                      level: '1',
                      tasks: [
                        'Potrafi pokazać na mapie wszystkie państwa Unii Europejskiej.',
                        'Zna symbolikę flagi UE.',
                        'Wykona plakat promujący Polskę w Europie.',
                        'Krótko opowie o swojej drużynie w jednym z języków europejskich (poza polskim).'
                      ]
                  ),

                  SprawData(
                      id: 'polska_w_swiecie',
                      title: 'Polska w swiecie',
                      level: '2',
                      tasks: [
                        'Wie, do jakich głównych organizacji międzynarodowych należy Polska i jakie ma to dla niej konsekwencje',
                        'W ciekawy sposób opowie o wybranym wydarzeniu z historii Polski, które wpłynęło na historię świata.',
                        'Zbierze informacje o harcerstwie polskim w innych krajach i podzieli się nimi z innymi harcerkami.',
                        'Weźmie udział w wydarzeniu kulturalnym o światowym zasięgu organizowanym przez Polaków lub w Polsce.',
                      ]
                  ),

                ]
            ),
          ]
      ),

      SprawGroupData(
          id: 'tradycja_harcerska',
          title: 'Tradycja harcerska',
          familyData: [

            SprawFamilyData(
                id: 'czerwone_korale',
                sprawData: [

                  SprawData(
                      id: 'czerwone_korale',
                      title: 'Czerwone korale',
                      level: '1',
                      tasks: [
                        '1.	Weźmie udział w przygotowaniu i przeprowadzeniu gry dla zastępu, poświęconej Oldze Drahonowskiej-Małkowskiej.',
                        '2.	Wystąpi na kominku poświęconym Oldze z recytacją wiersza jej autorstwa.',
                        '3.	Zna symbolikę i historię pomnika nagrobnego Małkowskich w Zakopanem.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'kronika_historii_harcerstwa_zenskiego',
                sprawData: [

                  SprawData(
                      id: 'kronika_historii_harcerstwa_zenskiego',
                      title: 'Kronika historii harcerstwa żeńskiego',
                      level: '2',
                      tasks: [
                        'Zapozna się szczegółowo z ważnym wydarzeniem z historii harcerstwa żeńskiego w swojej miejscowości związanym z drużyną lub patronką tej drużyny lub swoim środowiskiem działania.',
                        'Przygotuje w formie karty informacje, wspomnienia, zdjęcia prezentujące to wydarzenie.',
                        'Swoją kartę zaprezentuje na wystawie, np. w harcówce, siedzibie hufca.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'opowiedz_mi_swoja_historie',
                sprawData: [

                  SprawData(
                      id: 'opowiedz_mi_swoja_historie',
                      title: 'Kronika historii harcerstwa żeńskiego',
                      level: '3',
                      tasks: [
                        'W swojej miejscowości lub w okolicy odnajdzie dawną instruktorkę lub harcerkę, nawiąże z nią znajomość, pozna jej potrzeby i w razie konieczności udzieli pomocy.',
                        'Zapozna się szczegółowo z okresem w historii harcerstwa związanym z działalnością seniorki.',
                        'Przeprowadzi wywiad z seniorką na podstawie wzoru ankiety opracowanej przez Zespół Historyczny ZHR, a jego wydruk i wersję elektroniczną prześle do archiwum Organizacji Harcerek.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'kronikarskie',
                sprawData: [

                  SprawData(
                      id: 'kronikarka',
                      title: 'Kronikarka',
                      level: '2',
                      tasks: [
                        'Poprowadzi kronikę zastępu lub drużyny przynajmniej przez 3 miesiące lub jeden obóz, dbając o jej wartość historyczną (daty, miejsca, nazwiska) i aktualność.',
                        'Sporządzi notatki w kronice na podstawie opowiadania lub wywiadu.',
                        'Zaprojektuje oprawę plastyczną kroniki.',
                        'Zastosuje kilka rodzajów pisma ozdobnego i technik ilustracyjnych.',
                        'Umiejętnie skorzysta w prowadzeniu kroniki z pomocy innych członków zastępu lub drużyny, zamówi u nich fotografie, rysunki, teksty.',
                        'Zadba aby kronika była zabierana na wycieczki i uroczystości harcerskie, postara się o wpisy osób i inne pamiątki.',
                      ]
                  ),

                  SprawData(
                      id: 'dziejopisarka',
                      title: 'Dziejopisarka',
                      level: '3',
                      tasks: [
                        'Zbierze materiały i opracuje wraz z zespołem historię swojego środowiska (drużyny, szczepu itp.) zarys dziejów, historia drużyn.',
                        'Zbierze materiały i opracuje wraz z zespołem historię swojego środowiska (drużyny, szczepu itp.) sylwetki instruktorek.',
                        'Zbierze materiały i opracuje wraz z zespołem historię swojego środowiska (drużyny, szczepu itp.) chronologia większych wydarzeń, obozów i funkcyjnych.',
                        'Zbierze materiały i opracuje wraz z zespołem historię swojego środowiska (drużyny, szczepu itp.) opis tradycji i zwyczajów.',
                        'Zbierze materiały i opracuje wraz z zespołem historię swojego środowiska (drużyny, szczepu itp.) podanie bibliografii.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'historia_harcerstwa',
                sprawData: [

                  SprawData(
                      id: 'badaczka_historii_harcerstwa',
                      title: 'Badaczka historii harcerstwa',
                      level: '2',
                      tasks: [
                        'Scharakteryzuje główne okresy działalności harcerstwa od powstania po dzień dzisiejszy, przedstawi daty, wydarzenia, główne  postacie z tych okresów, symbolikę, obrzędy.',
                        'Posiada śpiewniczek starych piosenek harcerskich, wie, z jakiego okresu pochodzą.',
                        'Odwiedzi z zastępem miejsce związane z harcerską historią (wystawę, tablicę pamiątkową, grób), będzie pełniła rolę przewodniczki.',
                        'Weźmie udział w przygotowaniu i prowadzeniu wieczornicy dla drużyny (kominek, ognisko, teatr) poświęconej wybranemu zagadnieniu z historii harcerstwa.',
                        'Zna historię lokalnej organizacji harcerskiej działającej podczas II wojny światowej lub w ramach tzw. drugiej konspiracji.',
                      ]
                  ),

                  SprawData(
                      id: 'znawczyni_historii_harcerstwa',
                      title: 'Znawczyni historii harcerstwa',
                      level: '3',
                      tasks: [
                        'Przeczyta 8 książek i wiele artykułów związanych z historią harcerstwa.',
                        'Potrafi scharakteryzować sylwetki i przedstawić fakty z życia znanych instruktorek, o 3 z nich opowie gawędy.'
                            'Nawiąże bezpośredni kontakt z byłą instruktorką, pozna dzieje jej służby, zapozna się z posiadanymi przez nią pamiątkami, będzie utrzymywać z nią kontakt z okazji świąt, rocznic, itp.',
                        'Wykona sama lub w zespole pracę obrazującą dzieje i dorobek polskiego harcerstwa (gazetka, wystawa, artykuł do prasy harcerskiej, album, prezentacja multimedialna).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'badaczka_historii_zhr',
                sprawData: [

                  SprawData(
                      id: 'badaczka_historii_zhr',
                      title: 'Badaczka historii ZHR',
                      level: '2',
                      tasks: [
                        'Zna genezę powstania ZHR. Przeprowadzi wywiad z instruktorką na temat historii ZHR (wyjaśnienie pojęć mały, średni i duży ZHR, ważne wydarzenia, itd.).',
                        'Potrafi  wymienić  Naczelniczki  Harcerek  w  ZHR i ZHP – r. zał. 1918.',
                        'Odwiedzi jedno z miejsc, w którym rozegrało się ważne wydarzenie dla ZHR – potrafi o tym wydarzeniu opowiedzieć.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'badz_gotow',
                sprawData: [

                  SprawData(
                      id: 'badz_gotow_1',
                      title: 'Bądź gotów',
                      level: '1',
                      tasks: [
                        'Zna znaczenie i historię haseł: „Czuwaj”, „bądź Gotów”.',
                        'Wie, kiedy się rozpoczęła i zakończyła II wojna światowa, czym było Powstanie Warszawskie, kiedy się rozpoczęło, kiedy zakończyło, co to była Akcja „Burza”.',
                        'Wie, jaką rolę pełnili harcerki i harcerze w Powstaniu Warszawskim.',
                        'Przeczyta wspomnienia z Powstania Warszawskiego min. 2 harcerek.',
                        'Nauczy się nowej piosenki powstańczej.',
                        'Razem z zastępem (drużyną) odwiedzi i uporządkuje mogiły, pomnik, lub inne miejsce pamięci poświęcone pamięci ofiar II Wojny Światowej.',
                        'Weźmie udział razem z drużyną w uroczystości patriotycznej poświęconej wydarzeniom II Wojny Światowej.',
                      ]
                  ),

                  SprawData(
                      id: 'badz_gotow_2',
                      title: 'Bądź gotów',
                      level: '2',
                      tasks: [
                        'Rozumie, co dla harcerki oznacza służba Polsce, stara się dobrze tę służbę wypełniać.',
                        'Zna podstawowe fakty z historii II Wojny Światowej, a w szczególności Powstania Warszawskiego i Akcji „Burza”.',
                        'Wie, czy w jej miejscowości miały miejsce działania w ramach Akcji „Burza”, jeżeli tak, to potrafi wskazać najważniejsze miejsca upamiętniające  lub  związane z tymi wydarzeniami.',
                        'Przeczyta książkę dotyczącą udziału harcerek i harcerzy w Powstaniu Warszawskim.',
                        'Potrafi zaśpiewać 3 piosenki powstańcze, zna na pamięć przynajmniej jeden wiersz o tematyce powstańczej.',
                        'Korzystając ze zdobytej wiedzy na temat Akcji „Burza” i Powstania Warszawskiego przygotuje i przeprowadzi ciekawą zbiórkę zastępu.',
                        'Weźmie udział wraz z drużyną w obchodach rocznicy wybuchu Powstania Warszawskiego (centralnych lub lokalnych) lub rocznicy Akcji „Burza” (w swojej miejscowości lub innej).',
                      ]
                  ),

                  SprawData(
                    id: 'badz_gotow_3',
                    title: 'Bądź gotów',
                    level: '3',
                    tasks: [
                      'Znajdzie postać harcerki biorącej udział w Powstaniu Warszawskim, która może być dla niej wzorem postępowania. Postara się ją naśladować (powinna to być inna postać niż patronka drużyny. Nowa dla harcerki.).',
                      'Zna historię II Wojny Światowej, a w szczególności Akcji „Burza” i Powstania Warszawskiego, potrafi powiązać te wydarzenia z szerszym kontekstem historycznym.',
                      'Potrafi wskazać miejsca upamiętniające lub związane z Akcją „Burza” w swojej lub pobliskiej miejscowości. Zna najważniejsze miejsca upamiętniające Powstanie Warszawskie.',
                      'Przeczytała kolejną książkę o Powstaniu Warszawskim i/lub Akcji „Burza”.',
                      'Wykorzystując zdobytą wiedzę a także elementy powstańczej twórczości (wiersze, piosenki, rysunki) przygotuje ciekawe zajęcia w drużynie (gra, kominek, cykl zbiórek, itp.) lub w środowisku pozaharcerskim (np. gra lub ognisko na obozie dla miejscowych dzieci, itp.).',
                      'Weźmie aktywny udział w obchodach rocznicy Akcji',
                      '„Burza” w swojej lub pobliskiej miejscowości lub w obchodach rocznicy wybuchu Powstania Warszawskiego (centralnych lub lokalnych) – np. warta przy grobach lub pomniku, poczet sztandarowy.',
                    ],
                  ),

                  SprawData(
                    id: 'badz_gotow_4',
                    title: 'Bądź gotów',
                    level: '4',
                    tasks: [
                      'Całym swoim życiem pełni służbę Polsce, jest przykładem postępowania dla swojej rodziny, znajomych.',
                      'Zna bibliografię poświęconą Akcji „Burza” i Powstaniu Warszawskiemu, poleci książkę młodszej harcerce.',
                      'Nawiąże kontakt z uczestnikiem Akcji „Burza” lub Powstania Warszawskiego (np. przeprowadziła wywiad dla archiwum harcerstwa, zorganizowała spotkanie dla swojego środowiska harcerskiego, włączyła się w działania organizacji kombatanckiej, itp.)',
                      'Poszerza swoją wiedzę nt. Powstania Warszawskiego lub Akcji „Burza”.',
                      'Propaguje wiedzę o Powstaniu Warszawskim w swojej rodzinie lub środowisku pozaharcerskim.',
                      'Przygotuje całość lub fragment obchodów centralnych lub lokalnych rocznicy wybuchu Powstania Warszawskiego lub Akcji „Burza”.',
                    ],
                  ),

                ]
            ),

          ]
      ),

      SprawGroupData(
          id: 'obozowe_i_gospodarcze',
          title: 'Obozowe i gospodarcze',
          familyData: [

            SprawFamilyData(
                id: 'pionierkowe',
                sprawData: [

                  SprawData(
                      id: 'sobieradek_obozowy',
                      title: 'Sobieradek obozowy',
                      level: '1',
                      tasks: [
                        'Samodzielnie, w dobrym tempie rozwinie i zwinie namiot 2-osobowy.',
                        'Bezpiecznie rozpali ognisko, zagasi i zatrze jego ślady.',
                        'Sprawnie posługuje się w pracach pionierskich piłą, siekierą i łopatką saperską.',
                        'Wykona z zastępem zabudowę namiotu (prycze, półki). W pracach pionierskich posługuje się wymiarami własnego ciała (wzrost, rozpiętość palców i ramion, długość stopy).',
                        'Wykona prosty przedmiot przydatny na biwaku lub obozie (drogowskaz, kosz na śmieci, wieszak, świecznik, itp.).',
                        'W pracach pionierskich zastosuje 4 węzły.',
                        'Dba o sprzęt obozowy (pamięta o wysuszeniu i wyczyszczeniu namiotu, odkłada sprzęt pionierski na miejsce).',
                      ]
                  ),

                  SprawData(
                      id: 'pionierka',
                      title: 'Pionierka',
                      level: '2',
                      tasks: [
                        'Rozbije z zastępem w dobrym tempie namiot 10-osobowy.',
                        'Rozpali ognisko w trudnych warunkach (np. po deszczu, trzema zapałkami).',
                        'Rozplanuje w terenie biwak zastępu.',
                        'Zaplanuje i wykona funkcjonalne i estetyczne dowolne urządzenie obozowe typu: półka namiotowa, stojak, stół.',
                        'Zbuduje polowe urządzenie sanitarne.',
                        'Konserwuje i przygotowuje sprzęt obozowy: reperuje namioty, ostrzy piłę i siekierę, osadza trzonki.',
                        'Posłuży się węzłami w pracach pionierskich.',
                      ]
                  ),

                  SprawData(
                      id: 'obozowiczka',
                      title: 'Obozowiczka',
                      level: '3',
                      tasks: [
                        'Pokieruje rozbiciem namiotów różnych typów.',
                        'Wykaże się wprawą w ścinaniu drzewa o grubości 15-18 cm w odziomku.',
                        'Rozpozna w terenie gatunki drzewa przydatne do prac pionierskich, właściwie je zastosuje.',
                        'Zbuduje wg własnego projektu duże urządzenie obozowe (bramę, pomost, kuchnię, piec kuchenny, ziemiankę, itp.).',
                        'W zdobnictwie obozowym uwzględnia zasady puszczańskiej estetyki, wykona element zdobnictwa obozowego.',
                        'Pokieruje naprawą i konserwacją sprzętu obozowego, suszeniem i talkowaniem namiotów, osadzaniem i ostrzeniem siekier, konserwacją sprzętu pływającego, itp.',
                        'Zna i stosuje zasady ekologicznego obozowania, wprowadza je w życie, zachęca do nich innych.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_obozownictwa',
                      title: 'Mistrzyni obozownictwa',
                      level: '4',
                      tasks: [
                        'Pokieruje budową obozu stałego w terenie leśnym:',
                        'Dokona zwiadu kwatermistrzowskiego przed obozem (rozpoznanie terenu, szkic terenu, zamówienie budulca, ujęcie wody, itp.).',
                        'Rozplanuje zabudowę obozu (podział terenu na części: mieszkalną, gospodarczą, rekreacyjną, sanitarną, rozmieszczenie namiotów i  urządzeń w poszczególnych częściach).',
                        'Sporządzi projekty urządzeń obozowych lub zatwierdzi projekty przedstawione przez inne harcerki.',
                        'Zgromadzi potrzebny sprzęt i materiały.',
                        'Pokieruje pracami pionierskimi przekazując na czas obóz gotowy do otwarcia.',
                        'Pokieruje likwidacją obozu pozostawiając teren w bardzo dobrym stanie.',
                        'Obóz zostanie zbudowany i zlikwidowany z uwzględnieniem obowiązujących zasad obozowania (przepisy ochrony środowiska, przyrody, przeciwpożarowe, zarządzenia SANEPID-u).',
                        'Nauczy młodszych jednej z trudniejszych prac pionierskich.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'spanie_w_lesie',
                sprawData: [

                  SprawData(
                      id: 'pietaszek',
                      title: 'Piętaszek',
                      level: '1',
                      tasks: [
                        'Uprawia harce leśne, weźmie udział w co najmniej 3 grach terenowych.',
                        'Zachowuje dobrą orientację w terenie, wyprowadzona 2 km w nieznanym terenie leśnym powróci bez błądzenia.',
                        'Spędzi z zastępem 24 godz. w lesie (od śniadania do śniadania), z dala od obozu i skupisk ludzkich.',
                        'W trakcie pobytu w lesie weźmie udział w budowie szałasu, legowiska, przygotowaniu posiłków.',
                        'W ciekawej formie przedstawi relację z pobytu w lesie.',
                        'Zapozna się z życiem Robinsona Cruzoe, bohaterem „Tajemniczej Wyspy” J. Verne lub inną książką o podobnej tematyce.',
                      ]
                  ),

                  SprawData(
                      id: 'traper',
                      title: 'Traper',
                      level: '2',
                      tasks: [
                        'Poza obrębem obozu harcerskiego zbuduje dla siebie szałas i go zagospodaruje (legowisko, ława, palenisko, itp.).',
                        'Spędzi w szałasie jedną dobę.',
                        'W przygotowaniu posiłków uwzględni produkty leśne.',
                        'W czasie samotnego pobytu w lesie będzie ćwiczyć:',
                        '\n - wzrok – przez okres 2 godzin tropiąc ślady zwierząt,',
                        '\n - słuch – przez l godzinę notując leśne odgłosy.',
                        '\n - węch – przez l godzinę notując w pamięci zapachy roślin leśnych.',
                        'Przedstawi notatki z przeprowadzonych ćwiczeń.',
                        'Z dostępnych w lesie materiałów wykona 3 pomysłowe przedmioty o praktycznym zastosowaniu.',
                      ]
                  ),

                  SprawData(
                      id: 'lesny_czlowiek',
                      title: 'Leśny człowiek',
                      level: '3',
                      tasks: [
                        'Spędzi samotnie noc na drzewie w wykonanym przez siebie legowisku.',
                        'Mając: 0,5 kg chleba, sól, menażkę, nóż i 6 zapałek przygotuje z produktów leśnych dwa smaczne posiłki.',
                        'Upiecze na ogniu drób lub rybę.',
                        'Nauczy harcerki z drużyny palenia różnych rodzajów ognisk (po dwa ogniska z każdego typu – stałe, przenośne, ogrzewcze).',
                      ]
                  ),

                  SprawData(
                      id: 'robinson',
                      title: 'Robinson',
                      level: '4',
                      tasks: [
                        'Spędzi samotnie tydzień na „bezludnej wyspie” mając za przyjaciela wybrane zwierzę (pies, papuga, koza, itp.). Nie będzie się w tym czasie z nikim kontaktować (dozwolone jest jedynie ustalenie sygnału alarmowego w razie niebezpieczeństwa). Czas wykorzysta na naukę i własny rozwój (np. obcojęzycznych zwrotów z „rozmówek” w języku, którego zaczyna się uczyć).',
                        'Zagospodaruje wyspę zmagazynuje żywność (ew. wodę), sprzęt, odzież, leki, książki, itp., ilość rzeczy nie może przekraczać jednorazowego przewozu łódką,',
                        'Zagospodaruje wyspę zbuduje szałas, zagospodaruje się na wyspie pomysłowo i wygodnie korzystając z materiałów zastanych na wyspie i przywiezionych ze sobą,',
                        'Zagospodaruje wyspę zapewni dobre warunki życia zabranym ze sobą zwierzętom,',
                        'Zagospodaruje wyspę sporządzi podczas próby notatki z obserwacji i przemyśleń.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'trzy_piora',
                sprawData: [

                  SprawData(
                    id: 'trzy_piora',
                    title: 'Trzy pióra',
                    level: '4',
                    tasks: [
                      'Przejdzie pomyślnie przez kolejne 3 doby próby głodu, milczenia i samotności:'
                          '\n- w czasie pierwszej doby powstrzyma się od spożywania jakichkolwiek pokarmów i napojów uczestnicząc we wszystkich zajęciach obozowych. Podczas dużych upałów dozwolone jest ugaszenie pragnienia czystą wodą,'
                          '\n- w czasie drugiej doby zachowa całkowite milczenie i przeznaczy ten czas na zastanowienie się nad swoim harcerskim życiem,'
                          '\n- trzecią dobę spędzi w lesie niedostrzeżona przez ludzi, żywiąc się pokarmem leśnym, w tym czasie zaobserwuje życie lasu i zbierze okazy przyrodnicze, do lasu zabierze tylko konieczny ubiór, nóż, 5 zapałek i apteczkę osobistą.',
                      'Niepostrzeżenie  powróci  do  ogniska  po  odbyciu 3 próby. Przyniesie z sobą z lasu 3 ptasie pióra.'
                    ],
                    comment: 'Sprawność ta odpowiednio prowadzona jest okazją na otwarcie się młodego człowieka na spotkanie z Bogiem w ciszy, samotności i poprzez wyrzeczenie, pozbawiona tego wymiaru łatwo daje się sprowadzić do ćwiczenia charakteru dla niego samego, do szukania jedynie własnej doskonałości.'
                        '\n'
                        '\nsprawność zdobywana tylko na obozie letnim, dla harcerek posiadających stopień samarytanki. Dopuszczenie do próby następuje w czasie ogniska. Dopuszczać do próby może harcerka sama posiadająca tę sprawność lub instruktorka – najlepiej drużynowa. Nieudaną próbę sprawności można powtórzyć dopiero po upływie roku.',
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'kucharskie',
                sprawData: [

                  SprawData(
                      id: 'kuchcik',
                      title: 'Kuchcik',
                      level: '1',
                      tasks: [
                        'Wybierze dobre miejsce na kuchnię polową, zbuduje ją i przygotuje na niej herbatę.',
                        'Odszuka i pobierze dobrą wodę do picia.',
                        'Przygotowując posiłki w terenie: pokroi chleb, ugotuje jajka, upiecze ziemniaki w popiele.',
                        'Zamaskuje miejsce po kuchni polowej.',
                        'W warunkach polowych wyczyści z sadzy kociołek lub menażkę.',
                        'Zabierze na biwak lub wycieczkę odpowiedni prowiant, prawidłowo go spakuje, tak by się nie psuł i nie niszczył ekwipunku. Naostrzy nóż w warunkach polowych.',
                        'Pełni z zastępem służbę kuchenną, weźmie udział w przygotowaniu śniadania, obiadu i kolacji.',
                      ]
                  ),

                  SprawData(
                      id: 'kucharka',
                      title: 'Kucharka',
                      level: '2',
                      tasks: [
                        'Zbuduje 3 rodzaje kuchni polowych, osłoni kuchnie przed deszczem.',
                        'Skompletuje i obsłuży kuchenki turystyczne różnych typów (gazowa, benzynowa, ew. spirytusowa).',
                        'Umiejętnie pokieruje pracą zastępu służbowego przygotowując trzy posiłki dla obozu, w tym obiad z co najmniej 2 dań.',
                        'Przygotuje 2 trudniejsze potrawy (mięso na dwa sposoby, ryż lub kaszę na sypko, sos, itp.).',
                        'Przygotuje potrawę bez użycia naczyń – rybę w liściach, ciasto na kiju, pieczone jaja, itp.',
                        'Ułoży jadłospis na 3-dniowy biwak.',
                      ]
                  ),

                  SprawData(
                      id: 'kuchmistrzyni',
                      title: 'Kuchmistrzyni',
                      level: '3',
                      tasks: [
                        '1.	Przez dwa dni będzie pełniła obowiązki kucharki na obozie:'
                            '\n- ułoży jadłospis i zapotrzebowanie na żywność.'
                            '\n- punktualnie przygotuje smaczne i estetyczne posiłki.'
                            '\n- utrzyma higienę w kuchni.'
                            '\n- sporządzi  próbki posiłków.'
                            '\n- umiejętnie zorganizuje pracę zastępu służbowego.',
                        'Urządzi obozową kuchnię:'
                            '\n- sporządzi wykaz potrzebnego sprzętu,'
                            '\n- rozplanuje rozmieszczenie poszczególnych elementów kuchni (obieralnia, magazyn żywności, parniki, itp.).',
                        'Zna zasady prawidłowego żywienia.',
                        'Zna i umie zastosować różne sposoby przechowywania żywności, zabezpieczy ją przed zepsuciem.',
                        'Przyrządzi ciekawą potrawę dla obozu na specjalną okazję.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'wartownicze',
                sprawData: [

                  SprawData(
                      id: 'wartowniczka',
                      title: 'Wartowniczka',
                      level: '1',
                      tasks: [
                        'Dobrze pełni na obozie wartowniczą służbę dzienną, dba o porządek na terenie obozu, prawidłowo zachowuje się w kontaktach z gośćmi, osobami obcymi, instruktorami harcerskimi.',
                        'Czujnie pełni wartę nocną.',
                        'Sprawnie porusza się w nocy bez światła tropiąc za głosem.',
                        'Staje w nocy na sygnał alarmowy w czasie 5 min., szybko reaguje na hasło porannej pobudki.',
                      ]
                  ),

                  SprawData(
                      id: 'starsza_wartowniczka',
                      title: 'Starsza wartowniczka',
                      level: '2',
                      tasks: [
                        'Prawidłowo zorganizuje służbę wartowniczą dla obozu.',
                        'Prawidłowo pełni wartę honorową, potrafi rozprowadzić warty.',
                        'Wie, kiedy i dlaczego wystawia się warty honorowe.',
                        'Wymieni najważniejsze miejsca pamięci narodowej w swojej okolicy, odwiedzi je z zastępem.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'kwatermistrzowskie',
                sprawData: [

                  SprawData(
                      id: 'skrzat',
                      title: 'Skrzat',
                      level: '1',
                      tasks: [
                        'Wie jak korzystać za sprzętu pionierskiego tak, aby go nie zniszczyć (toporek, saperka, dłuto) oraz jak konserwować namiot.',
                        'Dokona trzech drobnych napraw sprzętu pionierskiego, kuchennego lub biwakowego.',
                        'Oczyści z sadzy garnek, wyczyści przypalone naczynie.',
                        'Potrafi segregować i prawidłowo wykorzystuje odpadki kuchenne, segreguje śmieci zgodnie z zasadami ekologii.',
                        'Weźmie udział w akcji zarobkowej lub akcji pomocy innym.',
                        'Utrzymuje w porządku swoje rzeczy, chodzi zawsze czysto i schludnie ubrana.',
                        'Gromadzi oszczędności, nie wydaje pieniędzy pochopnie.',
                      ]
                  ),

                  SprawData(
                      id: 'gospodyni_zastepu',
                      title: 'Gospodyni zastępu',
                      level: '2',
                      tasks: [
                        'Konserwuje sprzęt pionierski i namioty (ostrzenie narzędzi, osadzanie toporków i siekier, szycie namiotów, itp.).',
                        'Gromadzi ekwipunek zastępu, odpowiednio go zabezpiecza, dokona uzupełnień w razie potrzeby.',
                        'Zorganizuje w porozumieniu z drużynową pracę zarobkową zastępu.',
                        'Zapreliminuje i rozliczy przejazd i wyżywienie zastępu na wycieczce.',
                        'Dokona zakupów na fakturę VAT lub rachunek.',
                        'Dokona wpłaty pieniędzy przekazem pocztowym lub przelewem.',
                        'Dba o utrzymanie porządku przez zastęp na biwakach, w obozie oraz w innych sytuacjach.',
                        'Rozsądnie planuje swoje wydatki.',
                      ]
                  ),

                  SprawData(
                      id: 'kwatermistrzyni',
                      title: 'Kwatermistrzyni',
                      level: '3',
                      tasks: [
                        'Zaplanuje, przygotuje i rozliczy akcję zarobkową drużyny.',
                        'Pokieruje konserwacją sprzętu.',
                        'Przeprowadzi inwentaryzację sprzętu.',
                        'Weźmie udział w opracowaniu planu finansowego obozu lub budżetu rocznego drużyny.',
                        'Prowadzi książkę finansową drużyny.',
                        'Załatwi sprawę gospodarczą (rezerwacja wagonów lub autobusu, noclegi, zamówienie towaru, wypożyczenie sprzętu, itp.).',
                        'Zorganizuje zaplecze kwatermistrzowskie obozu wędrownego lub biwaku (noclegi, zakup żywności, przejazdy).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'finansowe',
                sprawData: [

                  SprawData(
                      id: 'skarbonka',
                      title: 'Skarbonka',
                      level: '1',
                      tasks: [
                        'Planuje swoje wydatki, umie zaoszczędzić pieniądze i wydać je w pożyteczny sposób.',
                        'Zrobi listę zakupów potrzebnych w domu, oceniając, ile potrzeba na nie pieniędzy, dokona zakupów trzymając się planu.',
                        'Systematycznie płaci składki.',
                        'Umie rozliczyć się z powierzonych pieniędzy, wie, co to jest faktura VAT i jak powinna ona wyglądać, dokona zakupów na fakturę.',
                        'Weźmie udział w grze gospodarczej drużyny.',
                      ]
                  ),

                  SprawData(
                      id: 'skarbniczka',
                      title: 'Skarbniczka',
                      level: '2',
                      tasks: [
                        'Napisze preliminarz finansowy na jednodniową wycieczkę, zbiórkę okolicznościową.',
                        'Według preliminarza zorganizuje wyjazd, zbiórkę, oraz prawidłowo je rozliczy.',
                        'Wymyśli grę gospodarczą dla zastępu lub drużyny, określi jej cele.',
                        'Zbiera w terminie składki od zastępu lub drużyny.',
                      ]
                  ),

                  SprawData(
                      id: 'finansistka',
                      title: 'Finansistka',
                      level: '3',
                      tasks: [
                        'Znajdzie inny niż akcja zarobkowa sposób na zdobycie środków finansowych dla drużyny – dotacja, darowizna, itp.',
                        'Wie z przepisów państwowych i przepisów ogólnozwiązkowych, jakie są zasady otrzymywania dotacji i darowizn.',
                        'Zna strony internetowe, na których można znaleźć informacje dotyczące ogłoszonych konkursów o dotacje i granty.',
                        'Sporządzi wniosek o dotację, wyliczy szczegółowo ile środków potrzebuje na realizację konkretnego zadania.',
                        'Rozliczy się prawidłowo z uzyskanych środków – sporządzi sprawozdanie merytoryczne i finansowe.',
                      ]
                  ),

                  SprawData(
                      id: 'przedsiebiorca',
                      title: 'Przedsiębiorca',
                      level: '3',
                      tasks: [
                        'Dowie się, co jest potrzebne do rozpoczęcia samodzielnej działalności gospodarczej, zna różne formy prowadzenia działalności gospodarczej.',
                        'Wie, gdzie zarejestrować działalność gospodarczą.',
                        'Wie, gdzie jest najbliższy urząd skarbowy, ZUS.',
                        'Zbierze informacje na temat kredytów oraz pożyczek dla młodych przedsiębiorców.',
                        'Wymyśli, jaką działalność mogłaby prowadzić w lokalnym środowisku.',
                        'Zna podstawowe pojęcia związane z ekonomią, np. mikroekonomia, makroekonomia, popyt, podaż, PKB, inflacja i in.',
                        'Przeprowadzi grę gospodarczą dla drużyny.',
                      ]
                  ),

                  SprawData(
                      id: 'ekonomistka',
                      title: 'Ekonomistka',
                      level: '4',
                      tasks: [
                        'Napisze biznes plan.',
                        'Umie sporządzić rozliczenie podatkowe jako osoba fizyczna.',
                        'Zna przepisy związane z prowadzeniem działalności gospodarczej, załatwi sprawę urzędową – np. zarejestruje działalność, itp.',
                        'Zna zasady funkcjonowania giełdy papierów wartościowych, podstawowe pojęcia związane z obrotem papierów wartościowych – notowania jednolite, ciągłe, indeks giełdowy, WIG, akcja, wolumen, rynek pierwotny, rynek wtórny, obligacja, itp.',
                        'Przeprowadzi szkolenie z zakresu wychowania gospodarczego w drużynie.',
                      ]
                  ),

                ]
            ),
          ]
      ),

      SprawGroupData(
          id: 'terenowe',
          title: 'Terenowe',
          familyData: [

            SprawFamilyData(
                id: 'terenoznawcze',
                sprawData: [

                  SprawData(
                      id: 'obserwatorka',
                      title: 'Obserwatorka',
                      level: '1',
                      tasks: [
                        'Wyznaczy strony świata wg busoli, Słońca i gwiazd.',
                        'Narysuje plan harcówki, dobierając skalę i posługując się wymiarami własnego ciała.',
                        'Dokona krokami pomiaru odcinka długości ok. l km.',
                        'Zorientuje mapę turystyczną, wskaże na niej charakterystyczne punkty terenowe i miejsce postoju.',
                        'Dojdzie do celu odległego o ok. 3 km wg szkicu trasy.',
                        'Zapamięta przebytą drogę w terenie leśnym i w mieście, wróci nią samodzielnie bez błądzenia.',
                      ]
                  ),

                  SprawData(
                      id: 'terenoznawczyni',
                      title: 'Terenoznawczyni',
                      level: '2',
                      tasks: [
                        'Wyznaczy strony świata wg przedmiotów terenowych oraz Słońca i zegarka.',
                        'Oceni odległość „na oko” z dopuszczalnym błędem 20 %.',
                        'Dokona pomiarów niedostępnych obiektów w terenie (wysokość drzewa i szerokość rzeki).',
                        'Wyznaczy azymut w terenie. Przejdzie wg azymutu odcinek 2 km w lesie lub 4 km w terenie odkrytym.',
                        'Rozróżni formy ukształtowania terenu na mapie  i w terenie. Wyznaczy na mapie miejsce postoju, planowaną drogę marszu i jej punkty orientacyjne. Odczyta z pamięci znaki umowne na mapie.',
                        'Posługując się znakami topograficznymi wykona szkic „z miejsca” i szkic trasy marszu. Trafi do wyznaczonego miejsca w nieznanym terenie na podstawie szkicu lub mapy.',
                        'Określi godzinę wg Słońca, rozróżni fazy Księżyca. Wskaże na niebie trzy gwiazdozbiory.',
                        'Poprowadzi patrol w terenie posługując się busolą i bezbłędnie docierając do wyznaczonego miejsca.',
                        'Weźmie udział w biegu terenowym poruszając się według znaków patrolowych.',
                      ]
                  ),

                  SprawData(
                      id: 'topografka',
                      title: 'Topografka',
                      level: '3',
                      tasks: [
                        'Posłuży się mapami przy projektowaniu zajęć terenowych – ustali  i wymierzy wg mapy drogę marszu, wykreśli profil terenu.',
                        'Uzyska   informacje   o  ważnych obiektach w nieznanym terenie, korzystając z możliwości Internetu i naniesie je na przygotowywany dla potrzeb drużyny fragment planu miasta.',
                        'Trafi do celu odległego o co najmniej 15 km w dzień i 3 km w nocy wg wyznaczonych azymutów.',
                        'Wykona z pamięci szkic sytuacyjny terenu.',
                        'Pokieruje wykonaniem szkicu sytuacyjnego (mapy) terenu o powierzchni ok. l km2 w podziałce l:5000.',
                        'Zorganizuje szkolenie lub grę terenową z zakresu terenoznawstwa (wyznaczanie stron świata, własnego położenia na mapie, wysokości wieży lub drzewa, szerokości rzeki, ocena odległości „na oko” i w marszu, itp.).',
                        'Sprawnie i zgodnie z zasadami bezpieczeństwa poprowadzi grupę w terenie leśnym i miejskim, zimą i latem, zarówno w dzień jak i w nocy. Wytypuje w nowym terenie miejsce na biwak drużyny, rozplanowując jego rozbicie.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_mapy',
                      title: 'Mistrzyni mapy',
                      level: '4',
                      tasks: [
                        'Dokona pomiaru terenu nadającego się na urządzenie obozu lub dziecięcego placu zabaw. Wykona dokładny plan.',
                        'Wykreśli mapę wybranego terenu oraz zaktualizuje starą mapę na potrzeby obozu, gry terenowej, rajdu, itp.',
                        'Przygotuje i przeprowadzi minimum 3 imprezy na orientację.',
                        'Sprawnie posługuje się minimum jednym programem komputerowym wykorzystywanym w kartografii do tworzenia map.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'lacznosc',
                sprawData: [

                  SprawData(
                      id: 'laczniczka',
                      title: 'Łączniczka',
                      level: '1',
                      tasks: [
                        'Korzysta z książki telefonicznej, biura numerów, telefonu stacjonarnego i komórkowego, komunikatora internetowego. Potrafi nadać fax, wezwać pogotowie ratunkowe, straż pożarną, policję.',
                        'Zaadresuje list, wypełni blankiet listu poleconego, przekazu pieniężnego lub paczki, wyśle i odbierze e-mail z załącznikiem, wyśle sms. Wie ile dni trwa doręczanie poszczególnych typów listów.',
                        'Bezbłędnie przekaże ustny meldunek lub rozkaz złożony z 15-20 słów, przenosząc go do punktu odległego o l km.',
                        "Zapisze i odczyta list napisany prostym szyfrem i alfabetem Morse'a.",
                        'Trafia do celu drogą wyznaczoną znakami patrolowymi, przekrada się przez linię straży, ćwiczy krok skautowy.',
                      ]
                  ),

                  SprawData(
                      id: 'sygnalistka',
                      title: 'Sygnalistka',
                      level: '2',
                      tasks: [
                        'Zorganizuje w terenie pracę stacji sygnalizacyjnej, z uwzględnieniem warunków ukrycia, tła, odległości, podziału pracy',
                        "Nada chorągiewkami i odbierze depeszę alfabetem Morse'a zawierającą min. 20 słów, z szybkością 15 liter na minutę.",
                        'Przekaże znaki umowne dźwiękiem (gwizdek), światłem (latarka, ognisko), ręką.',
                        'Zorganizuje grę dla zastępu wykorzystując elementy sygnalizacji.',
                        'Zna i stosuje 5 rodzajów szyfrów, wymyśli własny szyfr zastępu.',
                        'Wyśle sms z internetu. Umie założyć konto i skrzynkę poczty elektronicznej, odbierze pocztę na obcym komputerze.',
                        'Szybko znajduje w książce telefonicznej lub w Internecie adres i numer telefonu instytucji, dysponując tylko jej nazwą.',
                      ]
                  ),

                  SprawData(
                      id: 'lacznosciowiec',
                      title: 'Łącznościowiec',
                      level: '3',
                      tasks: [
                        'Zorganizuje tanią sieć komunikacji na obozie.',
                        'Zna zasady posługiwania się radiem CB, zorganizuje łączność radiową w konkretnym celu (gra terenowa, kontakt ze służbą leśną, itp.). Potrafi wezwać pomoc – policję, pogotowie ratunkowe.',
                        'Potrafi wysłać wiadomość graficzną z telefonu przenośnego lub przez Internet.',
                        'Wie, na czym polega działanie sieci WLAN.',
                        'Wie, jakie są zasady i sposoby przekazu i gromadzenia poufnych informacji (np. danych osobowych), szczególnie w Internecie.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'wedrowanie',
                sprawData: [

                  SprawData(
                      id: 'lekka_stopa',
                      title: 'Lekka stopa',
                      level: '1',
                      tasks: [
                        'Skrycie podejdzie strzeżony teren lub obiekt, zacierając swoje ślady.',
                        'Porusza się bezszelestnie, czołga się i maskuje.',
                        'Sprawnie pokona przeszkody: przeskoczy rów szer. 1,5 m, przejdzie po belce ponad ziemią, pokona ogrodzenia różnych typów, wejdzie na drzewo.',
                        'Zapamięta przebytą drogę długości ok. 2 km i samodzielnie nią powróci.',
                        'Przebędzie drogę za znakami patrolowymi.',
                      ]
                  ),

                  SprawData(
                      id: 'tropicielka',
                      title: 'Tropicielka',
                      level: '2',
                      tasks: [
                        'Wykaże szczególną wprawę w tropieniu. Rozpozna ślady pozostawione w różnych okolicznościach przez pojazdy (rodzaj pojazdu, kierunek jazdy), ludzi (bieg, chód) oraz zwierzęta i wyciągnie z nich trafne wnioski. Sporządzi na podstawie obserwacji opis sytuacji lub osoby śledzonej w przeciągu 2 godzin z ukrycia. Rozpozna tropy 5 zwierząt żyjących na swobodzie i 5 gospodarskich, przejdzie 2 km tropem tych śladów.',
                        'Przedstawi kilka szkiców lub opisów podpatrzonych przez siebie scen z życia zwierząt (ssaki, ptaki, owady).',
                        'Porusza się w terenie zostawiając znaki patrolowe.',
                        'Weźmie udział w nocnej grze terenowej.',
                        'Wykona zamaskowany szałas, ugotuje posiłek polowy unikając dymu i zapachu, zamaskuje miejsce po biwaku.',
                        'Znajdzie i przygotuje wygodne i bezpieczne miejsce na drzewie. Dokona z niego godzinnej obserwacji.',
                      ]
                  ),

                  SprawData(
                      id: 'zwiadowca',
                      title: 'Zwiadowca',
                      level: '3',
                      tasks: [
                        'Podejdzie skrycie strzeżony obiekt w nieznanym terenie, wykona zlecone zadanie i wycofa się niepostrzeżenie. Wykona szkic przebytej drogi z naniesieniem charakterystycznych punktów terenu lub opis sytuacyjny obiektu.',
                        'Przeprowadzi zwiad na określony temat, wykorzystując różne sposoby (wywiad, obserwacja, badanie dokumentów) i sporządzi raport.',
                        'Wybierze w terenie dogodny punkt, z którego można prowadzić obserwację w promieniu 500 m i poprowadzi dziennik obserwacji przez 4 godziny.',
                        'Dotrze w nocy do wyznaczonego miejsca odległego o 3 km posługując się wyłącznie mapą.',
                        'W zadaniach zwiadowczych wykorzysta aparat fotograficzny i dyktafon.',
                        'Przygotuje nocną grę terenową, podchody z inną drużyną.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'ogien',
                sprawData: [

                  SprawData(
                      id: 'iskierka',
                      title: 'Iskierka',
                      level: '1',
                      tasks: [
                        'Poprawnie zbuduje i rozpali stos ogniskowy. Zatrze ślady ogniska po jego wygaszeniu.',
                        'Pozna obrzędowość związaną z harcerskim ogniskiem.',
                        'Będzie pełniła trzy służby przy ognisku, umiejętnie podkładając drwa lub gałęzie, regulując wysokość płomienia i ograniczając iskrzenie.',
                        'Pozna przepisy przeciwpożarowe obowiązujące na zbiórkach, obozach i biwakach. Dowie się, jak ugasić na człowieku płonące ubranie. Nauczy się posługiwać podstawowym sprzętem gaśniczym.',
                        'Rozróżnia trzy podstawowe stopnie oparzenia i potrafi udzielić pierwszej pomocy  przedmedycznej  w przypadku oparzenia.',
                        'Nosi w mundurze niezbędnik potrzebny do rozpalania ognia.',
                      ]
                  ),

                  SprawData(
                      id: 'strazniczka_ognia',
                      title: 'Strażniczka ognia',
                      level: '2',
                      tasks: [
                        'Nauczy się rozpoznawać różne gatunki drewna, dowie się, czym się charakteryzują i w jaki sposób się palą.',
                        'Sprawnie rąbie drewno, ostrzy i oprawia siekierę lub toporek.',
                        'Ułoży różne rodzaje stosów ogniskowych, w tym jeden o wyższym poziomie trudności – na specjalną okazję.',
                        'Umie rozpalić ogień bez użycia zapałek.',
                        'Nauczy się układać i rozpalać ognisko obrzędowe w trudnych warunkach atmosferycznych (wiatr, deszcz, śnieg).',
                        'Wygłosi gawędę na ognisku harcerskim, wybierze odpowiednie piosenki.',
                        'Nosi w mundurze niezbędnik potrzebny jej do rozpalania ognia.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'harce',
                sprawData: [

                  SprawData(
                      id: 'harcowniczka',
                      title: 'Harcowniczka',
                      level: '1',
                      tasks: [
                        'Weźmie udział w 5 grach terenowych, będzie przestrzegała zasad w nich obowiązujących.',
                        'Pozna 10 ćwiczeń rozwijających spostrzegawczość, refleks, pamięć. Dwa z nich będzie systematycznie ćwiczyła przez minimum 2 tygodnie.',
                        'Odbędzie 3 harce.',
                      ]
                  ),

                  SprawData(
                      id: 'milosniczka_harcow',
                      title: 'Miłośniczka harców',
                      level: '2',
                      tasks: [
                        'Przeprowadzi 10 gier terenowych i harcówkowych, sprawnie ucząc innych zasad w nich obowiązujących.',
                        'Zorganizuje ćwiczenia z  KIM-a w harcówce i w terenie.',
                        'Prowadzi własny notatnik, zawierający zbiór gier i ćwiczeń do wykorzystania w pomieszczeniu i w terenie. Zaznacza w nim czas, warunki i ekwipunek potrzebne do ich przeprowadzenia.',
                        'Przejdzie tygodniowe próby ćwiczenia wzroku, słuchu, dotyku, smaku, powonienia i pamięci.',
                        'Odbędzie 2 jednodniowe harce.',
                      ]
                  ),

                  SprawData(
                      id: 'organizatorka_harcow',
                      title: 'Organizatorka harców',
                      level: '3',
                      tasks: [
                        'Zorganizuje całodniową grę terenową zawierającą elementy ćwiczące spostrzeganie, wnioskowanie, taktykę, komenderowanie.',
                        'Przeprowadzi kilkanaście mniejszych gier, zawodów, harców w terenie ćwiczących słuch, wzrok, zwinność, refleks, zaradność.',
                        'Przeprowadzi bieg harcerski sprawdzający w ciekawy sposób zdobytą wiedzę i umiejętności.',
                      ],
                      comment: 'W czasie planowania gier weźmie pod uwagę wymogi bezpieczeństwa uczestników. Reguły gier zostaną dokładnie sprecyzowane i jasno przekazane harcerkom. Gry i harce będą powiązane z programem aktualnie zdobywanych w drużynie stopni i sprawności.'
                  ),

                  SprawData(
                      id: 'mistrzyni_harcow',
                      title: 'Mistrzyni harców',
                      level: '4',
                      tasks: [
                        'Zorganizuje co najmniej 4-dniowy biwak drużyny lub zlot kilku drużyn w formie Turnieju Zastępów w zakresie gier terenowych i harców.',
                      ],
                      comment: 'W czasie planowania gier weźmie pod uwagę wymogi bezpieczeństwa uczestników. Reguły gier zostaną dokładnie sprecyzowane i jasno przekazane harcerkom. Gry i harce będą powiązane z programem aktualnie zdobywanych w drużynach stopni i sprawności.'
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'eskimos',
                sprawData: [

                  SprawData(
                      id: 'eskimoska',
                      title: 'Eskimoska',
                      level: '1',
                      tasks: [
                        'Chętnie uczestniczy w wycieczkach zimowych.',
                        'Odpowiednio ubierze się na zimową wycieczkę, zabezpieczy przed przemarznięciem i przemoczeniem.',
                        'Będzie tropić na śniegu człowieka lub zwierzę przez l km.',
                        'Wykona z zastępem budowlę lub rzeźbę ze śniegu.',
                      ]
                  ),

                  SprawData(
                      id: 'czlowiek_zimy',
                      title: 'Człowiek zimy',
                      level: '2',
                      tasks: [
                        'Nie korzystając z pojazdów mechanicznych dotrze w zimie do celu oddalonego o 15 km.',
                        'Przygotuje na śniegu ciepły posiłek.',
                        'Zbuduje jamę śnieżną (ew. zasłonę od wiatru).',
                        'Wykona i wykorzysta sprzęt do wypraw zimowych (np. rakiety śnieżne, ochraniacze na buty i spodnie, itp.). Potrafi zabezpieczyć buty przed przemoczeniem na śniegu.',
                        'Zorganizuje z zastępem zimową grę na śniegu.',
                      ]
                  ),

                  SprawData(
                      id: 'polarniczka',
                      title: 'Polarniczka',
                      level: '3',
                      tasks: [
                        'Przejdzie na nartach 30 km.',
                        'Weźmie udział w narciarskiej wycieczce górskiej. Skompletuje ekwipunek.',
                        'Spędzi noc w zimie w warunkach polowych (np. w igloo, namiocie).',
                        'Poradzi sobie w trudnych warunkach (w czasie mgły, zamieci, w głębokim śniegu).',
                        'Zademonstruje sposób transportowania rannego na sankach i sporządzonym samodzielnie w terenie toboganie.',
                        'Zorganizuje dla drużyny wycieczkę zimową z zadaniami tropicielskimi lub grą na śniegu.',
                        'Opowie o historii wypraw polarnych.',
                        'Skompletuje ekwipunek na kilkudniową zimową wyprawę.',
                        'Zbuduje z zastępem igloo.',
                      ]
                  ),
                ]
            ),

          ]
      ),

      SprawGroupData(
          id: 'turystyczne',
          title: 'Turystyczne',
          familyData: [

            SprawFamilyData(
                id: 'przyjacielskie',
                sprawData: [

                  SprawData(
                      id: 'poszukiwaczka_przyjaciol',
                      title: 'Poszukiwaczka przyjaciół',
                      level: '1',
                      tasks: [
                        'Pozna 2 zwyczaje odwiedzanej drużyny, inne niż w jej drużynie. Potrafi opowiedzieć o nich i wyjaśnić ich sens.',
                        'Nauczy się 1 nowej piosenki.',
                        'Dowie się, z jakiej miejscowości pochodzą harcerki/harcerze. Pozna kilka najważniejszych faktów z jej historii, geografii, specyfiki. Umie pokazać ją na mapie.',
                        'Wymieni się adresem z 1 nowopoznaną osobą, kilkakrotnie wykorzysta go w korespondencji.',
                        'Weźmie udział w przynajmniej 1 wspólnym punkcie programu.',
                        'Wspólnie z zastępem/drużyną zadba by w obozie pozostał miły ślad ich obecności.',
                      ],
                      comment: 'Zadania muszą być zrealizowane wraz z zastępęm lub drużyną podczas odwiedzin obóz drużyny z innej chorągwi (lub 2   obozy   drużyn   z   jej  chorągwi).'
                  ),

                  SprawData(
                      id: 'tropicielka_przyjaciol',
                      title: 'Tropicielka przyjaciół',
                      level: '2',
                      tasks: [
                        'Podpatrzy jedno nowe rozwiązanie pionierki. Nauczy się je wykonywać. Udokumentuje jego konstrukcję w kronice.',
                        'Nawiąże kontakt z 1 osobą w podobnym wieku lub pełniącą zbliżoną do niej funkcję. W wyniku tego kontaktu pogłębi swoją wiedzę lub umiejętności (np. pozna nową grę terenową, szyfr, nauczy się sygnalizacji). Będzie starała się dbać o tą znajomość również po zakończeniu odwiedzin.',
                        'Pozna historię, walory turystyczne, specyfikę miasta, z którego pochodzi poznana drużyna. Dowie się jak najwięcej o środowisku harcerskim tego miasta (kiedy powstało, jak jest liczne, czym się chlubi).',
                        'Znacząco przyczyni się by wizyta jej drużyny/zastępu pozostawiła miły ślad w odwiedzonym obozie.',
                      ],
                      comment: 'Zadania muszą być zrealizowane wraz z zastępęm lub drużyną podczas odwiedzin obóz drużyny z innej chorągwi (lub 2   obozy   drużyn   z   jej  chorągwi).'
                  ),

                  SprawData(
                    id: 'wedrujaca_przyjaciolka',
                    title: 'Wędrująca przyjaciółka',
                    level: '3',
                    tasks: [
                      'Pomoże w zorganizowaniu odwiedzin swojej drużyny/zastępu w obozie drużyny z innej chorągwi lub odwiedzi przynajmniej 3 obozy drużyn w tym minimum 2 z innych chorągwi. Przygotowując odwiedziny i podczas wizyty zadba by nie były kłopotliwe dla gospodarzy.',
                      'Odwdzięczy się za gościnę nie tylko finansowo.',
                      'Włączy się w pełnienie służby na terenie odwiedzanego obozu. Uszanuje przy tym gospodarzy (ich zwyczaje, sposób zarządzania, poznane osoby).',
                      'Znajdzie podobieństwa i różnice w rozwiązaniach stosowanych w poznanej drużynie (w porównaniu do własnego środowiska). Postara się zrozumieć sens nowo poznanych rozwiązań. Refleksjami podzieli się w dowolnej formie.',
                      'Pozna i nauczy się 3 nowych form drobnych działań (np. rozwiązania pionierki, pomysł na grę, forma modlitwy,  gimnastyki)  i  wykorzysta  je  następnie  w swoim środowisku.',
                      'Przygotuje pakiet materiałów do 3-dniowego zwiedzania swojego miasta/miejscowości (jej okolicy) przez harcerki wybranego pionu (zuchy, harcerki, wędrowniczki, harcerki starsze). Kopię materiałów przekaże odwiedzanej drużynie i swojej hufcowej. W razie potrzeby pomoże harcerkom z innych miast w zwiedzaniu jej miasta/miejscowości.',
                    ],
                  ),

                  SprawData(
                    id: 'wedrowniczka_przyjazni_1',
                    title: 'Wędrowniczka przyjaźni',
                    level: '3',
                    tasks: [
                      'Odwiedzi przynajmniej 3 obozy drużyn, w tym minimum 2 drużyn wędrowniczych (w tym – choć jeden spoza własnej chorągwi). Przygotowując odwiedziny i podczas wizyty zadba by nie były one kłopotliwe dla gospodarzy.',
                      'Odwdzięczy się za gościnę nie tylko finansowo.',
                      'Włączy się w pełnienie służby na terenie odwiedzanych obozów. Uszanuje przy tym gospodarzy (ich zwyczaje, sposób zarządzania, poznane osoby).',
                      'Znajdzie podobieństwa i różnice w rozwiązaniach stosowanych w poznanych drużynach (w porównaniu do własnego środowiska). Postara się zrozumieć sens nowo poznanych rozwiązań. Refleksjami podzieli się w dowolnej formie.',
                      'Pozna i nauczy się 3 nowych form drobnych działań (np. rozwiązania pionierki, pomysł na grę, forma modlitwy, gimnastyki) i wykorzysta je następnie w swoim środowisku.',
                      'Przygotuje pakiet materiałów do 3-dniowego zwiedzania swojego miasta/miejscowości (jej okolicy) przez harcerki wybranego pionu (zuchy, harcerki, wędrowniczki, harcerki starsze). Kopię materiałów przekaże odwiedzanym drużynom i swojej  hufcowej. W razie potrzeby pomoże harcerkom z innych miejscowości w zwiedzaniu jej miasta/miejscowości.',
                    ],
                  ),

                  SprawData(
                    id: 'wedrowniczka_przyjazni_2',
                    title: 'Wędrowniczka przyjaźni',
                    level: '4',
                    tasks: [
                      'Odwiedzi 2 kursy metodyczne lub instruktorskie, w tym minimum  1 spoza własnej chorągwi. Tak zorganizuje wizytę by nie być kłopotliwą, a pomocną dla kursów.',
                      'Na każdym kursie weźmie udział w minimum 2 zajęciach (które uzna za przydatne dla siebie) i spędzi minimum 1 dzień uczestnicząc w jego rytmie. Jeśli jest to potrzebne i możliwe poprowadzi wybrane zajęcia.',
                      'Pozna programy odwiedzonych kursów. Porozmawia o nich z kimś z ich komendy.',
                      'Odwiedzi przynajmniej jeden obóz spoza własnej chorągwi. Znajdzie podobieństwa i różnice w rozwiązaniach metodycznych i organizacyjnych stosowanych w poznanej drużynie (w porównaniu do własnego środowiska). Refleksje udokumentuje w dowolnej formie.',
                      'W dowolnej formie wykona mapę ZHR zaznaczając na niej poszczególne chorągwie i hufce harcerek. Wie  w przybliżeniu ile drużyn i instruktorek jest  w każdej z nich.',
                      'Pozna specyfikę 1 chorągwi innej niż jej własna. Wymieni różnice i podobieństwa. Znajdzie 2 elementy, które warto zaczerpnąć ze specyfiki poznanej chorągwi.',
                      'Nawiąże kontakt z 2 instruktorkami pełniącymi podobne do niej funkcje w innych chorągwiach. Wymieni się doświadczeniami.',
                    ],
                  ),

                  SprawData(
                    id: 'globskautka',
                    title: 'Globskautka',
                    level: '4',
                    tasks: [
                      'Nawiąże kontakt ze skautkami z innego kraju. Doprowadzi do wymiany obozowej między drużynami: zorganizuje obóz harcerski poza granicami kraju i przyjmie skautki na obozie w Polsce:',
                      'Obozy będą wzorowo zorganizowane, ze zdobnictwem oddającym kulturę lub historię krajów, z których pochodzą drużyny.',
                      'W programie obozu uwzględnione będą gry i harce pozwalające na poznanie obu krajów,  ich kultury    i obyczajów.',
                      'Drużyny zapoznają się ze specyfiką pracy skautowej/harcerskiej prowadzonej w kraju pochodzenia drugiej drużyny.',
                    ],
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'piesze',
                sprawData: [

                  SprawData(
                      id: 'lazik',
                      title: 'Łazik',
                      level: '1',
                      tasks: [
                        'Odbędzie 4 wycieczki harcerskie, w tym l z nocowaniem.',
                        'W czasie wycieczek zachowuje pogodny nastrój, nie narzeka na trudy.',
                        'Pokaże na mapie przebytą trasę i aktualne miejsce postoju.',
                        'Potrafi prawidłowo ubrać się na wycieczkę, umiejętnie zabezpieczy się przed przemoczeniem odzieży i obuwia oraz otarciem nóg.',
                        'Prawidłowo pakuje plecak, dobiera potrzebne na wycieczkę rzeczy i żywność.',
                        'Na wycieczkach zdobędzie pamiątkowe trofea.',
                        'Podzieli się wrażeniami z jednej z wycieczek (np. zrobi wpis w kronice zastępu).',
                      ]
                  ),

                  SprawData(
                      id: 'wedrowniczka',
                      title: 'Wędrowniczka',
                      level: '2',
                      tasks: [
                        'Zaplanuje i przeprowadzi dwie wycieczki zastępu o różnym charakterze (cel, trasa, program) wykorzystując mapy, przewodniki, rozkład jazdy.',
                        'Skompletuje ekwipunek i prowiant zastępu na wycieczkę li 2-dniową, zależnie od jej czasu trwania, pory roku, sposobu wędrowania.',
                        'Prawidłowo i bezpiecznie prowadzi zastęp na wycieczkach, reguluje tempo marszu, obciążenie, ustala odpoczynki.',
                        'Pokieruje rozbiciem i likwidacją biwaku.',
                        'Zna zasady ekologicznego biwakowania.',
                        'weźmie udział w 6 wycieczkach harcerskich, w tym 2 z nocowaniem pod namiotem i l zimowej.',
                        'Zna sposoby sygnalizowania w razie potrzeby wzywania pomocy.',
                      ]
                  ),

                  SprawData(
                      id: 'turystka',
                      title: 'Turystka',
                      level: '3',
                      tasks: [
                        'Zaplanuje i przeprowadzi w drużynie 3 wycieczki (w tym jedną 2-dniową) o różnej tematyce: krajoznawcza, historyczna, przyrodnicza, architektoniczna, itp.',
                        'Obliczy przed wycieczką planowany jej koszt, a po powrocie przedstawi rozliczenie finansowe.',
                        'Wie gdzie w Polsce znajdują się najpiękniejsze regiony turystyczne. Zna tereny wycieczkowe w promieniu 50 km od miejsca zamieszkania.',
                        'weźmie udział w co najmniej 5-dniowej wędrówce, poprowadzi jej fragment według planu.',
                        'Poradzi sobie w trudnych sytuacjach na wycieczce (w deszczu, śniegu, we mgle, w razie zabłądzenia).',
                        'Przewidzi pogodę w celu zaplanowania wycieczki.',
                        'Potrafi opowiedzieć o odwiedzanych okolicach (wskazać typową roślinność, historię wyjątkowych miejsc, specyfikę regionu). Korzysta z przewodników.',
                        'Przebędzie pieszo ok. 100 km.',
                      ]
                  ),

                  SprawData(
                      id: 'przewodniczka',
                      title: 'Przewodniczka',
                      level: '4',
                      tasks: [
                        'Nie korzystając z żadnych form zorganizowanych wyjazdów, samodzielnie zaplanuje i przeprowadzi zagraniczny obóz wędrowny swojej drużyny. Będzie pełniła na nim rolę przewodnika. Obóz spełni następujące warunki:'
                            '\n-	niski koszt pozwalający na udział wszystkich harcerek przy ew. dofinansowaniu jednostek.'
                            '\n-	bezpieczeństwo uczestniczek.'
                            '\n-	godne reprezentowanie harcerstwa.',
                        'W trakcie przygotowań i podczas obozu harcerki poznawać będą historię i kulturę kraju, do którego jadą oraz życie jego mieszkańców. Zawrą znajomości i przyjaśnie z miejscową ludnością, zaprezentują polską kulturę i obyczaje.',
                      ]
                  ),

                  SprawData(
                      id: 'wloczega',
                      title: 'Włóczęga',
                      level: '4',
                      tasks: [
                        'Zaplanuje i poprowadzi co najmniej 7-dniową wędrówkę lub obóz wędrowny swojej drużyny.',
                        'Odbędzie próbę szlaku o charakterze wyczynu turystycznego wędrując innymi sposobami niż pieszo, np. rowerem, kajakiem, żaglówką, konno, na nartach.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'gorskie',
                sprawData: [

                  SprawData(
                      id: 'lazik_gorski',
                      title: 'Łazik górski',
                      level: '1',
                      tasks: [
                        'Odbędzie 5 jednodniowych wędrówek górskich.',
                        'Nie narzekając na trudy zdobędzie 5 szczytów górskich.',
                        'Pokaże na mapie przebytą trasę.',
                        'Odwiedzi schronisko górskie.',
                        'Potrafi prawidłowo ubrać się i skompletować ekwipunek górski.',
                        'Potrafi wezwać GOPR, zna zasady wzywania pomocy bez telefonu.',
                      ]
                  ),

                  SprawData(
                      id: 'wedrowniczka_gorska',
                      title: 'Wędrowniczka górska',
                      level: '2',
                      tasks: [
                        'Odbyła kilkudniową wędrówkę górską z nocowaniem w terenie.',
                        'Dobrze orientuje się w terenie górskim, prawidłowo lokalizuje z mapą doliny, granie, szczyty, przełęcze.',
                        'Zabezpieczy się przed zmiennością pogody.',
                        'Wskaże na mapie najważniejsze pasma górskie w Polsce. Opowie czym się charakteryzują. Zaznaczy trasę, którą przebyła.',
                        'Zna oznaczenia szlaków turystycznych.',
                        'Dba o czystość szlaku – zabiera z niego swoje i znalezione po drodze śmieci.',
                      ]
                  ),

                  SprawData(
                      id: 'lazik_gorski_zimowy',
                      title: 'Łazik górski zimowy',
                      level: '2',
                      tasks: [
                        'Odbędzie 5 górskich wycieczek zimowych.',
                        'Dobrze orientuje się w terenie górskim, prawidłowo lokalizuje z mapą doliny, granie, szczyty, przełęcze.',
                        'Potrafi zabezpieczyć się przed zimnem i odmrożeniami.',
                        'Zbuduje biwakową jamę śnieżną, rozpali ognisko ogrzewcze.',
                        'Zna różne rodzaje lawin śnieżnych i stopnie zagrożenia lawinowego.',
                      ]
                  ),

                  SprawData(
                      id: 'turystka_gorska',
                      title: 'Turystka górska',
                      level: '3',
                      tasks: [
                        'Przejdzie granie główne 4 pasm górskich w Karpatach lub Sudetach.',
                        'Przejdzie 10 km przez góry „na przełaj”, nie korzystając z dróg i szlaków (w rejonie, w którym jest to dozwolone).',
                        'Zna niebezpieczeństwa gór i zasady zachowywania się w czasie burzy, mgły, śnieżycy, przy przemęczeniu. Zna przepisy poruszania się po terenie górskim grup zorganizowanych.',
                        'Posiada wiadomości na temat działalności GOPR i zasad ratownictwa górskiego.',
                        'Odbędzie 5 wycieczek górskich zimowych.',
                      ]
                  ),

                  SprawData(
                      id: 'przewodniczka_gorska',
                      title: 'Przewodniczka górska',
                      level: '4',
                      tasks: [
                        'Nie korzystając z żadnych zorganizowanych form wyjazdów turystycznych zaplanuje wyjazd drużyny w mało znane pasmo górskie Europy (w Rumunii, Bułgarii, Norwegii, itp.):'
                            '\n- zadba o wyposażenie uczestników (ubiór, sprzęt), przeszkolenie i trening kondycyjny.'
                            '\n- zgromadzi przewodniki, mapy, ustali trasę, miejsca biwakowania, miejsca zaopatrzenia w żywność.'
                            '\n- zdobędzie wiedzę na temat kraju, do którego jedzie – życia ludności, obyczajów oraz przepisów prawnych dotyczących obozu.',
                        'Poprowadzi obóz ciekawie i bezpiecznie, pełniąc rolę przewodnika.',
                      ]
                  ),

                  SprawData(
                      id: 'wloczega_gorski',
                      title: 'Włóczęga górski',
                      level: '4',
                      tasks: [
                        'Zaplanuje i poprowadzi, co najmniej 7-dniową wędrówkę górską lub obóz wędrowny górski swojej drużyny.',
                        'Odbędzie próbę szlaku, o charakterze wyczynu turystycznego.',
                        'Samodzielnie lub z kimś zdobędzie 5 szczytów górskich powyżej 400 m nie korzystając ze szlaków turystycznych (poza Tatrami i Karkonoszami).',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'wycieczkowe',
                sprawData: [

                  SprawData(
                      id: 'wskazidroga',
                      title: 'Wskazidroga',
                      level: '1',
                      tasks: [
                        'Na konturowej mapie swojej miejscowości (dzielnicy, miasta) zaznaczy nazwy głównych ulic i placów oraz ważniejsze obiekty: ośrodek zdrowia, aptekę, pocztę, straż pożarną, posterunek policji, itp.',
                        'W czasie gry terenowej po najbliższej okolicy poprowadzi do określonego miejsca, odszuka zadany obiekt.',
                        'Zna usytuowanie najbliższych obiektów użyteczności publicznej: kościół, biblioteka, teatr, dworzec, restauracja, kawiarnia, hotel, bank.',
                        'Pozna najbliższy obiekt godny zwiedzenia (zabytek historyczny, osobliwość przyrodniczą, muzeum, itp.). Opowie o nim w czasie zajęć harcerskich.',
                        'Zna rodowód herbu swojego (lub najbliższego) miasta, potrafi go narysować. Zna sylwetkę patrona miasta.',
                        'Wie, skąd się wzięła nazwa miasta, potrafi opowiedzieć legendę z tym związaną oraz 2 inne legendy dotyczące miasta.',
                        'Zna co najmniej 3 wybitne postaci związane z miastem lub pochodzące z niego, wie czym te osoby się zasłużyły.',
                      ]
                  ),

                  SprawData(
                      id: 'przewodniczka_po',
                      title: 'Przewodniczka po ...',
                      level: '2',
                      tasks: [
                        'Opracuje plan zwiedzania swojego lub najbliższego miasta, posiadając podstawowe wiadomości o jego zabytkach i osobliwościach przyrodniczych.',
                        'Sprawnie posługuje się planem miasta, wskaże najkrótszy dojazd do określonego miejsca.',
                        'Zna drogi wylotowe z miasta, dworce autobusowe, kolejowe, ew. lotnicze i funkcje każdego z nich w komunikacji dalekobieżnej.',
                        'Weźmie udział w kilku wycieczkach turystyczno – krajoznawczych, w tym przynajmniej raz jako przewodnik.',
                        'Odszuka i w miarę potrzeby zadba (uporządkuje i udekoruje) miejsce pamięci związane z miastem lub jego wybitnym mieszkańcem.',
                        'Odszuka dwa zwyczaje związane z miastem, jeśli to możliwe weźmie udział w uroczystości specyficznej dla miasta lub regionu.',
                        'Pozna 5 nieznanych sobie dotychczas miejsc/zabytków w mieście, potrafi wskazać do nich drogę, po jednym z nich oprowadzi zastęp.',
                        'Wie, z czego dumni są mieszkańcy miasta (zna szczególnie chwalebne wydarzenia w mieście, jego wybitnych mieszkańców).',
                        'Odwiedzi z zastępem muzeum związane z miastem lub regionem.',
                        'Pozna z rodziną zwyczaje regionalne dotyczące świąt, potraw i strojów.',
                      ]
                  ),

                  SprawData(
                      id: 'krajoznawczyni',
                      title: 'Krajoznawczyni',
                      level: '3',
                      tasks: [
                        'Oprowadzi 3 wycieczki po swoim mieście i jego okolicy (lub po regionie) wykazując znajomość jego historii, zabytków, ciekawych obiektów.',
                        'Zaplanuje cykle wycieczek po Polsce o tematyce historycznej, przyrodniczej, architektonicznej i geograficznej posługując się mapami i przewodnikami.',
                        'W każdym z regionów geograficznych Polski potrafi wskazać miejsca o wybitnych walorach krajoznawczych, kompletuje mapy, przewodniki, foldery z tych terenów.',
                        'weźmie udział w 3 wycieczkach krajoznawczych w 3 różnych regionach Polski.',
                        'Wykorzysta w pracy harcerskiej zdobyte wiadomości z zakresu historii sztuki lub etnografii (zorganizuje zwiad etnograficzny, konkurs znajomości stylów architektonicznych, itp.).',
                        'Zorganizuje grę zapoznającą harcerki z historią miasta, zabytkami i władzami samorządu lokalnego.',
                      ]
                  ),

                  SprawData(
                      id: 'pilot_wycieczek',
                      title: 'Pilot wycieczek',
                      level: '4',
                      tasks: [
                        'Zna dokładnie topografię regionu i nazewnictwo z nią związane wybranego regionu turystycznego.',
                        'Zna historię regionu, pamiątki historyczne (budynki, kościoły, pomniki, tablice pamiątkowe i inne) oraz miejsca związane z wydarzeniami historycznymi wybranego regionu turystycznego.',
                        'Posiada wiadomości z etnografii tych terenów (obyczaje, stroje, piosenki, zabytki budownictwa wiejskiego) wybranego regionu turystycznego.',
                        'Wskaże najpiękniejsze przyrodniczo miejsca, zabytki przyrody martwej i ożywionej, rośliny i zwierzęta typowe dla regionu.',
                        'Wymieni sławne postacie związane z regionem, przedstawi ich życiorysy, osiągnięcia, pamiątki po nich.',
                        'Zna sieć komunikacyjną, bazy noclegowe, sieć usług oraz podstawowe ceny.',
                        'Posiada kilku przyjaciół wśród miejscowej ludności.',
                        'Zorganizuje obóz wędrowny po regionie lub oprowadzi służąc za przewodnika 3 wycieczki.',
                      ],
                      comment: 'Wszystkie zadania należy zrealizować w oparciu o jeden region turystyczny (np. Góry Świętokrzyskie, Pieniny, Puszczę Kampinoską)'

                  ),
                ]
            ),

            SprawFamilyData(
                id: 'znawca_miasta',
                sprawData: [

                  SprawData(
                      id: 'odkrywca',
                      title: 'Odkrywca... (nazwa miasta)',
                      level: '1',
                      tasks: [
                        'Zna godło/herb miasta, narysuje go.',
                        'Zna 2-4 legendy związane z miastem, w tym legendę lub historię związaną z powstaniem miasta i jego nazwą.',
                        'Zna min. trzy wybitne postaci związane z miastem lub pochodzące z niego, wie, czym te osoby się zasłużyły.',
                        'Zna najważniejsze w mieście zabytki i miejsca pamięci narodowej, każdy z nich odwiedziła.',
                        'Zaprezentowała wiersz, piosenkę lub obraz związane z poznawanym miastem.',
                        'weźmie udział w grze o tematyce związanej z poznawanym miastem.',
                        'Sprawnie posługuje się planem miasta.',
                      ],
                      comment: 'Nie dotyczy miejsca zamieszkania harcerki.'
                  ),

                  SprawData(
                      id: 'znawca',
                      title: 'Znawca... (nazwa miasta)',
                      level: '2',
                      tasks: [
                        'Odszuka 2 zwyczaje związane z poznawanym miastem, jeśli to możliwe weźmie udział w uroczystości specyficznej dla tego miejsca (np. w Krakowie – w nabożeństwie bractwa kurkowego).',
                        'Zna najważniejsze miejsca/zabytki w mieście, potrafi wskazać do nich drogę z głównego dworca, po jednym z nich oprowadziła zastęp.',
                        'Wraz z zastępem przeprowadzi zwiad dotyczący wybranych zabytkowych obiektów na terenie poznawanego miasta, weźmie udział w dokumentowaniu zwiadu.',
                        'Odszuka (np. za pomocą Internetu) najdogodniejsze połączenia kolejowe lub autobusowe z rodzinnej miejscowości do poznawanego miasta oraz przedstawi koszt takiej podróży (uwzględniając zniżki). Zna najdogodniejsze połączenia komunikacją miejską z miejsca swojego zakwaterowania do głównych punktów miasta (ratusz lub urząd gminy/dzielnicy, dworzec główny, rynek), wie, jakie są koszty biletów (w tym ulgowych).',
                        'Wie z czego są dumni mieszkańcy poznawanego miasta (szczególna historia, wydarzenie, powód do chwały).',
                        'Poznała historię powstania miasta, w tym wybitne postaci lub wydarzenia.',
                        'Odszuka, w miarę potrzeby uporządkuje i udekoruje miejsce pamięci lub grób związany z harcerstwem.',
                      ],
                      comment: 'Nie dotyczy miejsca zamieszkania harcerki.'
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'warszawskie',
                sprawData: [

                  SprawData(
                      id: 'syrenka',
                      title: 'Syrenka',
                      level: '1',
                      tasks: [
                        'Wie, kto i kiedy przeniósł stolicę do Warszawy.',
                        'Zna główne, ważniejsze zabytki Warszawy i miejsca walki o niepodległość – zwiedzi jedno nieznane.',
                        'Zna pięciu wielkich ludzi związanych z Warszawą (minimum 2 kobiety).',
                        'Umie śpiewać Warszawiankę, Marsz Mokotowa (lub inny utwór związany z walkami na terenie W-wy). Wie, co robiły warszawskie harcerki podczas wojny.',
                        'Na zbiórce zastępu powie wiersz dotyczący Warszawy, przygotuje wystawkę, itp.',
                        'Zna legendy warszawskie (min. 4).',
                        'Zna i umie narysować herb Warszawy.',
                      ]
                  ),

                  SprawData(
                      id: 'syrenka',
                      title: 'Syrenka',
                      level: '2',
                      tasks: [
                        'Zna zabytki Warszawy, po wybranym oprowadzi zastęp, wykazując się wiedzą na temat zabytku, sztuki, itp.',
                        'Przeprowadzi wraz z zastępem zwiad dotyczący wybranych zabytkowych obiektów na terenie Warszawy.',
                        'Odszuka 2 typowo warszawskie zwyczaje.',
                        'Zna wielkich warszawiaków, przygotuje dla zastępu informacje, życiorys, itp. związane z wielką warszawianką (ciekawa forma).',
                        'Nauczy młodsze harcerki śpiewać Warszawiankę, Marsz Mokotowa lub inny utwór związany z walkami na terenie Warszawy. Przekaże im wiedzę na temat działalności warszawskich harcerek podczas wojny.',
                        'Odszuka i uporządkuje miejsce pamięci lub grób harcerki.',
                      ]
                  ),

                ]
            ),
          ]
      ),

      SprawGroupData(
          id: 'przyrodnicze',
          title: 'Przyrodnicze',
          familyData: [

            SprawFamilyData(
                id: 'las',
                sprawData: [

                  SprawData(
                      id: 'przyjaciolka_lasu',
                      title: 'Przyjaciółka lasu',
                      level: '1',
                      tasks: [
                        'Spędzi z zastępem kilka godzin w lesie obserwując jego życie (żerujące zwierzęta, zachowanie ptaków, życie mrowiska, itp.). Opisze swoje spostrzeżenia dołączając rysunki ciekawych roślin lub zwierząt.',
                        'Zbierze z każdego piętra lasu po 5 gatunków liści i/lub kwiatów i rozpozna je.',
                        'Wymieni i opisze 10 ssaków, 10 ptaków i 5 gadów zamieszkujących polskie lasy.',
                        'Rozpozna po 10 gatunków roślin i zwierząt chronionych.',
                      ]
                  ),

                  SprawData(
                      id: 'duch_puszczy',
                      title: 'Duch puszczy',
                      level: '2',
                      tasks: [
                        'Przeprowadzi samotną, trzygodzinną obserwację życia lasu o wschodzie słońca.',
                        'Przedstawi kilka fotografii, szkiców lub opisów podpatrzonych'
                            'przez siebie scen z życia zwierząt leśnych.',
                        'Zbierze 5 gatunków leśnych owoców jadalnych i 5 gatunków ziół leśnych. Opowie o ich zastosowaniu.',
                        'Przepracuje 2 dni w szkółce leśnej lub przy wykonywaniu innych zabiegów pielęgnacyjnych.',
                        'Odwiedzi z zastępem rezerwat przyrody, leśny park narodowy bądź krajobrazowy lub ścieżkę dydaktyczną w nadleśnictwie, w czasie zwiedzania podzieli się z innymi wiadomościami przyrodniczymi.',
                      ]
                  ),

                  SprawData(
                      id: 'lesniczka',
                      title: 'Leśniczka',
                      level: '3',
                      tasks: [
                        'Przeprowadzi samotną, całodobową obserwację życia lasu (po 3 godziny rano, w południe, wieczorem i w nocy). Przedstawi notatki i zdjęcia.',
                        'Rozpozna po liściach, korze i owocach 15 gatunków drzew i krzewów leśnych, nazwie 15 gatunków roślin runa leśnego.',
                        'Zna pospolite gatunki żerujące na drzewach leśnych, objawy ich żerowania oraz zagrożenia ekologiczne lasów w Polsce.',
                        'Opowie o leśnych parkach narodowych i najciekawszych rezerwatach na terenie kraju.',
                        'Będzie uczestniczyć z leśniczym w obchodzie lasu. Pozna jego pracę. Potrafi wymienić kilka czynności jakie wykonuje leśniczy.',
                        'Zorganizuje dla drużyny spotkanie z leśniczym, „zieloną lekcję” na ścieżce dydaktycznej w nadleśnictwie lub poprowadzi całodniową wycieczkę przyrodniczą po puszczy.',
                        'Po występujących gatunkach drzew, krzewów i runa oraz po glebie i topografii terenu potrafi określić w jakim znajduje się typie siedliska. Wymieni kilka gatunków roślin, zwierząt żyjących w różnych typach siedliskowych lasu.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'roslinne',
                sprawData: [
                  SprawData(
                      id: 'przyrodniczka',
                      title: 'Przyrodniczka',
                      level: '1',
                      tasks: [
                        'Przyniesie z wycieczki 15 roślin leśnych i 15 roślin łąkowych, rozpozna je.',
                        'Założy zielnik roślin dziko żyjących.',
                        'Zaobserwuje rozkwit dowolnie'
                            'wybranej rośliny od pąka do momentu przekwitnięcia. Sporządzi dziennik obserwacji.',
                        'Zbierze nasiona 5-ciu znanych gatunków roślin dziko'
                            'żyjących.',
                        'Zbierze owoce jadalne 5-ciu gatunków roślin leśnych.',
                      ]
                  ),

//✽//✽ BOTANICZKA

                  SprawData(
                      id: 'botaniczka',
                      title: 'Botaniczka',
                      level: '2',
                      tasks: [
                        'Prowadzi zielnik. Ma w nim już co najmniej po 10 gatunków: drzew, krzewów, roślin łąkowych, roślin leśnych oraz po 5 gatunków:'
                            'mchów, porostów, roślin wodnych i bagiennych, roślin górskich.',
                        'Korzystając z „klucza” potrafi określić gatunek nieznanej sobie rośliny.',
                        'Zna najładniejsze zbiorowiska roślin różnych środowisk w okolicznych terenach wycieczkowych.',
                        'Rozróżnia 20 gatunków roślin chronionych w Polsce.',
                        'Zwiedzi z zastępem najbliższy dostępny rezerwat roślin lub ogród botaniczny.',
                      ]
                  ),

//✽//✽//✽ ZIELARKA

                  SprawData(
                      id: 'zielarka',
                      title: 'Zielarka',
                      level: '3',
                      tasks: [
                        'Sporządzi zielnik, w którym oprócz pospolitych gatunków lasów, łąk, pól znajdzie się 15 gatunków ziół. Określi: nazwę, środowisko występowania, porę wzrostu, kwitnienia'
                            'i owocowania, części rośliny o właściwościach leczniczych, porę i sposób zbioru, sposób przechowywania oraz zastosowania lecznicze, sposób przyrządzania.',
                        'Zorganizuje z zastępem zbiór ziół do apteczki drużyny.',
                        'Przeprowadzi szkolenie z zakresu zielarstwa.',
                        'Sporządzi zielnik roślin trujących określając: nazwę, środowisko występowania, części trujące rośliny, objawy zatrucia, poda odpowiednie informacje i ostrze-'
                            'żenia innym.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'ogrodnicze',
                sprawData: [

                  SprawData(
                      id: 'kwiaciarka',
                      title: 'Kwiaciarka',
                      level: '1',
                      tasks: [
                        'Rozróżnia 10 gatunków kwiatów ciętych i 10 gatunków roślin doniczkowych, wie, które z nich są hodowane w ogrodach polskich.',
                        'Posiada w swoim pokoju rośliny doniczkowe, którymi się opiekuje.',
                        'Wyhoduje rośliny z nasion i sadzonek.',
                        'Pomoże w pracach działkowych (formowanie grządek, sadzenie i siew, pielenie, podlewanie, itp.).',
                        'Umiejętnie zetnie kwiaty i ułoży wiązankę lub bukiet.',
                      ]
                  ),

                  SprawData(
                      id: 'milosniczka_roslin',
                      title: 'Miłośniczka roślin',
                      level: '2',
                      tasks: [
                        'Hoduje w swoim pokoju 8 gatunków roślin doniczkowych.',
                        'Umiejętnie dobiera rośliny do ogródków skrzynkowych.',
                        'Podaruje innym wyhodowane przez siebie kwiaty.',
                        'Wraz z zastępem weźmie udział w pielęgnacji zieleni (podlewanie trawników, pielenie, sadzenie drzewek, itp.).',
                        'Odwiedzi ogród botaniczny, palmiarnię lub wystawę kwiatów.',
                      ]
                  ),

                  SprawData(
                      id: 'ogrodniczka',
                      title: 'Ogrodniczka',
                      level: '1',
                      tasks: [
                        'Założy na działce lub przed domem trawnik.',
                        'Zbuduje własne alpinarium lub klomb kwiatowy (umiejętnie przygotuje glebę, zastosuje odpowied-'
                            'nie nawożenie, zasieje, wypieli, zbierze, właściwie przechowa nasiona, kłącza i cebulki).',
                        'Zapozna się z japońskimi technikami hodowli roślin ozdobnych i układania kwiatów, wykona ikebanę.',
                        'Zaprezentuje 3 wyhodowane przez siebie okazy rzadko spotykanych roślin ozdobnych.',
                      ]
                  ),

                  SprawData(
                    id: 'rolnik',
                    title: 'Rolnik',
                    level: '3',
                    tasks: [
                      'Wykona samodzielnie, przez co najmniej 3 dni, prace przy orce, siewie, żniwach, sianokosach, wykopkach lub innych pracach polowych.',
                      'Przez 2 miesiące będzie doglądała'
                          'plonów – zniszczy chwasty, szkodniki, rozpozna etapy wegetacji i stopień dojrzałości roślin uprawnych, itp.',
                      'Wyklepie, założy i naostrzy kosę.',
                      'Naprawi grabie, założy trzonek do motyki lub łopaty, wprawi szczebel do drabiny lub naprawi inne urządzenie gospodarskie.',
                      'Obsłuży prosty zmechanizowany sprzęt rolniczy (sieczkarnię, kopaczkę do ziemniaków, siewnik, roztrząsacz nawozu, itp.) z zachowaniem koniecznych środków ostrożności.',
                    ],
                    comment: 'Należy zachować szczególną ostrożność przy obsłudze sprzętu rolniczego.',
                  )

                ]
            ),

            SprawFamilyData(
                id: 'grzybiarskie',
                sprawData: [

                  SprawData(
                      id: 'zbieraczka_grzybow',
                      title: 'Zbieraczka grzybów',
                      level: '1',
                      tasks: [
                        'Weźmie udział w grzybobraniu, zbierze koszyczek grzybów jadalnych (pod kontrolą osoby doświadczonej).',
                        'Zbiera grzyby nie niszcząc grzybni. Oczyści grzyby, posegreguje wg przeznaczenia (suszenie, marynowanie, duszenie).',
                        'Ususzy grzyby oraz udusi je lub usmaży.',
                        'Potrafi korzystać z atlasu grzybów.',
                      ]
                  ),

//✽//✽ GRZYBIARKA

                  SprawData(
                      id: 'grzybiarka',
                      title: 'Grzybiarka',
                      level: '2',
                      tasks: [
                        'Rozpozna po 10 gatunków grzybów jadalnych, niejadalnych i trujących.',
                        'Przyrządzi 2 potrawy z wykorzystaniem grzybów.',
                        'Wykona przetwory z grzybów.',
                        'Zorganizuje zbiór grzybów w zastępie.',
                        'Zna objawy zatrucia grzybami, potrafi udzielić pierwszej pomocy.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'zoologiczne',
                sprawData: [

                  SprawData(
                      id: 'obserwatorka_zwierzyny',
                      title: 'Obserwatorka zwierzyny',
                      level: '1',
                      tasks: [
                        'Spośród zwierząt żyjących w Polsce rozpoznaje: 10 gatunków ssaków, 10 gatunków ptaków, 5 gatunków gadów, 5 gatunków ryb.',
                        'Umiejętnie naśladuje głosy 5 zwierząt, w tym ptaków.',
                        'Dokona półgodzinnej obserwacji zwierzęcia lub zwierząt żyjących na wolności (mrówki, żaby, ptaki, zaskrońce, itp.) bez straszenia ich i bez żadnej ingerencji w ich życie.',
                        'Zwraca uwagę na niewłaściwe traktowanie zwierząt przez innych.',
                      ]
                  ),

//✽//✽ TROPICIELKA ZWIERZYNY
                  SprawData(
                      id: 'tropicielka_zwierzyny',
                      title: 'Tropicielka zwierzyny',
                      level: '1',
                      tasks: [
                        'Dokona kilkugodzinnej obserwacji'
                            'życia zwierząt. Wskaże leśne ścieżki jednego z nich.',
                        'Rozpozna 15 gatunków zwierząt po wyglądzie, tropach, głosach.',
                        'Wie, jakie charakterystyczne gatunki zwierząt można spotkać w różnych regionach Polski i różnych typach lasu.',
                        'Zimą będzie systematycznie dokarmiać zwierzynę (ew. ptaki).',
                        'Rozpozna i nazwie zwierzęta chronione w naturze lub na okazanych fotografiach.',
                        'Zorganizuje dla zastępu zajęcia o życiu dzikich zwierząt w Polsce. Podczas zajęć wytłumaczy młodszym zasady zachowania w lesie.',
                      ]
                  ),

//✽//✽//✽ ZOOLOG

                  SprawData(
                      id: 'zoolog',
                      title: 'Zoolog',
                      level: '3',
                      tasks: [
                        'Interesuje się światem zwierząt, zbiera artykuły, albumy i atlasy zwierząt.',
                        'Wykaże się znajomością zwierząt'
                            'żyjących w okolicy i umiejętnością'
                            'rozpoznawania ich tropów. Zna zagrożenia polskich gatunków zwierząt, potrafi o nich opowiedzieć.',
                        'weźmie udział w pracach na rzecz ochrony zwierzyny (budowania paśników, budek lęgowych, dokarmianie zwierząt, walka z kłusownictwem, itp.).',
                        'Zorganizuje dla zastępu lub drużyny wycieczkę o tematyce zoologicznej.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'hodowlane',
                sprawData: [

                  SprawData(
                      id: 'przyjaciolka_zwierzat',
                      title: 'Przyjaciółka zwierząt',
                      level: '1',
                      tasks: [
                        'Samodzielnie opiekuje się zwierzęciem domowym (pies, kot, chomik, rybki, ptak lub inne), karmi je, czyści siedlisko, ew. wyprowadza na spacer.',
                        'Obserwuje zachowanie swojego zwierzęcia, potrafi po zachowaniu odgadnąć jego potrzeby.',
                        'Przeczyta książkę na temat zwierzęcia, które posiada. Opowie o zachowaniu swojego zwierzęcia innej osobie posiadającej takie samo zwierzę. Wymieni doświadczenia z opieki nad nim.',
                        'Zwraca uwagę dzieciom, które niewłaściwie odnoszą się do swoich zwierząt.',
                      ]
                  ),

                  SprawData(
                      id: 'opiekunka_zwierzat',
                      title: 'Opiekunkna zwierząt',
                      level: '2',
                      tasks: [
                        'Przeczyta książkę na temat hodowli zwierzęcia, które posiada.',
                        'Samodzielnie będzie się opiekować nowonarodzonym zwierzęciem do osiągnięcia przez nie samodzielno-'
                            'ści, będzie odpowiednio troszczyć się o matkę, przygotowywać stosowne do wieku młodego posiłki, czyścić legowisko, sprzątać.',
                        'Przez 3 miesiące od urodzenia zwierzęcia wykonywać będzie cotygodniowe notatki z obserwacji rozwoju i zdobywania nowych umiejętności przez młode.',
                        'Wymieni swoje spostrzeżenia z innym hodowcą. Orientuje się w rasach zwierząt hodowlanych, potrafi scharakteryzować ich przedstawicieli.',
                        'Pomoże zwierzętom bezpańskim, porzuconym lub zagubionym.',
                      ]
                  ),

                  SprawData(
                      id: 'hodowca',
                      title: 'Hodowca',
                      level: '3',
                      tasks: [
                        'Zaopiekuje się przez 2 miesiące zwierzęciem gospodarskim (np. krową, koniem, świnią, kurami, królikami, pszczołami).',
                        'Przygotuje i utrzyma w czystości pomieszczenie dla zwierzęcia.',
                        'Przygotuje pokarm, będzie poić i karmić zwierzę.',
                        'Oporządzi zwierzę (wydoi krowę, zaprzęgnie konia, ostrzyże owcę, wybierze miód, itp.).',
                        'Potrafi rozpoznać objawy pospolitych chorób zwierzęcia, wezwać weterynarza i zaradzić w prostych przypadkach (zranienie, zadławienie, wzdęcie).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'wodne',
                sprawData: [

                  SprawData(
                      id: 'akwarystka',
                      title: 'Akwarystka',
                      level: '1',
                      tasks: [
                        'Założy akwarium dobierając odpowiedni zbiornik.',
                        'Urządzi estetycznie wnętrze zbiornika.',
                        'Zaplanuje system oczyszczania'
                            'i napowietrzania wody oraz oświetlenia.',
                        'Dobierze zestaw roślin i ryb harmonizujących ze sobą.',
                        'Karmi ryby i czyści akwarium.',
                      ]
                  ),

//✽//✽ WODNICZKA

                  SprawData(
                      id: 'wodniczka',
                      title: 'Wodniczka',
                      level: '2',
                      tasks: [
                        'Hoduje przynajmniej od roku ryby lub inne zwierzęta wodne (żabki,'
                            'żółwie), opiekuje się nimi samodzielnie.',
                        'Rozróżnia podstawowe choroby'
                            'zwierząt akwariowych i potrafi z nimi walczyć.',
                        'Przeczyta kilka książek na temat życia w morzu lub zbiornikach słodkowodnych.',
                        'Zna 15 roślin wodnych i 30 gatunków zwierząt wodnych (nazwa, wygląd, środowisko występowania, inne cechy charakterystyczne).',
                        'Opowie na zbiórce zastępu o najciekawszych zwierzętach mórz (zwłaszcza Bałtyku) i oceanów.',
                      ]
                  ),

//✽//✽//✽ OCEANOLOG

                  SprawData(
                      id: 'oceanolog',
                      title: 'Oceanolog',
                      level: '3',
                      tasks: [
                        'Kolekcjonuje książki o tematyce morskiej i inne eksponaty (egzotyczne muszle, kraby, kawałki raf koralowych, itp.).',
                        'Potrafi scharakteryzować faunę'
                            'i florę oceanów i mórz na różnych szerokościach geograficznych.',
                        'Zapozna się ze zbiorami muzeum morskiego.',
                        'Próbuje nurkować, zapisała się na kurs płetwonurków, kompletuje sprzęt.',
                        'Zorganizuje harcerską grę o charakterze dydaktycznym, zapoznającą harcerki z geografią mórz (w tym Bałtyku) i życiem w oceanach.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'las',
                sprawData: [

                  SprawData(
                      id: 'chmurka',
                      title: 'Chmurka',
                      level: '1',
                      tasks: [
                        'Zmierzy temperaturę powietrza zachowując wymagane warunki dla pomiarów meteorologicznych.',
                        'Odczyta z barometru ciśnienie powietrza i określi czy jest to ciśnie-'
                            'nie wysokie, niskie czy normalne dla danej okolicy.',
                        'Zmierzy wielkość opadu atmosferycznego.',
                        'Zna zasadę działania wiatromierza, oceni kierunek i prędkość wiatru.',
                        'Rozróżnia 3 główne typy chmur: kłębiaste, pierzaste, warstwowe.',
                        'Prowadzi dzienniczek obserwacji atmosfery, gdzie systematycznie wpisuje wyniki własnych obserwacji pogody.',
                      ]
                  ),

//✽//✽ ZNAWCZYNI POGODY

                  SprawData(
                      id: 'znawczyni_pogody',
                      title: 'Znawczyni pogody',
                      level: '2',
                      tasks: [
                        'Poda charakterystyczne cechy (rozkład ciśnienia, temperatury, kierunek i prędkość wiatru, rodzaj chmur) pogody słonecznej, pogody zimnej, pogody złej dla klimatu Polski.',
                        'Rozróżnia 10 rodzajów chmur, masy powietrza, oznaki ich zbliżania się.',
                        'Będzie obserwowała życie lasu w czasie deszczu.',
                        'Potrafi przewidzieć zmianę pogody w dniu następnym:'
                            'a)	na podstawie danych meteorologicznych (np. z odczytu mapy meteorologicznej),'
                            'b)	z obserwacji zjawisk atmosferycznych (zmiana temperatury, ciśnienia, wiatr, rodzaj chmur, kolor zachodzącego słońca, zorza, mgły, itp),'
                            'c)	z obserwacji zjawisk przyrodniczych (zachowanie roślin, zwierząt).',
                      ]
                  ),

//✽//✽//✽ METEOROLOG

                  SprawData(
                      id: 'meteorolog',
                      title: 'Meteorolog',
                      level: '3',
                      tasks: [
                        'Scharakteryzuje poszczególne warstwy atmosfery ziemskiej pod względem składu, zjawisk w nich występujących i roli, jaką pełnią dla'
                            'życia na Ziemi.',
                        'Wytłumaczy zasady cyrkulacji atmosfery na kuli ziemskiej dla obszaru Polski, na terenach górzystych i nad morzami.',
                        'Zwiedzi z zastępem stację meteorologiczną służąc za przewodnika.',
                        'Opowie ciekawie młodszym o burzy, tajfunie, trąbie powietrznej, zorzy polarnej, mirażu, itp.',
                        'Przez miesiąc będzie dokonywała pomiarów i obserwacji meteorologicznych oraz poprowadzi notatki i kalendarz pogody.',
                        'Wykona prosty przyrząd meteorologiczny (deszczomierz, wiatromierz).',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'ekologiczne',
                sprawData: [

                  SprawData(
                      id: 'maly_ekolog',
                      title: 'Mały ekolog',
                      level: '1',
                      tasks: [
                        'Zwraca szczególną uwagę na zgodność swojego postępowania z przyrodniczym punktem Prawa Harcerskiego, zrealizuje wynikające stąd postanowienia.',
                        'Z zastępem lub drużyną weźmie udział w leśnym rajdzie lub biwaku, zwróci szczególną uwagę na swoje zachowanie w lesie i przeprowadzi obserwacje przyrodnicze.',
                        'Potrafi zamaskować miejsce po ognisku, latrynie, dole na śmieci. Będzie uczestniczyła w maskowaniu obozu lub biwaku pozostawiając teren w stanie nie odbiegającym od zastanego.',
                        'Zna i wie jak wyglądają najważniejsze rośliny i zwierzęta chronione, wie, jakie można spotkać w najbliższej okolicy.',
                        'Oszczędza surowce, wodę, energię elektryczną, robi zakupy z głową, pozna zasady mądrego kupowania.',
                        'Poznała zasadę „kolorów recyklingu” – segreguje w domu śmieci, zachęca do tego innych.',
                        'Sporządzi dowolny przedmiot z surowców wtórnych (np. papier czerpany, wazon z plastikowej butelki).',
                      ]
                  ),

                  SprawData(
                      id: 'ekolog',
                      title: 'Ekolog',
                      level: '2',
                      tasks: [
                        'Grzecznie i odważnie zwraca uwagę wszystkim, którzy przyczyniają się do niszczenia środowiska: śmiecą, niszczą zieleń, piszą po murach, itp.',
                        'Wspólnie z zastępem lub drużyną podejmie działania poprawiające stan środowiska naturalnego lub zapobiegające jego dewastacji.',
                        'Zna zasady produkcji zdrowej żywności, wie co to jest rolnictwo ekologiczne. Wyeliminuje ze swoich posiłków najbardziej szkodliwe produkty.',
                        'Przeprowadzi zwiad ekologiczny, rozpozna główne śródła zagrożeń w okolicy, udostępni swoje wyniki (np. w formie artykułu).',
                        'Będzie odpowiedzialna za maskowanie terenu po obozie lub biwaku. Stosuje zasady ekologicznego biwakowania.',
                        'Wzbogaci biblioteczkę harcerską o wybraną pozycję ekologiczną.',
                        'Zapozna się z postacią patrona ekologów św. Franciszkiem z Asyżu.',
                        'Zna podstawowe zależności między gatunkami w ekosystemie, wie jakie mogą być skutki ingerencji człowieka w te zależności.',
                      ]
                  ),

                  SprawData(
                      id: 'ratowniczka_przyrody',
                      title: 'Ratowniczka przyrody',
                      level: '1',
                      tasks: [
                        'Pozna stan zagrożenia ekologicznego wybranego obszaru Polski i w interesujący sposób przedstawi o nim raport w drużynie.',
                        'Nawiąże współpracę z organizacją bądź instytucją zajmującą się ekologią, zorganizuje działanie na rzecz środowiska naturalnego przy wsparciu odpowiedniej instytucji lub organizacji opracowując je metodycznie.',
                        'Zna podstawowe przepisy dotyczące ochrony środowiska, potrafi je zastosować.',
                        'Na obozie stosuje zasady ekologicznego obozowania. Zapozna z nimi uczestników, zorganizuje pomoc dla zgrupowania (np. zajmie się segregacją odpadów).',
                      ]
                  ),

                  SprawData(
                      id: 'zielona',
                      title: 'Zielona',
                      level: '4',
                      tasks: [
                        'Zorganizuje i przeprowadzi obóz wędrowny/stały/kolonię zuchową o tematyce przyrodniczej, na którym uczestniczki:'
                            'a)	zapoznają się z zasadami życia i zachowania w lesie,'
                            'b)	zapoznają się z pięknem przyrody ojczystej, lokalnymi formami ochrony przyrody, miejscami wyjątkowymi w skali regionu,'
                            'c)	przeprowadzą zwiady ekologiczne, przyrodnicze,'
                            'd)	podejmą kilka prac pożytecznych dla środowiska,'
                            'e)	zapoznają się przed obozem z zasadami mądrych zakupów, a w trakcie z zasadami ekologicznego obozowania,'
                            'f)	rozpropagują wśród ludności wiejskiej informacje nt. programów rolnośrodowiskowych (wcześniej zapoznając się z ich zasadami), rolnictwo ekologiczne, zasady dobrej praktyki rolnej,'
                            'g)	zaplanują zdrowe posiłki z produktów o najmniejszym stopniu przetworzenia.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'las',
                sprawData: [

                  SprawData(
                      id: 'rybka',
                      title: 'Rybka',
                      level: '1',
                      tasks: [
                        'Założy prawidłowo żyłkę na wędkę.',
                        'Zna 5 rodzajów ryb słodkowodnych i słonowodnych zdatnych do jedzenia.',
                        'Zakupi w sklepie wędkarskim odpowiednią przynętę i sprzęt.',
                        'Wie, kiedy ryby biorą najlepiej, samodzielnie złowi rybę.',
                      ]
                  ),
//✽//✽ WĘDKARZ

                  SprawData(
                      id: 'wedkarz',
                      title: 'Wędkarz',
                      level: '2',
                      tasks: [
                        'Prawidłowo nałoży żyłkę, przynętę i dobrze zarzuci.',
                        'Zna 10 gatunków ryb słodkoi słonowodnych.',
                        'Upiecze samodzielnie złowione ryby na ognisku.',
                        'Wypłynie na połów z doświadczonym rybakiem lub wędkarzem. Przez ten czas nauczy się tajników połowu i zaobserwuje zachowania ryb.',
                      ]
                  ),

//✽//✽//✽ RYBAK

                  SprawData(
                      id: 'rybak',
                      title: 'rybak',
                      level: '3',
                      tasks: [
                        'Spędzi dzień na wodzie łowiąc ryby najlepszymi znanymi jej sposobami.',
                        'Przyrządzi dwa posiłki ze złowionych przez siebie ryb.',
                        'Zna 20 gatunków ryb słonoi słodkowodnych.',
                      ]
                  ),


                ]
            ),
          ]
      ),

      SprawGroupData(
          id: 'samarytanskie',
          title: 'Samarytańskie',
          familyData: [

            SprawFamilyData(
                id: 'podstawowe',
                sprawData: [

                  SprawData(
                      id: 'higienistka',
                      title: 'Higienistka',
                      level: '1',
                      tasks: [
                        'Skompletuje osobistą apteczkę na rajd/biwak/obóz, umie z niej korzystać.',
                        'Umie zapobiegać przeziębieniu, zabezpieczy się przed odparzeniem nóg, odmrożeniem, przegrzaniem.',
                        'Bezpiecznie dla siebie założy prosty opatrunek – zabandażuje rękę/stopę, zaopatrzy skaleczenie, umie posługiwać się chustą trójkątną.',
                        'Potrafi zaradzić w prostych przypadkach krwotoku z nosa, stłuczenia, itp.',
                        'Zmierzy temperaturę dorosłemu, wie jak mierzyć temperaturę dziecku.',
                        'Zadba o czystość urządzeń sanitarnych.',
                        'Rozumie niebezpieczeństwo zakażeń krwią i innymi płynami ustrojowymi.',
                      ]
                  ),

                  SprawData(
                      id: 'sanitariuszka',
                      title: 'Sanitariuszka',
                      level: '2',
                      tasks: [
                        'Skompletuje polową apteczkę zastępu i pokaże jak z niej prawidłowo korzystać.',
                        'Zaradzi w prostym przypadku'
                            'omdlenia, odmrożenia, oparzenia, udaru cieplnego, zaprószenia oka, ukąszenia przez owady.',
                        'Bezpiecznie dla siebie założy opatrunek na ranę, zabandażuje palec, przedramię, łokieć, głowę, wie jak unieruchomić złamaną, zwichniętą kończynę.',
                        'Sporządzi prowizoryczne nosze, zorganizuje transport chorego.',
                        'Umie zmierzyć tętno – zna miejsca pomiaru tętna, zmierzy temperaturę dorosłemu i dziecku.',
                        'Potrafi zgasić palące się na człowieku ubranie.',
                        'Będzie pełniła służbę sanitarną na biwaku.',
                      ]
                  ),

                  SprawData(
                      id: 'ratowniczka',
                      title: 'Ratowniczka',
                      level: '3',
                      tasks: [
                        'Skompletuje apteczkę drużyny, nauczy dwie harcerki jak z niej korzystać.',
                        'Zaradzi w przypadku omdlenia, odmrożenia, oparzenia, udaru'
                            'cieplnego, zaprószenia oka, zatrucia, ukąszenia przez zwierzęta dzikie.',
                        'Umie zaradzić w przypadku krwotoku, zaczadzenia, porażenia prądem, utonięcia, pamiętając o swoim bezpieczeństwie'
                            'Pomoże w ambulatorium obozowym, przygotuje dla chorego pomieszczenie i zorganizuje opiekę.',
                        'Poprowadzi zajęcia z zakresu pierwszej pomocy przedmedycznej dla harcerek.',
                        'Wie jak wykonać sztuczne oddychanie oraz zewnętrzny masaż serca.',
                        'Wie jakie jest niebezpieczeństwo zakażeń podczas kontaktu z krwią i innymi wydzielinami, przeprowadzi szkolenie na powyższy temat.',
                      ]
                  ),

                  SprawData(
                      id: 'samarytanka',
                      title: 'Samarytanka',
                      level: '4',
                      tasks: [
                        'Pokieruje patrolem ratowniczym podczas Białej Służby lub w czasie innej służby. Prawidłowo wykona swoje obowiązki pamiętając o bezpieczeństwie swoim oraz członków patrolu.',
                        'Umie przeciwdziałać wywoływaniu paniki wśród tłumu.',
                        'Potrafi zaradzić w poważnym wypadku (uraz kręgosłupa, rany brzucha, niedocukrzenie, uraz głowy).',
                        'Potrafi zorganizować i korzystać w czasie służby z łączności z innymi patrolami i dowodzącą akcją.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'ratownictwo_medyczne',
                sprawData: [
                  SprawData(
                      id: 'ratowniczka_medyczna',
                      title: 'Ratowniczka medyczna',
                      level: '2',
                      tasks: [
                        'Zna zasadę „złotej godziny”, wie jak szybko wezwać pomoc w różnych warunkach (w lesie, na wodzie, na stoku, itd.).',
                        'Ukończy kurs pierwszej pomocy (np. HOPR, PCK, Fundacji św. Kamila).',
                        'Odwiedzi placówkę ratunkową, np. TOPR, GOPR, WOPR, izbę przyjęć.',
                        'Wie, na jakiej zasadzie są w Polsce finansowane służby ratownicze.',
                        'Kompletuje sprzęt niezbędny do udzielenia pierwszej pomocy.',
                      ]
                  ),

                  SprawData(
                      id: 'propagatorka_ratownictwa_medycznego',
                      title: 'Propagatorka ratownictwa medycznego',
                      level: '3',
                      tasks: [
                        'Zorganizuje i ukończy kurs pierwszej pomocy (np. HOPR, PCK, Fundacji św. Kamila).',
                        'Zorganizuje akcję promującą wiedzę o udzielaniu pierwszej pomocy w swojej szkole, na osiedlu, w parafii.',
                        'Zapozna się z zasadami funkcjonowania HOPR, swoją wiedzą podzieli się z innymi.',
                        'Współpracuje jako wolontariuszka z Pogotowiem Ratunkowym, WOPR, TOPR lub inną służbą ratowniczą.',
                      ]
                  ),

                  SprawData(
                      id: 'opiekunka_chorych',
                      title: 'Opiekunkna chorych',
                      level: '2',
                      tasks: [
                        'Przygotuje pokój dla chorego (lub namiot izolatkę) i utrzyma go w porządku.',
                        'Zaopiekuje się chorym domownikiem lub harcerką na obozie:'
                            'a)	zadba o posiłki i poda lekarstwa,'
                            'b)	pomoże w toalecie,'
                            'c)	zmierzy temperaturę i tętno,'
                            'd)	postara się zająć chorego (zapewni mu rozrywkę).',
                        'Przygotuje prostą potrawę dietetyczną lub „domowe” lekarstwo (np. syrop z cebuli, mieszankę ziołową).',
                        'Potrafi zrobić okład, kompres.',
                        'Prawidłowo wykonuje masaż zmęczonych mięśni.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_ratownictwa_medycznego',
                      title: 'Mistrzyni ratownictwa medycznego',
                      level: '4',
                      tasks: [
                        'Zdobędzie wyższe kwalifikacje w ratownictwie (kurs instruktorski, kurs II stopnia, kurs ratownika WOPR, itd.).',
                        'Współpracuje z placówką ratownictwa w swoim otoczeniu, np. przy organizacji pokazów ratownictwa, itd.',
                        'Propaguje szkolenia ratownicze w swoim środowisku harcerskim, udokumentuje swoją pracę.',
                        'Nawiąże współpracę z HOPR.',
                      ]
                  ),

                  SprawData(
                      id: 'pielegniarka',
                      title: 'Pielęgniarka',
                      level: '3',
                      tasks: [
                        'Zaopiekuje się chorym przez miesiąc: będzie przyrządzała proste posiłki dietetyczne, parzyła zioła, pomagała choremu w myciu się, czesaniu, załatwia-'
                            'niu potrzeb osobistych, zapobiegała powstawaniu odleżyn.',
                        'Prawidłowo pościeli łóżko choremu i utrzyma je w należytym porządku.',
                        'Będzie utrzymywała kontakt z lekarzem, przestrzega-'
                            'ła jego zaleceń, zakupi potrzebne leki.',
                        'Umie patrzeć uważnie na chorego, spostrzega jego pragnienia i zmiany w samopoczuciu, stara się znaleźć choremu zajęcie i rozrywkę. Jest pogodna, opanowana, cierpliwa.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'promocja_zdrowia',
                sprawData: [

                  SprawData(
                      id: 'zdrowy_duszek',
                      title: 'Zdrowy duszek',
                      level: '1',
                      tasks: [
                        'Zna piramidę żywieniową, postara się dostosować do niej swoją dietę.',
                        'Przebiegnie „ścieżkę zdrowia”.',
                        'Zna podstawowe zasady higieny włosów, skóry, paznokci.',
                        'åwiczy zestawy ćwiczeń kształtujących poszczególne grupy mięśni.',
                        'Zna wady i zalety stresu. Potrafi radzić sobie z negatywnym stresem.',
                      ]
                  ),

                  SprawData(
                      id: 'zdrowy_duch',
                      title: 'Zdrowy duch',
                      level: '2',
                      tasks: [
                        'Zapozna się z 3 rodzajami diet, wskaże ich wady i zalety.',
                        'Dowie się, czym jest anoreksja i bulimia i jak je rozpoznać.',
                        'Dba o swój zdrowy wizerunek.',
                        'Zna ćwiczenia pomagające zachować prawidłową sylwetkę.',
                        'Zna konsekwencje otyłości oraz niedożywienia. Zorganizuje w swoim najbliższym otoczeniu kampanię promującą zdrowy styl życia.',
                        'Wie, jaki skutek dla organizmu ma przedawkowanie i uzależnienie od alkoholu, narkotyków i nikotyny.',
                      ]
                  ),

                  SprawData(
                      id: 'animatorka_promocji_zdrowia',
                      title: 'Animatorka promocji zdrowia',
                      level: '3',
                      tasks: [
                        'Potrafi poradzić sobie z konsekwencjami zmian hormonalnych u dojrzewającej dziewczyny (trądzik, wahania wagi, spadek kondycji, itd.).',
                        'Włączy się wraz z koleżankami w program promujący zdrowy styl życia (np. program profilaktyczny).',
                        'Zorganizuje „ścieżkę zdrowia” dla harcerek lub zuchów.',
                        'Zapozna się z zaburzeniami odżywiania, koncepcjami przyczyn, zasadami leczenia.',
                        'Promuje zasady racjonalnego i zdrowego odchudzania.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_promocji_zdrowia',
                      title: 'Mistrzyni promocji zdrowia',
                      level: '4',
                      tasks: [
                        'Stworzy projekt promocji zdrowia dla niewielkiej grupy dziewcząt (drużyna, szczep, klasa, itd.) zawierający fachowe poradnictwo'
                            'z zakresu zdrowego wizerunku, doboru ćwiczeń, kosmetyków, prawidłowego odżywiania się. Skorzysta z pomocy profesjonalisty.',
                        'Zapozna się z zasadami ubioru i makijażu maskującego defekty urody.',
                        'W wybranej formie włączy się w program związany z profilaktyką uzależnień, promocją zdrowia, walką z zaburzeniami odżywiania, itd.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'opieka_nad_starszymi',
                sprawData: [

                  SprawData(
                      id: 'wnuczka',
                      title: 'Wnuczka',
                      level: '1',
                      tasks: [
                        'Chętnie pomaga starszej osobie (babcia, dziadek), zrobi zakupy, posprząta pokój, przygotuje prosty posiłek.',
                        'Razem z zastępem weźmie udział'
                            'w zorganizowaniu spotkania z okazji Dnia Babci, Dnia Dziadka.',
                        'Umie słuchać starszych osób, wraz z zastępem odwiedzi starszego człowieka i wysłucha jego wspomnień.',
                      ]
                  ),

                  SprawData(
                      id: 'opiekunka_starszych',
                      title: 'Opiekunka starszych',
                      level: '3',
                      tasks: [
                        'Pomaga sama lub z innymi harcerkami osobie starszej (będzie sprzątała, robiła zakupy, itp.).',
                        'Opiekuje się osobą starszą podczas choroby.',
                        'Słucha chętnie opowiadań ludzi starszych o czasach ich dzieciństwa i młodości.',
                        'Rozmawiając ze swoimi rodzicami, dziadkami i dalszą rodziną zdobędzie wiele wiadomości na temat swoich przodków, zaprezentuje kilka opowiadań z ich życia.',
                        'Potrafi przedstawić trzy sytuacje, w których mądrość starszych była jej pomocna w życiu.',
                      ]
                  ),

                  SprawData(
                      id: 'przyjaciolka_seniora',
                      title: 'Przyjaciółka seniora',
                      level: '3',
                      tasks: [
                        'Systematycznie opiekuje się osobą starszą (minimum pół roku), potrafi powiedzieć, jakie korzyści odnosi z tego kontaktu.',
                        'Stale utrzymuje w porządku miesz-'
                            'kanie osoby starszej, dokona niezbędnych napraw.',
                        'Przygotuje prostą potrawę dietetyczną lub domowe lekarstwo.',
                        'Wraz z drużyną zorganizuje niesienie pomocy ludziom starszym.',
                        'Zna problemy życia starszych ludzi, wie jak je łagodzić.',
                        'Lubi rozmawiać z osobami starszymi, uważnie ich słucha, przerywając bariery pokoleniowe nawiązuje z nimi głęboki kontakt.',
                        'Zaprosi na spotkanie z harcerkami lub odwiedzi z nimi człowieka starszego, który dobrze przeżył swoje'
                            'życie i potrafi o nim ciekawie opowiadać.',
                      ]
                  ),

                  SprawData(
                      id: 'przyjaciel_domu',
                      title: 'Przyjaciel domu',
                      level: '4',
                      tasks: [
                        'Opiekując się osobą starszą, niedołężną lub biedną zapewni jej godziwe warunki mieszkania:'
                            'a)	odnowi mieszkanie,'
                            'b)	dokona niezbędnych napraw (sama lub przy pomocy specjalistów),'
                            'c)	estetycznie urządzi wnętrze licząc się z potrzebami i gustem mieszkańców (wraz z drużyną zdobędzie potrzebne środki finansowe, przedmioty i materiały),'
                            'd)	podejmie odpowiedzialność za stałe utrzymywanie mieszkania w porządku i czystości.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'opieka_nad_dziecmi',
                sprawData: [

                  SprawData(
                      id: 'starsza_siostra',
                      title: 'Starsza siostra',
                      level: '1',
                      tasks: [
                        'Zajmie się dzieckiem powierzonym jej opiece, zabawi w ciągu kilku godzin.',
                        'Nakarmi dziecko przygotowaną przez siebie potrawą.',
                        'Wykona zabawkę dla dziecka.',
                        'Razem z zastępem weźmie udział w zorganizowaniu zabaw dla drużyny zuchów lub dzieci z podwórka, czy szkoły.',
                        'Zabawi małe dziecko w domu (np. chore lub w dzień deszczowy).',
                      ]
                  ),

                  SprawData(
                      id: 'przyjaciolka_dzieci',
                      title: 'Przyjaciółka dzieci',
                      level: '2',
                      tasks: [
                        'Obserwuje dzieci, pomaga im w rozwiązywaniu problemów. Zajmie i zabawi kilkoro dzieci w różnym wieku w ciągu kilku godzin:'
                            'a)	zorganizuje zabawy ruchowe i statyczne,'
                            'b)	zorganizuje zabawy ze śpiewem, nauczy piosenki,'
                            'c)	opowie bajkę, nauczy wierszyka,'
                            'd)	zajmie dzieci pracą ręczną (wycinanie, lepienie, rysowanie, itp.).',
                        'weźmie udział w organizowaniu imprezy dla gromady zuchów lub dzieci z podwórka czy szkoły (np. festyn sportowy, bal, powitanie wiosny).',
                        'Przygotuje kilka rodzajów zdrowych deserów dla dzieci (np. galaretka z owocami, mus owocowy, koktajl).',
                      ]
                  ),

                  SprawData(
                      id: 'opiekunka_dzieci',
                      title: 'Opiekunka dzieci',
                      level: '3',
                      tasks: [
                        'Zajmie się przez kilka godzin niemowlęciem, przewinie je, nakarmi butelką, będzie asystowała przy kąpieli.',
                        'Zaopiekuje się dzieckiem przedszkolnym przez kilka dni.',
                        'Przynajmniej przez miesiąc będzie pomagała w lekcjach dziecku ze szkoły podstawowej.',
                        'Wykona zabawki dla dzieci w różnym wieku, przeka-'
                            'że je do domu dziecka, szpitala, hospicjum.',
                        'Umie zaopiekować się dzieckiem chorym, niepełnosprawnym.',
                        'Zna potrzeby i oczekiwania dzieci w różnym wieku. Wskaże cechy psychiczne i fizyczne dziecka w poszczególnych okresach jego rozwoju.',
                        'Poprowadzi zajęcia z chorymi dziećmi, np. w szpitalu.',
                        'Pokieruje urządzeniem lub odnowieniem miejsca zabaw, np. ogródka jordanowskiego, pomieszczenia dla dzieci.',
                      ]
                  ),

                  SprawData(
                      id: 'mama_muminkow',
                      title: 'Mama muminków',
                      level: '4',
                      tasks: [
                        'Zorganizuje w drużynie stałą służbę na rzecz dzieci (do wyboru):'
                            '\n- ubogich, zaniedbanych,'
                            '\n- niepełnosprawnych.',
                        'Uzyska przeszkolenie w tej dziedzinie. Zgromadzi grupkę dzieci. Będzie prowadziła wraz z harcerkami zajęcia dla nich, co najmniej raz w tygodniu przez okres pół roku. Podejmie odpowiedzialność za przekazanie rozpoczętej pracy następczyni.',
                      ]
                  ),


                ]
            ),

            SprawFamilyData(
                id: 'wolontariat',
                sprawData: [

                  SprawData(
                      id: 'promyczek_slonca',
                      title: 'Promyczek słońca',
                      level: '1',
                      tasks: [
                        'Pomoże wraz z zastępem harcerek osobie biednej, zaniedbanej.',
                        'Pomyśli o losie ludzi najuboższych.',
                        'Wie kim była Matka Teresa z Kalkuty.',
                      ]
                  ),

                  SprawData(
                      id: 'pomocna_dlon',
                      title: 'Pomocna dłoń',
                      level: '2',
                      tasks: [
                        'Zorganizuje przynajmniej trzy razy służbę na rzecz ludzi najuboższych (zbierze odzież lub produkty pierwszej potrzeby, książki dla dzieci, itp.).',
                        'Zapozna się z refleksjami Matki Te-'
                            'resy o służbie najuboższym. Odnajdzie inne sylwetki ludzi, którzy oddali się służbie potrzebującym.',
                        'Pomoże koleżance w znalezieniu zajęcia, dzięki któremu zdobędzie ona środki na swoje najprostsze potrzeby.',
                      ]
                  ),

                  SprawData(
                      id: 'wolontariuszka',
                      title: 'Wolontariuszka',
                      level: '3',
                      tasks: [
                        'Zorganizuje stałe pole służby dla drużyny, wykazując się przy tym znajomością potrzeb i oczekiwań ludzi najuboższych'
                            'weźmie udział w służbie ludziom potrzebującym pomocy poza granicami kraju.',
                        'Wystąpi odważnie sama przeciwko osobie, która marnotrawi dobra, np. wyrzuca chleb.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'pelni',
                sprawData: [

                  SprawData(
                      id: 'harcerka_pelni',
                      title: 'Harcerka pełni',
                      level: '1',
                      tasks: [
                        'Wie, co to jest niepełnosprawność, alfabet Braille’a, język migowy, piktogramy, olimpiady specjalne.',
                        'Spędzi 1-3 godzin z osobą niepełnosprawną'
                            'weźmie udział w harcach pozwalających jej poznać trudności, z jakimi spotykają się codziennie osoby niepełnosprawne'
                            'Pozna wybitne osiągnięcie wybranej osoby niepełnosprawnej.',
                        'Dostrzega potrzeby innych, potrafi nawiązać rozmowę i pomóc.',
                      ]
                  ),

                  SprawData(
                      id: 'pionierka_pelni',
                      title: 'Pionierka pełni',
                      level: '2',
                      tasks: [
                        'Po uzgodnieniu z drużynową przeczyta dowolną książkę lub obejrzy film przybliżający sytuację osób niepełnosprawnych. Podzieli się swoimi przemyśleniami.',
                        'Zna podstawy i zasady alfabetu migowego i kilka podstawowych zwrotów.',
                        'Współpracując z opiekunem zorganizuje osobie niepełnosprawnej wyjście do miejsca publicznego, np. teatru, kina, urzędu biorąc pod uwagę bariery (np. architektoniczne), które mogą spotkać na swojej drodze.',
                        'Potrafi wskazać kilka instytucji, które pomagają osobom niepełnosprawnym w jej miejscowości lub w najbliższej okolicy.',
                        'weźmie udział w akcji zorganizowanej na rzecz osób niepełnosprawnych (festyn, kiermasz, turniej, piknik, bal, występ, itp.), zachęci do tego innych.',
                        'Nawiąże osobisty lub listowny/e-mailowy kontakt z niepełnosprawnym rówieśnikiem, dba o ten kontakt.',
                        'Potrafi odszukać w Internecie strony związane z problematyką osób niepełnosprawnych.',
                      ]
                  ),

                  SprawData(
                      id: 'przewodniczka_pelni',
                      title: 'Przewodniczka pełni',
                      level: '3',
                      tasks: [
                        'Nawiąże kontakt z ośrodkiem, stowarzyszeniem, bądź inną organizacją pomagającą osobom niepełnosprawnym. Dzięki niemu zdobędzie konkretną wiedzę i umiejętności.',
                        'Rozumie pojęcia: integracja i izolacja osób niepełnosprawnych, wie, z czego wynikają i jakie niosą skutki. Stworzy (współtworzy) i zrealizuje, dla wybranej grupy, środowiska program pozytywnego kształtowania postaw wobec osób niepełnosprawnych. Wykorzysta w tym celu publikacje, filmy, rozmowy, spotkania, itp.',
                        'Zainicjuje i będzie koordynatorką lub współorganizatorką imprezy integracyjnej dla osób niepełnosprawnych (festyn, kiermasz, turniej, piknik, bal, występ, biwak, itp.). Zadba, by była ona pozytywnym doświadczeniem dla osób uczestniczących w niej i przygotowujących ją.',
                        'Rozwija swoją wiedzę, by lepiej rozumieć i pomagać osobom niepełnosprawnym i chorym. Czyta materiały, w tym harcerskie.',
                      ]
                  ),

                  SprawData(
                      id: 'wedrowniczka_pelni',
                      title: 'Wędrowniczka pełni',
                      level: '3',
                      tasks: [
                        'Odbędzie 24-godzinną próbę aktywnego funkcjonowania z zawiązanymi oczami (by doświadczyć jednego z rodzajów niepełnosprawności).',
                        'Zdobędzie konkretną umiejętność'
                            'przydatną osobom niepełnosprawnym (np. kurs terapii zabawą, masażu, przewodnika orientacji przestrzennej, języka migowego, itp.).',
                        'Będzie miała znaczący udział w przedsięwzięciu w sposób istotny poprawiającym sytuację osoby/osób niepełnosprawnych (np. zorganizuje wolontariat do obsługi olimpiady specjalnej, weźmie udział w 3-miesięcznych zajęciach z dzieckiem autystycznym, załatwieniu osobie niepełnosprawnej wózka, komputera, itp.).',
                        'Rozwija swoją wiedzę, by lepiej rozumieć i pomagać osobom niepełnosprawnym i chorym. Czyta publikacje, w tym harcerskie.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_pelni',
                      title: 'Mistrzyni pełni',
                      level: '4',
                      tasks: [
                        'Zdobędzie umiejętności przydatne przy pomaganiu/organizowaniu pomocy dla osób niepełnosprawnych (instruktor orientacji przestrzennej, trener przeciwdziałania'
                            'przemocy, kurs masażu, język Braille’a, itp.).',
                        'Znajdzie stałe (minimum 3 miesiące) pole służby na rzecz osoby niepełnosprawnej. Potrafi odpowiednio zaopiekować się tą osobą, zorganizować jej czas. Jeśli jest to nadal potrzebne, zadba o zorganizowanie dalszej pomocy (namówi inną osobę, znajdzie pomocne stowarzyszenie, itp.).',
                        'Zachęci dowolne środowisko, grupę do stałych kontaktów z osobą/osobami niepełnosprawnymi lub działań na ich rzecz. W początkowym okresie otoczy tę inicjatywę opieką, pomocą (osoba niepełnosprawna w drużynie, stała współpraca z uczestnikami warsztatu terapii zajęciowej, itp.).',
                        'Pozostawi wymierny ślad swoich działań (np. doprowadzi do usunięcia niektórych barier architektonicznych, nagrania książek w bibliotece, stworzy sprawnie działający system dostarczania książek bibliotecznych do szpitala czy osób mających kłopoty z poruszaniem się, przygotuje pomocniczy materiał dla harcerek, itp.).',
                      ]
                  ),

                ]
            ),

          ]
      ),

      SprawGroupData(
          id: 'sprawnosci_rak',
          title: 'Sprawności rąk',
          familyData: [

            SprawFamilyData(
                id: 'podstawowe',
                sprawData: [

                  SprawData(
                      id: 'sobieradek',
                      title: 'Sobieradek',
                      level: '1',
                      tasks: [

                        'Naostrzy nóż.',
                        'Wymieni żarówkę i bezpieczniki.',
                        'Wymieni baterie w latarce, radiu lub magnetofonie, zegarku lub kalkulatorze.',
                        'Naoliwi zamek lub zawiasy.',
                        'Naprawi wtyczkę.',
                        'Oczyści i pomaluje: drewno, metal, tworzywo sztuczne.',
                        'Oczyści i zakonserwuje pędzel.',
                        'Obsłuży magnetofon, odtwarzacz CD.',

                      ]
                  ),


//✽//✽ SPRAWNE RĘCE

                  SprawData(
                      id: 'sprawne_rece',
                      title: 'Sprawne ręce',
                      level: '2',
                      tasks: [
                        'Posiada zestaw podstawowych narzędzi i stara się go powiększyć.',
                        'Sklei rozbitą porcelanę.',
                        'Sklei szkło, metal, plastik.',
                        'Oczyści z rdzy i zabezpieczy przed korozją dowolny przedmiot.',
                        'Zestawi obwód elektryczny, np. zreperuje lampki na choinkę.',
                        'Wykona pożyteczny przedmiot z drewna i sznurka.',
                        'Obsłuży rzutnik, magnetowid, odtwarzacz CD i DVD.',

                      ]
                  ),

//✽//✽//✽ MAJSTERKOWICZKA

                  SprawData(
                      id: 'majsterkowiczka',
                      title: 'Majsterkowiczka',
                      level: '3',
                      tasks: [
                        'Zreperuje cieknący kran.',
                        'Odetka umywalkę przez oczyszczenie syfonu.',
                        'Wstawi szybę.',
                        'Sklei przedmiot drewniany: krzesło, ławkę lub stół.',
                        'Zaimpregnuje obuwie, materiał.',
                        'Założy hak w ścianę z cegły (zamontuje półkę, szafkę lub karnisz).',
                        'Znajdzie osobę, która fachowo wykona reperację, której sama wykonać nie umie.',

                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'domowe',
                sprawData: [
                  SprawData(
                      id: 'dobry_duszek',
                      title: 'Dobry duszek',
                      level: '1',
                      tasks: [
                        'Utrzymuje porządek w swoim pokoju: odkurza, myje okna, pastuje podłogi, trzepie dywany, narzuty.',
                        'Układa wszystkie rzeczy we właściwych dla nich miejscach, ma porządek w szafie, na biurku, półkach.',
                        'Bierze udział w codziennym zmywaniu naczyń w rodzinie, nie „magazynuje” brudnych naczyń.',
                        'Systematycznie podlewa kwiaty.',
                        'Upierze ręcznie i wyprasuje swoje ubranie, wyczyści obuwie.',
                        'Przyszyje guziki, zaceruje rozdartą część ubrania.',

                      ]
                  ),

//✽//✽ PANI DOMU

                  SprawData(
                      id: 'pani_domu',
                      title: 'Pani domu',
                      level: '2',
                      tasks: [
                        'Pierze ubrania w pralce, segreguje wg rodzaju tkanin (temperatury prania) i intensywności barw.',
                        'Usunie z odzieży plamy różnego typu (tłuszcz, smoła, żywica, sok, krew, trawa, stearyna).',
                        'Upierze firanki, zasłony, wyczyści zamsz, torbę skórzaną, kołnierz futrzany, odróżnia materiały nadające się jedynie do prania chemicznego.',
                        'Zabezpieczy odzież przed molami.',
                        'Elegancko nakrywa do stołu, odpowiednio do wagi uroczystości.',
                        'Podejmuje gości smacznie zaparzoną herbatą, ew. kawą.',

                      ]
                  ),

//✽//✽//✽ GAŹDZINA

                  SprawData(
                      id: 'gazdzina',
                      title: 'Gaździna',
                      level: '3',
                      tasks: [
                        'Odnowi mieszkanie: pomaluje sufit, ściany (ew. wytapetuje), okna.',
                        'Wie jak walczyć z robactwem domowym (karaluchy, mrówki, pluskwy), myszami, szczurami.',
                        'Czyści i konserwuje meble z płyt wiórowych, surowego drewna, politurowane.',
                        'Czyści przedmioty metalowe: żyrandole, łańcuszki.',
                        'Z artykułów spożywczych, które posiada w domu przyrządzi szybką i tanią potrawę dla niespodziewanych gości.',
                        'Dba o swój wygląd zewnętrzny, jest zawsze ubrana stosownie do pory dnia i pełnionej roli, pielęgnuje cerę i włosy.',

                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'kuchenne',
                sprawData: [

                  SprawData(
                      id: 'gosposia',
                      title: 'Gosposia',
                      level: '1',
                      tasks: [
                        'Gospodaruje często w kuchni, utrzymuje w niej czystość i porządek.',
                        'Przygotuje trzykrotnie śniadania i trzykrotnie kolacje dla rodziny, zadba o ich różnorodność, prawidłowo dobierze produkty.',
                        'Poda do stołu estetycznie i punktualnie.',
                        'Zabezpieczy prawidłowo pozostałą żywność (pieczywo, wędlinę, nabiał, jarzyny).',
                        'Ułoży jadłospis na jeden dzień dla rodziny lub zastępu z podaniem ilości produktów, zrobi zakupy, rozliczy się z pieniędzy.',

                      ]
                  ),

                  SprawData(
                      id: 'gospodyni',
                      title: 'Gospodyni',
                      level: '2',
                      tasks: [
                        'Urządzi domową spiżarnię, prawidłowo zabezpieczy przed szkodnikami i psuciem różne typy produktów.',
                        'Rozmrozi i umyje lodówkę.',
                        'Rozpozna świeżość mięsa, pieczywa, nabiału oraz sprawdzi przydatność do spożycia konserw i soków.',
                        'Posługuje się mikserem, maszynką do mięsa, młynkiem do kawy, ew. robotem kuchennym.',
                        'Przyrządzi 2 pełne (różne) obiady z deserem dla rodziny.',

                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_kuchni',
                      title: 'Mistrzyni kuchni',
                      level: '3',
                      tasks: [
                        'Poprowadzi przez tydzień kuchnię domową:'
                            '\n- ułoży jadłospis,'
                            '\n- punktualnie przygotuje smaczne i estetycznie podane posiłki.',
                        'Samodzielnie przyrządzi:'
                            '\n- 5 różnych zup (nie z koncentratów),'
                            '\n- 3 potrawy mięsne (pieczone, duszone, gotowane),'
                            '\n- potrawę z ryb,'
                            '\n- potrawę z ryżu lub kaszy,'
                            '\n- 2 rodzaje deserów,'
                            '\n- 3 rodzaje sałatek,'
                            '\n- potrawę z mąki.',
                        'Korzystając z książki kucharskiej przyrządzi 2 potrawy staropolskie i 2 potrawy wybranej kuchni narodowej.',

                      ]
                  ),

                  SprawData(
                      id: 'szefowa_kuchni',
                      title: 'Szefowa kuchni',
                      level: '4',
                      tasks: [
                        'Zorganizuje i będzie prowadziła wraz z harcerkami kuchnię dla ludzi ubogich, wakacyjnych grup dziecięcych, kuchnię obozową, itp. przez okres 2 tygodni (obiady lub wyżywienie całodzienne):'
                            '\n- przygotuje pomieszczenia kuchenne i naczynia,'
                            '\n- sporządzi jadłospisy,'
                            '\n- zorganizuje podział prac w kuchni,'
                            '\n- urządzi stołówkę,'
                            '\n- ustali system rozdziału posiłków,'
                            '\n- będzie czuwała nad jakością i punktualnością podawanych potraw.',

                      ]
                  ),


                ]
            ),

            SprawFamilyData(
                id: 'x',
                sprawData: [
                  SprawData(
                      id: 'cukierniczka',
                      title: 'Cukierniczka',
                      level: '1',
                      tasks: [
                        'Upiecze proste ciasto wg przepisu.',
                        'Upiecze kruche ciasteczka.',
                        'Przyrządzi proste desery: kisiel, budyń, galaretkę, krem.',
                        'Przyrządzi herbatę, kawę, czekoladę, kakao.',

                      ]
                  ),

//✽//✽ CIASTKARKA

                  SprawData(
                      id: 'ciastkarka',
                      title: 'Ciastkarka',
                      level: '2',
                      tasks: [
                        'Upiecze dwa rodzaje ciasta oraz kilka rodzajów ciasteczek i ciastek.',
                        'Zrobi lukier, masę do tortu, dowolne cukierki lub czekoladę.',
                        'Zrobi ciasto, które nie wymaga pieczenia.',
                        'Obliczy koszt wykonywanych przez siebie wyrobów cukierniczych.',
                        'Wie, jakie ciasta są zwyczajowo pieczone w Polsce i niektórych innych krajach na Boże Narodzenie i Wielkanoc.',

                      ]
                  ),

//✽//✽//✽ CIASTKARKA DOSKONAŁA

                  SprawData(
                      id: 'ciastkarka_doskonala',
                      title: 'Ciastkarka doskonała',
                      level: '3',
                      tasks: [
                        'Upiecze po jednym cieście wybranym z każdej grupy:'
                            '\n- babka, placek, pączki (ciasto drożdżowe).'
                            '\n- chrust, mazurek, biszkopt, ptysie.'
                            '\n- sernik, piernik.'
                            '\n- tort.',
                        'Przygotuje zbiór przepisów ciast łatwych do wykonania na obozie, zimowisku.',
                      ]
                  ),

                  SprawData(
                    id: 'mistrzyni_cukiernictwa',
                    title: 'Mistrzyni cukiernictwa',
                    level: '4',
                    tasks: [
                      'Zorganizuje wraz z drużyną sprzedaż wyrobów cukierniczych przed Świętami Wielkanocnymi:'
                          '\n- ustali asortyment wyrobów przeznaczonych na sprzedaż (co najmniej 8 gatunków),'
                          '\n- sporządzi przepisy wypieków i rozdzieli prace piekarnicze,'
                          '\n- załatwi lokal na sprzedaż,'
                          '\n- przeprowadzi kalkulację,'
                          '\n- urządzi wystawę wyrobów (wraz z dekoracją),'
                          '\n- rozreklamuje towar,'
                          '\n- zorganizuje sprzedaż.',
                    ],
                    comment: 'Przed podjęciem zdobywania sprawności należy zapoznać się z przepisami prawnymi związanymi z taką działalnością.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'przetworowe',
                sprawData: [

                  SprawData(
                      id: 'chomiczka',
                      title: 'Chomiczka',
                      level: '1',
                      tasks: [
                        'Nastawi mleko „na zsiadłe”, zrobi twarożek.',
                        'Ususzy owoce, warzywa, grzyby, kiełbasę.',
                        'Potrafi przechowywać produkty w lodówce (wie, jaki rodzaj produktów przechowuje się na górnej, a jaki na dolnej półce, jak długo mogą być te produkty przechowywane).',
                        'Odpowiednio pakując produkty przygotuje je do zamrożenia.',
                      ]
                  ),


                  SprawData(
                      id: 'spizarniowiec',
                      title: 'Spiżarniwiec',
                      level: '2',
                      tasks: [
                        'Nazbiera i ususzy dwie rośliny dzikie przeznaczone na „herbatkę”: liście mięty, kwiat rumianku, lipy, owoc dzikiej róży, czarnego bzu, itp.',
                        'Przygotuje na zimę dowolny rodzaj produktu wysokowitaminowego dla małych dzieci lub osób chorych.',
                        'Zakisi ogórki lub kapustę.',
                        'Sporządzi suchary z ciasta.',
                        'Przetopi słoninę na smalec.',
                      ]
                  ),

                  SprawData(
                      id: 'przetworczyni',
                      title: 'Przetwórczyni',
                      level: '3',
                      tasks: [
                        'Zrobi na zimę przetwory: sok, powidła lub dżem, kompot, marynatę.',
                        'Sporządzi ocet.',
                        'Zakisi barszcz biały i czerwony.',
                        'Zawekuje mięso.',
                        'Potrafi przechować przez zimę warzywa, owoce, ziemniaki.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'krawieckie',
                sprawData: [
                  SprawData(
                      id: 'igielka',
                      title: 'Igiełka',
                      level: '1',
                      tasks: [
                        'Uszyje drobny przedmiot: kołnierzyk mundurowy, woreczek na przybory do mycia, saszetkę, „łapkę” kuchenną, itp.',
                        'Wykona prawidłowo drobne prace krawieckie: przyszyje sprawnie guziki, wciągnie gumkę, naszyje aplikacje.',
                        'Naprawi odzież (zszyje, zaceruje, przyszyje łatę).',
                        'Uszyje i ozdobi według własnego pomysłu przybornik harcerski, piórnik, itp.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_igly',
                      title: 'Mistrzyni igły',
                      level: '2',
                      tasks: [
                        'Uszyje wg gotowego wykroju 2 proste części ubrania, np. fartuch, bluzkę bez rękawów, spódnicę.',
                        'Rozróżnia podstawowe rodzaje materiałów naturalnych i sztucznych.',
                        'Wykorzysta ścinki różnych materiałów do wykonania zabawki dziecięcej, aplikacji lub innego przedmiotu ozdobnego.',
                        'Wszyje prawidłowo suwak, estetycznie obrębi dziurki.',
                        'Naprawi sprzęt obozowy wykorzystując swoje umiejętności (np. wstawi łaty do namiotów, naprawi pokrowce).',
                        'W pracach krawieckich posłuży się maszyną do szycia, naoliwi ją i wymieni igłę.',
                      ]
                  ),

                  SprawData(
                      id: 'krawcowa',
                      title: 'Krawcowa',
                      level: '3',
                      tasks: [
                        'Pobierze miarę, sporządzi wykrój i wg niego skroi i uszyje mundur harcerski lub bluzkę koszulową i spódnicę.',
                        'Orientuje się w bieżącej modzie, przerobi stare ubranie na atrakcyjny i modny element odzieży.',
                        'Ma swój styl ubierania się, potrafi powiedzieć w jakich fasonach odzieży i w jakich barwach wygląda najkorzystniej.',
                        'Zachęci inne harcerki do samodzielnego szycia, zorganizuje wspólne szycie elementów munduru lub innej odzieży.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_krawiectwa',
                      title: 'Mistrzyni krawiectwa',
                      level: '4',
                      tasks: [
                        'Wraz z harcerkami, które przyuczyła do szycia zorganizuje i poprowadzi w ramach drużyny punkt krawiecki, np. szycia mundurów w nietypowych rozmiarach, kangurek, itp.:'
                            '\n- urządzi pracownię, odpowiednio ją wyposaży,'
                            '\n- sporządzi projekty i wykroje,'
                            '\n- dokona podziału pracy,'
                            '\n- zakupi materiał i dodatki krawieckie,'
                            '\n- rozreklamuje działalność pracowni (ew. wejdzie w kooperację z zakładem szyjącym mundury, składnicą harcerską, itp.),'
                            '\n- zapozna się z aspektami prawnymi podjęcia tego rodzaju działalności. Praca ta traktowana będzie jako śródło dochodu drużyny. W przeciągu 1/2 roku istnienia punkt obsłuży 60 klientek.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'dzierganie',
                sprawData: [

                  SprawData(
                      id: 'oczko',
                      title: 'Oczko',
                      level: '1',
                      tasks: [
                        'Zna trzy ściegi, w tym dżersej i ściągacz.',
                        'Wykona na drutach prosty element ubrania: szalik, getry, chustę, itp.',
                        'Zna ściegi szydełkowe: łańcuszek, półsłupek, słupek, tworzenie oczka ścisłego.',
                        'Wykona szydełkiem drobny upominek.',
                      ]
                  ),

                  SprawData(
                      id: 'dziewiarka',
                      title: 'Dziewiarka',
                      level: '2',
                      tasks: [
                        'Zna trzy sploty ozdobne szydełkiem i trzy sploty ozdobne na drutach.',
                        'Wykona na drutach części ubrania, np. sweter, sukienkę.',
                        'Prawidłowo dobiera rodzaj i barwę włóczki.',
                        'Wykona szydełkiem element dekoracyjny, np. serwetkę.',
                        'Przyozdobi wykonaną rzecz pomponem.',
                        'Interesuje się nowymi motywami robótek szydełkowych i na drutach, zbiera wzory i próbki.',
                      ]
                  ),

                  SprawData(
                      id: 'dziewiarka_doskonala',
                      title: 'Dziewiarka doskonała',
                      level: '3',
                      tasks: [
                        'Wykona na drutach dużą, podstawową część ubrania (np. sweter lub sukienkę) z wielobarwnym wzorem.',
                        'Wykona pracę na pięciu drutach.',
                        'Nauczy młodsze harcerki podstawowych ściegów szydełkowych i na drutach.',
                        'Pokieruje sporządzeniem przez harcerki dzierganych prezentów gwiazdkowych lub mikołajkowych albo wspólnej dla drużyny części stroju: getry, czapki, szaliki, itp.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'haftowanie',
                sprawData: [

                  SprawData(
                      id: 'niteczka',
                      title: 'Niteczka',
                      level: '1',
                      tasks: [
                        'Zna i potrafi wykonać kilka ściegów: za igłą, okrętkowy, krzyżykowy, łańcuszkowy, dziergany.',
                        'Ozdobi haftem 3 różne przedmioty, dobierze odpowiedni materiał, nici, barwy.',
                        'Wyhaftuje inicjały na części odzieży, kosmetyczce, piórniku lub przyborniku harcerskim.',
                      ]
                  ),

                  SprawData(
                      id: 'hafciarka',
                      title: 'Hafciarka',
                      level: '2',
                      tasks: [
                        'Ozdobi eleganckim haftem przedmiot dekoracyjny lub odzież (komplet serwetek, bluzkę, itp.).',
                        'Samodzielnie wykona projekt haftu.',
                        'Gromadzi wzory hafciarskie i książki z tej dziedziny.',
                        'Nauczy młodszych prostych prac hafciarskich.',
                      ]
                  ),

                  SprawData(
                      id: 'hafciarka_doskonala',
                      title: 'Hafciarka doskonała',
                      level: '3',
                      tasks: [
                        'Zastosuje haft półpełny i pełny.',
                        'Wykona obrus haftem richelieu.',
                        'Odwiedzi pracownię hafciarki ludowej, koronczarki albo wystawę haftu lub koronki.',
                        'Wykona pracę wg oryginalnego wzoru ludowego z zachowaniem odpowiedniego materiału, barw i techniki.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'wezly',
                sprawData: [
                  SprawData(
                      id: 'wezelek',
                      title: 'Węzełek',
                      level: '1',
                      tasks: [
                        'Odróżni węzeł płaski od babskiego.',
                        'Zwiąże dwie linki jednakowej i różnej grubości.',
                        'Zwiąże węzeł bezpieczny jedną ręką i ratowniczy.',
                        'Zapakuje paczkę.',
                        'Zakończy linkę bawełnianą i nylonową.',
                        'Założy linki do namiotu.',
                        'Wyplecie półkę lub pryczę.',
                      ]
                  ),

                  SprawData(
                      id: 'makramiarka',
                      title: 'Makramiarka',
                      level: '2',
                      tasks: [
                        'Zna 20 węzłów.',
                        'Założy linkę flagową.',
                        'Wykona przedmiot ozdobny ze sznurka (bransoletka, naszyjnik).',
                        'Wykona przedmiot praktyczny ze sznurka (pytka, bosmanka, rzutka).',
                        'Wykona urządzenie pionierskie bez użycia gwośdzi (prycza, brama).',
                        'Zwiąże żyłkę, płaską taśmę.',
                        'Wejdzie na drzewo lub skałę wykorzystując pętlę prusika.',
                      ]
                  ),

                  SprawData(
                      id: 'makramiarka_doskonala',
                      title: 'Makramiarka doskonała',
                      level: '3',
                      tasks: [
                        'Zna 50 węzłów.',
                        'Zaplanuje wystrój obozu wykorzystując sztukę wiązania.',
                        'Wykona makramę (makatka, torba, itp.).',
                        'Wykona hamak, kosze do koszykówki lub podobną praktyczną rzecz.',
                        'Wymyśli własny węzeł.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'ceramiczne',
                sprawData: [
                  SprawData(
                      id: 'glinka',
                      title: 'Glinka',
                      level: '1',
                      tasks: [
                        'Zrobi z gliny kilka małych, ozdobnych przedmiotów, polakierowała je. Posługuje się różnymi narzędziami do formowania gliny. Wykonane przez nią przedmioty mają różne tekstury – w swoich pracach wykorzystuje rzeczy o różnych powierzchniach. Używa nie tylko gliny, ale także muszelek, kamyczków, itp.',
                        'Odwiedzi w muzeum wystawę ceramiki (ludowej, współczesnej, użytkowej, itp.), zachęci kilka osób do zobaczenia tej wystawy.',
                        'Zbiera ciekawe rzeczy z gliny, porcelany, itp. Umie o nich interesująco opowiedzieć.',
                      ]
                  ),

                  SprawData(
                      id: 'garncarka',
                      title: 'Garncarka',
                      level: '2',
                      tasks: [
                        'Przeczyta dwie książki dotyczące technik ceramicznych i historii ceramiki.',
                        'Wykona na akcję zarobkową różne przedmioty i doprowadzi do ich sprzedaży.',
                        'Zaprojektuje kilka elementów ceramicznych dopełniających wystrój harcówki i wykona je.',
                        'Weźmie udział w kursie/zajęciach ceramiki organizowanych np. w młodzieżowym domu kultury.',
                        'Wypali w piecu swoje prace.',
                        'Umie pracować przy kole garncarskim.',
                      ]
                  ),

                  SprawData(
                      id: 'tworczyni_ceramiki',
                      title: 'Twórczyni ceramiki',
                      level: '3',
                      tasks: [
                        'Zorganizuje wystawę swoich prac i zareklamuje ją w swoim środowisku.',
                        'Doprowadzi do ukazania się w prasie wzmianki o jej osiągnięciach.',
                        'Przeprowadzi dla drużyny warsztaty artystyczne.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_rekodziela',
                      title: 'Mistrzyni rękodzieła',
                      level: '4',
                      tasks: [
                        'Regularnie doskonali swoje umiejętności w wybranej dziedzinie rękodzieła.',
                        'Zorganizuje wystawę lub aukcję swoich prac.',
                        'Zorganizuje warsztaty rękodzieła w swoim środowisku harcerskim.',
                        'Poznaje polską sztukę ludową i swoją wiedzą podzieli się w ciekawy sposób.',
                        'Odwiedzi pracownię wybranego artysty rękodzieła.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'fryzjerskie',
                sprawData: [
                  SprawData(
                      id: 'fryzjerka',
                      title: 'Fryzjerka',
                      level: '3',
                      tasks: [
                        'Wykona trzy fryzury z długich włosów. Umyje, zakręci na wałki, wysuszy, ułoży na szczotce krótsze włosy.',
                        'Podstrzyże odrastające włosy.',
                        'Obetnie włosy dziecku.',
                        'Udzieli koleżankom porad dotyczących pielęgnacji włosów (rozróżnia rodzaje włosów, dobiera szampony, zioła, pomoże przy rozdwajaniu się włosów, łupieżu, itp.).',
                        'Dobierze korzystną fryzurę dla siebie i swojej koleżanki.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'projektanckie',
                sprawData: [
                  SprawData(
                      id: 'mloda_projektantka',
                      title: 'Młoda projektantka',
                      level: '1',
                      tasks: [
                        'Potrafi rysować, „projektować” ubrania.',
                        'Umie narysować sylwetkę ludzką.',
                        'Zna barwy podstawowe.',
                        'Posiada swój przybornik do rysowania.',
                        'Uszyje samodzielnie prosty element, np. przybornik harcerski, plecaczek, itp.',
                      ]
                  ),

                  SprawData(
                      id: 'projektantka',
                      title: 'Projektantka',
                      level: '2',
                      tasks: [
                        'Potrafi narysować sylwetkę ludzką w różnych ustawieniach, zachowując odpowiednie proporcje.',
                        'Zaprezentuje część swoich prac przed drużyną lub zastępem.',
                        'Zorganizuje wraz z zastępem małą rewię mody obozowej. Samodzielnie przygotuje projekty, pokieruje wykonaniem strojów.',
                        'Rozróżnia podstawowe materiały krawieckie. Wykona album materiałów, uwzględniając materiały naturalne, syntetyczne.',
                      ]
                  ),

                  SprawData(
                      id: 'projektantka_doskonala',
                      title: 'Projektantka doskonała',
                      level: '3',
                      tasks: [
                        'Potrafi narysować sylwetkę damską, męską oraz dziecięcą, zachowując odpowiednie proporcje. Nauczy tej umiejętności kilka młodszych druhen.',
                        'Weźmie udział w pokazie mody.',
                        'Rozróżnia style i techniki malarskie. Wybierze dla siebie technikę, w której czuje się najlepiej. Zaprezentuje swoje prace na forum środowiska lokalnego, w którym żyje.',
                        'Zaprojektuje i wykona 5 strojów dla siebie lub koleżanki, uwzględniając materiały, krój, dobierając fason odpowiedni dla tej osoby.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'pisanie_na_maszynie',
                sprawData: [
                  SprawData(
                      id: 'maszynistka',
                      title: 'Maszynistka',
                      level: '3',
                      tasks: [
                        'Pisze na maszynie lub komputerze metodą bezwzrokową 10-cioma palcami z szybkością 90 uderzeń (50 słów) na minutę.',
                        'Czysto przepisze na maszynie lub komputerze tekst do druku.',
                        'Napisze kilka pism urzędowych (prawidłowo rozmieści tekst, zastosuje odpowiedni do treści format papieru).',
                        'Zna jeden typ maszyny do pisania, wyczyści ją, naoliwi, założy taśmę, itp.',
                        'Posłuży się elektryczną maszyną do pisania lub komputerem (edytor tekstu).',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'introligatorski',
                sprawData: [
                  SprawData(
                      id: 'introlikatorka',
                      title: 'Introligatorka',
                      level: '3',
                      tasks: [
                        'Oprawi 3 książki różnej wielkości, w tym 2 w oprawę kartonową z grzbietami i narożnikami płóciennymi.',
                        'Wykona album, tekę lub okładkę do dokumentów lub inną pracę introligatorską.',
                        'Podklei mapę lub obrazek.',
                        'Stosuje odpowiednie rodzaje płótna i papieru, sporządzi klej, posłuży się nożem i prasą introligatorską.',
                        'Pokaże jak udzielać pierwszej pomocy w przypadku skaleczenia nożem introligatorskim.',
                      ]
                  ),
                ]
            ),

          ]
      ),

      /*

      SprawFamilyData(
                id: 'x',
                sprawData: [

                  SprawData(
                      id: 'x',
                      title: 'x',
                      level: '1',
                      tasks: [
                        'x'
                      ]
                  ),

                ]
            ),

       */

      SprawGroupData(
          id: 'artystyczne',
          title: 'Artystyczne',
          familyData: [

            SprawFamilyData(
                id: 'spiewackie',
                sprawData: [

                  SprawData(
                      id: 'spiewaczka',
                      title: 'Śpiewaczka',
                      level: '1',
                      tasks: [
                        'Śpiewa 30 piosenek w tym 10 harcerskich.',
                        'Prowadzi śpiewniczek harcerski.',
                        'Nauczy zastęp jednej piosenki.',
                        'Wystąpi z zastępem na kominku lub ognisku śpiewając kilka piosenek oraz weźmie udział w inscenizacji jednej z nich.',
                      ]
                  ),

                  SprawData(
                      id: 'wokalistka',
                      title: 'Wokalistka',
                      level: '2',
                      tasks: [
                        'Intonuje piosenki na ognisku, kominku, wycieczkach.',
                        'Zna przynajmniej po 10 piosenek żołnierskich i ludowych oraz 6 pieśni narodowych.',
                        'Śpiewa 20 piosenek harcerskich.',
                        'Nauczy drużynę 3 nowych piosenek.',
                        'Wystąpi w konkursie piosenki.',
                      ]
                  ),

                  SprawData(
                      id: 'piesniarka',
                      title: 'Pieśniarka',
                      level: '3',
                      tasks: [
                        'Przygotuje i przeprowadzi ognisko tematyczne lub kominek proponując odpowiedni zestaw piosenek.',
                        'Weźmie udział w przygotowaniu festiwalu piosenki.',
                        'Prawidłowo poprowadzi śpiew drużyny w marszu.',
                        'Zna autorów wielu piosenek oraz okresy i okoliczności ich tworzenia. Opowie na zbiórce ciekawą historię powstania wybranej pieśni patriotycznej lub harcerskiej.',
                        'Potrafi zanucić melodię z nut.',
                      ]
                  ),

                  SprawData(
                      id: 'kierownik_artystyczny',
                      title: 'Kierownik artystyczny',
                      level: '4',
                      tasks: [
                        'Zorganizuje festiwal piosenki harcerskiej na szczeblu hufca lub chorągwi, który:'
                            '\n- będzie rozpropagowany w sposób zachęcający do wzięcia w nim udziału,'
                            '\n- odbędzie się w miłej atmosferze,'
                            '\n- odbędzie się w plenerze lub w sali z ciekawą dekoracją i dobrym nagłośnieniem,'
                            '\n- zawierać będzie, poza konkursem piosenki, wiele innych atrakcji i niespodzianek.',
                      ]
                  ),


                ]
            ),

            SprawFamilyData(
                id: 'muzyczne',
                sprawData: [

                  SprawData(
                      id: 'nutka',
                      title: 'Nutka',
                      level: '1',
                      tasks: [
                        'Zagra 3 melodie na prostym instrumencie (grzebień, flet, dzwonki, itp.).',
                        'W swoim otoczeniu odnajdzie kilka przedmiotów wydających ciekawe dświęki.',
                        'Odgadnie 8 dświęków na 10 wydawanych przez niewidoczne przedmioty (test).',
                        'Wykona 4 instrumenty perkusyjne z dostępnych materiałów (garnki, puszki, talerze, dzbany, itp.), będzie na nich akompaniować do 3 piosenek.',
                      ]
                  ),

                  SprawData(
                      id: 'grajek',
                      title: 'Grajek',
                      level: '2',
                      tasks: [
                        'Gra na wybranym instrumencie muzycznym (nie dotyczy gitary – patrz GITARZYSTKA).',
                        'Zagra kilkanaście piosenek harcerskich i innych.',
                        'Przygotuje oprawę muzyczną na imprezie harcerskiej.',
                        'Zorganizuje naukę piosenki akompaniując na instrumencie.',
                        'Nauczy drużynę nieznanej piosenki wg zapisu nutowego.',
                      ]
                  ),

                  SprawData(
                      id: 'muzyk',
                      title: 'Muzyk',
                      level: '3',
                      tasks: [
                        'Gra dobrze na jednym instrumencie, rozpoczyna naukę na dwóch innych instrumentach.',
                        'Posługuje się zapisem nutowym.',
                        'Rozśpiewa drużynę akompaniując na instrumencie.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'werblowe',
                sprawData: [
                  SprawData(
                      id: 'werblistka',
                      title: 'Werblistka',
                      level: '1',
                      tasks: [
                        'Gra na werblu podstawowe sygnały (baczność, spocznij, zbiórka, itp.).',
                        'Wykorzysta grę na werblu w czasie zbiórki zastępu, drużyny.',
                        'Przygotuje werbel do gry, właściwie go przechowuje.',
                      ]
                  ),

                  SprawData(
                      id: 'dobosz',
                      title: 'Dobosz',
                      level: '2',
                      tasks: [
                        'Pełni funkcję dobosza w paradzie harcerskiej.',
                        'Zagra na werblu apel poległych.',
                        'Wybije na werblu rytm znanej piosenki.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'trebackie',
                sprawData: [
                  SprawData(
                      id: 'trebacz',
                      title: 'Trębacz',
                      level: '2',
                      tasks: [
                        'Zagra na fanfarze lub sygnałówce kilka prostych melodii.',
                        'Zagra sygnały harcerskie: baczność, spocznij, marsz, cisza, posiłek, alarm.',
                        'Pełni funkcję trębacza na obozie lub biwaku.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'malarskie',
                sprawData: [
                  SprawData(
                      id: 'rysowniczka',
                      title: 'Rysowniczka',
                      level: '2',
                      tasks: [
                        'Zawsze posiada przy sobie papier i ołówek, wykorzystuje wolne chwile na szkicowanie.',
                        'Przedstawi po 3 szkice:'
                            '\n- postaci ludzkich (sceny obozowe, z wędrówek, zbiórek, karykatury),'
                            '\n- obiektów architektonicznych (kapliczki przydrożne, fragmenty zabytków, ciekawe budynki), pejzaży.',
                        'Dostarcza część swych prac do kroniki.',
                        'Przygotuje wystawę swoich prac.',
                      ]
                  ),

                  SprawData(
                      id: 'malarka',
                      title: 'Malarka',
                      level: '3',
                      tasks: [
                        'Interesuje się malarstwem współczesnym i dawnym, zwiedzi kilka wystaw, gromadzi reprodukcje i książki z tej dziedziny.',
                        'Scharakteryzuje style malarskie na przestrzeni dziejów.',
                        'Zna różne techniki malarskie.',
                        'Przedstawi kilka szkiców wykonanych w plenerze ołówkiem lub węglem oraz 5 prac malarskich (olej lub akwarela).',
                        'Zorganizuje wycieczkę zastępu lub drużyny na ciekawą wystawę malarstwa lub do muzeum, będzie pełniła na niej rolę przewodnika.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'dekoratorskie',
                sprawData: [
                  SprawData(
                      id: 'dekoratorka',
                      title: 'Dekoratorka',
                      level: '1',
                      tasks: [
                        'Posiada estetycznie udekorowany przez siebie pokój lub kącik do pracy.',
                        'Dekoruje kronikę zastępu lub drużyny.',
                        'Wykona napisy lub rysunki na tablicę ogłoszeń.',
                        'Ubierze kwiatami kapliczkę, ołtarz, stół na przyjęcie lub harcówkę.',
                        'Potrafi zastosować 4 różne rodzaje pisma dobierając je do charakteru tekstu.',
                      ]
                  ),

                  SprawData(
                      id: 'zdobniczka',
                      title: 'Zdobniczka',
                      level: '2',
                      tasks: [
                        'Wykona proporzec zastępu lub totem.',
                        'Opracuje pomysł np. znaku drużyny, pieczątki, pocztówki obozowej.',
                        'Zaprojektuje i wykona z zastępem ciekawy element zdobnictwa obozowego (kapliczkę, bramę, tablicę ogłoszeń, itp.).',
                        'Wykona 2 przedmioty ozdobne z prostych materiałów (tworzywo leśne, słoma, trzcina, sznurek, owoce, itp.).',
                        'Zbierze rysunki lub fotografie zdobnictwa obozowego.',
                        'Wykona „kartę do kroniki” opisującą wydarzenie z życia środowiska.',
                        'Weźmie udział w wykonaniu okolicznościowej dekoracji, scenografii.',
                      ]
                  ),

                  SprawData(
                      id: 'plastyczka',
                      title: 'Plastyczka',
                      level: '3',
                      tasks: [
                        'Zaprojektuje wnętrze harcówki lub namiotu, dobierze materiały, zestaw barw i form przestrzennych.',
                        'Wykona dekorację okolicznościową, scenografię.',
                        'Wykona element ozdobny jedną z technik (rześba w glinie lub gipsie, linoryt, tkactwo, itp.) i nauczy innych posługiwania się nią.',
                        'Zaprojektuje i wykona z innymi przedmioty ozdobne przeznaczone na sprzedaż w akcji zarobkowej drużyny.',
                        'Zorganizuje dla drużyny zajęcia poświęcone jednej z technik plastycznych (np. plener malarski).',
                        'Zorganizuje wycieczkę zastępu lub drużyny na wystawę, podczas której zainteresuje harcerki eksponatami (rześbą, obrazami, plakatami, fotografiami, itp.).',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_dekoracji',
                      title: 'Mistrzyni dekoracji',
                      level: '4',
                      tasks: [
                        'Zaprojektuje, zgromadzi materiały i pokieruje wykonaniem (do wyboru):'
                            '\n- wystroju kościoła z okazji uroczystości,'
                            '\n- wystroju szkoły z okazji balu maturalnego,'
                            '\n- ołtarza na Boże Ciało,'
                            '\n- Grobu Pańskiego,'
                            '\n- scenografii dla teatru amatorskiego,'
                            '\n- ilustracji do wydawanej w wydawnictwie harcerskim książki lub innej potrzebnej dekoracji o podobnej randze.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'poetyckie',
                sprawData: [
                  SprawData(
                      id: 'fraszka',
                      title: 'Fraszka',
                      level: '1',
                      tasks: [
                        'Wystąpi na ognisku lub kominku recytując wiersz odpowiedni do tematyki spotkania.',
                        'Weźmie udział w układaniu tekstu piosenki obozowej lub piosenki zastępu.',
                        'Ułoży dowcipne czterowiersze dla każdego z członków zastępu oddając ich charakterystyczne cechy.',
                      ]
                  ),

                  SprawData(
                      id: 'adeptka_poezji',
                      title: 'Adeptka poezji',
                      level: '2',
                      tasks: [
                        'Ma ulubionego poetę, zna jego życie i twórczość.',
                        'Pisze wiersze rymowane i wiersze białe, niektóre z nich zaprezentuje na ognisku harcerskim.',
                        'Przygotuje specjalny wieczorek poetycki dla drużyny gdzie będą prezentowane jej i inne wiersze na dowolny temat.',
                        'weźmie udział w konkursie poetyckim (typu: Turniej Jednego Wiersza).',
                        'Pomoże sekcji artystycznej w drużynie w stworzeniu ciekawego przedstawienia na specjalną okazję (lub, gdy nie ma takiej sekcji, stworzy ją, wystąpi z taką inicjatywą).',
                      ]
                  ),

                  SprawData(
                      id: 'recytatorka',
                      title: 'Recytatorka',
                      level: '2',
                      tasks: [
                        'Czyta wiele wierszy, zna na pamięć co najmniej 15.',
                        'Zna podstawowe techniki recytacji i interpretacji tekstu.',
                        'Umiejętnie zinterpretuje nieznany sobie dotychczas utwór, dobierając odpowiednio barwę głosu, modulację, intonację, tempo, rytm, dynamikę wypowiadanych słów.',
                        'Wystąpi w wieczorze poezji lub konkursie recytatorskim.',
                        'Jest autorką słów piosenki powstałej na obozie lub rajdzie drużyny, którą chętnie wszyscy śpiewają.',
                        'Uczęszcza na teatralne spotkania poetyckie z udziałem aktorów.',
                      ]
                  ),

                  SprawData(
                      id: 'poetka',
                      title: 'Poetka',
                      level: '3',
                      tasks: [
                        'Często urozmaica gawędy przy ogniskach zręcznie wplecioną poezją.',
                        'Przygotuje wieczór poezji na wybraną okoliczność (np. święto narodowe).',
                        'Pisze wiersze. Doprowadzi do wydrukowania swojego wiersza w prasie harcerskiej lub innej.',
                        'Poprowadzi zajęcia z technik nauki na pamięć tekstów, modulacji głosu, intonacji, interpretacji i innych technik recytacji ze szczególnym uwzględnieniem pracy nad poprawną dykcją.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'gitarowe',
                sprawData: [
                  SprawData(
                      id: 'gama',
                      title: 'Gama',
                      level: '1',
                      tasks: [
                        'Zna zasady strojenia gitary i stara się stroić instrument przed każdym użyciem.',
                        'Wie jak nazywają się poszczególne części gitary oraz zna nazwy strun gitary.',
                        'Zna podstawowe chwyty C, D, d, E, e, G, A, a, H7.',
                        'Potrafi akompaniować do 10 piosenek.',
                      ]
                  ),

//✽//✽ GITARZYSTKA

                  SprawData(
                      id: 'gitarzystka',
                      title: 'Gitarzystka',
                      level: '2',
                      tasks: [
                        'Zawsze stroi gitarę przed jej użyciem.',
                        'Zna wszystkie chwyty podstawowe: C, c, D, d, E, e, F, f, G, g, A, a, H, h.',
                        'Wie, co oznacza cyfra 7 przy akordzie i zna kilka chwytów septymowych.',
                        'Dobierze zestaw piosenek do tematyki ogniska lub kominka i poprowadzi śpiew akompaniując na gitarze.',
                        'Nauczy drużynę 3 nowych piosenek.',
                        'Posłuży się kapodastrem.',
                      ]
                  ),


                  SprawData(
                      id: 'gitarzystka_doskonala',
                      title: 'Gitarzystka doskonała',
                      level: '3',
                      tasks: [
                        'Zawsze stroi gitarę przed jej użyciem; wytłumaczy młodszej harcerce, po co i w jaki sposób stroi się gitarę.',
                        'Odczyta z nut piosenkę.',
                        'Dobierze chwyty do 5 piosenek.',
                        'Przygotuje i poprowadzi śpiewaną mszę harcerską.',
                        'Akompaniuje drużynie na ogniskach, kominkach, prowadzi śpiew. W swoim repertuarze posiada większość piosenek śpiewanych w drużynie.',
                        'Ułoży piosenkę obozową, lub przyśpiewki, np. na „smacznego”, itp.',
                        'Potrafi grać piosenki w różnym metrum.',
                        'Ciągle doskonali swoje umiejętności gry na gitarze (poznaje nowe chwyty, nowe sposoby strojenia, inne rodzaje gitar, nowe sposoby wydobywania dświęku przy użyciu gitary, itp.)'
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'lalkarskie',
                sprawData: [
                  SprawData(
                      id: 'lalkarka',
                      title: 'Lalkarka',
                      level: '2',
                      tasks: [
                        'Wykona z zastępem lalki różnego rodzaju: „pacynki”, jarzynki lub marionetki.',
                        'Przygotuje z zastępem przedstawienie lalkowe, zagra w nim – poruszając lalką – przynajmniej l rolę.',
                        'Wywoła w czasie występu efekty dświękowe (deszczu, burzy, strzału, jadącego pociągu, tętentu koni, itp.).',
                        'Wystąpi w teatrzyku cieni.',
                      ]
                  ),

                  SprawData(
                      id: 'rezyserka_lalkowa',
                      title: 'Reżyserka lalkowa',
                      level: '3',
                      tasks: [
                        'Napisze scenariusz przedstawienia lalkowego na podstawie znanej bajki, dobierze ilustrację muzyczną i efekty dświękowe.',
                        'Wraz z drużyną przygotuje jego wystawienie, rozdzieli role, przeprowadzi próby.',
                        'Zaprojektuje lalki, dobierze rekwizyty.',
                        'Zaprojektuje dekoracje i oświetlenie sceny.',
                        'Zadba o reklamę przedstawienia.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'tancerskie',
                sprawData: [
                  SprawData(
                      id: 'tancereczka',
                      title: 'Tancereczka',
                      level: '1',
                      tasks: [
                        'Regularnie uczęszcza na zajęcia tańca towarzyskiego lub współczesnego.',
                        'Umie zatańczyć 3 tańce (walc, polonez, kujawiak, polka).',
                        'Była na występie grupy tanecznej.',
                        'Na kominku lub ognisku postara się zaprezentować swoje umiejętności.',
                      ]
                  ),

                  SprawData(
                      id: 'tancerka',
                      title: 'Tancerka',
                      level: '2',
                      tasks: [
                        'Zatańczy poloneza, zna kilka figur.',
                        'Zatańczy po 2 tańce:'
                            '\n- towarzyskie klasyczne,'
                            '\n- towarzyskie nowoczesne,'
                            '\n- ludowe.',
                        'Weźmie udział w zorganizowaniu zabawy tanecznej lub balu harcerskiego, przygotuje muzykę.',
                        'Nauczy inne harcerki 2 nowych tańców.',
                      ]
                  ),

                  SprawData(
                      id: 'tancerka_doskonala',
                      title: 'Tancerka doskonała',
                      level: '3',
                      tasks: [
                        'Pozna historię wybranego tańca (walc, polonez, kujawiak, polka) i przedstawi zdobyte informacje w interesujący sposób drużynie.',
                        'Zorganizuje konkurs taneczny.',
                        'Pozna mało popularny taniec i nauczy się go.',
                      ]
                  ),

                  SprawData(
                      id: 'instruktorka_tanca',
                      title: 'Instruktorka tańca',
                      level: '4',
                      tasks: [
                        'Należy do teatru tańca.',
                        'Poprowadzi kurs tańca.',
                        'Założy w hufcu zespół taneczny, gdzie będzie pełniła funkcje choreografa i instruktora. Swój repertuar'
                            'Razem z zespołem zaprezentuje w Domu Kultury.',
                        'Przeprowadzi z młodszymi harcerkami lub zuchami zabawy z tańcem.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'wodzirejskie',
                sprawData: [
                  SprawData(
                      id: 'plasik',
                      title: 'Pląsik',
                      level: '1',
                      tasks: [
                        'Chętnie bierze udział w zabawach ze śpiewem.',
                        'Zna 4 pląsy. Nauczy się jednego nowego pląsu, pokaże go następnie harcerkom z zastępu.',
                        'Zobrazuje tańcem jedną z piosenek śpiewanych w drużynie.',
                        'Weźmie udział w zabawie tanecznej.',
                        'Będzie na występach zespołu pieśni i tańca.',
                      ]
                  ),

                  SprawData(
                      id: 'wodzirej',
                      title: 'Wodzirej',
                      level: '3',
                      tasks: [
                        'Przygotuje i przeprowadzi bal harcerski o określonej tematyce, będzie pełniła na nim rolę wodzireja.',
                        'Zaprojektuje wystrój sali i określi stroje zgodnie z tematyką balu.',
                        'Poprowadzi zbiorowe zabawy towarzyskie lub konkursy w przerwach między tańcami.',
                        'Poprowadzi naukę 3 tańców.',
                        'Zorganizuje poczęstunek w czasie zabawy.',
                        'W dowolnej grupie towarzyskiej zabawi rozmową wszystkich, wprowadzi przyjacielski, wesoły nastrój.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'gawedziarskie',
                sprawData: [
                  SprawData(
                      id: 'bajarka',
                      title: 'Bajarka',
                      level: '2',
                      tasks: [
                        'Zna 20 bajek. Opowie kilka z nich w swoim zastępie „na dobranoc”.',
                        'Opowiada płynnie, barwnym językiem, zmieniając barwę głosu w dialogu.',
                        'Opowie wymyśloną przez siebie ciekawą bajkę z morałem.',
                        'Przetworzy zwykłe zdarzenie dnia codziennego na opowiadanie trzymające słuchaczy w napięciu.',
                        'Opowiadaniem humorystycznym wywoła nastrój wesołości wśród słuchaczy.',
                      ]
                  ),

                  SprawData(
                      id: 'gawedziarka',
                      title: 'Gawędziarka',
                      level: '3',
                      tasks: [
                        'Powie 3 ciekawe gawędy 10-15 minutowe na wybrany oraz zadane tematy, oprze się na obserwacji życia i wiedzy książkowej.',
                        'Prezentowane gawędy zawierać będą coś, co dla słuchacza posiada trwałą, zasadniczą wartość mogącą wpłynąć na jego życie.',
                        'Opowiada z wyraśnie widocznym planem, zachowując równowagę między pierwiastkiem ogólnym (abstrakcyjnym) a konkretnym (obserwacyjnym).',
                        'Opowiada barwnie, z mocą i wiarą we własne słowa, umiejętnie dobiera nastrój do swoich gawęd (czas, sceneria, piosenki, itp.).',
                        'Posiada prosty, bezpośredni kontakt ze słuchaczami, łatwo nawiązuje dialog.',
                        'Poprowadzi ognisko, na które zaprosi gości i które poświęcone będzie konkretnemu tematowi.',
                      ]
                  ),

                  SprawData(
                      id: 'sabala',
                      title: 'Sabała',
                      level: '4',
                      tasks: [
                        'Opracuje pisemnie i wyda jako pomoc dla drużynowych cykl swoich gawęd, (co najmniej 10) do wyboru:'
                            '\n- dotyczących jednego tematu, ujętego z różnych punktów widzenia i przeznaczonych dla harcerek w różnym wieku,'
                            '\n- będących przykładem gawęd różno tematycznych (np. dotyczących Prawa Harcerskiego – wybranego punktu, święta narodowego, rocznicy związanej ze sławnym człowiekiem, aktualnego wydarzenia w kraju, wigilii, itp.).',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'rezyserskie',
                sprawData: [
                  SprawData(
                      id: 'komediantka',
                      title: 'Komediantka',
                      level: '1',
                      tasks: [
                        'Wystąpi przynajmniej 3 razy z zastępem na ognisku lub kominku dobrze odgrywając przydzieloną sobie rolę.',
                        'Opanuje tremę w czasie występów.',
                        'Zna kilka ćwiczeń związanych z poprawną dykcją.',
                        'Samodzielnie przygotuje strój i rekwizyty.',
                        'Obejrzy przedstawienie w teatrze.',
                      ]
                  ),

                  SprawData(
                      id: 'aktorka',
                      title: 'Aktorka',
                      level: '2',
                      tasks: [
                        'Przygotuje z zastępem przedstawienie zaczerpnięte z literatury odgrywając dobrze jedną z głównych ról.',
                        'Wygłosi z pamięci wiersz lub fragment prozy prawidłowo dobrany do tematyki ogniska lub kominka.',
                        'Wykona scenkę pantomimiczną.',
                        'Umiejętnie zinterpretuje nieznany sobie utwór.',
                        'Przygotuje ognisko lub kominek dla drużyny.',
                      ]
                  ),

                  SprawData(
                      id: 'asystentka_rezyserki',
                      title: 'Asystentka reżyserki',
                      level: '3',
                      tasks: [
                        'Przygotuje i przeprowadzi 2 duże ogniska harcerskie, w tym l ognisko tematyczne.',
                        'Przygotuje i zrealizuje inscenizację bajki dla dzieci.',
                        'Zapozna się z pracą reżysera teatralnego lub filmowego, weźmie udział w l próbie.',
                        'Pokieruje przygotowaniem dużej imprezy artystycznej (konkursu śpiewu, rysunkowego, festiwalu teatralnego, itp.).',
                      ]
                  ),

                  SprawData(
                      id: 'rezyserka',
                      title: 'Reżyserka',
                      level: '4',
                      tasks: [
                        'Przygotuje przedstawienie teatralne dla osób spoza środowiska harcerskiego (np. w szkole, domu dziecka) – ułoży program, dobierze teksty i ilustrację muzyczną, podzieli role, ustali kolejność występów i słowo wiążące:'
                            '\n- poprowadzi próby i nauczy aktorów poprawnie mówić,'
                            '\n- pokaże różne elementy gry aktorskiej, interpretację tekstu oraz ćwiczenia na opanowanie głosu, dykcji i mimiki,'
                            '\n- pokieruje stworzeniem projektów dekoracji, rekwizytów, doborem oświetlenia,'
                            '\n- weźmie udział w przygotowaniu kostiumów i charakteryzacji postaci.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'kinowe',
                sprawData: [
                  SprawData(
                      id: 'wielbicielka_kina',
                      title: 'Wielbicielka kina',
                      level: '2',
                      tasks: [
                        'Posiada kanon swoich ulubionych filmów. Potrafi uzasadnić swój wybór.',
                        'Zapozna się z sylwetką jednego wybranego twórcy kina polskiego. Swoją wiedzą podzieli się z innymi.',
                        'Odwiedzi plan filmowy lub studio montażowe bądź telewizyjne.',
                        'Obejrzy film niekomercyjny i przedstawi z niego relację.',
                      ]
                  ),

                  SprawData(
                      id: 'klaps',
                      title: 'Klaps',
                      level: '3',
                      tasks: [
                        'Weźmie udział w produkcji krótkiego filmu (np. napisze scenariusz, będzie operatorką, itd.).',
                        'Zorganizuje mały festiwal filmowy.',
                        'Odwiedzi festiwal filmów amatorskich lub kina niezależnego.',
                        'Opracuje projekt poznania jednego z wybranych zjawisk kina polskiego (np. kina moralnego niepokoju) zawierający np. wycieczkę, wywiad z twórcą. Podsumuje projekt na forum drużyny lub hufca.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_filmu',
                      title: 'Mistrzyni filmu',
                      level: '4',
                      tasks: [
                        'Zrealizuje krótki film, np. promujący harcerstwo.',
                        'Z dowolnego opowiadania stworzy poprawny scenariusz.',
                        'Odwiedzi festiwal filmowy i przedstawi z niego relację.',
                        'Czyta prasę poświęconą kinu.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'fotograficzne',
                sprawData: [

                  SprawData(
                      id: 'fotoamatorka',
                      title: 'Fotoamatorka',
                      level: '1',
                      tasks: [
                        'Nazwie podstawowe części aparatu fotograficznego, którym fotografuje.',
                        'Dba o sprzęt fotograficzny, potrafi przygotować go do pracy i obsłużyć:'
                            '\n- aparat analogowy – pamięta o bateriach, potrafi założyć i wyjąć film, stosuje filmy o różnej czułości w zależności od warunków, w których fotografuje, umie obsługiwać lampę błyskową,'
                            '\n- aparat cyfrowy – pamięta o bateriach i miejscu na karcie, potrafi zgrać zdjęcia do komputera, korzysta z różnych funkcji aparatu.',
                        'Przedstawi po 5 zdjęć o różnej tematyce: osoby, krajobraz, reportaż.',
                        'Prezentowane zdjęcia odznaczać się będą prawidłową kompozycją i będą dobre technicznie.',
                      ]
                  ),

                  SprawData(
                      id: 'fotograf',
                      title: 'Fotograf',
                      level: '2',
                      tasks: [
                        'Fotografuje często, wykona serię zdjęć z życia zastępu, drużyny.',
                        'Zna różne rodzaje aparatów (analogowe i cyfrowe), wykona dobre technicznie zdjęcia różnymi rodzajami aparatów, potrafi w lustrzance manualnie ustawić odpowiednio do potrzeb czas i przysłonę.',
                        'Przechowuje swoje zdjęcia w uporządkowany sposób, w albumie lub w komputerze czy na płytach, prawidłowo przechowuje negatywy.',
                        'Dostarcza zdjęcia do kroniki lub na stronę www.',
                        'Przedstawi kilka wybranych fotografii o ciekawym temacie, ładnej kompozycji i nienagannej technice.',
                      ]
                  ),

                  SprawData(
                      id: 'fotoreporterka',
                      title: 'Fotoreporterka',
                      level: '3',
                      tasks: [
                        'Fotografuje często, dokumentuje życie drużyny, swoje zdjęcia wykorzystała w przygotowaniu zbiórki lub gry dla drużyny/zastępu.',
                        'Samodzielnie wywoła czarno-biały film i sporządzi odbitki przy pomocy powiększalnika.',
                        'Wykona dobre kompozycyjnie i technicznie: portret, zdjęcie w ruchu różnymi rodzajami aparatów (cyfrowym i analogową lustrzanką), zna pojęcie głębi ostrości i potrafi je zastosować.',
                        'Doborem oświetlenia potrafi wytworzyć odpowiedni nastrój zdjęcia.',
                        'Sporządzi reportaż fotograficzny z obozu, wycieczki lub imprezy harcerskiej, przygotuje zdjęcia do umieszczenia w kronice drużyny i zamieszczenia ich na stronie www.',
                        'Potrafi dokonać podstawowej komputerowej obróbki zdjęcia.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_fotografii',
                      title: 'Mistrzyni fotografii',
                      level: '4',
                      tasks: [
                        'Fotografia jest jej pasją, wykorzystuje ją w pracy harcerskiej.',
                        'Wykona serię dobrych kompozycyjnie i technicznie zdjęć w studiu, plenerze, reportaż.',
                        'Samodzielnie wywoła film kolorowy i sporządzi odbitki na fotolabie.',
                        'Wykona reprodukcję i retusz zdjęcia (metodą dowolną).',
                        'Zaprezentowała własne zdjęcia w formie wystawy.',
                        'Zorganizuje cykl zajęć „szkółki fotograficznej”, podczas których zaprezentuje informacje o sprzęcie, możliwościach technicznych, zasadach dobrej kompozycji zdjęcia i podstawowe fakty z historii fotografii.',
                      ]
                  ),

                  SprawData(
                      id: 'operatorka_video',
                      title: 'Operatorka video',
                      level: '3',
                      tasks: [
                        'Posługując się kamerą video sporządzi trzy filmy przydatne w szkoleniu zastępowych lub drużynowych (dotyczące np. pionierki obozowej, obrzędowości innych drużyn i zastępów,'
                            'musztry, itp.). Zareklamuje i rozpowszechni film.',
                      ]
                  ),



                ]
            ),

          ]
      ),

      SprawGroupData(
          id: 'naukowe_i_techniczne',
          title: 'Naukowe i techniczne',
          familyData: [

            SprawFamilyData(
                id: 'badawcze',
                sprawData: [

                  SprawData(
                      id: 'szperacz',
                      title: 'Szperacz',
                      level: '1',
                      tasks: [
                        'W nieznanej sobie miejscowości odszuka i zlokalizuje ważniejsze obiekty: ośrodek zdrowia, straż pożarną, dworzec lub przystanek PKS, itp.',
                        'Weźmie udział w zwiadzie terenowym dotyczącym poznania historii miejscowości i życia jej mieszkańców.',
                        'Na mapie lub planie zaznaczy zabytkowy obiekt wyznaczony zadaniem, zapozna się z jego historią.',
                        'Z wycieczki leśnej przyniesie ciekawe zbiory lub trofea.',
                        'Posługuje się przewodnikiem i encyklopedią.',
                      ]
                  ),

//✽//✽ POSZUKIWACZKA

                  SprawData(
                      id: 'poszukiwaczka',
                      title: 'Poszukiwaczka',
                      level: '2',
                      tasks: [
                        'Kierując grupą zwiadowczą przeprowadzi zwiad terenowy na określony temat.',
                        'W czasie zwiadu skorzysta z książek, przewodników, przeprowadzi rozmowy z ludźmi.',
                        'Sporządzi dokładny raport ze zwiadu.',
                        'Przedstawi wyniki zwiadu na ognisku lub kominku, zilustruje opowiadanie zdjęciami, rysunkami bądź eksponatami.',
                      ]
                  ),

//✽//✽//✽ BADACZKA

                  SprawData(
                      id: 'badaczka',
                      title: 'Badaczka',
                      level: '3',
                      tasks: [
                        'Dokona podziału Polski na regiony geograficzne, przyrodnicze, historyczne i etnograficzne – charakteryzując je uzasadni podział.',
                        'Korzystając z czytelni i biblioteki sporządzi bibliografię na zadany temat. Interesuje się jedną z dziedzin wiedzy (np. astronomią, oceanologią, meteorologią, itp.), przedstawi tytuły 3 książek przeczytanych w tej dziedzinie, zaciekawi harcerki w drużynie opowiadaniem z zakresu tej wiedzy.',
                        'Przedstawi drużynie zbiory kolekcjonerskie lub zademonstruje doświadczenie.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'ksiazkowe',
                sprawData: [

                  SprawData(
                      id: 'czytelniczka',
                      title: 'Czytelniczka',
                      level: '1',
                      tasks: [
                        'Lubi czytać książki, posiada swojego ulubionego autora, przeczyta kilka jego książek.',
                        'W swoim zastępie na wycieczce lub „na dobranoc” opowie fragment mało znanej a ciekawej książki tak, że zainteresuje nią inne harcerki.',
                        'W ciągu jednego dnia obozowego życia wcieli się w postać książkową, którą według niej warto naśladować, umiejętnie ją przedstawiając w różnych sytuacjach (charakteryzacja, sposób postępowania, cytaty z jej wypowiedzi).',
                      ]
                  ),

//✽//✽ BIBLIOTEKARKA

                  SprawData(
                      id: 'bibliotekarka',
                      title: 'Bibliotekarka',
                      level: '2',
                      tasks: [
                        'Pomaga w bibliotece:'
                            '\n- porządkuje i oprawia książki,'
                            '\n- prowadzi katalog,'
                            '\n- pełni dyżury przy wypożyczaniu.',
                        'Wykona drobne naprawy kilku książek.',
                        'Zamówi książkę w księgarni wysyłkowej lub prenumeratę czasopisma.',
                        'Sporządzi plakat reklamujący książki harcerskie.',
                        'Przeprowadzi na zbiórce grę lub zabawę opracowaną na podstawie ulubionej książki.',
                      ]
                  ),

//✽//✽//✽ BIBLIOFILKA

                  SprawData(
                      id: 'bibliofilka',
                      title: 'Bibliofilka',
                      level: '3',
                      tasks: [
                        'Odwiedzi kilka dużych bibliotek i czytelni, zapozna się z organizacją ich pracy.',
                        'Posługując się katalogami zgromadzi i przeczyta kilka książek z określonej dziedziny, zdobyte wiadomości wykorzysta w czasie zajęć harcerskich.',
                        'Prowadzi biblioteczkę harcerską drużyny, uzupełnia ją cennymi propozycjami.',
                        'Kompletuje własny księgozbiór, posiada jego katalog, własny exlibris.',
                        'Zorganizuje wieczór autorski, spotkanie z książką harcerską, zbiórkę książek na upominki, itp.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'kolekcjonerskie',
                sprawData: [
                  SprawData(
                      id: 'kolekcjonerka',
                      title: 'Kolekcjonerka',
                      level: '1',
                      tasks: [
                        'Odwiedzi dwa różne muzea, opowie w zastępie o odwiedzonych wystawach.',
                        'Wie jak należy zachowywać się w muzeum i dlaczego.',
                        'Zbiera przedmioty (np. znaczki, monety, książki). Umie opowiedzieć o posiadanej kolekcji.',
                        'Wie, jakie znaczenie mają zbiory muzealne.',
                      ]
                  ),

                  SprawData(
                      id: 'kolekcjonerka_muzealnik',
                      title: 'Kolekcjonerka - muzealnik',
                      level: '2',
                      tasks: [
                        'Odwiedzi trzy różne typy muzeów (np. galerię, skansen, muzeum historyczne).',
                        'Wie, kiedy i gdzie powstało pierwsze muzeum na świecie i pierwsze w Polsce.',
                        'Zaplanuje wyjście zastępu do muzeum; sprawdzi koszty, godziny otwarcia, itp. Prawidłowo rozliczy się z powierzonych pieniędzy.',
                        'Wraz z drużyną weźmie udział w zajęciach edukacyjnych w muzeum (pokazy, lekcja lub warsztaty muzealne).',
                        'Zbiera przedmioty (np. fotografie, monety). Prawidłowo przechowuje zbiory, korzysta z pomocy w ich opracowywaniu i uzupełnianiu (katalogi, Internet, pomoc profesjonalistów).',
                        'W ciekawy sposób wyjaśni młodszym harcerkom co to jest dziedzictwo narodowe i dlaczego powinniśmy dbać o jego zachowanie.',
                      ]
                  ),

                  SprawData(
                      id: 'mlody_muzealnik',
                      title: 'Młody muzealnik',
                      level: '3',
                      tasks: [
                        'Nawiąże współpracę z wybranym muzeum, zwiedzi je, przeprowadzi rozmowy z pracownikami. Zdobyte wiadomości wykorzysta w pracy drużyny (przygotuje zbiórkę, grę, program biwaku lub obozu dotyczące poznanych zagadnień).',
                        'Zorganizuje udział drużyny w zajęciach edukacyjnych (pokazy, lekcja muzealna, warsztaty muzealne). Przygotuje młodsze harcerki do uczestnictwa w zajęciach.',
                        'Posiada własne zbiory pamiątek. Stale powiększa swoją kolekcję. Zabezpiecza zbiory, uzupełnia wiedzę na ich temat.',
                        'Przeczyta książkę związaną z wybraną dziedziną kolekcjonerstwa.',
                        'Nawiąże kontakt z innymi kolekcjonerami; wymieni doświadczenia i ew. zbierane przedmioty.',
                      ]
                  ),

                  SprawData(
                      id: 'muzealnik',
                      title: 'Muzealnik',
                      level: '4',
                      tasks: [
                        'Przygotuje wystawę muzealną (w muzeum, domu kultury lub szkole):'
                            '\n- będzie odpowiedzialna za opracowanie zbiorów (dobór eks-'
                            'ponatów, ich zabezpieczenie, itp.) oraz opracowanie ekspozycji,'
                            '\n- opracuje materiały promujące wystawę, (katalog, plakat, itp.),'
                            '\n- w pracach nad wystawą zasięgnie rady specjalisty.',
                        'Opracuje materiał informacyjno – edukacyjny dotyczący zbiorów muzealnych, kolekcji, ew. ciekawych obiektów zabytkowych znajdujących się w okolicy jej miejsca zamieszkania, który będą mogły wykorzystać drużyny z innych miast przy planowaniu wędrówek obozowych czy zimowisk (wskazana forma elektroniczna np. na CD, www albo artykuł w prasie harcerskiej).',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'archiwistyczne',
                sprawData: [
                  SprawData(
                      id: 'mala_archiwistka',
                      title: 'Mała archiwistka',
                      level: '1',
                      tasks: [
                        'Zbiera dokumenty z życia zastępu, drużyny.',
                        'Utrzymuje je w porządku.',
                        'Umie wykorzystać zebrane materiały na zbiórce zastępu.',
                        'Wie, gdzie w jej okolicy znajduje się archiwum (państwowe, kościelne, itp.).',
                        'Wie, do czego przydają się materiały archiwalne.',
                      ]
                  ),

                  SprawData(
                      id: 'mloda_archiwistka',
                      title: 'Młoda archiwistka',
                      level: '2',
                      tasks: [
                        'Zbiera dokumenty, rozkazy, pamiątki związane z życiem drużyny.',
                        'Zabezpiecza zbiory przed wilgocią, szkodnikami i kurzem.',
                        'Umiejętnie korzysta ze zbiorów. Opracuje system ich porządkowania.',
                        'Wykorzysta zebrane materiały do przygotowania zbiórki drużyny, opracowania artykułu, mini-wystawy, itp.',
                        'Umie wyjaśnić, czym zajmują się archiwiści.',
                      ]
                  ),

                  SprawData(
                      id: 'archiwistka',
                      title: 'Archiwistka',
                      level: '3',
                      tasks: [
                        'Prowadzi archiwum rodzinne lub archiwum drużyny.',
                        'Materiały utrzymuje w porządku. Pracuje nad ich opracowaniem.',
                        'Przeczyta książkę o tematyce archiwalnej.',
                        'Odwiedzi archiwum, w którym skorzysta ze zbiorów by wzbogacić swoją wiedzę dotyczącą własnych zbiorów.',
                      ]
                  ),

                  SprawData(
                      id: 'archiwistka_doskonala',
                      title: 'Archiwistka doskonała',
                      level: '4',
                      tasks: [
                        'Opracowuje archiwum hufca lub chorągwi.',
                        'Prowadzi je zgodnie z zasadami archiwalnymi (wg instrukcji kancelaryjnej i archiwalnej).',
                        'Stale podnosi swoje umiejętności w dziedzinie pracy archiwalnej.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'reporterskie',
                sprawData: [
                  SprawData(
                      id: 'mloda_reporterka',
                      title: 'Młoda reporterka',
                      level: '1',
                      tasks: [
                        'Na ognisku drużyny rzeczowo i ciekawie zda relację z wycieczki lub zwiadu zastępu.',
                        'Posłuży się magnetofonem, przedstawi dokonane przez siebie nagranie.',
                        'Zamieści w kronice lub gazetce reportaż dotyczący wydarzenia z życia drużyny lub zastępu.',
                        'Zilustruje rysunkami lub zdjęciami reportaż w kronice (gazetce).',
                      ]
                  ),

                  SprawData(
                      id: 'reporterka',
                      title: 'Reporterka',
                      level: '2',
                      tasks: [
                        'Przeprowadzi wywiad na zadany temat opracowując go pisemnie (np. gazetka).',
                        'Przygotuje kilka artykułów do gazetki drużyny/środowiska/obozowej lub będzie redagowała jej wybrany dział (min. 6 numerów).',
                        'Opracuje w ciekawej formie wyniki podejmowanych zwiadów, wykorzysta je w pracy z młodszymi harcerkami.',
                        'W pracy redaktorskiej posługuje się magnetofonem (dyktafonem), komputerem; wie jak odnaleść interesujące ją informacje w Internecie.',
                      ]
                  ),

                  SprawData(
                      id: 'dziennikarka',
                      title: 'Dziennikarka',
                      level: '3',
                      tasks: [
                        'Będzie redagować przez 6 miesięcy lub w trakcie obozu gazetkę harcerską (min. 6 numerów).',
                        'Prześle 5 swoich artykułów do redakcji pisma harcerskiego.',
                        'Zapozna się z zasadami sporządzania notatki prasowej. Sporządzi notatkę z przebiegu istotnego dla środowiska wydarzenia (np. imprezy, zbiórki hufca, rajdu, obozu) – postara się o jej umieszczenie w gazetce szkolnej, parafialnej, w prasie lokalnej.',
                        'Posłuży się Internetem podczas przygotowywania materiałów dziennikarskich. Obsłuży kserokopiarkę, faks.',
                        'Opracuje bibliografię na zadany temat.',
                      ]
                  ),

                  SprawData(
                      id: 'redaktorka',
                      title: 'Redaktorka',
                      level: '4',
                      tasks: [
                        'Weźmie udział w pracach redakcji pisma harcerskiego (lokalnego lub ogólnopolskiego) przez okres pół roku (co najmniej 6 numerów):'
                            '\n- będzie zbierać materiały z danej'
                            'dziedziny i opracowywać je w formie artykułów,'
                            '\n- będzie publikować w nim swoje artykuły,'
                            '\n- wykorzysta zdjęcia i rysunki własne oraz przekazane przez innych,'
                            '\n- zapozna się z techniką składania i druku pisma,'
                            '\n- weźmie udział w kolportażu.',
                        'Przekaże do prasy lokalnej artykuł propagujący ideę harcerską.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'folklor',
                sprawData: [
                  SprawData(
                      id: 'krajka',
                      title: 'Krajka',
                      level: '1',
                      tasks: [
                        'Wraz z zastępem weźmie udział w zwiadzie etnograficznym, porozmawia z mieszkańcami o historii miejscowości i życiu w tej miejscowości.',
                        'W czasie zwiadu dokona obserwacji stylu budownictwa, elementów sztuki ludowej, języka mieszkańców (powiedzenia gwarowe, akcent, itp.).',
                        'Na ognisku drużyny zaprezentuje swoje spostrzeżenia, przedstawi notatki, szkice oraz co najmniej jeden przedmiot – wyrób rzemiosła ludowego z danej okolicy.',
                      ]
                  ),

                  SprawData(
                      id: 'folklorystka',
                      title: 'Folklorystka',
                      level: '2',
                      tasks: [
                        'Weźmie udział w zwiadzie etnograficznym, co najmniej w 3 różnych regionach Polski.',
                        'Zwiedzi z zastępem muzeum regionalne lub skansen okolic własnego miejsca zamieszkania.',
                        'Zna co najmniej jeden taniec i kilka przyśpiewek lub piosenek z własnego regionu.',
                        'Uczęszcza na występy zespołów ludowych i wystawy sztuki ludowej, festyny folklorystyczne lub warsztaty rękodzieła ludowego; zdobytą tam wiedzę wykorzystuje do prowadzenia zajęć w zastępie (nauka tańców i piosenek, malowanie pisanek, wycinanki, hafty, itp.).',
                      ]
                  ),

                  SprawData(
                      id: 'folklorystka_doskonala',
                      title: 'Folklorystka doskonała',
                      level: '3',
                      tasks: [
                        'Zorganizuje wystawę lub warsztaty dotyczące kultury, historii, sztuki wybranego regionu etnograficznego. W ramach przygotowań nawiąże i wykorzysta kontakt z ludźmi związanymi z tym regionem.',
                        'Przygotuje folder z trasami turystycznymi i wybrane elementy programu (zajęcia regionalne) na użytek obozu zorganizowanego na terenie wybranego regionu.',
                        'Będzie przewodnikiem po wybranym regionie w czasie wycieczki lub wędrówki.',
                      ]
                  ),

                  SprawData(
                      id: 'etnografka',
                      title: 'Etnografka',
                      level: '3',
                      tasks: [
                        'Przygotuje dla młodszych harcerek prezentację/folder, itp. pokazujący podział Polski na regiony etnograficzne z ich charakterystyką (budownictwo, stroje, język, zwyczaje, itp.), który będzie można wykorzystać w pracy drużyny.',
                        'Na wycieczce drużyny lub zastępu pełnić będzie rolę przewodnika po zabytkach kultury ludowej danego regionu.',
                        'Gromadzi zbiory etnograficzne z okolic, w których przebywała (części strojów, narzędzia, elementy zdobnictwa ludowego, itp.) lub dokumentację fotograficzną i fonograficzną zabudowy, zwyczajów i życia mieszkańców. Stara się powiększać swoje zbiory, podejmie próbę publikacji zdjęć.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'astronomiczne',
                sprawData: [
                  SprawData(
                      id: 'gwiazda_polarna',
                      title: 'Gwiazda polarna',
                      level: '1',
                      tasks: [
                        'Orientuje się w stronach świata wg Księżyca, Słońca, gwiazd (odnajdzie Gwiazdę Polarną, zna fazy Księżyca i ich związek ze stronami świata, stosuje metodę „Słońca i zegarka”).',
                        'Zbuduje zegar słoneczny.',
                        'Wskaże na niebie 4 gwiazdozbiory.',
                        'Wytłumaczy istnienie dnia i nocy, pór roku.',
                      ]
                  ),

                  SprawData(
                      id: 'obserwatorka_nieba',
                      title: 'Obserwatorka nieba',
                      level: '2',
                      tasks: [
                        'Wie, co to jest Układ Słoneczny, przedstawi ciekawie każdą z planet opowiadając o jej wyglądzie i warunkach na niej panujących.',
                        'Zapozna się z podstawową wiedzą o Księżycu, w czasie obozu lub w ciągu roku podejmie obserwację faz księżyca i związanych z tym zmian pogody.',
                        'Nauczy się posługiwania obrotową mapą nieba. Z jej pomocą wyznaczy układ gwiazd o różnych porach nocy, zimą i latem, wyznaczy kierunki świata.',
                        'Nauczy młodsze harcerki wyznaczania kierunków świata wg Księżyca, Słońca i gwiazd.',
                      ]
                  ),

//✽//✽//✽ ASTRONOM

                  SprawData(
                      id: 'atronom',
                      title: 'Astronom',
                      level: '3',
                      tasks: [
                        'Nazywa widoczne na polskim niebie gwiazdozbiory i planety, opowie o nich innym harcerkom, zna kilka mitologicznych opowiadań związanych z ich nazwami.',
                        'Systematycznie obserwuje niebo przez przyrząd optyczny, zaprosi do obserwacji młodsze harcerki.',
                        'Przedstawi zainteresowanym harcerkom w przystępnej formie współczesną wiedzę na temat powstania wszechświata.',
                        'Zorganizuje dla drużyny wycieczkę do planetarium/obserwatorium lub przedstawi prasę, literaturę popularno-naukową oraz www popularyzujące badania astronomiczne.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'geologiczne',
                sprawData: [
                  SprawData(
                      id: 'skalka',
                      title: 'Skałka',
                      level: '1',
                      tasks: [
                        'Zwiedzi kamieniołom lub żwirownię, znajdzie skamieliny z odciskami roślin lub zwierząt.',
                        'Przeczyta książkę o prehistorii Ziemi.',
                        'Znajdzie okazy kamieni rześbione przez wodę, lodowiec, atmosferę.',
                        'Korzystając z dołów kopalnych na obozie lub robiąc własną odkrywkę do głębokości 1,30 m pobierze próbki gruntu z trzech poziomów i wytłumaczy zmiany jego barwy i struktury.',
                      ]
                  ),

//✽//✽ GEOLOG

                  SprawData(
                      id: 'geolog',
                      title: 'Geolog',
                      level: '2',
                      tasks: [
                        'Pozna w czasie podróży i wycieczek podstawowe typy krajobrazu Polski: wysokogórski, górski, wyżynny, nizinny, krajobraz pojezierzy i nadmorski; scharakteryzuje każdy z nich i powie, w jaki sposób był kształtowany.',
                        'Odwiedzi teren wydmowy (nadmorski lub sandrowy), obejrzy meandry rzeczne i pradolinę rzeki.',
                        'Zwiedzi jaskinię, wie, jaki proces ją kształtował, potrafi nazwać podstawowe formy naciekowe.',
                        'Rozróżnia kilka rodzajów skał i podstawowe materiały, posiada zbiór kamieni, który zaprezentuje innym harcerkom.',
                      ]
                  ),

//✽//✽//✽ BADACZKA DZIEJÓW ZIEMI

                  SprawData(
                      id: 'badaczka_dziejow_ziemi',
                      title: 'Badaczka dziejów ziemi',
                      level: '1',
                      tasks: [
                        'Przeczyta 10 artykułów lub fragmentów książek przedstawiających opis wulkanów lub trzęsień ziemi, podzieli się ciekawostkami z innymi harcerkami. Zwiedzi kopalnię czynną lub wyeksploatowaną, przyniesie z niej ciekawe eksponaty.',
                        'Sporządzi wystawę geologiczną, gdzie przy poszczególnych erach i okresach historii Ziemi znajdą się odpowiednie skały, skamieliny i rysunki obrazujące krajobraz i formy życia.',
                        'Zorganizuje dla harcerek grę, w której wędrować będą przez dzieje Ziemi.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'chemiczne',
                sprawData: [
                  SprawData(
                      id: 'alchemiczka',
                      title: 'Alchemiczka',
                      level: '1',
                      tasks: [
                        'Napisze list atramentem sympatycznym i wywoła jego treść.',
                        'Ozdobi materiał monogramem uzyskanym drogą chemiczną (chusteczkę, część ubrania, itp.).',
                        'Uzyska ładne, duże kryształy z przesyconego roztworu.',
                        'Wymieni kilka związków chemicznych, które są truciznami oraz kilka szkodliwie działających na skórę.',
                      ]
                  ),

//✽//✽ LABORANTKA

                  SprawData(
                      id: 'laborantka',
                      title: 'Laborantka',
                      level: '2',
                      tasks: [
                        'Posiada podstawowe przybory do doświadczeń chemicznych (kolby, menzurki, itp.).',
                        'Sporządzi samodzielnie barwniki w 3 kolorach.',
                        'Stosując odpowiednie odczynniki chemiczne uzyska płomień w 4 różnych barwach.',
                        'Potrafi ugotować jajko bez rozpalania ognia.',
                        'Zademonstruje przed zastępem ciekawe doświadczenie z grupy „chemicznych czarów” (np. zmieni barwę kwiatów w wazonie, stworzy podwodny ogród chemiczny, itp.).',
                      ]
                  ),

//✽//✽//✽ CHEMICZKA

                  SprawData(
                      id: 'chemiczka',
                      title: 'Chemiczka',
                      level: '3',
                      tasks: [
                        'Posiada własne małe laboratorium chemiczne, w którym często demonstruje innym ciekawe doświadczenia.',
                        'Wyprodukuje sztuczne ognie na choinkę.',
                        'Sporządzi proch dymny lub bawełnę strzelniczą. Wykona drobną pracę grawerską (np. utrwali w metalu swój monogram).',
                        'Przygotuje harcerski wieczór sztuk iluzjonistycznych lub wróżb andrzejkowych, w którym zaprezentuje swoje doświadczenia.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'matematyczne',
                sprawData: [
                  SprawData(
                      id: 'potega',
                      title: 'Potęga',
                      level: '1',
                      tasks: [
                        'Zręcznie układając pytania pokona 3 przeciwników w grze w 10 pytań.',
                        'Zna i przedstawi innym 5 zagadek matematycznych.',
                        'Ułoży rebus szyfrując hasło obozu, wycieczki czy temat zbiórki.',
                        'Pomnoży w pamięci liczbę jednocyfrową przez dwucyfrową w czasie krótszym niż 30 sek.',
                      ]
                  ),

//✽//✽ MATEMATYCZKA

                  SprawData(
                      id: 'matematyczka',
                      title: 'Matematyczka',
                      level: '2',
                      tasks: [
                        'Poda zasadę odszukiwania drogi w labiryncie przy zabłądzeniu oraz zasadę pozwalającą zwiedzić wszystkie korytarze labiryntu.',
                        'Opowie o tajemnicach piramid egipskich.',
                        'Zna 15 zagadek matematycznych, wykorzysta je w przygotowaniu gry dla zastępu.',
                        'Ułoży krzyżówkę sprawdzającą wiadomości harcerskie kandydatek na stopień ochotniczki.',
                        'Pomnoży w pamięci 2 liczby dwucyfrowe przez siebie w czasie krótszym niż l minuta.',
                      ]
                  ),

//✽//✽//✽ ALFA & OMEGA

                  SprawData(
                      id: 'alfa_i_omega',
                      title: 'Alfa i omega',
                      level: '3',
                      tasks: [
                        'Zna kilka kwadratów magicznych.',
                        'Sporządzi ciekawy algorytm przydatny w szkoleniu harcerskim (np. postępowanie w przypadku spo-'
                            'strzeżenia wypadku samochodowego, itp.).',
                        'Opowie o osiągnięciach różnych kultur w zakresie wiedzy matematycznej.',
                        'Przygotuje „Turniej Łamania Głowy” dla zastępów dobierając zagadki odpowiednie do wieku uczestników.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'informatyczne',
                sprawData: [
                  SprawData(
                      id: 'mala_informatyk',
                      title: 'Mała informatyk',
                      level: '1',
                      tasks: [
                        'Umie połączyć elementy komputera, peryferia i akcesoria (monitor, klawiatura, myszka, drukarka, słuchawki, itp.).',
                        'Umie posługiwać się komputerem: napisać prosty tekst w edytorze, przegrać go na wymienny nośnik (dyskietka, CD, itp.), wydrukować.',
                        'Potrafi uruchomić znajomy program, wykorzystuje różne jego możliwości.',
                        'Potrafi używać przeglądarkę internetową, zna kilka przydatnych dla harcerek stron www. Umie wysłać e-mail z załącznikiem (np. dokumentem tekstowym z pkt. 2).',
                      ]
                  ),

                  SprawData(
                      id: 'znawczyni_komputera',
                      title: 'Znawczyni komputera',
                      level: '2',
                      tasks: [
                        'Umie posługiwać się pakietem biurowym (typu Office): edytor tekstu, arkusz kalkulacyjny, prezentacje (np. prezentacja drużyny, środowiska).',
                        'Samodzielnie ułoży, połamie i wydrukuje publikację (śpiewnik, gazetkę, regulaminy, itp.). Zastosuje różne kroje pisma, układy stron (format, nagłówki, marginesy, itp.), tabelki.',
                        'Umie przygotować i wydrukować lub zamieścić w Internecie śpiewnik, gazetkę czy inną potrzebną publikację.',
                        'Posługuje się e-mailem, komunikatorem internetowym (gg, ICQ, Jabber, itp.), umie przeprowadzić rozmowę głosową przy użyciu komputera (VoIP).',
                        'Potrafi zabezpieczyć komputer przed wirusami i włamaniem.',
                        'Zna podstawowe podzespoły komputera. Umie zdiagnozować ich awarie (dysk, pamięć), w razie potrzeby wymienić na nowe.',
                      ]
                  ),

                  SprawData(
                      id: 'informatyczka',
                      title: 'Informatyczka',
                      level: '3',
                      tasks: [
                        'Regularnie czyta czasopismo lub przegląda serwis z branży informatycznej. Potrafi powiedzieć, co nowego się dzieje w branży.',
                        'Stworzy rozwiązania informatyczne przydatne w pracy drużyny (np. szablon do dokumentacji finansowej, system ewidencjonowania składek, itd.).',
                        'Używała przynajmniej 2 różnych, ogólnodostępnych systemów operacyjnych (np. Windows, Linux, MacOS (X), Unix, itp.), potrafi porównać je, wykazując zalety i wady każdego. W wybranym systemie: umie skonfigurować komputer do pracy w sieci lokalnej.',
                        'Orientuje się w historii powstania komputerów, sieci Internet. Zna podstawowe pojęcia i urządzenia sieciowe (np. adres IP, router, hub/switch). Potrafi skonfigurować komputery w sieci lokalnej i podłączyć je do Internetu (przez modem, DSL czy innego typu łącze).',
                        'Znajdzie program przydatny do pracy w drużynie i zastępie, pozna jego budowę.',
                        'Zna problem piractwa oprogramowania i własności intelektualnych. Potrafi zaproponować i przekonać do alternatywnych, darmowych rozwiązań w miejsce nielegalnych programów.',
                      ]
                  ),

                  SprawData(
                      id: 'poczatkujaca_programistka',
                      title: 'Początkująca programistka',
                      level: '3',
                      tasks: [
                        'Zna dowolny język programowania (np. C++).',
                        'Stworzy aplikację działającą przez www.',
                        'Na bieżąco śledzi branżę programowania, zna aktualne trendy i techniki programowania.',
                        'Wie, jakie są konsekwencje i niebezpieczeństwa wynikające ze złego korzystania z komputera i sieci Internet oraz jego ogromne zalety i możliwości.',
                        'Znajdzie zestaw gier i programów edukacyjnych przydatnych i pożytecznych, uczących dzieci – zachęci do używania osoby ze swojego środowiska harcerskiego.',
                        'Pozna wpływ komputera i monitora na zdrowie człowieka, swoją wiedzą podzieli się z innymi w ciekawej formie.',
                      ]
                  ),

                  SprawData(
                      id: 'programistka',
                      title: 'Programistka',
                      level: '4',
                      tasks: [
                        'Pozna w stopniu zaawansowanym wybrany język programowania (np. C++, Java, PHP).',
                        'Zaprojektuje i uruchomi program (aplikację www) przydatny w pracy drużyny lub grę, program edukacyjny.',
                        'Zna popularne serwisy z oprogramowaniem open source. Umie wykorzystać dostępne śródła programów do budowy własnych rozwiązań.',
                        'Umie podzielić się pracą nad programem (aplikacją www) w 2-3-osobowym zespole. Potrafi napisać specyfikację nowego programu, oszacować czas. Orientuje się, do czego służą bazy błędów, archiwa wersji (np. CVS).',
                        'Zadba o łatwość obsługi, profesjonalny wygląd i rozpowszechnianie programu w środowisku.',
                        'Zorganizuje i przeprowadzi kurs komputerowy w swoim środowisku.',
                        'Zna podstawy tworzenia i obsługi bazy danych, formatów wymiany danych typu XML.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'graficzne',
                sprawData: [
                  SprawData(
                      id: 'grafik',
                      title: 'Grafik',
                      level: '1',
                      tasks: [
                        'Stworzy przyjemną dla oka i funkcjonalną szatę graficzną do dowolnej strony www (np. drużyny), zastosuje różne techniki i możliwości.',
                        'Zna przynajmniej 2 programy do'
                            'tworzenia i doskonalenia grafiki – potrafi je obsługiwać, opowiedzieć o ich działaniu.',
                        'Przeczyta książkę/poradnik o jednym z programów graficznych/grafice komputerowej.',
                        'Zna podstawy grafiki 2D, ogólnie orientuje się w temacie grafiki 3D.',
                        'Zaprojektuje logo zastępu, drużyny, harcerskiej akcji.',
                      ]
                  ),

                  SprawData(
                      id: 'znawczyni_grafiki_komputerowej',
                      title: 'Znawczyni grafiki komputerowej',
                      level: '2',
                      tasks: [
                        'Zaprojektuje logo/plakietkę w formacie wektorowym.',
                        'Potrafi wykonać prosty retusz grafiki bądź zdjęcia.',
                        'Stworzy proste dynamiczne elementy graficzne, np. do strony www.',
                        'Zabezpieczy swoje grafiki przed kradzieżą w Internecie (np. wykona „znak wodny”).',
                        'Zna podstawy kompozycji barw.',
                      ]
                  ),

                  SprawData(
                      id: 'grafik_doskonaly',
                      title: 'Grafik doskonały',
                      level: '3',
                      tasks: [
                        'Potrafi wykonać atrakcyjną grafikę dynamiczną w różnych formatach (.gif; .fla).',
                        'Tworzy własne narzędzia graficzne (np. „pędzle”, filtry, czcionki).',
                        'Zapozna się z prawem autorskim dotyczącym grafiki.',
                        'Potrafi połączyć grafikę z programami komputerowymi.',
                        'Zna zasady działania tabletu.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'webmasterskie',
                sprawData: [
                  SprawData(
                      id: 'opiekunka_strony',
                      title: 'Opiekunka strony',
                      level: '1',
                      tasks: [
                        'Przez 3 miesiące będzie webmasterką harcerskiej strony www (strona będzie często aktualizowana, będzie widoczne życie strony, zmiany i ulepszenia).',
                        'Sprawnie posługuje się programami do tworzenia stron www. Umie przygotować poprawną (w sensie kodu HTML, kodowania znaków narodowych) stronę www.',
                        'Zna podstawowe elementy języka HTML. Potrafi przygotować prostą stronę www, posługując się tylko najprostszym edytorem tekstu.',
                      ]
                  ),

                  SprawData(
                      id: 'webmasterka',
                      title: 'Webmasterka',
                      level: '2',
                      tasks: [
                        'Przez okres, co najmniej 3 miesięcy opiekuje się potrzebnym serwisem harcerskim, mającym zasięg działania na poziomie hufca lub wyżej. Użytkownicy są zadowoleni z aktualności, łatwości w nawigacji, itp.',
                        'Zna podstawy grafiki komputerowej (potrafi stworzyć prostą szatę graficzną do strony www).',
                        'Wykorzystuje elementy różnych języków i technik programowania serwisów www (np. szablony, DHTML, PHP, Java Script, CSS, itd.)'
                            'Potrafi w sposób czytelny prezentować treść strony. Stronę taką można łatwo skalować, wydrukować, zapisać. Strona poprawnie działa w różnych przeglądarkach.',
                        'Korzysta z programów/narzędzi typu open source (szablony, zegary, itd.). Koduje strony możliwie zgodnie z obowiązującymi standardami (W3C).',
                        'Dla uatrakcyjnienia możliwości serwisu, umie wykorzystać na stronie ogólnodostępne, darmowe usługi lub zainstalować darmowe skrypty.',
                      ]
                  ),

                  SprawData(
                      id: 'webmasterka_programistka',
                      title: 'Webmasterka - programistka',
                      level: '3',
                      tasks: [
                        'Zbuduje potrzebny serwis-portal internetowy, wykorzystując dostępne oprogramowanie typu CMS. Serwis ma służyć do sprawnej komunikacji grupy osób i/lub promocji wydarzenia harcerskiego, np. zlotu, złazu, dużego rajdu (na poziomie chorągwi lub wyżej).',
                        'Potrafi zabezpieczyć stronę przed włamaniem.',
                        'Potrafi, w łatwy sposób, zarządzać szatą graficzną w całym serwisie www.',
                        'Zaangażuje kilka osób we współredagowanie swojego portalu. Dostarczy im narzędzi/możliwości, aby mogły one bezpośrednio publikować swoje informacje w portalu.',
                      ]
                  ),

                  SprawData(
                      id: 'webmasterka_doskonala',
                      title: 'Webmasterka doskonała',
                      level: '4',
                      tasks: [
                        'Zbuduje/rozbuduje i poprowadzi potrzebny w harcerstwie ogólnopolski serwis internetowy wykorzystując bazy danych, pisząc własne skrypty i wykorzystując różne techniki do budowy i zarządzania dużym serwisem www.',
                        'Informacje w takim serwisie www są możliwe do znalezienia przy pomocy popularnych wyszukiwarek internetowych.',
                        'Zorganizuje warsztaty – szkolenie dla webmasterek. Wyszkoli następczynię, która będzie umiała poprowadzić dalej taki serwis.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'internetowe',
                sprawData: [
                  SprawData(
                      id: 'internetowa_podrozniczka',
                      title: 'Internetowa podróżniczka',
                      level: '1',
                      tasks: [
                        'Zna podstawowe pojęcia używane w języku internautów: www, domena, chat, portal, linux, serwer, itd.',
                        'Umie założyć konto e-mail na dowolnym serwisie internetowym.',
                        'Umie korzystać z wyszukiwarki internetowej'
                            'Przedstawi swoją opinię na temat stron ZHR, zaprezentuje wartościowe strony innym, by oni też wiedzieli, gdzie zaglądać.',
                      ]
                  ),

                  SprawData(
                      id: 'internautka',
                      title: 'Internautka',
                      level: '2',
                      tasks: [
                        'Wykaże się znajomością programów do obsługi Internetu.',
                        'Umie korzystać z przesyłania FTP.',
                        'Tworzy swoją stronę www.',
                        'Zabezpieczy komputer przed atakiem wirusów, trojanów, robaków internetowych.',
                        'Potrafi wykorzystać w harcerstwie czaty, komunikatory internetowe, np. zorganizować spotkanie-wywiad z kimś ciekawym na czacie czy konferencję za pośrednictwem komunikatora.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'jezykowe',
                sprawData: [
                  SprawData(
                      id: 'poliglotka',
                      title: 'Poliglotka',
                      level: '1',
                      tasks: [
                        'Nauczy się podstawowych zwrotów grzecznościowych w językach: angielskim, francuskim, niemieckim, rosyjskim, hiszpańskim.',
                        'W wybranym przez siebie języku obcym nauczy się podstawowego słownictwa związanego z harcerstwem (co najmniej 20 słówek).',
                        'Uczy się systematycznie wybranego języka obcego.',
                        'Poprowadzi pląs w języku obcym.',
                      ]
                  ),

                  SprawData(
                      id: 'tlumaczka',
                      title: 'Tłumaczka',
                      level: '3',
                      tasks: [
                        'Opanuje wybrany język obcy w stopniu wystarczającym do porozumienia się w sprawach związanych z życiem codziennym, stale pogłębia znajomość wybranego języka.',
                        'Przeczyta książkę w języku obcym i zaprezentuje jej treść w trakcie zajęć harcerskich.',
                        'Nawiąże kontakt korespondencyjny ze skautami z innego kraju.',
                        'Przetłumaczy przy pomocy słownika artykuł o charakterze specjalistycznym (techniczny, naukowy, z prasy skautowej) przydatny do zajęć harcerskich.',
                        'Wywiąże się z roli tłumacza „na żywo”.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'medialne',
                sprawData: [
                  SprawData(
                      id: 'specjalistka_public_relation',
                      title: 'Specjalistka public relation',
                      level: '3',
                      tasks: [
                        'Zaprojektuje kampanię mającą na celu poprawienie wizerunku harcerstwa w społeczności lokalnej.',
                        'Zaprojektuje gadżet promocyjny, skalkuluje koszty jego wykonania.',
                        'Włączy się w program promujący własną szkołę, dzielnicę, gminę.',
                        'Zapozna się z badaniami na temat tego jak reklama wpływa na zachowania konsumenckie. Swoją wiedzą podzieli się w ciekawy sposób z drużyną.',
                      ]
                  ),

                  SprawData(
                      id: 'znawczyni_multimediow',
                      title: 'Znawczyni multimediów',
                      level: '3',
                      tasks: [
                        'Wykona prezentację multimedialną pomocną w pracy harcerskiej.',
                        'Wykorzysta nowoczesne media do promowania harcerstwa w swoim otoczeniu (np. przy organizacji akcji naborowej).',
                        'Wie jakie zagrożenia niosą ze sobą mass media. Swoją wiedzę wykorzysta by ograniczać ich negatywny wpływ.',
                        'Umie wyretuszować zdjęcia za pomocą programu komputerowego.',
                        'Wskaże wady i zalety korzystania z Internetu.',
                      ]
                  ),

                  SprawData(
                      id: 'rzeczniczka_harcerstwa',
                      title: 'Rzeczniczka harcerstwa',
                      level: '4',
                      tasks: [
                        'Przeczyta trzy pozycje książkowe dotyczące przekazywania informacji.',
                        'Pozna specyfikę strony internetowej ZHR, śledzi na bieżąco informacje dotyczące ZHR.',
                        'Napisze artykuł do lokalnej gazety o przebiegu dowolnego przedsięwzięcia hufca, chorągwi.',
                        'Zaprosi lokalnych dziennikarzy i zaopiekuje się nimi podczas imprezy.',
                        'Ukończy warsztaty dziennikarskie. Uczestniczy w pracach zespołu promocji i informacji w hufcu lub chorągwi'
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_multimediow',
                      title: 'Mistrzyni multimediów',
                      level: '4',
                      tasks: [
                        'Profesjonalnie posługuje się wybranym sprzętem multimedialnym. Swoje umiejętności wykorzystuje w pracy harcerskiej.',
                        'Zorganizuje kurs związany z wybraną dziedziną multimediów (np. kurs tworzenia stron internetowych, obróbki obrazów cyfrowych, itd.).',
                        'Poprowadzi dyskusję o piractwie w Internecie lub wpływie Internetu na kulturę polską.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'sienkiewiczowskie',
                sprawData: [
                  SprawData(
                      id: 'tropicielka_sienkiewiczowska',
                      title: 'Tropicielka sienkiewiczowska',
                      level: '1',
                      tasks: [
                        'Przeczyta wybraną powieść Henryka Sienkiewicza.',
                        'Wskaże na mapie najważniejsze miejsca, w których toczy się akcja powieści.',
                        'Zna okoliczności historyczne, w jakich umieszczona została akcja powieści, dowie się o nich ze śródeł innych niż książka.',
                        'Zna najważniejsze fakty z życia Henryka Sienkiewicza. W ciekawej formie zapozna z nimi zastęp.',
                      ]
                  ),

                  SprawData(
                      id: 'szperaczka_sienkiewiczowska',
                      title: 'Szperaczka sienkiewiczowska',
                      level: '2',
                      tasks: [
                        'Przeczyta Trylogię Henryka Sienkiewicza.',
                        'Zaznaczy na mapie drogę jaką przebył (do wyboru):'
                            '\n- Jan Skrzetuski z Łubni do Kudaku, gdzie został uwięziony, a następnie wracając do Łubni („Ogniem i mieczem”),'
                            '\n- Andrzej Kmicic z Kiejdan do Lwowa („Potop”),'
                            '\n- Michał Wołodyjowski z Częstochowy do Kamieńca Podolskiego („Pan Wołodyjowski”).',
                        'Zwiedzi jedno z miejsc, które opisane zostało w Trylogii.',
                        'Wykona album poświęcony Henrykowi Sienkiewiczowi zawierający szkice, rysunki, zdjęcia, kserokopie dokumentów, itp.',
                        'Przygotuje dla zastępu projekcję jednej z ekranizacji powieści Sienkiewicza, poprzedzi pokaz krótką prelekcją, która wprowadzi uczestników w świat powieści.',
                      ]
                  ),

                  SprawData(
                      id: 'milosniczka_sienkiewiczowska',
                      title: 'Miłośniczka sienkiewiczowska',
                      level: '1',
                      tasks: [
                        'Przeczyta Trylogię, „Quo Vadis”, oraz trzy wybrane nowele Henryka Sienkiewicza.',
                        'Zna przyczyny powstania wielu powieści sienkiewiczowskich, umiejscowi je w epoce literackiej i środowisku politycznym tamtych czasów.',
                        'Przeprowadzi grę dla drużyny, opartą na jednej z przeczytanych powieści lub nowel.',
                        'Odwiedzi miejsce, w którym żył Henryk Sienkiewicz.',
                        'Sprawności sienkiewiczowskie można traktować jako wzorzec do stworzenia sprawności dotyczących życia i twórczości innych wielkich pisarzy.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'x',
                sprawData: [

                ]
            ),
          ]
      ),

      SprawGroupData(
          id: 'sportowe',
          title: 'Sportowe',
          familyData: [

            SprawFamilyData(
                id: 'linowe',
                sprawData: [
                  SprawData(
                      id: 'zwinka',
                      title: 'Zwinka',
                      level: '1',
                      tasks: [
                        'Wspina się po linie na wysokość 3 m.',
                        'Przechodzi po linach poziomych nad przeszkodą wodną.',
                        'Sprawnie wchodzi na drzewa.',
                        'Prawidłowo podciąga się na drążku, sprawnie przechodzi po równoważni.',
                        'Zręcznym przeskokiem pokonuje płoty i ogrodzenia siatkowe.',
                        'Zna 4 węzły.',
                      ]
                  ),

                  SprawData(
                      id: 'linoskoczka',
                      title: 'Linoskoczka',
                      level: '2',
                      tasks: [
                        'Mocuje linę na drzewie różnymi sposobami.',
                        'Zna 10 węzłów, stosuje je prawidłowo w zależności od potrzeby.',
                        'Potrafi skonstruować drabinę sznurową i posłuży się nią z wprawą.',
                        'Zbuduje z zastępem most sznurowy.',
                        'Chodzi na szczudłach.',
                        'Uprawia jedną z dziedzin sportu.',
                      ]
                  ),

                  SprawData(
                      id: 'alpinistka',
                      title: 'Alpinistka',
                      level: '3',
                      tasks: [
                        'Zjeżdża po linie w kluczu zjazdowym.',
                        'Wspina się po linie metodą prusikowania.',
                        'Zna zasady asekuracji własnej, prawidłowo asekuruje inne osoby.',
                        'Sprawnie wspina się po murach i skałkach, wykorzystuje zasadę 3 punktów podparcia.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'plywackie',
                sprawData: [

                  SprawData(
                      id: 'juz_plywam',
                      title: 'Już pływam',
                      level: '1',
                      tasks: [
                        'Przepłynie stylem dowolnym 50 m na basenie krytym lub 25 m w innym akwenie.',
                        'Utrzyma się na wodzie 10 minut.',
                        'Wskoczy do wody z wysokości 0,5 m.',
                        'Przepłynie 5 m pod wodą.',
                        'Weźmie udział w 5 zabawach organizowanych płytkiej wodzie.	na'
                      ]
                  ),

                  SprawData(
                      id: 'plywaczka',
                      title: 'Pływaczka',
                      level: '2',
                      tasks: [
                        'Przepłynie 200 m stylem klasycznym lub kraulem na piersiach.',
                        'Opanuje styl grzbietowy.',
                        'Wyjmie z wody przedmiot wielkości menażki z głębokości 2 m.',
                        'Wyjdzie z wody na łódś.',
                        'Posłuży się kołem ratunkowym i kamizelką ratunkową.',
                        'Zorganizuje i poprowadzi zabawę na wodzie lub zawody pływackie dla zastępu.',
                      ]
                  ),

                  SprawData(
                      id: 'plywaczka_doskonala',
                      title: 'Pływaczka doskonała',
                      level: '3',
                      tasks: [
                        'Przepłynie 500 m w wodzie stojącej lub 100 m pod prąd rzeki, co najmniej dwoma stylami.',
                        'Pokona dystans 15 m pod wodą.',
                        'Przepłynie 50 m w ubraniu, rozbierze się w wodzie z ubrania (bluzka, spodnie, buty).',
                        'Skoczy do wody skokiem startowym.',
                        'Zorganizuje naukę pływania, nauczy pływać co najmniej 2 osoby.',
                        'Zademonstruje w wodzie sposób ratowania tonącego, przeprowadzi reanimację.',
                        'Zna zasady bezpiecznej kąpieli, potrafi ją zorganizować.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'x',
                sprawData: [
                  SprawData(
                      id: 'wodniaczka',
                      title: 'Wodniaczka',
                      level: '1',
                      tasks: [
                        'Umie pływać.',
                        'Potrafi założyć kapok, zawiąże węzeł ratowniczy na linie ratowniczej.',
                        'Prawidłowo wiosłuje na łodzi (pontonie).',
                        'Weźmie udział w kajakowej wycieczce z biwakowaniem lub min. 3 krótszych wycieczkach kajakowych.',
                        'Zręcznie wchodzi i wychodzi z kajaka.',
                        'Prawidłowo przycumuje do brzegu kajak (łódś), wybierze wodę, wymyje.',
                        'Zabezpieczy bagaż przed przemoczeniem, prawidłowo ułoży go w kajaku.',
                      ]
                  ),

                  SprawData(
                      id: 'wioslarka',
                      title: 'Wioślarka',
                      level: '2',
                      tasks: [
                        'Weźmie udział w spływie wioślarskim, co najmniej 5-dniowym.',
                        'Dobrze wiosłuje i steruje, zręcznie wymija przeszkody, wybiera dogodną drogę na wodzie.',
                        'Opisze przepłynięty przez siebie odcinek rzeki z uwzględnieniem przeszkód i możliwości biwakowania.',
                        'Przeniesie kajak/kanadyjkę lądem przez przeszkodę.',
                        'Poradzi sobie w przypadku wywrócenia kajaka/kanadyjki.',
                        'Posłuży się rzutką, kołem ratunkowym, zna sygnały wzywania pomocy na wodzie.',
                      ]
                  ),

                  SprawData(
                      id: 'kajakarka',
                      title: 'Kajakarka',
                      level: '3',
                      tasks: [
                        'Weźmie udział w co najmniej 3 różnych spływach kajakowych na różnych rzekach.',
                        'Posługując się mapą i przewodnikami zaplanuje trasę kilkudniowego spływu.',
                        'Zna oznakowanie dróg wodnych, sygnały wzywania pomocy na wodzie i prawo drogi.',
                        'Poradzi sobie będąc sternikiem na kajaku lub kanadyjce w trudnych warunkach pogodowych (np. duża fala, silny wiatr, mgła, burza).',
                        'Naprawi nieduże uszkodzenie kajaka/kanadyjki (np. uszczelnienie, odmalowanie).',
                        'Udzieli pierwszej pomocy w przypadku porażenia słonecznego, poparzenia i podtopienia.',
                      ]
                  ),

                  SprawData(
                    id: 'mistrzyni_kajakarstwa',
                    title: 'Mistrzyni kajakarstwa',
                    level: '4',
                    tasks: [
                      'Zorganizuje spływ wioślarski dla swojej drużyny:'
                          '\n- wynajmie, zakupi kajaki/kanadyjki lub wyremontuje kajaki/kanadyjki drużyny,'
                          '\n- zorganizuje transport łodzi,'
                          '\n- znajdzie ratownika, który weźmie udział w spływie,'
                          '\n- skompletuje mapy i przewodniki nt. wybranej trasy wodnej,'
                          '\n- zaplanuje trasę spływu, podzieli ją na etapy dostosowane do wieku i doświadczenia wodnego harcerek,'
                          '\n- przeprowadzi zwiad rzeki,'
                          '\n- sporządzi spis sprzętu i dokona jego przydziału na osoby,'
                          '\n- poprowadzi spływ,'
                          '\n- po spływie przeprowadzi niezbędne naprawy kajaków/kanadyjek i sprzętu.',
                    ],
                    comment: 'Uwaga: w przypadku zdobywania sprawności przez osobę niepełnoletnią konieczne jest uczestnictwo uprawnionego, doświadczonego w spływach opiekuna.',
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'zeglarskie',
                sprawData: [

                  SprawData(
                      id: 'junga',
                      title: 'Junga',
                      level: '1',
                      tasks: [
                        'Zna zasady bezpiecznego żeglowania, potrafi założyć kapok, zawiąże węzeł ratowniczy na linie ratowniczej.',
                        'Zna 10 węzłów żeglarskich.',
                        'Potrafi otaklować małą łódś jednożaglową.',
                        'Będąc na łodzi żaglowej wie skąd wieje wiatr.',
                        'Na jednożaglowej łodzi (jacht typu ket) zrobi zwrot przez sztag i rufę.',
                        'Potrafi postawić wywróconą małą żaglówkę.',
                        'Stosuje etykietę żeglarską, zna min. 3 piosenki żeglarskie.',
                      ]
                  ),

                  SprawData(
                      id: 'szotmenka',
                      title: 'Szotmenka',
                      level: '2',
                      tasks: [
                        'Potrafi żeglować na dwużaglowej łodzi (jacht typu slup):'
                            '\n- utrzymuje i prawidłowo zmienia kurs,'
                            '\n- pracuje żaglami,'
                            '\n- prawidłowo rzuca cumy,'
                            '\n- pracuje bosakiem i odbijaczem,'
                            '\n- pełni funkcję obserwatora na jachcie,'
                            '\n- zrobi zwrot przez sztag i rufę.',
                        'Zna budowę jachtu i olinowanie.',
                        'Potrafi otalkować łódkę dwużaglową.',
                        'Zakończy linę, założy opaskę.',
                        'Potrafi naprawić żagiel, zna 3 rodzaje ściegów żeglarskich.',
                        'Zrobi klar na łódce po zakończeniu pływania (złoży żagle, zwinie liny, zmyje pokład i kokpit).',
                        'Weźmie udział w całodziennym rejsie po jeziorze.',
                        'Zna sposoby wzywania pomocy i prawo drogi na wodach śródlądowych.',
                        'Prawidłowo zachowuje się podczas alarmu „Człowiek za burtą”.',
                      ]
                  ),

                  SprawData(
                      id: 'zeglarka',
                      title: 'Żeglarka',
                      level: '3',
                      tasks: [
                        'Posiada umiejętności na poziomie stopnia żeglarza jachtowego uprawniającego do dowodzenia jednostkami żaglowymi po wodach śródlądowych.',
                        'Weźmie udział w kilkudniowym rejsie po jeziorach.',
                        'Zapozna się z historią wielkich żeglarskich wypraw harcerskich, opowie gawędę nt. znanej żeglarki, przeczyta min. 3 książki marynistyczne lub odbędzie wędrówkę wodną w miejsce odwiedzone już przez harcerki/harcerzy wodnych przed kilkadziesięciu laty.',
                        'Poprowadzi szkolenie żeglarskie dla młodszych harcerek (np. na sprawność junga).',
                        'Wykona dowolne zadanie na rzecz ochrony naturalnego środowiska wodnego (sprzątanie brzegów, artykuł, wystawa fotograficzna).',
                      ]
                  ),

                  SprawData(
                      id: 'milosniczka_zeglarstwa',
                      title: 'Miłośniczka żeglarstwa',
                      level: '3',
                      tasks: [
                        'Weźmie udział w tygodniowym rejsie śródlądowym lub morskim.',
                        'Zna podstawowe zasady polskiego ceremoniału morskiego, zwyczaje morskie, pieśni żeglarskie.',
                        'Potrafi wymienić podstawowe żaglowce polskie i ich osiągnięcia.',
                        'Zorganizuje imprezę propagującą żeglarstwo, np. regaty, koncert piosenki żeglarskiej, itd.',
                      ]
                  ),

                  SprawData(
                      id: 'instruktorka_zeglarstwa',
                      title: 'Instruktorka żeglarstwa',
                      level: '4',
                      tasks: [
                        'Zorganizuje drużynę wodną (żeglarską) lub patrol wodny (żeglarski) w przypadku starszych harcerek/ albo sprawi, że drużyna, do której należy, przekształci się w drużynę wodną lub drużynę o specjalności żeglarskiej /w przypadku drużyn wędrowniczek i harcerek starszych/:'
                            '\n- załatwi dostęp drużyny do sprzętu żeglarskiego,'
                            '\n- będzie wraz z harcerkami opiekować się tym sprzętem (drobne naprawy),'
                            '\n- uzyska dostęp do przystani,'
                            '\n- zadba, by podnieść żeglarskie umiejętności harcerek – przygotuje min. 2 harcerki do zdobycia kolejnych stopni żeglarskich,'
                            '\n- zorganizuje min. tygodniowy harcerski obóz żeglarski.',
                        '3. Pozna historię żeńskiego harcerstwa wodnego.',
                        'Zapozna się i zastosuje przepisy odpowiednie do prowadzonej działalności.',
                      ]
                  ),

                  SprawData(
                      id: 'sterniczka',
                      title: 'Sterniczka',
                      level: '4',
                      tasks: [
                        'Posiada patent żeglarski uprawniający do prowadzenia rejsów przynajmniej na przybrzeżnych wodach morskich.',
                        'Weźmie udział w rejsie morskim lub zatokowym.',
                        'Zorganizuje kilkudniowy rejs śródlądowy lub zatokowy dla harcerek:'
                            '\n- opracuje trasę,'
                            '\n- przygotuje wraz z harcerkami sprzęt,'
                            '\n- przeprowadzi podstawowe szkolenie żeglarskie,'
                            '\n- zapozna harcerki z etykietą żeglarską.',
                        'Zapozna się i zastosuje przepisy odpowiednie do prowadzonej działalności.',
                      ]
                  ),

                  SprawData(
                      id: 'wilk_morski',
                      title: 'Wilk morski',
                      level: '4',
                      tasks: [
                        'Spędzi na morzu min. 200 godzin podczas rejsów jachtem żaglowym.',
                        'Odbędzie min. 2 rejsy morskie na różnych typach jachtów (np. na jolu i slupie).',
                        'Przynajmniej podczas 2 rejsów morskich będzie pełniła funkcję oficera wachtowego lub będzie kapitanem.',
                        'Weźmie udział w regatach śródlądowych lub morskich.',
                        'Zorganizuje co najmniej 5-dniowy rejs morski lub zatokowy dla swojego środowiska harcerskiego.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'rowerowe',
                sprawData: [

                  SprawData(
                      id: 'cyklistka',
                      title: 'Cyklistka',
                      level: '1',
                      tasks: [
                        'Zna znaki drogowe.',
                        'Weźmie udział w l całodniowej wycieczce rowerowej.',
                        'Poprawnie przejedzie rowerowy tor przeszkód.',
                        'Sygnalizuje rękami na zakrętach.',
                        'Potrafi wykonać niezbędne do jazdy czynności przy rowerze (ustawienie kierownicy, siodełka, pompowanie kół, itp.).',
                      ]
                  ),

                  SprawData(
                      id: 'rowerzystka',
                      title: 'Rowerzystka',
                      level: '2',
                      tasks: [
                        'Odbędzie 3 wycieczki kolarskie przebywając łącznie ok. 100 km.',
                        'Prawidłowo mocuje i przewozi na rowerze bagaż.',
                        'Usunie proste uszkodzenie roweru: zaklei dziurę w dętce, założy łańcuch, nasmaruje łożysko.',
                        'Zorganizuje dla zastępu zabawę zapoznającą z przepisami ruchu drogowego.',
                      ]
                  ),

                  SprawData(
                      id: 'kolarz',
                      title: 'Kolarz',
                      level: '3',
                      tasks: [
                        'Weźmie udział w obozie kolarskim.',
                        'Zaopatrzy się prawidłowo w odzież i sprzęt potrzebny na obozie rowerowym.',
                        'Zakupi i wymieni uszkodzone lub zużyte w rowerze części.',
                        'Zaplanuje z mapą wycieczkę rowerową dla harcerek i przeprowadzi ją.',
                        'Przygotuje 2 harcerki do egzaminu na kartę rowerową.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'wrotki-rolki',
                sprawData: [

                  SprawData(
                      id: 'wrotkarka',
                      title: 'Wrotkarka',
                      level: '2',
                      tasks: [
                        'Wykona kilka ćwiczeń – jazdę na rolkach przodem i tyłem, przekładanką, przeskoczenie małej przeszkody, zatrzymanie się na sygnał, łuki w przód i w tył prawą i lewą nogą na zewnątrz i wewnątrz, jazdę slalomową.',
                        'Przebiegnie na rolkach 300 m.',
                        'Weźmie udział w organizowaniu harcerskich zawodów na rolkach.',
                        'Wykona dowolny układ figurowy.',
                        'Zakonserwuje rolki.',
                      ]
                  ),

                  SprawData(
                      id: 'rolkarka_doskonala',
                      title: 'Rolkarka doskonała',
                      level: '3',
                      tasks: [
                        'Dobrze jeśdzi na rolkach przodem i tyłem. Przebędzie w jeśdzie przodem 2 km w ciągu 6 minut.',
                        'Wykona układ figurowy przy muzyce.',
                        'Zorganizuje zawody rolkarskie.',
                        'Systematycznie ćwiczy jazdę na rolkach, uzyskuje dobre wyniki.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'tenisowe',
                sprawData: [
                  SprawData(
                      id: 'mistrzyni_rakietki',
                      title: 'Mistrzyni rakietki',
                      level: '1',
                      tasks: [
                        'Wykona kilka ćwiczeń – elementów gry w tenisa stołowego, ziemnego lub kometkę (prawidłowe trzymanie rakietki, odbicie z prawej i lewej strony, zagrywka, ścięcie).',
                        'Rozegra 5 spotkań w grze pojedynczej i 2 w grze podwójnej, wykaże się znajomością zasad i techniki gry w tenisa stołowego lub kometkę.',
                        'Zakonserwuje lub naprawi rakietkę, lotkę, siatkę, stół do ping-ponga lub wyznaczy boisko do gry w kometkę.',
                      ]
                  ),

//✽//✽ TENISISTKA

                  SprawData(
                      id: 'tenisistka',
                      title: 'Tenisistka',
                      level: '2',
                      tasks: [
                        'Dobrze gra w tenisa, wykorzystuje prawidłowy serwis, forhend, bekhend, wolej.',
                        'Systematycznie trenuje grę w tenisa przez min. 3 miesiące, wykaże się postępami.',
                        'Nauczy 2 osoby gry w tenisa.',
                        'Zorganizuje turniej gry w tenisa stołowego, ziemnego lub gry w kometkę.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'lucznictwo',
                sprawData: [
                  SprawData(
                      id: 'luczniczka',
                      title: 'Łuczniczka',
                      level: '2',
                      tasks: [
                        'Wykona w warunkach terenowych łuk i 3 strzały lub tarczę łuczniczą.',
                        'Rozróżnia i nazwie części łuku i strzały.',
                        'Uzyska min. 100 punktów strzelając z odległości 10 m do tarczy łuczniczej o średnicy 80 cm w 6 seriach po 3 strzały.',
                        'Rzuci prawą i lewą ręką (piłeczkami, rzutkami, szyszkami, itp.) do celu wielkości 20 cm z odległości 5 m i uzyska po min. 5 trafień na 10 rzutów.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'saneczkowe',
                sprawData: [

                  SprawData(
                      id: 'saneczkarka',
                      title: 'Saneczkarka',
                      level: '1',
                      tasks: [
                        'Pokona 3 zjazdy wymijając przeszkody i stosując różne techniki skrętu, hamowania i jazdy.',
                        'Podniesie leżące przedmioty w czasie zjazdu z łagodnego stoku.',
                        'Zbuduje z zastępem tor saneczkowy.',
                        'Weźmie udział w zawodach saneczkowych.',
                        'Konserwuje lub naprawi sanki lub wykona rekwizyty do zawodów saneczkowych (chorągiewki, napisy, itp.).',
                        'Przetransportuje na sankach chorego.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'lyzwiarskie',
                sprawData: [

                  SprawData(
                      id: 'lyzwiarka',
                      title: 'Łyżwiarka',
                      level: '2',
                      tasks: [
                        'Wykona kilka ćwiczeń – jazdę na łyżwach lub rolkach przodem i tyłem, przekładanką, przeskoczenie małej przeszkody, zatrzymanie się na sygnał, łuki w przód i w tył prawą i lewą nogą na zewnątrz i wewnątrz, jazdę slalomową.',
                        'Przebiegnie na łyżwach lub rolkach 300 m.',
                        'Weźmie udział w organizowaniu harcerskich zawodów łyżwiarskich lub na rolkach lub w przygotowaniu z zastępem lodowiska.',
                        'Wykona dowolny układ figurowy.',
                        'Zakonserwuje łyżwy i buty.',
                      ]
                  ),

                  SprawData(
                      id: 'lyzwiarka_doskonala',
                      title: 'Łyżwiarka doskonała',
                      level: '1',
                      tasks: [
                        'Dobrze jeśdzi na łyżwach przodem i tyłem. Przebędzie w jeśdzie przodem 2 km w ciągu 6 minut.',
                        'Wykona układ figurowy przy muzyce.',
                        'Zorganizuje zawody łyżwiarskie lub rolkarskie.',
                        'Systematycznie ćwiczy jazdę na łyżwach lub rolkach, uzyskuje dobre wyniki.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'snowboardowe',
                sprawData: [
                  SprawData(
                      id: 'snowboardzistka_poczatkujaca',
                      title: 'Snowboardzistka początkująca',
                      level: '1',
                      tasks: [
                        'Umie dobrać dla siebie odpowiedni sprzęt snowboardowy, z uwzględnieniem ochraniaczy.',
                        'Wykonuje na desce skręty w obie strony, potrafi się bezpiecznie zatrzymać.',
                        'Odpowiednio dobierze smar do deski, w zależności od pogody i rodzaju śniegu.',
                        'Przeprowadzi rozgrzewkę przed jazdą.',
                        'Nazwie podstawowe rodzaje skoków na snowboardzie.',
                      ]
                  ),

                  SprawData(
                      id: 'snowboardzistka',
                      title: 'Snowboardzistka',
                      level: '2',
                      tasks: [
                        'Wjeżdża z deską wyciągiem krzesełkowym i orczykowym.',
                        'Potrafi zjechać po średnio-zaawansowanej trasie z muldami oraz nartostradą.',
                        'Doskonali konkretny styl jazdy: zjazdowy lub freestyle.',
                        'Potrafi wyregulować wiązania w zależności od stylu jazdy.',
                        'Przygotuje deskę do nowego sezonu.',
                      ]
                  ),

                  SprawData(
                      id: 'snowboardzistka_doskonala',
                      title: 'Snowboardzistka doskonała',
                      level: '3',
                      tasks: [
                        'Potrafi zapanować nad deską na lodzie, ćwiczy jazdę w trudnych warunkach.',
                        'Zna zasady szybkiej, bezpiecznej jazdy na snowboardzie, unika jazdy ryzykownej.',
                        'Weźmie udział w zawodach snowboarowych lub przejedzie trasę takich zawodów.',
                        'Wie jak radzić sobie z typowymi kontuzjami po jeśdzie na desce.',
                        'Śledzi zawody snowboardowe, potrafi wymienić nazwiska polskich zawodników.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_snowboardu',
                      title: 'Mistrzyni snowboardu',
                      level: '4',
                      tasks: [
                        'Regularnie przygotowuje się do zimowego sezonu (np. poprzez specjalną suchą zaprawę).',
                        'Potrafi w bezpieczny sposób zjechać z trudnej (czarnej) lub zawodniczej trasy.',
                        'Umie udzielić pierwszej pomocy na stoku.',
                        'Propaguje jazdę na snowboardzie np. poprzez organizowanie zawodów, szkółek jazdy, konkursów, itp.',
                        'Czyta prasę specjalistyczną, interesuje się zawodami.',
                        'Zna wymagania jakie musi spełnić instruktor snowboardu w Polsce.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'narciarskie',
                sprawData: [
                  SprawData(
                      id: 'narciarka',
                      title: 'Narciarka',
                      level: '1',
                      tasks: [
                        'Pewnie zjedzie techniką carvingową po przygotowanej trasie.',
                        'Wykona w prawidłowej pozycji zjazd na wprost i wskos stoku, zmieni kierunek jazdy przestępowaniem, pługiem i skrętem.',
                        'Podchodzi stok zakosami i jodełką.',
                        'Umie korzystać z wyciągu narciarskiego.',
                        'Weźmie udział w zimowisku, podczas którego będzie jeśdziła na nartach lub wyjeśdzie narciarskim (min. 7-dniowym).',
                        'Ma skompletowany minimalny ekwipunek narciarski. Potrafi odpowiednio ubrać się na narty w zależności od pogody.',
                        'Dba o sprzęt narciarski, odpowiednio do warunków śniegowych smaruje narty.',
                      ]
                  ),

                  SprawData(
                      id: 'narciarka_doskonala',
                      title: 'Narciarka doskonała',
                      level: '1',
                      tasks: [
                        'Pewnie zjedzie po stoku techniką carvingową i klasyczną, potrafi je rozróżnić.',
                        'Wykona zjazd w różnych warunkach terenowych: muldy, stok nieprzejeżdżony, świeży lub mokry śnieg.',
                        'Korzysta ze wszystkich rodzajów wyciągów narciarskich.',
                        'Weźmie udział w obozie, zimowisku narciarskim lub wyjeśdzie narciarskim min. 14-dniowym.',
                        'Weźmie udział w zawodach narciarskich (slalom specjalny i slalom gigant).',
                        'Przeprowadzi kilka ćwiczeń zaprawy narciarskiej.',
                        'Posiada i utrzymuje w porządku swój ekwipunek narciarski.',
                        'Wie jak używać i regulować sprzęt narciarski, konserwuje go.',
                      ]
                  ),

                  SprawData(
                      id: 'narciarka_biegowa',
                      title: 'Narciarka biegowa',
                      level: '2',
                      tasks: [
                        'Wykona krok z odbicia, bezkrok, zwroty, krok w podejściu, zjazdy.',
                        'W biegu płaskim na l km uzyska czas 8-11 minut w zależności od wieku.',
                        'Weźmie udział w kilkugodzinnej wycieczce narciarskiej.',
                        'Przebiegnie na nartach 20 km.',
                        'Przeprowadzi kilka ćwiczeń zaprawy narciarskiej.',
                        'Weźmie udział w zawodach narciarskich.',
                        'Ma skompletowany minimalny ekwipunek narciarski, utrzymuje go w porządku.',
                        'Konserwuje sprzęt narciarski, potrafi go regulować. Odpowiednio do warunków śniegowych smaruje narty.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_nart',
                      title: 'Mistrzyni nart',
                      level: '3',
                      tasks: [
                        'Jeśdzi dynamicznie i kontrolowanie, stosując różne techniki.',
                        'Odbędzie fachowe szkolenie narciarskie.',
                        'Weźmie udział w zawodach narciarskich o dużym zasięgu.',
                        'Przeprowadzi efektywne szkolenie narciarskie dla początkujących.',
                        'Zademonstruje sposób udzielania pierwszej pomocy w wypadku narciarskim.',
                        'Zorganizuje zawody narciarskie (zjazdowe lub biegowe).',
                        'Poprowadzi wycieczkę narciarską.',
                      ]
                  ),

                  SprawData(
                      id: 'instruktorka_narciarstwa',
                      title: 'Instruktorka narciarstwa',
                      level: '4',
                      tasks: [
                        'Przygotuje i zorganizuje obóz narciarski dla drużyny lub innego środowiska:'
                            '\n- pomoże zaopatrzyć uczestniczki w sprzęt narciarski (dobierze narty, wiązania, buty, itp.),'
                            '\n- ułoży i zrealizuje plan szkolenia narciarskiego, zadba o bezpieczeństwo, pokaże jak bezpiecznie korzystać z uroków zimy.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'sniezne',
                sprawData: [
                  SprawData(
                      id: 'sniezka',
                      title: 'Śnieżka',
                      level: '1',
                      tasks: [
                        'Weźmie udział w 10 grach śnieżnych.',
                        'Zorganizuje 2 krótkie gry śnieżne.',
                        'Trafi kulką śnieżną do celu wielkości 20 cm z odległości 5 m i uzyska min. 50% trafień.',
                        'Wykona rześbę ze śniegu o wymiarach min. 1 m3.',
                        'weźmie udział w budowie schronienia z wykorzystaniem śniegu.',
                      ]
                  ),

                  SprawData(
                      id: 'organizatorka_gier_zimowych',
                      title: 'Organizatorka gier zimowych',
                      level: '2',
                      tasks: [
                        'Zorganizuje 10 gier śnieżnych.',
                        'Wykona schronienie ze śniegu.',
                        'Zorganizuje konkurs rześb śnieżnych.',
                        'Zorganizuje całodniową olimpiadę zimową zgodną z zasadami bezpieczeństwa i zdrowia dla zastępu lub drużyny.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'konne',
                sprawData: [
                  SprawData(
                      id: 'dzokejka',
                      title: 'Dżokejka',
                      level: '1',
                      tasks: [
                        'Zna i odróżnia maści i odmiany koni.',
                        'Potrafi opisać podstawowe chody koni.',
                        'Jeśdzi konno, prawidłowo trzyma się w stępie i w kłusie.',
                        'Wyczyści konia, zna jego budowę. Prawidłowo założy rząd jeśdziecki (siodło, ogłowie), zna jego rodzaje.',
                      ]
                  ),

                  SprawData(
                      id: 'jezdziec',
                      title: 'Jeździec',
                      level: '2',
                      tasks: [
                        'Zna rasy koni hodowanych w Polsce i rejony hodowli.',
                        'Ukończy podstawowe szkolenie jeśdzieckie i regularnie jeśdzi konno doskonaląc swoje umiejętności.',
                        'Kreśli figury na ujeżdżalni w każdym chodzie konia.',
                        'Zna zasady poruszania się konno w terenie. Jeśdzi w urozmaiconym terenie w grupie z instruktorem.',
                        'Weźmie udział w wycieczce lub rajdzie konnym. Zna zasady jazdy długodystansowej.',
                        'Wie jak zachować się na popasie z końmi.',
                        'Pielęgnuje konia czyszcząc go, zadając mu siano, owies i wodę, ścieląc mu stanowisko i boks.',
                      ]
                  ),

                  SprawData(
                      id: 'amazonka',
                      title: 'Amazonka',
                      level: '3',
                      tasks: [
                        'Zna podstawy fizjologii konia, zasady normowania pasz, wie jak dostosować żywienie do aktualnej eksploatacji konia.',
                        'Wie jak zachować się z koniem na lodzie, w wodzie, podczas burzy i innych niebezpiecz? nych sytuacji.',
                        'Umie lonżować konia, zna tego cel.',
                        'Wykona ciągi, zwroty na przedzie i na zadzie, zmianę nogi, branie przeszkody.',
                        'Doskonali swój dosiad w każdym chodzie. Dobrze i pewnie jeśdzi z zespołem w terenie.',
                        'Potrafi wskoczyć na konia i wykonać podstawowe ćwiczenia woltyżerskie (flaga, uskok – wyskok, rybka, nożyce, młynek).',
                        'Weźmie udział w obozie konnym.',
                        'Wykona wszystkie prace stajenne – konserwuje sprzęt jeśdziecki, zadaje paszę, sprząta stanowiska lub boksy koni.',
                        'Zna najprostsze schorzenia konia, potrafi im zapobiec i udzielić pierwszej pomocy (opatrywanie skaleczenia, okład chłodzący, wcierka chłodząca, leczenie kopyt).',
                      ]
                  ),

                  SprawData(
                      id: 'wedrowniczka_konna',
                      title: 'Wędrowniczka konna',
                      level: '3',
                      tasks: [
                        'Ukończy kurs jazdy konnej i regularnie jeśdzi konno. Pewnie trzyma się w siodle w terenie.',
                        'Umie zachować się na popasie z końmi – sama zajmie się swoim koniem.',
                        'Weźmie udział w 3 jednodniowych wycieczkach konnych i co najmniej 2 rajdach (min. 150 km).',
                        'Zna zasady siodłania turystycznego, potrafi prawidłowo troczyć siodło.',
                        'Umie prawidłowo rozplanować wysiłek konia, wie jakie drogi należy wybierać na konne przemarsze. Zaplanuje trasę 3-dniowego rajdu.',
                        'Zna zasady żywienia koni na rajdzie.',
                        'Potrafi powozić końmi w różnorodnym terenie.',
                        'Umie udzielić koniowi pierwszej pomocy weterynaryjnej.',
                      ]
                  ),

                  SprawData(
                      id: 'milosniczka_koni',
                      title: 'Miłośniczka koni',
                      level: '4',
                      tasks: [
                        'Zorganizuje obóz konny dla drużyny, środowiska, na którym przeprowadzi program szkolenia jeśdzieckiego zróżnicowany wg posiadanych przez harcerki umiejętności.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'gry',
                sprawData: [
                  SprawData(
                      id: 'organizatorka_gier',
                      title: 'Organizatorka gier',
                      level: '2',
                      tasks: [
                        'Zna po 10 gier, zabaw ruchowych i towarzyskich wykorzysta je w pracy drużyny, zastępu.',
                        'Zorganizuje i poprowadzi wieczór zabaw w drużynie.',
                        'Ułoży i poprowadzi całodniową grę fabularną.',
                        'W formie gry nauczy harcerki nowych umiejętności, wiedzy. W innej grze sprawdzi wyniki.',
                      ]
                  ),

                  SprawData(
                      id: 'milosniczka_gier',
                      title: 'Miłośniczka gier',
                      level: '3',
                      tasks: [
                        'Zna 30 gier i zabaw ruchowych, przedstawi sporządzony przez siebie zbiór, wykorzysta go w pracy z młodszymi harcerkami. Są w nim również propozycje gier w izbie'
                            'harcerskiej i do wykorzystania podczas niepogody.',
                        'Zorganizuje duże zawody, będzie pełniła na nich funkcję sędziego, wykaże się znajomością zasad i techniki różnych dyscyplin sportowych.',
                        'Nauczy innych zasad gry w koszykówkę, piłkę ręczną lub siatkówkę.',
                        'Zagra z dokładną znajomością prawideł w:'
                            '\n- 3 gry sportowe,'
                            '\n- 5 gier towarzyskich,'
                            '\nodpowiednich dla harcerek w wieku rówieśniczym.',
                        'Wykona rekwizyty do gier.',
                        'Zorganizuje 5 gier terenowych, w tym 2 nocne.',
                      ]
                  ),

                ]
            ),

            SprawFamilyData(
                id: 'szachowe',
                sprawData: [
                  SprawData(
                      id: 'mistrzyni_warcabow',
                      title: 'Mistrzyni warcabów',
                      level: '1',
                      tasks: [
                        'Weźmie udział w turnieju warcabów.',
                        'Nauczy się 2 gier, które powstały na podstawie warcabów.',
                        'Uczy się grać w szachy – zna figury i ich ruchy oraz ogólne zasady gry w szachy.',
                        'Wykona zestaw do gry w warcaby.',
                      ]
                  ),

                  SprawData(
                      id: 'szachistka',
                      title: 'Szachistka',
                      level: '2',
                      tasks: [
                        'Wykaże się znajomością zasad gry w szachy (znajomość figur i ich znaków, umiejętność stosowania roszady, bicia w przelocie, itp.).',
                        'Zna wartość figur i ich podział (figury lekkie i ciężkie, jedna figura lekka = 3 piony, itp.).',
                        'Rozegra 20 partii szachów wygrywając co najmniej połowę z nich.',
                        'Rozegra odtwórczo jedną partię meczu arcymistrzowskiego (np. Karpow – Kasparow).',
                        'Weźmie udział w turnieju szachowym.',
                      ]
                  ),

                  SprawData(
                      id: 'arcymistrzyni',
                      title: 'Arcymistrzyni',
                      level: '3',
                      tasks: [
                        'W czasie gry w szachy stosuje wymyślną taktykę (potrafi przejść z obrony do ataku, przegrupować figury z centrum na skrzydła lub odwrotnie).',
                        'Zorganizuje turniej szachowy. Będzie pełniła w nim rolę sędziego.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'gimnastyczne',
                sprawData: [
                  SprawData(
                      id: 'mala_gimnastyczka',
                      title: 'Mała gimnastyczka',
                      level: '1',
                      tasks: [
                        'Przez 3 tygodnie codziennie się gimnastykuje (min. przez 15 minut).',
                        'Czynnie uczestniczy w zajęciach wf.',
                        'Wykona 3-minutowy dowolny układ gimnastyczny.',
                        'Wykona kilka ćwiczeń gimnastycznych – przewrót w przód i w tył, skłon w przód z dotknięciem głową kolan w siadzie płaskim, stanie na rękach, przeskok rozkroczny, mostek ze stania, przejście po równoważni.',
                        'Wykaże się celnością w rzucaniu ringiem na patyk, piłką do celu, itp. z odległości 2 m.',
                      ]
                  ),

                  SprawData(
                      id: 'gimnastyczka',
                      title: 'Gimnastyczka',
                      level: '2',
                      tasks: [
                        'Wykona 3-minutowy dowolny układ gimnastyczny z podkładem muzycznym i rekwizytem (taśma, koło, drążek, itp.).',
                        'Przedstawi układ 5 ćwiczeń z osobą współćwiczącą.',
                        'Uprawia przez min. 2 miesiące gimnastykę (min. 15 minut dziennie). Poprawi swoje wyniki np. w podciąganiu się na rękach, skoku w dal z miejsca, wzwyż, itp. (3 dyscypliny).',
                        'Kilkakrotnie poprowadzi gimnastykę w zastępie, drużynie wg schematu.',
                      ]
                  ),

                  SprawData(
                      id: 'mistrzyni_gimnastyki',
                      title: 'Mistrzyni gimnastyki',
                      level: '3',
                      tasks: [
                        'Ćwiczy systematycznie jedną z form gimnastyki nowoczesnej: aerobic, kalanetics, itp. lub uprawia codzienny bieg z gimnastyką.',
                        'Zna zasady przeprowadzania gimnastyki porannej i rozgrzewki sportowej, poprowadzi gimnastykę na obozie (codziennie 15 minut).',
                        'Poprowadzi ćwiczenia gimnastyczne grupy w oparciu o znaną bajkę lub przeżycia harcerek z ostatnich dni (ilustracja ruchowa z opowiadaniem).',
                        'Zaprojektuje i pokieruje wykonaniem obozowego toru przeszkód.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'x',
                sprawData: [
                  SprawData(
                      id: 'mala_lekkoatletka',
                      title: 'Mała lekkoatletka',
                      level: '1',
                      tasks: [
                        'Weźmie udział w zawodach sportowych.',
                        'Wybierze dla siebie l dyscyplinę lekkoatletyczną, którą będzie ćwiczyła przez min. 3 tygodnie (3 stałe dni w tygodniu po min. 30 minut).',
                        'Czynnie uczestniczy w zajęciach wf.',
                        'Na skutek ćwiczeń skonsultowanych z drużynową, nauczycielem wf, trenerem itp. poprawi swoje wyniki w: biegu na 60 m i 600 m, skoku w dal, rzucie piłką palantową.',
                      ]
                  ),

                  SprawData(
                      id: 'lekkoatletka',
                      title: 'Lekkoatletka',
                      level: '2',
                      tasks: [
                        'Weźmie udział w zawodach lekkoatletycznych lub w zawodach terenowych w sztafecie wahadłowej, zakwalifikuje się do niej.',
                        'Wykaże się znajomością zasad i technik różnych dyscyplin lekkoatletycznych – odczyta czas na stoperze, zmierzy długość skoku w dal, poprowadzi punktację zawodów, itp.',
                        'Wykona rekwizyty do zawodów (np. stojaki do skoku wzwyż, chorągiewki) lub przygotuje teren (np. wyznaczy bieżnię, wykona skocznię, itp.) lub weźmie udział w budowaniu „małpiego gaju”.',
                        'Uzyska wyniki (np. na zawodach sportowych) jak w tabeli w zależności od wieku i terenu w dyscyplinach: bieg na 60 m, bieg na 600 m, skok w dal lub wzwyż, rzut piłką palantową.',
                        'Tabelka sportowa'
                      ],
                      comment:
                      "<b>11 lat:</b>"
                          "\n60m * - 9,6 s."
                          "\n600m - 2 min. 20 s."
                          "\nw dal ** - 3,50 m"
                          "\nwzwyż - 1 m"
                          "\npił. pal - 25 m"
                          "\n"
                          "\n<b>12 lat:</b>"
                          "\n60m * - 9,4 s."
                          "\n600m - 2 min. 10 s."
                          "\nw dal ** - 3,80 m"
                          "\nwzwyż - 1,2 m"
                          "\npił. pal - 27 m"
                          "\n"
                          "\n<b>13 lat:</b>"
                          "\n60m * - 9,0 s."
                          "\n600m - 2 min. 05 s."
                          "\nw dal ** - 4,20 m"
                          "\nwzwyż - 1,3 m"
                          "\npił. pal - 30 m"
                          "\n"
                          "\n<b>14 lat:</b>"
                          "\n60m * - 8,8 s."
                          "\n600m - 2 min. 00 s."
                          "\nw dal ** - 4,40 m"
                          "\nwzwyż - 1,5 m"
                          "\npił. pal - 35 m"
                          "\n"
                          "\n<b>15 lat:</b>"
                          "\n60m * - 8,7 s."
                          "\n600m - 1 min. 55 s."
                          "\nw dal ** - 4,60 m"
                          "\nwzwyż - 1,6 m"
                          "\npił. pal - 40 m"
                          "\n"
                          "\n<b>16 lat:</b>"
                          "\n60m * - 8,6 s."
                          "\n600m - 1 min. 50 s."
                          "\nw dal ** - 4,70 m"
                          "\nwzwyż - 1,7 m"
                          "\npił. pal - 42 m"
                          "\n"
                          "\n* wyniki dostosowane do bieżni; dla 60 m teren równy i twarde podłoże i start niski, dla 600 m niewielkie nierówności i start wysoki. Jeżeli sprawdzian będzie się odbywał w terenie trudniejszym należy doliczyć dla 60 m. 0,4-0,6 s, a dla 600 m. 15-20 s."
                          "\n"
                          "\n** skocznia w dal przy szkole, na stadionie lub prowizoryczna: twardy rozbieg, lądowanie w piachu. Dla klas I gimnazjum do I liceum odbicie z deski, dla klas 56 pomiar z miejsca odbicia (strefa 1 m)."

                  ),

                  SprawData(
                      id: 'mistrzyni_lekkoatletyki',
                      title: 'Mistrzyni lekkoatletyki',
                      level: '3',
                      tasks: [
                        'Zna zasady prawidłowego treningu w dyscyplinach lekkoatletycznych (dopuszczalny wysiłek, jego częstość, potrzebny odpoczynek, czas ćwiczeń, tryb życia, żywienie, itp.), stosuje się do nich.',
                        'Zorganizuje zawody sportowe i przygotuje grupę osób do udziału w nich.',
                        'Systematycznie ćwiczy l dyscyplinę sportu.',
                        'Zna pojęcie długu tlenowego, kiedy powstaje, zna pojęcie tętno maksymalne i wie jak je obliczyć.',
                      ]
                  ),
                ]
            ),

            SprawFamilyData(
                id: 'sportowiec',
                sprawData: [
                  SprawData(
                      id: 'milosniczka_sportu',
                      title: 'Miłośniczka sportu',
                      level: '1',
                      tasks: [
                        'Pozna cechy charakteru i tryb życia dobrego sportowca i przedyskutuje je z drużynową.',
                        'Ułoży plan uwzględniający odpowiednią ilość snu, wypoczynku, ruchu, właściwe odżywianie, skonsultuje go z drużynową i realizuje przez okres 2 tygodni (ten punkt nie może być realizowany podczas wyjazdu).',
                        'Zna ideę ruchu olimpijskiego i symbolikę kół olimpijskich.',
                      ]
                  ),

                  SprawData(
                      id: 'sportowiec',
                      title: 'Sportowiec',
                      level: '2',
                      tasks: [
                        'Wyróżnia się bardzo dobrymi wynikami w określonej dziedzinie sportu.',
                        'Trenuje systematycznie, starając się ciągle poprawiać swoje wyniki.',
                        'Zademonstruje swoje umiejętności podczas zawodów w drużynie.',
                        'Stosuje się do zasad zdrowego trybu życia.',
                      ]
                  ),

                  SprawData(
                      id: 'olimpijka',
                      title: 'Olimpijka',
                      level: '3',
                      tasks: [
                        'Uprawia wyczynowo określoną dziedzinę sportu nie objętą wymaganiami innych sprawności. Trenuje codziennie, osiąga sukcesy w zawodach.',
                        'Zademonstruje swoje umiejętności w danej dyscyplinie podczas zawodów jako reprezentantka drużyny lub hufca.',
                        'Zorganizuje dla harcerek zajęcia zaznajamiające z uprawianym sportem (np. pokazy, zawody, naukę zasad i techniki, rozgrzewki właściwe dla danej dziedziny, obserwacja zawodów na obiekcie sportowym).',
                        'W ciekawej formie przekaże harcerkom zasady zdrowego trybu życia.',
                        'Zaplanuje i zorganizuje wyjazd drużyny zgodny z zasadami zdrowego trybu życia (uwzględni w nim również elementy sportowe).',
                      ]
                  ),
                ]
            ),
          ]
      ),

    ]
).build();
