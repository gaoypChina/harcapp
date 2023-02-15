import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models/rank_def.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models/rank_zhr_c.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/stopnie/models_common/rank_task.dart';

RankDefData rankZhrZuchC1Data = RankDefData(
    titleMale: 'Zuch pierwszej gwiazdki',
    version: 1,
    org: Org.zhr_c,
    id: 'ZUCH_C_1',
    catData: [
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_1,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_1,
                taskData: [
                  RankTaskData(text: 'Zna Prawo Zucha i zgodnie z nim postępuje.'),
                  RankTaskData(text: 'Jest koleżeński i pogodny, nie gniewa się i unika zaczepki.'),
                  RankTaskData(text: 'Umie zachować się w świątyni.'),
                  RankTaskData(text: 'Śpiewa pieśni religijne, np. kolędy.'),
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
                  RankTaskData(text: 'Zna symbole narodowe i umie się wobec nich zachować.'),
                  RankTaskData(text: 'Zna najbliższą okolicę i umie wskazać drogę do najważniejszych punktów.'),
                  RankTaskData(text: 'Ładnie mówi po polsku, nie kaleczy języka brzydkimi wyrazami.'),
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
                  RankTaskData(text: 'Stara się poznać przyrodę i być jej przyjacielem.'),
                  RankTaskData(text: 'Był z gromadą w lesie na zielonej wycieczce.'),
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
                  RankTaskData(text: 'Jest dla wszystkich grzeczny i uczynny.'),
                  RankTaskData(text: 'We wszystkim słucha rodziców.'),
                  RankTaskData(text: 'Jest czysty i zachowuje czystość wokół siebie.'),
                  RankTaskData(text: 'Umie posługiwać się igłą, młotkiem, itd..'),
                  RankTaskData(text: 'Lubi się gimnastykować, pląsać, śpiewać.'),
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
                  RankTaskData(text: 'Umie oddać pokłon zuchowy.'),
                  RankTaskData(text: 'Chętnie uczestniczy w zajęciach na zbiórce, przestrzega prawideł gry i bez ociągania wykonuje polecenia drużynowego.'),
                ]
            )
          ]
      )
    ]
);
RankDef rankZhrZuchC1 = rankZhrZuchC1Data.build();

RankDefData rankZhrZuchC2Data = RankDefData(
    titleMale: 'Zuch drugiej gwiazdki',
    version: 1,
    org: Org.zhr_c,
    id: 'ZUCH_C_2',
    catData: [
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_1,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_1,
                taskData: [
                  RankTaskData(text: 'Jest słowny, odważny, można na nim polegać.'),
                  RankTaskData(text: 'Codziennie stara się czynić coś dobrego.'),
                  RankTaskData(text: 'Wraz z gromadą uczestniczy w obrzędach religijnych.'),
                  RankTaskData(text: 'Pomaga w przygotowaniach świątecznych.'),
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
                  RankTaskData(text: 'Umie zachować się przy oddaniu czci sztandarowi.'),
                  RankTaskData(text: 'Zna zabytki, fakty historyczne dotyczące miejscowości (okolicy).'),
                  RankTaskData(text: 'Nie zaniedbuje się w nauce.'),
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
                  RankTaskData(text: 'Stara się tropić życie przyrody, umie wykorzystać jej dary majsterkując.'),
                  RankTaskData(text: 'Systematycznie opiekuje się zwierzęciem lub rośliną, umie o niej opowiedzieć.'),
                  RankTaskData(text: 'Umie przygotować się do wyprawy i chętnie w niej uczestniczy.'),
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
                  RankTaskData(text: 'Pomoże mniej zaradnym, stanie w obronie słabszego.'),
                  RankTaskData(text: 'Umie zachować się wobec dorosłych.'),
                  RankTaskData(text: 'Jest pożyteczny, wyręcza rodziców w drobnych pracach domowych, pomaga rodzeństwu.'),
                  RankTaskData(text: 'Sam dba o swoje rzeczy.'),
                  RankTaskData(text: 'Potrafi unikać przeziębienia.'),
                  RankTaskData(text: 'Jeździ na rowerze, wrotkach lub łyżwach itp.'),
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
                  RankTaskData(text: 'Szybko i sprawnie wykonuje polecenia drużynowego i przybocznych.'),
                  RankTaskData(text: 'Przeprowadzi grę, ćwiczenie, pląs w gromadzie.'),
                  RankTaskData(text: 'Wykona element stroju lub dekoracji potrzebny w zabawie.'),
                  RankTaskData(text: 'Narysował lub opisał w księdze lub w piśmie gromady ciekawe zdarzenie.'),

                ]
            )
          ]
      )
    ]
);
RankDef rankZhrZuchC2 = rankZhrZuchC2Data.build();

RankDefData rankZhrZuchC3Data = RankDefData(
    titleMale: 'Zuch trzeciej gwiazdki',
    version: 1,
    org: Org.zhr_c,
    id: 'ZUCH_C_3',
    catData: [
      const RankCatData(
          title: RankData.ZUCH_RANK_ZHR_STREF_COLOR_1,
          groupData: [
            RankGroupData(
                title: RankData.ZUCH_RANK_ZHR_STREF_TITLE_1,
                taskData: [
                  RankTaskData(text: 'Jest niezawodny, można być pewnym, że powierzone zadanie wykona.'),
                  RankTaskData(text: 'Jest przykładem dla młodszych.'),
                  RankTaskData(text: 'Brał udział np. w jasełkach.'),
                  RankTaskData(text: 'Wraz z szóstką zaopiekował się miejscem kultu, np. kapliczką przydrożną.'),
                  RankTaskData(text: 'Odda hołd zmarłym.'),
                  RankTaskData(text: 'Świętował rocznice narodowe, np. 3 V, 11 XI.'),
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
                  RankTaskData(text: 'Wskaże Polskę na mapie świata.'),
                  RankTaskData(text: 'Zna co najmniej kilka słów w innym języku.'),
                  RankTaskData(text: 'Zna kilka legend i opowieści z dziejów Polski.'),
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
                  RankTaskData(text: 'Umie zachować się w lesie, spędził z gromadą kilka godzin obserwując jego życie.'),
                  RankTaskData(text: 'Potrafi wykorzystać dary lasu nie niszcząc środowiska.'),
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
                  RankTaskData(text: 'Zorganizował grę, zawody, teatr dla dzieci młodszych.'),
                  RankTaskData(text: 'Pomógł osobie starszej, chorej lub niepełnosprawnej.'),
                  RankTaskData(text: 'Potrafi naprawić proste uszkodzenie przedmiotu.'),
                  RankTaskData(text: 'Ma stały przydział obowiązków domowych i sumiennie się z nich wywiązuje.'),
                  RankTaskData(text: 'Szanuje rzeczy cudze i swoje, umie zabezpieczyć je przed zniszczeniem.'),
                  RankTaskData(text: 'Umie pływać lub wykazał się umiejętnościami w innej dyscyplinie sportu.'),
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
                  RankTaskData(text: 'Wywiązuje się ze swojej funkcji w gromadzie (np. szóstkowy, kronikarz, gospodarz skarbca).'),
                  RankTaskData(text: 'Podpatrzy zwyczaje harcerskie.'),
                  RankTaskData(text: 'Zaprzyjaźni się z harcerzem z bratniej drużyny.'),
                ]
            )
          ]
      )
    ]
);
RankDef rankZhrZuchC3 = rankZhrZuchC3Data.build();


RankZHRCData rankZhrHarcC0Data = RankZHRCData.from(
  title: 'Próba harcerza',
  version: 1,
  org: Org.zhr_c,
  id: 'HARC_C_0',
  minWiek: '–',
  czasTrw: 'do 3 miesięcy',
  idea: null,
  koment: [
    const RankGroupData(
        title: 'Dla harcerza',
        taskData: [
          RankTaskData(text: 'Przyszedłem na pierwszą zbiórkę i poznaję czym jest harcerstwo. Chcę zostać harcerzem i rozumiem z czym się to wiąże. Poznaję moją drużynę i zastęp, kompletuję mundur i chcę szybko rozpocząć zdobywanie pierwszego stopnia harcerskiego.', checkable: false),
        ]),
    const RankGroupData(
        title: 'Dla drużynowego',
        taskData: [
          RankTaskData(text: 'Próba harcerza nie jest stopniem. Rozpoczyna się w momencie przyjścia chłopca na pierwszą zbiórkę. Jej czas nie może przekraczać 3 miesięcy. Zakończenie próby harcerza jest równoznaczne z przyjęciem druha do drużyny i otwarciem stopnia młodzika bądź innego – adekwatnego do wieku. Celem próby jest wdrożenie chłopca w życie harcerskie, umożliwienie mu poznania drużyny – dlatego przeprowadza się ją w oparciu o jej tradycję.', checkable: false),
        ]),
  ],
  cats: [
    const RankCatData(
      title: 'Przykładowa próba',
      groupData: [
        RankGroupData(
            taskData: [
              RankTaskData(
                  text: 'Poniższe wymagania stanowią jedynie przykładowe zadania, spośród których drużynowy układa indywidualną, dopasowaną do chłopca próbę uzupełnioną o tradycje drużyny. Ważnym jest, aby składała się ona z zadań, które pozwolą na zakończenie jej po trzech miesiącach i rozpoczęcie zdobywania stopnia młodzika.'
                      '\n\n• Uzyskał pisemną zgodę rodziców na wstąpienie do ZHR i przekazał ją drużynowemu.'
                      '\n\n• Wie, dlaczego chce być harcerzem. Wie, czego od harcerza wymaga Prawo Harcerskie; wie, że jako harcerz ma służyć Bogu Ojczyźnie i bliźniemu – podakilka przykładów takiej służby.'
                      '\n\n• Odbył próbę dzielności (harc) ustaloną przez drużynowego.'
                      '\n\n• Zna numer, kolor chusty, symbole, nazwę i patrona drużyny.'
                      '\n\n• Zna imię i nazwisko drużynowego oraz zastępowego i potrafi się z nimi skontaktować (wie gdzie mieszkają, zna ich numery telefonów i adresy e-mail), zna sieć alarmową zastępu.'
                      '\n\n• Umie przywitać się i zameldować po harcersku.'
                      '\n\n• Zna symbolikę lilijki harcerskiej. Wie, co oznacza pozdrowienie "Czuwaj", rozszyfruje skrót ZHR i wie, po czym poznać przynależność do tej Organizacji.'
                      '\n\n• Systematycznie i punktualnie uczestniczy w zbiórkach zastępu i drużyny.'
                      '\n\n• Skompletował i szanuje mundur (bluza, spodenki, pas, getry, nakrycie głowy).'
                      '\n\n• Zna trzy pieśni harcerskie – np. Hymn, Modlitwę i Bratnie Słowo.',
                  checkable: false
              )
            ]
        )
      ],
    )
  ],
);
RankZHRC rankZhrHarcC0 = rankZhrHarcC0Data.build();

RankZHRCData rankZhrHarcC0SData = RankZHRCData.from(
  title: 'Próba dorosłego harcerza',
  version: 1,
  org: Org.zhr_c,
  id: 'HARC_C_0S',
  minWiek: 'powyżej 18 lat',
  czasTrw: '3 – 6 miesięcy',
  idea: 'Rozumiem, czym jest harcerstwo, poznaję harcerskie ideały, założenia organizacyjne oraz program Organizacji. Przyjmuję za swój system wartości oparty na służbie Bogu, Polsce i bliźnim. Zdobyłem podstawową wiedzę i umiejętności harcerskie, doskonalę je i poszerzam. Potrafię budować braterskie więzi z innymi harcerzami. Jestem / staję się abstynentem, w swoim środowisku świadczę o swoim harcerstwie. Przynależę do określonego środowiska harcerskiego i rozumiem jego tradycje i zwyczaje. Dbam o swoje zdrowie i pracuję nad sprawnością fizyczną. Mam swój mundur i pełne wyposażenie harcerskie.',
  koment: [
    const RankGroupData(
      taskData: [
        RankTaskData(text: 'Próba nie jest stopniem, tylko - podobnie jak w przypadku chłopca przychodzącego do drużyny w wieku szkolnym - sposobem na świadomy akces do ruchu harcerskiego. Celem próby jest zdobycie podstawowego wyrobienia harcerskiego umożliwiającego dalszy rozwój.', checkable: false)
      ],
    )
  ],
  cats: [
    const RankCatData(
      title: 'Przykładowa próba',
      groupData: [
        RankGroupData(
            taskData: [
              RankTaskData(text:
              '• Swoim życiem świadczy o swojej wierze, podejmuje działania pomagające we wzroście duchowym,a naweto charakterze apostolskim.'
                  '\n\n• Zna historię Polski, potrafi wymienić najważniejsze wydarzenie i ludzi, którzy szczególnie zasłużyli się dla Ojczyzny.'
                  '\n\n• Orientuje się w sytuacji społeczno-politycznej Polski, potrafi uzasadnić swoje wybory polityczne,'
                  '\n\n• Podjął się stałego pola służby.'
                  '\n\n• Podjął zadanie samodoskonalenia.'
                  '\n\n• Jest przyjazny i opiekuńczy wobec kobiet i dziewcząt, przygotował obiad, na który zaprosił zaprzyjaźnione harcerki.'
                  '\n\n• Stosuje musztrę: osobistą i drużyny, zna zasady musztry ze sztandarem.'
                  '\n\n• Poznał techniki harcerskie. Samarytanka, terenoznawstwo i sygnalizacja nie mają dla niego tajemnic.'
                  '\n\n• Poradzi sobie w lesie w każdej sytuacji, potrafi przygotować odpowiednie schronienie dla siebie i kilku osób, ugotować posiłek w warunkach polowych, rozpoznaje rośliny i zwierzęta.'
                  '\n\n• Potrafi rozstawić namiot, zaplanować i zbudować elementy pionierki namiotowej i obozowej, wykonał elementy zdobnictwa.'
                  '\n\n• Wiąże różne węzły, strzela z wiatrówki, łuku, pistoletów sportowych.'
                  '\n\n• Zna się na podchodzeniu, umie kamuflować się w każdych warunkach, czołgać i kryć.'
                  '\n\n• Zna historię harcerstwa od momentu powstania do dnia dzisiejszego, potrafi opisać genezę jego powstania, o wybranym okresie z historii potrafi opowiadać ze szczegółami.'
                  '\n\n• Uzasadnił wychowawczo i historycznie przyczyny powstania ZHR, zna dzieje Związku.'
                  '\n\n• Zna i rozumie strukturę organizacyjną ZHR, wie kto stoina czele Związku i Organizacji.'
                  '\n\n• Pracuje nad swoją sprawnością fizyczną, poprawił wyniki w wybranych dyscyplinach (np. bieganie, pływanie, skoki w dal, wzwyż, itp.).',
                  checkable: false
              )
            ]
        )
      ],
    ),
  ],
);
RankZHRC rankZhrHarcC0S = rankZhrHarcC0SData.build();

RankZHRCData rankZhrHarcC1Data = RankZHRCData.from(
  title: 'Młodzik',
  version: 1,
  org: Org.zhr_c,
  id: 'HARC_C_1',
  minWiek: '11 – 13 lat',
  czasTrw: '3 – 4 miesiące',
  idea: 'Wiem, co to znaczy być harcerzem. Znam Prawo Harcerskie. Jestem gotowy złożyć Przyrzeczenie Harcerskie. Jestem samodzielny i gotowy do służby. Pomagam innym. Odróżniam dobro i zło. Postępuję zgodnie ze wskazaniami wiary chrześcijańskiej. Poprzez dobre uczynki staję się coraz lepszy. Jestem dobrym synem, kolegą i uczniem.',
  koment: null,
  cats: [
    const RankCatData(
      title: 'Praca nad charakterem',
      icon: RankData.iconCatCharakter,
      groupData: [
        RankGroupData(
            title: 'Kształtowanie charakteru',
            taskData: [
              RankTaskData(text: 'Zna Prawo i Przyrzeczenie Harcerskie.'),
              RankTaskData(text: 'Pracuje nad własnym charakterem – zna swoje wady i walczy z nimi, jest punktualny i obowiązkowy.'),
              RankTaskData(text: 'Regularnie spełnia dobre uczynki.'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój religijny',
            taskData: [
              RankTaskData(text: 'Praktykuje swoją wiarę (pamięta o codziennej modlitwie, w niedziele i święta uczestniczy we Mszy Świętej).'),
              RankTaskData(text: 'Zna podstawowe fakty z życia Jezusa Chrystusa.'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój intelektualny',
            taskData: [
              RankTaskData(text: 'Jest dobrym uczniem, poprawił wyniki w nauce.'),
              RankTaskData(text: 'Przedstawił się i opowiedział o sobie w dowolnym języku obcym.'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój fizyczny',
            taskData: [
              RankTaskData(text: 'Poprawił swoją sprawność fizyczną w wybranym zakresie – np. nauczył się wspinać / jeździć na rowerze (zdobył kartę rowerową) / szybciej biega / nauczył się pływać (zdobył kartę pływacką) itp.'),
            ]
        )
      ],
    ),

    const RankCatData(
      title: 'Harcerskie wtajemniczenie',
      icon: RankData.iconCatHarcWtajem,
      groupData: [
        RankGroupData(
            title: 'Doświadczenie harcerskie',
            taskData: [
              RankTaskData(text: 'Przez co najmniej 5 miesięcy systematycznie uczestniczył w życiu zastępu i drużyny.'),
              RankTaskData(text: 'Zdobył przynajmniej 5 sprawności jednogwiazdkowych.'),
              RankTaskData(text: 'Regularnie płaci składki harcerskie.'),
            ]
        ),
        RankGroupData(
            title: 'Wiedza harcerska',
            taskData: [
              RankTaskData(text: 'Zna symbolikę lilijki, Krzyża Harcerskiego i znaczenie zawołania "Czuwaj!".'),
              RankTaskData(text: 'Zna oznakowanie stopni harcerskich i instruktorskich.'),
              RankTaskData(text: 'Zna oznakowanie funkcji w drużynie, w szczepie i hufcu.'),
              RankTaskData(text: 'Zna zwyczaje zastępu i tradycje drużyny.'),
              RankTaskData(text: 'Wie kim był Baden-Powell i Andrzej Małkowski.'),
            ]
        ),
        RankGroupData(
            title: 'Harcerski styl',
            taskData: [
              RankTaskData(text: 'Posiada mundur i skompletował podstawowy ekwipunek harcerski.'),
              RankTaskData(text: 'Umie spakować plecak na biwak.'),
              RankTaskData(text: 'Umie przyszyć guzik lub plakietkę.'),
              RankTaskData(text: 'Umie zaśpiewać pieśni obrzędowe drużyny, Hymn Harcerski i Modlitwę Harcerską.'),
              RankTaskData(text: 'Umie zachować się przy obrzędowym ognisku.'),
              RankTaskData(text: 'Umie wykonywać komendy zgodnie z regulaminem musztry.'),
            ]
        ),
        RankGroupData(
            title: 'Samarytanka i zdrowie',
            taskData: [
              RankTaskData(text: 'Umie opatrzyć skaleczenie, wezwać pomoc do wypadku.'),
            ]
        ),
        RankGroupData(
            title: 'Przyrodoznawstwo',
            taskData: [
              RankTaskData(text: 'Umie rozpoznać 10 gatunków drzew.'),
              RankTaskData(text: 'Umie rozpoznać 5 sylwetek dzikich zwierząt występujących w polskich lasach.'),
            ]
        ),
        RankGroupData(
            title: 'Łączność',
            taskData: [
              RankTaskData(text: 'Umie zaszyfrować wiadomość przynajmniej trzema sposobami.'),
              RankTaskData(text: 'Umie poprawnie dostarczyć ustny meldunek.'),
              RankTaskData(text: 'Umie wysłać wiadomość pocztą tradycyjną i emailem.'),
            ]
        ),
        RankGroupData(
            title: 'Terenoznawstwo i krajoznawstwo',
            taskData: [
              RankTaskData(text: 'Umie czytać i poruszać się po znakach patrolowych.'),
              RankTaskData(text: 'Umie wskazać kierunki według busoli, słońca i gwiazd – zgodnie z nimi orientuje mapę.'),
              RankTaskData(text: 'Umie poruszać się po swojej okolicy i wskazać ważne punkty (np. urząd gminy, poczta, straż pożarna, policja, apteka, pogotowie ratunkowe, zabytki).'),
            ]
        ),
        RankGroupData(
            title: 'Obozownictwo i pionierka',
            taskData: [
              RankTaskData(text: 'Umie rozbić mały namiot.'),
              RankTaskData(text: 'Umie zawiązać 3 użyteczne węzły – pokazał, do czego można je wykorzystać.'),
              RankTaskData(text: 'Umie bezpiecznie posługiwać się nożem, toporkiem, piłą i saperką. Zaprojektował i wybudował proste urządzenie obozowe. Konserwuje narzędzia pionierskie.'),
              RankTaskData(text: 'Umie porąbać drewno, rozpalić, zgasić i zamaskować ognisko.'),
              RankTaskData(text: 'Umie wyprać swoje ubranie.'),
              RankTaskData(text: 'Umie ugotować prosty posiłek na własnoręcznie zbudowanej kuchni polowej i spożył go wraz z zastępem. Potrafi zrobić kanapkę, usmażyć jajecznicę.'),
            ]
        )
      ],
    ),

    const RankCatData(
        title: 'Służba',
        icon: RankData.iconCatSluzba,
        groupData: [
          RankGroupData(
              title: 'Wychowanie prorodzinne',
              taskData: [
                RankTaskData(text: 'Ma stałe obowiązki domowe, z których się sumiennie wywiązuje.'),
                RankTaskData(text: 'Zna zasady zachowania przy stole, okazywania szacunku starszym i rycerskości wobec dziewcząt. Stosuje je w praktyce.'),
              ]
          ),
          RankGroupData(
              title: 'Służba Polsce i Bliźnim',
              taskData: [
                RankTaskData(text: 'Zna godło, barwy i Hymn Narodowy, zna imię i nazwisko prezydenta RP. Wywiesza flagę z okazji najważniejszych świąt państwowych, wie kiedy i dlaczego powinno się to robić.'),
                RankTaskData(text: 'Jest koleżeński, pomógł w nauce koledze, koleżance z klasy bądź podwórka. Okazuje szacunek osobom starszym.'),
              ]
          ),
        ]
    ),

    const RankCatData(
      title: 'Sylwetka',
      icon: RankData.iconCatSylwetka,
      groupData: [
        RankGroupData(
          title: 'Dojrzałość psychofizyczna',
          taskData: [
            RankTaskData(text:
            'Chłopca w wieku 11 –13 lat cechuje wielka dobrze skoordynowana motoryka, potrafi jasno wypowiadać swoje myśli, idee i sądy, myśleć na poziomie konkretów i abstrakcji, jest w stanie podporządkować swoją wolę woli zwierzchnika. W tym czasie grupa rówieśnicza, jej akceptacja i poczucie przynależności są bardzo silnym motywatorem.'
                '\n\nW tym okresie również następuje wzmocnione postrzeganie, analiza i ocena samego siebie. Dziecko świadomie planuje własne poczynania.'
                '\n\nW pierwszej fazie tego okresu, dziecko nie widzi u siebie żadnych skaz, dopiero nieco później staje się wobec siebie bardziej krytyczne. Wraz ze wzrostem umiejętności pojęciowego myślenia dziecko zyskuje możliwość dokonania samooceny, co ma niemały wpływ na funkcjonowanie psychiczne. Gdy samoocena jest realistyczna to sprzyja prawidłowemu rozwojowi psychicznemu, natomiast zaniżona lub zawyżona ma wpływ na zmniejszenie odporności na trudności, niepowodzenia uruchamiają agresywność. Negatywny wpływ na zachowanie dzieci ma w tym okresie krytycyzm. Dopiero pod koniec tego okresu rozwojowego dzieci przyjmują krytykę o konstruktywnym charakterze. W tym okresie zauważa się dużą zależność emocjonalną. Dziecko pragnie aprobaty od rodziców, pani w szkole i rówieśników. Powinno ją dostać również od przełożonych w harcerstwie.'
                '\n\nZainteresowania w tym wieku mają charakter płynny i nietrwały, są wielokierunkowe. Dominują zainteresowania sportem, zabawami ruchowymi, majsterkowaniem i zainteresowania o charakterze poznawczym.'
                '\n\nCzynnikiem kształtującym zainteresowania jest przede wszystkim otoczenie społeczne. Ważne jest, aby panowała równowaga między zainteresowaniami chłopca, a inspirowanymi przez starszych. Zmuszanie harcerza do zajęć dodatkowych, których nie lubi, nie służy kształtowaniu jego osobowości. Prawdziwą satysfakcję przynosi mu takie działanie, którego efekty są coraz większe. W tym momencie potrzeba kompetencji przeradza się w potrzebę osiągnięć. Pod jej wpływem wzrasta pracowitość oraz chęć osiągania złożonych i trudniejszych celów.',
              checkable: false,
            )
          ],
        ),
        RankGroupData(
          title: 'Postawa harcerska',
          taskData: [
            RankTaskData(text: 'Chętnie przychodzi na zbiórki. Dba o swój mundur i schludny wygląd. Często zgłasza się na ochotnika do wykonania prostych zadań. Koledzy w zastępie mogą na niego liczyć. Sam znajduje okazje i wykonuje dobre uczynki. Jest ciekawy świata. Gdy go coś zainteresuje, stara się to poznać i spróbować w tym swych sił. Poznaje historię Polski i uczy się szacunku do barw i symboli narodowych –wie, co oznaczają i dlaczego są ważne. Wywiesza flagę z okazji najważniejszych świąt państwowych. W rywalizacji i współzawodnictwie przestrzega ustalonych reguł gry. Dobrze radzi sobie w szkole. Poprosił rodziców o przydzielenie stałych obowiązków domowych i stara się z nich wywiązywać.',
              checkable: false,),
          ],
        ),
        RankGroupData(
          title: 'Wiedza i umiejętności',
          taskData: [
            RankTaskData(text: 'Posiadł podstawową wiedzę i umiejętności, które umożliwiają mu pełne uczestnictwo w życiu zastępu i drużyny. Da sobie radę i nie wymaga opieki ani na zbiórce,ani na obozie ani w domu. Szczegóły w sekcji "Wymagania na stopień".',
              checkable: false,),
          ],
        ),
        RankGroupData(
          title: 'Rozwój duchowy',
          taskData: [
            RankTaskData(text: 'Odróżnia dobro i zło, postępuje według wskazań wiary, stara się być jej wierny. Bierze udział w nabożeństwach Kościoła do którego należy. Codziennie się modli.',
              checkable: false,),
          ],
        ),
        RankGroupData(
          title: 'Doświadczenie harcerskie',
          taskData: [
            RankTaskData(text: 'Poznał smak harcerstwa. Rozumie co to znaczy być harcerzem i jest gotów nim zostać. Szczegóły w sekcji "Wymagania na stopień".',
              checkable: false,),
          ],
        )
      ],
    )
  ],
);
RankZHRC rankZhrHarcC1 = rankZhrHarcC1Data.build();

RankZHRCData rankZhrHarcC2Data = RankZHRCData.from(
  title: 'Wywiadowca',
  version: 1,
  org: Org.zhr_c,
  id: 'HARC_C_2',
  minWiek: '12 – 14 lat',
  czasTrw: '3 – 6 miesięcy',
  idea: 'Rozumiem Prawo Harcerskie i zgodnie z nim postępuję w życiu codziennym. Systematycznie uczestniczę w praktykach religijnych Kościoła. Staram się być dobrym harcerzem. Jestem samodzielny. Potrafię zadbać o siebie. Aktywie i odpowiedzialnie uczestniczę w życiu zastępu i drużyny. Można na mnie polegać w trudnych sytuacjach. Doskonalę się w technikach harcerskich. Jako syn, brat, wnuk jestem gotowy do poświęceń na rzecz rodziny. Pamiętam o swoich obowiązkach i właściwie je wypełniam. Staram się być przykładem dla swoich rówieśników. Harcerzem jestem nie tylko wtedy, kiedy mam na sobie mundur. Jestem gotów na każde wezwanie do służby.',
  koment: null,
  cats: [

    const RankCatData(
      title: 'Praca nad charakterem',
      icon: RankData.iconCatCharakter,
      groupData: [
        RankGroupData(
            title: 'Kształtowanie charakteru',
            taskData: [
              RankTaskData(text: 'Kieruje się w życiu codziennym zasadami wynikającymi z Przyrzeczenia i Prawa Harcerskiego.'),
              RankTaskData(text: 'Planuje zajęcia, prowadzi terminarz osobisty.'),
              RankTaskData(text: 'Podjął próbę charakteru polegającą na kształtowaniu wybranej cechy zakończoną sukcesem'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój religijny',
            taskData: [
              RankTaskData(text: 'Uczestniczy we Mszy Świętej harcerskiej, nabożeństwach, rekolekcjach, poprowadzi modlitwę na biwaku lub obozie.'),
              RankTaskData(text: 'Wziął udział spotkaniu ewangelizacyjnym dla młodzieży (Lednica, Święto Młodzieży, itp.).'),
              RankTaskData(text: 'Zna znaczenie religijne świąt, związane z nimi tradycje i zwyczaje polskie.'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój intelektualny',
            taskData: [
              RankTaskData(text: 'Umie porozumieć się w obcym języku.'),
              RankTaskData(text: 'Umie posługiwać się aparatem fotograficznym i kamerą, potrafi prawidłowo komponować ujęcia.'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój fizyczny',
            taskData: [
              RankTaskData(text: 'Umie pływać, jeździć na rowerze.'),
              RankTaskData(text: 'Pracuje nad tężyzną fizyczną – wyznaczył sobie wymagania i je wypełnił (np. przynajmniej raz w tygodniu biegał 30 minut, codziennie się gimnastykował, nauczył jeździć na rolkach itp.).'),
            ]
        )
      ],
    ),

    const RankCatData(
      title: 'Harcerskie wtajemniczenie',
      icon: RankData.iconCatHarcWtajem,
      groupData: [
        RankGroupData(
            title: 'Doświadczenie harcerskie',
            taskData: [
              RankTaskData(text: 'Był na przynajmniej jednym obozie letnim, kilku biwakach i wędrówkach'),
              RankTaskData(text: 'Zdobył przynajmniej 4 sprawności dwugwiazdkowe.'),
              RankTaskData(text: 'Zaoszczędził pieniądze, które przeznaczył na pokrycie składek harcerskich. Wpłaca je regularnie i wie, na co są one wydatkowane.'),
              RankTaskData(text: 'Przygotował kilkugodzinną wycieczkę zastępu. Dowiedział się i opowiedział o ciekawym obiekcie na trasie wędrówki. Skorzystał z rozkładu jazdy (PKP, PKS).'),
              RankTaskData(text: 'Brał udział w wydarzeniu dającym mu możliwość poznania harcerzy z innych drużyn (np. zlot, kurs zastępowych, turniej drużyn,itp.).'),
              RankTaskData(text: 'Dowodził zastępem lub inną grupą młodszych harcerzy –był odpowiedzialny za innych.'),
            ]
        ),
        RankGroupData(
            title: 'Wiedza harcerska',
            taskData: [
              RankTaskData(text: 'Zna oznaczenia funkcji do poziomu Głównej Kwatery Harcerzy.'),
              RankTaskData(text: 'Zna Strukturę ZHR i nazwiska swoich przełożonych do poziomu hufcowego'),
              RankTaskData(text: 'Zna najważniejsze fakty z historii drużyny i historii harcerstwa.'),
              RankTaskData(text: 'Zna życiorysy i opowie o A. Małkowskim, R. Baden-Powellu i bł. ks. phm. S.W.Frelichowskim.'),
              RankTaskData(text: 'Przeczytał min. dwie książki harcerskie (np. "Wilk, który nie śpi", "Kamienie na szaniec")'),
              RankTaskData(text: 'Znaz wyczaje i obrzędy swojej drużyny. Rozpoznaje drużyny należące do jego hufca.'),

            ]
        ),
        RankGroupData(
            title: 'Harcerski styl',
            taskData: [
              RankTaskData(text: 'Posiada nienaganny (czysty i wyprasowany) mundur harcerski. Poszerzył własny ekwipunek, posiada pełen ekwipunek obozowy.'),
              RankTaskData(text: 'Umie wydawać komendy zgodnie z regulaminem musztry pojedynczego harcerza.'),
              RankTaskData(text: 'Umie zaśpiewać 20 piosenek harcerskich.'),
            ]
        ),
        RankGroupData(
            title: 'Samarytanka i zdrowie',
            taskData: [
              RankTaskData(text: 'Umie usztywnić złamanie, zatamować krwotok, transportować rannego.'),
              RankTaskData(text: 'Ma osobistą apteczkę i zabiera ją na zbiórki i wyjazdy harcerskie.'),
            ]
        ),
        RankGroupData(
            title: 'Przyrodoznawstwo',
            taskData: [
              RankTaskData(text: 'Umie tropić, maskować się i podpatrywać dzikie zwierzęta.'),
              RankTaskData(text: 'Sporządził posiłek z darów lasu.'),
              RankTaskData(text: 'Wraz z zastępem pełnił służbę na rzecz lasu.'),
            ]
        ),
        RankGroupData(
            title: 'Łączność',
            taskData: [
              RankTaskData(text: 'Umie nadać wiadomość na odległość bez pomocy urządzeń elektronicznych i radiowych.'),
              RankTaskData(text: 'Umie posłużyć się radiotelefonem i krótkofalówką.'),
              RankTaskData(text: 'Sprawnie posługuje się komputerem, zdobył komplet informacji na wybrany temat i przedstawił je w postaci prezentacji multimedialnej / filmu.'),
            ]
        ),
        RankGroupData(
            title: 'Terenoznawstwo i krajoznawstwo',
            taskData: [
              RankTaskData(text: 'Umie narysować szkic terenu.'),
              RankTaskData(text: 'Umie ocenić odległość "na oko"'),
              RankTaskData(text: 'Umie wykonywać precyzyjne pomiary terenowe, tj. wysokość drzewa, szerokość rzeki.'),
              RankTaskData(text: 'Umie odnaleźć się na mapie w nieznanym terenie i dotrzeć do wyznaczonego celu.'),
              RankTaskData(text: 'Umie trafić do celu na azymut, przy pomocy GPS i nawigacji samochodowej.'),
            ]
        ),
        RankGroupData(
            title: 'Obozownictwo i pionierka',
            taskData: [
              RankTaskData(text: 'Umie przeprawić się z ekwipunkiem przez przeszkodę wodną.'),
              RankTaskData(text: 'Umie rozpalić ognisko w trudnych warunkach pogodowych, zbudować schronienie przed deszczem i wiatrem.'),
              RankTaskData(text: 'Umie zbudować kuchnię polową, ugotować obiad dla zastępu.'),
              RankTaskData(text: 'Umie osadzić i naostrzyć siekierę, naostrzyć piłę, saperkę.'),
              RankTaskData(text: 'Umie wiązać 5 węzłów przydatnych w pionierce, zbuchtować linę.'),
              RankTaskData(text: 'Umie zaprojektować i pokierować budową urządzenia namiotowego na obozie.'),
              RankTaskData(text: 'Umie zszyć rozprute ubranie.'),
              RankTaskData(text: 'Umie wykonać drobne naprawy techniczne (np. zakonserwować rower, naprawić dętkę, przywiesić półkę,wymienić zamek w drzwiach itp.).'),
            ]
        )
      ],
    ),

    const RankCatData(
        title: 'Służba',
        icon: RankData.iconCatSluzba,
        groupData: [
          RankGroupData(
              title: 'Wychowanie prorodzinne',
              taskData: [
                RankTaskData(text: 'Podejmuje obowiązki domowe. Wyręcza rodziców w pracach domowych, dba o porządek w swych rzeczach i w pokoju, w którym mieszka.'),
              ]
          ),
          RankGroupData(
              title: 'Służba Polsce i Bliźnim',
              taskData: [
                RankTaskData(text: 'Wybierze jeden okres z historii Polski i przygotuje o nim grę na zbiórkę zastępu.'),
                RankTaskData(text: 'Wraz z zastępem / drużyną –brał udział w służbie potrzebującym.'),
              ]
          ),
        ]
    ),

    const RankCatData(
      title: 'Sylwetka',
      icon: RankData.iconCatSylwetka,
      groupData: [
        RankGroupData(
          title: 'Dojrzałość psychofizyczna',
          taskData: [
            RankTaskData(text: 'Harcerz w tym wieku strzeże swojej prywatności. Bywa zgorzkniały, smutny, podejrzliwy, niezbyt pewne siebie i często nieszczęśliwy. Prawdopodobnie w żadnym innym okresie dorastania chłopcy nie są tak przesadnie przeczuleni na punkcie swojego ciała, swojej odmienności, osobowości. Bardzo ważne, o ile nie najistotniejsze w tym czasie -są kontakty z przyjaciółmi. Chłopcy samodzielnie rozwiązują problemy i realizują wszelkie pomysły. Na ogół starają się zachowywać w zgodzie z powszechnie przyjętymi normami etycznymi. Usiłują odróżnić rzeczy złe od dobrych, dla większości najlepszym sędzią jest własne sumienie. Wymagania stawiane sobie i innym są wysokie. Dla większości kluczowym pojęciem jest „sprawiedliwość” i są gotowi ponieść karę za popełnione występki. Są zainteresowani zagadnieniami społecznymi, ale ich wiedza na ten temat jest jeszcze dość ograniczona.'
                '\n\nTrzynastolatek bywa samokrytyczny, zwłaszcza jeśli chodzi o negatywne cechy swojego charakteru. Zwraca uwagę na to, iż jest leniwy, samolubny, zbyt często wpada w złość. Potrafi powiedzieć, że sam siebie nienawidzi.'
                '\n\nDla czternastoletniego chłopca charakterystyczna jest niespożyta energia, wigor, werwa i ciągłe podekscytowanie. Ogromne zasoby energii połączone z optymistycznym entuzjazmem i dobrą wolą sprawiają, że gotowi są oni podjąć każde wyzwanie. Przyjaciele są im niezbędni, grupa rówieśnicza staje się bardziej atrakcyjna, życie bardziej przyjemne i zabawne. Nie ma rzeczy niemożliwych do zrealizowania. Niestety zmienia się stosunek do rodziców, są z nich niezadowoleni za to, jacy są. W tym wieku chłopiec stara się wciąż odnaleźć siebie, być bardziej niezależny –czuje, że jest przez innych postrzegany wyłącznie jako syn, a nie jako ktoś, kto ma własną osobowość, własne pragnienia i własne cele. Czternastolatek czuje się zbyt uzależniony, zbyt blisko związany z rodzicami i uważa, że ich zachowanie kompromituje właśnie jego.'
                '\n\nDla większości czternastolatków jest to okres najszybszego wzrostu. Ciało staje się bardziej muskularne, zanika występujący wcześniej nadmiar tkanki tłuszczowej, sylwetka coraz bardziej upodabnia się do sylwetki dorosłego mężczyzny. Głos staje się mniej piskliwy i grubszy (mogą się wstydzić zmian głosu).'
                '\n\nCzternastolatki starają się odnaleźć własną filozofię życia, gromadzą informacje, wymieniają poglądy, dyskutują na temat płci i seksu. Niestety zbyt często podejmują samodzielne decyzje i robią rzeczy, do których nie są jeszcze w pełni przygotowani. Dlatego ważne jest, aby z nimi rozmawiać na te tematy, podsuwać artykuły, literaturę itp.'
                '\n\nCzternastolatki mają chwilę „wszechogarniającego szczęścia” i „gorsze dni”. Najwięcej radości sprawiają im życie towarzyskie –randki, spotkania z przyjaciółmi. „Gorsze dni” zdarzają się rzadko, jest jednak ciężko samemu sobie z nimi poradzić. Takie wewnętrzne problemy, przerastające siły chłopca, mogą uzewnętrzniać się atakiem gwałtownej złości lub rozpaczliwego płaczu. Kiedy dojdzie do takiej sytuacji rodzice / przełożeni powinni jak najszybciej odkryć jej przyczynę. Aby stan się nie pogłębił a młodzieniec nie padł w depresję i przygnębienie.',
              checkable: false,
            )
          ],
        ),
        RankGroupData(
          title: 'Postawa harcerska',
          taskData: [
            RankTaskData(text: 'Jest dumny z tego, że jest harcerzem. Stara się przestrzegać Dekalogu i Prawa Harcerskiego. Przyjęte na siebie obowiązki stara się wypełniać najlepiej jak potrafi. Odkrywa posiadane talenty. Zdobywając sprawności sprawdza się w różnych dziedzinach zainteresowań. Stara się nie tracić okazji do wykonania dobrego uczynku. Ochoczo bierze udział służbie społecznej zastępu lub drużyny. Można mu powierzyć odpowiedzialne zadanie, zorganizowanie zajęć dla zastępu i kierowanie grupą młodszych harcerzy. Drużynowy może na niego liczyć. Jest punktualny, dotrzymuje słowa i przestrzega reguł gry. Zna historię Polski w zakresie podstawowym i aktywnie uczestniczy w obchodach świąt państwowych. W domu to on odpowiada za przygotowanie i wywieszenie biało-czerwonej flagi. Stara się pomagać rodzicom i być dobrym uczniem. Kulturalnie odnosi się do dziewcząt. Szuka pozytywnych przykładów i wzorców osobowych, które chce w swoim życiu naśladować.',
              checkable: false,),
          ],
        ),
        RankGroupData(
          title: 'Wiedza i umiejętności',
          taskData: [
            RankTaskData(text: 'Jest znawcą technik harcerskich. Posiadł wiedzę i umiejętności, które pozwalają mu swobodnie poruszać się w normalnych warunkach polowych i organizować zbiórki zastępu Szczegóły w sekcji "Wymagania na stopień".',
              checkable: false,),
          ],
        ),
        RankGroupData(
          title: 'Rozwój duchowy',
          taskData: [
            RankTaskData(text: 'Jest znawcą technik harcerskich. Posiadł wiedzę i umiejętności, które pozwalają mu swobodnie poruszać się w normalnych warunkach polowych i organizować zbiórki zastępu Szczegóły w sekcji "Wymagania na stopień".',
              checkable: false,),
          ],
        ),
        RankGroupData(
          title: 'Doświadczenie harcerskie',
          taskData: [
            RankTaskData(text: 'Bierze aktywny udział w życiu zastępu i drużyny. Okazał się samodzielny i odpowiedzialny za innych. Jest przygotowany do objęcia zastępu lub innej samodzielnej funkcji w drużynie. Szczegóły w sekcji "Wymagania na stopień".',
              checkable: false,),
          ],
        )
      ],
    )
  ],
);
RankZHRC rankZhrHarcC2 = rankZhrHarcC2Data.build();

RankZHRCData rankZhrHarcC3Data = RankZHRCData.from(
  title: 'Ćwik',
  version: 1,
  org: Org.zhr_c,
  id: 'HARC_C_3',
  minWiek: '13 – 16 lat',
  czasTrw: '6 – 10 miesięcy',
  idea: 'Utożsamiam się z systemem wartości zawartych w Prawie i Przyrzeczeniu Harcerskim. Jestem mistrzem w technikach harcerskich. Nie załamują mnie trudności. Daje sobie radę w każdej sytuacji. Jestem godny zaufania. Odpowiedzialnie wywiązuję się z przyjętych na siebie obowiązków. Potrafię kierować i zgodnie pracować w zespole. Jestem gotowy do podjęcia świadomej służby społecznej. Osiągam widoczne efekty w pracy nad sobą. Uczestniczę w życiu Kościoła i żyję życiem sakramentalnym. Daję dobry przykład młodszym harcerzom w codziennym życiu, kierując się służbą Bogu, Ojczyźnie i bliźnim. Jestem odpowiedzialny za rodzinę, drużynę, grupę kolegów, do których należę. Zachowuję godną postawę wobec dziewcząt.',
  koment: null,
  cats: [

    const RankCatData(
      title: 'Praca nad charakterem',
      icon: RankData.iconCatCharakter,
      groupData: [
        RankGroupData(
            title: 'Kształtowanie charakteru',
            taskData: [
              RankTaskData(text: 'Ocenia własne postępowanie w oparciu o Przyrzeczenie i Prawo Harcerskie i potrafi odnieść się do niego, dostrzec dobre i złe cechy swojego charakteru, określi plan regularnych ćwiczeń w pracy nad sobą.'),
              RankTaskData(text: 'Racjonalnie organizuje swój czas by godzić obowiązki szkolne, rodzinnei harcerskie wraz z innymi zainteresowaniami.'),
              RankTaskData(text: 'Zarobi (zaoszczędzi) na obóz minimum 50% jego ceny.'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój religijny',
            taskData: [
              RankTaskData(text: 'Pogłębia swoją wiarę poprzez autoformację pod kierunkiem kapelana, katechety czy innej osoby, która jest autorytetem w zakresie wiary.'),
              RankTaskData(text: 'Czytał fragmenty pamiętników bł. phm. Stefana Wincentego Frelichowskiego i na ich podstawie podejmie pracę nad rozwinięciem jakieś cechy, albo walkę z wadą.'),
              RankTaskData(text: 'Regularnie czyta Pismo Święte, zna młodzieżową prasę katolicką, wziął udział spotkaniu ewangelizacyjnym dla młodzieży (Lednica, Święto Młodzieży, itp.).'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój intelektualny',
            taskData: [
              RankTaskData(text: 'Potrafi uzasadnić na czym opiera swoje wybory moralne (na ognisku, kominku, wieczornicy). Poprowadził dyskusję na temat wolności i jej granic lub "osobistego Westerplatte" - wg słów Jana Pawła II; wygłosił gawędę, jak rozumieć słowa Honorowego Przewodniczącego ZHR śp. hm. T. Strzembosza "Harcerstwo jest rycerską postacią współczesnego chrześcijaństwa", przybliżającą wartości Prawa Harcerskiego).'),
              RankTaskData(text: 'Zna podstawowe zasady savoir-vivre.'),
              RankTaskData(text: 'Umie zatańczyć trzy tańce towarzyskie z partnerką.'),
              RankTaskData(text: 'Umie w obcym języku załatwić sprawę w urzędzie, banku, na poczcie, zapłacić rachunek.'),
              RankTaskData(text: 'Interesuje się jedną z dziedzin kultury, rozwija swoje talenty.Napisał cykl recenzji z ostatnio widzianych przedstawień teatralnych, filmów, recitali, koncertów muzyki poważnej bądź rozrywkowej.Wykonał do izby drużyny fotoreportaż, zrealizował z zastępem film i pokazał go drużynie(zdobył sprawność artystyczną trzygwiazdkową).'),
            ]
        ),
        RankGroupData(
            title: 'Rozwój fizyczny',
            taskData: [
              RankTaskData(text: 'Jest aktywny, próbuje nowych dziedzin sportowych, poszerza horyzonty swojej aktywności (jeździł konno, na nartach, wiosłuje, pływa kajakiem, żagluje itp.).'),
              RankTaskData(text: 'Umie zastosować podstawowe chwyty samoobrony.'),
              RankTaskData(text: 'Umie zbudować przeprawę linową, wspinać się z użyciem liny i zjeżdżać po niej.'),
              RankTaskData(text: 'Umie celnie strzelać z łuku i broni pneumatycznej.'),
            ]
        )
      ],
    ),

    const RankCatData(
      title: 'Harcerskie wtajemniczenie',
      icon: RankData.iconCatHarcWtajem,
      groupData: [
        RankGroupData(
            title: 'Doświadczenie harcerskie',
            taskData: [
              RankTaskData(text: 'Umie zorganizować i przeprowadzić biwak drużyny i grę terenową.'),
              RankTaskData(text: 'Był przynajmniej na jednym obozie wędrownym lub wyprawie wędrowniczej.'),
              RankTaskData(text: 'Zorganizował ciekawe zajęcia dla drużyny. Pokierował działaniem, w którym wzięło udział kilka zastępów harcerskich.'),
              RankTaskData(text: 'Zdobył przynajmniej trzy sprawności trzygwiazdkowe lub dwie dwugwiazdkowe i jedną mistrzowską.'),
              RankTaskData(text: 'Miał okazję współdziałać z harcerzami i harcerkami z innych drużyn.'),
              RankTaskData(text: 'Dba o rozwój ruchu harcerskiego. Planował i uczestniczył w akcji werbunkowej do drużyny.Współorganizował akcję prezentującą w szkole dorobek drużyny, np. odpowiadał za system informacji (plakaty, strona www, ulotki, gazetka harcerska w szkole, itp.). Przygotował i przeprowadził akcję promującą harcerski styl i ZHR w środowisku działania drużyny).'),
            ]
        ),
        RankGroupData(
            title: 'Wiedza harcerska',
            taskData: [
              RankTaskData(text: 'Zna podstawowe okresy z historii harcerstwa, potrafi o nich opowiedzieć.'),
              RankTaskData(text: 'Zna kilka najważniejszych postaci z historii harcerstwa.'),
              RankTaskData(text: 'Przeczytał 3 książki o tematyce harcerskiej.'),
              RankTaskData(text: 'Potrafi opisać kształt ideowy i organizacyjny ZHR, cele istnienia Związku, uzasadnić odrębność od innychorganizacji harcerskich w Polsce.'),
              RankTaskData(text: 'Zna organizację i życie hufca. Objaśni młodszym harcerzom szczegółowo całą strukturę ZHR, w tym podając skład i znaczenie władz wybieranych (Okręgowych i Naczelnych). Wymieni nazwiska Naczelnika i Przewodniczącego'),
            ]
        ),
        RankGroupData(
            title: 'Harcerski styl',
            taskData: [
              RankTaskData(text: 'Zna regulamin musztry Organizacji Harcerzy ZHR. Poprowadził apel oraz musztrę paradną drużyny. Zorganizował ćwiczenia pocztu sztandarowego.'),
              RankTaskData(text: 'Umie zaśpiewać 25 piosenek harcerskich -trzy z nich zagrać na wybranym instrumencie.'),
              RankTaskData(text: 'Umie prać i prasować swój mundur w domu i w warunkach polowych.'),
            ]
        ),
        RankGroupData(
            title: 'Samarytanka i zdrowie',
            taskData: [
              RankTaskData(text: 'Umie udzielić pomocy tonącemu.'),
              RankTaskData(text: 'Umie przeprowadzić resuscytację zgodnie z protokołem BLS'),
            ]
        ),
        RankGroupData(
            title: 'Przyrodoznawstwo',
            taskData: [
              RankTaskData(text: 'Umie przewidzieć pogodę na postawie obserwacji nieba.'),
              RankTaskData(text: 'Wykonał konkretną pracę na rzecz środowiska naturalnego.'),
            ]
        ),
        RankGroupData(
            title: 'Łączność',
            taskData: [
              RankTaskData(text: 'Nawiązał w warunkach terenowych łączność przy pomocy sygnałów świetlnych, dymnych, itp. Posłużył się CB-radiem. Przekazał informację za pomocą faksu'),
              RankTaskData(text: 'Sprawnie korzysta z komputera i Internetu – np. potrafi korzystać z pakietu MS Office, poczty elektronicznej, umie tworzyć prezentacje multimedialne, montować filmy,itp.'),
              RankTaskData(text: 'Potrafi opowiedzieć o zagrożeniach płynących z nadmiernego korzystania z komputera, telewizji.'),
            ]
        ),
        RankGroupData(
            title: 'Terenoznawstwo i krajoznawstwo',
            taskData: [
              RankTaskData(text: 'Umie poruszać się terenie bagiennym i w górach.'),
              RankTaskData(text: 'Potrafi z pamięci narysować mapę swojego miasteczka, wsi, dzielnicy. W każdej sytuacji zorientuje mapę i odnajdzie drogę do zadanego punktu; umie wyznaczyć trasę obozu wędrownego.'),
              RankTaskData(text: 'Umie posługiwać się różnymi rodzajami map (również internetowymi), GPS-em i nawigacją samochodową.'),
            ]
        ),
        RankGroupData(
            title: 'Obozownictwo i pionierka',
            taskData: [
              RankTaskData(text: 'Umie wyżywić się przez dwa dni korzystając wyłącznie z darów lasu.'),
              RankTaskData(text: 'Umie zmontować wędkę, złowić i oprawić rybę.'),
              RankTaskData(text: 'Umie rozpalić ogień bez użycia zapałek.'),
              RankTaskData(text: 'Umie podejść obóz innej drużyny.'),
              RankTaskData(text: 'Umie w każdych warunkach terenowych i pogodowych zorganizować prowizoryczny nocleg dla drużyny.'),
              RankTaskData(text: 'Umie zaprojektować i pokierować, budową urządzenia obozowego.'),
              RankTaskData(text: 'Umie pokierować przygotowaniem posiłku dla drużyny w warunkach terenowych.'),
              RankTaskData(text: 'Umie posługiwać się domowymi urządzeniami technicznymi. Wykonuje naprawy urządzeń domowych, swego sprzętu -np. umie rozłożyć na części i złożyć rower.'),
            ]
        )
      ],
    ),

    const RankCatData(
        title: 'Służba',
        icon: RankData.iconCatSluzba,
        groupData: [
          RankGroupData(
              title: 'Wychowanie prorodzinne',
              taskData: [
                RankTaskData(text: 'Umie przygotować i podać obiad dla rodziny.'),
                RankTaskData(text: 'Umie wyprasować spodnie i koszulę.'),
                RankTaskData(text: 'Otacza szacunkiem płeć przeciwną, jest rycerski wobec kobiet (wraz z drużyną lub Zastępem Zastępowych przygotował spotkanie towarzyskie z harcerkami, w przemyślany sposób uhonorował swoją matkę lub siostrę).'),
                RankTaskData(text: 'Wysłuchał konferencji np. Jacka Pulikowskiego, albo ks. Piotra Pawlukiewicza na temat relacji chłopak-dziewczyna, oraz czystości we wzajemnych relacjach, zna zagrożenia wynikające z pornografii.'),
              ]
          ),
          RankGroupData(
              title: 'Służba Polsce i Bliźnim',
              taskData: [
                RankTaskData(text: 'Świadomie uczestniczy w obchodach świąt narodowych. Uczestniczył w przygotowaniu drużyny do uczczenia narodowego święta.'),
                RankTaskData(text: 'W swoim środowisku działania (drużynie, szkole, na podwórku) stara się szerzyć dumę z bycia Polakiem (opowie na spotkaniu, co uważa za najbardziej chlubne w dziejach Polski; zorganizuje wystawę o najwybitniejszych Polakach). Pamięta o Polakach mieszkających poza granicami Kraju (w porozumieniu z drużynowym zrealizuje zadanie podtrzymujące więź z Polakami poza granicami Kraju; brał udział w służbie na rzecz Polaków mieszkających w dawnych Kresach RP). Stara się aktywnie pracować na rzecz Ojczyzny (zorganizował akcję ochrony przyrody lub akcję ekologiczną, brał udział w samorządzie szkolnym, pełnił w nim funkcję).'),
                RankTaskData(text: 'Zna główne partie polityczne działające w Polsce. Potrafi scharakteryzować wyniki ostatnich wyborów parlamentarnych i prezydenckich.'),
                RankTaskData(text: 'W swoim środowisku działania spieszy z pomocą słabszym. Aktywnie poszukuje pól służby i stara się je realizować razem z przyjaciółmi z drużyny (zorganizował grupę wolontariuszy -w tym spoza ZHR) do pomocy słabszym uczniom lub dzieciom z Domu Dziecka. Uczestniczył w akcji propagującej życie bez uzależnień: od palenia papierosów, alkoholu, narkotyków, gier komputerowych itp. Podjął się kilkumiesięcznej służby indywidualnej (pomaga sąsiadce, osobie starszej, w wydawalni posiłków, itp.)'),
              ]
          ),
        ]
    ),

    const RankCatData(
        title: 'Sylwetka',
        icon: RankData.iconCatSylwetka,
        groupData: [
          RankGroupData(
              title: 'Dojrzałość psychofizyczna',
              taskData: [
                RankTaskData(text: 'Umie przygotować i podać obiad dla rodziny.'),
                RankTaskData(text: 'Umie wyprasować spodnie i koszulę.'),
                RankTaskData(text: 'Otacza szacunkiem płeć przeciwną, jest rycerski wobec kobiet (wraz z drużyną lub Zastępem Zastępowych przygotował spotkanie towarzyskie z harcerkami, w przemyślany sposób uhonorował swoją matkę lub siostrę).'),
                RankTaskData(text: 'Wysłuchał konferencji np. Jacka Pulikowskiego, albo ks. Piotra Pawlukiewicza na temat relacji chłopak-dziewczyna, oraz czystości we wzajemnych relacjach, zna zagrożenia wynikające z pornografii.'),
              ]
          ),
          RankGroupData(
              title: 'Służba Polsce i Bliźnim',
              taskData: [
                RankTaskData(text: 'Świadomie uczestniczy w obchodach świąt narodowych. Uczestniczył w przygotowaniu drużyny do uczczenia narodowego święta.'),
                RankTaskData(text: 'W swoim środowisku działania (drużynie, szkole, na podwórku) stara się szerzyć dumę z bycia Polakiem (opowie na spotkaniu, co uważa za najbardziej chlubne w dziejach Polski; zorganizuje wystawę o najwybitniejszych Polakach). Pamięta o Polakach mieszkających poza granicami Kraju (w porozumieniu z drużynowym zrealizuje zadanie podtrzymujące więź z Polakami poza granicami Kraju; brał udział w służbie na rzecz Polaków mieszkających w dawnych Kresach RP). Stara się aktywnie pracować na rzecz Ojczyzny (zorganizował akcję ochrony przyrody lub akcję ekologiczną, brał udział w samorządzie szkolnym, pełnił w nim funkcję).'),
                RankTaskData(text: 'Zna główne partie polityczne działające w Polsce. Potrafi scharakteryzować wyniki ostatnich wyborów parlamentarnych i prezydenckich.'),
                RankTaskData(text: 'W swoim środowisku działania spieszy z pomocą słabszym. Aktywnie poszukuje pól służby i stara się je realizować razem z przyjaciółmi z drużyny (zorganizował grupę wolontariuszy -w tym spoza ZHR) do pomocy słabszym uczniom lub dzieciom z Domu Dziecka. Uczestniczył w akcji propagującej życie bez uzależnień: od palenia papierosów, alkoholu, narkotyków, gier komputerowych itp. Podjął się kilkumiesięcznej służby indywidualnej (pomaga sąsiadce, osobie starszej, w wydawalni posiłków, itp.)'),
              ]
          ),
          RankGroupData(
            title: 'Dojrzałość psychofizyczna',
            taskData: [
              RankTaskData(text:
              'W wieku 15 lat wszystko, a zwłaszcza świat dorosłych wydaje się gorsze niż to o czym się marzyło. Dotyczy to zwłaszcza tych młodych ludzi, którzy bardzo pragną być wolni i niezależni, a muszą żyć w otoczeniu dorosłych i liczyć się z każdym ich zdaniem. Jednym z największych marzeń piętnastolatka jest uwolnienie się od rodziny, być niezależnym. Przeważnie łatwiej porozumiewają się z ojcem, gdyż on najczęściej przyjmuje sprawy takimi jakie są, a matka wciąż stara się poprawić swoje dziecko. Sugestie i komentarze rodziców spotykają się z oporem i ze sprzeciwem. Przeważnie piętnastolatki łatwiej dogadują się z rodzeństwem niż z rodzicami. Jest też dosyć naturalne, że dorośli są niezadowoleni z przyjaciół syna, gdyż woli on przebywać z nimi niż z rodziną.'
                  '\n\nPrzyjaciele stają się wszystkim dla piętnastolatków, spędzają z nimi dużo czasu. W dziedzinie etyki można zauważyć wzrost liczby dojrzałych postaw i zachowań. Przestają postrzegać świat w kategoriach czarno-białych, mają świadomość tego, że na świat można spojrzeć z różnych punktów widzenia. Wielu stara się zachowywać tak, aby nikomu nie wyrządzić krzywdy.'
                  '\n\nWażne jest dla nich, aby być w porządku wobec siebie i innych. Tak samo ważna jest sprawiedliwość i uczciwość, przeważnie potrafią przyznać się do winy i naprawić popełniony błąd. Jednocześnie uwielbiają się kłócić, wytykanie starszym błędów sprawia im niekłamaną satysfakcję. Typowy piętnastolatek przeważnie potrafi panować nad swoimi emocjami. Czasami zdarzają się przypadki użycia przemocy fizycznej, ale rzadziej niż poprzednio. Swą złość wyraża za pomocą słów.'
                  '\n\nRady:'
                  '\n• Rozmawiać, zachęcać do dyskusji (jednocześnie nie zmuszać do nich na siłę),'
                  '\n• Szanować i respektować ich zdanie i zdolności,'
                  '\n• Uznać u harcerza poczucie niezależności i samodzielności,'
                  '\n• Dawać czasami więcej swobody,'
                  '\n• Sympatią i zrozumieniem można dokonać więcej niż zniecierpliwieniem i karami,'
                  '\n• Nie robić niczego na siłę i zbyt natarczywie.',
              )
            ],
          ),
          RankGroupData(
            title: 'Postawa harcerska',
            taskData: [
              RankTaskData(text:
              'Ćwik jest wzorem harcerskiego stylu zarówno w postawie jak i w wyrobieniu technicznym. Jest zaradny życiowo. Konsekwentnie dąży do realizacji postawionych przed sobą celów. Świadomie pracuje nad własnym charakterem oraz rozwija i pogłębia swoje zainteresowania. Ciekawość świata popycha go do zdobywania wiedzy i umiejętności w interesującej go dziedzinie w zakresie wykraczającym ponad poziom programu szkolnego. W relacjach z dziewczętami jest gentelmanem. Okazuje należny szacunek kobietom i osobom starszym. Panuje nad emocjami. Stara się nie uprzedzać do nikogo. Podjął samodzielną służbę społeczną. Patrzy na historię Polski jako na ciąg przyczynowo –skutkowy, który rozumie i potrafi ocenić. Zna najważniejsze okresy z historii naszej Ojczyzny i umie wskazać ich wpływ na dalsze losy kraju i jego mieszkańców. W oparciu o znajomość sylwetek znanych Polaków potrafi wskazać tych, których dorobek zasługuje (jego zdaniem) na największe uznanie, a dzięki temu potrafi w prosty sposób opowiedzieć o roli i znaczeniu autorytetów – w tym również tych jego osobistych.',
              ),
            ],
          ),
          RankGroupData(
            title: 'Wiedza i umiejętności',
            taskData: [
              RankTaskData(text:
              'Ma wiedzę i umiejętności, które pozwalają mu być zaradnym w każdej sytuacji –w ekstremalnych warunkach polowych i w tzw. „dorosłych” sytuacjach życiowych. Potrafi zorganizować zajęcia drużyny i przygotować biwak. Udziela pomocy innym i przekazując im swoją wiedzę i doświadczenie.Szczegóły w sekcji "Wymagania na stopień".',
              ),
            ],
          ),
          RankGroupData(
            title: 'Rozwój duchowy',
            taskData: [
              RankTaskData(text:
              'Świadomie pogłębia swoją wiarę, uczestniczy w życiu Kościoła i prowadzi życie sakramentalne. Rozumie i stosuje w swoim życiu Dekalog i Prawo Harcerskie. Potrafi uzasadnić na czym opiera swoje wybory moralne, a także przeciwstawić się złu np. pornografii, narkomani, alkoholizmowi –wie, do czego te nałogi prowadzą i dzięki przykładowi własnego drużynowego wie, dlaczego harcerze dbają o zachowanie czystości względem różnorodnych używek.',
              ),
            ],
          ),
          RankGroupData(
            title: 'Doświadczenie harcerskie',
            taskData: [
              RankTaskData(text:
              'Doświadczył większości najważniejszych form życia harcerskiego. Był na wielu wycieczkach, biwakach, obozach stałych i wędrownych oraz na zlocie. Wykazał się samodzielnością, zaradnością i odpowiedzialnością za innych. Rzetelnie wywiązuje się z powierzonych mu funkcji i zadań. Dzieli się swoją wiedzą i doświadczeniem z innymi, jest autorytetem dla młodszych harcerzy. Można mu powierzyć funkcję przybocznego.Szczegóły w sekcji "Wymagania na stopień".',
              ),
            ],
          )
        ]
    ),
  ],
);
RankZHRC rankZhrHarcC3 = rankZhrHarcC3Data.build();

RankZHRCData rankZhrHarcC4Data = RankZHRCData.from(
  title: 'Harcerz Orli',
  version: 1,
  org: Org.zhr_c,
  id: 'HARC_C_4',
  minWiek: '15 – 18 lat',
  czasTrw: '-',
  idea: 'Wkraczam w dorosłe życie, samodzielnie określam i kształtuję swój światopogląd. Odczytuję swoje powołanie, świadomie określam swoją drogę życiową. Jestem odpowiedzialny, można na mnie polegać. Pogłębiając wiarę zaczynam świadczyć o niej poza harcerstwem. Moje życie budowane jest na chrześcijańskim fundamencie. Jestem oparciem dla swojego rodzeństwa, rodziców, staram się być przykładem dla moich rówieśników. Angażuję się w życie społeczne. Wkraczam na drogę rozwoju wędrowniczego, instruktorskiego, bądź harcerstwa starszego. Systematycznie pełnię służbę bliźniemu. Świadomie kształtuję swoje relacje z otoczeniem, pełen pogody ducha rozwiązuję pojawiające się problemy.',
  koment: [
    const RankGroupData(
      taskData: [
        RankTaskData(text:
        'Próba polega na ułożeniu od 6 do 10 zadań, których zrealizowanie pozwoli na osiągnięcie ideału opisanego w stopniu, zdobycia niezbędnej wiedzy i umiejętności, oraz wypełnienia służby potrzebującym. Przynajmniej trzy zadania winny zakończyć się trwałym śladem. Próbę układa harcerz wraz z opiekunem na podstawie poniższych punktów i zatwierdza ją przed odpowiednią Kapitułą, która może wnieść korekty.',
            checkable: false
        )
      ],
    )
  ],
  cats: [

    const RankCatData(
      title: 'Praca nad sobą, wiedza, umiejętności',
      icon: RankData.iconCatCharakter,
      groupData: [
        RankGroupData(
          title: 'Rozwój duchowy (moralny i religijny)',
          taskData: [
            RankTaskData(text:
            'Rozwija swoją wiarę, rozpoczyna aktywne apostołowanie, także w środowisku poza harcerskim, swoje wybory opiera na ewangelii, prowadzi życie sakramentalne.',
              example: '• Zidentyfikował własne potrzeby duchowe i obrał drogę rozwoju duchowego, szuka stałego spowiednika (wziął udział w rekolekcjach formacyjnych np. ignacjańskich, kursie Filip w Szkole Nowej Ewangelizacji. Aktywnie uczestniczy w duszpasterstwie lub innej grupie formacyjnej).'
                  '\n\n• Pogłębia swoją wiedzę religijną (zapoznał się z wybranym przez siebie tekstem Ojca Św. skierowanym do młodzieży. Przeczytał wybraną encyklikę Ojca św. i opisał swoje refleksje z lektury w artykule do prasy harcerskiej).'
                  '\n\n• W harcerstwie i poza nim stara się nieść dobrą nowinę (przygotował wraz z kapelanem/duszpasterzem rekolekcje dla drużyny harcerzy).',
            )
          ],
        ),

        RankGroupData(
          title: 'Praca nad charakterem',
          taskData: [
            RankTaskData(text:
            'Potrafi bezstronnie ocenić swoją postawę i zachowanie, świadomie kształtuje swój charakter, staje się twardym i jednocześnie wrażliwym mężczyzną.',
              example: '• Potrafi precyzyjnie określił swe zalety i wady (ułożył program kształtowania swego charakteru, kierując się wskazaniami Prawa Harcerskiego oraz sposób kontroli jego realizacji.Wyznaczył cel w pracy nad sobą i osiągnął go w założonym terminie; określił swoje słabe strony i wykonał zadanie, w wyniku, którego pokonał opisane słabości).'
                  '\n\n• Do drugiego człowieka podchodzi z życzliwością starając się go zrozumieć widząc w nim swojego bliźniego (wybrał sposób rozwijania swej wrażliwości na potrzeby innych i podał wymierne tego wyniki. Pomógł młodszemu bratu, harcerzowi w pokonaniu słabości charakteru.'
                  '\n\n• Swoje wybory opiera na przemyślanym systemie wartości (wskaże, co dla niego jest najważniejsze, (jaki ma system wartości, do jakich celów dąży) i wyjaśni, dlaczego; przeprowadzi kilka wywiadów z ludźmi z różnych środowisk poza harcerskich na temat fundamentów ich światopoglądów i opublikuje wnioski w prasie harcerskiej).'
                  '\n\n• Rozumie, czym jest odwaga cywilna, czym jest odpowiedzialność za drugiego człowieka (aktywnie opiekował się małymi dziećmi przez dwa dni. Uczestniczył w otwartej dyspucie z człowiekiem o przeciwstawnych poglądach. Zorganizował spotkanie o istocie ruchu harcerskiego dla osób spoza harcerstwa).',
            )
          ],
        ),

        RankGroupData(
          title: 'Rozwój intelektualny i zawodowy',
          taskData: [
            RankTaskData(text:
            'Przygotowując się do dorosłego życia pogłębia swoją wiedzę, wybiera specjalizacje zgodne z posiadanymi talentami i staje się w nich ekspertem, dąży do wyróżniających wynikóww nauce i pracy, swój światopogląd kształtuje na podstawie przemyśleń popartych wiedzą.',
              example: '• Podnosi kwalifikacje i pogłębia wiedzę i umiejętności w dziedzinie swych zainteresowań. Wskaże perspektywy swej pracy w tej dziedzinie (opracował z wybranej dziedziny referat lub napisał artykuł do prasy; uzyskał dyplom w konkursie/olimpiadzie; przetłumaczył wybrany tekst z języka obcego).'
                  '\n\n• Rozumie zależność między cechami charakteru i etyką a wynikami uzyskiwanymi w pracy (przeczytał encyklikę „Laboremexercens” i podzielił się swoimi refleksjami w swojej drużynie/hufcu).'
                  '\n\n• Wykazał się umiejętnością obiektywnej oceny informacji. Potrafi bronić swego zdania, lecz nie jest zarozumiały. Potrafi przyznać się do własnych błędów (przeprowadził dyskusyjny panel tematyczny, dyskusyjny klub filmowy na który zaprosił liczne grono słuchaczy).'
                  '\n\n• Kształtując swój światopogląd poszerza wiedzę o otaczającym go świecie (napisał artykuł charakteryzujący wybrany kierunek filozoficzny;przeprowadził i opublikował wywiad ze znanym politykiem o korzeniach jego poglądów).',
            )
          ],
        ),
        RankGroupData(
          title: 'Rozwój kulturalny',
          taskData: [
            RankTaskData(text:
            'Rozumie rolę kultury w życiu człowieka i społeczeństwa, bierze aktywny udział w życiu kulturalnym, orientuje się w historii i współczesności różnych nurtów sztuki i literatury.',
              example: '• Staje się wzorem kulturalnego obycia, rozumie rolę i istotę kultury dnia codziennego (w atrakcyjny i kulturalny sposób zorganizował spotkanie towarzyskie lub imprezę artystyczną; na co dzień stosuje formy dobrego wychowania -savoir vivre’u, umie dobrze tańczyć; potrafi bronić swego zdania bez zarozumiałości, wysłuchując argumenty strony przeciwnej).'
                  '\n\n• Aktywnie uczestniczy w życiu kulturalnym (np. bywa w teatrze, operze czy na koncertach, jest członkiem zespołu artystycznego, przeczytał książki z zakresu literatury pięknej).'
                  '\n\n• Rozwija swoje talenty artystyczne, znajduje najlepszą dla siebie formę wyrazu (przygotował wystawę prac artystycznych zaprzyjaźnionych harcerek i harcerzy, na której wystawił także swoje prace; zaprojektował i wykonał album okolicznościowy o swoim środowisku harcerskim).'
                  '\n\n• Poszerza swoją wiedzę na temat kultury, odróżnia kierunki w sztuce (przygotował wieczór poezji dla kadry hufca; opublikował artykuł zawierający jego refleksje z ostatnio widzianej wystawy malarstwa).',
            )
          ],
        ),
        RankGroupData(
          title: 'Rozwój fizyczny',
          taskData: [
            RankTaskData(text:
            'Jest sprawny i wysportowany, uprawia wybraną dziedzinę sportu, dba o swój wygląd i higienę osobistą.',
              example: '• Uprawia zajęcia rozwijające go fizycznie (wyznaczył sobie ambitny cel w zakresie poprawy sprawności fizycznej i go osiągnął; w wybranej dziedzinie sportu ma wyraźne osiągnięcie; w ciągu trzymiesięcznej próby poprawił swoje wyniki w biegu, skoku w dal, pływaniu i jeździe na rowerze na czas).'
                  '\n\n• Prowadzi zdrowy styl życia, w każdej sytuacji jest wzorem schludności i czystości (oznaczył swoje słabości w osiągnięciu najlepszej formy i stara się je pokonać).'
                  '\n\n• Propaguje aktywny styl życia (kierował sekcją sportową w hufcu; zorganizował zawody na orientację dla ludzi spoza harcerstwa; współorganizował zawody sportowe).',
            )
          ],
        ),

        RankGroupData(
          title: 'Powołanie, wychowanie prorodzinne',
          taskData: [
            RankTaskData(text:
            'Rozumie istotę rodziny i sakramentalną wartość małżeństwa, przygotowuje się do roli męża i ojca (bądź kapłana), przejmuje część odpowiedzialności za swoją rodzinę.',
              example: '• Odkrywa swoje powołania życiowe - w służbie Bogu, w rodzinie; w pracy społecznej, zawodowej i naukowej (przedstawił swoje zamierzenia w tym zakresie; zorganizował na poziomie obwodu/okręgu konferencję o rodzinie).'
                  '\n\n• Jest odpowiedzialny i opiekuńczy wobec dziewcząt. Uzasadni wartość czystości przedmałżeńskiej i obrony życia poczętego (przeczytał książkę nt. rodziny /np. J. Pulikowskiego "Warto być ojcem", ks. Malińskiego "Zanim powiesz kocham" lub równorzędną.; przeprowadził w gronie mieszanym rozmowę o ideale żony i męża) .'
                  '\n\n• Poczuwa się do odpowiedzialności za swoją rodzinę (regularnie stara się odciążyć rodziców w ich obowiązkach).',
            )
          ],
        ),

        RankGroupData(
          title: 'Harce, przygoda, przyroda, wyczyn',
          taskData: [
            RankTaskData(text:
            'Jest harcerzem z krwi i kości, las nie ma dla niego tajemnic i jest jego drugim domem, jest wytrwały w dążeniu do celu, podejmuje się karkołomnych, wyczynowych zadań i realizuje je.',
                example: '• Wędrówka i wyczyn, przygoda i wyzwanie są jego żywiołem (dokonał wyczynu w dziedzinie turystyki, sportu lub kontaktu z przyrodą - biwak wędrowny, dłuższa wyprawa piesza czy rowerowa, survival itp.; przetrwał samotnie w lesie min. 48 godzin z minimalnym wyposażeniem, znalazł pożywienie, zbudował schronienie; podszedł niezauważenie obóz innej drużyny w ciągu dnia i sporządził szczegółowy raport z kilkugodzinnej obserwacji.'
                    '\n\n• Potrafi zaprojektować i kierować budowaniem obozu harcerskiego, stworzyć zaplecze kwatermistrzowskie, zebrać i rozliczyć fundusze (zaprojektował i współuczestniczył w wykonaniu urządzeń obozowych zaplecza kwatermistrzowskiego (np. zbudował piec, pomost, zaprojektował i kierował budową oryginalnej stołówki, itp.); pozyskał i w terminie rozliczył dotację na imprezę harcerską).'
                    '\n\n• Poszerza swoją wiedzę o polskiej przyrodzie (opisał w artykule przyrodę zaobserwowaną podczas samotnej wędrówki; przygotował wystawę własnych zdjęć przyrodniczych itp.)'
            )
          ],
        )
      ],
    ),

    const RankCatData(
      title: 'Służba',
      icon: RankData.iconCatSluzba,
      groupData: [
        RankGroupData(
            title: 'Służba Bogu',
            taskData: [
              RankTaskData(text:
              'Rozumiejąc swoje zadanie apostolskie stara się szerzyć wiarę w harcerstwie i poza nim, świadczy o Chrystusie tak własną postawą, jak i podejmowanymi wyzwaniami.',
                  example: '• Współorganizuje życie religijne w drużynie i hufcu (zorganizował grę biblijną dla harcerzy; poprowadził w gronie kadry hufca dyskusję o roli świeckich w Kościele).'
                      '\n\n• W swoim środowisku działania szerzy wiarę (zorganizował koncert muzyczny grupy chrześcijańskiej dla swojego środowiska -osiedla, miasteczka lub wsi; wraz z pozyskanymi współpracownikami przygotował działanie o charakterze ewangelizacyjnym dotyczącą ważnego aspektu wiary, np. obrony życia nienarodzonego, eutanazji, wolności seksualnej a wierności, homoseksualizmu, transseksualizmu, związków nieformalnych, itp. np. poprzez organizację wystawy, zajęć audiowizualnych, itp.).'
                      '\n\n• Stara się swoimi działaniami wspomagać funkcjonowanie parafii (udziela się aktywnie we wspólnocie parafialnej; przygotował jasełka z dziećmi z parafii).'
              )
            ]
        ),

        RankGroupData(
            title: 'Służba bliźnim i środowisku, wychowanie społeczne',
            taskData: [
              RankTaskData(text:
              'Pełni służbę indywidualną, organizuje przedsięwzięcia o charakterze służebnym, jest przygotowany do niesienia pomocy innym, wciąga do służby osoby spoza harcerstwa.',
                  example: '• Przygotowuje się do pełnienia służbyna rzecz bliźnich (ukończył kurs HOPR; pełnił służbę np.w wolontariacie względem osób starszych, niepełnosprawnych lub dzieci; zaangażował się w integrację osób niepełnosprawnych w drużynie).'
                      '\n\n• Jest współorganizatorem życia w swym środowisku (działa w samorządzie szkolnym lub w organizacjach społecznych; zorganizował imprezę w szkole lub drużynie np. rozgrywki sportowe, imprezę rowerową dla dzieci lub akcję ekologiczną; nawiązał kontakt z młodzieżą harcerską poza granicami kraju lub uczestniczył w akcji na jej rzecz).'
                      '\n\n• Samodzielnie znajduje pola służby i pełni ją indywidualnie (pełni służbę na rzecz konkretnego człowieka, np. korepetycje, opieka, pomoc).'
              )
            ]
        ),

        RankGroupData(
            title: 'Służba harcerska',
            taskData: [
              RankTaskData(text:
              'Rozumie potrzeby harcerstwa i świadomie kształtuje jego oblicze, pomaga w pracach swojej jednostki, potrafi zorganizować i przeprowadzić przedsięwzięcie o charakterze wychowawczym.',
                  example: '• Poszukuje pola służby harcerskiej, podejmuje odpowiedzialność za elementy wychowania (pełni stałą funkcję harcerską; przedstawi swoje zamierzenia w działalności harcerskiej; porozumieniu z drużynowym zaplanował i poprowadził zbiórkę gromady zuchowej).'
                      '\n\n• Działa na rzecz stałego rozwoju ruchu harcerskiego (samodzielnie poprowadził werbunek do drużyny lub założył nowy zastępu; pozyskał dla harcerstwa osobę dorosłą).'
                      '\n\n• Pracuje na rzecz poszerzania kręgu przyjaciół harcerstwa (wyjaśnił zalety harcerskiego systemu wychowawczego w porównaniu z systemem szkolnym i działalnością innych organizacji; współorganizował imprezę dla młodzieży poza harcerskiej wraz z drużyną harcerek)'
                      '\n\n• Stale pogłębia swoje harcerskie mistrzostwo (zdobył dwie sprawności mistrzowskie; na czele zastępu lub drużyny wygrał harcerski turniej).'
              )
            ]
        ),

        RankGroupData(
            title: 'Służba Polsce',
            taskData: [
              RankTaskData(text:
              'Buduje własną wizję rozwoju Polski, widzi dla siebie miejsce w kształtowaniu teraźniejszości Ojczyzny, włącza się w inicjatywy obywatelskie, orientuje się w życiu politycznym RP.',
                  example: '• Stara się czynnie realizować ideał służby Polsce (wyjaśnił, jakie widzi perspektywy rozwoju Polski i jak chciałby się przyczynić do rozwoju kraju.Przedstawił swoje zamierzenia w tym zakresie; ukształtował własne preferencje polityczne i potrafi je uzasadnić; przygotował i poprowadził akcję harcerską na rzecz wzmacniania więzi z Polakami poza granicami kraju).'
                      '\n\n• Włącza się do życia publicznego Polski (wie, jakie ugrupowania polityczne działają w Polsce i wskaże na które by głosował w wyborach; omówił zagrożenia wychowawcze we współczesnym społeczeństwie oraz sposoby obrony przed nimi).'
                      '\n\n• W swoim środowisku działania propaguje postawy patriotyczne (zorganizował wyjście grupy przyjaciół do muzeum historycznego; przygotował i wystawił przedstawienie o charakterze patriotycznym)'
              )
            ]
        )
      ],
    ),

    const RankCatData(
      title: 'Próba końcowa',
      icon: RankData.iconCatProbaKoncowa,
      groupData: [
        RankGroupData(
          taskData: [
            RankTaskData(text:
            'Charakter próby winien być indywidualny i mieć formę wyczynu. Próba winna trwać od 18 do 36 godzin. Jej celem jest ostateczne sprawdzenie w szczególności:'
                '\n\n• Dojrzałości życiowej'
                '\n• Puszczańskiego wyrobienia'
                '\n• Pełnego harcerskiego wyrobienia'
                '\n• Przygotowania do życia społecznego'
                '\n• Gotowości służby'
                '\n• Pokonywania własnych słabości',
              checkable: false,
            )
          ],
        )
      ],
    )
  ],
);
RankZHRC rankZhrHarcC4 = rankZhrHarcC4Data.build();

RankZHRCData rankZhrHarcC5Data = RankZHRCData.from(
  title: 'Harcerz Rzeczypospolitej',
  version: 1,
  org: Org.zhr_c,
  id: 'HARC_C_5',
  minWiek: 'powyżej 18 lat',
  czasTrw: '-',
  idea: 'Wkraczam w dorosłe życie, samodzielnie określam i kształtuję swój światopogląd. Odczytuję swoje powołanie, świadomie określam swoją drogę życiową. Jestem odpowiedzialny, można na mnie polegać. Pogłębiając wiarę zaczynam świadczyć o niej poza harcerstwem. Moje życie budowane jest na chrześcijańskim fundamencie. Jestem oparciem dla swojego rodzeństwa, rodziców, staram się być przykładem dla moich rówieśników. Angażuję się w życie społeczne. Wkraczam na drogę rozwoju wędrowniczego, instruktorskiego, bądź harcerstwa starszego. Systematycznie pełnię służbę bliźniemu. Świadomie kształtuję swoje relacje z otoczeniem, pełen pogody ducha rozwiązuję pojawiające się problemy.',
  koment: [
    const RankGroupData(
      taskData: [
        RankTaskData(text:
        'Próba polega na ułożeniu od 6 do 10 zadań, których zrealizowanie pozwoli na osiągnięcie ideału opisanego w Sylwetce Harcerza Rzeczypospolitej, zdobycie niezbędnej wiedzy i umiejętności, oraz pełnienie służby potrzebującym. Przynajmniej trzy zadania winny zakończyć się trwałym śladem. Próbę układa harcerz wraz z opiekunem i zatwierdza ją przed odpowiednią Kapitułą, która może wnieść korekty.',
            checkable: false
        )
      ],
    )
  ],
  cats: [

    const RankCatData(
      title: 'Praca nad sobą, wiedza, umiejętności',
      icon: RankData.iconCatCharakter,
      groupData: [
        RankGroupData(
          title: 'Rozwój duchowy (moralny i religijny)',
          taskData: [
            RankTaskData(text:
            'Rozwija się duchowo i religijnie. Ma ugruntowany system moralny oparty na wartościach chrześcijańskich. Widzi działanie Boga w swym Życiu. Chętnie służy bliźnim. Rozumie sens ofiary i cierpienia. Odważnie świadczy życiem o swej wierze.',
              example: '• Wziął udział w rekolekcjach formacyjnych lub w innego rodzaju formacji duchowej.'
                  '\n\n• Znalazł stałego spowiednika lub kierownika duchowego, prowadzi dzienniczek duszy (pracy nad sobą).'
                  '\n\n• Przeczytał publikację na temat interesującego go problemu wiary.'
                  '\n\n• Przeczytał książkę Karola Wojtyły „Miłość i odpowiedzialność” i poprowadził dyskusję na poruszone w niej tematy.'
                  '\n\n• Poznaje i rozumie różne systemy wartości, potrafi opisać fundamenty filozoficzne, na których się opierają.'
                  '\n\n• Opublikował artykuł o tematyce moralnej.',
            )
          ],

        ),

        RankGroupData(
          title: 'Praca nad charakterem',
          taskData: [
            RankTaskData(text:
            'Wyznacza sobie cele życiowe i konsekwentnie je realizuje. Stale kształtuje swój charakter. Rozumie wartość życia według Prawa Harcerskiego. Jest samodzielny, odpowiedzialny i przedsiębiorczy.',
              example: '• Wybrał swoją drogę życiową. Ma marzenia i plany życiowe.'
                  '\n\n• Zna swe zalety i braki. Wybrał problem związany za swym charakterem i postara się go rozwiązać.'
                  '\n\n• Ma swój krąg przyjaciół i znajomych.'
                  '\n\n• Opanował sztukę dialogu, potrafi słuchać i dzielić się swoimi uczuciami.'
                  '\n\n• Zarabia na swoje utrzymanie.',
            )
          ],
        ),

        RankGroupData(
          title: 'Rozwój intelektualny i zawodowy',
          taskData: [
            RankTaskData(text:
            'Ma sprecyzowane zainteresowania zawodowe i pozazawodowe oraz je rozwija. Osiągnął poziom wykształcenia odpowiedni do swych potrzeb i zamierzeń.',
              example: '• Uzyskał postęp w swej specjalizacji zawodowej, np. zaliczył rok studiów z bardzo dobrymi wynikami (jeśli nie ma zdobytych kwalifikacji zawodowych).'
                  '\n\n• Uzyskał wyraźny wzrost umiejętności w zakresie wybranego języka obcego lub innej ważnej dla niego profesji.'
                  '\n\n• Zdobył wybrane uprawnienie państwowe (np. prawo jazdy, kartę ratownika, kurs instruktorski HOPR, itp.)'
                  '\n\n• Przygotował cykl artykułów do prasy harcerskiej w przystępny sposób ukazujący wybraną dziedzinę nauki lub sztuki.'
                  '\n\n• Stworzył i prowadzi w Internecie stronę poświęconą wybranej dziedzinie wiedzy.'
                  '\n\n• Założył i prowadzi sekcję wędrowniczą skupiającą zainteresowanych wybraną dziedziną nauki.',
            )
          ],
        ),

        RankGroupData(
          title: 'Rozwój kulturalny',
          taskData: [
            RankTaskData(text:
            'Jest twórcą kultury lub animatorem życia kulturalnego w swym środowisku. Uczestniczy w życiu kulturalnym swojego regionu i Polski. Odznacza się wysokim poziomem kultury osobistej.',
              example: '• Potrafi kulturalnie dyskutować. Opanowuje swe emocje. Wyróżnia się kulturą języka.'
                  '\n\n• Potrafi np. rysować, malować, fotografować, napisać wiersz, grać na instrumencie, zaśpiewać solo.'
                  '\n\n• Uczestniczy w życiu kulturalnym, napisał cykl recenzji z wybranej dziedziny sztuki i opublikował je w prasie np. harcerskiej.'
                  '\n\n• Przygotował wystawę własnych prac artystycznych (np. fotografia, rzeźba, malarstwo, itp.).'
                  '\n\n• Prowadzi stale rubrykę poświęconą kulturze lub jednej z dziedzin sztuki w prasie harcerskiej bądź młodzieżowej.',
            )
          ],
        ),

        RankGroupData(
          title: 'Rozwój fizyczny',
          taskData: [
            RankTaskData(text:
            'Prowadzi zdrowy tryb życia. Systematycznie dba o swą kondycję fizyczną. Uzyskał dobre wyniki w wybranej dziedzinie sportu czy turystyki.',
              example: '• Systematycznie uprawia zajęcia rozwijające go fizycznie.'
                  '\n\n• Zrealizował zadanie o charakterze wyczynu sportowego.'
                  '\n\n• Z sukcesem uprawia wybraną dziedzinę sportu.'
                  '\n\n• Wyznaczył wyczynową trasę turystyczną i przebył ją w podjętym czasie.'
                  '\n\n• Zorganizował zawody sportowe na poziomie chorągwi.',
            )
          ],
        ),

        RankGroupData(
          title: 'Powołanie, wychowanie prorodzinne',
          taskData: [
            RankTaskData(text:
            'Przygotowuje się do swoich powołań życiowych (np. w służbie Bogu, w rodzinie, w samotności, w pracy społecznej, w pracy zawodowej). W zakresie swego powołania pogłębił swą wiedzę (np. przygotowuje się do życia rodzinnego).',
              example: '• Poszerzył swą znajomość problemów wychowania prorodzinnego (np. udział w kursach, lektura).'
                  '\n\n• Zorganizował działalność upowszechniającą obronę wartości życia i życia rodzinnego.'
                  '\n\n• Współorganizował konferencję dla wędrowników i młodych instruktorów poświęconą rodzinie.'
                  '\n\n• Napisał artykuł do prasy harcerskiej o problematyce rodzinnej.'
                  '\n\n• Zorganizował debatę dla szerokiego grona harcerek i harcerzy na temat współczesnych filozofii podejścia do rodziny.'
                  '\n\n• Na kursie drużynowych w swojej chorągwi poprowadził zajęcia o wychowaniu prorodzinnym harcerza.',
            )
          ],
        )

      ],
    ),

    const RankCatData(
      title: 'Służba',
      icon: RankData.iconCatSluzba,
      groupData: [
        RankGroupData(
            title: 'Służba Bogu',
            taskData: [
              RankTaskData(text: 'Stara się być czynnym apostołem. Swoim życiem i planowym działaniem szerzy wiarę.',
                  example: '• Współtworzyłżycie religijne środowiska harcerskiego i kościoła lokalnego (włączając harcerskie działania w życie parafii i działalność duszpasterstwa młodzieży).'
                      '\n\n• Włączył się (samodzielnie lub wraz ze swoim środowiskiem harcerskim) w dzieło chrześcijańskie (miłosierdzia, misyjne, inne).'
                      '\n\n• Współorganizował Dzień Papieski na poziomie chorągwi, zorganizował przedsięwzięcie, którego celem było upowszechnianie nauczania Jana Pawła II.'
              )
            ]
        ),

        RankGroupData(
            title: 'Służba bliźnim i środowisku, wychowanie społeczne',
            taskData: [
              RankTaskData(text: 'Dostrzega wokół siebie ludzi potrzebujących, pomaga im indywidualnie, potrafi zorganizować pomoc na większą skalę, poszukuje grup ludzi potrzebujących pomocy i ją dla nich organizuje.',
                  example: '• Wraz ze swoją drużyną/hufcem/środowiskiem harcerskim zorganizował dużą akcję pomocy Bezdomnym.'
                      '\n\n• Współorganizował zbiórkę darów lub pieniędzy dla ofiar klęski żywiołowej.'
                      '\n\n• Podjął stałą współpracę z organizacją charytatywną.'
                      '\n\n• Zorganizował konferencję dla młodzieży poświęconą pomocy bliźniemu.'
                      '\n\n• Podjął zadania prolife związane z ochroną życia poczętego.'
              )
            ]
        ),

        RankGroupData(
            title: 'Służba harcerska',
            taskData: [
              RankTaskData(text: 'Jest liderem w środowisku harcerskim i pozaharcerskim, organizuje jego działalność.',
                  example: '• Zorganizował akcję w swym środowisku (np. promującą ZHR, propagującą harcerski styl życia,lub zasady dobrego wychowania). Współorganizował uroczystość religijną lub patriotyczną albo wybory; pełnił służbę (np. w wolontariacie).'
                      '\n\n• Podjął własną służbę Harcerza Rzeczpospolitej w Związku.'
                      '\n\n• Określił zadania ZHR w służbie Rzeczypospolitej, m.in. w zakresie sposobów obrony wychowania przed zagrożeniami we współczesnym społeczeństwie i podjął jakąś inicjatywę w tym zakresie (np. uczestniczył w zakładaniu nowego środowiska harcerskiego, współorganizował imprezę samorządową zgodną z celami działania ZHR, zorganizował akcję promującą ZHR, założył KPH, itp.).'
              )
            ]
        ),

        RankGroupData(
            title: 'Służba Polsce',
            taskData: [
              RankTaskData(text: 'Aktywnie promuje wartości patriotyczne w środowisku rodzinnym, towarzyskim, zawodowym i w swej miejscowości. Bierze czynny udział w życiu społecznym i politycznym regionu i państwa. Dostrzega osobiste pola służby wobec Ojczyzny.',
                  example: '• Wie, jak chciałby się przyczynić do osiągnięć swego kraju (przygotował i poprowadził spotkanie dyskusyjne dla instruktorów chorągwi, które podsumował publikując w prasie harcerskiej artykuł).'
                      '\n\n• Ma skrystalizowane poglądy polityczne. Rozumie swoją współodpowiedzialność za losy narodu i państwa (np. przeprowadził cykl rozmów z czołowymi postaciami życia publicznego i opublikował je w prasie harcerskiej, urządził debatę dotyczącą problemu społecznego lub gospodarczego wśród harcerzy starszych z udziałem postaci życia publicznego).'
                      '\n\n• Orientuje się w polskiej scenie politycznej, zna programy polityczne głównych partii (zorganizował i poprowadził debatę, podczas której przedstawiono różne poglądy polityczne).'
                      '\n\n• Rozumie,czym jest patriotyzm, tożsamość narodowa, służba publiczna (zaplanował i przeprowadził grę patriotyczną na poziomie chorągwi).'
                      '\n\n• Współorganizował zawody obronne w swojej chorągwi lub środowisku działania.'
              )
            ]
        )
      ],
    ),

    const RankCatData(
      title: 'Sylwetka',
      icon: RankData.iconCatSylwetka,
      groupData: [
        RankGroupData(
          title: 'Wstęp',
          taskData: [
            RankTaskData(text: 'Zdobycie stopnia Harcerza Rzeczypospolitej wieńczy drogę wychowania harcerza ZHR-u i jest dowodem dojrzałości, czyli przygotowania do dorosłego życia i chęci realizowania etosu harcerskiego oraz ma służyć nieustannemu dalszemu rozwojowi. W przedstawionej tu sylwetce Harcerza Rzeczypospolitej zamieszczono rozszerzony opis wartości zawartych w Prawie Harcerskim i harcerskim systemie wychowawczym. Sylwetka ta pokazuje ideał harcerza ZHR, wynik do jakiego dążymy w wychowaniu harcerskim i całym naszym życiu.'
                '\n\nhm. Andrzej Glass HR, AD 2005',
              checkable: false,),
            RankTaskData(text: 'Jest autorytetem harcerskim i wzorem dla innych. Daje przykład postawy harcerskiej. Jego życie we wszystkich przejawach jest realizacją chrześcijańskiego systemu wartości oraz Przyrzeczenia i Prawa Harcerskiego, wynikających z Dekalogu. Cechuje go dojrzała wiara, ukształtowany charakter, życie uczuciowe oraz intelektualne. Stale nad nimi pracuje. Jest optymistą, wierzy w swoje siły i pomoc Boga. Jest przewodnikiem życia swojego i innych. Rozpoznaje swe powołanie i swoje miejsce w życiu oraz społeczeństwie. Buduje swą przyszłość, ma sprecyzowane plany zawodowe i podnosi swe kwalifikacje. Jest wzorem syna, członka rodziny, przyjaciela, kapłana, pracownika lub studenta. Rozumie sens każdej rzeczy, której się podejmuje oraz czyni to rozsądnie i odpowiedzialnie. Inspiruje i ożywia działalność swojego otoczenia. Potrafi służyć Polsce. Wie, jaki ślad chce pozostawić po sobie. W postawie harcerskiej widzi sposób na życie. Pracę nad sobą i służbę harcerską realizuje jako rycerską postać chrześcijaństwa - drogowskaz w działaniu patriotycznym i społecznym. Przez pryzmat postawy chrześcijanina pełni służbę bliźniemu i Polsce.',
                checkable: false
            ),
          ],
        ),

        RankGroupData(
          title: 'Rozwój duchowy (religijny i moralny), służba Bogu',
          taskData: [
            RankTaskData(text: 'Rozwija się duchowo i religijnie. Kieruje się chrześcijańskim systemem wartości, który ma ugruntowany. Ma poczucie własnej wartości i godności jako stworzenia Bożego. Kształtuje wrażliwość swego sumienia. Poznaje swą słabość oraz grzeszność i czerpie od Boga siłę na ich pokonanie poprzez sakramenty oraz modlitwę. Odkrywa plan, jaki ma Bóg względem niego. Ceni życie jako dar od Boga. Odczuwa potrzebę Miłości Bożej i dąży do szczęścia. Ma autorytety i czerpie z nich wzory. Potrafi wyznaczać granice swej wolności oraz zachowuje czystość i nie ulega uzależnieniom (nałogom). Przez wierność i czystość umacnia miłość. Spostrzega działanie Opatrzności, czyli Boga w Trójcy Świętej, w wydarzeniach swego życia lub swych bliskich i ufa Bogu. Zdaje sobie sprawę, do czego zbawia go Chrystus. Dostrzega miłość w wymiarze heroicznym jako drogę do świętości. Chce iść za Chrystusem. Szanuje godność każdego człowieka i widzi łączące go z nim braterstwo. Chętnie służy bliźnim i widzi w nich cierpiącego Chrystusa. Chce mieć w sercu Miłość. Stara się zło zwyciężać dobrem. Nie odpłaca się złem za zło. Szerzy Miłość i Pokój. Miłość buduje na prawdzie. Potrafi być pokorny i cierpliwy. Rozumie sens ofiary i cierpienia. Potrafi się wyrzekać. Potrafi dzielić się z innymi. Pieniądze i dobra materialne nie są dla niego najważniejsze. W przyrodzie widzi stworzenie Boże oraz piękno i Mądrość Stwórcy, i darzy ją miłością. Jest przyjacielem całego świata. Odważnie świadczy swym życiem o wierze. Pomaga innym w odnajdywaniu Boga. Okazuje miłość i wdzięczność Bogu przez modlitwę, czytanie Słowa Bożego, udział w sakramentach i czynne uczestnictwo w życiu swego Kościoła oraz życie religijne w rodzinie.Ma mocny kościec moralny, nie ulega złym wpływom otoczenia. Przeciwstawia się relatywizmowi etycznemu. Orientuje się w nauczaniu Kościoła o rodzinie i życiu społecznym.',),
          ],
        ),

        RankGroupData(
          title: 'Praca nad charakterem',
          taskData: [
            RankTaskData(text: 'W swym postępowaniu kieruje się Prawem Harcerskim i Dekalogiem. Systematycznie kształtuje swój charakter. Rozwija swe dobre strony i walczy ze swymi wadami. Stawia sobie wysokie wymagania. Ma własny system pracy nad swym charakterem. Jest rzetelny: słowny, terminowy, punktualny,systematyczny, odpowiedzialny, uczciwy, oszczędny, karny, szanuje prawo. Podejmuje tylko te obowiązki, które może zrealizować. Jest samodzielny, zaradny i przedsiębiorczy. Potrafi planować swe obowiązki i wybierać, które są najważniejsze. Jest życzliwy i braterski: przyjazny, koleżeński, opiekuńczy, wrażliwy na potrzeby i krzywdę innych, współczujący, uczynny, rycerski, otwarty, szanujący innych, do nikogo nie jest usposobiony wrogo, łatwo przebacza. Potrafi chwalić innych. Jest powściągliwy w osądzaniu innych. Sprawia mu radość zrobienie czegoś dobrego dla innych. Ma przyjaciół i jest lubiany. Nie kieruje się egoizmem. Nie dąży do sukcesów kosztem innych. Unika stosowania przemocy. Jest odważny: jest śmiały w marzeniach i działaniu, ma odwagę bronić innych, przeciwstawiać się złu i bronić swych przekonań. Podejmuje ambitne działania. Jest roztropny: rozumny, logiczny, przewidujący, krytycznie myślący, mądry życiowo. Ma hart ducha i radość życia: jest wytrwały w dążeniach, ma silną wolę, nie załamuje się, z pogodą ducha pokonuje przeciwności i znosi niepowodzenia, wyciąga naukę z porażek, nie boi się popełniania błędów, nigdy nie narzeka i nie żywi bezzasadnych pretensji. Potrafi z zaufaną osobą rozmawiać o swoich problemach. Wierzy w swoje siły. Jest cierpliwy. Jest radosny i ma poczucie humoru. Potrafi z siebie żartować. Jest optymistą. Panuje nad swymi emocjami: wyróżnia się kulturą osobistą, unika zarozumiałości, dostrzega swą niedoskonałość oraz że nie zawsze ma rację, stać go na pokorę, uznaje racje i argumenty adwersarzy w dyskusji, potrafi przyznać się do własnych błędów, w dyskusji nie ma wrogów lecz przyjaciół, z którymi chce wspólnie dojść do prawdy, nie obraża się, jest spokojny i rzeczowy, nie chce poniżyć godności drugiego, wystrzega się ironii i złośliwości, jest skromny, nie stara się by go honorowano, panuje nad swym językiem, złym humorem, gwałtownymi reakcjami i strachem, jest zrównoważony. Potrafi okazywać pozytywne uczucia (rodzicom, rówieśnikom, dorosłym), nie wstydzi się ich. Pokonuje swą nieśmiałość. Potrafi nawiązywać kontakt z innymi.',),
          ],
        ),

        RankGroupData(
          title: 'Miejsce w życiu, powołanie',
          taskData: [
            RankTaskData(text: 'Ma śmiałe marzenia, pragnienia i plany życiowe. Poszukuje swej drogi do szczęścia. Odważnie wyznacza sobie cele życiowe i konsekwentnie je realizuje. Tworzy dalekosiężną wizję swego życia. Przygotowuje się do swoich powołań Życiowych (np. w służbie Bogu: w rodzinie, w kapłaństwie, w życiu zakonnym, w samotności; w pracy społecznej, w pracy zawodowej). W zakresie swego powołania pogłębia swą wiedzę (np. przygotowuje się do życia rodzinnego). Ma własną wizję szczęśliwej rodziny, roli i ideału męża i żony,roli ojca i matki oraz dzieci lub też wizję posługi kapłańskiej. Ma podstawową wiedzę psychologiczną, wychowawczą i teologiczną w wybranym zakresie. Ma odpowiedzialny stosunek do dziewcząt i kobiet. Docenia wartość czystości przedmałżeńskiej i naturalnego planowania rodziny. Broni życia od momentu poczęcia do naturalnej śmierci. Zna problemy swego domu rodzinnego i stara się brać udział w ich rozwiązywaniu. Pełni służbę na rzecz swej rodziny. Poznał dzieje i podtrzymuje dobre tradycje swej rodziny. Okazuje szacunek osobom starszym.',),
          ],
        ),

        RankGroupData(
          title: 'Zainteresowania. Rozwój intelektualny i zawodowy',
          taskData: [
            RankTaskData(text: 'Ma sprecyzowane zainteresowania zawodowe i pozazawodowe, które rozwija. Osiąga mistrzostwo w dziedzinie swych zainteresowań. Osiągnął poziom wykształcenia odpowiedni do swych potrzeb i zamierzeń oraz stale się dokształca. Traktuje swój zawód jako służbę bliźnim i Polsce. Docenia potrzebę znajomości języków obcych, przynajmniej jednym posługuje się płynnie. Potrafi posługiwać się współczesnymi środkami łączności i techniki oraz posiada umiejętności z ważnej dla niego dziedziny. Zdobyte w harcerstwie umiejętności i doświadczenie w pracy z młodzieżą potrafi twórczo wykorzystywać w życiu rodzinnym i zawodowym.',),
          ],
        ),

        RankGroupData(
          title: 'Rozwój kulturalny',
          taskData: [
            RankTaskData(text: 'Jest kulturalny w mowie i zachowaniu; jest taktowny. Stosuje zasady dobrego wychowania (savoir vivre’u). Uprawia kulturalne rozrywki. Posługuje się gawędą, piosenką, inscenizacją i zdobnictwem także w życiu rodzinnym i zawodowym. Rozwija posiadane zdolności, a w razie potrzeby potrafi ich brak nadrobić zaradnością i wytrwałością. Jest twórcą dóbr kulturalnych (np. fotografia, film, rysunek, grafika, malarstwo, gra na instrumencie) lub animatorem życia kulturalnego w życiu rodzinnym i w swym środowisku. Uczestniczy w życiu kulturalnym (bywanie w teatrze, operze, na koncertach, przynależność do zespołu artystycznego, czytanie literatury pięknej). Zna dorobek kultury polskiej i europejskiej.',),
          ],
        ),

        RankGroupData(
          title: 'Rozwój fizyczny i psychofizyczny, wyczyn',
          taskData: [
            RankTaskData(text: 'Prowadzi zdrowy tryb życia. Systematycznie dba o swą kondycję fizyczną. Dokonał wyczynu lub uprawia wybraną dziedzinę sportu czy turystyki. Chętnie przebywa wśród przyrody. Dostosowuje rodzaj i intensywność zajęć do stanu zdrowia i wieku. Nie szermuje swoim zdrowiem i życiem. Ma wyćwiczoną pamięć, spostrzegawczość, bystrość, podzielność uwagi i szybkość reakcji oraz zręczność i sprawność działania.',),
          ],
        ),
        RankGroupData(
          title: 'Służba społeczna i służba Polsce',
          taskData: [
            RankTaskData(text: 'Jest liderem w środowisku harcerskim i pozaharcerskim, organizuje jego działalność. Charakteryzuje go postawa patriotyczna, społeczna i ekologiczna. Znajduje sobie na miarę możliwości i potrzeb pole aktywności społecznej (np. ochrony przyrody, ekologiczne, kulturalne, sportowe, wolontariat, działalność dobroczynną). Działa w organizacjach społecznych w dobrej sprawie. Widzi zadania ZHR w służbie Rzeczypospolitej, m.in. w zakresie sposobów obrony przed zagrożeniami dla wychowania we współczesnym społeczeństwie. Czynnie realizuje postawę umiłowania Ojczyzny. Realizuje swe powołanie mężczyzny troszcząc się o własną rodzinę lub przedkładając posługę kapłańską Kościołowi, chroniąc dobro wspólne i broniąc Ojczyzny. Kultywuje patriotyczne tradycje rodziny, regionu i Polski. Przywiązuje wagę do tradycji niepodległościowych i tradycji niepokornego harcerstwa. Czynnie realizuje swą miłość do Ojczyzny promując wartości patriotyczne w środowisku rodzinnym, towarzyskim, zawodowym i w swej miejscowości przez organizowanie odpowiednich akcji (np. spotkania z ludźmi, obchody rocznicowe, inscenizacje, wycieczki, dbałość o miejsca pamięci, poznawanie tradycji, zbieranie i utrwalanie informacji). Patriotyzm opiera na miłości do swoich, a nie na szowinizmie i wrogości do innych. Jest świadom naszych zalet i wad narodowych. Staje po stronie prawdy w historii i polityce. Ma skrystalizowane poglądy polityczne, potrafi o nich dyskutować. Widzi swą współodpowiedzialność za losy narodu i państwa. Bierze aktywny udział w Życiu społecznym i politycznym regionu i państwa. Jeżeli jest to częścią jego powołania, bierze czynny udział w służbie publicznej. Widzi pola swej służby wobec Ojczyzny i wie, na jakim odcinku chciałby się przyczynić do osiągnięć Polski. Uczestniczy, w miarę możliwości i potrzeb, w kontaktach z Polakami poza krajem.',),
          ],
        ),

        RankGroupData(
          title: 'Służba społeczna i służba Polsce',
          taskData: [
            RankTaskData(text: 'Jest liderem w środowisku harcerskim i pozaharcerskim, organizuje jego działalność. Charakteryzuje go postawa patriotyczna, społeczna i ekologiczna. Znajduje sobie na miarę możliwości i potrzeb pole aktywności społecznej (np. ochrony przyrody, ekologiczne, kulturalne, sportowe, wolontariat, działalność dobroczynną). Działa w organizacjach społecznych w dobrej sprawie. Widzi zadania ZHR w służbie Rzeczypospolitej, m.in. w zakresie sposobów obrony przed zagrożeniami dla wychowania we współczesnym społeczeństwie. Czynnie realizuje postawę umiłowania Ojczyzny. Realizuje swe powołanie mężczyzny troszcząc się o własną rodzinę lub przedkładając posługę kapłańską Kościołowi, chroniąc dobro wspólne i broniąc Ojczyzny. Kultywuje patriotyczne tradycje rodziny, regionu i Polski. Przywiązuje wagę do tradycji niepodległościowych i tradycji niepokornego harcerstwa. Czynnie realizuje swą miłość do Ojczyzny promując wartości patriotyczne w środowisku rodzinnym, towarzyskim, zawodowym i w swej miejscowości przez organizowanie odpowiednich akcji (np. spotkania z ludźmi, obchody rocznicowe, inscenizacje, wycieczki, dbałość o miejsca pamięci, poznawanie tradycji, zbieranie i utrwalanie informacji). Patriotyzm opiera na miłości do swoich, a nie na szowinizmie i wrogości do innych. Jest świadom naszych zalet i wad narodowych. Staje po stronie prawdy w historii i polityce. Ma skrystalizowane poglądy polityczne, potrafi o nich dyskutować. Widzi swą współodpowiedzialność za losy narodu i państwa. Bierze aktywny udział w Życiu społecznym i politycznym regionu i państwa. Jeżeli jest to częścią jego powołania, bierze czynny udział w służbie publicznej. Widzi pola swej służby wobec Ojczyzny i wie, na jakim odcinku chciałby się przyczynić do osiągnięć Polski. Uczestniczy, w miarę możliwości i potrzeb, w kontaktach z Polakami poza krajem.',),
          ],
        )
      ],
    )
  ],
);
RankZHRC rankZhrHarcC5 = rankZhrHarcC5Data.build();