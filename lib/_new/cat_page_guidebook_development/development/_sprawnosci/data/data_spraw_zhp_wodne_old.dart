import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/models/spraw_group.dart';

SprawBook sprawBookZHPWodneOld = SprawBookData(
    id: SprawBookData.ZHP_HARC_OLD_WOD_ID,
    title: 'Sprawności wodne ZHP',
    source: 'Program Wychowania Wodnego, stopnie i sprawności harcerskie, Gdynia 2016',
    color: SprawBookData.SPRAW_BOOK_ZHP_WODNE_OLD_COLOR,
    icon: SprawBookData.SPRAW_BOOK_ZHP_WODNE_OLD_ICON,
    male: true,
    female: true,
    groupData: [

          SprawGroupData(
              id: 'spraw_podstawowe',
              title: 'Sprawności podstawowe',
              familyData: [

                    SprawFamilyData(
                        id: 'ratownik',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Ratownik',
                                  ////iconRes: 'spraw_wod_h_ratownik',
                                  level: '1',
                                  tasks: [
                                        'Zawsze pływa w kamizelce asekuracyjnej lub ratunkowej.',
                                        'Wie jakimi ﬂagami oznacza się kąpieliska w Polsce i co one oznaczają.',
                                        'Opowie o tym w jakich miejscach należy unikać kąpieli.',
                                        'Skompletował apteczkę zastępu lub wachty na biwak, rejs lub obóz.',
                                        'Umie wezwać pomoc w przypadku wypadku nad wodą.',
                                        'Zawiązał węzeł ratowniczy.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Ratownik',
                                  ////iconRes: 'spraw_wod_h_ratownik',
                                  level: '2',
                                  tasks: [
                                        'Wie jak działa ratownictwo wodne w Polsce.',
                                        'Z zastępem lub wachtą odwiedził stację ratownictwa wodnego lub sekcję wodną straży pożarnej.',
                                        'Potraﬁ udzielić pomocy w przypadku skaleczenia i oparzenia słonecznego.',
                                        'Zapobiega wystąpieniu udaru słonecznego, w czasie zajęć na wodzie zawsze nosi czapkę.',
                                        'Zna numery alarmowe stosowane przez służby ratownicze, potraﬁ wezwać pomoc przez telefon.',
                                        'Wskaże na mapie gdzie na najbliższych zbiornikach wodnych zlokalizowane są służby mogące nieść pomoc na wodzie.',
                                        'Zawiąże węzeł ratowniczy w wodzie oraz na lądzie z zawiązanymi oczami.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Ratownik',
                                  ////iconRes: 'spraw_wod_h_ratownik',
                                  level: '3',
                                  tasks: [
                                        'Zna strukturę i dyslokację jednostek Morskiej Służby Poszukiwania i Ratownictwa w Polsce.',
                                        'Potrafi udzielić pomocy w przypadku złamania, krwotoku, zwichnięcia.',
                                        'Brał udział w ćwiczeniach RKO na fantomie.',
                                        'Rozpoznaje oznaki hipotermii i wie jak postąpić w przypadku jej wystąpienia.',
                                        'Ustawił odpowiednio jacht w przypadku pozorowanego pożaru i pozorowanej awarii takielunku.',
                                        'Prawidłowo podał koło ratunkowe, założył pas ratunkowy i kamizelkę asekuracyjną.',
                                        'Wie na czym polega manewr sztrandowania.',
                                        'Ukończył przynajmniej 9 godzinny kurs pierwszej pomocy.',
                                        'Zna przynajmniej 6 sposobów wzywania pomocy na wodach śródlądowych.',
                                        'Skoczył do wody na nogi w kamizelce ratunkowej z wysokości 2 metrów.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Ratownik',
                                  ////iconRes: 'spraw_wod_h_ratownik',
                                  level: '4',
                                  tasks: [
                                        'Zna procedurę wzywania pomocy przez radiotelefon UKF, potrafi odebrać komunikat MAYDAY, PAN-PAN i SECURITE.',
                                        'Posługuje się szelkami asekuracyjnymi na pokładzie.',
                                        'Wie jak działa i do czego służy tyczka z chorągiewką, pława świetlna.',
                                        'Wie jak i kiedy używać pirotechnicznych środków wzywania pomocy: flary, rakiety i pławki dymnej.',
                                        'Posiada odznakę Ratownik ZHP lub ukończył inny 15 godzinny kurs pierwszej pomocy.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: 'marynista',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Marynista',
                                  ////iconRes: 'spraw_wod_h_marynista',
                                  level: '1',
                                  tasks: [
                                        'Potrafi znaleźć w swoim otoczeniu 10 produktów, które mogły dotrzeć do Polski drogą morską.',
                                        'Wymieni przynajmniej 3 gatunki ryb żyjących w Bałtyku i spożywanych w Polsce, przynajmniej jednego z nich próbował.',
                                        'Prawidłowo zachował się w czasie podniesienia Bandery Polski oraz Bandery ZHP.',
                                        'Potrafi wymienić i wskazać na mapie dwa duże polskie porty morskie, dwa znane ośrodki wypoczynkowe i dwa porty rybackie.',
                                        'Rozpozna Banderę Marynarki Wojennej RP i Proporzec Marynarki Wojennej RP.',
                                        'Potrafi nazwać stopnie stosowane w marynarce handlowej.',
                                        'Zaśpiewał przynajmniej jedną pieśń morską.',
                                        'Opowiedział o przynajmniej 5 zwyczajach i przesądach żeglarskich.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Marynista',
                                  ////iconRes: 'spraw_wod_h_marynista',
                                  level: '2',
                                  tasks: [
                                        'Zna pochodzenie marynarskiego munduru, potrafi wytłumaczyć genezę kroju kołnierza, trzech pasków na kołnierzu, czarnych krawatów i wstążek na czapce, rozszerzanych spodni i sznurków na rozcięciach munduru.',
                                        'Zna historię Władysława Wagnera i jachtów Zjawa.',
                                        'Wie kim byli Mariusz Zaruski, Witold Bublewski i Bolesław Romanowski.',
                                        'Opowie o życiu i dokonaniach wybranej postaci związanej z harcerskim ruchem wodnym.',
                                        'Wie jakie ryby poławiane są na Morzu Bałtyckim oraz jakie produkty przyjmują polskie porty.',
                                        'Rozpozna Banderę ZHP, Yacht Klubu Polski, Ligi Morskiej i Rzecznej oraz Jacht Klubu Marynarki Wojennej Kotwica.',
                                        'Wie jak wyglądają proporce drużynowego, retmana, pilota chorągwi i Naczelnika ZHP.',
                                        'Wymieni najbardziej zasłużone okręty Polskiej Marynarki Wojennej walczące w czasie II wojny światowej, opowie historię przynajmniej jednego z nich.',
                                        'Wybijał szklanki na dzwonie, wie ile o których godzinach.',
                                        'Zna nazwy przynajmniej 5 polskich żaglowców.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Marynista',
                                  ////iconRes: 'spraw_wod_h_marynista',
                                  level: '3',
                                  tasks: [
                                        'Zna historię Leonida Teligi i jego jachtu Opty.',
                                        'Zna położenie przynajmniej jednej polskiej platformy wiertniczej na Morzu Bałtyckim.',
                                        'Wie jak wygląda Wielka i Mała Gala Flagowa.',
                                        'Potrafi opowiedzieć przynajmniej jeden epizod z dziejów Polskiej Marynarki Wojennej w czasie II wojny światowej (np. ucieczka ORP Batory, internowanie.',
                                        'Zna genezę i przebieg Bitwy pod Oliwą (1627).',
                                        'Wie czym zajmuje się Stacja Morska na Helu i jakie są problemy ochrony fok i morświnów.',
                                        'Wie czym się różni szanta od piosenki żeglarskiej, potrafi zaśpiewać 4 szanty i 4 pieśni kubryku.',
                                        'Potrafi zachować się wchodząc na jacht morski, umie oddać salut Banderze.',
                                        'Zna historię jachtu Zawisza Czarny.',
                                        'Przeczytał przynajmniej jedną książkę Karola Borchardta.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Marynista',
                                  ////iconRes: 'spraw_wod_h_marynista',
                                  level: '4',
                                  tasks: [
                                        'Zna najważniejsze porty Polski i ich rolę dla polskiej gospodarki.',
                                        'Zna podstawowe fakty o wybranym polskim porcie morskim (np. wartość przeładowanych towarów, ilość przeładowanych towarów, rodzaje towarów przeładowywanych w polskich portach).',
                                        'Rozpozna bandery wszystkich państw i obszarów leżących nad Morzem Bałtyckim, wie gdzie jacht nosi banderę odwiedzanego kraju.',
                                        'Rozumie problematykę występowania gatunków obcych w Morzu Bałtyckim.',
                                        'Prowadził uroczystość podniesienia bandery na obozie lub w rejsie.',
                                        'Brał udział w rejsie lub odwiedził flagowy jacht ZHP s/y Zawisza Czarny.',
                                        'Za pomocą systemów opartych o AIS potrafi wskazać, gdzie aktualnie znajduje się s/y Zjawa IV, s/y Zawisza Czarny, STS Dar Młodzieży.',
                                        'Wie jak i kiedy oddawać honory Banderą.',
                                        'Zna znaczenie przynajmniej 8 flag MKS.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: 'plywak',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Pływak',
                                  ////iconRes: 'spraw_wod_h_plywak',
                                  level: '1',
                                  tasks: [
                                        'Przepłynął 100 m, w tym połowę na plecach.',
                                        'Wytrzymał pod wodą 20 sekund.',
                                        'Położył się na wodzie i utrzymał się na niej przez 30 sekund.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Pływak',
                                  ////iconRes: 'spraw_wod_h_plywak',
                                  level: '2',
                                  tasks: [
                                        'Przepłynął 200 m, w tym połowę na plecach.',
                                        'Skoczył do wody z wysokości 1 m i przepłynął pod wodą 10 m.',
                                        'Wyciągnął 3 przedmioty znajdujące się 1,5 metra pod wodą.',
                                        'Przepłynął między nogami kolegi pod wodą.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Pływak',
                                  ////iconRes: 'spraw_wod_h_plywak',
                                  level: '3',
                                  tasks: [
                                        'Przepłynął 400 m, co najmniej 3 różnymi stylami.',
                                        'Potrafi bezpiecznie skoczyć do wody na kilka sposobów, w tym w kamizelce asekuracyjnej.',
                                        'Przepłynął 50 metrów w ubraniu.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Pływak',
                                  ////iconRes: 'spraw_wod_h_plywak',
                                  level: '4',
                                  tasks: [
                                        'Przepłynął 600 m, co najmniej 3 różnymi stylami.',
                                        'Potrafi pływać kraulem ratowniczym, przepłynął 50 metrów w czasie poniżej 1 minuty.',
                                        'Potrafi pływać żabką ratowniczą i przepłynął 100 m w czasie poniżej 3 minut.',
                                        'Przepłynął pod wodą 20 metrów.',
                                        'Potrafi holować tonącego.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: 'meteorolog',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Meteorolog',
                                  ////iconRes: 'spraw_wod_h_meteorolog',
                                  level: '1',
                                  tasks: [
                                        'Opowie co to jest wiatr.',
                                        'Pokaże szkwał na jeziorze.',
                                        'Wyjaśni jak powstaje rosa, deszcz i śnieg.',
                                        'Przed wycieczką zastępu lub wachty wysłuchał prognozy pogody w radio lub telewizji, i na jej podstawie dobrał odpowiednią odzież.',
                                        'Rozumie skalę Celsjusza, wie ile stopni oznacza ciepło, a ile zimno.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Meteorolog',
                                  ////iconRes: 'spraw_wod_h_meteorolog',
                                  level: '2',
                                  tasks: [
                                        'Narysuje na czym polega zjawisko bryzy nocnej i dziennej.',
                                        'Będąc na wycieczce lub spływie lub rejsie rozpozna z jaką siłą wieje wiatr w skali Beauforta.',
                                        'Wie jak wygląda chmura cumulonimbus i jakie niesie zagrożenia.',
                                        'Wskaże 4 oznaki, na podstawie których można przewidzieć dobrą lub złą pogodę.',
                                        'Wie jaka jest wartość ciśnienia normalnego, i wie jaką wartość ma ciśnienie wysokie, a jaką niskie.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Meteorolog',
                                  ////iconRes: 'spraw_wod_h_meteorolog',
                                  level: '3',
                                  tasks: [
                                        'Zna skalę Beauforta w zakresie od 0 do 7 stopni.',
                                        'Potrafi posługiwać się skalą stanu morza.',
                                        'Zna rodzaje chmur i potrafi powiedzieć, kiedy one występują i przy jakiej pogodzie. Rozpozna chmury na niebie.',
                                        'Omówi powstawanie i działanie podstawowych zjawisk atmosferycznych (szkwał, deszcz, mgła, wiatr).',
                                        'Rozumie zasadę działania systemu ostrzegania meteorologicznego na Wielkich Jeziorach Mazurskich.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Meteorolog',
                                  ////iconRes: 'spraw_wod_h_meteorolog',
                                  level: '4',
                                  tasks: [
                                        'Stosuje numeryczne prognozy pogody z przynajmniej trzech serwisów.',
                                        'Ściąga i stosuje griby.',
                                        'Na podstawie mapy synoptycznej potrafi przewidzieć prognozę pogody na najbliższą dobę.',
                                        'Wysłuchał ze zrozumieniem prognozy pogody w języku angielskim.',
                                        'Przynajmniej raz odebrał i zanotował morską prognozę pogody.',
                                        'Zna globalne procesy meteorologiczne zachodzące na kuli ziemskiej (prądy, huragany, przemieszczanie się mas powietrza itp).',
                                        'Zna pełną skalę Beauforta.',
                                  ])
                        ]
                    )
              ]
          ),

          SprawGroupData(
              id: 'spraw_zeglarskie',
              title: 'Sprawności żeglarskie',
              familyData: [

                    SprawFamilyData(
                        id: 'szyper',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Szyper',
                                  ////iconRes: 'spraw_wod_h_szyper',
                                  level: '1',
                                  tasks: [
                                        'Rozumie zasadę "jedna ręka dla jachtu - jedna ręka dla siebie".',
                                        'Pływał łódką z żaglem jako załogant, potrafił się zachować na jachcie.',
                                        'Pomagał w zacumowaniu jachtu żaglowego.',
                                        'Wskazał dziób i rufę oraz lewą i prawą burtę jachtu lub łodzi.',
                                        'Wskazał kierunek z jakiego wieje wiatr.',
                                        'Odróżnia pojęcia bajdewind, półwiatr, baksztag, fordewind.',
                                        'Potrafi wiosłować (pagajować) i wykonywać komendy na wiosła (pagaje).',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Szyper',
                                  //iconRes: 'spraw_wod_h_szyper',
                                  level: '2',
                                  tasks: [
                                        'Dobrze wykonuje polecenia prowadzącego jacht.',
                                        'Poprawnie odpowiada na komendy.',
                                        'Pełnił funkcję obserwatora w czasie ćwiczenia alarmu „człowiek za burtą".',
                                        'Potrafi kierować jachtem typu slup o długości do 6 metrów lub ket - potrafi ostrzyć i odpadać, wykonać zwroty na wiatr i z wiatrem.',
                                        'Bezpiecznie cumuje jacht typu slup o długości do 6 metrów lub ket.',
                                        'Potrafi wybierać i luzować żagle, pełnił funkcję szotowego na jachcie.',
                                        'Pracował cumami, odróżnia cumy od szpringów.',
                                        'Założył odbijacze tak, żeby skutecznie pracowały.',
                                        'Potrafi prawidłowo refować żagle, wie do czego służy czynność refowania.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Szyper',
                                  //iconRes: 'spraw_wod_h_szyper',
                                  level: '3',
                                  tasks: [
                                        'Potrafi, na jachcie o długości większej niż 5 metrów, wykonać manewry pod żaglami w zakresie:'
                                            '\na) optymalnego doboru żagli do panujących warunków,'
                                            '\nb) prowadzenia jachtu pod żaglami przy spotkaniu z innym jachtem oraz jego wyprzedzaniem,'
                                            '\nc) zwrot przez sztag, zwrot przez rufę, dojście do boi, odejście od boi, dojście i odejście od nabrzeża, stawanie w dryf, alarm "człowiek za burtą".',
                                        'Potrafi, na jachcie o długości większej niż 5 metrów, wykonać manewry jachtem żaglowym na silniku w zakresie:'
                                            '\na) kotwiczenie i cumowanie w różnych warunkach,'
                                            '\nb) umiejętność prowadzenia jachtu żaglowego na silniku przy spotkaniu z innym jachtem,'
                                            '\nc) alarm "człowiek za burtą".',
                                        'Potrafi kierować załogą, posiada umiejętność wydawania komend i egzekwowania ich wykonania we właściwym momencie, stosownie do sytuacji, w jakiej znajduje się jacht.',
                                        'Rozróżnia kursy jachtu względem wiatru.',
                                        'Wie czym różni się wiatr rzeczywisty i pozorny.',
                                        'Zna i rozumie siły działające na żagle, ster i kadłub jachtu.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Szyper',
                                  //iconRes: 'spraw_wod_h_szyper',
                                  level: '4',
                                  tasks: [
                                        'Potrafi wykonać manewry portowe na silniku, jachtem kabinowym dłuższym niż 7,5 metra: wejście między Y bomy rufą do kei, wejście między Y bomy dziobem do kei, cumować na mooringach dziobem i rufą.',
                                        'Potrafi wykonać manewr podejścia do boi jachtem kabinowym dłuższym niż 7,5 metra, na żaglach, lub jachtem dwumasztowym.',
                                        'Potrafi wykonać manewr "człowiek za burtą" jachtem kabinowym dłuższym niż 7,5 metra, zarówno na żaglach, jak i na silniku.',
                                        'Potrafi wykonać manewr podejścia do kei jachtem kabinowym dłuższym niż 7,5 metra, używając tylko żagli.',
                                        'Potrafi wykonać manewry: człowiek za burtą, zwrot przez sztag, zwrot przez rufę na jachcie dwumasztowym.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: 'bosman',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Bosman',
                                  //iconRes: 'spraw_wod_h_bosman',
                                  level: '1',
                                  tasks: [
                                        'Zawiązał 8 różnych węzłów stosowanych w różnych sytuacjach.',
                                        'Potrafi wskazać dwa różne fały i szoty na jachcie żaglowym.',
                                        'Wskaże na jachcie żaglowym różne typy osprzętu i potrafi wyjaśnić do czego służą.',
                                        'Zawiązał węzeł knagowy.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Bosman',
                                  //iconRes: 'spraw_wod_h_bosman',
                                  level: '2',
                                  tasks: [
                                        'Wskaże i nazwie części jachtu mieczowego.',
                                        'Poznał zasady budowy jachtów, konstrukcję łodzi i nazewnictwo jej części oraz rodzaje poszycia, drzewca, osprzętu, olinowania i ożaglowania.',
                                        'Zawiązał 10 różnych węzłów, stosowanych w różnych sytuacjach.',
                                        'Potrafi prawidłowo zamontować i zdemontować spalinowy silnik przyczepny.',
                                        'Brał udział w tankowaniu silnika spalinowego, wie czym różni się silnik dwusuwowy od czterosuwowego.',
                                        'Węzeł knagowy wiąże poprawnie z zawiązanymi oczami.',
                                        'Poprawnie sklarował jacht.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Bosman',
                                  //iconRes: 'spraw_wod_h_bosman',
                                  level: '3',
                                  tasks: [
                                        'Brał udział w pracach laminarskich, zeszlifował na równo laminowany element.',
                                        'Brał udział w zabezpieczaniu sprzętu wodnego przed zimą.',
                                        'Malował elementy jachtu farbami rozpuszczalnikowymi, zadbał o narzędzia po zakończeniu malowania.',
                                        'Zawiązał przynajmniej 10 węzłów stosowanych w różnych sytuacjach.',
                                        'Przygotowywał mieszankę paliwową dla silnika dwusuwowego.',
                                        'Potrafi bezpiecznie obchodzić się z instalacją gazową. Obsługiwał instalację gazową na jachcie.',
                                        'Założył opaski na końcówki lin miękkich.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Bosman',
                                  //iconRes: 'spraw_wod_h_bosman',
                                  level: '4',
                                  tasks: [
                                        'Nazwał żagle na jachcie typu kecz.',
                                        'Zna przynajmniej 10 typów ożaglowania.',
                                        'Potrafi wyjąć świecę w silniku przyczepnym i wyczyścić ją.',
                                        'Zna zasadę pracy silnika czterosuwowego wysokoprężnego, potrafi wskazać na takim silniku filtr paliwa i oleju oraz pompę chłodzenia.',
                                        'Dokonał naprawy żagla.',
                                        'Potrafi zawiązać opaskę turecką i kulkę bosmańską.',
                                        'Wykonał sploty lin miękkich.',
                                  ])
                        ]
                    )

              ]),

          SprawGroupData(
              id: 'spraw_zeglar_motorowod',
              title: 'Sprawności żeglarskie - motorowodne',
              familyData: [

                    SprawFamilyData(
                        id: 'nawigator',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Nawigator',
                                  //iconRes: 'spraw_wod_h_nawigator',
                                  level: '1',
                                  tasks: [
                                        'Z pomocą kompasu wskazał wschód, zachód, północ i południe.',
                                        'Wie gdzie w jego okolicy znajdują się zbiorniki wodne, potrafi o nich coś opowiedzieć.',
                                        'Zna nazwę rzeki jaka przepływa w jego okolicy, wie do jakiej zlewni ona należy i gdzie można nią dopłynąć.',
                                        'Za pomocą informacji dostępnych w Internecie zaplanował podróż do innego miasta środkami komunikacji publicznej.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Nawigator',
                                  //iconRes: 'spraw_wod_h_nawigator',
                                  level: '2',
                                  tasks: [
                                        'Posługiwał się kompasem, umie wyznaczyć azymut na mapie i w terenie.',
                                        'Zna wielkie rzeki Polski oraz pojezierza.',
                                        'Zorientował mapę w oparciu o przedmioty terenowe.',
                                        'Brał udział w imprezie na orientację na wodzie.',
                                        'Korzysta z GPS, potrafi podać współrzędne geograficzne swojego domu i kilku wybranych punktów w swoim mieście.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Nawigator',
                                  //iconRes: 'spraw_wod_h_nawigator',
                                  level: '3',
                                  tasks: [
                                        'Korzysta z mapy, orientuje ją według kierunku północnego i według kształtu terenu.',
                                        'W czasie rejsów korzysta z przewodników i opisów dróg wodnych, wejść do portów itp.',
                                        'Obliczył drogę na mapie turystycznej oraz znając swoją prędkość obliczyć czas dotarcia do celu.',
                                        'Orientuje się na podstawie położenia słońca i gwiazd.',
                                        'Zna przynajmniej jeden popularny akwen żeglarski w Polsce (Wielkie Jeziora Mazurskie, Pętlę Wielkopolską, Jeziorak, Jezioro Zegrzyńskie, Zalew Soliński itp) i potrafi podać jego charakterystykę.',
                                        'Wie jak działa system GPS, potrafi wskazać jego ograniczenia.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Nawigator',
                                  //iconRes: 'spraw_wod_h_nawigator',
                                  level: '4',
                                  tasks: [
                                        'Zna znaki stosowane na mapach morskich.',
                                        'Potrafi praktycznie posługiwać się programem do nawigacji morskiej. Potrafi wyznaczyć waypoints i trasę żeglugi.',
                                        'Potrafi określić pozycję jachtu na podstawie obserwacji dwóch punktów oraz na podstawie obserwacji jednego punktu i głębokości.',
                                        'Potrafi wykonać zadanie polegające na określeniu pozycji jachtu metoda zaliczeniową.',
                                        'Zna przynajmniej 5 portów morskich i zatokowych w Polsce, potrafi o każdym z nich opowiedzieć.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: 'jurysta_zeglarski',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Jurysta żeglarski',
                                  //iconRes: 'spraw_wod_h_jurysta',
                                  level: '1',
                                  tasks: [
                                        'Na wycieczce widział śluzę, jaz lub ostrogę.',
                                        'Wie jak muszą się minąć łodzie wiosłowe płynące po jeziorze, by nie doszło do zderzenia.',
                                        'Wie jakim statkom ustępuje jacht żaglowy i jakie statki muszą ustąpić jachtowi żaglowemu.',
                                        'Płynąc po rzece lub jeziorze widział znaki stosowane na drogach wodnych i wie co one oznaczają.',
                                        'Rozpoznał na moście żółte romby i wie jak oznacza się przejście pod mostem.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Jurysta żeglarski',
                                  //iconRes: 'spraw_wod_h_jurysta',
                                  level: '2',
                                  tasks: [
                                        'Odróżni, który jacht płynie lewym, a który prawym halsem.',
                                        'Rozumie zasadę prawej strony w przypadku spotkania się dwóch jachtów motorowych.',
                                        'Wie jakie uprawnienia są konieczne do kierowania jachtami żaglowymi i motorowodnymi po wodach śródlądowych.',
                                        'Widział oznaczenia drogi wodnej na rzekach.',
                                        'Na rzece wskaże którędy płynie nurt, gdzie znajduje sie ploso, przymulisko i odsypisko i przykosa.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Jurysta żeglarski',
                                  //iconRes: 'spraw_wod_h_jurysta',
                                  level: '3',
                                  tasks: [
                                        'Zna znaczenie znaków żeglugowych stosowanych na wodach śródlądowych.',
                                        'Wie jak w Polsce oznaczane są śródlądowe drogi wodne.',
                                        'Wie jakie budowle hydrotechniczne można spotkać na polskich wodach śródlądowych.',
                                        'Był przy śluzie w czasie śluzowania, zna zasady śluzowania.',
                                        'Zna oznaczenia statków stosowane w porze dziennej i nocnej na wodach śródlądowych.',
                                        'Zna przepisy prawa drogi stosowane na wodach śródlądowych'
                                            'Potrafi omówić elementy rzeki nieuregulowanej i uregulowanej.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Jurysta żeglarski',
                                  //iconRes: 'spraw_wod_h_jurysta',
                                  level: '4',
                                  tasks: [
                                        'Zna oznakowanie boczne systemu IALA.',
                                        'Zna zasady oznakowania kardynalnego, odróżnia boje kardynalne na podstawie tylko znaków szczytowych, i tylko kolorów.',
                                        'Zna podstawowe przepisy Międzynarodowego Prawa Drogi Morskiej stosowane wobec statków o napędzie żaglowym.',
                                        'Zna przynajmniej 5 charakterystyk świateł stosowanych na znakach nawigacyjnych.',
                                  ])
                        ]
                    )

              ]),

          SprawGroupData(
              id: 'spraw_motorowod',
              title: 'Sprawności motorowodne',
              familyData: [

                    SprawFamilyData(
                        id: 'mechanik',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Mechanik',
                                  //iconRes: 'spraw_wod_h_mechanik',
                                  level: '1',
                                  tasks: [
                                        'Zna budowę łodzi motorowodnej, budowę silnika dwu i czterosuwowego do 10 KM.',
                                        'Przygotował łódź do wypłynięcia, sklarował po pływaniach.',
                                        'Zawiązał 10 węzłów.',
                                        'Płynął łodzią o napędzie motorowym jako załogant.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Mechanik',
                                  //iconRes: 'spraw_wod_h_mechanik',
                                  level: '2',
                                  tasks: [
                                        'Zna budowę łodzi motorowodnej, budowę silnika dwu i czterosuwowego do 15 KM.',
                                        'Posiada podstawowe wiadomości o pędnikach jachtów motorowych.',
                                        'Przygotował silnik do uruchomienia. Sklarował go po pływaniu.',
                                        'Sprawdzał poziom oleju i stan paliwa w silniku.',
                                        'Prawidłowo zamontował silnik przyczepny na pawęży / pantografie.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Mechanik',
                                  //iconRes: 'spraw_wod_h_mechanik',
                                  level: '3',
                                  tasks: [
                                        'Zna budowę łodzi motorowodnej, budowę silnika dwu i czterosuwowego do 50 KM, oraz instalacji chłodzenia i paliwowej.',
                                        'Potrafi omówić każdy suw silnika czterosuwowego.',
                                        'Przygotował łódź do wypłynięcia, zakładał i zdejmował silnik przyczepny, sklarował po pływaniach.',
                                        'Konserwował silnik, sprawdzał poziom oleju, uzupełniał olej.',
                                        'Brał udział w tankowaniu paliwa do silnika czterosuwowego i dwusuwowego.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Mechanik',
                                  //iconRes: 'spraw_wod_h_mechanik',
                                  level: '4',
                                  tasks: [
                                        'Posiada wiedzę z zakresu eksploatacji i budowy instalacji i urządzeń.',
                                        'Ocenił stan techniczny urządzeń.',
                                        'Zna budowę silnika stacjonarnego.',
                                        'Potrafi samodzielnie wymienić filtr paliwa i oleju w silniku stacjonarnym.',
                                        'Prawidłowo uruchomił i zatrzymał silnik.',
                                        'Dokonał drobnych zabiegów regulacyjnych.',
                                        'Kontrolował i ocenił pracę silnika.',
                                        'Stosował zasady prawidłowej eksploatacji akumulatorów.',
                                        'Stosował zasady BHP przy obsłudze napędów.',
                                        'Przygotował łódź do wypłynięcia, po pływaniach konserwował silnik.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: 'szyper_motorowodny',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Szyper motorowodny',
                                  //iconRes: 'spraw_wod_h_szyper_motorowodny',
                                  level: '1',
                                  tasks: [
                                        'Prawidłowo uruchomił i odstawił silnik do 10 KM.',
                                        'Wykonał manewr podejścia i odejścia do kei, do boi, na silniku.',
                                        'Asystował w akcji ratowniczej przy wywróconym jachcie, łodzi, kajaku.',
                                        'Był załogantem na łodzi motorowodnej do 10 KM.',
                                        'Prowadził skuter wodny.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Szyper motorowodny',
                                  //iconRes: 'spraw_wod_h_szyper_motorowodny',
                                  level: '2',
                                  tasks: [
                                        'Uruchomił i odstawił silnik do 15 KM.',
                                        'Prowadził jacht motorowy przy spotkaniu z innym jachtem oraz jego wyprzedzaniem.',
                                        'Wykonał manewry: odejście od nadbrzeża, dojście do nadbrzeża, pływanie kursem prostym i cyrkulacja, alarm "człowiek za burtą".',
                                        'Wykonał manewr kotwiczenia i cumowania w różnych warunkach.',
                                        'Wykonywał prace w charakterze członka załogi.',
                                        'Kierował łodzią motorową i pokonał tor sprawnościowy.',
                                        'Brał udział w rejsie na łodzi motorowodnej.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Szyper motorowodny',
                                  //iconRes: 'spraw_wod_h_szyper_motorowodny',
                                  level: '3',
                                  tasks: [
                                        'Prowadził jacht motorowy przy spotkaniu z innym jachtem oraz jego wyprzedzaniem.',
                                        'Wykonał manewr: odejście od nadbrzeża, dojście do nadbrzeża, pływanie kursem prostym i cyrkulacja, alarm "człowiek za burtą".',
                                        'Wykonał manewr kotwiczenia i cumowania w różnych warunkach.',
                                        'Kierował załogą jachtu motorowego, wydawał komendy i egzekwował ich wykonania we właściwym momencie.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Szyper motorowodny',
                                  //iconRes: 'spraw_wod_h_szyper_motorowodny',
                                  level: '4',
                                  tasks: [
                                        'Pełnił funkcję osoby odpowiedzialnej za maszynownię i instalacje jachtowe w czasie rejsu morskiego lub śródlądowego.',
                                        'Sterował jachtem wyposażonym w napęd motorowy za pomocą kierownicy lub koła sterowego.',
                                        'Manewrował jachtem motorowym o długości większej niż 8 metrów, wykonał manewry podejścia i odejścia od kei, cyrkulacji, człowiek za burtą.',
                                        'Odbył dwa rejsy po wodach morskich w łącznym czasie co najmniej 200 godzin żeglugi.',
                                  ])
                        ]
                    )

              ]),

          SprawGroupData(
              id: 'spraw_kajak',
              title: 'Sprawności kajakowe',
              familyData: [

                    SprawFamilyData(
                        id: 'kajakarz',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Kajakarz',
                                  //iconRes: 'spraw_wod_h_kajakarz',
                                  level: '1',
                                  tasks: [
                                        'Uczestniczył w co najmniej jednym spływie kajakowym.',
                                        'W czasie spływów zachowuje się bezpiecznie, zawsze używa kamizelki.',
                                        'Wsiadł do kajaka z brzegu i z pomostu lub kei.',
                                        'Nazwał wskazany element kajaka.',
                                        'Prawidłowo wiosłuje wiosłem kajakowym.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Kajakarz',
                                  //iconRes: 'spraw_wod_h_kajakarz',
                                  level: '2',
                                  tasks: [
                                        'Uczestniczył w co najmniej 3 spływach kajakowych.',
                                        'Wiosłuje na wprost i wstecz oraz potrafi zawrócić kajakiem.',
                                        'Czyta locję rzeki.',
                                        'Poprawnie spakował się na spływ i wymienił elementy ekwipunku na spływ jednodniowy.',
                                        'Wszedł do kajaka z wody płytkiej.',
                                        'Uczestniczył w załadunku i wyładunku kajaków.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Kajakarz',
                                  //iconRes: 'spraw_wod_h_kajakarz',
                                  level: '3',
                                  tasks: [
                                        'Uczestniczył w co najmniej 5 spływach kajakowych w tym przynajmniej raz z noclegiem.',
                                        'Potrafi piórkować.',
                                        'W czasie wiosłowania wykorzystał kontrę sterującą.',
                                        'Podał rzutkę ratowniczą z kajaka.',
                                        'Brał udział w pozorowanej wywrotce kajaka.',
                                        'Zna zasady rozłożenia ładunku w kajaku na spływ wielodniowy.',
                                        'Kompletował sprzęt ratowniczy na spływ.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Kajakarz',
                                  //iconRes: 'spraw_wod_h_kajakarz',
                                  level: '4',
                                  tasks: [
                                        'Uczestniczył w co najmniej 10 spływach kajakowych na różnych akwenach w tym co najmniej w 2 wielodniowych.',
                                        'Wie co to jest kabina i zna zasady jej wykonania.',
                                        'Potrafi pomóc wywróconemu kajakowi, holował kajakarza na dziobie swojego kajaka.',
                                        'Pełnił funkcję osoby zamykającej spływ lub prowadzącej.',
                                        'Wziął udział w spływie w charakterze obsługi spływu.',
                                        'Potrafi sterować kajakiem tak aby pływać bezpiecznie.',
                                        'Napisał plan spływu. Zrobił to w oparciu o przepisy państwowe jak i związkowe.',
                                  ])
                        ]
                    )

              ]),

          SprawGroupData(
              id: 'spraw_kajak_wioslar',
              title: 'Sprawności kajakowe - wioślarskie',
              familyData: [

                    SprawFamilyData(
                        id: 'znawca_wodny',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Znawca wodny',
                                  //iconRes: 'spraw_wod_h_zwiadowca_wodny',
                                  level: '1',
                                  tasks: [
                                        'Brał udział w zwiadzie jeziora lub stawu (wody stojącej). Narysował szkic zbiornika, zaznaczył linię brzegową, charakterystyczne punkty i miejsca do lądowania.',
                                        'Rozpoznał pospolite okazy flory i fauny wodnej (np. trzcina, tatarak, moczarka kanadyjska, kaczka krzyżówka, rybitwa).',
                                        'Rozpoznał na ilustracji lub w terenie zaporę, śluzę, jaz i opisał do czego służą.',
                                        'Scharakteryzował różnice między kanałem a rzeką. Przedstawił przykład kanału i rzeki.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Znawca wodny',
                                  //iconRes: 'spraw_wod_h_zwiadowca_wodny',
                                  level: '2',
                                  tasks: [
                                        'Wie jak wyglądają i do czego służą: faszyna, opaska, ostroga, jaz.',
                                        'Narysował z pamięci mapę konturową Polski i naniósł na nią najważniejsze rzeki, kanały, jeziora, zalewy, porty śródlądowe i morskie.',
                                        'Przedstawił definicje dorzecza, działu wodnego, zlewiska. Podał kilka przykładów rzek Polski z przyporządkowaniem do odpowiednich dorzeczy.',
                                        'Rozpoznał 3 chronione gatunki roślin wodnych np. grążel żółty, grzybienie białe, kosaciec syberyjski.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Znawca wodny',
                                  //iconRes: 'spraw_wod_h_zwiadowca_wodny',
                                  level: '3',
                                  tasks: [
                                        'Przeprowadził zwiad rzeki na długości 100m oceniając napotkane trudności i przedstawiając bezpieczne sposoby ich pokonania.',
                                        'Przedstawił na schemacie lub modelu budowę rzeki.',
                                        'Poprawnie rozpoznał zjawiska zachodzące na powierzchni rzeki (bystrze, mielizna...).',
                                        'Przedstawił zasadę działania śluzy oraz zasady obowiązujące podczas śluzowania.',
                                        'Scharakteryzował skalę trudności rzek.',
                                        'Scharakteryzował rzeki, jeziora, zbiorniki wodne z terenu swojego powiatu pod kątem walorów turystycznych.',
                                        'Wyposażył skrzynkę bosmańską na spływ.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Znawca wodny',
                                  //iconRes: 'spraw_wod_h_zwiadowca_wodny',
                                  level: '4',
                                  tasks: [
                                        'Przedstawił zasady organizacji spływu i przepisy obowiązujące podczas spływu.',
                                        'Opracował trasę spływu uwzględniając wiek i umiejętności uczestników.',
                                        'Wytłumaczył pojęcia: zlewnia, zlewisko, dorzecze, dział wodny, ciek wodny, rzeka uregulowana/skanalizowana, rzeka spławna/żeglowna, spadek/spad rzeki, rzeka stała/okresowa/epizodyczna, rzeka wodospadowa/górska/nizinna, melioracja, irygacja, retencja, eutrofizacja.',
                                        'Scharakteryzował szlaki wodne swojego województwa pod względem stopnia trudności, klasy czystości oraz walorów turystycznych.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: 'wiking',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Wiking',
                                  //iconRes: 'spraw_wod_h_wiking',
                                  level: '1',
                                  tasks: [
                                        'Wziął udział w przynajmniej kilkugodzinnej wycieczce wodnej jako wioślarz na kajaku, kanadyjce lub czółnie (na przykład wzdłuż brzegu jeziora albo na łatwej rzece).',
                                        'Brał udział w regatach na kandyjce lub łodzi wiosłowej.',
                                        'Zamieniał się miejscem ze sternikiem nie wychodząc z łodzi.',
                                        'Bezpiecznie przechodził z łódki do łódki na wodzie.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Wiking',
                                  //iconRes: 'spraw_wod_h_wiking',
                                  level: '2',
                                  tasks: [
                                        'Wziął udział w kilkudniowym spływie jako sternik łodzi wiosłowej lub kanadyki na rzece o niskim stopniu trudności.',
                                        'Uczestniczył w wywrotkach kanadyjek. Przygotował wywróconą łódź do pływania.',
                                        'Wsiadał do kanadyjki na płytkiej i głębokiej wodzie.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Wiking',
                                  //iconRes: 'spraw_wod_h_wiking',
                                  level: '3',
                                  tasks: [
                                        'Wziął udział w trwającym co najmniej tydzień spływie rzecznym na rzece o średnim stopniu trudności z co najmniej jedną przenoską.',
                                        'Zarządzał załogą podczas przenoski na spływie.',
                                        'Dowodził czółnem na rzece.',
                                        'Zorganizował biwak dla zastępu na spływie pamiętając o poprawnym rozbicu namiotu, zabezpieczeniu sprzętu kuchennego i żywności, klarowaniu i zabezpieczeniu łodzi.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Wiking',
                                  //iconRes: 'spraw_wod_h_wiking',
                                  level: '4',
                                  tasks: [
                                        'Dowodził patrolem podczas spływu. Przygotował niezbędne dokumenty, zatwierdził spływ w komendzie hufca.',
                                        'Wziął udział w spływie rzeką o charakterze górskim.',
                                        'Zorganizował regaty wioślarskie dla drużyny.',
                                  ])
                        ]
                    )

              ]
          ),

          SprawGroupData(
              id: 'spraw_wioslar',
              title: 'Sprawności wioślarskie',
              familyData: [

                    SprawFamilyData(
                        id: 'oryl',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Oryl',
                                  //iconRes: 'spraw_wod_h_oryl',
                                  level: '1',
                                  tasks: [
                                        'Poprawnie wiosłował pagajem na czółnie lub kanadyjce lub wiosłem na kajaku i odpowiednio reagował na komendy sternika.',
                                        'Wsiadał i wysiadał z lub do kanadyjki lub kajaka z brzegu i pomostu.',
                                        'Odbijał i dobijał do brzegu oraz podawał cumę na wodzie stojącej.',
                                        'Wraz z zastępem zbudował tratwę z materiałów, które są pod ręką. Wprawił tratwę w ruch i pokonał na tratwie co najmniej 50m.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Oryl',
                                  //iconRes: 'spraw_wod_h_oryl',
                                  level: '2',
                                  tasks: [
                                        'Pokonał tor slalomowy na wodzie stojącej płynąc jako sternik kajaka lub kanadyjki.',
                                        'Odbijał i dobijał do brzegu w wybranym miejscu na rzece.',
                                        'Poprawnie wydawał wioślarzowi komendy na wiosła oraz podczas odchodzenia i podchodzenia do kei).',
                                        'Poprawnie wiosłował dwoma wiosłami w dulkach (na bączku lub wędkarskiej lub szalupie ratowniczej).',
                                        'Przeprawił się przez rzekę lub zatokę jeziora na belce, zabezpieczając ubrania przed zamoknięciem.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Oryl',
                                  //iconRes: 'spraw_wod_h_oryl',
                                  level: '3',
                                  tasks: [
                                        'Wiosłował długim wiosłem w dulce na wydrze, trenerze, DZ lub smoczej łodzi.',
                                        'Pokonał wyznaczoną trasę śrubkując z rufy do przodu i wstecz.',
                                        'Poprawnie piórkował z burty.',
                                        'Wiosłował "na pych" wiosłem pychowym lub żerdzią.',
                                        'Wytłumaczył młodszym i bezbłędnie zademonstrował elementy prowadzenia łodzi spływowej (dowodzenie, służba oka, promowanie, jeleni skok, przejście przez bystrze, przejście przez przeszkodę, przenoska, dobicie do brzegu, zachowanie po wywrotce).',
                                        'Płynął w szyku podczas defilady.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Oryl',
                                  //iconRes: 'spraw_wod_h_oryl',
                                  level: '4',
                                  tasks: [
                                        'Dowodził wioślarzami na szalupie (do wyboru z w/w – dostępnych lokalnie). Poprawnie wydawał komendy wioślarzom i sternikowi (wiosła, wiosła basta, naprzód, prawa naprzód, lewa wstecz) itd.',
                                        'Wiosłował sposobem rybackim "z ręki" jednym wiosłem.',
                                        'Wykonał na łodzi wiosłowej podejście do człowieka za burtą. Podjął człowieka na pokład.',
                                        'Zorganizował naukę wiosłowania pagajem z burty, jednym i dwoma wiosłami w dulkach, piórkowania, śrubkowania, wiosłowania na pych.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: 'bosman_wioslarski',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Bosman wioślarski',
                                  //iconRes: 'spraw_wod_h_bosman_wioslarski',
                                  level: '1',
                                  tasks: [
                                        'Brał udział w wodowaniu łodzi i wyciąganiu jej na brzeg.',
                                        'Klarował łódź przed i po pływaniu.',
                                        'Skompletował wyposażenie łodzi do pływania (odpowiednie wiosła, kamizelki, klarszmata, cuma).',
                                        'Zawiązał węzły: ósemka, ratowniczy, cumowniczy.',
                                        'Poprawnie wskazał nazwy części łodzi wiosłowej (dziób, rufa, prawa i lewa burta, dno, kokpit, bakista, luk).',
                                        'Nazwał osprzęt jachtowy używany na kajaku lub kanadyjce (ucho cumownicze, kipa, knaga).',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Bosman wioślarski',
                                  //iconRes: 'spraw_wod_h_bosman_wioslarski',
                                  level: '2',
                                  tasks: [
                                        'Dowodził zastępem podczas wodowania i wyciągania łodzi.',
                                        'Uczestniczył w zabezpieczeniu sprzętu pływającego na zimę.',
                                        'Dokonał przeglądu pagajów lub wiosłeł. Pod okiem bosmana naprawił zauważone uszkodzenia – szlifował, lakierował.',
                                        'Zbuchtował linę, zakończył linę opaską.',
                                        'Zastosował węzły: ósemkę, sztyk, żeglarski, rybacki, kotwiczny, knagowy, wyblinkę, flagowy, rożkowy i ratowniczy.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Bosman wioślarski',
                                  //iconRes: 'spraw_wod_h_bosman_wioslarski',
                                  level: '3',
                                  tasks: [
                                        'Uczestniczył w naprawach łodzi laminatowych – czyścił, szlifował, malował elementy kadłuba pod nadzorem.',
                                        'Posługiwał się piłami ręcznymi, tarnikiem, pilnikiem, dłutem, heblem, wiertarką, szlifierką kątową i oscylacyjną podczas zbiórki bosmańskiej.',
                                        'Podczas prac szkutniczych stosował zasady BHP i odpowiednią odzież ochronną (rękawice, maseczka).',
                                        'Opracował sposób doraźnej naprawy kajaka lub kanadyjki na spływie.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Bosman wioślarski',
                                  //iconRes: 'spraw_wod_h_bosman_wioslarski',
                                  level: '4',
                                  tasks: [
                                        'Samodzielnie dokonał naprawy uszkodzenia łodzi laminatowej – oczyścił uszkodzone miejsce, laminował, szlifował łatę, malował powierzchnię, odpowiednio zadbał o narzędzia.',
                                        'Opracował zasady BHP podczas posługiwania się narzędziami tradycyjnymi i elektrycznymi.',
                                        'Samodzielnie wykonał pagaj lub wiosło.',
                                  ])
                        ]
                    )

              ]
          ),

          SprawGroupData(
              id: 'spraw_ratown',
              title: 'Sprawności ratownicze',
              familyData: [

                    SprawFamilyData(
                        id: 'ratownik_wodny',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Ratownik wodny',
                                  //iconRes: 'spraw_wod_h_ratownik_wodny',
                                  level: '1',
                                  tasks: [
                                        'Wie czym się różni kamizelka asekuracyjna od ratunkowej.',
                                        'Założył kamizelkę asekuracyjną bądź ratunkową.',
                                        'Przepłynął 200 metrów dowolnym stylem.',
                                        'Zanurkował na głębokość dwóch metrów.',
                                        'Utrzymał się na powierzchni wody w czasie 1 minuty, używając tylko nóg.',
                                        'Pełnił funkcję sanitariusza na wycieczce bądź rejsie.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Ratownik wodny',
                                  //iconRes: 'spraw_wod_h_ratownik_wodny',
                                  level: '2',
                                  tasks: [
                                        'W czasie zajęć na wodzie zawsze używa środków asekuracyjnych.',
                                        'Sprawdza poprawność założenia środków asekuracyjnych u swoich kolegów z zastępu.',
                                        'Wie jakimi kolorami flag oznaczane są kąpieliska w Polsce.',
                                        'Przepłynął dowolnym stylem dystans 800 metrów, w tym przynajmniej 200 na grzbiecie.',
                                        'Wykonał skok do wody z wysokości 1 metra.',
                                        'Przepłynął pod wodą 15 metrów.',
                                        'Zanurkował na głębokość 3 metrów.',
                                        'Prawidłowo podał koło ratunkowe.',
                                        'Założył kamizelkę ratunkową w wodzie.',
                                        'Przepłynął 25 metrów w ubraniu.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Ratownik wodny',
                                  //iconRes: 'spraw_wod_h_ratownik_wodny',
                                  level: '3',
                                  tasks: [
                                        'Potrafi skoczyć do wody sposobem ratowniczym.',
                                        'Przepłynął dystans 50 metrów kraulem ratowniczym i 50 metrów żabką ratowniczą.',
                                        'Przepłynął dystans 200 metrów dowolnym sposobem w czasie poniżej 5 minut.',
                                        'Potrafi holować tonącego na dystansie 15 metrów.',
                                        'Przepłynął pod wodą na głębokości 2 metrów dystans 10 metrów.',
                                        'Potrafi ułożyć na desce ratowniczej i zabezpieczyć poszkodowanego z podejrzeniem uszkodzenia kręgosłupa.',
                                        'Potrafi rzucić rzutka ratowniczą na odległość 15 metrów.',
                                        'Potrafi zawiązać węzeł ratowniczy w wodzie.',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Ratownik wodny',
                                  //iconRes: 'spraw_wod_h_ratownik_wodny',
                                  level: '4',
                                  tasks: [
                                        'Odpalił pławkę dymną, flarę ratowniczą lub wystrzelił rakietę spadochronową.',
                                        'Potrafi przepłynąć 400m dowolnym sposobem w czasie poniżej 8 min.',
                                        'Potrafi przepłynąć 25m pod lustrem wody.',
                                        'Potrafi przepłynąć w czasie niższym niż 2:40 min ratowniczą łodzią wiosłową lub kajakiem za pomocą dwóch wioseł dystansu 75 m w linii prostej do boi (pławy]), dopłynąć do niej rufą oraz wrócić do miejsca startu.',
                                        'Brał udział w symulowanej akcji ratowniczej polegającej na przepłynięciu dystansu co najmniej 20 m, wydobyciu manekina położonego na dnie i na holowaniu go w pasie ratowniczym do brzegu na dystansie 20 m.',
                                        'Holował osobę udającą tonącego na dystansie 150m, z zastosowaniem trzech sposobów holowania.',
                                        'Potrafi wyciągnąć osobę symulującą tonącego na brzeg i ułożyć go w pozycji bezpiecznej.',
                                        'Potrafi zastosować przynajmniej trzy rodzaje środków do ratownictwa pośredniego (np. koło ratunkowe, węgorz, boja SP itp).',
                                  ])
                        ]
                    )

              ]
          ),

          SprawGroupData(
              id: 'spraw_nurk',
              title: 'Sprawności nurkowe',
              familyData: [

                    SprawFamilyData(
                        id: 'foka',
                        sprawData: [
                              SprawData(
                                  id: '1',
                                  title: 'Foka',
                                  //iconRes: 'spraw_wod_h_foka',
                                  level: '1',
                                  tasks: [
                                        'Przepłynął prawidłowo w płetwach i w masce dystans 25 metrów, oddychając przez fajkę.',
                                        'Potrafi zanurkować na głębokość 2 metrów i wydobyć przedmiot z dna kąpieliska lub basenu.',
                                        'Wytrzyma pod wodą bez oddechu przez 30 sekund.',
                                        'Wie jak wygląda i co oznacza flaga A MKS oraz jak wygląda flaga nurkowa.',
                                  ]),
                              SprawData(
                                  id: '2',
                                  title: 'Foka',
                                  //iconRes: 'spraw_wod_h_foka',
                                  level: '2',
                                  tasks: [
                                        'Skompletował swoje wyposażenie ABC (płetwy, maska, fajka).',
                                        'Potrafi nurkować w ABC, brał udział w wyławianiu zagubionych przedmiotów lub lustracji dna np. przystani.',
                                        'Potrafi kontrolować swoje ciało pod wodą, potrafi zrobić korek.',
                                        'Zna podstawowe znaki nurkowe stosowane do komunikacji pod wodą.',
                                        'Potrafi założyć maskę pod wodą i wydmuchać z niej wodę.',
                                        'Przepłynął w płetwach dystans 50 metrów oddychając przez fajkę.',
                                  ]),
                              SprawData(
                                  id: '3',
                                  title: 'Foka',
                                  //iconRes: 'spraw_wod_h_foka',
                                  level: '3',
                                  tasks: [
                                        'Zdobył podstawowy stopień płetwonurka (OWD) w uznanej federacji nurkowej (PADI, PSAI, SSI, SDI, NAUI, CMAS).',
                                  ]),
                              SprawData(
                                  id: '4',
                                  title: 'Foka',
                                  //iconRes: 'spraw_wod_h_foka',
                                  level: '4',
                                  tasks: [
                                        'Zdobył stopień zaawansowanego płetwonurka (AOWD) w uznanej federacji nurkowej (PADI, PSAI, SSI, SDI, NAUI, CMAS).',
                                  ])
                        ]
                    )

              ]),

    ]
).build();