import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_def.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_zhp_old.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';

import '../rank_tile_widget.dart';

RankDefData rankZhpOldZuch1Data = RankDefData(
  titleMale: 'Zuch ochoczy',
  version: 1,
  org: Org.zhp,
  id: 'ZUCH_1',
  catData: [
    const RankCatData(
      groupData: [
        RankGroupData(
          taskData: [
            RankTaskData(text: 'Złożyłem(-am) Obietnicę Zuchową. Dbam o swój mundur. Ochoczo biorę udział w zbiórkach gromady.'),
            RankTaskData(text: 'Chętnie służę radą i pomocą wszystkim, którzy tego potrzebują. Stale pomagam w pracach domowych.'),
            RankTaskData(text: 'Brałem(-am) udział w wycieczce lub innej formie turystycznej.'),
            RankTaskData(text: 'Znam symbole narodowe, hymn mojej Ojczyzny i potrafię godnie zachować się w sytuacjach, kiedy są używane.'),
          ]
        )
      ]
    )
  ]
);
RankDef rankZhpOldZuch1 = rankZhpOldZuch1Data.build();

RankDefData rankZhpOldZuch2Data = RankDefData(
    titleMale: 'Zuch sprawny',
    version: 1,
    org: Org.zhp,
    id: 'ZUCH_2',
    catData: [
      const RankCatData(
          groupData: [
            RankGroupData(
                taskData: [
                  RankTaskData(text: 'Jestem dla innych przykładem dobrego zucha. Ważne sprawy gromady i swoje potrafię omówić i załatwić w Kręgu Rady.'),
                  RankTaskData(text: 'Potrafię zaplanować swój dzień, znajdując czas na naukę, zabawę i pracę domową. Wykonałem(-am) pożyteczną pracę dla domu rodzinnego.'),
                  RankTaskData(text: 'Zorganizowałem(-am) gry i zabawy dla kolegów samodzielnie lub z szóstką. Aktywnie spędziłem(-am) ferie zimowe (w jednej formie).'),
                  RankTaskData(text: 'Zdobyłem(-am) najważniejsze wiadomości związane z historią mojej miejscowości.'),
                ]
            )
          ]
      )
    ]
);
RankDef rankZhpOldZuch2 = rankZhpOldZuch2Data.build();

RankDefData rankZhpOldZuch3Data = RankDefData(
    titleMale: 'Zuch gospodarny',
    version: 1,
    org: Org.zhp,
    id: 'ZUCH_3',
    catData: [
      const RankCatData(
          groupData: [
            RankGroupData(
                taskData: [
                  RankTaskData(text: 'Zorganizowałem(-am) wraz z gromadą akcję gospodarczą, która przyczyniła się do wzbogacenia majątku gromady.'),
                  RankTaskData(text: 'Nawiązałem(-am) kontakt z harcerzami i dowiedziałem(-am) się, jak można zostać harcerzem. Wykonałem(-am) z nimi pożyteczną pracę dla środowiska.'),
                  RankTaskData(text: 'Zdobyłem(-am) odznakę "Siedmiomilowe buty" lub uczestniczyłem(-am) w harcerskiej formie wypoczynku.'),
                  RankTaskData(text: 'Znam obrzędy i zwyczaje drużyny harcerskiej, z którą nawiązałem(-am) kontakt. Wiem, kto jest bohaterem tej drużyny i szczepu, w którym ona działa.'),
                ]
            )
          ]
      )
    ]
);
RankDef rankZhpOldZuch3 = rankZhpOldZuch3Data.build();


RankZHPOldData rankZhpOld0Data = RankZHPOldData(
  titleMale: 'Próba harcerza',
  titleFemale: 'Próba harcerki',
  czasTrw: '3 - 6 miesięcy',
  version: 1,
  org: Org.zhp,
  id: 'HARC_0',
  idea: 'Stara się zasłużyć na miano harcerki lub harcerza. Chce poznać harcerstwo i dostosować się do jego wymagań, określonych w prawie i Przyrzeczeniu Harcerskim. Chce uczestniczyć w życiu zastępu (patrolu) i drużyny.',
  warOtw: ['Chęć :)'],
  catData: [

    const RankCatData(
      groupData: [
        RankGroupData(
          taskData: [
            RankTaskData(text: 'Znam i rozumiem treść Przyrzeczenia Harcerskiego.'),
            RankTaskData(text: 'Znam i rozumiem Prawo Harcerskie.'),
            RankTaskData(text: 'Znam i rozumiem symbolikę krzyża harcerskiego, lilijki i koniczynki. Potrafię wyjaśnić, do czego zobowiązuje harcerskie pozdrowienie "Czuwaj".'),
            RankTaskData(text: 'Znam hymn harcerski i umiem go zaśpiewać.'),
            RankTaskData(text: 'Kompletuję swój mundur harcerski.'),
            RankTaskData(text: 'Systematycznie uczestniczę w zbiórkach zastępu i drużyny.'),
            RankTaskData(text: 'Wykonałem(-am) z zastępem (patrolem) przynajmniej jedno zadanie zespołowe (lub projekt).'),
            RankTaskData(text: 'Znam nazwę drużyny, imię i nazwisko zastępowego i drużynowego i wiem, jak się z nimi skontaktować.'),
          ]
        )
      ]
    )
  ]
);
RankZHPOld rankZhpOld0 = rankZhpOld0Data.build();

RankZHPOldData rankZhpOld1Data = RankZHPOldData(
  titleMale: 'Młodzik',
  titleFemale: 'Ochotniczka',
  czasTrw: '6 - 9 miesięcy',
  version: 2,
  org: Org.zhp,
  id: 'HARC_1', 
  idea: 'Poznaje smak harcerskiej przygody. W swoim postępowaniu kieruje się Prawem Harcerskim. Pamięta o codziennym dobrym uczynku. Chętnie zdobywa nowe wiadomości i umiejętności przydatne w zastępie, drużynie, domu i szkole. Jest zaradny(-a), dzielny(-a) i pogodny(-a).',
  warOtw: [
    'Złożył(-a) Przyrzeczenie Harcerskie.',
    'Aktywnie uczestniczy w życiu zastępu i drużyny.'
  ],
  catData: [
    
    const RankCatData(
      groupData: [
        RankGroupData(
            taskData: [
              RankTaskData(text: 'Staram się postępować zgodnie z Prawem Harcerskim.'),
              RankTaskData(text: 'W każdym widzę bliźniego. Dostrzegam potrzeby bliźnich, wyrażam to przez spełnianie dobrych uczynków.'),
              RankTaskData(text: 'Mam swoją ulubioną książkę. Korzystam z biblioteki.'),
              RankTaskData(text: 'Mam swoje hobby, zaprezentowałem je w zastępie, drużynie.'),
            ]
        ),
        RankGroupData(
          title: 'Życie rodzinne',
          icon: RankData.iconRodzina,
          taskData: [
            RankTaskData(text: 'Mam stały obowiązek domowy i wywiązuję się z niego.'),
            RankTaskData(text: 'Znam daty świąt rodzinnych (imieniny, urodziny, rocznice) i pamiętam o nich.'),
            RankTaskData(text: 'Dziele się z rodzicami moimi radościami i niepowodzeniami.'),
          ],
        ),
        RankGroupData(
          title: 'Zaradność życiowa',
          icon: RankData.iconZaradnosc,
          taskData: [
            RankTaskData(text: 'Noszę mundur zgodny z regulaminem obowiązującym w ZHP.'),
            RankTaskData(text: 'Zaoszczędziłem(-am) niedużą sumę pieniędzy i wydałem(-am) ją na zaplanowany wcześniej cel.'),
            RankTaskData(text: 'Znam okolice swego domu i szkoły. Wiem, gdzie jest przychodnia lekarska, apteka, poczta, posterunek policji, dworzec autobusowy i dworzec kolejowy. Potrafię wskazać drogę do tych miejsc.'),
            RankTaskData(text: 'Dbam o własny wygląd i czystość, utrzymuję porządek wokół siebie. Przyszyłem(-am) guzik, plakietkę do munduru.'),
            RankTaskData(text: 'Systematycznie uczestniczę w zajęciach ruchowych (np. gimnastyka, gra w piłkę, jazda na rowerze, aerobik, jazda na rolkach).'),
            RankTaskData(text: 'Dbam o higienę osobistą i zapobiegam przeziębieniom, odpowiednio się ubierając.'),
          ],
        ),
        RankGroupData(
          title: 'Wiedza harcerska',
          icon: RankData.iconTozsHarcerska,
          taskData: [
            RankTaskData(text: 'Wiem, kiedy powstał skauting, kto był jego twórcą oraz kto tworzył harcerstwo na ziemiach polskich. Wiem, czym wsławiły się Szare Szeregi.'),
            RankTaskData(text: 'Wiem, kto jest bohaterem mojej drużyny (szczepu).'),
            RankTaskData(text: 'Potrafię zachować się w kręgu i podczas ogniska. Znam zwyczaje i obrzędy mojego zastępu i drużyny.'),
            RankTaskData(text: 'Wiem, jak oznacza się funkcje pełnione w zastępie, drużynie, szczepie.'),
            RankTaskData(text: 'Znam podstawy musztry harcerskiej. Stanę w postawie zasadniczej i swobodnej, wykonam zwroty. Ustawię się na zbiórce, zachowam się w szyku i zamelduję się. Odpowiednio zachowam się podczas hymnu i wobec sztandaru.'),
            RankTaskData(text: 'Mam śpiewnik harcerski. Znam przynajmniej 5 piosenek harcerskich i pląsów.'),
          ],
        ),
        RankGroupData(
          title: 'Techniki harcerskie',
          icon: RankData.iconTechHarc,
          taskData: [
            RankTaskData(text: 'Umiem zaradzić w przypadku skaleczenia, otarcia nogi, zachłyśnięcia, niewielkiego oparzenia i stłuczenia, krwotoku z nosa, użądlenia przez pszczołę lub osę. Odpowiednio wykorzystuję dostępne środki opatrunkowe. Znam prawidłową temperaturę człowieka i potrafię ją zmierzyć. Znam numery telefonów pogotowia ratunkowego, policji, straży pożarnej oraz ogólnopolski numer alarmowy. Wiem, jak wezwać pomoc w nagłym wypadku.'),
            RankTaskData(text: 'Uczestniczyłem(-am) w grze terenowej. Wyznaczyłem(-am) strony świata za pomocą słońca, przedmiotów terenowych i busoli. Dotarłem(-am) do wyznaczonego miejsca po znakach patrolowych.'),
            RankTaskData(text: 'Uczestniczyłem(-am) w wycieczce, przygotowałem(-am) swój ekwipunek wycieczkowy, odpowiedni do warunków atmosferycznych i terenowych. Potrafię bezpiecznie poruszać się po drodze (samodzielnie i w grupie).'),
            RankTaskData(text: 'Rozstawiłem(-am) namiot turystyczny, ułożyłem(-am) i rozpaliłem(-am) bezpiecznie ognisko. Znam trzy węzły.'),
            RankTaskData(text: 'Byłem(-am) z zastępem lub drużyną na wycieczce w lesie. Umiem się w nim zachować. Rozpoznałem(-am) po sylwetce i liściach 5 drzew.'),
            RankTaskData(text: 'Zaopiekowałem(-am) się zwierzęciem lub rośliną.'),
            RankTaskData(text: 'Znam co najmniej dwa sposoby szyfrowania wiadomości.'),
          ],
        ),
        RankGroupData(
          title: 'Postawa obywatelska',
          icon: RankData.iconPostawaObyw,
          taskData: [
            RankTaskData(text: 'Znam historię godła i barw narodowych. Wiem, co oznaczają i potrafię się wobec nich zachować. Zaśpiewam hymn państwowy.'),
            RankTaskData(text: 'Odszukam na mapie Polski miejsca, które dotąd odwiedziłem lub chciałbym odwiedzić.'),
            RankTaskData(text: 'Wyrobiłem w sobie pożyteczne domowe nawyki ekologiczne.'),
            RankTaskData(text: 'W okresie próby uczestniczyłem(-am) w realizacji co najmniej dwóch zadań zespołowych zastępu. Zdobyłem(-am) w czasie próby przynajmniej dwie sprawności.'),
          ],
        )
      ]
    )
    
  ]
);
RankZHPOld rankZhpOld1 = rankZhpOld1Data.build();

RankZHPOldData rankZhpOld2Data = RankZHPOldData(
  titleMale: 'Wywiadowca',
  titleFemale: 'Tropicielka',
  czasTrw: '6 - 12 miesięcy',
  version: 1,
  org: Org.zhp,
  id: 'HARC_2',
  idea: 'Przestrzega Prawa i Przyrzeczenia Harcerskiego w codziennym życiu. Zdobywa harcerską wiedzę i doskonali umiejętności z różnych dziedzin. Tropi sytuacje, w których może być pożyteczny(-a). Ćwiczy swoją spostrzegawczość i sprawność. Aktywnie uczestniczy w zadaniach zastępu i drużyny.',
  warOtw: [
    'Zdobył(-a) stopień ochotniczki/młodzika; jeśli nie posiada stopnia ochotniczki/młodzika, realizuje próbę tropicielki/wywiadowcy poszerzoną o wiadomości i umiejętności zawarte w wymaganiach poprzedniego stopnia.',
    'Aktywnie uczestniczy w życiu zastępu i drużyny.'
  ],
  catData: [
    const RankCatData(
      groupData: [
        RankGroupData(
          title: 'Praca nad sobą',
          icon: RankData.iconPracaNadSoba,
          taskData: [
            RankTaskData(text: 'Notuję sytuacje, w których postąpiłem(-am) zgodnie i niezgodnie z Prawem Harcerskim i na ich podstawie dokonałem(-am) wyboru punktu Prawa Harcerskiego, nad którym szczególnie chciałabym/łbym mocno popracować.'),
            RankTaskData(text: 'Robię codzienny rachunek dobrych i złych uczynków.'),
            RankTaskData(text: 'Ukończyłem(-am) próbę silnej woli, np. przez tydzień zrezygnowałem(-am) ze słodyczy, oglądania telewizji, gier komputerowych.'),
          ],
        ),
        RankGroupData(
          title: 'Życie rodzinne',
          icon: RankData.iconRodzina,
          taskData: [
            RankTaskData(text: 'Przygotowałem(-am) uroczysty posiłek dla domowników lub uczestniczyłem(-am) w przygotowaniach świąt rodzinnych.'),
            RankTaskData(text: 'Znam historię swojej rodziny.'),
            RankTaskData(text: 'Rozmawiam z rodziną o swoich problemach.'),
          ],
        ),
        RankGroupData(
          title: 'Zaradność życiowa',
          icon: RankData.iconZaradnosc,
          taskData: [
            RankTaskData(text: 'Osiągnęłem(-am) dobre wyniki w grach na spostrzegawczość.'),
            RankTaskData(text: 'Uczestniczyłem(-am) w akcji zarobkowej drużyny.'),
            RankTaskData(text: 'Wiem, jakie zmiany rozwojowe zachodzą u dziewcząt (u chłopców) w moim wieku. Staram się poznać potrzeby i możliwości swojego organizmu.'),
            RankTaskData(text: 'Znam szkodliwe skutki palenia papierosów, picia alkoholu i zażywania narkotyków.'),
            RankTaskData(text: 'Regularnie uprawiam wybraną dziedzinę sportu lub aktywności ruchowej. Poprawiłem(-am) swoje osiągnięcia.'),
            RankTaskData(text: 'Systematycznie ćwiczę znajomość języka obcego.'),
            RankTaskData(text: 'Korzystałem(-am) z informacji PKS, PKP, uzyskałem(-am) potrzebny numer telefoniczny i znalazłem(-am) potrzebną informację w internecie.'),
          ],
        ),
        RankGroupData(
          title: 'Wiedza harcerska',
          icon: RankData.iconTozsHarcerska,
          taskData: [
            RankTaskData(text: 'Znam najważniejsze wydarzenia z dziejów harcerstwa. Potrafię wskazać kilka postaci zasłużonych dla ruchu harcerskiego.'),
            RankTaskData(text: 'Wiem, jak powstała tradycja Dnia Myśli Braterskiej.'),
            RankTaskData(text: 'Wiem, co oznaczają skróty WOSM i WAGGGS, wyjaśnię, dlaczego harcerki noszą na mundurze plakietkę WAGGGS, a harcerze plakietkę WOSM.'),
            RankTaskData(text: 'Znam historię swojej drużyny (szczepu) oraz bohatera drużyny (szczepu). Wiem, jakie cechy bohatera drużyny (szczepu) warto naśladować.'),
            RankTaskData(text: 'Wiem, kto jest bohaterem mojego hufca i mojej chorągwi.'),
            RankTaskData(text: 'Znam nazwy stopni harcerskich i instruktorskich oraz sposób ich oznaczania na mundurze. Wiem, jakie sznury noszą instruktorzy komendy hufca, komendy chorągwi, Głównej Kwatery i Przewodniczący ZHP. Znam ich miejsce w strukturze ZHP.'),
            RankTaskData(text: 'Przeczytałem(-am) minimum dwie książki o tematyce harcerskiej.'),
          ],
        ),
        RankGroupData(
          title: 'Techniki harcerskie',
          icon: RankData.iconTechHarc,
          taskData: [
            RankTaskData(text: 'Znam skład apteczki drużyny i wiem, jak stosować znajdujące się w niej środki. Potrafię udzielić pierwszej pomocy w przypadku krwotoku, stłuczenia, oparzenia, odmrożenia, skręcenia stawu, złamania kończyny, wystąpienia ciała obcego w oku, omdlenia, udaru słonecznego. Pełniłem(-am) służbę samarytańską, np. na wycieczce, biwaku, festynie.'),
            RankTaskData(text: 'Wyznaczyłem(-am) azymuty w terenie. Wykonałem(-am) szkic drogi, zaznaczając azymuty, charakterystyczne obiekty i odległości. Posługując się busolą i mapą dotarłem(-am) do wyznaczonego miejsca. Wyznaczyłem(-am) w nocy kierunek północny. Prawidłowo oceniłem(-am) "na oko" odległość w terenie, długość przebytej drogi oraz czas marszu. W pomiarach wykorzystałem wymiary swojego ciała, np. wzrost, rozpiętość ramion i długość stopy.'),
            RankTaskData(text: 'Znam oznakowanie szlaków turystycznych oraz zasady poruszania się po nich. Przeszedłem(-przeszłam) oznaczonym szlakiem.'),
            RankTaskData(text: 'Uczestniczyłem(-am) w rozstawianiu obozu. Zbudowałem(-am) proste urządzenie obozowe lub wykonałem(-am) element zdobnictwa obozowego. Znam osiem węzłów, wykorzystałem(-am) je w praktyce (np. przy budowie urządzeń, w zdobnictwie obozowym lub podczas wędrówki). Przygotowałem(-am) posiłek dla zastępu na kuchni polowej lub kuchence turystycznej.'),
            RankTaskData(text: 'Kompletuję ekwipunek turystyczny odpowiedni na różne pory roku.'),
            RankTaskData(text: 'Nadałem(-am) i odebrałem(-am) wiadomość przekazaną alfabetem Morse’a.'),
            RankTaskData(text: 'Odnalazłaem(-am) w środowisku naturalnym 5 roślin chronionych.'),
            RankTaskData(text: 'Obserwowałem(-am) wybrane zwierzę i opowiedziałem(-am) innym (w zastępie, w drużynie lub w klasie) o swoich spostrzeżeniach.'),
            RankTaskData(text: 'Wykonałem(-am) pożyteczną pracę na rzecz przyrody.'),
          ],
        ),
        RankGroupData(
          title: 'Postawa obywatelska',
          icon: RankData.iconPostawaObyw,
          taskData: [
            RankTaskData(text: 'Znam obszar swojej gminy i jej siedzibę. Sprawnie posługuję się planem lub mapą swojej okolicy, na jej podstawie dotrę we wskazane miejsce.'),
            RankTaskData(text: 'Znam daty świąt narodowych, wiem, jakie wydarzenia te święta upamiętniają. Przygotuję z zastępem zbiórkę z okazji jednego z nich.'),
            RankTaskData(text: 'Potrafię wskazać na mapie krainy geograficzne Polski.'),
            RankTaskData(text: 'Wiem, kto jest protektorem ZHP.'),
            RankTaskData(text: 'Znam flagę Unii Europejskiej. Potrafię wymienić kilka państw, które należą do Unii Europejskiej.'),
          ],
        ),
        RankGroupData(
          title: GROUP_TITLE_POZOSTALE,
          icon: RankData.iconKoncowa,
          taskData: [
            RankTaskData(text: 'W okresie próby uczestniczyłem(-am) w realizacji co najmniej czterech zadaniach zespołowych i jednym biwaku.'),
            RankTaskData(text: 'Zdobyłem(-am) w czasie trwania próby przynajmniej trzy sprawności, w tym przynajmniej jedną dwugwiazdkową.'),
          ],
        )
      ]
    )
  ]
);
RankZHPOld rankZhpOld2 = rankZhpOld2Data.build();

RankZHPOldData rankZhpOld3Data = RankZHPOldData(
  titleMale: 'Odkrywca',
  titleFemale: 'Pionierka',
  czasTrw: '9 - 12 miesięcy',
  version: 1,
  org: Org.zhp,
  id: 'HARC_3',
  idea: 'Ocenia siebie i swoje postępowanie odwołując się do Prawa Harcerskiego. Potrafi radzić sobie w różnych sytuacjach. Można na niej lub nim polegać. Jest uczynny(-a), odważny(-a), samodzielny(-a). Wywiązuje się z obowiązków, wynikających z miejsca w drużynie.',
  warOtw: [
    'Zdobył(-a) stopień tropicielki/wywiadowcy. Jeśli nie posiada stopnia tropiciela/wywiadowcy, realizuje próbę pionierki/odkrywcy poszerzoną o wiadomości i umiejętności zawarte w wymaganiach poprzednich stopni.',
    'Aktywnie uczestniczy w życiu zastępu i drużyny.'
  ],
  catData: [
    const RankCatData(
      groupData: [
        RankGroupData(
          title: 'Praca nad sobą',
          icon: RankData.iconPracaNadSoba,
          taskData: [
            RankTaskData(text: 'Określiłem(-am) swoją największą słabość i podejmę próbę wyeliminowania jej.'),
            RankTaskData(text: 'Aktywnie realizuję obowiązki wynikające z mojej wiary.'),
            RankTaskData(text: 'Wykazałem(-am), że potrafię poświęcić własną przyjemność na rzecz obowiązku.'),
            RankTaskData(text: 'Zdobyłem(-am) nową umiejętność przydatną w gospodarstwie domowym.'),
            RankTaskData(text: 'Rzetelnie wykonuję swoje obowiązki domowe.'),
            RankTaskData(text: 'Zapisuję ustalone terminy i wyznaczone zadania, jestem punktualna/ny i obowiązkowa/wy.'),
            RankTaskData(text: 'Wziąłem(-am) udział w zaplanowaniu i zorganizowaniu akcji zarobkowej dla drużyny.'),
            RankTaskData(text: 'Dbam o sprzęt drużyny. Brałem(-am) udział w jego konserwacji.'),
            RankTaskData(text: 'Dbam o zdrowie i pamiętam o aktywnym odpoczynku, odpowiedniej ilości snu, prawidłowym odżywianiu się, umiem radzić sobie z problemami okresu dojrzewania.'),
            RankTaskData(text: 'Załatwiłem(-am) powierzoną mi sprawę w instytucji lub urzędzie.'),
            RankTaskData(text: 'Zorganizowałem(-am) wyjście zastępu lub drużyny (grupy koleżanek lub kolegów) do kina, teatru, na koncert, do muzeum lub inną imprezę kulturalną.'),
            RankTaskData(text: 'Potrafię w prostych sytuacjach porozumieć się w języku obcym.'),
            RankTaskData(text: 'Umiejętnie korzystam z Internetu (wyszukuję potrzebne informacje, posiadam adres e-mail).'),
          ],
        ),
        RankGroupData(
          title: 'Doskonalenie harcerskie',
          icon: RankData.iconTozsHarcerska,
          taskData: [
            RankTaskData(text: 'Potrafię wskazać główne etapy w dziejach harcerstwa.'),
            RankTaskData(text: 'Odwiedziłem(-am) komendę mojego hufca. Znam adres komendy mojej chorągwi i Głównej Kwatery. Wiem, jak nazywa się komendant hufca, komendant chorągwi, Naczelnik ZHP i Przewodniczący ZHP.'),
            RankTaskData(text: 'Wiem, jakie inne organizacje harcerskie działają w Polsce.'),
            RankTaskData(text: 'Czytam książki o tematyce harcerskiej.'),
            RankTaskData(text: 'Znam strukturę ZHP.'),
            RankTaskData(text: 'Potrafię ocenić czynności życiowe (tętno i oddech), znam prawidłowe tętno dzieci i dorosłych. Potrafię postąpić w przypadku utraty przytomności, ułożyć chorego w pozycji bocznej bezpiecznej. Umiem zastosować różne sposoby przenoszenia poszkodowanych. Potrafię postępować w przypadku zatrucia pokarmowego.'),
            RankTaskData(text: 'Odnalazłem(-am) na mapie miejsce, w którym się znajduję, poprowadziłem(-am) w czasie gry terenowej lub wycieczki zastęp wg mapy topograficznej. Na podstawie mapy topograficznej określiłem(-am) długość trasy, nachylenie terenu, przybliżony czas marszu, azymut na dany punkt. Zmierzyłem(-am) w terenie odległość i wysokość.'),
            RankTaskData(text: 'Kierowałem(-am) budową urządzenia obozowego wg własnego projektu. Umiem sprawnie posługiwać się sprzętem pionierskim. Potrafię zawiązać co najmniej 10 węzłów i znam ich zastosowanie.'),
            RankTaskData(text: 'Brałem udział w organizacji wycieczki zastępu lub drużyny.'),
            RankTaskData(text: 'Wyrobiłem(-am) w sobie pożyteczne nawyki ekologiczne (oszczędzam wodę, gaszę światło, segreguję odpady).'),
            RankTaskData(text: 'Wiem, co to jest park narodowy, park krajobrazowy i rezerwat przyrody. Wymienię kilka polskich parków narodowych oraz wskażę występujące w nich osobliwości przyrodnicze. Odwiedziłem(-am) jeden z parków narodowych, krajobrazowych lub rezerwatów.'),
          ],
        ),
        RankGroupData(
          title: 'Poszukiwanie pól służby',
          icon: RankData.iconSluzba,
          taskData: [
            RankTaskData(text: 'Poznaję historię swojej miejscowości. Wiem, co wyróżnia ją spośród innych (np. znane postacie, historyczne wydarzenia, zabytki, sztuka ludowa).'),
            RankTaskData(text: 'Wiem, na czym polega demokracja. Brałem(-am) udział w demokratycznym podejmowaniu decyzji.'),
          ],
        ),
        RankGroupData(
          title: GROUP_TITLE_POZOSTALE,
          icon: RankData.iconKoncowa,
          taskData: [
            RankTaskData(text: 'W okresie próby uczestniczyłem(-am) w obozie lub zimowisku harcerskim oraz w co najmniej dwóch biwakach lub rajdach, zrealizowałem(-am) co najmniej trzy projekty, w tym przynajmniej jeden na rzecz środowiska (np. szkoły, osiedla). Zdobyłem(-am) w tym czasie przynajmniej trzy sprawności (dwugwiazdkowe lub trzygwiazdkowe).'),
          ],
        ),
      ]
    )
  ]
);
RankZHPOld rankZhpOld3 = rankZhpOld3Data.build();

RankZHPOldData rankZhpOld4Data = RankZHPOldData(
  titleMale: 'Ćwik',
  titleFemale: 'Samarytanka',
  czasTrw: '9 - 12 miesięcy',
  version: 1,
  org: Org.zhp,
  id: 'HARC_4',
  idea: 'Poszukuje wzorów do naśladowania zgodnych z harcerskimi wartościami. Szuka sytuacji, w których może pomóc zgodnie z wyrażoną w Przyrzeczeniu szczerą wolą. Pracuje nad swoim charakterem. Poszukuje swoich zainteresowań i pasji. Rozwija je zdobywając wiedzę i umiejętności w wybranych dziedzinach. Współtworzy życie drużyny.',
  warOtw: [
    'Zdobył(-a) stopień pionierki/odkrywcy; jeśli nie posiada stopnia pionierki/odkrywcy, realizuje próbę samarytanki/ćwika poszerzoną o wiadomości i umiejętności zawarte w wymaganiach poprzednich stopni.',
    'Aktywnie uczestniczy w życiu zastępu i drużyny.'
  ],
  catData: [
    const RankCatData(
      groupData: [
        RankGroupData(
          title: 'Praca nad sobą',
          icon: RankData.iconPracaNadSoba,
          taskData: [
            RankTaskData(text: 'Znam swoje dobre strony. Rozwijam je i potrafię je wykorzystać na rzecz innych.'),
            RankTaskData(text: 'Poszukuję autorytetów. Czerpię z nich motywację do pracy nad sobą.'),
            RankTaskData(text: 'Czynnie uczestniczę w formach rozwoju duchowego, np. kuźnica, dyskusja, rekolekcje, pielgrzymka.'),
            RankTaskData(text: 'Racjonalnie organizuję własny czas. Planuje przebieg dnia, tygodnia.'),
            RankTaskData(text: 'Znam zasady dobrego wychowania, potrafię ubrać się odpowiednio do sytuacji.'),
            RankTaskData(text: 'Potrafię korzystać z osiągnięć postępu technicznego, przestrzegam przy tym zasad kultury (np. znam zasady netykiety, wiem, jak korzystać z telefonu komórkowego w miejscach publicznych, kontroluję czas spędzany przy komputerze).'),
            RankTaskData(text: 'Udoskonaliłem(-am) swoją technikę uczenia się lub poprawiłem(-am) oceny z wybranych przedmiotów szkolnych.'),
            RankTaskData(text: 'Systematycznie oszczędzam pieniądze na określony cel.'),
            RankTaskData(text: 'Uczę się języka obcego i potrafię wykorzystać jego znajomość (np. przetłumaczyłem(-am) artykuł, nawiązałem(-am) korespondencję ze skautem lub skautką).'),
            RankTaskData(text: 'Zrobiłem(-am) przegląd swego tygodniowego jadłospisu pod kątem wartości odżywczych, wyciągnąłem(-am) wnioski i wprowadziłem(-am) poprawki na przyszłość. Znam skutki niedożywienia i przejadania się.'),
            RankTaskData(text: 'Potrafię udzielić pierwszej pomocy, w razie potrzeby potrafię zastosować resuscytację (ogól czynności prowadzących do przywrócenia podstawowych czynności życiowych).'),
            RankTaskData(text: 'Włączyłem się do prowadzenia gospodarstwa domowego. W trakcie próby przejąłem na siebie dodatkowe obowiązki.'),
            RankTaskData(text: 'Załatwiłem(-am) sprawy organizacyjne biwaku, wycieczki, obozu (np. zakup biletu zbiorowego, ubezpieczenie, przygotowanie wykazu potrzebnego sprzętu, prowadzenie rachunków).'),
          ],
        ),
        RankGroupData(
          title: 'Doskonalenie harcerskie',
          icon: RankData.iconTozsHarcerska,
          taskData: [
            RankTaskData(text: 'Wyspecjalizowałem(-am) się w wybranej dziedzinie harcerskiej (techniki harcerskie lub inna dziedzina pomocna w pracy drużyny). Kierowałem(-am) projektem dotyczącym tej dziedziny.'),
            RankTaskData(text: 'Przeczytałem(-am) przynajmniej jedną książkę, która pogłębiła moją wiedzę o dziejach ruchu harcerskiego lub skautowego. Zaprezentuję innym (w zastępie, drużynie lub w klasie) wybrane zagadnienie lub znaczącą postać z dziejów harcerstwa.'),
            RankTaskData(text: 'Zorganizowałem(-am) według własnego pomysłu akcję zarobkową w drużynie lub nawiązałem(-am) pożyteczne dla drużyny kontakty (z osobą, instytucją).'),
            RankTaskData(text: 'Znam cele działania Związku Harcerstwa Polskiego.'),
          ],
        ),
        RankGroupData(
          title: 'Poszukiwanie pól służby',
          icon: RankData.iconSluzba,
          taskData: [
            RankTaskData(text: 'Jestem wrażliwa/wy na potrzeby drugiego człowieka – świadomie i odpowiedzialnie podejmuje stałą służbę.'),
            RankTaskData(text: 'Sporządziłem(-am) "mapę potrzeb" występujących w najbliższej okolicy i uczestniczyłem(-am) w projekcie (zadaniu) odpowiadającym na którąś ze wskazanych potrzeb.'),
            RankTaskData(text: 'Orientuję się w bieżących wydarzeniach politycznych, gospodarczych i kulturalnych kraju.'),
            RankTaskData(text: 'Znam najważniejsze prawa i obowiązki obywateli RP.'),
            RankTaskData(text: 'Przeprowadziłaem(-am) zwiad tematyczny (np. poznając przyrodę, kulturę, historię, współczesne życie społeczne i gospodarcze, poznając ciekawe osoby, mało znane miejsca, zapomniane pamiątki historyczne). Sporządziłem(-am) dokumentację zwiadu (zawierającą np. opisy, wywiady, pamiątki, fotografie, spis lektur na wybrany temat). W interesujący sposób przedstawiłem(-am) ją w drużynie.'),
          ],
        ),
        RankGroupData(
          title: GROUP_TITLE_POZOSTALE,
          icon: RankData.iconKoncowa,
          taskData: [
            RankTaskData(text: 'W okresie próby uczestniczyłem(-am) w co najmniej trzech projektach. W czasie próby zdobyłem(-am) co najmniej trzy sprawności (dwugwiazdkowe i trzygwiazdkowe).'),
          ],
        ),
      ]
    )
  ]
);
RankZHPOld rankZhpOld4 = rankZhpOld4Data.build();

RankZHPOldData rankZhpOld5Data = RankZHPOldData(
  titleMale: 'Harcerz Orli',
  titleFemale: 'Harcerka Orla',
  czasTrw: '12 – 18 miesięcy',
  version: 1,
  org: Org.zhp,
  id: 'HARC_5',
  idea: 'Kierując się Prawem Harcerskim buduje swój własny system wartości. Sam(-a) wyznacza swoje cele. Wybiera swoją drogę życiową. Dąży do mistrzostwa w wybranych dziedzinach. Podejmuje wyzwania. Znajduje pole stałej służby.',
  warOtw: [
    'Zdobył(-a) stopień samarytanki/ćwika. Jeśli nie posiada stopnia samarytanki/ćwika, realizuje próbę HO poszerzoną o wiadomości i umiejętności zawarte w wymaganiach poprzednich stopni.',
    'Aktywnie uczestniczy w życiu drużyny.',
    'Zrealizował(-a) próbę wędrowniczą i otrzymała/ał naramiennik wędrowniczy.',
    'Wspólnie z opiekunem przygotował(-a) indywidualny program próby.'
  ],
  catData: [
    const RankCatData(
      groupData: [
        RankGroupData(
          title: 'Siła ciała',
          icon: RankData.iconSilaCiala,
          taskData: [
            RankTaskData(text: 'Prowadzę higieniczny tryb życia i doskonalę swoją sprawność fizyczną. Znam granice swojej wytrzymałości fizycznej.'),
            RankTaskData(text: 'Zaplanowałem(-am) i zorganizowałem(-am) wędrówkę o charakterze wyczynu.'),
          ],
        ),
        RankGroupData(
          title: 'Siła rozumu',
          icon: RankData.iconSilaRozumu,
          taskData: [
            RankTaskData(text: 'Samodzielnie planuję swój czas. Znam podstawowe zasady dobrego planowania czasu.'),
            RankTaskData(text: 'Rozsądnie gospodaruję własnymi i powierzonymi zasobami finansowymi. Opracowałem(-am) sposób sfinansowania wybranego przedsięwzięcia i zrealizowałem(-am) go.'),
            RankTaskData(text: 'Pogłębiam swoją wiedzę i umiejętności w różnych dziedzinach aktywności (nauka i kultura).'),
            RankTaskData(text: 'Znalazłem(-am) dziedzinę, w której chcę osiągnąć mistrzostwo. Mam już w niej osiągnięcia.'),
          ],
        ),
        RankGroupData(
          title: 'Siła ducha',
          icon: RankData.iconSilaDucha,
          taskData: [
            RankTaskData(text: 'Na podstawie Prawa Harcerskiego buduję swój system wartości. Potrafię otwarcie i konsekwentnie go bronić.'),
            RankTaskData(text: 'Samodzielnie podejmuję stałą służbę w dziedzinie życia duchowego.'),
            RankTaskData(text: 'Staram się zrozumieć innych i uznaję ich prawo do odmienności. Poznałem(-am) kilka kultur (np. narodowych, wyznaniowych).'),
            RankTaskData(text: 'Staram się żyć w harmonii z naturą.'),
            RankTaskData(text: 'Pielęgnuję więzi rodzinne.'),
            RankTaskData(text: 'Znalazłem(-am) swoje miejsce w grupie rówieśniczej (dokonując świadomych wyborów i zachowując własny system wartości).'),
            RankTaskData(text: 'Pokonałem(-am) jedną ze swoich słabości.'),
            RankTaskData(text: 'Dziedziny swoich zainteresowań porównałem(-am) z potrzebami środowiska. W ten sposób określiłem(-am) swoje pole służby. Pełniłem(-am) służbę przez wyznaczony czas.'),
          ],
        ),
      ]
    )
  ]
);
RankZHPOld rankZhpOld5 = rankZhpOld5Data.build();

RankZHPOldData rankZhpOld6Data = RankZHPOldData(
  titleMale: 'H-rz Rzeczypospolitej',
  titleFemale: 'H-ka Rzeczypospolitej',
  czasTrw: '12–24 miesiące',
  version: 1,
  org: Org.zhp,
  id: 'HARC_6',
  idea: 'Ma własny system wartości wynikający z Prawa Harcerskiego. Kieruje się nim we wszystkich aspektach swojego życia. Potrafi godzić pełnione przeze siebie role, np. w rodzinie, w szkole, w pracy, w działalności społecznej. Osiąga mistrzostwo w wybranych dziedzinach aktywności. Jest świadomym obywatelem RP. Swoim życiem daje świadectwo o harcerstwie.',
  warOtw: [
    'Zdobył(-a) stopień HO.',
    'Wspólnie z opiekunem przygotował(-a) indywidualny program swojej próby.'
  ],
  catData: [
    const RankCatData(
      groupData: [
        RankGroupData(
          taskData: [
            RankTaskData(
              text: 'Indywidualne zadania próby HR harcerka lub harcerz buduje zgodnie z trzema wymienionymi kierunkami pracy wędrowniczej. W pracy nad sobą umacnia swoje zalety i niweluje wady oraz słabości. Dba o zdrowie i kondycję fizyczną. Rozwija swoją osobowość przez udział w różnych formach życia duchowego i kulturalnego. Pełni stałą służbę, która przynosi wymierne efekty. Poszukując swojego miejsca w społeczeństwie, konsekwentnie realizuje swój pomysł na życie: w nauce i w pracy, w rodzinie, rozwijając pasje i zainteresowania. Zna swoje prawa i obowiązki, wynikające z pełnionych ról społecznych, stara się wywiązywać z nich jak najlepiej. Wie, na czym opiera się system państwa prawa, zna w nim swoje miejsce. Szuka drogi osiągnięcia samodzielności ekonomicznej.',
              checkable: false
            ),
          ],
        ),
      ]
    )
  ]
);
RankZHPOld rankZhpOld6 = rankZhpOld6Data.build();
