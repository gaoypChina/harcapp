
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models/rank_def.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models/rank_zhr_d.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_task.dart';

import '../rank_tile_widget.dart';

const _GROUP_TITLE_WIEDZA_HARCERSKA = 'Wiedza harcerska';
const _GROUP_TITLE_WIEDZA_O_POLSCE = 'Wiedza o Polsce';
const _GROUP_TITLE_ZNAJOMOSC_MALEJ_OJCZYZNY = 'Znajomość "małej ojczyzny"';

const String _GROUP_TITLE_ROZWOJ_INTELEKTUALNY = 'Rozwój intelektualny';
const String _GROUP_TITLE_ROZWOJ_FIZYCZNY = 'Rozwój fizyczny';
const String _GROUP_TITLE_ROZWOJ_WSPOLNOTA = 'Wspólnota';
const String _GROUP_TITLE_ROZWOJ_SPOL_PATR_OBYW = 'Rozwój społeczny, patriotyczny, obywatelski';

RankDefData rankZhrZuchD1Data = RankDefData(
    titleMale: 'Zuch wtajemniczony',
    version: 1,
    org: Org.zhr_d,
    id: 'ZUCH_D_1',
    catData: [
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_1,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_1,
                taskData: [
                  RankTaskData(text: 'Jest pogodny i koleżeński.'),
                  RankTaskData(text: 'Zna Modlitwę Zuchową.'),
                  RankTaskData(text: 'Uczestniczy w obrzędach religijnych.'),
                  RankTaskData(text: 'Codziennie stara się czynić coś dobrego.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_2,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_2,
                taskData: [
                  RankTaskData(text: 'Zna symbole narodowe, umie się wobec nich zachować.'),
                  RankTaskData(text: 'Zna najbliższą okolice i umie wskazać drogę do najważniejszych miejsc.'),
                  RankTaskData(text: 'Dobrze mówi po polsku - nie kaleczy języka brzydkimi wyrazami.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_3,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_3,
                taskData: [
                  RankTaskData(text: 'Obserwuje przyrodę w najbliższym otoczeniu. Potrafi dostrzec zachodzące zmiany.'),
                  RankTaskData(text: 'Był z gromada w lesie, na łące, w parku. Dostrzega różnorodność zwierząt i roślin.'),
                  RankTaskData(text: 'Nie niszcząc przyrody, wykonał majsterkę z darów lasu.')
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_4,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_4,
                taskData: [
                  RankTaskData(text: 'Dba o higienę osobistą i zachowuje porządek wokół siebie.'),
                  RankTaskData(text: 'Stara się zdobywać nowe, pożyteczne umiejętności przydatne w domu i otoczeniu.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_5,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_5,
                taskData: [
                  RankTaskData(text: 'Zna symbole i zwyczaje gromady.'),
                  RankTaskData(text: 'Jest aktywny fizycznie.'),
                  RankTaskData(text: 'Chętnie uczestniczy w zajęciach w grupie, nie kłóci się z rówieśnikami.'),
                  RankTaskData(text: 'Bez ociągania wykonuje polecenia swoich przełożonych.'),
                ]
            )
          ]
      )
    ]
);
RankDef rankZhrZuchD1 = rankZhrZuchD1Data.build();

RankDefData rankZhrZuchD2Data = RankDefData(
    titleMale: 'Zuch zaradny',
    version: 1,
    org: Org.zhr_d,
    id: 'ZUCH_D_2',
    catData: [
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_1,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_1,
                taskData: [
                  RankTaskData(text: 'Stara się przezwyciężać wybraną przez siebie wadę lub słabość.'),
                  RankTaskData(text: 'Pamięta o codziennej modlitwie.'),
                  RankTaskData(text: 'Darzy szacunkiem starszych, słucha rodziców.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_2,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_2,
                taskData: [
                  RankTaskData(text: 'Przykłada się do nauki.'),
                  RankTaskData(text: 'Zna zabytki, legendy, fakty historyczne dotyczące miejscowości (okolicy).'),
                  RankTaskData(text: 'Poszukuje ciekawostek z różnych dziedzin.'),
                  RankTaskData(text: 'Umie się zachować w miejscu pamięci narodowej i wobec sztandaru.')
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_3,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_3,
                taskData: [
                  RankTaskData(text: 'Umie przygotować się do wycieczki.'),
                  RankTaskData(text: 'Stara się tropić życie przyrody.'),
                  RankTaskData(text: 'Podjął się pożytecznej pracy na rzecz środowiska.'),
                  RankTaskData(text: 'Opiekuje się zwierzątkiem lub rośliną.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_4,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_4,
                taskData: [
                  RankTaskData(text: 'Dba o swoje rzeczy.'),
                  RankTaskData(text: 'Wyręcza rodziców w drobnych pracach domowych, pomaga rodzeństwu.'),
                  RankTaskData(text: 'Stara się prowadzić zdrowy tryb życia.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_5,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_5,
                taskData: [
                  RankTaskData(text: 'Poprowadził na zbiórce grę, zabawę, pląs lub nauczyła piosenki. Przygotował wcześniej odpowiedni element lub rekwizyt.'),
                  RankTaskData(text: 'Trenuje, ćwiczy.'),
                  RankTaskData(text: 'Próbuje swoich sił w różnych dziedzinach artystycznych (śpiewanie, granie na instrumencie, malowanie itd.).'),
                  RankTaskData(text: 'Współpracuje z rówieśnikami.'),
                ]
            )
          ]
      )
    ]
);
RankDef rankZhrZuchD2 = rankZhrZuchD2Data.build();

RankDefData rankZhrZuchD3Data = RankDefData(
    titleMale: 'Zuch opiekuńczy',
    version: 1,
    org: Org.zhr_d,
    id: 'ZUCH_D_3',
    catData: [
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_1,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_1,
                taskData: [
                  RankTaskData(text: 'Można na nim polegać.'),
                  RankTaskData(text: 'Dostrzega potrzeby innych i stara się na nie odpowiedzieć.'),
                  RankTaskData(text: 'Poprowadzi modlitwę wśród zuchów.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_2,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_2,
                taskData: [
                  RankTaskData(text: 'Potrafi wskazać Polskę na mapie świata (jej najważniejsze miasta, rzeki, pasma górskie itp.).'),
                  RankTaskData(text: 'Wie czym jest UE i poznaje miejsce Polski w niej.'),
                  RankTaskData(text: 'Poszerza wybrana dziedzinę wiedzy.'),
                  RankTaskData(text: 'Obchodzi święta narodowe.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_3,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_3,
                taskData: [
                  RankTaskData(text: 'Umie zachować się w lesie.'),
                  RankTaskData(text: 'Potrafi dostrzec walory i potrzeby przyrody. Pomaga przyrodzie zgodnie z jej potrzebami.'),
                  RankTaskData(text: 'Stara się żyć w sposób ekologiczny.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_4,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_4,
                taskData: [
                  RankTaskData(text: 'Ma stały przydział obowiązków i się z nich wywiązuje.'),
                  RankTaskData(text: 'Pomógł w przygotowaniu uroczystości rodzinnej, spotkania.'),
                  RankTaskData(text: 'Jest posłuszny rodzicom.'),
                ]
            ),
          ]
      ),
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_5,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_5,
                taskData: [
                  RankTaskData(text: 'Wywiązuje się ze swojej funkcji w gromadzie (np. szóstkowego, kronikarza, strażnika totemu).'),
                  RankTaskData(text: 'Rozwija umiejętności artystyczne, tworzy własne dzieła.'),
                  RankTaskData(text: 'Wie, kiedy powstały pierwsze gromady zuchowe, czym się wówczas zajmowały.'),
                  RankTaskData(text: 'Poznał harcerzy z bratniej drużyny, podpatrzył ich zwyczaje.'),
                  RankTaskData(text: 'Wtajemniczył innego zucha w obrzędowość gromady, podzielił się swoją wiedzą.'),
                ]
            )
          ]
      )
    ]
);
RankDef rankZhrZuchD3 = rankZhrZuchD3Data.build();


RankZHRDData rankZhrHarcD0Data = RankZHRDData.from(
    title: 'Próba harcerki',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_0',
    minWiek: '–',
    czasTrw: 'do 1.5 roku',
    zalozenia: null,
    punktWyjsc: null,
    wskazowki: null,
    sylwetka: null,

    postawaItems: [
      const RankTaskData(text: 'Wie, że chce zostać harcerką, akceptuje zasady życia panujące w drużynie.'),
      const RankTaskData(text: 'Jest przygotowana na to, co może ją spotkać, zawsze ma przy sobie:'
          '\n- legitymację szkolną,'
          '\n- bilety komunikacji miejscowej,'
          '\n- długopis lub ołówek i kartkę papieru do pisania,'
          '\n- zapałki,'
          '\n- igłę z nitką,'
          '\n- agrafki,'
          '\n- zapasowe guziki.'
      )
    ],
    wiedzaHarcItems: [
      const RankTaskData(text: 'Zna pełną nazwę drużyny, jej podstawowe zwyczaje i obrzędy.'),
      const RankTaskData(text: 'Wie, co oznaczał w tradycji harcerskiej węzełek lub suwak na chuście i stara się w swoim życiu postępować zgodnie z tą ideą.'),
      const RankTaskData(text: 'Zna imię i nazwisko drużynowej i zastępowej, potrafi skontaktować się z nimi (zna ich numery telefonów/adresy domowe/adresy mailowe). Zna sieć alarmową zastępu.'),
      const RankTaskData(text: 'Umie przywitać się i zameldować po harcersku.'),
      const RankTaskData(text: 'Skompletowała mundur harcerski i utrzymuje go w stałej gotowości.'),
      const RankTaskData(text: 'Założyła dzienniczek/notatnik i śpiewniczek harcerski.'),
    ],
    umiejetnosci: null,
    doswiadczenieItems: [
      const RankTaskData(text: 'Systematycznie uczestniczy w pracy zastępu i drużyny.'),
    ],
    catData: null
);
RankZHRD rankZhrHarcD0 = rankZhrHarcD0Data.build();

RankZHRDData rankZhrHarcD0WData = RankZHRDData.from(
    title: 'Próba harcerki-wędrowniczki',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_0W',
    minWiek: '–',
    czasTrw: 'do 1.5 roku',
    zalozenia: null,
    punktWyjsc: null,
    wskazowki: null,
    sylwetka: null,
    postawaItems: [
      const RankTaskData(text: 'Rozumie Przyrzeczenie i Prawo Harcerskie, dobrze je interpretuje i posiada odwagę realizowania ich w każdym środowisku.'),
      const RankTaskData(text: 'Rozpoczęła zdobywanie naramiennika wędrowniczego.'),
      const RankTaskData(text:
      'Jest przygotowana na to, co może ją spotkać, zawsze ma przy sobie:'
          '\n- długopis lub ołówek i kartkę papieru do pisania,'
          '\n- zapałki,'
          '\n- igłę z nitką,'
          '\n- agrafki,'
          '\n- zapasowe guziki.'
      ),
    ],
    wiedzaHarcItems: [
      const RankTaskData(text: 'Zna Prawo i Przyrzeczenie Harcerskie, zapoznała się z dokumentem "Podstawowe zasady wychowania harcerskiego w ZHR".'),
      const RankTaskData(text: 'Zna hymn harcerski i modlitwę harcerską.'),
      const RankTaskData(text: 'Umie przywitać się i zameldować po harcersku.'),
      const RankTaskData(text: 'Skompletowała mundur harcerski i traktuje go z szacunkiem.'),
    ],
    umiejetnosci: null,
    doswiadczenieItems: [
      const RankTaskData(text: 'Systematycznie uczestniczy w pracy drużyny.')
    ],
    catData: null
);
RankZHRD rankZhrHarcD0W = rankZhrHarcD0WData.build();

RankZHRDData rankZhrHarcD0SData = RankZHRDData.from(
    title: 'Próba harcerki starszej',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_0S',
    minWiek: '–',
    czasTrw: 'do 1.5 roku',
    zalozenia: null,
    punktWyjsc: null,
    wskazowki: null,
    sylwetka: null,
    postawaItems: [
      const RankTaskData(text: 'Rozumie Przyrzeczenie i Prawo Harcerskie, dobrze je interpretuje i posiada odwagę realizowania ich w każdym środowisku.'),
      const RankTaskData(text: 'Realizuje przynajmniej jedno zobowiązanie starszoharcerskie.'),
      const RankTaskData(text: 'Pełni służbę.'),
      const RankTaskData(text:
      'Jest przygotowana na to, co może ją spotkać, zawsze ma przy sobie:'
          '\n- długopis lub ołówek i kartkę papieru do pisania,'
          '\n- zapałki,'
          '\n- igłę z nitką,'
          '\n- agrafki,'
          '\n- zapasowe guziki.'
      )
    ],
    wiedzaHarcItems: [
      const RankTaskData(text: 'Zna Prawo i Przyrzeczenie Harcerskie, zapoznała się z dokumentem "Podstawowe zasady wychowania harcerskiego w ZHR".'),
      const RankTaskData(text: 'Zna hymn harcerski i modlitwę harcerską.'),
      const RankTaskData(text: 'Zna i rozumie strukturę organizacyjną ZHR, utrzymuje kontakt z bezpośrednią przełożoną.'),
      const RankTaskData(text: 'Skompletowała mundur harcerski i traktuje go z szacunkiem.'),
    ],
    umiejetnosci: null,
    doswiadczenieItems: [
      const RankTaskData(text: 'Systematycznie uczestniczy w pracy środowiska harcerskiego.'),
      const RankTaskData(text: 'Współpracuje ze środowiskiem starszoharcerskim lub instruktorskim.'),
      const RankTaskData(text: 'Wzięła udział w przedsięwzięciu harcerskim typu rajd, zlot itp.'),
    ],
    catData: null
);
RankZHRD rankZhrHarcD0S = rankZhrHarcD0SData.build();

RankZHRDData rankZhrHarcD1Data = RankZHRDData.from(
    title: 'Ochotniczka',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_1',
    minWiek: '11 – 13 lat',
    czasTrw: 'do 1.5 roku',
    zalozenia: null,
    punktWyjsc: null,
    wskazowki: 'Dziewczynka zdobywająca ochotniczkę stara się realizować stawiane przed nią zadania i choć nie zawsze jej się to udaje, to jest chętna i pełna zapału. Na jej etapie psychorozwoju wymagamy od niej konkretnych działań, także w dziedzinie postawy. W tym wieku u dziecka jeszcze nie rozwinęło się myślenie abstrakcyjne, ale jest to okres niespożytej energii, dlatego też podczas realizowania próby na stopień harcerka musi mieć dużo okazji do jej wykorzystania. Uczymy pewnych zachowań, którymi chcemy, by harcerka kierowała się w swoim życiu przez kolejne lata, nawet jeśli odejdzie z drużyny. Stopień ten, jak i wszystkie inne realizowane w drużynie (tropicielka, samarytanka), powinien być zdobywany obrzędowo. Jednak w tym przypadku jest to szczególnie istotne ze względu na wiek harcerki. Próba na stopień ochotniczki powinna trwać rok i opierać się w dużej mierze na zbiórkach zastępu. Za realizację próby na stopień odpowiedzialna jest drużynowa, jednak kluczowa w tym procesie jest rola zastępowej. To właśnie ona w planie pracy zastępu powinna zawrzeć takie zbiórki i takie zadania międzyzbiórkowe, aby zdobywanie stopnia przebiegało w sposób naturalny.',
    sylwetka: 'Ochotniczka to harcerka, która czerpie radość z każdej przygody, jest pomocna i obowiązkowa w przychodzeniu na zbiórki. Chętnie podporządkowuje się normom, a do bycia w drużynie często motywuje ją posiadanie starszych koleżanek. W drużynie jest szeregową lub pełni jakąś niewielką funkcję niewymagającą samodzielności.'
        '\n\nZdobycie stopnia ochotniczki kończy się złożeniem Przyrzeczenia Harcerskiego.'
        '\n\nOchotniczka po ukończeniu próby na stopień posiada podstawową wiedzę z technik harcerskich. Zna i rozumie Prawo Harcerskie. Systematycznie uczestniczy w praktykach religijnych Kościoła. Zna i czuje ideę harcerstwa. Rozumie, czym jest patriotyzm. Podjęła z zastępem służbę. Cechuje ją dobra pamięć i wyostrzone zmysły. Znalazła już swoje zainteresowania. Jest aktywną harcerką – uczestniczy w zbiórkach drużyny, biwakach, obozie. Bierze udział w uroczystościach patriotycznych i kościelnych.',
    postawa: [

      const RankGroupData(
          title: GROUP_TITLE_OGOLNE,
          taskData: [
            RankTaskData(text:
            'Uczestniczy w życiu religijnym rodziny (środowiska).'
            ),
            RankTaskData(text:
            'Rozumie, do czego zobowiązuje ją Prawo Harcerskie w codziennym życiu. Potrafi oprzeć się tym, którzy namawiają ją do złego.'
            ),
          ]
      ),

      const RankGroupData(
          title: 'Praca nad sobą',
          taskData: [
            RankTaskData(text:
            'Każdego dnia bierze udział w dowolnych zajęciach ruchowych, średnio pół godziny dziennie.'
            ),
            RankTaskData(text:
            'Wzięła udział w organizowanych zawodach sportowych.'
            ),
            RankTaskData(text:
            'Bierze udział w grach terenowych.'
            ),
            RankTaskData(text:
            'Ćwiczy sprawność zmysłów.'
            ),
            RankTaskData(text:
            'Utrzymuje w czystości swoje ciało, ma zawsze czyste ręce.'
            ),
            RankTaskData(text:
            'Ubiera się schludnie, odpowiednio do sytuacji i pogody.'
            ),
            RankTaskData(text:
            'Jest koleżeńska w stosunku do rówieśników, wrażliwa na potrzeby innych.'
            ),
            RankTaskData(text:
            'Jest wrażliwa na otaczającą ją przyrodę.'
            ),
            RankTaskData(text:
            'Dba o środowisko, które ją otacza.'
            )
          ]
      ),

      const RankGroupData(
          title: 'Dom',
          taskData: [
            RankTaskData(text:
            'Zna daty ważnych uroczystości rodzinnych, pomaga w ich przygotowaniu.'
            ),
            RankTaskData(text:
            'Umie sama przygotować sobie posiłek.'
            ),
            RankTaskData(text:
            'Dba o porządek w swoim pokoju lub kąciku.'
            ),
          ]
      ),

      const RankGroupData(
          title: 'Drużyna, zastęp',
          taskData: [
            RankTaskData(text:
            'Dba o sprzęt obozowy, biwakowy.'
            ),
            RankTaskData(text:
            'Dba o wspólne dobro drużyny.'
            ),
            RankTaskData(text:
            'Nie stroni od pracy, gdy inni w zastępie pracują; jeśli nie umie czegoś wykonać, stara się tego nauczyć.'
            ),
          ]
      ),

      const RankGroupData(
          title: 'Posłuszeństwo',
          taskData: [
            RankTaskData(text:
            'Stara się być posłuszna swoim rodzicom i przełożonym.'
            ),
            RankTaskData(text:
            'Jest punktualna.'
            )
          ]
      ),

      const RankGroupData(
          title: 'Szkoła',
          taskData: [
            RankTaskData(text:
            'Poważnie traktuje swoje obowiązki szkolne.'
            ),
            RankTaskData(text:
            'Mówi ładnie i poprawnie po polsku.'
            )
          ]
      ),

      const RankGroupData(
          title: 'Praca',
          taskData: [
            RankTaskData(text:
            'Każdą pracę wykonuje rzetelnie, tak aby przyniosła innym pożytek.'
            ),
            RankTaskData(text:
            'Pogodnie podchodzi do powierzonych zadań.'
            ),
            RankTaskData(text:
            'Ma swoje stałe obowiązki domowe i wywiązuje się z nich.'
            )
          ]
      )
    ],
    wiedzaHarc: [
      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_HARCERSKA,
        taskData: [
          RankTaskData(text: 'Zna symbolikę Krzyża Harcerskiego, lilijki, koniczynki, hasła "Czuwaj".'),
          RankTaskData(text: 'Wykaże się znajomością początków ruchu skautowego i biografii jego założyciela.'),
          RankTaskData(text: 'Zna historię powstania harcerstwa, tradycje, na których się ono opiera, postać założycielki i założyciela.'),
          RankTaskData(text: 'Zna losy harcerek i harcerzy w czasie II wojny światowej.'),
          RankTaskData(text: 'Zna hymn harcerski, modlitwę harcerską i pieśni obrzędowe drużyny.'),
          RankTaskData(text: 'Zna Prawo i Przyrzeczenie Harcerskie.'),
        ],
      ),

      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_O_POLSCE,
        taskData: [
          RankTaskData(text: 'Zna i śpiewa hymn narodowy, wie, jak się zachować przy jego śpiewaniu.'),
          RankTaskData(text: 'Zna symbolikę flagi i godła narodowego.'),
          RankTaskData(text: 'Posiada flagę Polski, wie, kiedy ją wywiesić i pamięta o tym obowiązku.'),
        ],
      )
    ],
    umiejetnosci: [
      const RankGroupData(
        title: 'Musztra',
        taskData: [
          RankTaskData(text: 'Zna zasady musztry indywidualnej. Wie, jak zachować się podczas apelu.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności obozowe',
        taskData: [
          RankTaskData(text: 'Potrafi samodzielnie, w dobrym tempie rozwinąć i zwinąć namiot 2-osobowy.'),
          RankTaskData(text: 'Potrafi bezpiecznie rozpalić ognisko, a także bezpiecznie je ugasić i zamaskować.'),
          RankTaskData(text: 'Sprawnie posługuje się w pracach pionierskich piłą, siekierą, saperką.'),
          RankTaskData(text: 'Zna przynajmniej 4 węzły i co najmniej 2 z nich stosuje w pracach pionierskich i zdobnictwie obozowym.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności przyrodnicze',
        taskData: [
          RankTaskData(text: 'Potrafi wymienić, opisać i rozpoznać 10 ssaków, 10 ptaków i 10 gatunków drzew.'),
          RankTaskData(text: 'Potrafi rozpoznać 5 gatunków roślin i 5 gatunków zwierząt chronionych.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności komunikacyjne',
        taskData: [
          RankTaskData(text: 'Potrafi znaleźć potrzebną informację oraz przekazać ją dalej (e-mail, sms). Wie, jak bezpiecznie i kulturalnie korzystać z możliwości Internetu.'),
          RankTaskData(text: 'Na zbiórce lub ognisku prawidłowo zrelacjonuje przebieg wycieczki lub wykonane zadanie.'),
          RankTaskData(text: 'Wie, gdzie najbliżej jej miejsca zamieszkania znajdują się: ośrodek zdrowia, komisariat, poczta, apteka. Potrafi wytłumaczyć potrzebującej osobie, jak dotrzeć do tych miejsc.'),
          RankTaskData(text: 'Potrafi zaadresować list, wypełnić blankiet pocztowy.'),
          RankTaskData(text: 'Potrafi wysłać e-maila z załącznikiem.'),
          RankTaskData(text: 'Zna proste szyfry i umie je stosować.'),
          RankTaskData(text: 'Umie podążać za znakami patrolowymi.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności terenowe',
        taskData: [
          RankTaskData(text: 'Umie wyznaczać strony świata wg busoli, Słońca i znaków terenowych.'),
          RankTaskData(text: 'Zna wymiary swojego ciała i umie je zastosować do wyznaczania długości.'),
          RankTaskData(text: 'Podczas wycieczki poprowadzi grupę na krótkim odcinku drogi według mapy, umie pokazać na mapie przebytą trasę i aktualne miejsce postoju.'),
        ],
      ),
      const RankGroupData(
        title: 'Umiejętności samarytańskie',
        taskData: [
          RankTaskData(text: 'Dowie się, co powinna zawierać, apteczka osobista i ją skompletuje. Będzie umiała z niej skorzystać i zaradzić w przypadku drobnych urazów.'),
          RankTaskData(text: 'Pamięta o tym, że w nagłych wypadkach najważniejsze jest bezpieczeństwo własne; wie, jak o nie zadbać. Potrafi wezwać pogotowie ratunkowe, straż pożarną, policję. Wie, co to jest ICE.'),
        ],
      )
    ],
    doswiadczenieItems: [
      const RankTaskData(text: 'Bierze czynny udział w pracy zastępu i drużyny.'),
      const RankTaskData(text: 'Weźmie udział w wycieczce.'),
      const RankTaskData(text: 'Weźmie udział w biwaku.'),
      const RankTaskData(text: 'Weźmie udział w obozie lub zimowisku.'),
      const RankTaskData(text: 'Weźmie udział w służbie społecznej z zastępem dla innych.'),
      const RankTaskData(text: 'Weźmie udział w obchodach Święta Narodowego.'),
      const RankTaskData(text: 'W czasie realizacji próby na stopień zdobyła przynajmniej 5 sprawności z różnych dziedzin.'),
    ],
    catData: null
);
RankZHRD rankZhrHarcD1 = rankZhrHarcD1Data.build();

RankZHRDData rankZhrHarcD2Data = RankZHRDData.from(
    title: 'Tropicielka',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_2',
    minWiek: '13 – 16 lat',
    czasTrw: 'do 1.5 roku',
    zalozenia: null,
    punktWyjsc: null,
    wskazowki: 'Tropicielka to druhna, która kończy szkołę podstawową i rozpoczyna gimnazjum. Poznała już harcerski styl życia i polubiła go. Ciągle szuka czegoś nowego i TROPI, by lepiej poznać znane sobie rzeczy. Pokazała, że chce być harcerką, a teraz pragnie się dalej rozwijać.'
        '\n\nWraz ze zmianami fizycznymi okresu dojrzewania (ok. 13–14 lat) harcerka zaczyna bardziej interesować się swoim ciałem, m.in. również seksualnością. Pojawia się brak równowagi emocjonalnej, który łączy się z przeżywaniem samotności, a co za tym idzie poszukiwaniem przyjaźni. Niestałość emocjonalna przekłada się też na niestałość duchową.'
        '\n\nTropicielka jest już harcerką od jakiegoś czasu i czuje się w drużynie kimś ważnym. Często zdobycie tego stopnia wiąże się z nową funkcją – podzastępowej, zastępowej – ponieważ harcerka w tym wieku powinna ćwiczyć odpowiedzialność. Jeśli jest zastępową lub podzastępową, dba o zdobywanie stopnia ochotniczki przez swoje podopieczne, co pozwala jej na większą refleksję nad własnym stopniem.'
        '\n\nPróba tropicielki nie może przedłużać się aż do III klasy gimnazjum, ponieważ w tym wieku harcerka powinna już zacząć zdobywać samarytankę. Harcerka, która kończy szkołę podstawową i zaczyna naukę w gimnazjum, choć wciąż jest dzieckiem, to jednak ma poczucie, że ten etap jej życia jest już prawie zakończony. Kiedy stanie się starszą nastolatką (ok. 16 lat), będzie zbyt dorosła, żeby zdobywać stopień tropicielki. Warto jednak pamiętać, że tropicielka to wciąż młoda osoba, która potrzebuje też beztroskiej zabawy. Dlatego trzeba zadbać o to, by zbytnio nie obciążać obowiązkami harcerek zdających do gimnazjum, ponieważ jest to dla nich trudny czas.'
        '\n\nHarcerka zdobywająca stopień tropicielki zna obowiązujący w harcerstwie system wartości, wie, co nie jest akceptowane, i w razie potrzeby broni właściwej postawy. Na tyle wrosła w swoją drużynę, że szuka w niej ostoi i wsparcia, ale ma też świadomość odpowiedzialności wynikającej z konieczności dawania własnego przykładu młodszym harcerkom.'
        '\n\nPodobnie jak w przypadku stopnia ochotniczki, zdobywanie tropicielki powinno być ściśle związane z aktywnym uczestnictwem harcerki w pracy drużyny.',
    sylwetka: 'Tropicielka to druhna, która powoli staje się wzorem do naśladowania dla młodszych harcerek, i stara się być im pomocna. Posiada wiedzę z każdej dziedziny życia harcerskiego. Wykazała się odpowiedzialnością za siebie i za powierzone jej zadania w drużynie, które mają przygotować ją do podjęcia odpowiedzialności za zespół. Poznała i przyjęła Prawo Harcerskie. Stara się zgodnie z nim postępować. Dostrzega związek między Dekalogiem a Prawem Harcerskim. Odkrywa znaczenie praktyk religijnych, szuka odpowiedniej dla niej metody modlitwy osobistej, która będzie rozmową z Bogiem – Przyjacielem. W otaczającym świecie, w przyrodzie odkrywa Boga jako Stwórcę. Poznaje swoją kobiecość, dba o swój wygląd. Szuka autorytetów wśród świętych. Doświadczyła obozowego życia i posiada wiedzę i umiejętności z dziedziny technik harcerskich. Potrafi pogodzić działalność w drużynie z codziennymi obowiązkami w domu i szkole. Realizuje swoje pasje. Stara się nazywać swoje emocje i szuka sposobów radzenia sobie z nimi. Rozumie potrzebę aktywności fizycznej.',
    postawaItems: [
      const RankTaskData(text: 'Potrafi odnieść sytuacje życiowe do Prawa Harcerskiego.'),
      const RankTaskData(text: 'Obserwuje swoje nastroje i uczucia (radość, gniew, smutek, żal, zazdrość, duma, osamotnienie, bezradność, oczarowanie, zakochanie, bunt, lęk itp.). Analizuje ich wpływ na własne życie, potrafi je nazwać.'),
      const RankTaskData(text: 'Odkrywa w swoim życiu działanie Boga.'),
      const RankTaskData(text: 'Rozwija swoją wiedzę religijną, szuka odpowiedzi na nurtujące ją pytania.'),
      const RankTaskData(text: 'Poznała przemiany, jakie następują u nastolatki i nastolatka w sferze fizycznej i uczuciowo-emocjonalnej (miesięczny cykl biologiczny, nastroje, samopoczucie, możliwości i potrzeby organizmu) na podstawie rzetelnych źródeł.'),
      const RankTaskData(text: 'Dba o siebie, stosuje zasady profilaktyki zdrowotnej'),
      const RankTaskData(text: 'Czyta książki, zachęci inną osobę do przeczytania jednej z nich i uzasadni swój wybór.'),
      const RankTaskData(text: 'Mądrze korzysta z czasopism, telewizji i Internetu, dokonując wyboru artykułów, audycji i pożytecznych stron WWW (ciekawych, kształcących, odprężających).'),
      const RankTaskData(text: 'Utrzymuje porządek w swoich rzeczach, umie zagospodarować swoją przestrzeń.'),
      const RankTaskData(text: 'Regularnie poświęca czas obowiązkom, stara się nie wykonywać zadań na ostatnią chwilę.'),
      const RankTaskData(text: 'Planuje swój czas, tak by jego część poświęcić na stałe obowiązki domowe.'),
      const RankTaskData(text: 'Nawiązuje więzi przyjaźni i podtrzymuje je.'),
      const RankTaskData(text: 'Umie wytropić dobro w każdej osobie, często obdarowuje innych pochwałą i przyjacielskim gestem.'),
      const RankTaskData(text: 'Szanuje innych ludzi, pomaga im, kiedy tego potrzebują.'),
      const RankTaskData(text: 'Jest pogodna w czasie trudów, zaraża innych swoją postawą.'),
    ],
    wiedzaHarc: [
      const RankGroupData(
        title: _GROUP_TITLE_ZNAJOMOSC_MALEJ_OJCZYZNY,
        taskData: [
          RankTaskData(text: 'Wie, jakie rośliny i zwierzęta można spotkać w pobliskim lesie, rozpoznała i udokumentowała znaleziony trop zwierzęcy, umie znaleźć kilka gatunków roślin leczniczych i wie, jakie mają zastosowanie.'),
          RankTaskData(text: 'Zna historię swojej rodziny (najciekawsze postacie, ciekawe wydarzenia, tradycje rodzinne; wie, gdzie są pochowani członkowie jej rodziny).'),
          RankTaskData(text: 'Zna okolicę swojego miejsca zamieszkania (dzieje, najważniejsze zabytki, legendy i obyczaje, a także układ sieci komunikacji, dróg dojazdowych i dworców).'),
        ],
      ),

      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_HARCERSKA,
        taskData: [
          RankTaskData(text: 'Zna historię walk harcerek i harcerzy o niepodległość.'),
          RankTaskData(text: 'Zna dzieje Organizacji Harcerek (na poziomie podstawowym).'),
          RankTaskData(text: 'Potrafi rozpoznać oznaczenia stopni instruktorskich.'),
          RankTaskData(text: 'Zna 20 piosenek harcerskich.'),
          RankTaskData(text: 'Zna historię drużyny (nazwiska najważniejszych postaci, wydarzenia z historii lokalnego środowiska) oraz najważniejsze fakty z życia jej patronki.'),
          RankTaskData(text: 'Wie, w jakim jest hufcu i chorągwi.'),
          RankTaskData(text: 'Wie, kto jest jej hufcową i komendantką chorągwi, jak oznacza się funkcje na poziomie hufca i chorągwi.'),
          RankTaskData(text: 'Wie, co powinna zawierać apteczka zastępu, i umie jej używać.'),
          RankTaskData(text: 'Wie, w jakiej sytuacji i w jaki sposób należy podjąć resuscytację krążeniowo-oddechową.'),
        ],
      ),

      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_O_POLSCE,
        taskData: [
          RankTaskData(text: 'Odwiedzi kilka obiektów historycznych związanych z różnymi okresami historii Polski.'),
          RankTaskData(text: 'Przed obozem/biwakiem/rajdem pozna region, gdzie on się odbywa, pod względem geograficznym i krajoznawczym, przygotuje dla drużyny informacje o miejscach wartych zobaczenia'),
        ],
      )
    ],
    umiejetnosci: [
      const RankGroupData(
        title: 'Sprawność fizyczna, hart.',
        taskData: [
          RankTaskData(text: 'Weźmie udział w zawodach sportowych.'),
          RankTaskData(text: 'Regularnie uczestniczy w zajęciach WF-u, dba o kondycję fizyczną w czasie ferii i wakacji.'),
          RankTaskData(text: 'Umie jeździć na rowerze, zna najważniejsze przepisy drogowe dotyczące rowerzystów.'),
          RankTaskData(text: 'Przepłynie stylem dowolnym trudno osiągalny dla siebie dystans.'),
          RankTaskData(text: 'Bierze udział w długich wycieczkach, potrafi się do nich przygotować.'),
        ],
      ),

      const RankGroupData(
        title: 'Dom',
        taskData: [
          RankTaskData(text: 'Wykona proste elementy ubrania lub wyposażenia domu.'),
          RankTaskData(text: 'Zaplanuje i przygotuje trzy posiłki, w tym co najmniej jeden obiad; zakupi produkty potrzebne do ich wykonania, rozliczy się z powierzonych jej pieniędzy.'),
          RankTaskData(text: 'Nabędzie nowe umiejętności w prowadzeniu domu.'),
          RankTaskData(text: 'Pomaga w organizowaniu uroczystości i spotkań rodzinnych, zawsze jest odpowiedzialna za konkretny element, włącza się w zadania innych osób i nabywa nowe umiejętności.'),
        ],
      ),

      const RankGroupData(
        title: 'Drużyna',
        taskData: [
          RankTaskData(text: 'Umie poprowadzić zastęp w terenie, posługiwać się mapą i kompasem.'),
          RankTaskData(text: 'Rzetelnie wywiązuje się z obowiązków podczas pełnienia wraz z drużyną i zastępem służb wartowniczych lub kuchennych. Otoczy opieką młodsze harcerki.'),
          RankTaskData(text: 'Poprowadzi musztrę zastępu zgodnie z regulaminem musztry.'),
          RankTaskData(text: 'W każdej z technik harcerskich (przyrodoznawstwo, samarytanka, pionierka, terenoznawstwo) w sposób zaplanowany zdobędzie nową umiejętność.'),
          RankTaskData(text: 'Po uzgodnieniu z drużynową podejmie określoną funkcję w drużynie (jednorazowo, np. przygotowanie gry, lub na stałe, np. funkcję kronikarki) i wywiąże się z niej.'),
          RankTaskData(text: 'Zna wartość pieniędzy, dba o własność drużyny i swoją.'),
          RankTaskData(text: 'W działaniach w drużynie i w zastępie wykorzystuje zdobycze techniki (zdjęcia cyfrowe, e-mail, strony WWW).'),
        ],
      ),

      const RankGroupData(
        title: 'Zdobywanie informacji',
        taskData: [
          RankTaskData(text: 'Przeprowadzi minimum 2 zwiady tematyczne, zbierze i przedstawi zdobyte informacje.'),
        ],
      ),
    ],
    doswiadczenieItems: [
      const RankTaskData(text: 'Weźmie udział w kolejnym obozie/zimowisku.'),
      const RankTaskData(text: 'Weźmie udział w zbiórce/zlocie hufca lub chorągwi.'),
      const RankTaskData(text: 'Będzie pełnić służbę wraz z zastępem lub drużyną.'),
    ],
    catData: null
);
RankZHRD rankZhrHarcD2 = rankZhrHarcD2Data.build();

RankZHRDData rankZhrHarcD2SData = RankZHRDData.from(
    title: 'Starsza tropicielka',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_2S',
    minWiek: '14 – 17 lat',
    czasTrw: 'do 1 roku',
    zalozenia: null,
    punktWyjsc: null,
    wskazowki: 'Gdy do drużyny przychodzi nowa harcerka w wieku gimnazjalnym, drużynowa musi sobie odpowiedzieć na następujące pytania: jakie są jej motywy i czego szuka w harcerstwie. Duży wpływ na postrzeganie świata i otoczenia przez harcerkę w tym wieku mają przechodzenie przez okres dojrzewania oraz kontakt z rówieśnikami. Kontakty z płcią przeciwną również stają się bardzo ważne. W tym wieku nakładają się zmiany obejmujące sferę psychiczną i fizyczną. Harcerka, która dołącza w tym wieku do drużyny, może mieć wrażenie, że stoi między dwoma światami. Jeden to środowisko nieharcerskie (np. szkoła), a drugi to drużyna, która promuje wartości uznawane dość często przez osoby spoza drużyny za nieaktualne, niemodne czy naiwne. W próbie na stopień starszej tropicielki należy zwrócić uwagę na zdobycie doświadczenia i wiedzy harcerskiej. Próba kończy się złożeniem Przyrzeczenia Harcerskiego.',
    sylwetka: 'Starsza tropicielka to harcerka, która po zdobyciu tego stopnia powinna osiągnąć poziom zastępowej. Wykazała się odpowiedzialnością za siebie i powierzone zadania w drużynie, które mają przygotować ją do podjęcia w przyszłości odpowiedzialności za zespół. Poznała i przyjęła Prawo Harcerskie. Stara się postępować zgodnie z nim. Doświadczyła obozowego życia i posiada wiedzę i umiejętności z technik harcerskich. Potrafi pogodzić działalność w drużynie z codziennymi obowiązkami w domu i w szkole. Realizuje swoje pasje. Stara się nazywać swoje emocje i szuka sposobów radzenia sobie z nimi. Jest aktywna i rozumie potrzebę aktywności fizycznej.'
        '\n\nPo zrealizowaniu próby na stopień starszej tropicielki harcerka powinna posiadać już stosunkowo duże umiejętności harcerskie. Życie polowe, obozownictwo, techniki harcerskie, puszczaństwo nie mają przed nią tajemnic, bo to ona – jako starsza koleżanka z zastępu – będzie przede wszystkim służyć radą młodszym druhnom.',
    postawa: [
      const RankGroupData(
          title: GROUP_TITLE_OGOLNE,
          taskData: [
            RankTaskData(text: 'Rozumie, do czego zobowiązuje ją Prawo Harcerskie w codziennym życiu. Potrafi oprzeć się tym, którzy namawiają ją do złego.'),
            RankTaskData(text: 'Odkrywa w swoim życiu działanie Boga.'),
            RankTaskData(text: 'Rozwija swoją wiedzę religijną, szuka odpowiedzi na nurtujące ją pytania.'),
            RankTaskData(text: 'Poznała przemiany, jakie następują u nastolatki i nastolatka w sferze fizycznej i uczuciowo-emocjonalnej (miesięczny cykl biologiczny, nastroje, samopoczucie, możliwości i potrzeby organizmu) na podstawie wiarygodnych i rzetelnych źródeł.'),
            RankTaskData(text: 'Dba o siebie, stosuje zasady profilaktyki zdrowotnej.'),
            RankTaskData(text: 'Czyta książki, zachęci inną osobę do przeczytania jednej z nich i uzasadni swój wybór.'),
            RankTaskData(text: 'Mądrze korzysta z czasopism, telewizji i Internetu, dokonując wyboru artykułów, audycji i pożytecznych stron WWW (ciekawych, kształcących, odprężających).'),
            RankTaskData(text: 'Nawiązuje więzi przyjaźni i podtrzymuje je.'),
            RankTaskData(text: 'Szanuje innych ludzi, pomaga im, kiedy tego potrzebują.'),
            RankTaskData(text: 'Jest punktualna.'),
          ]
      ),
      const RankGroupData(
          title: 'Dom',
          taskData: [
            RankTaskData(text: 'Utrzymuje porządek w swoich rzeczach, umie zagospodarować swoją przestrzeń.'),
            RankTaskData(text: 'Planuje swój czas, część poświęcając na stałe obowiązki domowe.'),
            RankTaskData(text: 'Potrafi zaplanować i przygotować posiłek.'),
            RankTaskData(text: 'Pomaga w organizowaniu uroczystości i spotkań rodzinnych.'),
          ]
      ),
      const RankGroupData(
          title: 'Drużyna, zastęp',
          taskData: [
            RankTaskData(text: 'Nie stroni od pracy, gdy inni w zastępie pracują; jeśli nie umie czegoś wykonać, stara się tego nauczyć.'),
            RankTaskData(text: 'Po uzgodnieniu z drużynową podejmie określoną funkcję w drużynie (jednorazowo, np. przygotowanie gry, lub na stałe, np.kronikarka) i wywiąże się z niej.'),
            RankTaskData(text: 'Rzetelnie wywiązuje się z obowiązków podczas pełnienia wraz z drużyną i zastępem służb wartowniczych lub kuchennych. Otacza opieką młodsze harcerki.'),
          ]
      ),
      const RankGroupData(
          title: 'Szkoła',
          taskData: [
            RankTaskData(text: 'Poważnie traktuje swoje obowiązki szkolne.'),
            RankTaskData(text: 'Mówi ładnie i poprawnie po polsku.'),
          ]
      ),
    ],
    wiedzaHarc: [
      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_HARCERSKA,
        taskData: [
          RankTaskData(text: 'Zna symbolikę Krzyża Harcerskiego, lilijki, koniczynki, hasła "Czuwaj".'),
          RankTaskData(text: 'Wie, jakie są stopnie harcerskie, instruktorskie, funkcje oraz jakie są ich oznaczenia.'),
          RankTaskData(text: 'Wykaże się znajomością początków ruchu skautowego i postaci jego założyciela.'),
          RankTaskData(text: 'Zna historię powstania harcerstwa, tradycje, na których się ono opiera, postać założycielki i założyciela.'),
          RankTaskData(text: 'Zna losy harcerek i harcerzy w czasie II wojny światowej.'),
          RankTaskData(text: 'Zna hymn harcerski, modlitwę harcerską i pieśni obrzędowe drużyny.'),
          RankTaskData(text: 'Zna 20 piosenek harcerskich.'),
          RankTaskData(text: 'Zna historię drużyny (nazwiska najważniejszych postaci, wydarzenia z historii lokalnego środowiska) oraz najważniejsze fakty z życia jej patronki.'),
        ],
      ),

      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_O_POLSCE,
        taskData: [
          RankTaskData(text: 'Zna i śpiewa hymn narodowy, wie, jak się zachować przy jego śpiewaniu.'),
          RankTaskData(text: 'Zna symbolikę flagi i godła narodowego.'),
          RankTaskData(text: 'Posiada flagę Polski, wie, kiedy ją wywiesić, i pamięta o tym obowiązku.'),
          RankTaskData(text: 'Odwiedzi kilka obiektów historycznych związanych z różnymi okresami historii Polski.'),
        ],
      ),

      const RankGroupData(
        title: _GROUP_TITLE_ZNAJOMOSC_MALEJ_OJCZYZNY,
        taskData: [
          RankTaskData(text: 'Wie, jakie rośliny i zwierzęta można spotkać w pobliskim lesie, rozpozna i udokumentuje znaleziony trop zwierzęcy (zdjęcie, odlew).'),
          RankTaskData(text: 'Zna historię swojej rodziny (drzewo genealogiczne przodków, najciekawsze postacie, ciekawe wydarzenia, tradycje rodzinne; wie, gdzie są pochowani członkowie jej rodziny).'),
          RankTaskData(text: 'Zna okolicę swojego miejsca zamieszkania (dzieje, najważniejsze zabytki, legendy i obyczaje, a także układ sieci komunikacji, dróg dojazdowych i dworców).'),
        ],
      )
    ],
    umiejetnosci: [
      const RankGroupData(
        title: 'Umiejętności obozowe',
        taskData: [
          RankTaskData(text: 'Potrafi samodzielnie w dobrym tempie rozłożyć i złożyć namiot 2-osobowy.'),
          RankTaskData(text: 'Rozstawi z zastępem namiot 10-osobowy.'),
          RankTaskData(text: 'Potrafi bezpiecznie rozpalić ognisko. Zna co najmniej 3 typy ognisk i nauczy się budować kuchnię polową.'),
          RankTaskData(text: 'Sprawnie posługuje się w pracach pionierskich piłą, siekierą, saperką. Nauczy się robić zaciosy.'),
          RankTaskData(text: 'Zna i stosuje 6 węzłów w pracach pionierskich. Nauczy się wyplatać pryczę.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności przyrodnicze',
        taskData: [
          RankTaskData(text: 'Umiejętności przyrodnicze'),
          RankTaskData(text: 'Potrafi wymienić, opisać i rozpoznać 10 ssaków, 10 ptaków i 10 gatunków drzew.'),
          RankTaskData(text: 'Potrafi rozpoznać 10 gatunków roślin i zwierząt chronionych.'),
          RankTaskData(text: 'Potrafi rozpoznać i zastosować podstawowe zioła.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności komunikacyjne',
        taskData: [
          RankTaskData(text: 'Zna proste szyfry i umie je stosować.'),
          RankTaskData(text: 'Umie podążać za znakami patrolowymi.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności samarytańskie',
        taskData: [
          RankTaskData(text: 'Wie, co powinna zawierać apteczka zastępu, i umie jej używać.'),
          RankTaskData(text: 'Wie, w jakiej sytuacji i w jaki sposób należy podjąć resuscytację krążeniowo-oddechową.'),
        ],
      ),

      const RankGroupData(
        title: 'Sprawność fizyczna',
        taskData: [
          RankTaskData(text: 'Sprawnie przebyła tor przeszkód terenowych'),
          RankTaskData(text: 'Regularnie uczestniczy w zajęciach WF-u, dba o kondycję fizyczną w czasie ferii i wakacji.'),
          RankTaskData(text: 'Umie pływać lub jeździć na rowerze.'),
        ],
      ),
    ],
    doswiadczenieItems: [
      const RankTaskData(text: 'Weźmie udział w kolejnym obozie/zimowisku.'),
      const RankTaskData(text: 'Weźmie udział w zbiórce/zlocie hufca lub chorągwi.'),
      const RankTaskData(text: 'Będzie pełnić służbę wraz z zastępem lub drużyną.'),
    ],
    catData: null
);
RankZHRD rankZhrHarcD2S = rankZhrHarcD2SData.build();

RankZHRDData rankZhrHarcD3Data = RankZHRDData.from(
    title: 'Samarytanka',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_3',
    minWiek: '14 – 17 lat',
    czasTrw: 'do 2 lat',
    zalozenia: null,
    punktWyjsc: null,
    wskazowki: 'Stopień samarytanki powinien być zdobywany w drużynie, w której drużynowa ma stopień przewodniczki, wędrowniczki lub wyższy. Jeżeli warunki te nie są spełnione, nad przebiegiem próby samarytanki powinna czuwać również opiekunka drużyny. Stopień jest zdobywany głównie w okresie, kiedy harcerka jest jeszcze w gimnazjum, ale obejmuje też czas zmiany szkoły z gimnazjalnej na ponadgimnazjalną. Jest to trudny wiek – związany z młodzieńczym buntem, a także poważną decyzją wyboru szkoły (harcerka zaczyna myśleć w tym czasie też o wyborze studiów, a więc jej plany wybiegają w odległą przyszłość).'
        '\n\nPróba samarytanki powinna się kończyć indywidualnymi harcami zorganizowanymi w hufcu. Próba samarytanki jest indywidualna, harcerka potrzebuje w tym czasie zaufania swojej opiekunki i jej wsparcia w podejmowaniu nowych, trudnych wyzwań.',
    sylwetka: 'Samarytanka osiągnęła mistrzostwo w technikach harcerskich. Harcerka zdobywająca ten stopień pełni funkcje na poziomie drużyny. Podejmuje odpowiedzialność za grupę. Wychodzi z własną inicjatywą (dom, szkoła, drużyna). Sumiennie wywiązuje się ze swoich obowiązków. Stylem życia świadczy o wyznawanych przez siebie ideałach, promuje je w swoim otoczeniu, wszyscy wiedzą, że można na nią liczyć, równocześnie ma odwagę prosić o pomoc w razie trudności i wie, do kogo może się o nią zwrócić. Posiada zdolność do wyznaczania i realizacji indywidualnych celów.'
        '\n\nSamarytanka coraz lepiej rozumie Prawo Harcerskie, rozumie harcerską ideę służby (szuka pól do jej realizacji i wypełnia ją). Wykazuje się dojrzałością w pojmowaniu współczesnego patriotyzmu. Świadomie kształtuje swój styl, potrafi efektywnie połączyć obowiązki rodzinne, szkolne i harcerskie z czasem na odpoczynek i hobby (które posiada lub stara się odnaleźć). Wykazuje się hartem ducha i ciała. W kontaktach z innymi stara się być empatyczna, nie zapominając jednocześnie o sobie.',
    postawa: [
      const RankGroupData(
          title: GROUP_TITLE_OGOLNE,
          taskData: [
            RankTaskData(text: 'Postępuje zawsze tak, że nie wstydzi się własnych czynów (tzn. zgodnie z zasadami wyznaczonymi przez Prawo Harcerskie, Dekalog).'),
            RankTaskData(text: 'Stara się znaleźć dobro w ludziach, na bieżąco wyjaśnia wszelkie nieporozumienia.'),
            RankTaskData(text: 'Poszukuje odpowiedzi na swoje bieżące pytania na tematy religijne (np. w książkach, czasopismach, poprzez rozmowy).'),
            RankTaskData(text: 'Zapozna się z treścią przeznaczoną dla młodzieży, która traktuje o miłości w świetle nauki chrześcijańskiej.'),
            RankTaskData(text: 'Pozna swoją kobiecość we wszystkich wymiarach (biologicznym, duchowym, psychicznym). Nabędzie umiejętność krytycznego spojrzenia na popularne wzorce kobiecości.'),
            RankTaskData(text: 'Uczestniczy w katechezie szkolnej.'),
          ]
      ),
      const RankGroupData(
          title: 'Praca nad sobą',
          taskData: [
            RankTaskData(text: 'Bierze czynny udział w lekcjach WF-u. Znajdzie takie formy aktywności ruchowej, które są dla niej odpowiednie – długoterminowo i systematycznie będzie dzięki nim dbać o swoje zdrowie i poprawiać kondycję.'),
            RankTaskData(text: 'Dba o swoje zdrowie.'),
            RankTaskData(text: 'Poważnie traktuje swoje obowiązku szkolne. Z jednego wybranego przedmiotu stara się systematycznie poszerzać swoją wiedzę.'),
            RankTaskData(text: 'Zna swoje zainteresowania, stara się je rozwijać. Posiada hobby.'),
            RankTaskData(text: 'Stara się znaleźć jak najbardziej efektywne dla siebie sposoby nauki.'),
            RankTaskData(text: 'Na podstawie obserwacji swojego otoczenia odnajdzie osobę potrzebującą pomocy, zaradzi w trudnej sytuacji.'),
            RankTaskData(text: 'Nie tłumi sztucznie swoich emocji, jest w nich autentyczna. Pamięta przy tym, żeby przeżywając je, nie krzywdzić siebie i innych.'),
            RankTaskData(text: 'Wierzy we własne siły, do zadań stara się podchodzić z optymizmem i zarażać nim innych.'),
            RankTaskData(text: 'Jest gospodarna, potrafi oszczędzać.'),
          ]
      ),
      const RankGroupData(
          title: 'Dom',
          taskData: [
            RankTaskData(text: 'Jest współodpowiedzialna za gospodarstwo domowe.'),
            RankTaskData(text: 'Rozwija się kulinarnie.'),
          ]
      ),
      const RankGroupData(
          title: 'Służba',
          taskData: [
            RankTaskData(text: 'Pełni służbę w społeczeństwie.'),
          ]
      ),
    ],
    wiedzaHarc: [
      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_HARCERSKA,
        taskData: [
          RankTaskData(text: 'Zna podstawowe różnice między największymi organizacjami harcerskimi w Polsce.'),
          RankTaskData(text: 'Zna podstawowe funkcje pełnione w ZHR, ich oznaczenia oraz nazwiska osób je pełniących.'),
          RankTaskData(text: 'Zapozna się z historią powstania ZHR, biorąc pod uwagę historyczne tło wydarzeń w Polsce.'),
          RankTaskData(text: 'Poszerza swoją wiedzę o historii Organizacji Harcerek i znaczących instruktorek – szczególnie ze swojego hufca i chorągwi.'),
        ],
      ),

      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_O_POLSCE,
        taskData: [
          RankTaskData(text: 'Śledzi bieżące wydarzenia polityczne i społeczne.'),
          RankTaskData(text: 'Pogłębia swoją wiedzę o historii i kulturze, zwłaszcza swojego regionu – jego specyfice, działaczach, środowisku artystycznym, wydarzeniach historycznych itp.'),
        ],
      ),
    ],
    umiejetnosci: [

      const RankGroupData(
        title: GROUP_TITLE_OGOLNE,
        taskData: [
          RankTaskData(text: 'Jej pionierka obozowa jest estetyczna, stabilna i prosta. Starsza samarytanka rozwija swoje umiejętności w tej dziedzinie.'),
          RankTaskData(text: 'Potrafi przetrwać w lesie w różnych warunkach pogodowych.'),
          RankTaskData(text: 'Zna i stosuje węzły.'),
          RankTaskData(text: 'Sprawnie porusza się w terenie.'),
          RankTaskData(text: 'Zna alternatywne sposoby komunikacji, niż te będące aktualnie w powszechnym użyciu.'),
          RankTaskData(text: 'Zdobędzie wiedzę o prostych sposobach pomagania Ziemi na co dzień – czyli o postawach proekologicznych.'),
          RankTaskData(text: 'Potrafi prawidłowo poprowadzić musztrę drużyny – na apelu, w marszu, zna zasady musztry ze sztandarem.'),
          RankTaskData(text: 'Potrafi udzielić pierwszej pomocy w sytuacjach urazów/zachorowań, jakie mogą mieć miejsce w czasie pracy drużyny lub podczas pełnienia służby.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności organizacyjne',
        taskData: [
          RankTaskData(text: 'Załatwi powierzone sprawy poza środowiskiem harcerskim (np. w urzędzie, w firmie).'),
          RankTaskData(text: 'Zgodnie z obowiązującymi przepisami zorganizuje wycieczkę z noclegiem dla drużyny lub zastępu.'),
          RankTaskData(text: 'Zorganizuje służbę społeczną zastępu lub drużyny.'),
          RankTaskData(text: 'Efektywnie organizuje swój czas.'),
        ],
      ),

    ],
    doswiadczenieItems: [
      const RankTaskData(text: 'Bierze udział w życiu kulturalnym (teatr, wystawy itp.).'),
      const RankTaskData(text: 'Bierze udział w imprezach chorągwi, ZHR.'),
      const RankTaskData(text: 'Czynnie uczestniczy w:'
          '\n- życiu drużyny'
          '\n- imprezach hufca'),
      const RankTaskData(text: 'Pomoże w organizacji akcji zarobkowej zastępu lub drużyny lub akcji charytatywnej.'),
      const RankTaskData(text: 'Zdobędzie 5 sprawności adekwatnych do swojego poziomu w danej dziedzinie.'),
    ],
    catData: null
);
RankZHRD rankZhrHarcD3 = rankZhrHarcD3Data.build();

RankZHRDData rankZhrHarcD3SData = RankZHRDData.from(
    title: 'Starsza samarytanka',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_3S',
    minWiek: '16 – 19 lat',
    czasTrw: 'do 1 roku',
    zalozenia: null,
    punktWyjsc: null,
    wskazowki: 'Stopień samarytanki powinien być zdobywany w drużynie, w której drużynowa ma stopień przewodniczki i wędrowniczki lub wyższy. Jeżeli warunki te nie są spełnione, nad przebiegiem próby powinna czuwać opiekunka drużyny, hufcowa lub osoba przez nią wyznaczona.'
        '\n\nPróba jest realizowana przez harcerkę, która ma za sobą trudny czas gimnazjum i wybór kolejnej szkoły, a także planuje swoją przyszłość dotyczącą wyboru studiów czy zawodu. Ma większą swobodę w decydowaniu o sobie, rozwijaniu zainteresowań czy sposobie spędzania wolnego czasu. Jej wybory są samodzielne i świadome, jednak niepozbawione wpływu rodziców i środowiska rówieśniczego.'
        '\n\nDecyzja o wstąpieniu do harcerstwa jest decyzją osoby świadomie poszukującej dla siebie grupy poza szkołą, co świadczy o zrozumieniu i akceptacji wartości harcerskich. Najczęściej, choć nie jest to regułą, jest to osoba, która do tej pory nie miała styczności ze środowiskiem harcerskim, a decyzja o przystąpieniu do grupy harcerskiej wiąże się dla niej z fascynacją i olbrzymim zapałem w nadrabianiu straconego czasu. To potencjalny lider, który ma szansę sprawdzić się w nowo powstających środowiskach. W takim wypadku próba powinna w jakimś stopniu wiązać się udziałem w kursie metodycznym. Inną drogą harcerskiego rozwoju dla osoby zdobywającej stopień starszej samarytanki jest drużyna wędrownicza.'
        '\n\nZdarza się, że osoba wstępująca do ZHR w wieku ponadgimnazjalnym już od dawna przebywa blisko środowiska harcerskiego, często jako osoba wspierająca lokalne środowisko harcerskie lub współpracująca z drużyną jako przedstawiciel innej organizacji. Ze względu na wiek i doświadczenie pozaharcerskie nie powinna pozostawać zbyt długo bez funkcji w drużynie.'
        '\n\nPróba starszej samarytanki powinna zakończyć się indywidualnym zadaniem na poziomie szerszy niż drużyna (kilka drużyn, hufiec, szczep). Próbę starszej samarytanki powinna prowadzić dojrzała opiekunka, która będzie potrafiła odpowiednio ukierunkować zapał i fascynację harcerki oraz pomoże w planowaniu drogi harcerskiej.',
    sylwetka: 'Starsza samarytanka wybrała jedną z technik harcerskich, w której dąży do mistrzostwa, pozostałe opanowała przynajmniej w stopniu podstawowym. Harcerka zdobywająca ten stopień podejmuje zadania na poziomie drużyny (harcerskiej bądź wędrowniczej). Wychodzi z własną inicjatywą (dom, szkoła, środowisko lokalne, drużyna). Sumiennie wywiązuje się ze swoich obowiązków. Stylem życia świadczy o wyznawanych przez siebie ideałach, promuje je w swoim otoczeniu. Posiada zdolność do wyznaczania sobie i realizacji indywidualnych celów.'
        '\n\nRozumie Prawo Harcerskie i harcerską ideę służby (szuka pól do jej realizacji), wykazuje się dojrzałością w pojmowaniu współczesnego patriotyzmu. Świadomie kształtuje swój styl, potrafi efektywnie połączyć obowiązki rodzinne, szkolne i harcerskie z czasem na odpoczynek i hobby (które stara się przekazywać innym). Wykazuje się hartem ducha i ciała. W kontaktach z innymi stara się być empatyczna, nie zapominając o sobie.',
    postawa: [
      const RankGroupData(
          title: 'Idea',
          taskData: [
            RankTaskData(text: 'Stylem życia świadczy o wyznawanych wartościach (zgodnych z Prawem Harcerskim, Dekalogiem).'),
            RankTaskData(text: 'Promuje w swoim środowisku wartości harcerskie.'),
            RankTaskData(text: 'Poszukuje odpowiedzi na swoje wątpliwości w sprawach wiary (np. w książkach, czasopismach, poprzez rozmowy).'),
            RankTaskData(text: 'Pozna swoją kobiecość we wszystkich wymiarach (biologicznym, duchowym, psychicznym). Nabędzie umiejętność krytycznego spojrzenia na popularne wzorce kobiecości.'),
          ]
      ),
      const RankGroupData(
          title: 'Praca nad sobą',
          taskData: [
            RankTaskData(text: 'Bierze czynny udział w lekcjach/zajęciach WF-u. Znajdzie takie formy aktywności ruchowej, które są dla niej odpowiednie – długoterminowo i systematycznie będzie dzięki nim dbać o swoje zdrowie i poprawiać kondycję.'),
            RankTaskData(text: 'Dba o swoje zdrowie.'),
            RankTaskData(text: 'Poważnie traktuje swoje obowiązku szkolne i studenckie. Z wybranych przedmiotów, związanych z jej dalszą edukacją, stara się systematycznie poszerzać swoją wiedzę.'),
            RankTaskData(text: 'Zna swoje zainteresowania, stara się je rozwijać. Posiada hobby i potrafi nim zaciekawić innych.'),
            RankTaskData(text: 'Na podstawie obserwacji swojego otoczenia/grupy odnajdzie problem i podejmie próbę jego rozwiązania.'),
            RankTaskData(text: 'Wierzy we własne siły i potrafi je ocenić, bierze odpowiedzialność nie tylko za siebie, lecz także za innych i podejmuje próby przewodzenia grupie.'),
          ]
      ),
      const RankGroupData(
          title: 'Dom',
          taskData: [
            RankTaskData(text: 'Jest współodpowiedzialna za gospodarstwo domowe – regularnie wywiązuje się ze stałych obowiązków domowych. Bierze czynny udział w rozwiązywaniu problemów rodzinnych.'),
          ]
      ),
      const RankGroupData(
          title: 'Służba',
          taskData: [
            RankTaskData(text: 'Pełni służbę w społeczeństwie.'),
          ]
      ),
    ],
    wiedzaHarc: [
      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_HARCERSKA,
        taskData: [
          RankTaskData(text: 'Zna symbolikę Krzyża Harcerskiego, lilijki, koniczynki, hasła "Czuwaj".'),
          RankTaskData(text: 'Zna hymn harcerski, modlitwę harcerską i pieśni obrzędowe drużyny.'),
          RankTaskData(text: 'Zna Prawo i Przyrzeczenie Harcerskie.'),
          RankTaskData(text: 'Wie, jakie są stopnie harcerskie, instruktorskie, funkcje oraz jakie są ich oznaczenia. Zna funkcje pełnione w ZHR, ich oznaczenia oraz nazwiska osób je pełniących. '),
          RankTaskData(text: 'Zna podstawowe różnice między największymi organizacjami harcerskimi w Polsce. Potrafi określić miejsce ZHR pośród innych organizacji pozarządowych w Polsce.'),
          RankTaskData(text: 'Zapozna się z początkami ruchu skautowego w Europie i w Polsce, z losami harcerstwa w czasie II wojny światowej oraz historią powstania ZHR, biorąc pod uwagę tło historyczne wydarzeń w Polsce'),
          RankTaskData(text: 'Poszerza swoją wiedzę o historii Organizacji Harcerek i jej znaczących instruktorek – szczególnie ze swojego hufca i chorągwi.'),
        ],
      ),

      const RankGroupData(
        title: _GROUP_TITLE_WIEDZA_O_POLSCE,
        taskData: [
          RankTaskData(text: 'Śledzi bieżące wydarzenia polityczne i społeczne.'),
          RankTaskData(text: 'Pogłębia swoją wiedzę o historii i kulturze, zwłaszcza swojego regionu – jego specyfice, działaczach, środowisku artystycznym, wydarzeniach historycznych itp.'),
        ],
      ),
    ],
    umiejetnosci: [

      const RankGroupData(
        title: GROUP_TITLE_OGOLNE,
        taskData: [
          RankTaskData(text: 'Jej pionierka obozowa jest estetyczna, stabilna i prosta. Rozwija się w tej dziedzinie.'),
          RankTaskData(text: 'Sprawnie porusza się w terenie.'),
          RankTaskData(text: 'Zdobędzie wiedzę o prostych sposobach pomagania Ziemi na co dzień – czyli o postawach proekologicznych.'),
          RankTaskData(text: 'Zna podstawową musztrę harcerki. Potrafi prawidłowo poprowadzić musztrę drużyny – na apelu, w marszu (np. zna zasady musztry ze sztandarem).'),
          RankTaskData(text: 'Potrafi udzielić pierwszej pomocy w sytuacjach urazów/zachorowań, jakie mogą mieć miejsce w czasie pracy drużyny lub podczas pełnienia służby.'),
        ],
      ),

      const RankGroupData(
        title: 'Umiejętności organizacyjne',
        taskData: [
          RankTaskData(text: 'Zgodnie z obowiązującymi przepisami zorganizuje wycieczkę z noclegiem dla drużyny.'),
          RankTaskData(text: 'Zorganizuje służbę społeczną drużyny.'),
        ],
      ),

    ],
    doswiadczenieItems: [
      const RankTaskData(text: 'Bierze udział w imprezach chorągwi, ZHR.'),
      const RankTaskData(text: 'Weźmie udział w obozie letnim lub zimowisku drużyny.'),
      const RankTaskData(text: 'Podejmuje funkcje w drużynie wędrowniczej lub harcerskiej.'),
      const RankTaskData(text: 'Podejmie się indywidualnego zadania na poziomie szerszym niż jej drużyna (kilka drużyn, hufiec, szczep).'),
      const RankTaskData(text: 'Zorganizuje akcję zarobkową drużyny lub akcję charytatywną.'),
      const RankTaskData(text: 'Zdobędzie 5 sprawności adekwatnych do swojego poziomu w danej dziedzinie.'),
    ],
    catData: null
);
RankZHRD rankZhrHarcD3S = rankZhrHarcD3SData.build();

RankZHRDData rankZhrHarcD4Data = RankZHRDData.from(
    title: 'Wędrowniczka',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_4',
    minWiek: '16 – 20 lat',
    czasTrw: 'do 2 lat',
    zalozenia: 'Dla wędrowniczki życie staje się wezwaniem na szlaki, po których wędruje w sensie dosłownym i przenośnym. Wędrówka w sensie dosłownym to przemierzone w tym okresie dziesiątki kilometrów – wielogodzinne włóczęgi, podczas których czas i przestrzeń stają się prawdziwym wyzwaniem. Wędrówka w sensie przenośnym to przemierzanie ścieżek myśli i aktywności ludzkiej, wędrówka przez zagadnienia i problemy duchowe, społeczne, polityczne i ekonomiczne. Czas trwania próby ma dać szansę na odkrycie i zrozumienie sensu wędrowania w obu powyższych aspektach.'
        '\n\nWędrowniczka będzie aktywnie szukać odpowiedzi na nurtujące ją pytania, poszukiwać piękna w codzienności i odpowiedzialnie podejmie służbę.'
        '\n\nDwoma ważnymi elementami wędrówki są:'
        '\n\n• Bezdroża – na które czasem zapędzamy się w poszukiwaniach. Osoba zdobywająca stopień powinna uczyć się spoglądania na siebie z dystansem, rozumienia swoich błędów. Powinna umieć powrócić na właściwy szlak.'
        '\n\n• Umiejętność docenienia przebytej drogi – w sytuacji, w której niekoniecznie udało się osiągnąć cel, ale pokonana droga dostarczyła wiedzy o sobie i doświadczenia.',
    punktWyjsc: 'Stopień wędrowniczki przeznaczony jest dla druhny w wieku 16–20 lat (I klasa szkoły ponadgimnazjalnej – II rok studiów), która zdobyła stopień samarytanki lub zdobyła stopień starszej samarytanki i złożyła Przyrzeczenie Harcerskie.',
    wskazowki: 'Zdobywanie stopnia wędrowniczki to czas świadomej pracy nad sobą. Harcerka w czasie realizacji poszczególnych zadań próby stawia sobie konkretne cele, które są dla niej wyzwaniem i próbą charakteru. Dążąc do osiągnięcia tych celów, przezwycięża własne słabości.'
        '\n\nWszelkie działania podejmowane przez harcerkę realizującą próbę wędrowniczki powinny służyć zdobyciu przez nią konkretnych i wymiernych umiejętności – takich, które wesprą ją w życiu dorosłym:'
        '\n\n• dadzą zdolność podejmowania decyzji na podstawie analizy faktów,'
        '\n\n• dadzą wiedzę o sobie i świecie wokół,'
        '\n\n• dadzą uprawnienia i nauczą sztuki samodoskonalenia i samokształcenia,'
        '\n\n• pozwolą poszerzyć wiedzę i horyzonty myślowe,'
        '\n\n• budują wewnętrzny kodeks moralny i pozwolą dalej jej rozwijać więź z Bogiem.'
        '\n\nWędrowniczka potrzebuje dużo swobody podczas planowania próby na stopień, a ze strony opiekunki nakierowania oraz wskazówek, gdzie poszukiwać sposobów realizacji założeń stopnia.'
        '\n\nTo harcerka samodzielnie wyznacza poziom swoich zadań, opiekunka zaś weryfikuje jej pracę z regulaminem i własnym doświadczeniem.'
        '\n\nPomimo swobody i samodzielności, których wędrowniczka nieustannie się uczy i które doskonali, opiekunka powinna dyscyplinować swoją podopieczną w kwestiach formalnych związanych ze stopniem: pamiętać o terminach, dotrzymywaniu umów i komunikacji pomiędzy przyszłą wędrowniczką a kapitułą.'
        '\n\nWędrowniczka powinna czuć, że jest ktoś, kto wspiera ją podczas zdobywania stopnia i w razie potrzeby poda pomocną dłoń, doradzi, podzieli się doświadczeniem.'
        '\n\nRolą opiekunki jest inspirowanie do podejmowania określonych działań i do jak najlepszej pracy nad stopniem, czyli nad rozwojem osobistym.'
        '\n\nPrzed podjęciem próby na stopień zalecane jest szczegółowe zaplanowanie pracy, także pomiędzy opiekunką i podopieczną (np. forma, w jakiej wędrowniczka będzie informowała opiekunkę o postępach w pracy, a także to, co jaki czas będzie się to odbywało).',
    sylwetka: null,
    postawa: null,
    wiedzaHarc: null,
    umiejetnosci: null,
    doswiadczenie: null,
    catData: [
      const RankCatData(
        title: 'Rozwój',
        icon: RankData.iconCatRozwoj,
        groupData: [
          RankGroupData(
              title: 'Idea',
              taskData: [
                RankTaskData(text:
                'Poszerzanie swojej świadomości religijnej, osobistego świadectwa wiary i poszukiwanie miejsca we wspólnocie chrześcijańskiej.',
                  description: 'Zdobywanie wędrowniczki to często czas stawiania sobie bardzo ważnych, często fundamentalnych pytań związanych z wchodzeniem w dorosłość. Stopień ma pomóc wędrowniczce w poszukiwaniu odpowiedzi na te pytania poprzez uczestnictwo w różnych formach duszpasterskich, rozmowy, lektury. To czas uświadamiania, że wiara, podobnie jak inne sfery naszego życia, dojrzewa i nie jest tylko naszą prywatną sprawą, a aktywnym uczestnictwem w życiu Kościoła, do którego należymy.',
                ),
                RankTaskData(text:
                'Kształtowanie postawy chrześcijańskiej miłości.',
                  description: 'Miłość chrześcijańska to nieustanne, bezinteresowne dawanie siebie innym. Aby dać, trzeba najpierw posiadać, być świadomym swoich mocnych i słabych stron, swoich talentów i ograniczeń. Harcerka, zdobywając stopień wędrowniczki, dąży do panowania nad sobą, poświęca innym swoją uwagę, czas, umiejętności, wiedzę i modlitwę, ale nie traci jednocześnie siebie.',
                ),
                RankTaskData(text:
                'Budowanie wrażliwości na piękno otaczające człowieka w świecie i dążenie do poznania jego źródeł.',
                    description: 'Harcerka, zdobywając stopień wędrowniczki, uczy się odkrywać piękno w przyrodzie, sztuce i innych ludziach. Uczy się określania własnych kryteriów wyboru tej czy innej książki, filmu, dzieła sztuki, trasy wędrówki. Umie zatrzymać się w życiu albo na szlaku po to, by patrzeć, podziwiać. Doświadcza wartości kontemplowania piękna w otaczającym świecie i poszukiwania jego źródeł.'
                ),
                RankTaskData(text:
                'Szacunek dla otaczającego świata, świadomość aktualnych zagrożeń i poszukiwanie wiedzy o ich źródłach.',
                    description: 'Wędrowniczka dostrzega związek między swoimi codziennymi działaniami a ich globalnym wpływem na środowisko. Stara się wcielać w życie zasady życia w harmonii z przyrodą, buduje w sobie dobre odruchy oszczędzania zasobów planety, z których korzysta. Jej troska o środowisko naturalne przejawia się w codziennej rutynie dbania o zasoby: oszczędzaniu energii, jedzenia, wody itp.'
                ),
                RankTaskData(text:
                'Świadomość aktualnych wyzwań stojących przed Polską, poszukiwanie swojego miejsca w życiu obywatelskim i kulturalnym.',
                    description: 'Zdobywanie stopnia wędrowniczki ma uruchomić w harcerce chęć aktywnego i świadomego uczestnictwa w życiu publicznym – wspólnoty lokalnej, ale także w obrębie rodziny, znajomych, w szkole i na uczelni. Wędrowniczka zgłębia wiedzę z zakresu obecnych problemów natury społecznej, kulturalnej, ekonomicznej czy politycznej, uzupełnia luki, poszukuje aktywności w opisanej dziedzinie, wypracowuje swoje własne poglądy.'
                ),
                RankTaskData(text:
                'Otwartość na problemy Europy i świata, poszukiwanie ich źródeł.',
                    description: 'Zdobywanie stopnia wędrowniczki jest czasem kształtowania wrażliwości, otwartości i zainteresowania otoczeniem. Harcerka poznaje problemy współczesnego świata, stara się poznać ich źródła, koncentruje się na ich aspekcie etycznym i moralnym. Zdobywa wiedzę, która pozwoli jej dostrzegać źródła problemów, ich aktualny przebieg i skutki dla świata i regionu. Wiedza ta ma pomóc w kształtowaniu opinii, poglądów, postawy zainteresowania zjawiskami społecznymi.'
                        '\n\nZadanie w próbie powinno być konkretne, umiejscowione w określonej dziedzinie (różnorodność kulturowa; problemy globalne, społeczne, religijne; polityka; gospodarka; ekonomia itd.), miejscu (Europa, świat, Europa na tle świata itd.) i czasie.'
                ),
                RankTaskData(text:
                'Służba bliźnim.',
                    description: 'Wędrowniczka powinna dostrzegać problemy i potrzeby otoczenia. Być uważną i otwartą na nie, wychodzić im naprzeciw. Stara się zostawiać świat, w którym żyje, choć trochę lepszym, niż go zastała. Dzięki otwartości na problemy innych ludzi uczy się odpowiednio reagować i postępować. Działa w sposób przemyślany i odpowiedzialny, systematycznie, długofalowo, rzetelnie i konsekwentnie.'
                        '\n\nW ramach zdobywania stopnia wędrowniczki harcerka podejmuje indywidualną służbę społeczną – określa precyzyjnie jej zakres, charakter i intensywność. Decydując się na podjęcie konkretnej służby, bierze pod uwagę własne możliwości, zdolności i umiejętności, a także własną dojrzałość do podejmowanych działań. Stara się, aby podejmowana służba była jednocześnie pracą nad własnym rozwojem i charakterem.'
                ),
                RankTaskData(text:
                'Świadome poszukiwanie i kształtowanie drogi życiowej poprzez poznanie prawdy o sobie.',
                    description: 'Zdobywając stopień wędrowniczki harcerka poznaje siebie, własne potrzeby i predyspozycje. Uczy się dokonywania ważnych życiowych wyborów (kierunków rozwoju, osób, z którymi chce się spotykać itd.) w kontekście swoich celów i priorytetów życiowych. Zastanawia się także nad swoim powołaniem.'
                ),
                RankTaskData(text:
                'Akceptacja swojej kobiecości we wszystkich wymiarach (biologicznym, duchowym, psychicznym), umiejętność krytycznego spojrzenia na popularne wzorce kobiecości.',
                    description: 'Żyjemy w czasach, w których nie da się uciec od pytania: Co to znaczy być kobietą? Czym różni się biologia, psychika, duchowość kobiety i mężczyzny? Czy w ogóle się różni? Co z tego wynika dla nas, dla naszego rozwoju i sposobu wychowania? Co spośród propozycji otaczającego świata możemy wykorzystać, a co powinnyśmy odrzucić? Stopień wędrowniczki ma pomóc harcerce w odnajdywaniu odpowiedzi na te pytania przez pryzmat etyki chrześcijańskiej oraz Prawa Harcerskiego.'
                )
              ]
          ),

          RankGroupData(
            title: _GROUP_TITLE_ROZWOJ_INTELEKTUALNY,
            taskData: [
              RankTaskData(text:
              'Samodzielność myślenia, przezwyciężanie lenistwa myślowego.',
                description: 'Wędrowniczka ma być osobą świadomą: w podejmowaniu decyzji, w poglądach, które wyznaje, w wyborach, których dokonuje. Stopień ma ją przygotować do takiego właśnie świadomego życia. Ważne jest, by miała świadomość konieczności nieustannej pracy nad tą sferą: zdobywania wiedzy, pogłębiania jej, ćwiczenia umiejętności szerokiego spoglądania na daną dziedzinę, zjawisko, proces.'
                    '\n\nLenistwo myślowe to także uleganie modom i popularnym nurtom ujmowania spraw z życia moralnego i społecznego. Wędrowniczka to osoba, która stara się weryfikować te nurty. Uczy się, ćwiczy, rozmawia, szuka autorytetów.',
              ),
              RankTaskData(text:
              'Umiejętność wykorzystywania zdobytej wiedzy teoretycznej.',
                  description: 'Harcerka zdobywająca stopień wędrowniczki wkracza powoli w życie dorosłe – dokonuje wyboru kierunku kształcenia, uczy się zdobywania wiedzy i umiejętności, które przydadzą jej się w życiu rodzinnym, zawodowym i społecznym. Uczy się praktycznego wykorzystania swojej wiedzy: zdobywa dodatkowe umiejętności, poszerza posiadane, dzieli się wiedzą. Wypracowuje własne efektywne metody uczenia się.'
              ),
            ],
          ),

          RankGroupData(
            title: _GROUP_TITLE_ROZWOJ_FIZYCZNY,
            taskData: [
              RankTaskData(text:
              'Dbałość o zdrowie i sprawność fizyczną.',
                  description: 'Harcerka w ramach próby na stopień powinna wyrobić nawyk systematycznej aktywności fizycznej, a także zdobyć wiedzę, która ułatwi jej dbanie o zdrowie. Rozwija w sposób optymalny swoją sprawność fizyczną. Harcerka poprzez korzystanie z różnorodnych form aktywności fizycznej może wybrać swoje ulubione zajęcia, których systematyczne uprawianie pomoże jej utrzymać dobrą kondycję i zdrowie w chwili obecnej oraz w przyszłości.'
              ),
            ],
          ),

          RankGroupData(
            title: _GROUP_TITLE_ROZWOJ_WSPOLNOTA,
            taskData: [
              RankTaskData(text:
              'Umiejętność animacji działań w środowisku i odpowiedzialność za wspólnotę.',
                  description: 'Harcerka, animując działania na rzecz wspólnoty, kształtuje w sobie umiejętności organizacyjne, ale także poczucie odpowiedzialności za grupę. Realizacja próby ma także dać jej szansę na kształtowanie umiejętności budowania relacji z innymi opartych na dialogu i wzajemnym zrozumieniu.'
              ),
              RankTaskData(text:
              'Dialog z drugim człowiekiem i umiejętność budowania głębokich więzi międzyludzkich.',
                  description: 'Harcerka zdobywająca stopień wędrowniczki stara się otwarcie mówić o swoich potrzebach i uczuciach. Uczy się zasad dobrego dialogu i konsekwentnie je stosuje w rozmowach z innymi ludźmi. Wędrowniczka uczy się budowania głębokich relacji z drugim człowiekiem – przyjaźni, miłości.'
              ),
              RankTaskData(text:
              'Współodpowiedzialność za rodzinę.',
                  description: 'Wędrowniczka odpowiada na potrzeby domu i rodziny. Podejmuje się konkretnych działań na rzecz domowników. Podchodzi do tego zadania rzetelnie, konsekwentnie i długofalowo. Pogłębia relacje z domownikami, kultywuje rodzinne święta i tradycje.'
              ),
              RankTaskData(text:
              'Odpowiedzialność za swoje czyny, rzetelność wykonywanej pracy.',
                  description: 'Harcerka uczy się odpowiedzialności za swoje słowa i czyny, konsekwentnie wywiązuje się z podjętych zadań, wykonuje je terminowo i rzetelnie. Jest świadoma konsekwencji tych działań. Jest świadoma swoich umiejętności i możliwości, potrafi określić czas potrzebny na wykonanie określonego zadania. Jest świadoma swoich słabości i potrafi je przezwyciężać. Doskonali warsztat swojej pracy poprzez poznanie technik dobrego wykorzystania czasu. Uczy się planować, odpowiednio rozkładać pracę, którą ma do wykonania.'
              ),
              RankTaskData(text:
              'Umiejętność zachowania harcerskiej postawy w środowisku pozaharcerskim i podjęcia dyskusji na ten temat.',
                  description: 'Wędrowniczka konfrontuje postawę harcerską, sposób życia w zgodzie z Prawem Harcerskim z postawami różnych osób w różnych grupach. Nieraz są to postawy bardzo odmienne od tego, co proponuje ZHR. Uczy się radzić sobie z sytuacją, kiedy pragnie identyfikacji z grupą, w której jest, a która wyznaje inne zasady niż te promowane przez ZHR.'
              ),
              RankTaskData(text:
              'Osiąganie mistrzostwa w technikach harcerskich.',
                  description: 'Harcerka rozpoczynająca próbę na stopień wędrowniczki jest już mistrzynią technik harcerskich. W ramach realizacji próby na ten stopień nadal pogłębia swoją wiedzę i umiejętności w wybranych dziedzinach, dzieli się z innymi własnymi doświadczeniami, zdobywa kolejne sprawności harcerskie.'
              ),
              RankTaskData(text:
              'Próba szlaku',
                  description: 'Harcerka zdobywająca stopień wędrowniczki (może to być forma próby końcowej) podejmuje próbę szlaku. Ta próba ma być dla niej wyzwaniem, możliwością odkrywania nowych miejsc i ludzi, poszukiwania piękna w otoczeniu i w ludziach, a także odkrywania prawdy o sobie samej.'
              ),
            ],
          )
        ],
      ),
    ]
);
RankZHRD rankZhrHarcD4 = rankZhrHarcD4Data.build();

RankZHRDData rankZhrHarcD4SData = RankZHRDData.from(
    title: 'Starsza wędrowniczka',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_4S',
    minWiek: 'powyżej 18 lat',
    czasTrw: 'do 1 roku',
    zalozenia: 'Osoba zdobywająca stopień starszej wędrowniczki to kobieta, która chciałaby wypełnić konkretnymi działaniami pewne sfery swojego życia. Najlepszym dowodem na to jest wstąpienie do ZHR w wieku, w którym większość czynnie działających harcerek ma już za sobą mnóstwo doświadczeń.'
        '\n\nJednak właśnie dla takiej osoby harcerstwo może być miejscem, gdzie ma możliwość odnalezienia odpowiedzi na pewne pytania, zdobycia pożądanej wiedzy, umiejętności lub po prostu wypracowania swojego stylu życia.'
        '\n\nDołącza więc do określonego środowiska z nadzieją na konkretne działanie, które przyniesie jej satysfakcję i pomoże zaspokoić potrzeby.'
        '\n\nHarcerka zdobywająca stopień starszej wędrowniczki powinna uczyć się spoglądania na siebie z dystansem, rozumienia swoich błędów, potrafić powrócić na właściwy szlak. Dwoma ważnymi aspektami jej wędrówki są:'
        '\n\n• bezdroża — na które czasem zapędzamy się w poszukiwaniach,'
        '\n\n• docenienie przebytej drogi — sytuacje, w których niekoniecznie udało się osiągnąć cel, ale pokonana droga dostarczyła określonego doświadczenia i wiedzy o sobie samej.',
    punktWyjsc: 'Stopień starszej wędrowniczki przeznaczony jest dla druhny, która wstąpiła do organizacji jako osoba dorosła i zrealizowała próbę harcerki starszej. Zdobycie stopnia starszej wędrowniczki jest równoznaczne z dopuszczeniem harcerki do złożenia Przyrzeczenia Harcerskiego.',
    wskazowki: 'Wszelkie działania podejmowane przez harcerkę realizującą próbę na stopień starszej wędrowniczki powinny służyć zdobyciu przez nią konkretnych i wymiernych umiejętności, które będzie mogła wykorzystać w życiu dorosłym.'
        '\n\nStarsza wędrowniczka jest pod wieloma względami dojrzała i zmotywowana do działania, ale także ma już własne nawyki, przyzwyczajenia i swój system wartości. To moment, by go zweryfikować. Do tego potrzebna jest duża dawka pokory, tak ze strony osoby zdobywającej stopień, jak i opiekunki. Ważne jest więc, by umieć rozeznać, nad czym warto popracować. Niezbędne jest także, by ze stanowczością wymagać od zdobywającej tej stopień druhny dążenia do zgodnych z ideą harcerską postaw.'
        '\n\nZdobywanie stopnia starszej wędrowniczki to czas świadomej pracy nad sobą. Harcerka podczas realizacji poszczególnych zadań próby stawia sobie konkretne cele, które są dla niej wyzwaniem i próbą charakteru. Dążąc do osiągnięcia tych celów, przezwycięża własne słabości.'
        '\n\nDziałanie w nowym środowisku może być na początku trudne. Choć harcerka zdobywająca stopień jest już dorosłą osobą i bez problemu radzi sobie z wieloma sprawami, z którymi mocują się młodsze harcerki, to może się zdarzyć, że właśnie one górują nad nią wiedzą, umiejętnościami oraz postawą, które nabywa się przez wcześniejsze działanie w drużynie. Może to wytworzyć poczucie wyobcowania lub wrażenie bycia gorszą harcerką. Należy wzmacniać przekonanie starszej wędrowniczki, że cały rozwój harcerski, wiedza i typowe umiejętności dotyczą również jej i jest w stanie tym wymaganiom sprostać. Poszerza więc swoje umiejętności w zakresie ustalonym wraz z opiekunką, z uwzględnieniem miejsca swojej aktualnej i planowanej aktywności harcerskiej.'
        '\n\nW wyniku realizacji próby osoba zdobywająca stopień powinna nie tylko posiąść umiejętności i doświadczenia harcerskie, ale przede wszystkim znaleźć to, w poszukiwaniu czego dołączyła do ZHR, a także odkryć istotę harcerstwa. Całkowicie zrozumieć ideę i świadomie podjąć decyzję o służbie harcerskiej, zgodnie z przyjętym Prawem i Przyrzeczeniem Harcerskim.'
        '\n\nNiezależnie od wieku harcerka zdobywająca ten stopień może odkrywać swoje predyspozycje i wykorzystywać posiadane talenty. Pozwoli jej to świadomie wybrać ścieżkę zawodową i zaplanować kolejność działań umożliwiających zdobycie przyszłej specjalności, zawodu lub pomoże optymalnie się rozwijać. Ważną kwestią jest świadomość swoich mocnych i słabych stron, ponieważ jest to pierwszy krok, by wypracować metody, które pomogą jej jak najlepiej się rozwijać.'
        '\n\nStarsza wędrowniczka ma pomysł na swoje życie, stawia przed sobą konkretne cele, do osiągnięcia których wykorzystuje posiadaną już wiedzę i umiejętności, a w razie potrzeby potrafi je nabywać.'
        '\n\nStarsza wędrowniczka potrzebuje dużo swobody podczas planowania stopnia, a ze strony opiekunki – nakierowania oraz wskazówek, gdzie poszukiwać odpowiedzi na pytania pojawiające się podczas realizacji próby oraz gdzie można zdobyć konkretną wiedzę i umiejętności. Dodatkowym zadaniem opiekunki jest nauczenie harcerki zdobywania stopni, ponieważ nie ma ona doświadczenia w tym względzie.'
        '\n\nNie należy jednak zapominać, że to harcerka samodzielnie wyznacza poziom swoich zadań, opiekunka zaś weryfikuje jej pracę z regulaminem i własnym doświadczeniem. Ważne jest też zauważenie i opisanie obszarów życia, które są przez harcerkę nieustannie pogłębiane niezależnie od próby, po to, by nie mnożyć zadań tylko w celu formalnego potwierdzenia posiadanych umiejętności.'
        '\n\nPomimo charakterystycznej dla starszych stopni swobody i samodzielności, której starsza wędrowniczka nieustannie się uczy, opiekunka powinna dyscyplinować swoją podopieczną w kwestiach formalnych, związanych ze stopniem: pamiętać o terminach, dotrzymywaniu umów i komunikacji pomiędzy przyszłą starszą wędrowniczka a kapitułą.'
        '\n\nStarsza wędrowniczka powinna czuć, że jest ktoś, kto wspiera ją podczas zdobywania stopnia i w razie potrzeby poda pomocną dłoń, doradzi, podzieli się doświadczeniem.'
        '\n\nPrzed podjęciem próby na stopień zalecane jest szczegółowe zaplanowanie pracy, także pomiędzy opiekunką i podopieczną (np. forma, w jakiej wędrowniczka będzie informowała opiekunkę o postępach w pracy, a także to, co jaki czas będzie się to odbywało).',
    sylwetka: null,
    postawa: null,
    wiedzaHarc: null,
    umiejetnosci: null,
    doswiadczenie: null,
    catData: [
      const RankCatData(
        title: 'Rozwój',
        icon: RankData.iconCatRozwoj,
        groupData: [
          RankGroupData(
              title: 'Idea',
              taskData: [
                RankTaskData(text:
                'Rozumienie i przyjęcie Prawa Harcerskiego.',
                  description: 'Dla osoby, która późno przychodzi do harcerstwa, przyjęcie Prawa Harcerskiego (czyli zbioru norm, którymi ma się kierować w życiu) może być trudne. Harcerka, zdobywając stopień starszej wędrowniczki, podejmuje głębszą refleksję na ten temat i dojrzałą decyzję o podjęciu wyzwania.',
                ),
                RankTaskData(text:
                'Zrozumienie idei służby i podjęcie jej w formie odpowiedniej dla siebie. Codzienny wymiar służby.',
                    description: 'Starsza wędrowniczka uczy się rozumienia służby harcerskiej jako działania wynikającego z chrześcijańskiej postawy miłości. Harcerka powinna poznać konkretny, praktyczny wymiar tej służby oraz różnorodne formy jej realizacji. Podejmuje służbę, która pozwala jej dzielić się sobą z innymi, a jednocześnie samej się rozwijać.'
                        '\n\nTo także dobre miejsce na to, by wędrowniczka określiła swoje potrzeby względem społeczeństwa oraz to, co ona może ofiarować.'
                        '\n\nDla harcerki postawa służby często wiąże się z poświęceniem – swojego czasu, swojej uwagi, a czasem rezygnacji z wygód. Nie zawsze jest to proste, zwłaszcza jeśli ktoś wcześniej nie wzrastał w środowisku, w którym było to cenione.'
                ),
                RankTaskData(text:
                'Rozumienie i przyjęcie Prawa Harcerskiego.',
                    description: 'Dla osoby, która późno przychodzi do harcerstwa, przyjęcie Prawa Harcerskiego (czyli zbioru norm, którymi ma się kierować w życiu) może być trudne. Harcerka, zdobywając stopień starszej wędrowniczki, podejmuje głębszą refleksję na ten temat i dojrzałą decyzję o podjęciu wyzwania.'
                )
              ]
          ),

          RankGroupData(
              title: 'Duchowy',
              taskData: [
                RankTaskData(text:
                'Pogłębianie swojej wiedzy religijnej, osobistego świadectwa wiary i poszukiwanie miejsca we wspólnocie chrześcijańskiej.',
                    description: 'Zaangażowanie religijne harcerki podejmującej próbę na stopień starszej wędrowniczki może być bardzo różne. Zadanie w próbie powinno być ułożone tak, aby harcerstwo było dla niej również miejscem wzrastania w wierze.'
                ),
                RankTaskData(text:
                'Refleksja w celu głębszego rozumienia chrześcijańskiej postawy miłości.',
                    description: 'Miłość chrześcijańska to nieustanne bezinteresowne dawanie siebie innym. Harcerka, aby dać, musi najpierw posiadać. Musi być świadoma swoich mocnych i słabych stron, swoich ograniczeń i talentów. Dąży do panowania nad sobą. Starsza wędrowniczka poświęca innym swoją uwagę, czas, umiejętności, wiedzę i modlitwę. Daje, bo sama została przez Boga obdarowana. Daje codziennie, nie tracąc jednocześnie siebie.'
                ),
                RankTaskData(text:
                'Czynienie dobra w jego zwykłym codziennym wymiarze.',
                    description: 'Służba drugiemu człowiekowi to nie tylko zaplanowane i zrealizowane działanie w formie akcyjnej lub długotrwałej, ale przede wszystkim nasza codzienność – miejsca i ludzie, których spotykamy na co dzień. Starsza wędrowniczka ma dla innych dobre słowo, miły gest, pogodę ducha. Codziennie zdaje egzamin z takiej postawy. Uczy się świadomie patrzeć na swoje życie jako na służbę innym najczęściej przejawiającą się w drobnych gestach i uczynkach, czasem nawet nieuświadomionych.'
                ),
                RankTaskData(text:
                'Budowanie postawy wrażliwości na otaczające piękno poprzez świadome i aktywne poszukiwania jego źródeł.',
                    description: 'Starsza wędrowniczka dostrzega piękno w przyrodzie, sztuce, innych ludziach. W ramach próby na stopień wykształca w sobie postawę odkrywania tego piękna, budowania swoich własnych kryteriów wyboru tej czy innej książki, filmu, trasy wędrówki. Uczy się zatrzymywania się w życiu albo na szlaku po to, by patrzeć, podziwiać. Doświadcza wartości kontemplowania piękna w otaczającym świecie i poszukiwania jego źródeł.'
                )
              ]
          ),

          RankGroupData(
              title: _GROUP_TITLE_ROZWOJ_SPOL_PATR_OBYW,
              taskData: [
                RankTaskData(text:
                'Szacunek dla otaczającego świata, świadomość aktualnych zagrożeń, poszukiwanie wiedzy o ich źródłach.',
                    description: 'Starsza wędrowniczka dostrzega związek między swoimi codziennymi działaniami a ich globalnym wpływem na środowisko. Stara się wcielać w życie zasady życia w harmonii z przyrodą, buduje w sobie odruchy oszczędzania zasobów planety, z których korzysta.'
                ),
                RankTaskData(text:
                'Świadomość aktualnych wyzwań stojących przed Polską, Europą i światem; poszukiwanie swojego miejsca w życiu obywatelskim i kulturalnym.',
                    description: 'Starsza wędrowniczka ze względu na swoje doświadczenia życiowe jest osobą, która posiada co najmniej podstawową wiedzę dotyczącą problemów natury społecznej, kulturalnej, ekonomicznej czy politycznej. Próba na stopień ma pomóc harcerce spojrzeć na kwestię swojego uczestnictwa w życiu publicznym poprzez pryzmat harcerstwa – z uwzględnieniem harcerskiej idei w działaniach na rzecz wspólnoty lokalnej, w rodzinie, wśród znajomych, w szkole czy w pracy. Aspekt ten ma być również widoczny w jej rozumieniu i ewentualnej aktywności związanej z rozwiązywaniem problemów o zasięgu globalnym. '
                ),
                RankTaskData(text:
                'Odwaga w podejmowaniu zadań.',
                    description: 'Starsza wędrowniczka wkracza w świat harcerskiej idei, postaw, działań i wyzwań. Poznaje smak harcerskich wyzwań, podchodzi do nich pogodnie, uczy się przezwyciężać trudności, stawiać wyzwania przed sobą samą. Uczy się dokonywania właściwych wyborów, zachowując odpowiednie proporcje pomiędzy działaniem w środowisku harcerskim a innymi sferami życia.'
                        '\n\nIstotne jest również zrozumienie sensu prostoty i niejednokrotnie rezygnacji z wygód, z których korzystamy w życiu codziennym, na rzecz możliwości doświadczenia i odkrycia czegoś nowego. Spartańskie warunki obozu czy materac zamiast wygodnego łóżka w czasie biwaku, trudy wędrówki, ograniczenie na kilka dni używania telefonu komórkowego itp.'
                )
              ]
          ),

          RankGroupData(
              title: 'Odkrywanie swojego powołania',
              taskData: [
                RankTaskData(text:
                'Świadome poszukiwanie i wybór drogi życiowej poprzez poznanie prawdy o sobie.',
                    description: 'Osoba dorosła może wejść do harcerstwa na różnych etapach swojego życia. W ramach próby na stopień starszej wędrowniczki realizuje konkretne zadanie, które jest nierozerwalnie związane z wybraną przez nią drogą życiową.'
                ),
                RankTaskData(text:
                'Akceptacja swojej kobiecości we wszystkich wymiarach (biologicznym, duchowym, psychicznym), umiejętność krytycznego spojrzenia na popularne wzorce kobiecości.',
                    description: 'Żyjemy w czasach, w których nie da się uciec od pytania: Co to znaczy być kobietą? Czym różni się biologia, psychika, duchowość kobiety i mężczyzny? Czy w ogóle się różni? Co z tego wynika dla nas, dla naszego rozwoju i sposobu wychowania? Co spośród propozycji otaczającego świata możemy wykorzystać, a co powinnyśmy odrzucić? Stopień starszej wędrowniczki ma pomóc harcerce w odnajdywaniu odpowiedzi na te pytania przez pryzmat etyki chrześcijańskiej oraz Prawa Harcerskiego.'
                ),
                RankTaskData(text:
                'Znajomość zasad etyki chrześcijańskiej w dziedzinie płciowości oraz umiejętność ich uzasadnienia.',
                    description: 'Starsza wędrowniczka dąży do zrozumienia swojej płciowości w świetle etyki chrześcijańskiej, a także podejmuje decyzję o życiu zgodnym z tymi zasadami.'
                ),
                RankTaskData(text:
                'Umiejętność uczciwej i obiektywnej oceny własnych zachowań oraz uwalnianie sądów, ocen, decyzji spod wpływu uczuć i nacisków otoczenia.',
                    description: 'Starsza wędrowniczka stara się dokonywać obiektywnej i uczciwej oceny swoich własnych zachowań. Potrafi myśleć samodzielnie, konstruować własne opinie i sądy. Podejmowane przez nią decyzje są racjonalne, niezależne od nacisków otoczenia i chwilowych stanów emocjonalnych.'
                ),
              ]
          ),

          RankGroupData(
              title: _GROUP_TITLE_ROZWOJ_INTELEKTUALNY,
              taskData: [
                RankTaskData(text:
                'Samodzielność myślenia, przezwyciężanie lenistwa myślowego, stały rozwój intelektualny.',
                    description: 'Starsza wędrowniczka ma być osobą świadomą: w podejmowaniu decyzji, w poglądach, które wyznaje, w wyborach, których dokonuje. Ważne jest, by miała świadomość konieczności nieustannej pracy nad tą sferą: zdobywania wiedzy, pogłębiania jej, ćwiczenia umiejętności szerokiego spoglądania na daną dziedzinę, zjawisko, proces.'
                        '\n\nLenistwo myślowe to uleganie modom i popularnym nurtom ujmowania spraw z życia moralnego i społecznego. Starsza wędrowniczka to osoba, która stara się weryfikować te osądy. Uczy się, ćwiczy, rozmawia, szuka autorytetów.'
                ),
                RankTaskData(text:
                'Umiejętność wykorzystywania zdobytej wiedzy teoretycznej.',
                    description: 'Starsza wędrowniczka wkracza w życie dorosłe – potrzebuje konkretnych umiejętności, które przydadzą się w życiu rodzinnym, zawodowym, społecznym. W ramach próby na stopień uczy się, jak zdobywać tę wiedzę (konkretne źródła) oraz w jaki praktyczny sposób ją wykorzystywać; zdobywa dodatkowe umiejętności, poszerza posiadane, dzieli się wiedzą.'
                ),
              ]
          ),

          RankGroupData(
              title: _GROUP_TITLE_ROZWOJ_FIZYCZNY,
              taskData: [
                RankTaskData(text:
                'Dbałość o zdrowie i sprawność fizyczną; odnalezienie formy aktywności ruchowej dla siebie',
                    description: 'Starsza wędrowniczka w ramach próby weryfikuje, czy obrany przez nią styl życia jest właściwy dla jej zdrowia i organizmu. Wypracowuje w sobie odpowiednie nawyki związane z dbaniem o zdrowie i regularną aktywnością fizyczną.'
                ),
                RankTaskData(text:
                'Umiejętność wykorzystywania zdobytej wiedzy teoretycznej.',
                    description: 'Starsza wędrowniczka wkracza w życie dorosłe – potrzebuje konkretnych umiejętności, które przydadzą się w życiu rodzinnym, zawodowym, społecznym. W ramach próby na stopień uczy się, jak zdobywać tę wiedzę (konkretne źródła) oraz w jaki praktyczny sposób ją wykorzystywać; zdobywa dodatkowe umiejętności, poszerza posiadane, dzieli się wiedzą.'
                ),
              ]
          ),

          RankGroupData(
              title: _GROUP_TITLE_ROZWOJ_WSPOLNOTA,
              taskData: [
                RankTaskData(text:
                'Umiejętność animacji działań w środowisku i odpowiedzialność za wspólnotę.',
                    description: 'Harcerka zdobywająca starszą wędrowniczkę często posiada wykształconą umiejętność animowania działań. Doświadczenie oraz umiejętności przez nią zdobyte poza harcerstwem są bardzo cenne. Harcerka wykorzystuje je, uczy się jednocześnie określania priorytetów w swoich działaniach i niezapominania o swoich potrzebach. Uczy się, jak zachować równowagę służby i pracy na rzecz poszczególnych grup, w których żyje, pracuje. Stara się być aktywna w środowisku harcerskim.'
                ),
                RankTaskData(text:
                'Dialog z drugim człowiekiem; świadome posłuszeństwo, funkcjonowanie w organizacji hierarchicznej.',
                    description: 'Starsza wędrowniczka, funkcjonując w środowisku harcerskim, wykorzystuje zasady dobrego dialogu. Uczy się funkcjonowania w organizacji hierarchicznej, buduje w sobie postawę karności i pokory.'
                ),
                RankTaskData(text:
                'Odpowiedzialność za swoje czyny, rzetelność wykonywanej pracy.',
                    description: 'Starsza wędrowniczka w podejmowanych przez siebie działaniach w różnych środowiskach i w funkcjach, które pełni w życiu, stara się postępować w sposób rzetelny i odpowiedzialny: za siebie, za osoby i mienie powierzone jej opiece.'
                        '\n\nPróba na stopień jest czasem, gdy harcerka uczy się dokonywać właściwych wyborów i zachowania właściwych proporcji pomiędzy działaniem w środowisku harcerskim a innymi sferami życia. W podejmowaniu decyzji, które wpływają na jej sposób życia i kontakty z ludźmi lub zobowiązania wobec nich podjęte, kieruje się odpowiednio ustalonymi priorytetami.'
                ),
              ]
          ),
          RankGroupData(
              title: _GROUP_TITLE_WIEDZA_HARCERSKA,
              taskData: [
                RankTaskData(text:
                'Wiedza, znajomość historii i tradycji harcerskiej, znajomość symboliki i obrzędów harcerskich.',
                    description: 'Starsza wędrowniczka jest osobą dorosłą, świadomie podejmuje decyzję o wstąpieniu do ZHR. Powinna więc posiadać podstawową wiedzę na temat środowiska i organizacji, w której działaniach chce uczestniczyć. Kluczowa jest znajomość (co najmniej podstaw) historii ruchu harcerskiego, jej wpływu na jego obecny kształt i związanych z nią tradycji. Konieczna jest też znajomość symboliki i obrzędów harcerskich. Należy zwrócić uwagę na takie oczywistości, jak oznaczenia (co najmniej podstawowych) funkcji w ZHR. Ważne, by zaznajamianie się z obrzędami, symbolami i zwyczajami nie odbywało się na sucho, lecz poprzez doświadczenie.'
                ),
              ]
          ),

          RankGroupData(
              title: 'Umiejętności',
              taskData: [
                RankTaskData(text:
                'Musztra.',
                    description: 'Starsza wędrowniczka zna musztrę w zakresie, który pozwoli jej brać udział w apelu i czuć się w tej sytuacji naturalnie i swobodnie, włączając w to sytuacje, kiedy melduje się indywidualnie, melduje jednostkę czy też jest np. oboźną. Potrafi odpowiednio się zachować w formalnych sytuacjach harcerskich (apel, meldowanie, poruszanie się w szyku itp.).'
                ),
                RankTaskData(text:
                'Zaradność, umiejętności organizacyjne.',
                    description: 'Starsza wędrowniczka jest osobą zaradną, posiada umiejętności organizacyjne. Zdobywanie stopnia powinno być okazją do wykazania się tymi umiejętnościami. Jeżeli osoba przychodzącą do harcerstwa posiada już te cechy, należy je wykorzystać i rozwinąć poprzez realizację próby na stopień. Jeśli jeszcze ich nie ma – pomóc jej je wypracować.'
                ),
                RankTaskData(text:
                'Umiejętności samarytańskie.',
                    description: 'Starsza wędrowniczka posiada umiejętność niesienia pierwszej pomocy w podstawowym zakresie. Wie, jak się zachować w czasie wypadku samochodowego, którego jest świadkiem, co zrobić, gdy ktoś zasłabnie, dostanie ataku serca/epilepsji/hipoglikemii itp. Wie, jak odpowiedzialnie i prawidłowo nieść pierwszą pomoc przedmedyczną.'
                ),
                RankTaskData(text:
                'Umiejętności obozowe, terenoznawcze, przyrodnicze.',
                    description: 'Puszczaństwo jest nieodłącznym i niezbędnym elementem metody harcerskiej, podobnie jak podstawowe umiejętności terenoznawcze, przyrodnicze i obozowe. Doskonałą okazją do ich zdobycia i doświadczenia puszczańskiego życia jest obóz.'
                ),
              ]
          ),

          RankGroupData(
              title: 'Doświadczenie',
              taskData: [
                RankTaskData(text:
                'Doświadczenie służby harcerskiej oraz obozowania.',
                    description: 'Obóz.'
                        '\n\nStarsza wędrowniczka nadrabia poprzednie stopnie poprzez zdobywanie nowych doświadczeń i przeżyć harcerskich. Doskonałym miejscem na uzupełnienie braków doświadczenia jest obóz harcerski, dlatego niezwykle ważne jest, by starsza wędrowniczka miała doświadczenia z nim związane. Zdobywanie umiejętności terenoznawczych, przyrodniczych czy obozowych powinno być związane z obozem harcerskim. Nie można zdobyć doświadczenia harcerskiego, nie będąc na obozie. Właściwe rozumienie puszczaństwa, doświadczenie bliskości przyrody, dbałość o nią nierozerwalnie łączą się z obozem.'
                        '\n\nNajlepiej, jeśli harcerka ma możliwość pełnego uczestnictwa w obozie, zrozumiałe jest jednak, że u osób dorosłych może być to niemożliwe. Ważne jest jednak, by przez doświadczenie poznać różne formy obozowania. Może to być uczestnictwo w obozie jako opiekun, może to być pomoc w przygotowaniu obozu oraz uczestnictwo w kwaterce, udział w określonej części obozu (np.: pionierka + wędrówka).'
                        '\n\nSłużba.'
                        '\n\nW wymiarze służby harcerskiej można od starszej wędrowniczki wymagać pracy nad indywidualną jej formą: zakresem, charakterem, intensywnością, ustaleniem priorytetów, dojrzałością do danych działań. Konieczne jest, by starsza wędrowniczka uczyła się systematyczności, szczególnie w dziedzinie podejmowanej służby harcerskiej. Może nią być zaangażowanie w działalność harcerską, jednak w takim przypadku należy pamiętać, by wiązało się to z jasno określonymi obowiązkami i odpowiedzialnością. Jeśli harcerka udziela się społecznie, ma zobowiązania, których podjęła się wcześniej, jak najbardziej mogą one być jej polem służby. Istotne jest, by spełniały wymienione wyżej warunki.'
                ),
                RankTaskData(text:
                'Próba szlaku.',
                    description: 'Dla harcerki zdobywającej stopień starszej wędrowniczki próba szlaku jest równocześnie próbą końcową. Jest to wyzwanie, możliwość odkrywania nowych miejsc i ludzi, poszukiwanie piękna w otoczeniu i w ludziach, a także odkrywanie prawdy o sobie samej.'
                        '\n\nOdbycie próby szlaku może być połączone z realizacją innych zadań.'
                ),
                RankTaskData(text:
                'Świadome wykorzystywanie narzędzi metody harcerskiej do samorozwoju.',
                    description: 'Starsza wędrowniczka dopiero wkracza w harcerski świat, dlatego istotna jest kwestia rozumienia sensu samorozwoju poprzez zdobywanie stopni i sprawności harcerskich. Starsza wędrowniczka uczy się konstruowania próby na stopnie harcerskie, świadomie wykorzystuje w swoim rozwoju osobistym i harcerskim narzędzie, jakim jest zdobywanie sprawności. Wszelkie podejmowane w tym zakresie czynności są dla niej drogą do celu, nie zaś celem samym w sobie.'
                        '\n\nW ramach próby zdobędzie przynajmniej 3 sprawności.'
                ),
              ]
          )
        ],
      ),
    ]
);
RankZHRD rankZhrHarcD4S = rankZhrHarcD4SData.build();

RankZHRDData rankZhrHarcD5Data = RankZHRDData.from(
    title: 'Harcerka Rzeczypospolitej',
    version: 1,
    org: Org.zhr_d,
    id: 'HARC_D_5',
    minWiek: 'powyżej 18 lat',
    czasTrw: 'do 2 lat',
    zalozenia: 'Harcerka Rzeczypospolitej jest świadoma swej roli, którą już podejmuje lub podejmie w przyszłości jako kobieta. Ma wypracowany własny styl i ugruntowane poglądy. Jednocześnie jest osobą otwartą na innych ludzi.'
        '\n\nAkceptuje i realizuje w życiu ideały harcerskie. Jest odpowiedzialna za siebie i swoich bliskich.'
        '\n\nDba o swój harmonijny rozwój. Nie zaniedbuje zdobytej wcześniej wiedzy i umiejętności, a także wypracowanych pozytywnych cech charakteru. Jest mistrzynią w swojej specjalizacji (harcerskiej, zawodowej), nie zamyka się jednak na nowe doświadczenia, próbuje swoich sił w nowych dziedzinach.'
        '\n\nJest samodzielna, sama stawia przed sobą cele i zadania. Wie, że czeka ją jeszcze wiele wyzwań, które postawi przed nią życie. Jest gotowa je podjąć i wykorzystać do swego dalszego rozwoju oraz ubogacania innych. Jest świadoma, że jej próba na stopień kończy się tylko w sensie formalnym, a nie rzeczywistym.',
    punktWyjsc: 'Harcerka powyżej 18 lat.'
        '\n\nStopień zdobywa harcerka w stopniu wędrowniczki lub wędrowniczki starszej.',
    wskazowki: 'Harcerka zdobywająca stopień Harcerki Rzeczypospolitej to samodzielna osoba, która powinna mieć zasadniczy wpływ na kształt swojej próby. Opiekunka powinna wykazać się dużą mądrością, delikatnością, ale też stanowczością w pewnych sytuacjach. Rolą opiekunki będzie przede wszystkim pokazywanie kierunków, w których warto podążać, podpowiadanie miejsc, osób, lektur, w których można znaleźć odpowiedzi na ważne pytania, a nie podawanie gotowych rozwiązań. Opiekunka powinna być przygotowana, by podejmować w razie potrzeby delikatne, ale ważne kwestie związane z rozwojem duchowym, rozumieniem kobiecości, miłości, małżeństwa i rodziny. Choć może to być trudne, rolą opiekunki jest też ciągłe dbanie o dynamiczną realizację próby, m.in. poprzez regularne kontakty ze zdobywającą stopień harcerką i podsumowywanie kolejnych etapów.',
    sylwetka: null,
    postawa: null,
    wiedzaHarc: null,
    umiejetnosci: null,
    doswiadczenie: null,
    catData: [
      const RankCatData(
        title: 'Rozwój',
        icon: RankData.iconCatRozwoj,
        groupData: [
          RankGroupData(
              title: 'Rozwój duchowy',
              taskData: [
                RankTaskData(text:
                'Pogłębianie swojej świadomości religijnej, osobistego świadectwa wiary i uczestnictwo w życiu Kościoła jako wspólnoty.',
                  description: 'Harcerka Rzeczypospolitej wypracowuje indywidualne i odpowiednie dla siebie metody pielęgnowania i pogłębiania swojej osobowej relacji z Panem Bogiem.'
                      '\n\nPosiada doświadczenie wiary przeżywanej indywidualnie i wspólnotowo (może to być wspólnota parafialna, duszpasterstwo – np. harcerskie, jeden z ruchów formacyjnych; ważne, by doświadczenie uczestniczenia we wspólnocie wierzących było obecne w życiu Harcerki Rzeczypospolitej).'
                      '\n\nPogłębia swoją wiedzę religijną. Szuka odpowiedzi na pytania dotyczące wiary i życia religijnego. Stara się dawać swoim życiem świadectwo chrześcijańskiego doskonalenia siebie. Dzieli się z innymi doświadczeniami wiary przeżywanej na co dzień.',
                ),
                RankTaskData(text:
                'Rozumienie miłości jako dojrzałej chrześcijańskiej postawy i jej realizacja w codziennym życiu.',
                    description: 'Harcerka Rzeczypospolitej jest wierna swojemu powołaniu. Potrafi wyznaczać sobie dalekosiężne cele i etapy potrzebne do ich osiągnięcia. Żyje tu i teraz, nie ucieka od rzeczywistości. Jest wytrwała w dążeniu do celu. Jest szczera w uczuciach, ale potrafi panować nad ich wyrażaniem. Opiera swoje wybory życiowe na trwałych wartościach. Potrafi o nie walczyć, ale kiedy trzeba – rezygnować. Chce pozostać sobą ze swoją indywidualnością i przekonaniami. Potrafi przezwyciężać własny egoizm, otwierać się na potrzeby innych, nie tracąc przy tym swojej niezależności. Kiedy trzeba, nie boi się prosić o radę i pomoc. Potrafi mądrze spożytkować swój gniew, przekształcając go w impuls do pozytywnych działań.'
                ),
                RankTaskData(text:
                'Poszukiwanie prawdy o świecie, życiu, sobie samej.',
                    description: 'Harcerka Rzeczypospolitej próbuje podejmować coraz głębszą, pełniejszą refleksję na temat swojego życia. Uczy się wyciągać wnioski z różnych wydarzeń, które ją spotykają.'
                )
              ]
          ),

          RankGroupData(
              title: _GROUP_TITLE_ROZWOJ_SPOL_PATR_OBYW,
              taskData: [
                RankTaskData(text:
                'Szacunek do otaczającego świata, świadomość aktualnych zagrożeń, podjęcie odpowiedzialności za jego ochronę.',
                    description: 'Harcerka Rzeczypospolitej ma świadomość problemów związanych z ekologią, zagrożeń świata jako planety. Ma określoną wiedzę w tym zakresie i stosuje ją w praktyce. Podejmuje kroki zmierzające do zmian wokół niej (rodzina, wspólnota harcerska, przyjaciele itp.). Przekazuje swoją wiedzę i dobre nawyki innym.'
                ),
                RankTaskData(text:
                'Świadomość aktualnych wyzwań stojących przed Polską na tle sytuacji społeczno-politycznej w Europie i na świecie.',
                    description: 'Harcerka Rzeczypospolitej orientuje się w sytuacji społeczno-politycznej Polski na tle Europy i świata, wypracowuje swoje poglądy i potrafi je zaprezentować. Ma świadomość współodpowiedzialności za Ojczyznę, podejmuje konkretne działania obywatelskie.'
                ),
                RankTaskData(text:
                'Odpowiedzialność za swoje czyny, rzetelność wykonywanej pracy. Praca nad efektywnym wykorzystaniem czasu i umiejętnością koncentracji.',
                    description: 'Harcerka Rzeczypospolitej podejmuje się zadań odpowiedzialnie, będąc świadomą swoich predyspozycji do danych działań, możliwości czasowych, priorytetów. Podchodzi do tych zadań w sposób rzetelny, punktualny, odpowiedzialny. Stara się być niezawodna. Można na niej polegać. Rozlicza się do końca z podjętych zobowiązań.'
                ),
              ]
          ),

          RankGroupData(
              title: 'Odkrywanie swojego powołania',
              taskData: [
                RankTaskData(text:
                'Umiejętność świadomego wyboru drogi życiowej.',
                    description: 'Harcerka Rzeczypospolitej uczy się dokonywania wyborów życiowych poprzez rozeznanie, poznanie swoich potrzeb, zrozumienie siebie i świata, w którym przyszło jej żyć. Rozeznanie powołania może się dokonać w drodze poszukiwania prawdy o sobie samym w głębi własnego serca.'
                ),
                RankTaskData(text:
                'Akceptacja swojej kobiecości we wszystkich wymiarach.',
                    description: 'Harcerka Rzeczypospolitej zna siebie, swoje ograniczenia, ale przede wszystkim możliwości wynikające z faktu bycia kobietą. Ma świadomość życiowych ról i wyzwań, jakie mogą stać się jej udziałem, dlatego przygotowuje się do nich jak najlepiej'
                        '\n\nHarmonijnie rozwija się w różnych sferach (fizycznej, psychicznej, umysłowej, duchowej), co umożliwia jej akceptację własnej osoby.'
                ),
              ]
          ),

          RankGroupData(
              title: _GROUP_TITLE_ROZWOJ_INTELEKTUALNY,
              taskData: [
                RankTaskData(text:
                'Samodzielność myślenia, przezwyciężanie lenistwa myślowego, podnoszenie swoich kwalifikacji.',
                    description: 'Harcerka Rzeczypospolitej jest osobą świadomą konieczności nieustannej pracy nad sobą, samokształcenia i rozwoju: zdobywa wiedzę, pogłębia ją, ćwiczy umiejętności szerokiego spoglądania na daną dziedzinę, zjawisko, proces. Jest myślowo niezależna, podąża drogą wartości, jaką wskazuje chrześcijaństwo i harcerstwo.'
                        '\n\nZ praktycznego punktu widzenia Harcerka Rzeczypospolitej dąży do samodzielności finansowej – planuje swoją edukację, zdobywa umiejętności, które pozwolą jej na podejmowanie pracy zarobkowej. Podejmuje już pracę lub uczestniczy w stażach czy praktykach, które w przyszłości ułatwią jej start na rynku pracy. Zdobywa konkretne uprawnienia państwowe.'
                ),
              ]
          ),

          RankGroupData(
              title: _GROUP_TITLE_ROZWOJ_FIZYCZNY,
              taskData: [
                RankTaskData(text:
                'Dbałość o zdrowie i sprawność fizyczną.',
                    description: 'Harcerka Rzeczypospolitej zna i stosuje w praktyce zasady zdrowego odżywiania. Dba o zdrowie, stosuje zasady profilaktyki prozdrowotnej. Nie zapomina o odpowiedniej długości czasu snu i ma wypracowane najlepsze dla siebie formy odpoczynku. Jest sprawna fizycznie, wypracowała nawyk regularnej aktywności fizycznej.'
                ),
              ]
          ),

          RankGroupData(
              title: _GROUP_TITLE_ROZWOJ_WSPOLNOTA,
              taskData: [
                RankTaskData(text:
                'Umiejętność pełnienia funkcji w rodzinie i w gronie bliskich jej osób.',
                    description: 'Harcerka Rzeczypospolitej żyje według ustalonych priorytetów, wśród których rodzina i bliscy zajmują wysoką pozycję. Jest odpowiedzialna za rodzinę, w której żyje (zarówno tę, w której się wychowała, jak i tę, którą być może już sama tworzy). W kontaktach z najbliższymi stosuje zasady dobrego dialogu, rozpoznaje potrzeby innych i stara się wyjść im naprzeciw.'
                        '\n\nPróbuje podejmować również odpowiedzialność finansową za swoją rodzinę.'
                ),
                RankTaskData(text:
                'Służba w środowisku harcerskim.',
                    description: 'Harcerka Rzeczypospolitej jest w harcerstwie w sposób świadomy. Zakres jej harcerskiej działalności jest w harmonijny sposób powiązany z życiem rodzinnym i zawodowym. Bierze odpowiedzialność za wspólnotę harcerską, w której funkcjonuje.'
                ),
                RankTaskData(text:
                'Umiejętność wychodzenia z harcerskimi postawami w środowisko pozaharcerskie.',
                    description: 'Stara się promować harcerską postawę przez przykład własny. Tworzy lub współtworzy wspólnotę poza harcerstwem, wykorzystując nabyte w harcerstwie umiejętności animacji wspólnych poczynań.'
                ),
              ]
          ),

          RankGroupData(
              title: 'Wiedza, umiejętności i doświadczenie harcerskie.',
              taskData: [
                RankTaskData(text:
                'Dojrzałe przeżywanie harcerskiej przygody.',
                    description: 'Harcerka Rzeczypospolitej to dorosła, świadomie rozwijająca się kobieta-harcerka, która żyje w zgodzie z ideą harcerską. Doskonale dostrzega płaszczyznę, na której jej życie prywatne i harcerska droga pokrywają się i uzupełniają. Świadomie wykorzystuje metodę harcerską i jej narzędzia do rozwoju osobistego, zarówno pracując nad swoim charakterem, jak i zdobywając wiedzę czy nowe umiejętności. W ramach realizacji próby zdobyła przynajmniej jedną nową sprawność.'
                        '\n\nHarcerka Rzeczypospolitej to harcerka, która nie zaniedbuje umiejętności zdobytych i wypracowanych wcześniej – rozwija je i wykorzystuje. W pracy harcerskiej wykorzystuje swój potencjał; zdobytą wiedzą i umiejętnościami dzieli się z innymi. Zostawiła trwały ślad własnej służby harcerskiej.'
                ),
              ]
          )
        ],
      ),
    ]
);
RankZHRD rankZhrHarcD5 = rankZhrHarcD5Data.build();
