import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';

//     -> zmienić na spację
// /am -> (-am)
// /łam -> (-am)
// /wzięłam -> (wzięłam)
// /powinnam -> (powinnam)
// /podjęłam -> (podjęłam)
// /poszłam -> (poszłam)
// drużynowemu/drużynowej -> drużynowemu
// drużynowy/drużynowa -> drużynowy
// drużynowym/drużynową -> drużynowym
// kolegom i koleżankom -> wywalić "koleżankom".
// harcerzami i harcerkami -> wywalić "harcerkami".


SprawBook sprawBookZHPHarcSim2022 = SprawBookData(
    id: SprawBookData.ZHP_HARC_SIM_2022_ID,
    title: 'Sprawności harcerskie ZHP',
    source: '',
    color: SprawBookData.SPRAW_BOOK_ZHP_HARC_SIM_2022_COLOR,
    icon: SprawBookData.SPRAW_BOOK_ZHP_HARC_SIM_2022_ICON,
    male: true,
    female: true,
    iconPathWithFamilyId: false,
    iconPathWithLevel: false,
    iconBlackAndWightOnly: false,
    groupData: [

          SprawGroupData(
              id: 'wyrobienie_harcerskie',
              title: 'Wyrobienie harcerskie',
              familyData: [
                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'wyga',
                                  title: 'Wyga',
                                  level: '1',
                                  comment: 'Przygotowuje proste urządzenie obozowe. Rozpala ogniska i przygotowuje na nich proste ciepłe posiłki w terenie. Bierze udział w rozstawianiu obozowiska. Wyznacza kierunki świata.',
                                  tasks: [
                                        'Wziąłem(wzięłam) udział w obozie lub biwaku pod namiotami. Poznałem(-am) zasady bezpieczeństwa i przestrzegałem(-am) ich. Pozostawiłem(-am) po sobie porządek.',
                                        'Wyznaczyłem(-am) strony świata na dwa sposoby. Poprowadziłem(-am) zastęp podczas wędrówki',
                                        'Samodzielnie rozpaliłem(-am) ognisko. Przygotowałem(-am) na nim prosty posiłek (np. upiekłem(-am) podpłomyki, zagotowałem(-am) wodę na makaron).',
                                        'Znam i zastosowałem(-am) w różnych sytuacjach co najmniej pięć węzłów',
                                  ]),
                              SprawData(
                                  id: 'wyga',
                                  title: 'Wyga',
                                  level: '2',
                                  comment: 'Przygotowuje złożone urządzenie obozowe. Umiejętnie buduje szałasy w bezpiecznym miejscu. Przygotowuje złożone posiłki na ognisku',
                                  tasks: [
                                        'Rozpaliłem(-am) ognisko na łonie natury w bezpiecznym miejscu, z zachowaniem zasad bezpieczeństwa, z użyciem wyłącznie naturalnych materiałów (nie dotyczy zapałek); po zgaszeniu doprowadziłem(-am) miejsce do pierwotnego stanu. Uczestniczyłem(-am) w przygotowaniu złożonego posiłku na ognisku.',
                                        'Wraz z zastępem rozstawiłem(-am) namiot i zbudowałem(-am) przydatne urządzenie obozowe (np. wyposażenie namiotu), przez cały obóz utrzymałem(-am) porządek w swoich rzeczach.',
                                        'Zbudowałem(-am) urządzenie obozowe z wykorzystaniem znanych mi węzłów (np. wyplotłem(-am) pryczę lub półkę, zbudowałem(-am) urządzenie obozowe bez użycia gwoździ).',
                                        'Wziąłem(wzięłam) udział w budowie jednego z urządzeń obozowych wspólnego użytku (np. latryny, bramy, stanowiska na sprzęt ppoż.).',
                                        'Pełniłem(-am) służbę wartowniczą na obozie lub biwaku.',
                                  ]),
                              SprawData(
                                  id: 'wyga',
                                  title: 'Wyga',
                                  level: '3',
                                  comment: 'Potrafi zapewniać sobie w terenie komfortowy i bezpieczny sposób bytowania (spanie, jedzenie, przechowywanie rzeczy, załatwianie potrzeb fizjologicznych, mycie). Potrafi zorganizować bytowanie grupy w terenie (służby kuchenne, zapewnienie bezpieczeństwa). Kieruje budową podstawowych urządzeń obozowych.',
                                  tasks: [
                                        'Wziąłem(wzięłam) udział w kilkudniowym rajdzie lub wyprawie z nocowaniem na łonie przyrody, podczas którego minimalizowałem(-am) swój wpływ na środowisko (odpowiednio gospodarując wodą i odpadami, przygotowując nocleg, zabezpieczając ognisko).',
                                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                            '\n\n– Kierowałem(-am) służbą kuchenną lub zastępem służbowym.'
                                            '\n\n– Przygotowałem(-am) młodszych harcerzy do pełnienia wart i dowodziłem(-am) zastępem wartowniczym.',
                                        'Potrafię używać i dbam o sprzęt drużyny lub szczepu. Brałem(-am) udział w jego konserwacji.',
                                        'Samodzielnie ułożyłem(-am) 3 rodzaje ognisk i rozpaliłem(-am) je.',
                                        'Zapoznałem(-am) młodszych harcerzy z zasadami pracy z narzędziami pionierskimi, pokierowałem(-am) budową przez zastęp prostego urządzenia obozowego.',
                                        'Pełniłem(-am) funkcję oboźnego, kwatermistrza lub zaopatrzeniowca na wyjeździe drużyny',
                                  ]),
                              SprawData(
                                  id: 'wyga',
                                  title: 'Wyga',
                                  level: '4',
                                  comment: 'Zapewnia sobie w terenie komfortowy i bezpieczny sposób bytowania. Praktykuje różne formy wędrowania. Bierze aktywny udział w przygotowywaniu obozu swojej drużyny lub środowiska.',
                                  tasks: [
                                        'Zaplanowałem(-am) i zorganizowałem(-am) kilkudniową wędrówkę zgodnie z zasadami Leave No Trace',
                                        'Wziąłem(wzięłam) udział w przygotowaniu obozu, np. tworzeniu preliminarza, przygotowaniu sprzętu, organizacji transportu, zaplanowaniu zakupów żywieniowych. Poznałem(-am) zasady prowadzenia gospodarczej dokumentacji obozu i pod nadzorem kwatermistrza pomogłem(-am) ją prowadzić.',
                                        'Wziąłem(wzięłam) udział w minimum dwudniowej wyprawie w nowej dla mnie formie turystyki (np. obozie wędrownym, rowerowym, rejsie, spływie itp.).'
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
                    //           requirements: requirements,
                    //           notesForLeaders: notesForLeaders,
                    //           tasksAreExamples: true,
                    //           tasks: [
                    //             '',
                    //           ]),
                    //       SprawData(
                    //           id: '',
                    //           title: '',
                    //           level: '2',
                    //           requirements: requirements,
                    //           notesForLeaders: notesForLeaders,
                    //           tasksAreExamples: true,
                    //           tasks: [
                    //             ''
                    //           ]),
                    //       SprawData(
                    //           id: '',
                    //           title: '',
                    //           level: '3',
                    //           requirements: requirements,
                    //           notesForLeaders: notesForLeaders,
                    //           tasksAreExamples: true,
                    //           tasks: [
                    //             '',
                    //           ]),
                    //     ]
                    // ),
              ]),

          SprawGroupData(
              id: 'zdrowie',
              title: 'Zdrowie',
              familyData: [

                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'ratownik',
                                  title: 'Ratownik',
                                  level: '1',
                                  comment: 'Podczas rzeczywistego wydarzenia lub symulacji wykazuje się umiejętnościami udzielania pierwszej pomocy w sytuacjach, które mogą przydarzyć się w domu. Zna numery alarmowe, wie, kiedy i w jaki sposób z nich korzystać.',
                                  tasks: [
                                        'Udzieliłem(-am) pomocy w następujących sytuacjach:'
                                            '\n\n– Opatrzyłem(-am) ranę, zabezpieczyłem(-am) oparzenie.'
                                            '\n\n– Zareagowałem(-am) właściwie w sytuacji omdlenia.'
                                            '\n\n– Zadbałem(-am) o bezpieczeństwo osoby nieprzytomnej (oceniłem(-am) przytomność, udrożniłem(-am) drogi oddechowe i sprawdziłem(-am) oddech u poszkodowanego nieprzytomnego).',
                                        'Znam numery alarmowe, skorzystałem(-am) z nich w sytuacji rzeczywistej lub symulowanej podając dyspozytorowi niezbędne informacje.',
                                        'Unieruchomiłem(-am) rękę w przypadku urazu.',
                                        'Oceniłem(-am) czy mogę bezpiecznie udzielić pierwszej pomocy poszkodowanemu. Bezpiecznie zdjąłem(-am) rękawiczki.'
                                  ]),
                              SprawData(
                                  id: 'ratownik',
                                  title: 'Ratownik',
                                  level: '2',
                                  comment: 'W prawdziwej sytuacji lub podczas symulacji udziela pierwszej pomocy w najczęściej spotykanych urazach w domu, szkole i na obozie.',
                                  tasks: [
                                        'Skompletowałem(-am) apteczkę osobistą.',
                                        'Ułożyłem(-am) poszkodowanego w pozycji bezpiecznej.',
                                        'Wykonałem(-am) prawidłowo uciśnięcia klatki piersiowej u osoby dorosłej (podczas RKO).',
                                        'Udzieliłem(-am) pierwszej pomocy w przypadku ukąszenia przez owady.',
                                        'Prawidłowo postąpiłem(-am) przy krwotokach:'
                                            '\n\n- Udzieliłem(-am) pierwszej pomocy w przypadku krwotoku z nosa.'
                                            '\n\n- Założyłem(-am) opatrunek uciskowy w przypadku krwotoku z rany.'
                                            '\n\n- Udzieliłem(-am) pierwszej pomocy w przypadku złamania otwartego.',
                                        'Zabezpieczyłem(-am) poszkodowanego przed utratą ciepła (zastosowałem(-am) termoizolację).'
                                  ]),
                              SprawData(
                                  id: 'ratownik',
                                  title: 'Ratownik',
                                  level: '3',
                                  comment: 'W prawdziwej sytuacji lub podczas symulacji rozpoznaje najczęstsze stany zagrożenia życia i udziela pierwszej pomocy, dbając o bezpieczeństwo swoje i świadków zdarzenia.',
                                  tasks: [
                                        'Przeprowadziłem(-am) resuscytację krążeniowo-oddechową na fantomie osoby dorosłej.',
                                        'Rozpoznałem(-am) objawy udaru słonecznego i udzieliłem(-am) poszkodowanemu pierwszej pomocy.',
                                        'Rozpoznałem(-am) sytuacje, w których może dojść do urazu kręgosłupa, prawidłowo postąpiłem(-am) w przypadku podejrzenia urazu kręgosłupa u poszkodowanego.',
                                        'Rozpoznałem(-am) objawy zawału serca i udaru i udzieliłem(-am) pierwszej pomocy poszkodowanemu.',
                                        'Udzieliłem(-am) pierwszej pomocy poszkodowanemu z napadem duszności i w przypadku zadławienia u osoby dorosłej.',
                                        'Pełniłem(-am) służbę samarytańską, np. na wycieczce, biwaku, rajdzie. Dokonałem(-am) przeglądu apteczki drużyny i uzupełniłem(-am) ją. Opiekowałem(-am) się nią przez określony czas.',
                                        'Udzieliłem(-am) pierwszej pomocy poszkodowanemu podczas napadu drgawek.',
                                        'Współprowadziłem(-am) zbiórkę na temat pierwszej pomocy dla innych harcerzy.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '2',
                        sprawData: [
                              SprawData(
                                  id: 'lider_zdrowia',
                                  title: 'Lider Zdrowia',
                                  level: '1',
                                  comment: 'Umie ubrać się stosownie do pogody. Stosuje zasady zdrowego odżywiania się. Bierze udział w krótkich formach aktywnego wypoczynku na łonie natury. Regularnie uprawia wybrane dziedziny aktywności fizycznej.',
                                  tasks: [
                                        'Przez minimum 2 tygodnie samodzielnie przygotowywałem(-am) sobie drugie śniadanie do szkoły zgodnie z zasadami zbilansowanej diety.',
                                        'Wziąłem(wzięłam) udział w wycieczce pieszej/rowerowej/kajakowej, trwającej około 4–5 godzin. Samodzielnie spakowałem(-am) plecak odpowiednio do potrzeb i pogody (uwzględniając zdrowe jedzenie, wodę, okrycie na słońce i deszcz, krem z filtrem itd.).',
                                        'Przez okres próby ćwiczyłem(-am) wybrany rodzaj sportu lub dziedzinę sprawności fizycznej (np. szybkość, skoczność, celność, utrzymywanie równowagi). Zapisałem(-am) wynik osiągany na początku (np. czas na 100 m) i poprawiłem(-am) go na koniec próby.',
                                        'Zademonstrowałem(-am) umiejętność jazdy na 3 różnych sprzętach (np. rower, hulajnoga, wrotki, rolki, łyżwy, sanki, narty).'
                                  ]),
                              SprawData(
                                  id: 'lider_zdrowia',
                                  title: 'Lider Zdrowia',
                                  level: '2',
                                  comment: 'Przestrzega zaleceń zdrowego odżywiania się. Bierze udział w całodziennych formach aktywnego wypoczynku na łonie natury. Regularnie ćwiczy wybraną dziedzinę sprawności fizycznej, poprawiając swoje wyniki. Bierze udział w różnych formach zespołowej aktywności fizycznej.',
                                  tasks: [
                                        'Wraz z rodzicami ułożyłem(-am) dla siebie tygodniowy jadłospis zgodnie z zasadami zbilansowanej diety. Pilnowałem(-am) jego przestrzegania (np. nie dojadając między posiłkami).',
                                        'Wziąłem(wzięłam) udział w całodziennej wycieczce pieszej,rowerowej lub kajakowej. Dowiedziałem(-am) się jak i przygotowałem(-am) na niej obiad niewymagający gotowania.',
                                        'Przez okres próby ćwiczyłem(-am) wybrany sport lub dziedzinę sprawności fizycznej (np. szybkość, skoczność, celność, utrzymywanie równowagi). Wziąłem(wzięłam) udział w zawodach sportowych w konkurencji wymagającej posługiwania się ćwiczoną sprawnością (np. wyścigi, skok w dal, rzucanie do celu, wyścig z jajkiem) i zająłem(zajęłam) czołowe miejsce lub znacząco poprawiłem(-am) swój wynik z początku próby.',
                                        'Wziąłem(wzięłam) udział w meczu rekreacyjnym trzech różnych sportów drużynowych (np. piłki nożnej, piłki siatkowej, piłki ręcznej, dwóch ogni, hokeja na trawie).',
                                        'Znam i stosuję (wprowadzam w swoje życie) zasady zdrowego odżywiania się lub zdrowe nawyki żywieniowe. Przez okres min. 2 miesięcy dbałem(-am) o prawidłowe nawodnienie organizmu, pijąc min. 2 litry wody dziennie, i unikałem(-am) słodkich przekąsek.'
                                  ]),
                              SprawData(
                                  id: 'lider_zdrowia',
                                  title: 'Lider Zdrowia',
                                  level: '3',
                                  comment: 'Wprowadził(-a) do swojego życia na stałe zasady zdrowego odżywania się. Zna znaczenie higieny snu. Regularnie monitoruje stan swojego zdrowia. Ma ulubioną formę regularnej aktywności fizycznej.',
                                  tasks: [
                                        'Przez trzy miesiące spałem(-am) minimum po siedem godzin dziennie, dbając o to, aby przed snem się wyciszyć. Dowiedziałem(-am) się, dlaczego używanie urządzeń z wyświetlaczem przed snem jest niekorzystne dla jakości snu, i nie korzystałem(-am) z nich na min. godzinę przed snem.',
                                        'Po konsultacji z lekarzem wykonałem(-am) badanie profilaktyczne, wynikające z mojego stylu życia (np. badanie pod kątem HCV czy HBV, jeśli chodzę do kosmetyczki lub mam nowy tatuaż, badanie poziomu glukozy lub hormonów tarczycy, jeśli często jestem zmęczony bez wyraźnego powodu).',
                                        'Przez okres trwania próby minimum raz w tygodniu uprawiałem(-am) wybraną aktywność fizyczną.',
                                        'W porozumieniu z rodzicami i ew. dietetykiem dobrałem(-am) właściwy dla siebie tryb i sposób żywienia, monitorując uważnie reakcje swojego organizmu na wprowadzane nowości.'
                                  ]),
                              SprawData(
                                  id: 'lider_zdrowia',
                                  title: 'Lider Zdrowia',
                                  level: '4',
                                  comment: '* Umiejętnie stosuje właściwą dietę w zależności od rodzaju wysiłku fizycznego. Przestrzega zasady higieny snu. Posiada nawyk regularnej aktywności fizycznej.',
                                  tasks: [
                                        'Zaplanowałem(-am) i zorganizowałem(-am) długotrwały wysiłek fizyczny o charakterze wyczynu i dobrałem(-am) dostosowaną do niego dietę. W miarę możliwości uzyskałem(-am) dla swojego pomysłu akceptację profesjonalisty.',
                                        'Dowiedziałem(-am) się, jak ważny jest dobry sen dla zdrowia człowieka. Poznałem(-am) zalecenia dla nastolatków związane z długością i jakością snu. Na podstawie raportów z aplikacji mobilnych dokonałem(-am) przeglądu jakości swojego snu i wprowadziłem(-am) w swoim życiu zmiany pozwalające na uzyskanie większej liczby godzin snu głębokiego.',
                                        'Wziąłem(wzięłam) udział w profilaktycznej wizycie u specjalisty (np. u fizjoterapeuty, ginekologa) lub samodzielnie wykonałem(-am) 3 ekokosmetyki.',
                                        'Przez 3 miesiące uprawiałem(-am) raz w tygodniu wybraną formę aktywności fizycznej.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '3',
                        sprawData: [
                              SprawData(
                                  id: 'pomocna_dlon',
                                  title: 'Pomocna Dłoń',
                                  level: '1',
                                  comment: 'Bezpiecznie opiekuje się dzieckiem pod nieobecność dorosłych. Wykonuje proste czynności związane z opieką nad osobą starszą lub chorą.',
                                  tasks: [
                                        'Opiekowałem(-am) się młodszym rodzeństwem lub innym dzieckiem przez kilka godzin (np. pod nieobecność rodziców lub gdy byli bardzo zajęci), umiejętnie je zabawiając i zapewniając bezpieczeństwo.',
                                        'Wiem, jak ocenić temperaturę człowieka. Regularnie mierzyłem(-am) temperaturę chorego, który znajdował się pod moją opieką co najmniej przez trzy dni.',
                                        'Prawidłowo zaparzyłem(-am) herbatę ziołową osobie starszej lub chorej.'
                                  ]),
                              SprawData(
                                  id: 'pomocna_dlon',
                                  title: 'Pomocna Dłoń',
                                  level: '2',
                                  comment: 'Umiejętnie zajmuje się powierzonymi jego(jej) opiece osobami młodszymi i chorymi. Posiada podstawowe umiejętności pozwalające na aktywne włączenie się w życie rodziny.',
                                  tasks: [
                                        'Potrafię opiekować się małym dzieckiem. Pod nadzorem rodziców zadbałem(-am) o powierzone mi dziecko (np. rodzeństwo, dziecko sąsiadów) przez dłuższy okres (np. miesiąc, wakacje):'
                                            '\n\n- przygotowywałem(-am) odpowiednie posiłki,'
                                            '\n\n- zabierałem(-am) na spacer w ubraniu dostosowanym do warunków,'
                                            '\n\n- zapewniałem(-am) bezpieczną zabawę dostosowaną do wieku dziecka,'
                                            '\n\n- jeżeli była taka potrzeba, towarzyszyłem(-am) przy toalecie porannej i wieczornej oraz usypiałem(-am).',
                                        'Dowiedziałem(-am) się, jak odpowiednio zaopiekować się osobą chorą. Opiekowałem(-am) się chorym w domu lub na obozie. Wykonywałem(-am) następujące czynności:'
                                            '\n\n- odpowiednio przygotowałem łóżko osobie chorej na dzień i na noc,'
                                            '\n\n- podawałem(-am) posiłki i lekarstwa według zaleceń lekarza.',
                                        'Pomagałem(-am) rodzicom w organizacji co najmniej jednego dużego rodzinnego wydarzenia. Wykonałem(-am) co najmniej jedno z zadań:'
                                            '\n\n- wykonałem(-am) drobne prace przy okazji remontu, np. mieszkania (malowanie ściany, gipsowanie dziur itp.),'
                                            '\n\n- pomagałem(-am) ułożyć zastawę stołową i przygotować potrawy na uroczystość rodzinną,'
                                            '\n\n- umiejętnie pakowałem i rozpakowywałem różne drobne przedmioty (zastawa kuchenna, bibeloty, elektronika itp.) w czasie przeprowadzki.'
                                  ]),
                              SprawData(
                                  id: 'pomocna_dlon',
                                  title: 'Pomocna Dłoń',
                                  level: '3',
                                  comment: 'Kompetentnie i kompleksowo opiekuje się dziećmi i osobami chorymi',
                                  tasks: [
                                        'Własnoręcznie przygotowałem(-am) niespodziankę dla dziecka (własnoręcznie wykonana zabawka, uszyte lub przerobione ubranko, ulubiony podwieczorek).',
                                        'Opracowałem(-am) krótki wykaz książek i/lub miejsc w Internecie (np. fora, blogi, wideoblogi, kanały YouTube) dotyczących opieki nad dzieckiem. Zapoznałem(-am) z nim osoby zainteresowane tym tematem.',
                                        'Przygotowałem(-am) dietetyczny posiłek odpowiedni do rodzaju choroby osoby, którą się opiekowałem(-am).',
                                        'Wiem, jakie są prawidłowe poziomy ciśnienia krwi i cukru we krwi. Wykonałem(-am) co najmniej jedno zadanie:'
                                            '\n\n- zmierzyłem(-am) osobie chorej lub starszej ciśnienie krwi,'
                                            '\n\n- zmierzyłem(-am) osobie chorej lub starszej poziom cukru we krwi.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '4',
                        sprawData: [
                              SprawData(
                                  id: 'epidemiolog',
                                  title: 'Epidemiolog',
                                  level: '1',
                                  comment: 'Umie w czasie epidemii zadbać o siebie.',
                                  tasks: [
                                        'Wiem, jak się zachowywać w czasie epidemii. Ograniczyłem(-am) do minimum wyjścia z domu i bezpośrednie kontakty z innymi osobami. Zachowałem(-am) kontakt telefoniczny/internetowy z moimi bliskimi, z którymi nie mieszkam (np. dziadkami).',
                                        'Myłem(-am) ręce kilka lub kilkanaście razy dziennie przez 30 sekund. Obowiązkowo myłem(-am) ręce po powrocie do domu i po kontakcie z innymi osobami.',
                                        'Codziennie uczyłem(-am) się, niezależnie od tego, czy otrzymywałem(-am) materiały do nauki (jeżeli nie otrzymałem(-am) materiałów ze szkoły, czytałem(-am) lektury i powtarzałem(-am) sobie wcześniej zrealizowany materiał).',
                                        'Wziąłem(wzięłam) udział w zdalnej zbiórce zastępu.'
                                  ]),
                              SprawData(
                                  id: 'epidemiolog',
                                  title: 'Epidemiolog',
                                  level: '2',
                                  comment: 'Pomaga rodzinie w czasie epidemii, jest aktywny.',
                                  tasks: [
                                        'Dowiedziałem(-am) się, czym jest izolacja społeczna. Zastosowałem(-am) w praktyce jej zasady.',
                                        'W czasie pobytu w domu byłem(-am) aktywny(-a): skończyłem(-am) czytać książkę, posprzątałem(-am) mieszkanie, dokonałem(-am) przeglądu i napraw mojego umundurowania i sprzętu harcerskiego.',
                                        'Regularnie ćwiczyłem(-am), by utrzymać sprawność fizyczną. Dokumentowałem(-am) ćwiczenia i postępy w nich.',
                                        'Codziennie pomagałem(-am) w przyrządzaniu przynajmniej 1 posiłku dla innych domowników z zachowaniem wszystkich zasad higieny.'
                                  ]),
                              SprawData(
                                  id: 'epidemiolog',
                                  title: 'Epidemiolog',
                                  level: '3',
                                  comment: 'Pełni służbę informacyjną w czasie epidemii.',
                                  tasks: [
                                        'Dowiedziałem(-am) się, czym różni się bakteria od wirusa, dlatego wiem, na czym polegają działania prewencyjne. Zastosowałem(-am) się do zaleceń służb sanitarnych.',
                                        'Unikałem(-am) fake newsów - wiedzę czerpałem(-am) z oficjalnych portali. Przekazywałem(-am) sprawdzone informacje do swoich znajomych m. in. za pomocą mediów społecznościowych.',
                                        'Pomogłem(-am) rodzeństwu lub kolegom lub młodszym harcerzom (najlepiej w trybie internetowym) w nauce wybranego przedmiotu.',
                                        'Opracowałem(-am) samodzielnie lub z inną osobą zbiórkę dla zastępu i przeprowadziłem(-am) ją z wykorzystaniem łączy internetowych.'
                                  ]),
                              SprawData(
                                  id: 'epidemiolog',
                                  title: 'Epidemiolog',
                                  level: '4',
                                  comment: 'Pełni służbę na rzecz młodszych harcerzy i na zewnątrz organizacji.',
                                  tasks: [
                                        'Opracowałem(-am) zbiórkę dla drużyny i przeprowadziłem(-am) ją z wykorzystaniem łączy internetowych. Materiały potrzebne do zorganizowania zbiórki udostępniłem(-am) innym wędrownikom/instruktorom.',
                                        'Utrzymywałem(-am) kontakt (internetowy lub telefoniczny) z osobami, z którymi nie powinienem się spotykać osobiście (np. sąsiedzi, dziadkowie). Zorganizowałem(-am) dla nich pomoc w funkcjonowaniu w czasie kwarantanny (np. pomoc w zakupach i załatwianiu innych ważnych spraw).',
                                        'Realizując dewizę wędrowniczą (Wyjdź w świat, zobacz, pomyśl – pomóż, czyli działaj), podjąłem(-am) w miarę swoich możliwości służbę zgodną ze społecznymi potrzebami i zaleceniami służb sanitarnych.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '5',
                        sprawData: [
                              SprawData(
                                  id: 'bezpieczny',
                                  title: 'Bezpieczny',
                                  level: '1',
                                  comment: 'Dba o swoje bezpieczeństwo w domu, w szkole, na drodze, w lesie i w podróży.',
                                  tasks: [
                                        'Wiem, jak niebezpieczne w domu jest wspinanie się na meble, parapety itp. Aby sięgnąć po coś z góry lub umyć okna, używałem(-am) wyłącznie stabilnych taboretów lub domowych drabinek.',
                                        'Dowiedziałem(-am) się, na czym polega zasada ograniczonego zaufania na drodze. Mimo posiadania pierwszeństwa na pasach zawsze sprawdzałem(-am) przed wejściem na nie, czy nie nadjeżdża rozpędzony samochód/rower.',
                                        'Wykonałem(-am) co najmniej jedno zadanie:'
                                            '\n\n- dowiedziałem(-am) się, jak należy zachowywać się w obecności nieznanego psa, jakie zachowania mogą sprowokować jego agresję. Zachowuję bezpieczny dystans wobec obcych zwierząt,'
                                            '\n\n- wziąłem(wzięłam) udział w zajęciach lub porozmawiałem(-am) z rodzicami o tym, jak należy reagować na zaczepki obcych ludzi, ich propozycje i żądania. Ustaliłem(-am) z rodzicami schemat działań w sytuacji zagrożenia i go stosuję.',
                                        'Dowiedziałem(-am) się, na czym polega zagrożenie bąblowicą. W czasie próby myłem(-am) wszystkie owoce zebrane w lesie.',
                                        'W czasie wycieczki starałem(-am) się nie oddalać od grupy. Zawsze w czasie wyjazdu grupowego posiadałem(-am) numer telefonu do zastępowego/drużynowego/kierownika grupy.'
                                  ]),
                              SprawData(
                                  id: 'bezpieczny',
                                  title: 'Bezpieczny',
                                  level: '2',
                                  comment: 'Dba o swoje bezpieczeństwo w domu, w szkole, na drodze, w lesie i w podróży.',
                                  tasks: [
                                        'Nauczyłem(-am) się zabezpieczać dom przed złodziejami i zdarzeniami losowymi. Sporządziłem(-am) listę kontrolną czynności, które należy wykonać przed wyjściem z domu/mieszkania (zamknięcie okien i balkonu, wyłączenie kuchenki gazowej, wyłączenie urządzeń elektrycznych, sprawdzenie kranów z wodą itp.). Regularnie ją stosowałem(-am) przed każdym wyjściem z domu.',
                                        'Wykonałem co najmniej jedno z poniższych zadań:'
                                            '\n\n- poruszając się po drodze poza miastem, zastosowałem(-am) komplet odblasków zapewniający widoczność mojej sylwetki ze wszystkich stron;'
                                            '\n\n- poruszając się rowerem po drodze, zastosowałem(-am) kamizelkę odblaskową i kask rowerowy.',
                                        'Poznałem(-am) zasady bezpieczeństwa na obozie. Wziąłem(wzięłam) udział w rożnego rodzaju alarmach (np. przeciwpożarowym, ewakuacyjnym), sprawnie wykonując polecenia opiekunów.',
                                        'Opracowałem(-am) trasę dotarcia do wyznaczonego punktu, wykorzystując m.in. komunikację publiczną (np. miejską). Sprawdziłem(-am) rozkład jazdy, wybrałem(-am) odpowiednie połączenie i zakupiłem(-am) bilet MPK/PKS/PKP. Zapoznałem(-am) się z podstawowymi zasadami korzystania z komunikacji publicznej (np. kiedy i jak odbijamy bilety, które miejsca w autobusach i tramwajach są przeznaczone dla mnie, dla starszych i chorych, jak używamy rączek i uchwytów podczas podróży na stojąco, do czego służą dzwonki alarmowe i gdzie się znajdują).'
                                  ]),
                              SprawData(
                                  id: 'bezpieczny',
                                  title: 'Bezpieczny',
                                  level: '3',
                                  comment: 'Dba o swoje bezpieczeństwo w domu, w szkole, na drodze, w lesie i w podróży.',
                                  tasks: [
                                        'Sprawdziłem(-am) w mieszkaniu lub domu, gdzie znajdują się zawory: gazu, wody i wyłącznik prądu. Nauczyłem(-am) się je obsługiwać. Dowiedziałem(-am) się, kiedy i w jakich okolicznościach należy je zamknąć.',
                                        'Poznałem(-am) zasady bezpiecznego poruszania się w miejscach publicznych pieszo, na rowerze, rolkach, hulajnodze itp. (zgodnie z tym, z czego korzystam). Zastosowałem(-am) się do tych zasad w czasie mojego codziennego korzystania z chodnika, jezdni, ścieżki rowerowej.',
                                        'Na obozie pomagałem(-am) w przeprowadzeniu dla młodszych instruktażu dotyczącego bezpieczeństwa (np. zapoznając z zasadami posługiwania się ogniem, wartowania, ewakuowania się z obozu). Pomagałem(-am) w przeprowadzeniu alarmów np. przeciwpożarowego, ewakuacyjnego.',
                                        'Dowiedziałem(-am) się, jak rozpoznać kleszcza. Zapoznałem(-am) się z poprawnymi technikami wyciągania kleszczy i prawidłowo usuwałem(-am) te pasożyty. Zaopatrzyłem(-am) się w narzędzia umożliwiające usuwanie kleszczy: pęseta, pętla, kleszczołapki itp.',
                                        'Wybrałem(-am) się na samodzielną wycieczkę do innego miasta lub innej części regionu mojego zamieszkania. Przed wyjazdem skompletowałem(-am) i zabezpieczyłem(-am) przed zgubieniem i kradzieżą dokumenty oraz pieniądze. Sprawdziłem(-am) prognozy pogody i przygotowałem(-am) odpowiedni ubiór na wyjazd. Skorzystałem(-am) z komunikacji publicznej, zakupiłem(-am) odpowiedni bilet (zniżka) na przejazd pociągiem lub autobusem. Podczas przejazdu dostosowałem(-am) się do zasad bezpieczeństwa obowiązujących wszystkich podróżnych.'
                                  ]),
                              SprawData(
                                  id: 'bezpieczny',
                                  title: 'Bezpieczny',
                                  level: '4',
                                  comment: 'Dba o swoje bezpieczeństwo w domu, w szkole, na drodze, w lesie i w podróży. Doświadczeniami dzieli się z młodszymi.',
                                  tasks: [
                                        'Dowiedziałem(-am) się, na czym polega w domu zagrożenie tlenkiem węgla i pożarem. Wykonałem(-am) co najmniej jedno zadanie:'
                                            '\n\n- zainstalowałem(-am) w domu czujnik CO,'
                                            '\n\n- zaopatrzyłem(-am) dom w podręczną gaśnicę dostosowaną do gaszenia drobnych pożarów, które najczęściej występują w mieszkaniach, a których nie należy gasić wodą.',
                                        'Zapoznałem(-am) młodszych z regulaminem lub zasadami poruszania się po drogach. Uwzględniłem(-am) przy tym zagrożenia wynikające z analizy potencjalnych niebezpieczeństw w mojej okolicy jak np. niebezpieczne przejścia przez jezdnię, ulice bez chodników, miejsca na drogach ze słabą widocznością dla kierowcy (zakręty, wzniesienia). Przeprowadziłem(-am) bezpiecznie grupę (np. zastęp, drużynę) po różnych rodzajach dróg/ulic na dystansie kilku kilometrów.',
                                        'Uczestniczyłem(-am) w działaniach profilaktyczno-edukacyjnych dotyczących bezpieczeństwa (np. handlu ludźmi, przemocy w szkole itp.). Przeprowadziłem(-am) dla swojej drużyny/klasy warsztaty dotyczące bezpieczeństwa.',
                                        'Dowiedziałem(-am) się, jakie niebezpieczeństwa grożą osobom poruszającym się po lesie - szczególnie jednoosobowo. Na obozie przeprowadziłem(-am) instruktaż, a następnie nadzorowałem(-am) wyjścia do lasu (np. na sprawność Leśnego człowieka) mniej doświadczonych harcerzy.',
                                        'Dowiedziałem(-am) się, jakie niebezpieczeństwa mogą na mnie czekać w czasie podróży zagranicznej lub podróży po Polsce w odległe miejsce. Wykonałem(-am) następujące zadania:'
                                            '\n\n- ustaliłem(-am) i pozostawiłem(-am) domownikom informacje o tym, dokąd jadę i pod jakim adresem/adresami będę przebywał/a,'
                                            '\n\n- ustaliłem(-am) sposób i częstotliwość kontaktowania się z osobami, które zostały w domu (wszelkie zakłócenia mogą stanowić sygnał alarmowy),'
                                            '\n\n- nie rozstawałem(-am) się ze swoimi dokumentami. Pamiętałem(-am), że mam OBOWIĄZEK mieć je przy sobie i nikt poza mną nie ma prawa ich przetrzymywać.'
                                  ]),
                        ]
                    ),


              ]
          ),

          SprawGroupData(
              id: 'przyrodnicze',
              title: 'Przyrodnicze',
              familyData: [

                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'ekolog',
                                  title: 'Ekolog',
                                  level: '1',
                                  comment: 'Rozumie, że człowiek swoimi decyzjami wpływa na środowisko. Stosuje podstawowe nawyki proekologiczne w sytuacjach domowych. Zachowuje się odpowiednio podczas kilkugodzinnego pobytu na łonie natury.',
                                  tasks: [
                                        'Znam zasady segregacji odpadów w swoim miejscu zamieszkania. Segreguję zgodnie z nimi odpady w domu, szkole i harcówce.',
                                        'Podczas zakupów korzystam wyłącznie z wielorazowych toreb.',
                                        'Przez okres trwania próby raz w tygodniu podejmowałem(-am) przynajmniej półgodzinną aktywność na łonie przyrody (w parku, lesie, na łące itd.), stosując się do zasad właściwego zachowania w terenie (m.in. zostaw to, co znajdziesz, w stanie nienaruszonym, zachowaj ciszę, niech natura ma głos, rozpalaj ogień tylko tam, gdzie jest to dozwolone).',
                                        'Nauczyłem(-am) się dokonywać obserwacji dzikich zwierząt w sposób bezpieczny i nieingerujący w ich życie. Wykazałem(-am) się tymi umiejętnościami podczas wycieczki, rajdu lub biwaku.',
                                  ]),
                              SprawData(
                                  id: 'ekolog',
                                  title: 'Ekolog',
                                  level: '2',
                                  comment: 'Propaguje w swoim otoczeniu świadomość, że człowiek swoimi decyzjami wpływa na środowisko. Stosuje podstawowe nawyki proekologiczne w domu i na wycieczce. Zachowuje się odpowiednio podczas całodziennego pobytu na łonie natury.',
                                  tasks: [
                                        'Korzystałem(-am) regularnie z wielorazowej butelki na wodę, nie kupując wody w jednorazowych, plastikowych butelkach, o ile nie było to absolutnie konieczne, przynajmniej przez 3 miesiące.',
                                        'Korzystałem(-am) wyłącznie z wielorazowych naczyń i sztućców na biwakach, imprezach szkolnych i harcerskich przez minimum 3 miesiące.',
                                        'Przez okres trwania próby odpowiednio pozbywałem(-am) się swoich odpadów podczas wędrówek w terenie – korzystałem(-am) z wielorazowej torby na odpady oraz zakopałem(-am) we właściwy sposób nadające się do tego odpady biologiczne.',
                                        'Opowiedziałem(-am) innym (np. członkom swojego zastępu) o tym, kiedy można spotkać podloty oraz młode innych gatunków (np. zające, sarny) oraz dlaczego należy pozostawić je w spokoju tam, gdzie są. Wyjaśniłem(-am), w jakich sytuacjach należy pomóc rannemu lub zagrożonemu zwierzęciu oraz zademonstrowałem(-am), jak należy wezwać pomoc. Zapisałem(-am) w telefonie komórkowym numer do najbliższego ośrodka rehabilitacji dzikich zwierząt (lub analogicznej instytucji).',
                                        'Zapoznałem(-am) się z ideą domowych/balkonowych ogrodów. Wyhodowałem(-am) jadalną roślinę i użyłem(-am) jej do przyrządzenia posiłku dla rodziny.',
                                  ]),
                              SprawData(
                                  id: 'ekolog',
                                  title: 'Ekolog',
                                  level: '3',
                                  comment: 'Rozumie zależności pomiędzy człowiekiem a środowiskiem na przykładzie śladu węglowego. Stosuje zaawansowane nawyki proekologiczne. Zachowuje się odpowiednio podczas weekendowego pobytu na łonie natury.',
                                  tasks: [
                                        'Wziąłem (Wzięłam) udział w kilkudniowej wyprawie z nocowaniem na łonie przyrody. Nauczyłem(-am) się odpowiednio załatwiać swoje potrzeby fizjologiczne, będąc w terenie.',
                                        'Wiem, co to jest rezerwat przyrody, park narodowy i park krajobrazowy. W czasie harcerskich wędrówek odwiedziłem(-am) jeden z parków narodowych lub krajobrazowych.',
                                        'Dowiedziałem(-am) się, czym jest globalne ocieplenie, jakie są jego przyczyny oraz prognozowane konsekwencje. Poznałem(-am) pojęcie śladu węglowego, opowiedziałem(-am) o stosowanych we własnym życiu działaniach na rzecz jego zmniejszania (np. dojeżdżanie do szkoły rowerem lub komunikacją miejską, stosowanie różnych sposobów oszczędzania energii). W trakcie trwania próby wyrobiłem(-am) w sobie nowy nawyk zmniejszający emisję gazów cieplarnianych.',
                                        'Dowiedziałem(-am) się, jaki wpływ na środowisko wywieram podczas wypraw, wycieczek, obozów, biwaków na łonie przyrody. Poznałem(-am) podstawowe techniki minimalizacji tego wpływu. Kompletuję własny ekwipunek, uwzględniając w nim przynajmniej jedną pomocną w tym rzecz (np. sprzęt do hamakowania, wielorazowy worek na resztki/odpady, worki lub pojemniki zabezpieczające żywność przed dostępem dzikich zwierząt, sprzęt do gotowania, składana miska do mycia).',
                                        'Wykonałem jedno z poniższych zadań:'
                                            '\n\n– Znalazłem(-am) ulubioną formę spędzania czasu na łonie natury. W trakcie trwania próby poświęcałem(-am) jej w sumie minimum 4 godziny w miesiącu.'
                                            '\n\n– Zaangażowałem(-am) się w projekt dotyczący ochrony przyrody.',
                                        'Przeanalizowałem(-am) ilość i rodzaj generowanych przez siebie śmieci. Zmniejszyłem o założony procent ilość generowanych odpadów lub wyeliminowałem(-am) z moich powtarzalnych zakupów jeden rodzaj nieekologicznego opakowania.',
                                  ]),
                              SprawData(
                                  id: 'ekolog',
                                  title: 'Ekolog',
                                  level: '4',
                                  comment: 'Rozumie i propaguje świadomość najważniejszych zależności pomiędzy człowiekiem a środowiskiem na przykładzie śladu wodnego. Stosuje i propaguje zaawansowane nawyki proekologiczne. Zachowuje się odpowiednio podczas pobytów na łonie natury.',
                                  tasks: [
                                        'Poznałem(-am) podstawowe problemy związane z dostępem do wody pitnej (w tym problem jej niedoboru) na świecie i w Polsce. Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n– Poznałem(-am) różne sposoby pozyskania lub uzdatniania wody pitnej w terenie (destylacja, filtry osobiste, filtracja i uzdatnianie chemiczne itp.). Podczas wędrówki zastosowałem(-am) jeden z nich.'
                                            '\n\n– Przeprowadziłem(-am) akcję szerzenia dobrych praktyk w zakresie gospodarowania wodą, w tym:'
                                            '\n\n- Oszczędzania wody,'
                                            '\n\n- Gromadzenia deszczówki do podlewania roślin,'
                                            '\n\n- Niekoszenia trawników, tworzenia łąk kwietnych zamiast trawników, niepodlewania ogrodu/trawnika w ciągu dnia (w największym słońcu).',
                                        'Dowiedziałem(-am) się, czym jest i skąd bierze się mikroplastik oraz oceaniczne „wyspy śmieci”. Wprowadziłem(-am) w swoim życiu przynajmniej jedną wymierną zmianę wpływającą na zmniejszanie ilości mikroplastiku, np. niekupowanie produktów zawierających mikrogranulki (m.in. past do zębów, peelingów i chemii gospodarczej) lub stosowanie się do wskazówek prania ubrań ze sztucznych włókien.',
                                        'Dowiedziałem(-am) się, gdzie znaleźć rzetelne informacje na temat ekologii i ochrony środowiska. Nauczyłem(-am) się korzystać z tych źródeł w razie potrzeby i poleciłem(-am) je innym.',
                                        'Znam i stosuję zasady ekologicznego obozowania. Wdrażam w nie młodszych od siebie harcerzy, pomagając im w ekologicznym obozowaniu/biwakowaniu.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '2',
                        sprawData: [
                              SprawData(
                                  id: 'przyrodnik',
                                  title: 'Przyrodnik',
                                  level: '1',
                                  comment: 'Rozpoznaje najpopularniejsze rośliny i zwierzęta leśne. Opiekuje się roślinami domowymi.',
                                  tasks: [
                                        'Rozpoznałem(-am) podstawowe jadalne rośliny leśne (np. borówka, poziomka, malina, jeżyna, orzechy laskowe).',
                                        'Rozpoznałem(-am) zwierzęta dziko żyjące w Polsce: sarny, jelenie, dziki, łosie, żubry, bobry, wilki. Co najmniej dwa z nich widziałem na własne oczy.',
                                        'Podczas spaceru po lesie lub innym terenie zielonym rozpoznałem(-am) po sylwetkach, korzeniach i liściach 8 rodzajów drzew (np. dąb, brzozę, klon, leszczynę, wierzbę, topolę, lipę, sosnę, świerk, jodłę, modrzew).',
                                        'Przez przynajmniej 2 miesiące hodowałem(-am) własną roślinę, obserwując jej wzrost.',
                                  ]),
                              SprawData(
                                  id: 'przyrodnik',
                                  title: 'Przyrodnik',
                                  level: '2',
                                  comment: 'Rozpoznaje rośliny, zwierzęta i grzyby leśne. Obserwuje dziką przyrodę w sposób bezpieczny dla siebie i natury. Hoduje rośliny domowe.',
                                  tasks: [
                                        'Rozpoznałem(-am) przynajmniej 5 roślin i grzybów niebezpiecznych lub trujących (np. konwalia majowa, barszcz sosnowskiego, wawrzynek wilczełyko, pokrzyk, wilcza jagoda, trzmielina). Opowiedziałem(-am) innym jak postępować i pomóc komuś w przypadku spożycia/kontaktu z nimi.',
                                        'Rozpoznałem(-am) żmiję, odróżniając ją od innych polskich węży oraz jaszczurek beznogich (padalców).',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n– Przesadziłem(-am) 5 roślin doniczkowych.'
                                            '\n\n– Wyhodowałem(-am) roślinę z nasiona.'
                                            '\n\n– Założyłem(-am) ogród dla owadów zapylających.'
                                            '\n\n– Zasadziłem(-am) 5 drzew.',
                                        'Zbudowałem(-am) oraz zainstalowałem(-am) bezpieczną oraz odpowiednich wymiarów budkę lęgową lub karmnik lub poidełko dla ptaków bądź innych zwierząt lub hotel dla owadów.',
                                  ]),
                              SprawData(
                                  id: 'przyrodnik',
                                  title: 'Przyrodnik',
                                  level: '3',
                                  comment: 'Rozpoznaje rośliny i zwierzęta występujące w jego/jej regionie. Organizuje wycieczki przyrodnicze w sposób bezpieczny dla uczestników i natury.',
                                  tasks: [
                                        'Rozpoznałem(-am) i opowiedziałem innym osobom o życiu co najmniej 10 występujących w moim otoczeniu roślin i zwierząt:'
                                            '\n\n– przynajmniej 2 gatunki drzew lub krzewów,'
                                            '\n\n– przynajmniej 1 ptaka, 1 płaza, 1 owada, 1 pajęczaka, 1 skorupiaka i 1 mięczaka.',
                                        'Spędziłem(-am) dzień na łonie natury, dokonując obserwacji przyrodniczych samodzielnie (ewentualnie pod opieką osoby dorosłej) i dokumentując ten fakt w dowolnej formie. Swoimi wrażeniami podzieliłem(-am) się z resztą zastępu.',
                                        'Wyjaśniłem(-am) harcerzom z zastępu rolę martwego drewna w lesie. Nauczyłem(-am) ich, co z tego wynika i jakiego drewna należy używać na ogniska.',
                                        'Zorganizowałem(-am) co najmniej jedną wycieczkę zastępu do jednego z miejsc chroniących przyrodę (obszar Natura 2000, park krajobrazowy, rezerwat, park narodowy). Zaprezentowałem(-am) walory przyrodnicze wybranego miejsca.',
                                  ]),
                              SprawData(
                                  id: 'przyrodnik',
                                  title: 'Przyrodnik',
                                  level: '4',
                                  comment: 'Rozpoznaje rośliny i zwierzęta występujące w Polsce. Bierze czynny udział w inicjatywach mających na celu ochronę przyrody.',
                                  tasks: [
                                        'Skompletowałem(-am) biblioteczkę (książki, artykuły, foldery, adresy stron internetowych) o tematyce ekologicznej. Przeprowadziłem(-am) zbiórkę na temat znaczenia przyrody dla zdrowia człowieka oraz potrzeby jej ochrony przed zagrożeniami cywilizacyjnymi.',
                                        'Poznałem(-am) kilka gatunków roślin i zwierząt zagrożonych wyginięciem w Polsce. Wziąłem (Wzięłam) udział w akcji na rzecz ochrony gatunków rodzimych (np. akcje reintrodukcji, akcje ochrony płazów migrujących na wiosnę, wyznaczania/monitorowania stref ochronnych, akcji liczenia raków).',
                                        'Nauczyłem(-am) się reagować na typowe działania szkodliwe dla środowiska naturalnego (np. wypalanie traw, wyrzucanie odpadów do lasu, zabieranie dzikich zwierząt, rozpalanie ognia w miejscach zabronionych, niszczenie środowiska, wycinka drzew dziuplastych). Wykazałem(-am) się przynajmniej raz czynną postawą w obliczu szkodliwych zachowań.',
                                        'Zapoznałem(-am) się z celami i działaniami kilku organizacji ekologicznych. Przez co najmniej pół roku współpracowałem(-am) z jedną z nich.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '3',
                        sprawData: [
                              SprawData(
                                  id: 'przyjaciel_roslin',
                                  title: 'Przyjaciel roślin',
                                  level: '1',
                                  comment:'Rozpoznaje podstawowe rośliny uprawiane w polskich domach i ogródkach czy rosnące w lasach i na łąkach. Sadzi i opiekuje się roślinami.',
                                  tasks: [
                                        'Wyhodowałem(-am) z nasion, pestek lub cebulek wybraną przez siebie roślinę, opiekowałem(-am) się nią i udokumentowałem(-am) np. na zdjęciach etapy jej wzrastania i przedstawiłem(-am) je na zbiórce.',
                                        'Odwiedziłem(-am) ogród botaniczny (lub byłem(-am) na łące, w lesie, w polu itp.) i opowiedziałem(-am) na zbiórce o swoich obserwacjach dotyczących występującej tam roślinności.',
                                        'Opiekowałem(-am) się roślinami w domu, w harcówce, w szkolnej pracowni lub na działce przez cały okres próby na sprawność.',
                                  ]),
                              SprawData(
                                  id: 'przyjaciel_roslin',
                                  title: 'Przyjaciel roślin',
                                  level: '2',
                                  comment: 'Zna rośliny chronione, w tym też takie, które wymagają w naszym kraju specjalnej troski.',
                                  tasks: [
                                        'Odnalazłem(-am) i odwiedziłem(-am) w swojej okolicy co najmniej dwa drzewa/grupy drzew – pomniki przyrody.',
                                        'Opowiedziałem(-am) w drużynie o interesujących roślinach występujących w rezerwacie przyrody w mojej okolicy.',
                                        'Przygotowałem(-am) w ciekawej formie informację o wybranych 15 roślinach chronionych występujących w Polsce i przedstawiłem(-am) ją na zbiórce zastępu, drużyny lub w klasie. Celem mojej prezentacji było zapobieżenie niszczeniu roślin chronionych wynikającemu z niewiedzy, dlatego co najmniej połowa prezentowanych roślin to takie, na które możemy natrafić w swoim otoczeniu.',
                                  ]),
                              SprawData(
                                  id: 'przyjaciel_roslin',
                                  title: 'Przyjaciel roślin',
                                  comment: 'Działa na rzecz ochrony roślin.',
                                  level: '3',
                                  tasks: [
                                        'Przedstawiłem(-am) na zbiórce drużyny w ciekawy sposób wybrane gatunki roślin występujących na świecie, zagrożonych wyginięciem („czerwona księga”).',
                                        'Poprowadziłem(-am) wycieczkę zastępu lub drużyny w celu poznania środowiska roślinnego najbliższej okolicy. Ciekawie opowiedziałem(-am) o co najmniej 8 roślinach, które napotkaliśmy (np. na łące, w lesie). Przygotowując wyprawę, korzystałem(-am) ze swoich zbiorów: albumów, atlasów, zielników, zbiorów cyfrowych itp. na temat roślin.',
                                        'Zorganizowałem(-am) i poprowadziłem(-am) wyprawę zastępu lub drużyny do ogrodu botanicznego, parku narodowego, rezerwatu przyrody albo muzeum przyrodniczego.',
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '4',
                        sprawData: [
                              SprawData(
                                  id: 'zielarz',
                                  title: 'Zielarz',
                                  level: '2',
                                  comment: 'Zna podstawowe zioła występujące w Polsce. Potrafi je wykorzystać.',
                                  tasks: [
                                        'Znalazłem(-am) w lesie i na łące co najmniej 6 roślin jadalnych, które zebrałem w celu wykorzystania.',
                                        'Przygotowałem(-am) napar (herbatę) z pokrzywy, mięty, rumianku lub innego zioła.',
                                        'W czasie wędrówki zastępu pokazałem(-am) innym harcerzom miejsce występowania co najmniej 3 roślin użytkowych (opowiedziałem(-am) o ich zastosowaniu) i co najmniej 3 trujących (wyjaśniłem(-am) dlaczego należy ich unikać).',
                                  ]),
                              SprawData(
                                  id: 'zielarz',
                                  title: 'Zielarz',
                                  level: '3',
                                  comment: 'Zna zasady zbierania i przechowywania ziół.',
                                  tasks: [
                                        'Samodzielnie wysuszyłem(-am) i odpowiednio spakowałem(-am) przyprawy, które następnie wziąłem (wzięłam) na biwak – np. bazylia, natka pietruszki itp., w tym co najmniej jedną przyprawę samodzielnie znalezioną w terenie.',
                                        'Przyrządziłem(-am) ziołowy środek przydatny w leczeniu, kosmetyce, w gospodarstwie domowym.',
                                        'Prowadziłem(-am) zbiór roślin (zgodnie z kalendarzem ich zbierania). Zebrałem(-am), zasuszyłem(-am) i przechowałem(-am) co najmniej 3 wybrane rośliny, tak aby nie straciły swoich właściwości.',
                                        'Zorganizowałem(-am) i poprowadziłem(-am) wyprawę zastępu lub drużyny na łąkę lub do lasu w celu zbierania ziół i innych roślin jadalnych.',
                                  ]),
                              SprawData(
                                  id: 'zielarz',
                                  title: 'Zielarz',
                                  level: '4',
                                  comment: 'Korzysta z darów lasu i łąki do przyrządzania posiłków we wszystkich porach roku. Propaguje ziołolecznictwo.',
                                  tasks: [
                                        'Przygotowałem co najmniej 8 potraw (minimum 4 ciepłe) z wykorzystaniem samodzielnie zebranych, dziko rosnących owoców i ziół (przy wykorzystaniu dodatkowo takich produktów jak kasza, mąką i miód).',
                                        'Potrafię zebrać „w terenie” rośliny jadalne o każdej porze roku. Przygotowałem(-am) posiłek leśny na wypadzie zastępu lub drużyny wiosną, latem, jesienią i zimą.',
                                        'Przygotowałem(-am) do apteczki drużyny zestaw ziół oraz krótki opis sposobu ich stosowania.',
                                        'Przeprowadziłem zbiórkę w zastępie/drużynie na temat stosowania ziół w domowym leczeniu.',
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '5',
                        sprawData: [
                              SprawData(
                                  id: 'florysta',
                                  title: 'Florysta',
                                  level: '2',
                                  comment: 'Rozpoznaje najpopularniejsze kwiaty ogrodowe, doniczkowe i polne. Pielęgnuje własny ogródek kwiatowy. Układa bukiety kwiatowe, korzystając z roślin sezonowych.',
                                  tasks: [
                                        'Rozpoznałem(-am) co najmniej 15 różnych kwiatów w tym kwiaty ogrodowe, doniczkowe i polne.',
                                        'Pielęgnowałem(-am) w czasie próby własny ogródek kwiatowy (np. na klombie, w doniczkach, na działce) składający się co najmniej z kilku gatunków.',
                                        'Dowiedziałem(-am) się, w jakich miesiącach i porach roku kwitną w Polsce poszczególne kwiaty. Ułożyłem(-am) 3 bukiety, w tym jeden wyłącznie z roślin sezonowych.',
                                  ]),
                              SprawData(
                                  id: 'florysta',
                                  title: 'Florysta',
                                  level: '3',
                                  comment: 'Pielęgnuje rzadkie lub trudne w uprawie kwiaty. Układa bukiety kwiatowe, świadomie korzystając z polskich kwiatów. Korzysta z kwiatów w celach dekoracyjnych.',
                                  tasks: [
                                        'Dowiedziałem(-am) się, jakie kwiaty można uprawiać w Polsce, a jakie sprowadza się z zagranicy. Ułożyłem(-am) 3 bukiety składające się wyłącznie z polskich kwiatów.',
                                        'Pielęgnowałem(-am) w czasie próby rzadki lub trudny w uprawie okaz kwiatu. Swoje doświadczenia z uprawy przedstawiłem(-am) w zastępie.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n– Zastosowałem(-am) suszone kwiaty i inne rośliny do wykonania różnych ozdób (np. kartek urodzinowych, zakładek do książki, kolczyków).'
                                            '\n\n– Dowiedziałem(-am) się co to jest „ikebana”. Wykonałem(-am) kwiatową dekorację na wybraną uroczystość w rodzinie, szkole lub drużynie.',
                                  ]),

                        ]
                    ),
                    SprawFamilyData(
                        id: '6',
                        sprawData: [
                              SprawData(
                                  id: 'ogrodnik',
                                  title: 'Ogrodnik',
                                  comment: 'Rozpoznaje nasiona popularnych warzyw. Hoduje własne warzywa. Przygotowuje warzywa do przechowywania podczas zimy.',
                                  level: '2',
                                  tasks: [
                                        'Rozpoznałem(-am) nasiona popularnych warzyw np. marchwi, pietruszki, sałaty, ogórków, buraczków, groszku i dyni.',
                                        'Wyhodowałem(-am) samodzielnie co najmniej 5 warzyw z nasion lub rozsady. Starałem(-am) się nie korzystać z nawozów sztucznych oraz oszczędnie gospodarowałem(-am) wodą (np. łapałem(-am) deszczówkę).',
                                  ]),
                              SprawData(
                                  id: 'ogrodnik',
                                  title: 'Ogrodnik',
                                  level: '3',
                                  comment: 'Rozpoznaje nasiona mniej popularnych warzyw. Samodzielnie prowadzi własny ogródek warzywny.',
                                  tasks: [
                                        'Rozpoznałem(-am) nasiona rzadziej hodowanych warzyw np. karczochów, jarmużu, rzepy, szpinaku i rukoli.',
                                        'Zaplanowałem(-am) i przeprowadziłem(-am) siew i zbieranie plonów na działce lub w ogrodzie. Nie korzystałem(-am) z nawozów sztucznych oraz oszczędnie gospodarowałem(-am) wodą (np. łapałem(-am) deszczówkę).',
                                        'Przygotowałem(-am) kompost z odpadów ogrodniczych. Nawoziłem(-am) swoje uprawy bez stosowania środków chemicznych. Zdobyłem(-am) wiedzę o tym, jak sąsiedztwo niektórych roślin odstrasza pasożyty i zapobiega chorobom moich upraw. Zdobytą wiedzę zastosowałem(-am) w moich uprawach.',
                                        'Prowadziłem(-am) mały ogródek permakulturowy, np. grządkę podwyższoną lub ogród w pojemniku drenażowym na balkonie.',
                                  ]),

                        ]
                    ),


                    SprawFamilyData(
                        id: '7',
                        sprawData: [
                              SprawData(
                                  id: 'sadownik',
                                  title: 'Sadownik',
                                  level: '3',
                                  comment: 'Rozpoznaje typowe drzewa owocowe. Bierze udział w pielęgnacji sadu. Bierze udział w zbiorze owoców lub ich zabezpieczeniu na zimę.',
                                  tasks: [
                                        'Rozpoznałem(-am) po pniach i liściach popularne drzewa owocowe np. jabłonie, grusze, śliwy, wiśnie, czereśnie oraz krzewy owocowe np. maliny, porzeczki, winorośl.',
                                        'Wziąłem (Wzięłam) udział w sadzeniu drzew owocowych lub krzewów jagodowych.',
                                        'Wziąłem (Wzięłam) udział w całorocznej pielęgnacji sadu np. przycinaniu drzew i krzewów, szczepieniu drzewek, zabezpieczeniu go przed szkodnikami itp.',
                                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                            '\n\n– Wziąłem (Wzięłam) udział w zbiorze owoców. Prawidłowo ułożyłem(-am) je w skrzynce/pojemniku i przygotowałem(-am) do transportu.'
                                            '\n\n– Wziąłem (Wzięłam) udział w przygotowaniu owoców do składowania przez zimę.',
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '8',
                        sprawData: [
                              SprawData(
                                  id: 'lesnik',
                                  title: 'Leśnik',
                                  level: '3',
                                  comment: 'Obserwuje życie lasu w różnych porach dnia i roku. Pełni służbę na rzecz lasu.',
                                  tasks: [
                                        'Obserwowałem(-am) życie lasu o świcie, o zmierzchu i w nocy. Wytropiłem(-am) zwierzę i obserwowałem(-am) jego życie. Poszerzyłem(-am) swoją wiedzę o zwyczajach tego zwierzęcia w książkach, telewizji lub Internecie. Przedstawiłem(-am) swoje obserwacje i zdobytą wiedzę w dowolnej formie (opowieść przy ognisku, wpis w Internecie itp.).',
                                        'Odbyłem(-am) obchód lasu z leśnikiem lub z harcerzem posiadającym sprawność****. Wykazałem(-am) się znajomością drzew i umiejętnością rozpoznawania ich wieku.',
                                        'Zorganizowałem(-am) dla swojego zastępu w porozumieniu z leśnikiem całodzienną służbę na rzecz lasu (prace w szkółce, przy oczyszczaniu pasów przeciwpożarowych, sadzeniu drzew itp.).',
                                  ]),
                              SprawData(
                                  id: 'lesnik',
                                  title: 'Leśnik',
                                  level: '4',
                                  comment: 'Działa na rzecz ochrony lasów. Popularyzuje wiedzę o lasach.',
                                  tasks: [
                                        'Brałem(-am) udział w całodziennych pracach leśnych – w co najmniej w 3 rodzajach: zbieranie nasion, siew nasion, dołowanie sadzonek, sadzenie, pielęgnowanie upraw, sprzątanie zrębu.',
                                        'Podczas indywidualnych wędrówek (lub z przyjacielem) poznałem(-am) najbliższe lasy. Poprowadziłem(-am) zastęp/drużynę/patrol na wyprawę do lasu. Pokazałem(-am) różne gatunki drzew i krzewów oraz rośliny będące pod ochroną; miejsca, gdzie można znaleźć grzyby, jagody i zioła oraz szlaki wędrówek zwierząt leśnych.',
                                        'Zorganizowałem(-am) zbiórkę w terenie dla zastępu lub drużyny/patrolu poświęconą lasom. Pokazałem(-am) różnice między lasami naturalnymi (puszczami) a lasem gospodarczym (uprawą leśną) i zaprezentowałem(-am) korzyści płynące z jednego i drugiego rodzaju lasów. Zapoznałem(-am) uczestników zbiórki z rodzajami drewna pozyskiwanymi z lasu i dalszym jego wykorzystaniem.',
                                  ]),

                        ]
                    ),


                    SprawFamilyData(
                        id: '9',
                        sprawData: [
                              SprawData(
                                  id: 'znawca_grzybow',
                                  title: 'Znawca grzybów',
                                  level: '2',
                                  comment: 'Rozpoznaje popularne gatunki grzybów jadalnych, niejadalnych i trujących. Bierze udział w grzybobraniach oraz przygotowaniu grzybów do suszenia lub marynowania. Przygotowuje posiłki z wykorzystaniem grzybów jadalnych.',
                                  tasks: [
                                        'Rozpoznałem(-am) co najmniej 5 grzybów jadalnych (np. borowika szlachetnego, maślaka zwyczajnego, podgrzybka brunatnego, czubajkę kanię, pieprznika jadalnego), 5 grzybów niejadalnych (np. gąskę białawą, gąskę siarkową, aksamitówkę złotą, gołąbka krwistego, lisówkę pomarańczową) oraz 5 grzybów trujących (np. muchomora sromotnikowego, muchomora czerwonego, borowika szatańskiego, borowika purpurowego, strzępiaka ceglastego). Uwieczniłem(-am) je na zdjęciach.',
                                        'Wziąłem (Wzięłam) udział w grzybobraniu w 3 różnych lokalizacjach. Zbierałem(-am) grzyby nie niszcząc grzybni i ściółki.',
                                        'Wziąłem (Wzięłam) udział w myciu grzybów po zebraniu, a także przygotowaniu ich do suszenia lub w marynowaniu.',
                                        'Pod nadzorem osoby dorosłej przygotowałem(-am) posiłek z wykorzystaniem grzybów (np. sos do mięsa, zupę).',
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '10',
                        sprawData: [
                              SprawData(
                                  id: 'przyjaciel_zwierzat',
                                  title: 'Przyjaciel zwierząt',
                                  level: '1',
                                  comment: 'Zna zwierzęta żyjące dziko w swojej najbliższej okolicy i wie, jak można im pomagać. Wie, jak powinno opiekować się wybranymi zwierzętami domowymi.',
                                  tasks: [
                                        'Przygotowałem(-am) dla zastępu quiz, grę planszową itp. wymagającą rozpoznania na zdjęciach lub rysunkach minimum 15 gatunków zwierząt żyjących dziko w Polsce.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n– Obserwowałem(-am) przez miesiąc życie mojego zwierzęcia domowego, zapisywałem(-am) najciekawsze spostrzeżenia, opowiedziałem(-am) o nich na zbiórce zastępu.'
                                            '\n\n– Umówiłem(-am) się z kimś na regularne wyprowadzania psa lub opiekę nad czyimś zwierzęciem przez miesiąc.',
                                        'Dowiedziałem(-am) się i opowiedziałem(-am) zastępowi, jakie dzikie zwierzęta (w tym ptaki) zamieszkują najbliższe tereny i jak można im pomagać. Pomogłem(-am) zwierzętom sam(-a) lub w ramach zorganizowanej akcji np. w zimowym dokarmianiu, budowaniu budek lęgowych, przenoszeniu skrzeku, budowaniu płotków dla płazów.',
                                  ]),
                              SprawData(
                                  id: 'przyjaciel_zwierzat',
                                  title: 'Przyjaciel zwierząt',
                                  level: '2',
                                  comment: 'Pogłębia swoją wiedzę o świecie zwierząt dzikich i domowych oraz o zasadach opieki/pomocy zwierzętom. Propaguje wiedzę o świecie zwierząt.',
                                  tasks: [
                                        'Wiem, jakie niebezpieczne zwierzęta żyją w Polsce. Opowiedziałem(-am) członkom/członkiniom mojego zastępu przed wyprawą do lasu jak należy postępować w przypadku spotkania z nimi.',
                                        'Wiem, jak odpowiednio zachowywać się w lesie, aby nie płoszyć zwierzyny i nie tworzyć dla niej zagrożenia. Podczas wycieczki do lasu lub na łąkę wykonałem(-am) co najmniej jedno z zadań:'
                                            '\n\n– Rozpoznałem(-am) tropy kilku dzikich zwierząt (np. dzika, sarny, zająca) i utrwaliłem(-am) je (np. wykonałem(-am) zdjęcie, odlew).'
                                            '\n\n– Nagrałem(-am) odgłosy ptaków, sfotografowałem(-am) je, zebrałem(-am) ich pióra.'
                                            '\n\n– Rozpoznałem(-am) i nagrałem(-am) głosy pięciu żyjących tam zwierząt.'
                                            '\n\nZaprezentowałem(-am) moje zdobycze na zbiórce zastępu.',
                                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                            '\n\n– Przeczytałem(-am) poradnik dotyczący opieki nad wybranym zwierzęciem. Wybrałem(-am) z niego 5 najciekawszych według mnie informacji i przedstawiłem(-am) je w zastępie.'
                                            '\n\n– Poszedłem (Poszłam) ze swoim zwierzęciem do weterynarza lub samodzielnie sprawdziłem(-am) stan zdrowia zwierzęcia na podstawie wiarygodnego poradnika.',
                                  ]),
                              SprawData(
                                  id: 'przyjaciel_zwierzat',
                                  title: 'Przyjaciel zwierząt',
                                  level: '3',
                                  comment: 'Jest znawcą zwyczajów zwierząt. Zna obowiązujące prawo dotyczące ochrony zwierząt i potrafi przekazać swoją wiedzę innym.',
                                  tasks: [
                                        'Podczas samodzielnej wyprawy do lasu obserwowałem(-am) wybrane zwierzę i podążałem(-am) jego śladem, dokumentując jego życie (w sposób bezpieczny dla niego i dla mnie). Przedstawiłem(-am) jego zwyczaje na forum zastępu lub drużyny.',
                                        'Zorganizowałem(-am) dla zastępu wyprawę do lasu, muzeum przyrodniczego lub zoo. Opowiedziałem(-am) o wybranych gatunkach zwierząt.',
                                        'Przedstawiłem(-am) na forum zastępu lub drużyny wybrane gatunki zwierząt żyjących na całym świecie, zagrożonych wyginięciem („czerwona księga”). Opowiedziałem(-am) o produktach pochodzących z nielegalnego handlu zagrożonymi gatunkami, zwracając uwagę na wyroby popularnie przywożone jako pamiątki z wakacji. Opowiedziałem(-am) na zbiórce zastępu lub w klasie szkolnej o tym, jakie zwierzęta można hodować w domu w Polsce zgodnie z obowiązującym prawem.',
                                        'Przez 2 tygodnie doradzałem(-am) młodszemu rodzeństwu lub członkowi drużyny w opiece nad zwierzęciem domowym. Zrobiłem(-am) dla niego listę dobrych praktyk w opiece nad zwierzętami (np. niepozostawianie w samochodzie, zapewnianie wody do picia itp.).',
                                  ]),
                              SprawData(
                                  id: 'przyjaciel_zwierzat',
                                  title: 'Przyjaciel zwierząt',
                                  level: '4',
                                  comment: 'Bierze czynny udział w ochronie zwierząt i propagowaniu stylu życia, który minimalizuje ich cierpienie.',
                                  tasks: [
                                        'Zorganizowałem(-am) dla swojego zastępu lub drużyny służbę na rzecz zwierząt.',
                                        'Nawiązałem(-am) współpracę z wybranym leśnictwem, parkiem narodowym lub organizacją zajmującą się ochroną zwierząt. Wziąłem (Wzięłam) udział jako wolontariusz w akcji organizowanej przez te instytucje np. liczeniu zwierząt, obrączkowaniu ptaków itp.',
                                        'Dokonałem(-am) przeglądu używanych przez siebie produktów (np. kosmetyków, produktów spożywczych). Wyeliminowałem(-am) te, których produkcja powoduje szkody w świecie zwierząt (np. testowane na zwierzętach, zawierające olej palmowy, pochodzenie z niezrównoważonych hodowli).',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '11',
                        sprawData: [
                              SprawData(
                                  id: 'hodowca',
                                  title: 'Hodowca (ptaków, gryzoni, drobiu, ryb)',
                                  level: '2',
                                  comment: 'Świadomie prowadzi hodowlę wybranych zwierząt (np. ptaków, gryzoni, drobiu, ryb).',
                                  tasks: [
                                        'Przed założeniem hodowli dowiedziałem(-am) się z rzetelnego źródła wiedzy, w jaki sposób należy dbać o interesujące mnie zwierzęta. Dowiedziałem(-am) się, które zwierzęta hodowlane są obce/inwazyjne i jakie są konsekwencje ich umyślnego lub przypadkowego uwolnienia do środowiska naturalnego. Oceniłem(-am) swoje możliwości i po uzyskaniu zgody rodziców/opiekunów dokonałem(-am) wyboru zwierząt do hodowli.',
                                        'Przygotowałem(-am) dla swoich zwierząt właściwe pomieszczenia i przynajmniej od 2 miesięcy utrzymuje je w stałej czystości.',
                                        'W trakcie trwania próby (przynajmniej 2 miesiące) samodzielnie karmiłem(-am) swoje zwierzęta. W przypadku własnej niedyspozycji zapewniłem(-am) sobie zastępstwo.',
                                        'Zaprezentowałem(-am) na zbiórce zastępu wyhodowane przez siebie zwierzęta, opowiedziałem(-am) o ich zwyczajach, sposobach żywienia i zapobiegania chorobom.',
                                  ]),
                              SprawData(
                                  id: 'hodowca',
                                  title: 'Hodowca (ptaków, gryzoni, drobiu, ryb)',
                                  level: '3',
                                  comment: 'Świadomie kultywuje hodowlę wybranych zwierząt (np. ptaków, gryzoni, drobiu, ryb).',
                                  tasks: [
                                        'Dbam o zdrowie moich zwierząt, wykonując jedno z poniższych zadań:'
                                            '\n\n– Zapewniłem(-am) moim zwierzętom wizytę weterynarza,'
                                            '\n\n– zaszczepiłem(-am) moje zwierzęta,'
                                            '\n\n– zweryfikowałem(-am) swoje dotychczasowe praktyki hodowlane w fachowych książkach, czasopismach, portalach.',
                                        'Przygotowałem(-am) dla swoich zwierząt wyposażenie zwiększające komfort miejsca ich codziennego przebywania (np. zabawkę, wybieg).',
                                        'Dostosowałem(-am) dietę moich zwierząt do ich indywidualnych potrzeb. W trakcie trwania próby (przynajmniej 4 miesiące) samodzielnie karmiłem(-am) swoje zwierzęta. W przypadku własnej niedyspozycji zapewniłem(-am) sobie zastępstwo.',
                                        'Zabrałem(-am) członków mojego zastępu na wizytę, podczas której oglądaliśmy moją hodowlę.',
                                  ]),

                        ]
                    ),


                    SprawFamilyData(
                        id: '12',
                        sprawData: [
                              SprawData(
                                  id: 'pszczelarz',
                                  title: 'Pszczelarz',
                                  level: '2',
                                  comment: 'Umie odróżnić pszczołę od innych podobnych owadów, wie jak się zachowuje i co produkuje.',
                                  tasks: [
                                        'Przygotowałem(-am) plakat/prezentację na temat różnic w wyglądzie między pszczołami, osami, trzmielami i szerszeniami. Zaprezentowałem(-am) go na zbiórce zastępu lub drużyny i opowiedziałem(-am) o tym, co pożytecznego robią pszczoły i trzmiele.',
                                        'Obserwowałem(-am) pracę pszczół na łące lub w ogrodzie. Opowiedziałem(-am) członkom mojego zastępu, co zaobserwowałem(-am)',
                                        'Posmakowałem(-am) co najmniej 3 różne rodzaje miodu (np. rzepakowy, lipowy, gryczany, spadziowy, wielokwiatowy, manuka) i podjąłem(-jęłam) próbę opisania różnic w ich smakach.',
                                        'Wybrałem(-am) się do sklepu pszczelarskiego w swojej okolicy lub zajrzałem(-am) do sklepu internetowego dla pszczelarzy. Opowiedziałem(-am), co ciekawego tam widziałem(-am).',
                                  ]),
                              SprawData(
                                  id: 'pszczelarz',
                                  title: 'Pszczelarz',
                                  level: '3',
                                  comment: 'Umie rozpoznać pszczele produkty, wie, jak się je pozyskuje. Pomaga owadom zapylającym.',
                                  tasks: [
                                        'Wziąłem (Wzięłam) udział w kręceniu miodu.',
                                        'Rozpoznałem(-am) co najmniej 5 rodzajów roślin miododajnych występujących w Polsce. Obserwowałem(-am) jak pszczoły zbierają z nich nektar i pyłek kwiatów.',
                                        'Przygotowałem(-am) plakat/prezentację o co najmniej 3 produktach pszczelich i ich właściwościach.',
                                        'Zbudowałem(-am) hotel dla owadów zapylających, zademonstrowałem(-am) go innym wyjaśniając, czemu praca tych owadów jest ważna.',
                                  ]),
                              SprawData(
                                  id: 'pszczelarz',
                                  title: 'Pszczelarz',
                                  level: '4',
                                  comment: 'Interesuje się życiem pszczół, dzieli się swoją wiedzą z innymi. Bierze udział w pracach w pasiece.',
                                  tasks: [
                                        'Od wiosny do jesieni pracowałem(-am) w pasiece i stworzyłem(-am) relację ze swoich działań w dowolnej, atrakcyjnej formie (np. zdjęcia, pamiętnik, filmy, relacja w mediach społecznościowych).',
                                        'Wziąłem (Wzięłam) udział w zabezpieczaniu pszczół przed zimą.',
                                        'Poznałem(-am) właściwości lecznicze produktów wytwarzanych przez pszczoły. Skorzystałem(-am) z dwóch z takich produktów odpowiednio do okoliczności.',
                                        'Opisałem(-am) i spopularyzowałem(-am) właściwości co najmniej 5 produktów pszczelich (na zbiórkach lub w mediach społecznościowych).',
                                        'Zorganizowałem(-am) wycieczkę zastępu/patrolu/drużyny do pasieki. Pokazałem(-am) jak zabezpieczyć się przed użądleniem podczas pracy w pasiece. Przedstawiłem(-am) zasady zachowania podczas pracy przy pszczołach.',
                                  ]),
                        ]
                    ),

                    // Tu można wrzucać rodziny sprawności z kategorii "sprawności przyrodnicze"

              ]
          ),

          SprawGroupData(
              id: 'wych_gospodarcze_i_ekonomiczne',
              title: 'Gospodarcze i ekonomiczne',
              familyData: [

                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'przedsiebiorca',
                                  title: 'Przedsiębiorca',
                                  level: '1',
                                  comment: 'Oszczędził(-a) niewielkie kwoty, rozsądnie gospodarując pieniędzmi, zrobił(-a) proste zakupy',
                                  tasks: [
                                        'Zaoszczędziłem(-am) pieniądze na wybrany przez siebie cel.',
                                        'Właściwie (bezpiecznie) przechowuję pieniądze.',
                                        'Sporządziłem(-am) wraz z rodzicami listę potrzebnych codziennych produktów. Samodzielnie zrobiłem(-am) zakupy zgodnie z listą, sprawdzając ceny i cechy tych produktów i nie przekraczając założonej kwoty.',
                                        'Dowiedziałem(-am) się, jaki wpływ na środowisko ma to, co jem oraz kupuję. Przez co najmniej tydzień prowadziłem(-am) zestawienie swoich wydatków. Następnie określiłem(-am), które były niezbędne, a z których mógłbym/mogłabym zrezygnować.',
                                  ]),
                              SprawData(
                                  id: 'przedsiebiorca',
                                  title: 'Przedsiębiorca',
                                  level: '2',
                                  comment: 'Nauczył(-a) się gospodarować posiadanymi pieniędzmi, w szczególności efektywnie je wydatkować oraz oszczędzać. Wziął/wzięła udział w przedsięwzięciach finansowych drużyny.',
                                  tasks: [
                                        'Robiąc zakupy na rzecz drużyny, uzyskałem(-am) od sprzedającego właściwie wystawioną fakturę. Odbierając ją, sprawdziłem(-am) poprawność wszystkich niezbędnych danych.',
                                        'Wziąłem(wzięłam) udział w pozyskiwaniu środków w formie np. akcji zarobkowej, zbiórki publicznej, loterii, crowdfundingu, akcji 1% itp.',
                                        'Przez miesiąc prowadziłem(-am) zestawienie swoich wydatków. Następnie określiłem(-am), które były niezbędne, a z których mógłbym/mogłabym zrezygnować.',
                                        'Zapoznałem(-am) się z zasadą 4R (refuse, reduce, reuse, recycle), i stosując ją, ograniczyłem(-am) swoją konsumpcję. W trakcie trwania próby całkowicie zrezygnowałem(-am) z kupowania jednego z produktów nieodpowiedzialnych środowiskowo np. słodyczy z olejem palmowym, napojów w butelkach PET itp.',
                                  ]),
                              SprawData(
                                  id: 'przedsiebiorca',
                                  title: 'Przedsiębiorca',
                                  level: '3',
                                  comment: 'Uzyskał(-a) doświadczenie związane z zarabianiem oraz gospodarowaniem pieniędzmi na potrzeby własne lub zespołów, w których aktywnie działa.',
                                  tasks: [
                                        'Wykorzystując więcej niż jeden sposób, pozyskałem(-am) środki finansowe lub materialne na wybrany przez siebie cel.',
                                        'Wziąłem(wzięłam) udział w organizowaniu akcji zarobkowej (np. w formie zbiórki publicznej, sprzedaży towarów lub usług, loterii, crowdfundingu), będąc osobą odpowiedzialną za ustalony obszar jej realizacji bądź rozliczenia (pod nadzorem instruktora).',
                                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:',
                                        '\n\n- Dokonałem(-am) płatności przy pomocy karty płatniczej, wypłaciłem(-am) pieniądze z bankomatu oraz zapłaciłem(-am) przelewem bankowym np. składki.',
                                        '\n\n- Zaprezentowałem(-am) zastępowi lub drużynie w formie graficznej informacje o drodze produkcji i podziale zysków z produkcji i sprzedaży wybranego produktu (w tym o sposobie ich opodatkowania).',
                                        'Zebrałem(-am) informacje o dostępnych dla młodzieży ofertach różnych banków i przeanalizowałem(-am) oferowane w ramach nich usługi i produkty. Na podstawie dokonanej analizy założyłem(-am) konto bankowe lub porównałem(-am) warunki banku, w którym posiadam rachunek, z innymi zebranymi ofertami.',
                                        'Przygotowałem(-am) plan finansowy biwaku, rajdu, wycieczki lub innego przedsięwzięcia harcerskiego. Rozliczyłem(-am) go w ramach uzyskanej zaliczki, jednocześnie weryfikując w ramach tego rozliczenia realizację zakładanego preliminarza.',

                                  ]),
                              SprawData(
                                  id: 'przedsiebiorca',
                                  title: 'Przedsiębiorca',
                                  level: '4',
                                  comment: 'Nabył(-a) umiejętności w zakresie planowania oraz prowadzenia rozliczeń finansowych w ramach podstawowych aktywności zespołów (np. drużyny, zastępu itp.). Zdobył(-a) podstawową wiedzę o swoich kompetencjach jako przyszłego pracownika lub przedsiębiorcy. Skutecznie nauczył(-a) się przekazywać innym wiedzę o podstawowych pojęciach ekonomicznych.',
                                  tasks: [
                                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:',
                                        '\n\n- Przeprowadziłem(-am) w drużynie grę ekonomiczną umożliwiającą uczestnikom poznanie pojęć: popyt, podaż, koszt, przychód, marża, zysk, wykorzystując udostępnione w ramach programów edukacyjnych materiały wychowania ekonomicznego. Odpowiedzialnie zadbałem(-am) o jakość materiałów, czerpiąc je ze stron instytucji finansowych, np. NBP, GPW, Związek Banków Polskich.',
                                        '\n\n- Pokierowałem(-am) akcją zarobkową drużyny (w formie np. zbiórki publicznej, sprzedaży towarów lub usług, loterii, crowdfundingu), która przyniosła wymierny zysk, i rozliczyłem(-am) ją.',
                                        'Zidentyfikowałem(-am) swoje predyspozycje zawodowe, korzystając z pomocy doradcy zawodowego lub wybranego kwestionariusza.',
                                        'Poznałem(-am) różne rodzaje ochrony i pomnażania oszczędności. Pomnożyłem(-am) swoje środki i przedstawiłem(-am) osiągnięte efekty wraz z wnioskami podczas zbiórki dla zastępu lub drużyny/rodziców. Podczas prezentacji efektów tego działania wykorzystałem(-am) narzędzie analizy portfelowej.',
                                        'Przygotowałem(-am) własne CV oraz napisałem(-am) list motywacyjny do wybranej oferty pracy.',
                                        'Poznałem(-am) różnicę pomiędzy pensją brutto a netto. Wyliczyłem(-am) z kwoty pensji brutto wszystkie składowe zarówno po stronie pracownika, jak i pracodawcy: kwotę netto, podatek, ubezpieczenie zdrowotne, ubezpieczenie emerytalne, ubezpieczenie chorobowe, ubezpieczenie rentowe, ubezpieczenie wypadkowe, PPK itp. Potrafię wyjaśnić, na co są przeznaczone poszczególne składowe pensji brutto.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '2',
                        sprawData: [
                              SprawData(
                                  id: 'kwatermistrz',
                                  title: 'Kwatermistrz',
                                  level: '2',
                                  comment: 'Dba o sprzęt zastępu. Potrafi naprawiać i konserwować sprzęt. Potrafi zaopiekować się harcówką. ',
                                  tasks: [
                                        'Skompletowałem(-am) sprzęt zastępu potrzebny na obozie. Dbałem(-am) o niego w czasie obozu.',
                                        'Brałem(-am) udział w pracach konserwatorsko-naprawczych sprzętu drużyny, szczepu lub hufca po akcji letniej.',
                                        'Opiekowałem(-am) się harcówką przez okres próby: dokonałem(-am) w niej drobnych napraw lub zaproponowałem(-am) nowe funkcjonalne i estetyczne rozmieszczenie wyposażenia.',
                                  ]),
                              SprawData(
                                  id: 'kwatermistrz',
                                  title: 'Kwatermistrz',
                                  level: '3',
                                  comment: 'Kwatermistrz drużyny. Potrafi poprowadzić magazyn i rejestr sprzętu. Uczy młodszych harcerzy, jak opiekować się sprzętem. ',
                                  tasks: [
                                        'W okresie trwania próby prowadziłem(-am) magazyn sprzętu podczas obozu drużyny lub w ciągu roku wraz z dokumentacją.',
                                        'Wiem na czym polega inwentaryzacja. Brałem(-am) udział w spisie z natury.',
                                        'Byłem(-am) odpowiedzialny(-a) za organizacyjną stronę biwaku lub rajdu drużyny lub szczepu.',
                                        'Nauczyłem(-am) młodszych konserwować sprzęt pionierski i porządkować magazyn sprzętu oraz posługiwać się narzędziami zgodnie z podstawowymi zasadami bezpieczeństwa.',
                                  ]),
                              SprawData(
                                  id: 'kwatermistrz',
                                  title: 'Kwatermistrz',
                                  level: '4',
                                  comment: 'Wspiera kwatermistrzów drużyn i zastępów. Przeprowadza inwentaryzację sprzętu. Organizuje obozy pod względem kwatermistrzowskim.',
                                  tasks: [
                                        'Przeprowadziłem(-am) szkolenie dla kwatermistrzów zastępów lub drużyn.',
                                        'W okresie trwania próby prowadziłem(-am) dokumentację sprzętową drużyny, szczepu lub hufca.',
                                        'Przeprowadziłem(-am) inwentaryzację sprzętu drużyny lub szczepu lub pomagałem(-am) w przeprowadzeniu inwentaryzacji sprzętu hufca.',
                                        'Uczestniczyłem(-am) w organizowaniu obozu drużyny lub szczepu pod względem kwatermistrzowskim (udział w zwiadzie przedobozowym, przygotowanie sprzętu do obozu, nadzór nad sprzętem w czasie obozu i prowadzenie niezbędnej dokumentacji, przegląd sprzętu po obozie i zmagazynowanie go).',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '3',
                        sprawData: [
                              SprawData(
                                  id: 'skarbnik',
                                  title: 'Skarbnik',
                                  level: '2',
                                  comment: 'Skarbnik zastępu. Swoje umiejętności finansowe wykorzystuje w pomaganiu zastępowemu w sprawach finansowych.',
                                  tasks: [
                                        'Wiem na co są zbierane składki w ZHP. Zapoznałem(-am) z tym tematem członków mojego zastępu.',
                                        'Wspierałem(-am) zbieranie składek w moim zastępie (przypominanie o terminach, zrobienie listy zebranych składek dla zastępowego) co najmniej przez jeden kwartał.',
                                        'Zorganizowałem(-am) akcje zarobkową zastępu i rozliczyłem ją zgodnie z zasadami obowiązującymi w mojej drużynie.',
                                  ]),
                              SprawData(
                                  id: 'skarbnik',
                                  title: 'Skarbnik',
                                  level: '3',
                                  comment: 'Skarbnik drużyny. Na bieżąco wspiera prace drużynowego zajmując się rozliczeniami finansowymi. ',
                                  tasks: [
                                        'Poznałem(-am) przepisy finansowe ZHP obowiązujące drużynę.',
                                        'Pod nadzorem drużynowego zebrałem(-am) i rozliczyłem(-am) składki drużyny za jeden kwartał.',
                                        'Co najmniej raz rozliczyłem(-am) w hufcu fakturę za wydatkowanie środków na śródroczną działalność programową.',
                                        'Co najmniej dwa razy zarządzałem(-am) finansami biwaku/imprezy drużyny (osobiście lub wspierając innych członków drużyny):'
                                            '\n\n- opracowałem(-am) preliminarz (czyli plan finansowy);'
                                            '\n\n- zarządzałem finansami w trakcie trwania przedsięwzięcia;'
                                            '\n\n- rozliczyłem(-am) imprezę zgodnie z obowiązującymi w hufcu zasadami.',
                                        'Opracowałem(-am) plan finansowy drużyny na rok harcerski i przedstawiłem(-am) swoją koncepcję radzie drużyny.',
                                  ]),
                              SprawData(
                                  id: 'skarbnik',
                                  title: 'Skarbnik',
                                  level: '4',
                                  comment: 'Wykorzystuje swoje umiejętności finansowo-księgowe do wspierania działań prowadzonych na poziomie szczepu lub hufca',
                                  tasks: [
                                        'Przeprowadziłem(-am) szkolenie dla skarbników zastępów i drużyn.',
                                        'Uczestniczyłem(-am) w pracach zespołu przygotowującego oraz rozliczającego pod względem finansowym obóz mojego środowiska.',
                                        'Wziąłem(wzięłam) udział w opracowywaniu wniosku grantowego i rozliczaniu grantu po jego wykonaniu.',
                                        'Wziąłem(wzięłam) udział w opracowywaniu miesięcznego rozliczenia finansowego hufca.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '4',
                        notesForLeaders: [
                              'Aplikacja mobilna "Pola"',
                              'Podcasty na temat fair trade powinny zostać przez drużynowego zweryfikowane przed wskazaniem takich miejsc harcerzom.',
                              '<url>fairtrade.org.pl/fairtrade/co-to-jest-fairtrade</url>',
                              '<url>ekonsument.pl/a105_odpowiedzialna_konsumpcja.html</url>',
                              '<url>foodfakty.pl/slad-weglowy-i-wodny-w-przemysle-rolno-spozywczym</url>',
                        ],
                        sprawData: [
                              SprawData(
                                  id: 'swiadomy_konsument',
                                  title: 'Świadomy konsument',
                                  level: '2',
                                  comment: 'Zna podstawowe zasady, które powinien stosować świadomy konsument i stosuje je w swoich działaniach. Jest świadomy(-a), gdzie w swojej okolicy może nabyć produkty fair trade',
                                  tasks: [
                                        'Przygotowałem(-am) zasady bycia odpowiedzialnym konsumentem i przedstawiłem(-am) je zastępowi lub drużynie wraz z informacją o zasadach fair trade.',
                                        'Sporządziłem(-am) mapę miejsc, w których można kupić produkty lokalne oraz produkty fair trade. Przygotowaną mapę zaprezentowałem(-am) na zbiórce zastępu lub drużyny lub umieściłem(-am) w mediach społecznościowych wykorzystywanych przez lokalną społeczność.',
                                        'Przeanalizowałem(-am) swoje miesięczne zakupy, określiłem(-am), które były spowodowane realną, a które wykreowaną potrzebą (zachcianką/ pragnieniem).',
                                        'Przygotowałem(-am) posiłek wyłącznie z produktów dostępnych aktualnie w domu, wykorzystując te, dla których data przydatności była najkrótsza (aby marnowało się jak najmniej jedzenia).',
                                  ]),
                              SprawData(
                                  id: 'swiadomy_konsument',
                                  title: 'Świadomy konsument',
                                  level: '3',
                                  comment: 'Posiada dużą wiedzę na temat zasad bycia świadomym konsumentem i wdraża je w swoich codziennych aktywnościach. Dzieli się posiadaną wiedzą z innymi.',
                                  tasks: [
                                        'Przeanalizowałem(-am) skład kilku często kupowanych produktów pod kątem zdrowych i szkodliwych składników, a także mikroplastików (acrylate), jednocześnie zweryfikowałem(-am) ich pochodzenie i sposób wytworzenia pod kątem kwestii odpowiedzialności za środowisko, jak ślad wodny oraz ślad węglowy. Z analizy wyciągnąłem(wyciągnęłam) wnioski, którymi podzieliłem(-am) się z minimum jedną osobą, podejmując wspólnie z nią konkretne postanowienia co do ułożenia na nowo swoich konsumenckich nawyków. Efekty przyjętych postanowień śledziłem(-am) przez minimum 2 miesiące, porównując je z tą osobą.',
                                        'Poznałem(-am) sposoby na zmniejszenie kosztów gospodarstwa domowego, minimum jeden wprowadziłem(-am) u siebie w domu.',
                                        'Wybrałem(-am) kilka rodzajów najczęściej używanych w swoim domu produktów i porównałem(-am) dostępne oferty kilku marek pod kątem stosunku jakości do ceny, przedstawiłem(-am) rodzinie swoje rekomendacje.',
                                        'Zapoznałem(-am) się z minimum jedną pozycją literatury lub podcastem na temat fair trade oraz zrównoważonej konsumpcji. Wnioski zawarte w przeczytanej lub wysłuchanej publikacji włączyłem(-am) do swojej codziennej rutyny jako konkretne rozwiązania.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '5',
                        notesForLeaders: [
                              '<url>eurodoradztwo.praca.gov.pl/publikacje/konferencje/spis%20projektów.pdf</url>',
                              '<url>biznes.gov.pl/pl/portal/067</url>',
                        ],
                        sprawData: [
                              SprawData(
                                  id: 'pracownik',
                                  title: 'Pracownik',
                                  level: '3',
                                  comment: 'Identyfikuje swoje predyspozycje zawodowe oraz przygotował(-a) się do rekrutacji. Bierze udział w praktykach lub zdobywa pracę dostępną dla osób młodocianych bądź studentów.',
                                  tasks: [
                                        'Zidentyfikowałem(-am) swoje predyspozycje zawodowe korzystając z pomocy doradcy zawodowego lub wybranego kwestionariusza. Na podstawie zidentyfikowanych predyspozycji zawodowych przygotowałem(-am) swoje CV.',
                                        'Przeprowadziłem(-am) wywiad z osobą wykonującą interesujący mnie zawód, dowiedziałem(-am) się, jakie umiejętności lub wykształcenie są potrzebne do jego wykonywania.',
                                        'Zapoznałem(-am) się z ofertami pracy dostępnymi w różnych źródłach, wybrałem(-am) kilka interesujących mnie i pozyskałem(-am) na ich podstawie pracę adekwatną do aktualnych możliwości (praca tymczasowa, wakacyjna praktyka itp.).',
                                        'Założyłem(-am) profil na dowolnym portalu specjalizującym się w kontaktach zawodowo-biznesowych (takich jak np.: linkedin, goldenline). Zbudowałem(-am) sieć kontaktów.',
                                        'Poznałem(-am) obowiązki pracownika i pracodawcy wynikające z umowy zlecenia. Wiem, do czego zobowiązuje mnie jako zleceniobiorcy umowa o dzieło. Znam aktualną minimalną stawkę godzinową.',
                                  ]),
                              SprawData(
                                  id: 'pracownik',
                                  title: 'Pracownik',
                                  level: '4',
                                  comment: 'Określa oraz świadomie rozwija swoje predyspozycje zawodowe. Zdobył(-a) pracę. Dzieli się swoją wiedzą i doświadczeniem z innymi.',
                                  tasks: [
                                        'Znalazłem(-am) interesujące mnie oferty pracy, do których dostosowałem(-am) swoje CV oraz list motywacyjny (o ile był potrzebny) i wysłałem(-am) w ramach złożonej aplikacji. Przygotowałem(-am) się do rozmowy o pracę, pozyskując z dostępnych źródeł informacje o potencjalnym pracodawcy.',
                                        'Przystąpiłem(-am) do procesu rekrutacji i uzyskałem(-am) na tej podstawie wybraną ofertę pracy na co najmniej 1 miesiąc. Podjąłem pracę w sposób świadomy, dbając o swoje prawa poprzez weryfikację, czy otrzymane wynagrodzenie jest zgodne z obowiązującą minimalną stawką godzinową lub pensją minimalną, a także jakie inne prawa i obowiązki przysługują mi w danym trybie zatrudnienia, w szczególności w kwestiach dni wolnych, odpowiedzialności materialnej oraz urlopu. Swoje warunki porównałem z inną osobą zatrudnioną na podstawie umowy o pracę.',
                                        'Przeprowadziłem(-am) na zbiórce ćwiczenia lub warsztaty z technik autoprezentacji i sposobów przygotowania się do zdobycia pierwszej pracy, w tym kontaktów z Urzędem Pracy oraz innymi organizacjami zajmującymi się zatrudnieniem w kraju i za granicą.',
                                        'Poznałem(-am) różne formy zatrudnienia. Znam różnicę pomiędzy pensją brutto a netto. Wyliczyłem(-am) z kwoty pensji brutto wszystkie składowe składniki zarówno po stronie pracownika jak i pracodawcy: kwotę netto, ZUS, US, Ubezpieczenie Zdrowotne, Ubezpieczenie Emerytalne, Ubezpieczenie Chorobowe, Ubezpieczenie Rentowe, Ubezpieczenie Wypadkowe, PPK itp.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '6',
                        notesForLeaders: [
                              '<url>radareklamy.pl/kodeks-etyki</url>',
                              '<url>youtube.com/watch?v=Bqcfq21o3TU</url>',
                              '<url>youtube.com/watch?v=UbPrx2fmtBs</url>',
                        ],
                        sprawData: [
                              SprawData(
                                  id: 'reklamozerca',
                                  title: 'Reklamożerca',
                                  level: '2',
                                  comment: 'Jest świadomy(-a) zagrożeń i korzyści wynikających ze stosowania reklamy. Przygotowuje proste przekazy reklamowe. ',
                                  tasks: [
                                        'Przeanalizowałem(-am) kilka reklam wybranego produktu oceniając, na ile odnoszą się do rzeczywistych jego cech użytkowych.',
                                        'Przedstawiłem(-am) w dowolnej formie zabiegi marketingowe stosowane przez sklepy, zachęcające do zrobienia jak największych zakupów.',
                                        'Stworzyłem(-am) plakat przedstawiający korzyści i zagrożenia płynące z reklam.',
                                        'Przygotowałem(-am) dwie reklamy produktu lokalnego produkowanego w moim regionie, określając cel przekazu i grupę docelową z wykorzystaniem takich technik jak: plakat, film, nagranie audio.',
                                  ]),
                              SprawData(
                                  id: 'reklamozerca',
                                  title: 'Reklamożerca',
                                  level: '3',
                                  comment: 'Posiada podstawową wiedzę na temat rodzajów reklam oraz mechanizmów ich oddziaływania. Przygotowuje proste kampanie reklamowe. Jest świadomy(-a) kwestii etycznych związanych z wykorzystaniem reklamy.',
                                  tasks: [
                                        'Zaprezentowałem(-am) członkom drużyny wywiad, jaki przeprowadziłem(-am) z profesjonalistą (psychologiem reklamy, pracownikiem firmy reklamowej bądź działu marketingu) na temat mechanizmów i technik stosowanych dla maksymalizacji skuteczności przekazu reklamowego oraz różnych rodzajów reklam, a w szczególności różnic pomiędzy reklamą komercyjną a społeczną.',
                                        'Przygotowałem(-am) infografikę bądź podcast na dowolnie wybrany temat, wykorzystujący zasady stosowane podczas tworzenia skutecznych przekazów reklamowych i umieściłem(-am) go w social mediach. Następnie zmierzyłem(am) skuteczność przygotowanego przekazu.',
                                        'Przygotowałem(-am) i przeprowadziłem(-am) kampanię reklamową dla wybranej jednostki harcerskiej, wykorzystując podstawowe mechanizmy tworzenia przekazu reklamowego, sprecyzowania potrzeb reklamodawcy, określania odbiorcy oraz właściwego doboru form przekazu (np. reklama w ramach akcji naborowej, kampanii 1%, etc.).',
                                        'Przeprowadziłem(-am) debatę na wybrany temat z obszaru etyki reklamy.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '7',
                        notesForLeaders: [
                              '<url>finansiaki.pl</url>',
                              '<url>pl.khanacademy.org/economics-finance-domain/core-finance/interest-tutorial</url>',
                              '<url>pl.khanacademy.org/economics-finance-domain/core-finance/inflation-tutorial</url>',
                              '<url>pl.khanacademy.org/economics-finance-domain/core-finance/money-and-banking</url>',
                              '<url>pkobp.pl/klienci-indywidualni/dla-dzieci/sko-szkolne-kasy-oszczednosci/#materialy-edukacyjne</url>',
                              '<url>youtube.com/watch?v=Q86j8QqTnxA</url>',
                              '<url>youtube.com/watch?v=3WK3Bc07MJw</url>',
                              '<url>issuu.com/publicats.a./docs/mlo001</url>',
                              '<url>cpnbp.pl/__data/assets/pdf_file/0004/82993/bankoteka_9.pdf.pdf</url>',
                              '<url>youtube.com/watch?v=qf07vzQcGOo</url>',
                              '<url>nbportal.pl/rozrywka/gry/straznik-banknotow/straznik-banknotow</url>',
                              '<url>nbportal.pl/wiedza/prezentacje/cechy-pieniadza?fbclid=IwAR3iNEd1gjuqrSdROIGlReQeH6M_Cs88krgazt69u-8QQNqhosF95eriucs</url>',
                              '<url>nbportal.pl/wiedza/prezentacje/historia-pieniadza?fbclid=IwAR06HwjWfxZZ4mmvt9ICJB6ElCjSqMaPVVrKF6FDBNEZ-dgmEryws8ycfYU</url>',
                              '<url>youtube.com/watch?v=vrNDlcxfLZA</url>',
                              'Gry na portalu NBP: <url>nbportal.pl/rozrywka/gry</url>',
                        ],
                        sprawData: [
                              SprawData(
                                  id: 'bankier',
                                  title: 'Bankier',
                                  level: '1',
                                  comment: 'Posiada podstawową wiedzę o tym, czym jest pieniądz. Jest świadomy(-a) istnienia usług bankowych i ich dostępnego zakresu. Interpretuje informacje na temat kosztu kredytu.',
                                  tasks: [
                                        'Dowiedziałem(-am) się, z jakiego banku korzystają moi rodzice lub opiekunowie, gdzie się znajduje i jakie usługi oferuje. Wspólnie z nimi przedyskutowałem(-am) powody, dla których korzystają z oferty akurat tego banku.',
                                        'Poznałem(-am) dostępne dla siebie sposoby oszczędzania pieniędzy i przedstawiłem(-am) je na zbiórce zastępu.',
                                        'Odszukałem(-am) dostępne w sieci edukacyjne materiały multimedialne, dzięki którym poznałem(-am) definicję pieniądza oraz zapoznałem(-am) się z zabezpieczeniami na banknotach, jak również nietypowymi monetami w obiegu w Polsce. Wziąłem(wzięłam) udział w minimum jednej grze oraz quizie, dzięki którym zapamiętałem(-am) powyższe informacje (np. na portalu NBP).',
                                        'Dowiedziałem(-am) się, co to jest RRSO i jaką rolę pełni. Wyjaśniłem(-am) to innym, porównując poziom RRSO w kilku ofertach finansowych.',
                                  ]),
                              SprawData(
                                  id: 'bankier',
                                  title: 'Bankier',
                                  level: '2',
                                  comment: 'Posiada wiedzę o tym, czym jest pieniądz i jakie pełni w gospodarce funkcje. Posiada podstawowe umiejętności w zakresie obliczania oprocentowania oraz wykorzystania podstawowych form przekazywania środków finansowych innym podmiotom lub osobom.',
                                  tasks: [
                                        'Poznałem(-am) pojęcia takie jak: cechy pieniądza, funkcje pieniądza oraz jestem świadomy(-a) ewolucji form pieniądza. Jedno z tych pojęć wyjaśniłem(-am) na forum zastępu przygotowując graficzną prezentację.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- Wziąłem(wzięłam) udział w grze dostępnej na Portalu Edukacji Ekonomicznej Narodowego Banku Polskiego (NBP).'
                                            '\n\n- Odwiedziłem(-am) Centrum Pieniądza NBP.'
                                            'Obliczyłem(-am) odsetki, jakie uzyskałbym(uzyskałabym) w wypadku założenia rocznej lokaty w wysokości 100 zł, przy użyciu aktualnej stopy oprocentowania, jaką proponuje wybrany przeze mnie bank i przy założeniu, że nie uwzględniona zostaje kapitalizacja (procent prosty).'
                                            'Poznałem(-am) różnice pomiędzy przelewem bądź przekazem bankowym i pocztowym. Dokonałem(-am) jednego z nich.',
                                  ]),
                              SprawData(
                                  id: 'bankier',
                                  title: 'Bankier',
                                  level: '3',
                                  comment: 'Posiada podstawowe informacje na temat systemu bankowego. Jest świadomy(-a) sposobu obiegu pieniądza w gospodarce oraz dostępnych form jego inwestowania i związanych z tym ryzyk.',
                                  tasks: [
                                        'Wyjaśniłem(-am) innym, jak wygląda obieg pieniądza w gospodarce. Przygotowałem(-am) na ten temat dowolną prezentację.',
                                        'Obliczyłem(-am) odsetki, jakie uzyskałbym(uzyskałabym) w wypadku założenia rok temu rocznej lokaty w walucie (kwota w EUR) w wysokości 100 zł (przeliczonych na EUR), przy użyciu aktualnej stopy oprocentowania, jaką proponuje wybrany przeze mnie bank oraz kursu waluty sprzed roku i dzisiejszego oraz przy założeniu, że nie uwzględniona zostaje kapitalizacja (procent prosty).',
                                        'Wziąłem(wzięłam) udział w grze ekonomicznej zawierającej elementy inwestowania (forma inwestycji, czas, płynność) oraz oceny ryzyka oraz rozwiązałem(-am) quiz lub krzyżówkę z dziedziny finansów i bankowości, dostępnych na Portalu Edukacji Ekonomicznej NBP.',
                                        'Poznałem(-am) różne rodzaje ochrony i pomnażania oszczędności, przeprowadziłem(-am) na ten temat zbiórkę dla członków drużyny oraz dla ich rodziców. Podczas zbiórki uwzględniłem(-am) kwestie poziomu ryzyka, zabezpieczeń BFG oraz specyfiki poszczególnych instrumentów i wynikających stąd różnic (np. różnica między kredytem a pożyczką).',
                                  ]),
                              SprawData(
                                  id: 'bankier',
                                  title: 'Bankier',
                                  level: '4',
                                  comment: 'Posiada rozszerzone informacje na temat systemu bankowego. Biegle posługuje się bankowością elektroniczną. Dokonuje podstawowe obliczenia w zakresie określania kosztu pieniądza w czasie oraz ryzyka kursu waluty.',
                                  tasks: [
                                        'Wyliczyłem(-am) ratę równą i malejącą z kredytu oraz zaprezentowałem(-am), jakie są między nimi różnice. Uwzględniłem(-am) w takich obliczeniach element ryzyka kursu waluty oraz podałem(-am) stopę nominalnego oraz realnego jego oprocentowania, z uwzględnieniem wpływu stopy inflacji.',
                                        'Przygotowałem(-am) i ustawiłem(-am) odpowiednie zabezpieczenia dla transakcji zakupu dokonywanych poprzez Internet.',
                                        'Przygotowałem(-am) i przeprowadziłem(-am) grę ekonomiczną zawierającą elementy inwestowania (forma inwestycji, czas, płynność), oszczędzania oraz oceny ryzyka.',
                                        'Posługuję się biegle bankowością elektroniczną, realizując następujące działania:'
                                            '\n\n- dokonałem(-am) przelewu,'
                                            '\n\n- użyłem(-am) karty płatniczej,'
                                            '\n\n- ustanowiłem(-am) lokatę,'
                                            '\n\n- zapłaciłem(-am) przy użyciu dostępnego elektronicznego serwisu transakcyjnego (np. BLIK) wykorzystując do tego telefon. Przeanalizowałem(-am) na podstawie systemu bankowego strukturę swoich wydatków.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '8',
                        notesForLeaders: [
                              '<url>analizy.pl/inwestowanie-dla-poczatkujacych</url>',
                              '<url>edukacjagieldowa.pl/wp-content/uploads/2015/08/1.-Pierwsze-kroki-na-rynku-kapitałowym-KNF.pdf</url>',
                              '<url>edukacjagieldowa.pl/wp-content/uploads/2015/08/4.-ABC-inwestowania-w-fundusze-inwestycyjne-KNF.pdf</url>',
                              '<url>pekao.com.pl/biuro-maklerskie/klient-indywidualny.html#analiza-portfelowa</url>',
                              '<url>eurex.com/ex-en/education/simulated-trading</url>',
                              '<url>pl.khanacademy.org/economics-finance-domain/core-finance/stock-and-bonds/stocks-intro-tutorial/v/bonds-vs-stocks</url>',
                              'Symulator giełdy: <url>gragieldowa.pl</url>',
                        ],
                        sprawData: [
                              SprawData(
                                  id: 'makler',
                                  title: 'Makler',
                                  level: '3',
                                  comment: 'Zna podstawowe mechanizmy funkcjonowania giełdy oraz innych rynków finansowych. Na podstawie posiadanych informacji potrafi ocenić ryzyko oraz spodziewaną rentowność podejmowanych decyzji. W działaniu potrafi wykorzystać mapę ryzyka inwestycyjnego. ',
                                  tasks: [
                                        'Przygotowałem(-am) infografikę przedstawiającą strukturę rynku finansowego w Polsce oraz podmiotów na nim występujących. Infografika pozwoli zrozumieć zainteresowanym znaczenie podstawowych pojęć jak: rynek, giełda, notowanie, akcja, obligacja, dywidenda, dematerializacja oraz rolę podstawowych instytucji: KNF, GPW, KDPW, NBP, itp. Na podstawie infografiki przedstawiłem(-am) funkcjonowanie tego rynku swojej drużynie/zastępowi.',
                                        'Poznałem(-am) podstawowe indeksy giełdowe oraz rynki funkcjonujące na GPW oraz na głównych giełdach na świecie. W ciągu miesiąca prowadziłem(-am) analizę notowań wybranych spółek z tych rynków i oceniłem(-am) różnice poziomu opłacalności oraz ryzyka pomiędzy nimi wykorzystując do tego między innymi narzędzie, jakim jest mapa ryzyka.',
                                        'Sporządziłem(-am) mapę ryzyka oraz rentowności dla wybranych instrumentów finansowych (np. akcje vs. obligacje vs. jednostki uczestnictwa funduszy). Na jej podstawie podczas zbiórki drużyny/zastępu przeprowadziłem(-am) dyskusję na temat wyborów inwestycyjnych w kontekście osobistych preferencji co do akceptowanego poziomu ryzyka oraz oczekiwanych zysków. Wnioski dyskusji w ramach podsumowania uczestnicy odnieśli do innych sytuacji życiowych, poza rynkiem finansowym.',
                                        'Odwiedziłem(-am) portal wiedzy ekonomicznej z dziedziny finansów oraz giełdy, na którym wziąłem(wzięłam) udział w minimum dwóch grach edukacyjnych z dziedziny inwestowania na rynku finansowym. Zdobytą wiedzę wykorzystałem(-am), biorąc udział w grze giełdowej.',
                                  ]),
                              SprawData(
                                  id: 'makler',
                                  title: 'Makler',
                                  level: '4',
                                  comment: 'Zna zasady funkcjonowania giełdy oraz innych rynków finansowych i potrafi wykorzystać je praktycznie w podejmowanych decyzjach inwestycyjnych. Wykorzystał(-a) w działaniu wiedzę na temat zasad inwestowania oraz oceny ryzyka. Potrafi obliczyć rentowność instrumentów finansowych oraz wyjaśnić innym podstawowe pojęcia i zasady funkcjonowania rynków finansowych',
                                  tasks: [
                                        'Na podstawie dostępnych w Internecie materiałów przeprowadziłem(-am) dla członków drużyny test oceny skłonności do ryzyka inwestycyjnego.',
                                        'Dokonałem(-am) analizy ofert domów maklerskich i na jej podstawie otworzyłem(-am) własny rachunek inwestycyjny.',
                                        'Przeprowadziłem(-am) grę, dzięki której mogłem(-am) przedstawić uczestnikom podstawowe mechanizmy inwestowania oraz działania giełdy.',
                                        'Poznałem(-am) techniki gry na wybranej przez siebie części rynku finansowego i wybrałem(-am) najlepszą dla siebie. Następnie po zapoznaniu się z typami zleceń oraz dodatkowymi istotnymi warunkami transakcji podjąłem(podjęłam) decyzje inwestycyjne składając zlecenia kupna/sprzedaży. Oceniłem(-am) efekt swoich inwestycji w horyzoncie minimum trzech miesięcy, porównując go z wybranymi alternatywnymi możliwościami inwestycji oraz dokonując szacunku efektywności w horyzoncie długoterminowym.',
                                  ]),
                        ]
                    ),

              ]
          ),

          SprawGroupData(
              id: 'spraw_komputerowe',
              title: 'Komputerowe',
              familyData: [

                    // Tu można wrzucać rodziny sprawności z kategorii "sprawności komputerowe"
                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'komputerowiec',
                                  title: 'Komputerowiec',
                                  level: '1',
                                  comment: 'Potrafi wykonać podstawowe czynności na komputerze, wie jak w świadomy i bezpieczny sposób korzystać z sieci Internet.',
                                  tasks: [
                                        'Wykonałem(-am) jedną z podstawowych czynności na komputerze:'
                                            '\n\n- Napisałem(-am) prosty tekst w edytorze tekstu.'
                                            '\n\n- Przygotowałem(-am) prostą grafikę w edytorze grafiki.'
                                            '\n\n- Dostosowałem(-am) do swoich potrzeb jeden z programów, np. do oglądania multimediów lub przeglądania sieci. Znam jego nazwę i podstawowe ustawienia.',
                                        'Znalazłem(-am) informacje o wybranym zagadnieniu za pomocą dowolnej wyszukiwarki internetowej.',
                                        'Zapoznałem(-am) się z zasadami zdrowego korzystania z komputera (postawa, ergonomia, oświetlenie, przerwy itp.). Porównałem(-am) je z moimi przyzwyczajeniami i skorygowałem(-am) (w razie potrzeby) swoje nawyki.',
                                        'Poznałem(-am) zasady bezpiecznego korzystania z Internetu (ochrona prywatności, rozmowy z nieznajomymi, niebezpieczne strony) i przedstawiłem(-am) je osobom z mojego otoczenia (rodzina/znajomi/klasa/zastęp).',
                                  ]),
                              SprawData(
                                  id: 'komputerowiec',
                                  title: 'Komputerowiec',
                                  comment: 'W swobodny sposób porusza się po wybranym pakiecie biurowym (np. Word, Excel, PowerPoint). Zna i stosuje zasady kulturalnego zachowania się w sieci. Rozumie znaczenie nowoczesnych technologii i zagrożenia płynące z niewłaściwego ich wykorzystania.',
                                  level: '2',
                                  tasks: [
                                        'Korzystając z wybranego pakietu biurowego, wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- Przygotowałem(-am) prezentację multimedialną na wybrany temat.'
                                            '\n\n- Przygotowałem(-am) dokument tekstowy z wykorzystaniem podstawowych możliwości edytora tekstu (wypunktowanie i numeracja, wyrównanie tekstu, formatowanie tekstu, podział na akapity, wstawianie obrazów, tabel i wykresów, edycja marginesów i układu strony, druk dwustronny).'
                                            '\n\n- Przygotowałem(-am) arkusz kalkulacyjny z wykorzystaniem funkcji takich jak: tabele, formatowanie warunkowe, wykresy oraz kilku prostych formuł takich jak sumowanie, liczenie warunkowe.',
                                        'Zapoznałem(-am) się z netykietą, czyli zbiorem zasad zachowania się w Internecie. Stosuję je podczas codziennego użytkowania sieci.',
                                        'Korzystam z komputera zarówno do spędzania wolnego czasu czy komunikacji ze znajomymi, jak i zdobywania wiedzy i umiejętności. Przygotowałem(-am) zestawienie, ile czasu poświęcam na korzystanie z komputera i w jakich celach. Jeśli ten czas był nieodpowiedni, wprowadziłem(-am) potrzebne zmiany.',
                                  ]),
                              SprawData(
                                  id: 'komputerowiec',
                                  title: 'Komputerowiec',
                                  level: '3',
                                  comment: 'Posiada podstawowe umiejętności w zakresie obróbki graficznej zdjęć (np. przycinanie, zmiana rozmiaru) oraz rozszerzoną wiedzę z zakresu obsługi edytora tekstu. Podczas korzystania z sieci Internet zwraca szczególną uwagę na ochronę danych osobowych i praw autorskich.',
                                  tasks: [
                                        'Utworzyłem(-am) konto e-mailowe. Wykorzystuję podstawowe funkcje klienta pocztowego, m.in. ustawiłem(-am) podpis w wiadomości, przy wysyłaniu e-maili do wielu osób korzystam z opcji UDW.3',
                                        'Wykonałem(-am) co najmniej jedno z zadań:'
                                            '\n\n- Dokonałem(-am) komputerowej edycji zdjęć (zalecane bezpłatne oprogramowanie), np. naniesienia logo, wykadrowania zdjęcia, korekcji błędów, zmiany jasności/ kontrastu/ nasycenia kolorów. Moje harcerskie projekty są zgodne z Katalogiem Identyfikacji Wizualnej ZHP.'
                                            '\n\n- Dokonałem(-am) komputerowego montażu filmu (zalecane bezpłatne oprogramowanie).'
                                            '\n\n- Przygotowałem(-am) dokumenty z wykorzystaniem zaawansowanych funkcji edytora tekstu (np. nagłówek i stopka, interlinia, zapis równania i symboli matematycznych, przypisy, kolumny, wstawianie komentarzy, opracowanie własnego stylu, korzystanie z tzw. twardych spacji i podziałów strony).',
                                        'Podczas korzystania z sieci nie udostępniam swoich danych innym osobom lub portalom, jeśli nie ma uzasadnionej potrzeby. Zapoznałem(-am) się z zasadami ochrony moich danych i moimi prawami w sieci.',
                                        'Odpowiedzialnie korzystam z możliwości, które daje Internet, wykonałem jedno z poniższych zadań:'
                                            '\n\n- Poznałem(-am) zasady umożliwiające odróżnienie prawdziwych informacji od tzw. fake newsów i zaprezentowałem(-am) minimum 3 konkretne przykłady.'
                                            '\n\n- Szanuję prawa autorskie, w swoich pracach zawieram informacje o autorach i źródłach materiałów. Poznałem(-am) rodzaje licencji – zaprezentowałem(-am) minimum 3 przykłady.',
                                  ]),
                              SprawData(
                                  id: 'komputerowiec',
                                  title: 'Komputerowiec',
                                  level: '4',
                                  comment: 'Jest świadomym użytkownikiem/ świadomą użytkowniczką nowych technologii. Wykorzystuje je do wykonania projektu związanego z obszarem jego/jej zainteresowań.',
                                  tasks: [
                                        'Zainstalowałem(-am) i skonfigurowałem(-am) specjalistyczny program, który wykorzystuję w mojej pracy lub do realizacji moich zainteresowań.',
                                        'Zrealizowałem(-am) samodzielnie lub w zespole dowolny projekt informatyczny, np. zaprojektowałem(-am) stronę WWW, opracowałem(-am) urządzenie korzystające z systemu wbudowanego, stworzyłem(-am) aplikację internetową lub mobilną.',
                                        'Znam pojęcie hejtu i uczestniczyłem(-am) w projekcie/kampanii, która miała wpływ na ograniczenie tego zjawiska w sieci.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '2',
                        sprawData: [
                              SprawData(
                                  id: 'webmaster',
                                  title: 'Webmaster',
                                  level: '2',
                                  comment: 'Zna podstawy bezpiecznego korzystania z Internetu i zabezpieczania stron. Tworzy rozbudowane strony internetowe. Potrafi uruchomić serwer.',
                                  tasks: [
                                        'Stworzyłem(-am) prostą statyczną stronę WWW, wykorzystując język HTML i arkusz stylów CSS oraz zewnętrzne zasoby (np. obrazki).',
                                        'Postawiłem(-am) serwer WWW (np. Apache) na komputerze lub maszynie wirtualnej.',
                                        'Poznałem(-am) terminologię webową (np. protokół, serwer, host, ftp, domena, api) i sposób działania Internetu.',
                                        'Samodzielnie postawiłem(-am) stronę internetowym na wybranym systemie zarządzania treścią (Wordpress, Joomla!, PrestaShop, Drupal, Magento, itp.) i skonfigurowałem(-am) ją odpowiednio do swoich potrzeb.',
                                        'Poznałem(-am) metody bezpiecznego poruszania się po Internecie. Zapoznałem(-am) się z technologią VPN. Przeprowadziłem(-am) zbiórkę dla zastępu lub drużyny na temat bezpiecznego korzystania z Internetu, omawiając przy tym zalety sieci VPN.'
                                  ]),
                              SprawData(
                                  id: 'webmaster',
                                  title: 'Webmaster',
                                  level: '4',
                                  comment: 'Zna podstawy wybranego języka programowania webowego. Konfiguruje i stawia wymagające strony internetowe.',
                                  tasks: [
                                        'Stworzyłem(-am) prostą aplikację webową w wybranym języku backendowym z wykorzystaniem relacyjnych baz danych (np. MySQL, PostgreSQL, SQLite, Firebird).',
                                        'Stworzyłem(-am) stronę WWW z zawartością dynamiczną, wykorzystując języki HTML i JavaScript oraz arkusze stylów CSS z zachowaniem zasad RWD.',
                                        'Postawiłem(-am) serwer WWW na komputerze lub maszynie wirtualnej, zabezpieczyłem(-am) go i udostępniłem(-am) w sieci.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '3',
                        sprawData: [
                              SprawData(
                                  id: 'programista',
                                  title: 'Programista',
                                  level: '2',
                                  comment: 'Zna podstawy programowania. Zna składnię wybranego języka programowania. Tworzy proste programy w wybranym języku programowania',
                                  tasks: [
                                        'Poznałem(-am) podstawy algorytmów. Stworzyłem(-am) schemat blokowy na podstawie wybranego przez siebie procesu (np. proces zbierania i opłacania składek, proces decyzyjny w przypadku udzielania pierwszej pomocy, itp.).',
                                        'Zapoznałem(-am) się z definicją rekurencji oraz iteracji. Stworzyłem(-am) algorytm zawierający iterację i rekurencję.',
                                        'Napisałem(-am) prosty program w dowolnym języku programowania, który wyświetla tekst, wykonuje proste operacje oraz umożliwia wprowadzenie danych, np. z klawiatury.',
                                  ]),
                              SprawData(
                                  id: 'programista',
                                  title: 'Programista',
                                  level: '3',
                                  comment: 'Pisze praktyczne programy. Dba o jakość kodu oraz prawidłowo zarządza wersjonowaniem aplikacji.',
                                  tasks: [
                                        'Napisałem(-am) użyteczny w pracy harcerskiej program, wykorzystując wybrany paradygmat programowania (proceduralny, obiektowy, funkcyjny, logiczny itd.). Zaprezentowałem(-am) go wybranej grupie docelowej (zastępowi, zespołowi kwatermistrzowskiemu, zespołowi promocji itp.) i udostępniłem(-am) do wykorzystywania. Uwzględniłem(-am) informację zwrotną, ulepszając program.',
                                        'Napisałem prosty program w języku programowania innym niż wykorzystany w zadaniu 1.',
                                        'Zapoznałem(-am) się z wybranym systemem kontroli wersji, np. Git. Utworzyłem(-am) profil na platformie pozwalającej na prowadzenie zdalnej kontroli wersji (np. GitHub). Umieściłem(-am) na niej co najmniej jeden swój program.',
                                        'Stworzyłem lub istotnie ulepszyłem dokumentację programu przeznaczoną dla użytkownika.',
                                  ]),
                              SprawData(
                                  id: 'programista',
                                  title: 'Programista',
                                  level: '4',
                                  comment: 'Pisze złożone programy, wykorzystując gotowe narzędzia oraz frameworki. W swoich programach implementuje gotowe moduły oraz rozszerzenia.',
                                  tasks: [
                                        'Napisałem(-am) złożony program pomocny w pracy harcerskiej, wykorzystując wybrany framework (np. .NET, Symphony, Flask) w celu uniknięcia konieczności samodzielnego implementowania powszechnie wykorzystywanych funkcjonalności.',
                                        'Napisałem(-am) użyteczny w pracy harcerskiej program, wykorzystując wybrany paradygmat programowania (proceduralny, obiektowy, funkcyjny, logiczny itd.) inny niż w przypadku zadania 1.',
                                        'Pisząc program, użyłem bibliotek rozszerzeń spoza standardu wykorzystanego języka (np. systemy kolejkowania, bazy NoSQL).',
                                        'Zaprezentowałem(-am) stworzony program wybranej grupie docelowej (zastępowi, zespołowi kwatermistrzowskiemu, zespołowi promocji itp.) i udostępniłem(-am) do wykorzystywania. Uwzględniłem(-am) informację zwrotną, ulepszając program.',
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '4',
                        sprawData: [
                              SprawData(
                                  id: 'technik-informatyk',
                                  title: 'Technik Informatyk',
                                  level: '2',
                                  comment: 'Zna podstawowe urządzenia i elementy wchodzące w skład budowy komputera. Wie, za co odpowiadają. Doradza w doborze pamięci masowej oraz pamięci RAM w zależności od zastosowania i potrzeb użytkowników. Konfiguruje podstawowe urządzenia peryferyjne.',
                                  tasks: [
                                        'Poznałem(-am) budowę komputera (stacjonarnego lub laptopa). Zapoznałem(-am) się z najważniejszymi podzespołami komputera (zasilacz, płyta główna, pamięć, karta graficzna, procesor, itp.) i wiem, do czego służą. Sprawdziłem konfigurację używanego komputera, wykorzystując funkcjonalność systemu operacyjnego lub narzędzia dodatkowe. Przygotowałem(-am) opis swojego komputera, prezentując w nim najważniejsze informacje o każdym istotnym jego podzespole.',
                                        'Zapoznałem(-am) się z najważniejszymi pojęciami dotyczącymi sprzętu komputerowego. Zapoznałem(-am) się z rodzajami pamięci (RAM, ROM, pamięć masowa, cache), rodzajami pamięci masowej (HDD, SSD, pamięci Flash itp.). Doradziłem(-am) znajomemu/znajomej dobór odpowiedniej pamięci masowej dopasowany do jego/jej potrzeb.',
                                        'Zapoznałem/em się z podstawowymi rodzajami złącz (HDMI, DisplayPort, USB 2.0, USB 3.0, DVI, D-SUB itd.). Podłączyłem(-am) i skonfigurowałem(-am) dodatkowy monitor, drukarkę oraz inne dowolne urządzenie peryferyjne.',
                                  ]),
                              SprawData(
                                  id: 'technik-informatyk',
                                  title: 'Technik Informatyk',
                                  level: '3',
                                  comment: 'Zna fachową terminologię dotyczącą komputerów oraz różnice pomiędzy poszczególnymi wersjami i modelami podzespołów komputerowych. Konfiguruje pracę podzespołów komputera (procesora, karty graficznej) oraz urządzeń peryferyjnych.',
                                  tasks: [
                                        'Zapoznałem(-am) się z podstawowymi oznaczeniami najbardziej znanych modeli procesorów. Ręcznie zmieniłem(-am) taktowanie procesora w komputerze (np. w BIOS/UEFI), zaobserwowałem efekty (stabilność, szybkość działania, zużycie energii, temperatura procesora) i wyjaśniłem(-am) je.',
                                        'Zapoznałem(-am) się z rodzajami kart graficznych i ich oznaczeniami oraz wiem, do czego mogą zostać one wykorzystane. Wyjaśniłem parametry techniczne wybranej karty graficznej. Dobrałem(-am) kartę graficzną dopasowaną do wskazanych potrzeb, uwzględniając określony budżet (np. kartę przystosowaną do obróbki grafiki, gier, kryptowalut, itp.).',
                                        'Podłączyłem(-am) w komputerze stacjonarnym dodatkową kartę (np. graficzną), pamięć RAM oraz dysk pamięci masowej.',
                                  ]),
                              SprawData(
                                  id: 'technik-informatyk',
                                  title: 'Technik Informatyk',
                                  level: '4',
                                  comment: 'Zna zależności pomiędzy infrastrukturą komputerową. Samodzielnie składa komputery zarówno stacjonarne, jak i laptopy. Dobiera podzespoły komputera do potrzeb użytkownika.',
                                  tasks: [
                                        'Poznałem(-am) zależności wynikające ze współpracy poszczególnych podzespołów komputerowych. Złożyłem(-am) komputer stacjonarny od podstaw, samodzielnie montując takie rzeczy jak: płyta główna, procesor, karta graficzna, pamięć RAM oraz inne konieczne podzespoły.',
                                        'Zaprojektowałem(-am) zestaw komputerowy lub komputer przenośny spełniający wskazane wymagania i mieszczący się w określonym (realnym) budżecie. Dobrałem podzespoły (CPU, RAM, pamięć masową, karty rozszerzeń itd.), biorąc pod uwagę parametry współpracujących elementów (np. taktowanie pamięci) i dostępne do wykorzystania złącza',
                                        'Poznałem(-am) budowę przenośnych komputerów osobistych (laptopów, notebooków, ultrabooków, itp.). Rozłożyłem(-am) laptopa i wykonałem(-am) co najmniej jedno z zadań:'
                                            '\n\n- Wyczyściłem(-am) podzespoły komputera, wymieniłem(-am) pastę termoprzewodzącą pod procesorem i/lub kratą graficzną;'
                                            '\n\n- Wymieniłem(-am) w nim dysk i/lub pamięć RAM;'
                                            '\n\n- Wymieniłem(-am) matrycę wyświetlacza.'
                                            '\n\n Po wykonaniu tych działań, prawidłowo złożyłem(-am) komputer z powrotem.',


                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '5',
                        sprawData: [
                              SprawData(
                                  id: 'modelarz-3d',
                                  title: 'Modelarz 3D',
                                  level: '3',
                                  comment: 'Zna podstawy modelowania trójwymiarowego i zasady działania technologii druku 3D. Wykorzystuje je do produkcji drobnych przedmiotów przydatnych w codziennym życiu.',
                                  tasks: [
                                        'Dowiedziałem(-am) się, na czym polega druk 3D i jakie może mieć zastosowania. Skonfigurowałem(-am) drukarkę do prostego wydruku. Dowiedziałem(-am) się, czym są filament, hotend, extruder.',
                                        'Poznałem(-am) dowolny program do modelowania trójwymiarowego (np. Skrimarket Playground, Tinkercad). Wykonałem(-am) w nim model przedmiotu, który może się przydać w mojej drużynie (np. element wyposażenia harcówki albo harcerską ozdobę).',
                                        'Dowiedziałem(-am) się, jakie materiały mogą zostać wykorzystane jako filament. Sprawdziłem(-am), które z dostępnych filamentów są produkowane z surowców wtórnych.',
                                  ]),
                        ]
                    ),


              ]
          ),

          SprawGroupData(
              id: 'zaradnosc_zyciowa',
              title: 'Zaradność życiowa',
              familyData: [

                    // Tu można wrzucać rodziny sprawności z kategorii "sprawności wspierajace zaradność życiową"

              ]
          ),

          SprawGroupData(
              id: 'terenoznawstwo_i_turystyka',
              title: 'Terenoznawstwo i turystyka',
              familyData: [

                    // Tu można wrzucać rodziny sprawności z kategorii "sprawności dotyczące terenoznawstwa i turystyki"

              ]
          ),

          SprawGroupData(
              id: 'artystyczne',
              title: 'Artystyczne',
              familyData: [
                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'muzyk',
                                  title: 'Muzyk',
                                  level: '1',
                                  comment:'Gra na wybranym instrumencie. Potrafi zagrać kilka ulubionych utworów. Posługuje się zapisem nutowym.',
                                  tasks: [
                                        'Nauczyłem(-am) się grać na wybranym instrumencie. Przygotowałem(-am) wybrany utwór, który zaprezentowałem(-am) przed większym gronem (drużyną, rodziną).',
                                        'Zebrałem(-am) zbiór przynajmniej 5 ulubionych utworów, które potrafię zagrać na instrumencie (może być w postaci śpiewnika bądź zeszytu/segregatora nutowego).',
                                        'Zapisałem(-am) w formie nut gamę w tonacji C, nazwałem(-am) jej dźwięki. Powiedziałem(-am) czym są i do czego służą: klucz wiolinowy, krzyżyk, bemol, kasownik.',
                                  ]),
                              SprawData(
                                  id: 'muzyk',
                                  title: 'Muzyk',
                                  level: '2',
                                  comment:'Gra na wybranym instrumencie również w duecie/tercecie. Właściwie dobiera utwory do okoliczności. Zna najpopularniejsze utwory znanych kompozytorów.',
                                  tasks: [
                                        'W duecie (bądź w większym zespole) przygotowałem(-am) wybrany utwór muzyczny, który zaprezentowałem(-am) przed większym gronem (drużyną, rodziną).',
                                        'Przygotowałem(-am) zestaw piosenek związanych z tematem ogniska/kominku drużyny. Akompaniowałem(-am) podczas ich wykonywania.',
                                        'Rozpoznałem(-am) przynajmniej 5 utworów różnych kompozytorów – podałem(-am) nazwiska autorów.',
                                  ]),
                              SprawData(
                                  id: 'muzyk',
                                  title: 'Muzyk',
                                  level: '3',
                                  comment:'Bierze udział w konkursach/przeglądach muzycznych. Propaguje w swoim środowisku świat muzyki. Angażuje się w oprawę muzyczną wydarzeń harcerskich.',
                                  tasks: [
                                        'Wziąłem(wzięłam) udział w konkursie/przeglądzie muzycznym.',
                                        'Zorganizowałem(-am) wyjście zastępu lub drużyny na koncert (np. do filharmonii/opery/klubu muzycznego).',
                                        'Wziąłem(wzięłam) udział w przygotowaniu uroczystości harcerskiej, organizując oprawę muzyczną.',
                                  ]),
                              SprawData(
                                  id: 'muzyk',
                                  title: 'Muzyk',
                                  level: '4',
                                  comment:'Komponuje utwory. Rozwija swoją wiedzę w zakresie teorii muzyki tj. jej historii, zasad, kształcenia słuchu. Wie co się aktualnie dzieje w muzycznym świecie, szczególnie w Polsce. Propaguje tę wiedzę w swoim środowisku.',
                                  tasks: [
                                        'Skomponowałem(-am) własny utwór.',
                                        'Zorganizowałem(-am) spotkanie z muzyką dla drużyny bądź chętnych, podczas którego uczestnicy zapoznali się z dziejami muzyki oraz przykładowymi gatunkami bądź muzykiem go reprezentującym (np. spotkanie z jazzmanem).',
                                        'Zaangażowałem(-am) się w działalność muzyczną w moim otoczeniu (orkiestra symfoniczna, zespół muzyczny).',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '2',
                        sprawData: [
                              SprawData(
                                  id: 'gitarzysta',
                                  title: 'Gitarzysta',
                                  level: '2',
                                  comment:'Wykorzystuje gitarę do akompaniowania zastępowi lub drużynie.',
                                  tasks: [
                                        'Akompaniowałem(-am) drużynie przy wykonaniu minimum 5 piosenek (np. w czasie ogniska, na zbiórce).',
                                        'Nastroiłem(-am) gitarę przy pomocy stroika.',
                                        'Grając na gitarze wykorzystałem(-am) akordy barowe. Płynnie przechodziłem(-am) z nich na zwykłe i odwrotnie.',
                                  ]),
                              SprawData(
                                  id: 'gitarzysta',
                                  title: 'Gitarzysta',
                                  level: '3',
                                  comment:'Sprawnie wykorzystuje gitarę do akompaniowania drużynie na zbiórkach i występach.',
                                  tasks: [
                                        'Akompaniowałem(-am) drużynie przy wykonaniu minimum 15 piosenek. Poprowadziłem(-am) muzycznie co najmniej 3 ogniska/kominki.',
                                        'Akompaniowałem(-am) drużynie/zespołowi przy wykonaniu piosenki na scenie (np. na festiwalu, przeglądzie piosenki harcerskiej).',
                                        'Nastroiłem(-am) gitarę ze słuchu przy pomocy podanego dźwięku. Zestroiłem(-am) z sobą dwie gitary.',
                                        'Dobrałem tonację wykonywanego utworu do konkretnej grupy wykonawców. W tym celu przetransponowałem akordy z jednej tonacji do drugiej.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '3',
                        sprawData: [
                              SprawData(
                                  id: 'piosenkarz',
                                  title: 'Piosenkarz',
                                  level: '1',
                                  comment:'Chętnie śpiewa z drużyną. Inicjuje naukę nowych piosenek w zastępie. Wie jak dbać o swój głos, zna podstawowe zasady higieny głosu.',
                                  tasks: [
                                        'Rozpocząłem(-am) śpiew kilku piosenek na zbiórce zastępu i zaśpiewałem piosenkę w duecie.',
                                        'Nauczyłem(-am) zastęp 1 nowej piosenki.',
                                        'Systematycznie w czasie próby wykonywałem(-am) przed lustrem ćwiczenia techniczne ust, języka, brody ułatwiające poprawne artykułowanie i śpiewanie (np. szerokie otwieranie ust, odpowiednie układanie języka i brody).',
                                        'Zaśpiewałem(-am) przynajmniej 10 piosenek wybranych ze śpiewnika, z którego korzystam.',
                                  ]),
                              SprawData(
                                  id: 'piosenkarz',
                                  title: 'Piosenkarz',
                                  level: '2',
                                  comment:'Występuje jako solista. Doskonali swój warsztat śpiewaka',
                                  tasks: [
                                        'Wystąpiłem(-am) jako solista np. w szkolnym konkursie talentów, podczas szkolnego apelu czy festiwalu obozowego.',
                                        'Zaśpiewałem(-am) 10 piosenek z pamięci.',
                                        'Nauczyłem(-am) się poprawnego oddychania przeponą, umiem odpowiednio podeprzeć dźwięk korzystając z przepony oraz śpiewać tak, aby nie obciążać strun głosowych.',
                                        'Nauczyłem(-am) drużynę śpiewać 1 nową piosenkę (dobrą okazją są przygotowania do festiwalu obozowego lub innego występu).',
                                  ]),
                              SprawData(
                                  id: 'piosenkarz',
                                  title: 'Piosenkarz',
                                  level: '3',
                                  comment:'Występuje przed większą, nieznaną wcześniej publicznością. Pracuje nad osiągnięciem najlepszych dostępnych mu/jej możliwości wokalnych.',
                                  tasks: [
                                        'Wystąpiłem(-am) z przygotowanym wcześniej utworem/utworami w konkursie poza swoim najbliższym środowiskiem np. w konkursie międzyszkolnym, gminnym, ogólnopolskim lub na chorągwianym festiwalu harcerskim.',
                                        'Przygotowałem(-am) i wykonałem(-am) własną interpretację wokalną znanej piosenki harcerskiej.',
                                        'Brałem(-am) udział przynajmniej 3 razy w zajęciach z emisji głosu.',
                                        'Pokierowałem(-am) drużyną podczas przygotowania do wspólnego występu: dobrałem(-am) repertuar do możliwości drużyny, rozdzieliłem(-am) role, prowadziłem(-am) próby.',
                                  ]),
                              SprawData(
                                  id: 'piosenkarz',
                                  title: 'Piosenkarz',
                                  level: '4',
                                  comment:'Doskonali swoje możliwości wokalne. Zna różne style muzyczne. Na stałe jest zaangażowany/a w śpiew w zespole lub solo. Organizuje warsztaty wokalne.',
                                  tasks: [
                                        'Jestem solistą/solistką lub wokalistątką zespołu muzycznego czy chóru. Przynajmniej od 3 miesięcy uczestniczę w regularnych próbach i występach.',
                                        'Przez przynajmniej 6 miesięcy uczęszczałem(-am) na lekcje śpiewu/emisji głosu z profesjonalistą (mogą odbywać się w ramach przygotowań zespołu z zadania 1).',
                                        'Przeprowadziłem(-am) zajęcia wokalne dla harcerek i harcerzy z mojego szczepu lub hufca.',
                                        'Nauczyłem(-am) się i zaśpiewałem(-am) publicznie piosenkę spoza swojego obszaru zainteresowań muzycznych – w stylu, którego zwykle nie słucham, nie śpiewam.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '4',
                        sprawData: [
                              SprawData(
                                  id: 'aktor',
                                  title: 'Aktor',
                                  level: '2',
                                  comment:'Prezentuje publicznie swoje umiejętności aktorskie. Bierze udział w przedstawieniach lub zajęciach teatralnych.',
                                  tasks: [
                                        'Zaprezentowałem(-am) się przed publicznością w jednej z form aktorskich: monolog, dialog, pantomima, teatr radia, teatr lalek, teatr tańca.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- Wziąłem(wzięłam) udział w warsztacie teatralnym.'
                                            '\n\n- Wziąłem(wzięłam) udział w przedstawieniu lub nagraniu filmu lub słuchowiska przygotowanym przez drużynę.',
                                        'Wybrałem(-am) jedną z ról mojego ulubionego aktora/aktorki i odtworzyłem(-am) jej kilkuminutowy fragment przed członkami zastępu. Zadbałem(-am) o odpowiedni kostium i charakteryzację.',
                                  ]),
                              SprawData(
                                  id: 'aktor',
                                  title: 'Aktor',
                                  level: '3',
                                  comment:'Prezentuje się przed publicznością w różnych formach aktorskich. Bierze udział w poprzedzonych próbami przedstawieniach lub zajęciach kółka teatralnego.',
                                  tasks: [
                                        'Zaprezentowałem(-am) się przed publicznością w trzech różnych formach aktorskich np. monolog, dialog, pantomima, teatr radia, teatr lalek, teatr tańca.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- uczęszczałem(-am) na zajęcia/warsztaty teatralne przynajmniej przez 3 miesiące'
                                            '\n\n- wziąłem(wzięłam) udział w poprzedzonym próbami przedstawieniu lub nagraniu filmu lub słuchowisku przygotowanym przez drużynę.',
                                        'Wybrałem(-am) jedną z klasycznych ról (np. z dzieł Sofoklesa, Szekspira, Mickiewicza, Słowackiego, itp.) i odtworzyłem(-am) jej kilkuminutowy fragment przed członkami zastępu. Zadbałem(-am) o odpowiedni kostium i charakteryzację.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '5',
                        sprawData: [
                              SprawData(
                                  id: 'lalkarz',
                                  title: 'Lalkarz',
                                  level: '2',
                                  comment:'Bierze udział w przedstawieniach teatrzyku lalkowego, animując wybrany rodzaj lalki. Współtworzy przedstawienia odpowiadając za wybrane aspekty techniczne (wykonywanie lalek, dekoracji, instalacji, efektów).',
                                  tasks: [
                                        'Obejrzałem(-am) kilka spektaklów w teatrze lalek lub lalkowych programów telewizyjnych poznając teatr cieni i teatr przedmiotu, a także różne rodzaje lalek (np. kukły, pacynki, marionetki, jawajki, bunkaku, maski, lalki cieniowe).',
                                        'Zorganizowałem(-am) wraz z zastępem przedstawienie lalkowe dla rodziców, zuchów, kolegów z drużyny lub szkoły. Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- wykonałem(-am) lalki'
                                            '\n\n- urządziłem(-am) scenę: przygotowałem(-am) dekoracje lub instalację oświetleniową.',
                                        'Zagrałem(-am) rolę w teatrzyku lalkowym, animując lalką np. kukłą, pacynką, marionetką, jawajką, bunkaku, maską, lalką cieniową.',
                                        'Wywołałem(-am) w czasie występu efekty dźwiękowe (deszcz, burza, odgłosy zwierząt).',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '6',
                        sprawData: [
                              SprawData(
                                  id: 'wodzirej',
                                  title: 'Wodzirej',
                                  level: '3',
                                  comment:'Prowadzi ogniska, kominki i inne przedsięwzięcia kulturalne. Przewodzi śpiewom w drużynie. Prowadzi pląsy i zabawy.',
                                  tasks: [
                                        'Poprowadziłem(-am) kilka ognisk i kominków. Ustaliłem(-am) scenariusz, umiejętnie dobrałem(-am) repertuar, zaintonowałem(-am) piosenki.',
                                        'Przewodziłem(-am) w śpiewie drużyny podczas zbiórek i w czasie wycieczek.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- poprowadziłem jako konferansjer festiwal piosenki, w czasie którego wprowadziłem(-am) ciekawe przerywniki'
                                            '\n\n- zorganizowałem(-am) z zespołem bal harcerski lub zabawę taneczną, w czasie których prowadziłem(-am) ciekawe konkursy i zabawy.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '7',
                        sprawData: [
                              SprawData(
                                  id: 'recytator',
                                  title: 'Recytator',
                                  level: '2',
                                  comment:'Ćwiczy dykcję. Recytuje prozę i wiersze.',
                                  tasks: [
                                        'Zaprezentowałem(-am) członkom zastępu podstawowe ćwiczenia doskonalące dykcję.',
                                        'Obejrzałem(-am) na żywo lub na nagraniu trzy interpretacje prozy lub wierszy w wykonaniu profesjonalistów. Zinterpretowałem(-am) utwór poetycki lub prozatorski, dobierając barwę głosu, modulację, tempo i rytm.',
                                        'Wziąłem(wzięłam) udział w konkursie recytatorskim.',
                                        'Uczestniczyłem(-am) w przygotowaniu wieczoru poezji, prezentując swoje ulubione utwory.',
                                  ]),
                              SprawData(
                                  id: 'recytator',
                                  title: 'Recytator',
                                  level: '3',
                                  comment:'Doskonali swoje umiejętności recytatorskie, dzieli się swoim doświadczeniem z innymi. Organizuje przedsięwzięcia recytatorskie.',
                                  tasks: [
                                        'Przeprowadziłem(-am) dla kilku osób ćwiczenia dykcji w trakcie prób przed występem.',
                                        'Zinterpretowałem(-am) dwa utwory poetyckie oraz dwa utwory prozatorskie, dobierając barwę głosu, modulację, tempo i rytm.',
                                        'Pomogłem(-am) przygotować się do występu mniej doświadczonemu/ej recytatorowi/recytatorce np. nadzorując próby.',
                                        'Zorganizowałem(-am) wieczór poezji w szkole lub swoim środowisku harcerskim. Samodzielnie dokonałem(-am) wyboru utworów i rekomendowałem/ am recytatorów.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '8',
                        sprawData: [
                              SprawData(
                                  id: 'gawedziarz',
                                  title: 'Gawędziarz',
                                  level: '3',
                                  comment:'Opowiada gawędy w trakcie ognisk/kominków. W opowieściach posługuje się inspiracjami z legend i książek. Tworzy gawędy na podstawie konkretnych wydarzeń.',
                                  tasks: [
                                        'Opowiedziałem(-am) kilka gawęd podczas ogniska lub kominka zawierających morał lub przysłowie.',
                                        'Uwzględniłem(-am) w przynajmniej jednej gawędzie poznane wcześniej legendy lub opowieści ludowe.',
                                        'Opowiedziałem(-am) jedną z przeczytanych w czasie próby książek, zyskując zainteresowanie słuchaczy losami bohaterów.',
                                        'Opowiedziałem(-am) 3 gawędy: jedną na wskazany temat, drugą na podstawie zaobserwowanego wydarzenia i trzecią dostosowaną do sytuacji, w której się aktualnie znalazłem(-am).',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '9',
                        sprawData: [
                              SprawData(
                                  id: 'rezyser_teatralny',
                                  title: 'Reżyser Teatralny',
                                  level: '3',
                                  comment:'Przygotowuje różne przedstawienia do wystawienia, pełniąc rolę reżysera. Opracowuje scenariusze. Dobiera rekwizyty i dekoracje',
                                  tasks: [
                                        'Wraz z zastępem lub grupą kolegów przygotowałem(-am) do wystawienia (pełniąc rolę reżysera) sztukę lalkową, teatrzyk harcerski, program kabaretowy itp.',
                                        'Opracowałem(-am) scenariusz przedstawienia (własny lub adaptowany) i prowadziłem(-am) próby z zespołem.',
                                        'Dobrałem(-am) do przedstawienia rekwizyty i nadzorowałem(-am) powstanie dekoracji.',
                                  ]),
                              SprawData(
                                  id: 'rezyser_teatralny',
                                  title: 'Reżyser Teatralny',
                                  level: '4',
                                  comment:'Reżyseruje wybrane przez siebie sztuki lub inne przedstawienia. Dokonuje doboru aktorów. Udziela wskazówek aktorom.',
                                  tasks: [
                                        'Przygotowałem(-am) do wystawienia sztukę teatru dramatycznego (komedię lub tragedię), teatru lalek, teatru tańca lub pantomimę. Dobrałem(-am) aktorów i przeprowadziłem(-am) próby.',
                                        'Opracowałem(-am) reżyserię wybranej przez siebie sztuki lub programu, planując wykorzystanie sceny, ruch sceniczny, rolę muzyki i tańca w przedstawieniu i oczekiwania wobec scenografa.',
                                        'Udzieliłem(-am) wskazówek aktorom prezentującym się przed publicznością w jednej z form aktorskich: monologu, dialogu, pantomimie, teatrze radia, teatrze lalek, teatrze tańca.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '10',
                        sprawData: [
                              SprawData(
                                  id: 'rezyser_teatralny',
                                  title: 'Reżyser Teatralny',
                                  level: '3',
                                  comment:'Wykonuje kostiumy i detale scenograficzne. Kieruje wykonywaniem scenografii lub dekoracji.',
                                  tasks: [
                                        'Wykonałem jedno z poniższych zadań:'
                                            '\n\n- opracowałem(-am) scenografię do przedstawienia w sali i w plenerze, opracowałem(-am) rzuty do scenografii'
                                            '\n\n- zorganizowałem(-am) wykonanie / pokierowałem(-am) zespołami wykonującymi dekorację wystawy lub innej imprezy kulturalnej.',
                                        'Wykonałem(-am) detal scenograficzny, wykorzystując różne materiały.',
                                        'Wykonałem(-am) kilka różnych kostiumów do szkolnego lub harcerskiego przedstawienia.',
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '11',
                        sprawData: [
                              SprawData(
                                  id: 'filmowiec',
                                  title: 'Filmowiec',
                                  level: '3',
                                  comment:'Nagrywa filmy przy użyciu wybranego środka technicznego. Prezentuje je drużynie/znajomym. Zgłębia wiedzę na temat kina i dzieli się nią z innymi osobami.',
                                  tasks: [
                                        'Poznałem(-am) podstawowe zasady filmowania. Zgodnie z nimi udokumentowałem wydarzenie w drużynie, szkole lub rodzinie',
                                        'Rozróżniam gatunki filmowe. Dopasowałem(-am) je do odbiorcy proponując repertuar stosownie do upodobań moich znajomych.',
                                        'Nakręciłem(-am) film (telefonem komórkowym, aparatem, kamerą) według własnego scenariusza i przygotowałam/em go samodzielnie do prezentacji.',
                                        'Zorganizowałem(-am) w drużynie lub szczepie wieczór filmowy, wybierając wg własnego kryterium filmy, których treścią chce się podzielić z innymi.',
                                  ]),
                              SprawData(
                                  id: 'filmowiec',
                                  title: 'Filmowiec',
                                  level: '4',
                                  comment:'Kręci profesjonalne filmy przy użyciu wyposażenia filmowego i publikuje je w Internecie.',
                                  tasks: [
                                        'Poznałem(-am) podstawowe kadry filmowe (np. amerykański, pełny, bliski itp.) oraz ich zastosowanie. Wykorzystałem(-am) różne rodzaje kadrów kręcąc materiały do filmu.',
                                        'Zorganizowałem(-am) plan filmowy stosowny do danej okoliczności. Podzieliłem funkcje na planie i skoordynowałem pracę nad powstaniem harcerskiego filmu.',
                                        'Poznałem(-am) podstawowe zasady montowania filmu i wykorzystałem je do zmontowania nagranych materiałów.',
                                        'Opublikowałem(-am) film na wybranym portalu internetowym odpowiednio ustawiając jego kategorię, licencję i jakość.',
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '12',
                        sprawData: [
                              SprawData(
                                  id: 'plastyk',
                                  title: 'Plastyk',
                                  level: '1',
                                  comment:'Próbuje różnych rodzajów wyrazu artystycznego tworząc przedmioty lub prace ubarwiające życie w drużynie, w domu lub w szkole.',
                                  tasks: [
                                        'Wykonałem(-am) co najmniej 3 ozdobne strony do kroniki (np. stronę tytułową, wpisy zawierające ozdobne inicjały, rysunki itp.) trzema różnymi stylami i technikami lub trzy ilustracje na potrzeby drużyny, do swojego śpiewnika czy na potrzeby szkoły lub domu.',
                                        'Wykonałem(-am) drobne przedmioty ozdobne z prostych materiałów (karton, tworzywo leśne, sznurek owoce itp.) - na przykład zdobnictwo obozowe, rekwizyty do zbiórki, ozdoby na choinkę itd.',
                                        'Umiem posługiwać się farbami, wykorzystując resztki farb do końca zrealizowałem jedno z poniższych zadań:'
                                            '\n\n- wykonałem(-am) ozdobny napis właściwie zestawiając kolory'
                                            '\n\n- namalowałem(-am) obraz wypróbowując różne metody nakładania farby (mokry pędzel/suchy pędzel, kawałek kartonu/gąbka lub dowolne inne).'
                                            '\n\nWażne: w zadaniu chodzi o kreatywność, nie o technikę!',
                                  ]),
                              SprawData(
                                  id: 'plastyk',
                                  title: 'Plastyk',
                                  level: '2',
                                  comment:'Poszerza swoją wiedzę o sztuce. Poznaje i wykorzystuje zasady dobrego tworzenia, próbuje nowych rzeczy. Wykorzystuje swoje umiejętności na rzecz swojego środowiska harcerskiego.',
                                  tasks: [
                                        'Dowiedziałem(-am) się jak zrobić dobry plakat (Youtube, Google) i wykonałem(-am) co najmniej jeden plakat reklamowy na potrzeby zastępu lub drużyny wykorzystując zdobyte wskazówki.',
                                        'Poznałem(-am) zasady kompozycji oraz kompozycji kolorów. Zastosowałem(-am) je w dowolnej pracy. Przynajmniej jedno z dzieł powinno przedstawiać martwą naturę.',
                                        'Wyszukałem(-am) informacje na temat różnych technik artystycznych (pointylizm, makrama, asamblaż, kolaż, mozaika, sitodruk). Stworzyłem(-am) co najmniej 5 prac różnymi technikami - rysunki, plakaty i obrazy, loga, napisy (5 rodzajów) – wykorzystując to, czego się dowiedziałem(-am).',
                                        'Wykonałem(-am) ozdobę do harcówki lub totem obozowy.',
                                  ]),
                              SprawData(
                                  id: 'plastyk',
                                  title: 'Plastyk',
                                  level: '3',
                                  comment:'Poszerza swoją wiedzę o sztuce. Stosuje w praktyce wiedzę na temat kompozycji. Wykorzystuje nowe pomysły na sposoby kreatywnej ekspresji. Stosuje całościowe podejście podczas aranżacji przestrzeni. Wykorzystuje swoje umiejętności w pracy swojego środowiska harcerskiego.',
                                  tasks: [
                                        'Szukam informacji o dziełach sztuki – rzeźbie i malarstwie polskim. Wybrałem(-am) 10 dzieł, które podobają mi się najbardziej i zaprezentowałem(-am) je na zbiórce, wycieczce itp. w dowolnej formie.',
                                        'Wykonałem(-am) co najmniej 10 prac dowolną techniką, starając się zastosować takie, których jeszcze nie próbowałem(-am) (akwarela, tempera, tusz, papieroplastyka, kolaż, rysunek, olej, linoryt, gipsoryt, batik, monotypia, rzeźba w drewnie, w glinie, grafika komputerowa lub inne)',
                                        'Stworzyłem(-am) koncepcję/projekt dekoracji i kierowałem dekorowaniem obozu/sceny/harcówki na uroczystość itp.',
                                        'Zapoznałem(-am) się z podstawową terminologią dotyczącą typografii oraz zasadami operowania pustą przestrzenią (white space). Wiem, jaki wpływ na kompozycję ma używany krój pisma. Pozyskane informacje wykorzystałem(-am) tworząc materiał dla środowiska (np. plakat, ulotkę).',
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '13',
                        sprawData: [
                              SprawData(
                                  id: 'malarz',
                                  title: 'Malarz',
                                  level: '1',
                                  comment:'Maluje obrazy dowolną techniką malarską. Odwiedza wystawy/muzea i ogląda dzieła malarskie. Posługuje się barwami podstawowymi.',
                                  tasks: [
                                        'Skompletowałem(-am) zestaw podstawowych narzędzi do pracy: farby, paleta i pędzle. Opowiedziałem(-am) członkom zastępu, jak o nie dbam.',
                                        'Namalowałem(-am) 3 obrazy o dowolnej tematyce dowolną techniką.',
                                        'Odwiedziłem(-am) wystawę malarską/artystyczną.',
                                        'Wymieniłem(-am) barwy podstawowe, trzy kolory ciepłe i trzy kolory zimne.',
                                  ]),
                              SprawData(
                                  id: 'malarz',
                                  title: 'Malarz',
                                  level: '2',
                                  comment:'Uzyskuje pożądane kolory łącząc farby. W swoich pracach posługuje się kilkoma technikami malarskimi. Odwiedza wystawy malarskie, analizując wnikliwie wybrane dzieła. Zna twórczość wybranych malarzy.',
                                  tasks: [
                                        'Odpowiednio wymieszałem(-am) farby, aby uzyskać kolor: pomarańczowy, fioletowy, zielony, brązowy, szary. Wykorzystałem(-am), w tym celu tylko barwy podstawowe.',
                                        'Namalowałem(-am) minimum 5 obrazów, posługując się co najmniej dwiema technikami malarskimi np. akwarela, tempera, akryl.',
                                        'Odwiedziłem(-am) wystawę malarską, wybrałem(-am) jeden obraz i go opisałem(-am) (Co przedstawia dzieło? Co znajduje się na pierwszym, a co na drugim planie? Jaka jest kompozycja: statyczna czy dynamiczna, otwarta, czy zamknięta, diagonalna, horyzontalna, czy wertykalna? Jaką technikę zastosował artysta? Jaką paletą barw posłużył się artysta?)',
                                        'Wybrałem(-am) 3 dzieła ulubionego malarza. Porównałem(-am) je, wskazując po 3 podobieństwa i różnice.',
                                  ]),
                              SprawData(
                                  id: 'malarz',
                                  title: 'Malarz',
                                  level: '3',
                                  comment:'Bierze udział w plenerach malarskich. Tworzy swoje prace na różnych materiałach, dopasowując odpowiednią technikę. Odwiedza wystawy malarskie, szukając inspiracji do własnych prac. Propaguje wiedzę o epokach malarskich.',
                                  tasks: [
                                        'Wziął/wzięła udział w plenerze malarskim.',
                                        'Namalowałem(-am) minimum 7 obrazów na różnych materiałach (np. płótno, drewno, szkło), dopasowując odpowiednią technikę.',
                                        'Odwiedziłem(-am) wystawę malarską. Wybrałem(-am) element jednego obrazu, który mnie szczególnie zaciekawił. Namalowałem(-am) swój własny obraz zainspirowany wybranym fragmentem.',
                                        'Przygotowałem(-am) infografikę przedstawiającą dwie epoki malarskie. Infografika zawiera krótką charakterystykę każdej epoki, sylwetki co najmniej 4 artystów (po dwie dla każdej epoki), ciekawostki.',
                                  ]),
                              SprawData(
                                  id: 'malarz',
                                  title: 'Malarz',
                                  level: '4',
                                  comment:'Przygotowuje podłoże malarskie do swojej pracy. Wystawia własne obrazy w miejscu publicznym. Prowadzi szkicownik.',
                                  tasks: [
                                        'Przygotowałem(-am) infografikę przedstawiającą dwie epoki malarskie. Infografika zawiera krótką charakterystykę każdej epoki, sylwetki co najmniej 4 artystów (po dwie dla każdej epoki), ciekawostki.',
                                        'Namalowałem(-am) co najmniej 4 cykle obrazów poruszające różną tematykę. Zaprezentowałem(-am) je na wystawie w miejscu publicznym.',
                                        'Odwiedziłem(-am) minimum 5 wystaw malarskich (dopuszczalne są wizyty w muzeach online). Stworzyłem(-am) kopię wybranego dzieła.',
                                        'Prowadziłem(-am) szkicownik zawierający inspiracje i pomysły na kolejne obrazy.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '14',
                        sprawData: [
                              SprawData(
                                  id: 'rzezbiarz',
                                  title: 'Rzeźbiarz',
                                  level: '2',
                                  comment:'Poszerza swoją wiedzę o rzeźbiarstwie. Posługując się narzędziami rzeźbiarskimi wykonuje różne elementy zdobnictwa obozowego.',
                                  tasks: [
                                        'Zobaczyłem/ am co najmniej 5 pomników. Dowiedziałem(-am) się, kto jest ich autorem i jaką techniką zostały wykonane.',
                                        'Korzystając z narzędzi rzeźbiarskich do drewna (np. dłuta, rylce, tarniki) wykonałem(-am) na obozie element zdobnictwa obozowego rzeźbiony w drewnie.',
                                        'Wykonałem(-am) gipsowy model jednego z symboli harcerskich lub skautowych.',
                                  ]),
                              SprawData(
                                  id: 'rzezbiarz',
                                  title: 'Rzeźbiarz',
                                  level: '3',
                                  comment:'Poszerza swoją wiedzę o rzeźbiarzach i technikach ich pracy. Wykonuje różne obiekty przydatne w pracy jego środowiska harcerskiego.',
                                  tasks: [
                                        'Odwiedziłem(-am) co najmniej 3 muzea lub obiekty zabytkowe, w których odnalazłem rzeźby/płaskorzeźby reprezentujące co najmniej 3 okresy w sztuce. Dowiedziałem(-am) się, kto jest ich autorem i jaką techniką zostały wykonane.',
                                        'Wykonałem(-am) samodzielnie model obiektu z natury z odwzorowaniem charakterystycznych cech i proporcji wykorzystując do tego glinę, gips, drewno, itp.',
                                        'Wyrzeźbiłem(-am) przedmiot przydatny w pracy swojego środowiska harcerskiego (np. totem zuchowy, lilijkę lub krzyż harcerski na ścianę harcówki, popiersie patrona itp.).',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '15',
                        sprawData: [
                              SprawData(
                                  id: 'architekt_wnetrz',
                                  title: 'Architekt Wnętrz',
                                  level: '3',
                                  comment:'Rozpoznaje podstawowe style w architekturze. Popularyzuje wiedzę o ciekawych obiektach architektonicznych swojej okolicy. Projektuje przestrzeń pojedynczych pomieszczeń.',
                                  tasks: [
                                        'Rozpoznaję 6 podstawowych nowożytnych stylów w architekturze. Odwiedziłem(-am) znajdujące się w okolicy budowle charakterystyczne dla tych stylów i wypromowałem(-am) je w swoim środowisku poprzez fotorelację.',
                                        'Zorganizowałem(-am) wyprawę zastępu lub drużyny do ciekawego obiektu, opowiedziałem(-am) o cechach charakterystycznych tej budowli, jej stylu i historii.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- korzystając z programu do planowania przestrzeni lub odręcznie zaprojektowałem(-am) optymalne umeblowanie dla jednego pomieszczenia (np. swojego pokoju)'
                                            '\n\n- zaaranżowałem(-am) przestrzeń w jednym pomieszczeniu (np. harcówce) dobierając kolory ścian i elementy wystroju.',
                                  ]),
                              SprawData(
                                  id: 'architekt',
                                  title: 'Architekt',
                                  level: '4',
                                  comment:'Rozpoznaje dzieła różnych twórców swojego ulubionego stylu architektonicznego. Popularyzuje wiedzę o ciekawych obiektach architektonicznych swojego ulubionego twórcy. Projektuje przestrzeń mieszkania/domu.',
                                  tasks: [
                                        'Poznałem(-am) dzieła przynajmniej 5 twórców stylu, który lubię najbardziej. Wypromowałem(-am) je w swoim środowisku poprzez fotorelację z własnych podróży.',
                                        'Zorganizowałem(-am) wyprawę zastępu lub drużyny do innej miejscowości w celu zwiedzenia ciekawych budowli jednego ze swoich ulubionych architektów. Opowiedziałem(-am) zarówno o cechach charakterystycznych tej budowli i jej historii, jak i o innych dziełach tego twórcy, które podziwiam.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- korzystając z programu do planowania przestrzeni lub odręcznie zaprojektowałem(-am) kompleksowe umeblowanie dla mieszkania/domu;'
                                            '\n\n- zaaranżowałem(-am) przestrzeń w mieszkaniu/domu dobierając kolory ścian i elementy wystroju.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '16',
                        sprawData: [
                              SprawData(
                                  id: 'fotograf',
                                  title: 'Fotograf',
                                  level: '1',
                                  comment:'Wykonuje zdjęcia przy użyciu podstawowych funkcji aparatu/telefonu. Wybiera do publikacji zdjęcia z puli wykonanych fotografii.',
                                  tasks: [
                                        'Wykonałam/em portret osoby lub zjawiska przyrody.',
                                        'Wykonałam/em zdjęcie tematyczne, odpowiednio używając właściwych funkcji.',
                                        'Na biwaku lub obozie robiłam/em zdjęcia drużynie, następnie wybrałem(-am) najlepsze do publikacji.',
                                        'Posiadam własną kolekcję zdjęć. Wiem, jak o nią dbać (katalogowanie, opisywanie, bezpieczne przechowywanie).',
                                  ]),
                              SprawData(
                                  id: 'fotograf',
                                  title: 'Fotograf',
                                  level: '2',
                                  comment:'Kadruje i wykonuje zdjęcia przy użyciu dostępnych ustawień urządzenia. Rozwija swoją wiedzę z zakresu fotografii.',
                                  tasks: [
                                        'Poznałem(-am) urządzenia, dzięki którym mogę wykonać zdjęcia. Dowiedziałem(-am) się, na jakie parametry zwracać uwagę. Fotografując, stosowałam/em prawidłowe ustawienia.',
                                        'Wykonałem(-am) zdjęcia używając różnych kadrów dobranych do sytuacji.',
                                        'Fotografowałam/em podczas co najmniej 3 wydarzeń dotyczących drużyny lub szkoły. Zrobione i wyselekcjonowane zdjęcia udostępniałam/em.',
                                        'Przedstawiłam/em w drużynie/zastępie album lub galerię zdjęć przez siebie wykonanych.',
                                  ]),
                              SprawData(
                                  id: 'fotograf',
                                  title: 'Fotograf',
                                  level: '3',
                                  comment:'Wykonuje zdjęcia przy użyciu manualnych ustawień aparatu. Wykorzystuje swoje umiejętności na rzecz innych.',
                                  tasks: [
                                        'Wykonałem(-am) zdjęcia w trudnych warunkach np. w nocy, obiektów w ruchu.',
                                        'Poznałam/em budowę oraz rodzaje aparatów fotograficznych. Wiem, czym jest ogniskowa obiektywu. Dostosowałem(-am) jej długość do sytuacji.',
                                        'Pełniłem(-am) funkcję fotografa podczas wydarzenia harcerskiego.',
                                        'Posiadam własną kolekcję zdjęć i udostępniam ją publicznie.',
                                  ]),
                              SprawData(
                                  id: 'fotograf',
                                  title: 'Fotograf',
                                  level: '4',
                                  comment:'Wykonuje zdjęcia przy użyciu zaawansowanych ustawień aparatu np. balansu bieli, nasycenia. Koordynuje pracę zespołu fotografów.',
                                  tasks: [
                                        'Wykonałem(-am) udane zdjęcia w każdych warunkach (np. w ciemności, w ruchu, pod słońce) – za każdym razem dobierając ustawienia aparatu.',
                                        'Koordynowałam(-am) zespół fotografów podczas wydarzenia harcerskiego.',
                                        'Posiadam sprzęt niezbędny do realizacji skomplikowanych ujęć np. statyw, blendę.',
                                        'Mam swoich ulubionych fotografów. Zebrałem(-am) własne portfolio zdjęć inspirowanych ich twórczością.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '17',
                        sprawData: [
                              SprawData(
                                  id: 'grafik_komputerowy',
                                  title: 'Grafik Komputerowy',
                                  level: '2',
                                  comment:'Projektuje proste grafiki. Wykorzystuje programy graficzne do wykonania prac dla zastępu lub drużyny.',
                                  tasks: [
                                        'Zaprojektowałem(-am) prostą grafikę w dowolnym programie graficznym np. plakat, zaproszenie.',
                                        'Wykonałem(-am) ilustrację do kroniki drużyny używając dowolnego programu graficznego.',
                                        'Obrobiłem(-am) fotografię używając dowolnego programu graficznego lub aplikacji na telefon.',
                                  ]),
                              SprawData(
                                  id: 'grafik_komputerowy',
                                  title: 'Grafik Komputerowy',
                                  level: '3',
                                  comment:'Przygotowuje grafiki na potrzeby promocji zastępu lub drużyny lub innej organizacji pozarządowej. Tworzy grafiki w oparciu o Katalog Identyfikacji Wizualnej ZHP.',
                                  tasks: [
                                        'Przygotowałem(-am) grafikę promującą ważne wydarzenie: plakat i grafiki do mediów społecznościowych np. Facebook, Instagram. Zapoznałem(-am) się z pojęciem white space i wykorzystałem(-am) tę wiedzę podczas tworzenia projektów.',
                                        'Zaprojektowałem(-am) dowolny gadżet harcerski (np. przypinkę, kubek, naszywkę).',
                                        'Zaprojektowałem(-am) prostą infografikę, która porusza ważny, aktualny temat.',
                                        'Przygotowałem(-am) grafikę na potrzeby drużyny (np. ulotkę) w oparciu o Katalog Identyfikacji Wizualnej ZHP.',
                                  ]),
                              SprawData(
                                  id: 'grafik_komputerowy',
                                  title: 'Grafik Komputerowy',
                                  level: '4',
                                  comment:'Przygotowuje grafiki i wdraża do użytku. Przestrzega zasad korzystania z grafik, fotografii, krojów pisma zgodnie z prawem autorskim.',
                                  tasks: [
                                        'Przygotowałem(-am) listę lub repozytorium legalnych źródeł grafik, fotografii i krojów pisma (również tych zawierających polskie znaki). Wiem jak się nimi posługiwać zgodnie z obowiązującym prawem autorskim.',
                                        'Zaprojektowałem(-am) identyfikację wizualną obejmującą logo lub logotyp, papier firmowy, dwa gadżety i księgę znaku.',
                                        'Stworzyłem(-am) grafikę np. cyfrowy obraz, zaawansowaną grafikę wektorową, pattern, cyfrowy collage, broszurę informacyjną, rozbudowaną infografikę.',
                                        'Wykonałem zadanie „a”, w przypadku gdyby było to niemożliwe wykonałem zadanie „b”:'
                                            '\n\na) poprawie zinterpretowałem(-am) wytyczne od drukarni i prawidłowo przygotowałem(-am) pliki do produkcji (rozdzielczość, spad, przestrzeń kolorów, odpowiedni format zapisu, przygotowanie tekstu)'
                                            '\n\nb) wyjaśniłem(-am) różnicę pomiędzy programami do grafiki rastrowej, wektorowej, CMYK i RGB, wyjaśniłem(-am) pojęcie spadu drukarskiego poprawnie stosując go w tworzonych projektach.',
                                  ]),
                        ]
                    ),

              ]

          ),

          SprawGroupData(
              id: 'spoleczne_i_religijne',
              title: 'Społeczne i religijne',
              familyData: [
                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'obywatel',
                                  title: 'Obywatel',
                                  comment:'Aktywnie poznaje swój kraj.',
                                  level: '1',
                                  tasks: [
                                        'Znam historię godła i barw narodowych. Wiem, co oznaczają i potrafię się wobec nich zachować. Wywiesiłem(-am) flagę biało-czerwoną w dniu święta państwowego.',
                                        'Razem z zastępem lub drużyną zaśpiewałem(-am) hymn państwowy w czasie uroczystości.',
                                        'Posiadam mapę Polski, na której oznaczam miejsca, w których byłem(-am) (może być konturówka z magnesami, pocztówkami itp.).',
                                        'Zapoznałem(-am) się z częścią statutu szkoły, zawierającą prawa i obowiązki ucznia. Angażuje się w życie swojej szkoły/klasy. Wziąłem(Wzięłam) udział w choć jednym przedsięwzięciu szkolnym przygotowywanym przez klasę/samorząd szkolny.',
                                  ]),
                              SprawData(
                                  id: 'obywatel',
                                  title: 'Obywatel',
                                  comment:'Poznaje swoje państwo i zasady demokracji.',
                                  level: '2',
                                  tasks: [
                                        'Poznałem(-am) daty polskich świąt narodowych. Wiem, na pamiątkę jakich wydarzeń zostały ustanowione. Przygotowałem(-am) z zastępem zbiórkę z okazji jednego z nich.',
                                        'Wskazałem(-am) na mapie krainy geograficzne Polski. Jedną z nich zaprezentowałem(-am) na zbiórce zastępu.',
                                        'Poznałem(-am) zasady demokratycznych wyborów i etapy podejmowania decyzji. Wykonałem(-am) co najmniej jedno z zadań:'
                                            '\n\n- Przedstawiłem(-am) swoja sprawę na Radzie Drużyny.'
                                            '\n\n- Po wcześniejszym poznaniu programów wyborczych kandydatów, wziąłem(wzięłam) udział w głosowaniu w wyborach do samorządu uczniowskiego.',
                                        'Znam obszar swojej gminy. Posługując się planem swojej okolicy, dotarłem(-am) do urzędu gminy/miasta i dowiedziałem(-am) się, jakie sprawy można w nim załatwić.',
                                  ]),
                              SprawData(
                                  id: 'obywatel',
                                  title: 'Obywatel',
                                  comment:'Angażuje się w życie społeczności do których należy.',
                                  level: '3',
                                  tasks: [
                                        'Przeprowadziłem(-am) zwiad tematyczny w mojej „małej ojczyźnie” (np. poznając kulturę, historię, współczesne życie społeczne i gospodarcze, poznając ciekawe osoby, odkrywając mało znane miejsca, zapomniane pamiątki historyczne). Sporządziłem(-am) dokumentację zwiadu (np. opisy, wywiady, pamiątki, fotografie, spis lektur na wybrany temat). W interesujący sposób przedstawiłem(-am) wyniki zwiadu w drużynie.',
                                        'Wziąłem(wzięłam) udział w pracach samorządu klasowego lub szkolnego (chodzi o udział w przedsięwzięciu organizowanym przez samorząd, nie jest konieczne sprawowanie w nim funkcji).',
                                        'Przygotowałem(-am) się i podjąłem(podjęłam) funkcję w zastępie, drużynie lub szczepie.',
                                        'Dowiedziałem(-am) się, dlaczego ważne jest wyrażanie swojego zdania we wspólnych sprawach, zachęciłem(-am) swoich rodziców lub innych członków rodziny do uczestnictwa w wyborach lub głosowaniu w budżecie obywatelskim/partycypacyjnym.',
                                  ]),
                              SprawData(
                                  id: 'obywatel',
                                  title: 'Obywatel',
                                  comment:'Przygotowuje się do bycia dorosłym obywatelem RP. Śledzi aktualną sytuację na polskiej scenie politycznej. Promuje aktywność obywatelską oraz głosowanie w oparciu o rzetelną wiedzę.',
                                  level: '4',
                                  tasks: [
                                        'Poznałem(-am) najważniejsze fakty z najnowszej historii Polski. Odwiedziłem(-am) miejsce związane z takim wydarzeniem, by w pełni zrozumieć, jakie płyną z niego dla nas przesłania. Na wyprawę zabrałem(-am) drużynę/zastęp/przyjaciela/rodzinę.',
                                        'We współpracy z samorządem uczniowskim, przygotowałem(-am) szkolną akcję promującą aktywność społeczną i obywatelską.',
                                        'Poznałem(-am) podział polskiej sceny politycznej i programy wyborcze partii posiadających mandaty w parlamencie. Dowiedziałem(-am) się, jakie uprawnienia posiada Sejm i Senat RP. Zaprezentowałem(-am) członkom zastępu lub drużyny narzędzie do badania preferencji politycznych (np. Latarnik wyborczy).',
                                        'Wykonałem(-am) jedno z zadań:'
                                            '\n\n- Przeprowadziłem(-am) analizę lokalnych potrzeb i przygotowałem(-am) projekt do budżetu obywatelskiego/partycypacyjnego.'
                                            '\n\n- Zorganizowałem(-am) spotkanie z lokalnym radnym poświęcone potrzebom lokalnej młodzieży.',
                                        'Wiem, czym są organizacje typu watchdog. Nawiązałem(-am) kontakt z wybraną z nich i upowszechniłem(-am) w swoim środowisku efekty jej pracy.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '2',
                        sprawData: [
                              SprawData(
                                  id: 'europejczyk',
                                  title: 'Europejczyk',
                                  comment:'Posiada podstawową wiedzę na temat Unii Europejskiej, jej symboli i państw do niej należących. Swoją wiedzą dzieli się z rówieśnikami.',
                                  level: '1',
                                  tasks: [
                                        'Dowiedziałem(-am) się, czym jest Unia Europejska i od kiedy należy do niej Polska. Zdobyłem(-am) różne ciekawostki dotyczące państw należących do UE. Zaprezentowałem(-am) je w ciekawej formie rówieśnikom.',
                                        'Poznałem(-am) najważniejsze symbole Unii Europejskiej. Wykonałem(-am) jedno z zadań:'
                                            '\n\n- Odśpiewałem(-am) hymn Unii Europejskiej.'
                                            '\n\n- Zagrałem(-am) hymn Unii Europejskiej na instrumencie.'
                                            '\n\n- Wykonałem(-am) flagę europejską.',
                                        'Wiem, jakie kraje z najbliższego otoczenia mojego kraju są członkami Unii Europejskiej. Przygotowałem(-am) mapę Polski z zaznaczonymi zewnętrznymi granicami UE, które pokrywają się z granicami Polski.',
                                  ]),
                              SprawData(
                                  id: 'europejczyk',
                                  title: 'Europejczyk',
                                  comment:'Dostrzega wokół siebie wpływ członkostwa w UE na rozwój Polski. Propaguje wiedzę o UE.',
                                  level: '2',
                                  tasks: [
                                        'Przedstawiłem(-am) członkom zastępu dewizę/motto Unii Europejskiej. Przygotowałem(-am) z rówieśnikami (np. w zastępie) plakat prezentujący UE i jej motto.',
                                        'Poznałem(-am) ważne informacje dotyczące Unii Europejskiej oraz jej najważniejsze instytucje. Zorganizowałem(-am) konkurs wiedzy o UE i jej krajach członkowskich dla rówieśników.',
                                        'Znalazłem(-am) w swoim otoczeniu kilka inwestycji dofinansowanych z funduszy Unii Europejskiej. Na zbiórce zastępu przedstawiłem(-am) ich listę i wspólnie stworzyliśmy listę rankingową inwestycji najważniejszych dla naszej wspólnoty lokalnej.',
                                  ]),
                              SprawData(
                                  id: 'europejczyk',
                                  title: 'Europejczyk',
                                  comment:'Wie, czym jest integracja europejska oraz jakie obejmuje działania. Propaguje wśród grupy rówieśniczej wiedzę o kulturze innych państw UE. ',
                                  level: '3',
                                  tasks: [
                                        'Dowiedziałem(-am) się, czym była Deklaracja Schumana i jakie miała znaczenie w pokojowym jednoczeniu kontynentu. Wcieliłem(-am) się w rolę historyka i stworzyłem(-am) krótką notatkę przedstawiającą główne etapy tworzenia Unii Europejskiej. Dowiedziałem(-am) się, jakie kraje starają się obecnie przystąpić do Unii Europejskiej i jakie jeszcze warunki muszą spełnić. Wyniki swojej pracy zaprezentowałem(-am) publicznie.',
                                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                            '\n\n- Zapoznałem(-am) się z różnymi kulturami krajów należących do Unii Europejskiej uwzględniając zwyczaje, obrzędy i stroje ludowe. Przygotowałem(-am) na ten temat materiał, który został opublikowany.'
                                            '\n\n- Przeprowadziłem(-am) warsztaty wymiany międzykulturowej z drużyną z innego kraju UE.'
                                            '\n\n- Brałem(-am) udział w wydarzeniu propagującym kulturę państw członkowskich UE (np. Festiwal Kultury Europy).',
                                        'Dowiedziałem(-am) się, jakie wymogi należy spełnić, aby podróżować w Strefie Schengen. Zaplanowałem(-am) wycieczkę do jednego kraju ze strefy Schengen, uwzględniając walory turystyczne.',
                                  ]),
                              SprawData(
                                  id: 'europejczyk',
                                  title: 'Europejczyk',
                                  comment:'Wie, jak wygląda proces decyzyjny Unii Europejskiej oraz jakie są instytucje europejskie. Rozumie mechanizmy obrony Unii Europejskiej. Potrafi skorzystać z programów dotacyjnych UE.',
                                  level: '4',
                                  tasks: [
                                        'Poznałem(-am) zasady deklaracji bolońskiej. Skorzystałem(-am) z Europejskiej Sieci Informacji o Edukacji – EURYDICE. Na tej podstawie zebrałem(-am) informacje dotyczące możliwości i warunków podejmowania przez młodych Polaków nauki w wybranym kraju Unii Europejskiej. Zebrane materiały przedstawiłem(-am) swoim rówieśnikom.',
                                        'Dowiedziałem(-am) się, w jaki sposób Unia Europejska prowadzi swoją politykę migracyjną i azylową oraz jak wpływają one na bezpieczeństwo obywateli państw członkowskich. Zorganizowałem(-am) zbiórkę/spotkanie wędrownicze/instruktorskie na ten temat.',
                                        'Dowiedziałem(-am) się, jaka jest procedura podejmowania decyzji w Unii Europejskiej oraz jaka jest waga polskiego głosu. Przygotowałem(-am) dla drużyny/kręgu/wspólnoty wędrowniczej debatę nad przyszłością Europy, dotykając wyzwań, z jakimi współcześnie musi się ona zmagać.',
                                        'Nawiązałem(-am) kontakt z drużyną skautową z terenu Unii Europejskiej. Dowiedziałem(-am) się o ich zwyczajach, obrzędach i tradycjach. Zorganizowałem(-am) wspólną akcję, np. wzajemne odwiedziny, wspólny wyjazd, wymianę listów.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '3',
                        sprawData: [
                              SprawData(
                                  id: 'ekumenista',
                                  title: 'Ekumenista',
                                  comment:'Posiada podstawową wiedzę na temat wyznań chrześcijańskich w Polsce. Potrafi zachować się właściwie w ich przestrzeni sakralnej. ',
                                  level: '2',
                                  tasks: [
                                        'Dowiedziałem(-am) się, jak nazywa się świątynia i duchowny w wyznaniach chrześcijańskich działających w Polsce. Rozpoznałem(-am) ich stroje liturgiczne.',
                                        'Dowiedziałem(-am) się, jakie Kościoły i wspólnoty chrześcijańskie działają w mojej okolicy/regionie. Odwiedziłem(-am) (np. z rodzicami lub zastępem) świątynię, miejsce modlitwy lub cmentarz należące do jednego z nich (innego niż moje własne). Zastosowałem(-am) się do obowiązujących zasad ubioru i zachowania w miejscu kultu lub podczas ceremonii religijnej.',
                                        'Na zbiórce zastępu przedstawiłem(-am) tradycje i zwyczaje związane ze Świętami Wielkiejnocy lub Bożego Narodzenia w rzymskim katolicyzmie, prawosławiu i Kościołach ewangelickich w Polsce i innych krajach Europy.',
                                  ]),
                              SprawData(
                                  id: 'ekumenista',
                                  title: 'Ekumenista',
                                  comment:'Poznaje różnorodność chrześcijaństwa. Rozróżnia wyznania chrześcijańskie istniejące naświecie. Zna podobieństwa i różnice między nimi. Poznaje je w praktyce. Upowszechnia zasady właściwego zachowania w przestrzeni sakralnej i podczas ceremonii religijnych w różnych tradycjach wyznaniowych. ',
                                  level: '3',
                                  tasks: [
                                        'Poznałem(-am) typowe elementy architektury i wyposażenia oraz ich znaczenie w świątyniach wyznań chrześcijańskich tradycji wschodniej i zachodniej (np. ikonostas, carskie i diakońskie wrota, ikony, obrazy lub ich brak, ambona, osobne przestrzenie dla kobiet i mężczyzn). Przedstawiłem(-am) je na zbiórce zastępu.',
                                        'Pomogłem(-am) zorganizować wycieczkę zastępu lub drużyny do świątyni wyznawców wybranego wyznania lub obrządku (innych niż większości uczestników) i przedstawiłem(-am) informacje o niej. Przygotowałem(-am) członków zastępu lub drużyny pod względem właściwego ubioru i zachowania.',
                                        'Poznałem(-am) trzy wybrane inicjatywy ekumeniczne (np. Wigilijne Dzieło Pomocy Dzieciom, Tydzień Modlitw o Jedność Chrześcijan, Spotkania Młodych Taizé, Betlejemskie Światło Pokoju, Ekokościół, stworzenie ekumenicznego przekładu Pisma Świętego, Znaki Pamięci). Rozpropagowałem(-am) wiedzę o nich wśród rówieśników.',
                                        'Opowiedziałem(-am) mojemu zastępowi/grupie znajomych o Spotkaniach Młodych Taizé. Nauczyliśmy się trzech piosenek z Taizé, np. wykorzystując nagrania dostępne w Internecie.',
                                  ]),
                              SprawData(
                                  id: 'ekumenista',
                                  title: 'Ekumenista',
                                  comment:'Wie, jakie są założenia ruchu ekumenicznego. Rozumie przyczyny i rolę różnorodności w Chrześcijaństwie. Poznaje inne wyznania i szuka ich wspólnych cech. Upowszechnia ideę dialogu międzyreligijnego i ekumenizmu. ',
                                  level: '4',
                                  tasks: [
                                        'Na zbiórce zastępu lub drużyny zaprezentowałem(-am) w ciekawy sposób ideę i najważniejsze działania ruchu ekumenicznego, bazując na dokumentach Światowej Rady Kościołów lub Polskiej Rady Ekumenicznej. Przedstawiłem(-am) idee i sposób działania Wspólnoty z Taizé.',
                                        'Wziąłem(wzięłam) udział w nabożeństwie w ramach Światowego Tygodnia Modlitw o Jedność Chrześcijan, Europejskiego Spotkania Młodych lub w innym nabożeństwie ekumenicznym. Porozmawiałem(-am) z kilkorgiem jego uczestników o powodach, dla których zdecydowali się na udział.',
                                        'W odniesieniu do trzech Kościołów działających w Polsce (prawosławnego, rzymskokatolickiego i jednego z Kościołów ewangelickich), odszukałem(-am) najważniejsze informacje dotyczące zasad ich wiary: problematyki usprawiedliwienia, relacji człowieka z Bogiem i Kościołem, najważniejszych świąt, struktury, sposobu działania, największych ośrodków i sposobów prowadzenia działalności dobroczynnej. Zrobiłem(-am) to, zapoznając się z ich stronami internetowymi. Zastanowiłem(-am) się nad tym, jakie elementy są dla nich wspólne i pozwalają na współpracę.',
                                        'Wykonałem(-am) jedno z zadań:'
                                            '\n\n- Poznałem(-am) główne spory teologiczne w obrębie chrześcijaństwa. Zastanowiłem(-am) się nad ich konsekwencjami dla funkcjonowania społeczeństw. Poznałem(-am) najważniejsze inicjatywy na rzecz jedności chrześcijan. Przeprowadziłem(-am) w szczepie lub hufcu dyskusję na ten temat.'
                                            '\n\n- Poznałem(-am) ideę i historię ruchu ekumenicznego, w tym trudności, które w nim występują (np. relacje między Kościołami prawosławnymi a Kościołami ewangelickimi, negatywne nastawienie do idei ekumenizmu, problemy z różnym rozumieniem pojęć teologicznych). Podjąłem(podjęłam) refleksję na temat ich źródeł, w tym uwarunkowań kulturowych i społecznych. Przeprowadziłem(-am) w szczepie lub hufcu dyskusję na temat trudności i przyszłości ekumenizmu.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '4',
                        sprawData: [
                              SprawData(
                                  id: 'liturgista',
                                  title: 'Liturgista',
                                  comment:'Wie, czym jest liturgia. Posiada podstawową wiedzę na postaw i gestów liturgicznych.',
                                  level: '1',
                                  tasks: [
                                        'Pobożnie i aktywnie uczestniczyłem(-am) w nabożeństwie/mszy świętej/liturgii, starając się stanowić wzór dla innych.',
                                        'Poznałem(-am) podstawowe postawy i gesty liturgiczne. Wykazałem(-am) się ich znajomością asystując we mszy świętej.',
                                        'Przeprowadziłem(-am) dla zastępu zajęcia z musztry harcerskiej, zwracając uwagę na poprawność wykonywanych postaw i gestów.',
                                  ]),
                              SprawData(
                                  id: 'liturgista',
                                  title: 'Liturgista',
                                  comment:'Wie, czym kieruje się liturgia Kościoła. Angażuje się w jej przeżywanie.',
                                  level: '2',
                                  tasks: [
                                        'Poznałem(-am) strukturę roku liturgicznego. Wiem, kiedy się rozpoczyna i kończy i jak się nazywają jego główne okresy. Stworzyłem(-am) swój kalendarz liturgiczny. Zaznaczyłem(-am) na nim najważniejsze święta mojego wyznania. Wiem, które z tych świąt mają stały termin obchodów, a które są „ruchome”.',
                                        'Poznałem(-am) możliwości zaangażowania w przygotowanie liturgii. Pomogłem(-am) w organizacji wydarzenia religijnego (np. polowa msza święta) w hufcu/drużynie.',
                                        'Uczestniczyłem(-am) w budowie ołtarza polowego na obozie drużyny. Zadbałem(-am) o urządzenie tego miejsca tak, by atmosfera sprzyjała modlitwie.',
                                  ]),
                              SprawData(
                                  id: 'liturgista',
                                  title: 'Liturgista',
                                  comment:'Wie, dlaczego Eucharystia nazywana jest szczytem liturgii. Bierze czynny udział w organizowaniu mszy harcerskich/nabożeństw/liturgii.',
                                  level: '3',
                                  tasks: [
                                        'Poznałem(-am) strukturę mszy świętej/nabożeństwa/liturgii. Umiem wymienić jej części i dowiedziałem(-am) się, jakie postawy należy przyjąć w poszczególnych jej elementach. Przekazałem tę wiedzę młodszej osobie.',
                                        'Poznałem(-am) nazwy podstawowych paramentów liturgicznych (np. kielich, patena, palka, korporał, puryfikaterz, lavabo, trybularz). Przygotowałem(-am) ołtarz do sprawowania Eucharystii.',
                                        'Poznałem(-am) ceremoniał harcerski dotyczący uczestnictwa pocztu sztandarowego i drużyny reprezentacyjnej we mszy świętej/nabożeństwie/liturgii. Wystąpiłem(-am) w poczcie sztandarowym lub byłem proporcowym/proporcową w trakcie mszy świętej/nabożeństwa/liturgii.',
                                        'Obejrzałem(-am) wspólnie z rodziną/drużyną/zastępem film pt. „Największy z cudów” (2011), a następnie porozmawialiśmy o przesłaniu, jakie niesie film.',
                                  ]),
                              SprawData(
                                  id: 'liturgista',
                                  title: 'Liturgista',
                                  comment:'Współpracuje z kapelanami/duszpasterzami harcerskimi.',
                                  level: '4',
                                  tasks: [
                                        'Przygotowałem(-am) hufcowy/drużynowy „niezbędnik liturgiczny” dla mojego wyznania w formie broszury, który zawiera, np. opis obrzędu mszy, pieśni, piosenki harcerskie, które można wykorzystać w liturgii, sposoby zaangażowania w liturgię.',
                                        'Zadbałem(-am) wspólnie z chętnymi osobami o urządzenie na obozie/biwaku miejsca modlitwy (wyciszenia, skupienia), w którym każdy może realizować swoje potrzeby duchowe (np. ołtarz polowy, kapliczkę obozową, leśną "czytelnię" wartościowych książek dotyczących rozwoju duchowego).',
                                        'Przygotowałem(-am) wspólnie z kapelanem/duszpasterzem chorągwi/hufca wydarzenie religijne.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '5',
                        sprawData: [
                              SprawData(
                                  id: 'negocjator',
                                  title: 'Negocjator',
                                  comment:'Rozpoznaje różne rodzaje informacji, które do niego/niej docierają, potrafi rozdzielić je i wyłowić fakty. Wie, czym są: negocjacja, opinia, fakt, pogłoska, dane, przypuszczenie i potrafi je identyfikować w rozmowie. ',
                                  level: '2',
                                  tasks: [
                                        'Poznałem(-am) terminy: negocjacja, opinia, fakt, pogłoska, dane, przypuszczenie. Wyjaśniłem(-am) zastępowi relacje i różnice między nimi. W działaniach zastępu staram się by informacje były oparte na faktach i danych, a nie na pogłoskach i przypuszczeniach, i aby każdy miał okazje do wygłoszenia swojej opinii.',
                                        'Odnalazłem(-am) i przedstawiłem(-am) kilka przykładów opinii, faktu, pogłoski, danej, przypuszczenia znalezionych w mediach (źródła drukowane i elektroniczne).',
                                        'Rozpoznałem(-am) i nazwałem(-am) emocje, które pojawiły się podczas żywej rozmowy.',
                                        'Podczas emocjonującej debaty, zapanowałem(-am) nad swoimi emocjami, wybierając rzeczowy argument zamiast docinku.',
                                  ]),
                              SprawData(
                                  id: 'negocjator',
                                  title: 'Negocjator',
                                  comment:'Rozumie rolę emocji i wagę zarządzania nimi w rozmowie. Rozumie rolę moderatora rozmowy oraz wagę słuchania w tej roli. Łagodzi konflikty w otoczeniu.',
                                  level: '3',
                                  tasks: [
                                        'Poznałem(-am) fazy negocjacji prowadzące do porozumienia. Przedstawiłem(-am) zastępowi podstawowe zasady negocjacji.',
                                        'Przeprowadziłem(-am) dwa rodzaje debat dla zastępu, drużyny lub innej grupy. Przed debatami przygotowałem(-am) do nich uczestników.',
                                        'Ćwiczyłem(-am) rozpoznawanie emocji pojawiających się w gorących dyskusjach. Poprawnie nazwałem(-am) lub pomogłem(-am) nazwać je osobom rozmawiającym w trakcie dyskusji.',
                                        'Łagodziłem(-am) konflikty w otoczeniu różnymi sposobami, w ramach podsumowania omówiłem(-am) analizę przypadku dla kilku (min. 3) pozytywnie rozwiązanych sytuacji (nie identyfikując osób biorących w nich udział i dbając o ich anonimowość), identyfikując metody negocjacji, których użyłem(-am) do rozwiązania konfliktu.',
                                  ]),
                              SprawData(
                                  id: 'negocjator',
                                  title: 'Negocjator',
                                  comment:'Posiadaną wiedzę na temat metod negocjacji stale szlifuje, stosując ją w praktyce. Poszerza wiedzę dotyczącą rozmów, uczy się identyfikowania forteli erystycznych, aby poprawnie na nie reagować, a u siebie zastępować merytoryczną argumentacją. ',
                                  level: '4',
                                  tasks: [
                                        'Doprowadziłem(-am) do porozumienia między stronami konfliktu.',
                                        'Znam pojęcie erystyki. Zapoznałem(-am) się z dialektyką erystyczną Schopenhauera i potrafię zidentyfikować minimum 5 forteli w dyskusji i właściwie na nie zareagować, rozbrajając oponenta.',
                                        'Zauważam u siebie odruchowe zagrania erystyczne, zastępując je rzeczową, merytoryczną argumentacją. W czasie podsumowania sprawności wskazałem(-am), jakie chwyty erystyczne najczęściej musiałem u siebie ograniczać.',
                                        'Wziąłem(wzięłam) udział w warsztatach z zakresu Porozumienia Bez Przemocy lub przeczytałem(-am) książkę na ten temat.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '6',
                        sprawData: [
                              SprawData(
                                  id: 'dziennikarz',
                                  title: 'Dziennikarz',
                                  comment:'Ma świadomość, w jaki sposób relacjonuje się zdarzenia w środkach masowego przekazu. Orientuje się w bieżących wydarzeniach życia szkoły, drużyny oraz swojego kraju. Opracowuje krótsze i dłuższe relacje z życia środowiska, w którym funkcjonuje (zastęp, drużyna, szkoła).',
                                  level: '2',
                                  tasks: [
                                        'Poznałem(-am) różne rodzaje środków masowego przekazu. Za pomocą jednego z nich, uzyskałem(-am) bieżące informacje dotyczące mojego kraju. Podzieliłem(-am) się nimi z rówieśnikami, pozyskując ich opinie na ważne dla mnie tematy.',
                                        'Poznałem(-am) różne rodzaje mediów społecznościowych, za pomocą jednego z nich przedstawiłem(-am) wydarzenie z życia drużyny szerszej publiczności.',
                                        'Sporządziłem(-am) relacje z wydarzeń na podstawie opinii świadków i własnych doświadczeń. Wykorzystałem(-am) je do napisania wpisu do kroniki, gazetki szkolnej/bloga/fanpage lub strony drużyny.',
                                        'Napisałem(-am) dwa artykuły, dobierając odpowiednie ilustrujące je rysunki lub zdjęcia. Przedstawiłem(-am) je szerszej publiczności (np. w drużynie, klasie).',
                                        'Rozpoznałem(-am) fałszywą informacje, tzw. fake news. Postępując między innymi według następujących zasad: zapytałem(-am) eksperta, sprawdziłem(-am) datę, źródło oraz autora, przemyślałem(-am) własne uprzedzenia.',
                                  ]),
                              SprawData(
                                  id: 'dziennikarz',
                                  title: 'Dziennikarz',
                                  comment:'Wykazuje się obiektywizmem w tworzeniu artykułów/fotoreportaży. Upublicznia swoje teksty szerszej publiczności. Poznaje twórczość różnych reporterów.',
                                  level: '3',
                                  tasks: [
                                        'Podczas zbiórki zastępu zaprezentowałem(-am) cechy, jakimi powinni charakteryzować się dziennikarze oraz zasady, jakie obowiązują w ich zawodzie. Zaprezentowałem(-am) przykład rzetelnego dziennikarza/reportera.',
                                        'Przygotowałem(-am) relacje z biwaku, obozu drużyny lub innego dłuższego wyjazdu. Upubliczniłem(-am) je na blogu/fanpage lub stronie drużyny.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- Zapoznałem(-am) się z czterema reportażami (np. wojennymi, podróżniczymi).'
                                            '\n\n- Zapoznałem(-am) się z sześcioma felietonami na interesujący mnie temat.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- Przeprowadziłem(-am) wywiad z nauczycielem/specjalistą dotyczący jego pracy/pasji. Omówiłem(-am) swoje wyniki w zastępie/drużynie.'
                                            '\n\n- Wcieliłem(-am) się w rolę komentatora sportowego podczas meczu drużyny lub szkoły.',
                                        'Wykonałem(-am) jedno z poniższych zadań:'
                                            '\n\n- Poznałem(-am) zasady edycji i korekty tekstów, stosując je w swoich artykułach. Napisałem(-am) artykuł do gazetki szkolnej lub hufcowej.'
                                            '\n\n- Wykonałem(-am) fotoreportaż, publikując go w gazetce szkolnej lub hufcowej.',
                                  ]),
                              SprawData(
                                  id: 'dziennikarz',
                                  title: 'Dziennikarz',
                                  comment:'Rozumie znaczenie środków masowego przekazu dla zachowania wolności słowa. Wykorzystuje media, aby zdobyć potrzebne informacje. Wie, co to jest czwarta władza, na czym polega linia programowa redakcji i dostrzega rolę manipulacji w mediach. Świadomie upublicznia wytworzone przez siebie materiały.',
                                  level: '4',
                                  tasks: [
                                        'Przeprowadziłem(-am) debatę na temat znaczenia środków masowego przekazu dla zachowania wolności słowa. Przeanalizowałem(-am) sytuację prawną dziennikarzy. W czasie debaty wziąłem(wzięłam) pod uwagę represje wobec dziennikarzy ze strony różnych państw.',
                                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                            '\n\n- Napisałem(-am) minimum dwa artykuły do gazetki hufcowej lub prasy lokalnej.'
                                            '\n\n- Nakręciłem(-am) reportaż, który zaprezentowałem(-am) na forum szczepowym/hufcowym o problemach dotyczących mojego najbliższego środowiska lokalnego.'
                                            '\n\n- Sprawdziłem(-am) na YouTube kanały prowadzone przez harcerzy. Udało mi się nawiązać z nimi współpracę, tworząc wspólny film.',
                                        'Porównałem(-am) wiadomości dotyczące mojego kraju i świata na podstawie dwóch mediów o przeciwnych liniach programowych. Swoje przemyślenia przedstawiłem(-am) na forum drużyny.',
                                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                            '\n\n- Znalazłem(-am) minimum 10 przykładów działań public relations, wykorzystujące, m.in. technikę spinu (socjotechnika) i czarny PR. Przedstawiłem(-am) własne spostrzeżenia na forum drużyny lub szczepu.'
                                            '\n\n- Przeanalizowałem(-am) rolę plakatów, memów oraz motywatorów jako środków masowego przekazu. - Przedstawiłem(-am) własne spostrzeżenia na forum drużyny lub szczepu.'
                                            '\n\n- Porównałem(-am) gazety z XIX w., np. „Kurier Warszawski”, „Czas”, „Dziennik Wileński” ze współczesnymi gazetami. Znalezione podobieństwa i różnice przedstawiłem(-am) na forum drużyny lub szczepu.'
                                            '\n\n- Porównałem(-am) twórczość kilku różnych youtuberów, m.in. jak tworzą kontent i wchodzą w kontakt ze swoimi odbiorcami. Przedstawiłem(-am) własne spostrzeżenia na forum drużyny lub szczepu.',
                                  ]),
                        ]
                    ),
              ]
          ),

SprawGroupData(
id:'naukowe',
title: 'Naukowe',
familyData: [
SprawFamilyData(
id: '1',
notesForLeaders: [
'Spotkania ze skautami mogą być spotkaniami zdalnymi. Dalszy rozwój w tej dziedzinie powinien przebiegać poprzez zdobywanie certyfikatów językowych.',
],
sprawData:[
SprawData(
id: 'poliglota',
title: 'Poliglota',
level: '1',
comment: 'Wykazuje zainteresowanie językami, dba o higienę języka, poszerza swoją wiedzę językową.',
tasks: [
'Wyszukałem(-am) zadane słowa w słowniku języka obcego. Znalazłem(-am) definicje zadanych słów w słowniku języka polskiego, stosując zarówno słowniki książkowe, jak i cyfrowe.',
'Poznałem(-am) podstawowe zwroty w wybranych 4 językach i 20 słówek związanych z harcerstwem w dowolnym języku obcym.',
'Przez okres trwania próby uczyłem(-am) się wybranego języka obcego raz w tygodniu, we własnym zakresie (poza lekcjami szkolnymi).',
'Zidentyfikowałem(-am) błędy językowe, które powtarzam w mowie i piśmie, wybrałem(-am) dwa i się ich pozbyłem(-am).',
]
),
SprawData(
id: 'poliglota',
title: 'Poliglota',
level: '2',
comment: 'Pogłębia swoją wiedzę językową i stosuje ją w praktyce.',
tasks: [
'Pogłębiłem(-am) znajomość języka, którego się uczę, podczas kontaktów ze skautami z zagranicy pomagałem(-am) się z nimi porozumieć.',
'Poznałem(-am) słownictwo harcerskie w stopniu pozwalającym na opowiedzenie o organizacji harcerstwa w Polsce oraz typowych dla mojego środowiska aktywnościach harcerskich. Zaprezentowałem(-am) to podczas zajęć z danego języka, np. podczas omawiania hobby.',
'Znalazłem(-am) darmowe metody poszerzania znajomości języka i przez okres próby przynajmniej trzy razy w tygodniu korzystałem(-am) z jednego z nich (np. Duolingo, khan academy, kanały i zasoby sieciowe).',
'Wiem, czym są frazeologizmy i jak wpływają na trafność tłumaczeń. Przedstawiłem(-am) dowolnej grupie, jak złe dobranie tłumaczenia sprawia, że pojęcie traci sens (np. „Thank you from the mountain” i „z góry dziękuję”, „without garden” i „bez ogródek”, itp.), wymyślając kilka własnych przykładów.',
]
),
SprawData(
id: 'poliglota',
title: 'Poliglota',
level: '3',
comment: 'Porozumiewa się w co najmniej dwóch językach, znajomość językową wykorzystuje do ubogacania działania w środowisku.',
tasks: [
'Opanowałem(-am) na poziomie podstawowym co najmniej dwa języki obce. Nauczyłem(-am) innych podstawowych zwrotów w tych językach.',
'Przetłumaczyłem(-am) z języka obcego materiały pomocne w pracy harcerskiej, upowszechniając je w środowisku.',
'Znalazłem(-am) słowa, które w języku polskim i obcym pochodzą od jednego rdzenia, znalazłem(-am) jego pochodzenie i znaczenie. Opowiedziałem(-am) o nich członkom zastępu i wskazałem(-am), jak obce rdzenie mogły znaleźć się w tych językach.',
'Nawiązałem(-am) kontakt ze skautami z innego kraju poprzez dowolne medium. Wymieniłem(-am) informacje o ciekawych formach pracy, którymi podzieliłem(-am) się w swoim środowisku.',
]
)]
),
SprawFamilyData(
id: '2',
notesForLeaders: [
'Jeżeli zainteresowania naukowe zdobywają cego sprawność są zupełnie rozbieżne z potrzebami jego środowiska harcerskiego, może z drużynowym uzgodnić inny temat badań wynikający z zainteresowań zdobywa jącego sprawność.'
],
sprawData:[
  SprawData(
id: 'badacz',
title: 'Badacz',
level: '2',
comment: 'Poszukuje informacji różnymi metodami. Zebrane info rmacje wykorzystuje w działaniu.',
tasks: [
'Zapoznałem(-am) się z różnymi możliwościami wprowadzania zapytań i narzędziami wyszukiwania oferowanymi przez przeglądarki, za ich pomocą wyszukałem(-am) informacje dotyczące wybranego tematu i porównałem(-am) wiarygodność treści pochodzących z różnych źródeł, co pokazałem(-am) na dwóch przykładach.',
'Zidentyfikowałem(-am) jeden obszar wiedzy, który jest dla mnie trudny do zrozumienia. Dobierając odpowiednie publikacje lub zapytania w wyszukiwarce internetowej, znalazłem(-am) wyjaśnienie, które pozwoliło mi opanować i zrozumieć trudny temat.',
'Dowiedziałem(-am) się, dlaczego poznawanie argumentów z dwóch lub więcej punktów widzenia jest ważne. Do dwóch tematów znalazłem(-am) argumenty za obiema stronami problemu i zaprezentowałem(-am) je na zbiórce, dowiadując się, co myślą inni.',
'Zebrałem(-am) informacje, które wykorzystałem(-am) na zbiórce lub wyjeździe drużyny (np. ciekawostki o wybranej miejscowości, które opowiedziałem(-am) rówieśnikom).',
]
),
SprawData(
id: 'badacz',
title: 'Badacz',
level: '3',
comment: 'Wyszukuje wiarygodne informacje, weryfikując fakty. Wykorzystuje te umiejętności do znajdowania przydatnej wie dzy.',
tasks: [
'Na zbiórce zaprezentowałem(-am) wiarygodne źródła wiedzy w wybranym temacie i opowiedziałem(-am) o mechanizmach „zakotwiczenia i dostosowania”.',
'Poznałem(-am) portale lub publikacje związane z moim obszarem zainteresowań prezentujące wiarygodne informacje. Poznałem(-am) portale zajmujące się sprawdzaniem pochodzenia informacji i ich wiarygodnością. Zaprezentowałem(-am) je w drużynie lub zastępie.',
'Nauczyłem(-am) się wychwytywać i odróżniać opinię, hipotezę, dane, a także wyłapywać, kiedy informacja jest podawana w sposób tendencyjny lub stronniczy bądź jej część nie znajduje oparcia w faktach. Na zbiórce zademonstrowałem(-am) po 2 stwierdzenia z każdego z wymienionych rodzajów i pomogłem(-am) innym uczestnikom zbiórki je zaklasyfikować.',
'Na podstawie dogłębnych informacji z wybranej przez siebie dziedziny przeprowadziłem(-am) dowolną aktywność dla drużyny lub zastępu (zwiad, grę z fabułą opartą na wydarzeniach historycznych, warsztaty naukowe).',
]
),
SprawData(
id: 'badacz',
title: 'Badacz',
level: '4',
comment: 'Poszerza wiedzę o błędach i metodach poznawczych. Propaguje zdobywanie rzetelnej wiedzy.',
tasks: [
'Poznałem(-am) metody badawcze, potrafię odróżnić metody ilościowe i jakościowe oraz właściwie dobierać je do badanej cechy. Rozumiem, czym jest próba reprezentatywna, pozyskałem(-am) wiadomości o metodach jej doboru. Przeprowadziłem(-am) badania na temat ważny dla mojego środowiska harcerskiego, prezentując wyniki w formie raportu.',
'Przeprowadziłem(-am) lub wspierałem(-am) wydarzenie nakierowane na poszerzenie wiedzy w wybranym zakresie (np. noc naukową, wszechnicę, debatę naukową).',
'Oceniłem(-am), czy próba badawcza przedstawiona w artykule lub opisie badań była reprezentatywna i w jakim stopniu na jej podstawie można rozszerzyć wnioski z badania na różne populacje.',
'Wiem, czym są uprzedzenia poznawcze oraz modele mentalne, nauczyłem(-am) innych harcerzy korzystania z moich ulubionych modeli.',
]
)]
),
SprawFamilyData(
id: '3',
sprawData:[
  SprawData(
id: 'genealog',
title: 'Genealog',
level: '1',
comment: 'Poznaje swoich przodków.',
tasks: [
'Przeprowadziłem(-am) wywiad z rodzicami na temat ich rodziców i rodzeństwa. Na tej podstawie stworzyłem(-am) proste drzewo genealogiczne uwzględniające najbliższych krewnych.',
'W albumie rodzinnym (lub elektronicznym zbiorze zdjęć) odnalazłem(-am) co najmniej 3 zdjęcia wykonane przed moim urodzeniem. Opisałem(-am) dokładnie, kto się na nich znajduje i jakiego wydarzenia dotyczą.',
'Zdobyłem(-am) informacje na temat krewnych z mojego drzewa genealogicznego: kiedy się urodzili, gdzie się urodzil lub wychowali, gdzie pracowali lub się uczyli.',
]
),
SprawData(
id: 'genealog',
title: 'Genealog',
level: '2',
comment: 'Poznaje historię swojej rodziny.',
tasks: [
'Odtworzyłem(-am) drzewo genealogiczne swojej rodziny przynajmniej trzy pokolenia wstecz, korzystając np. z dokumentów rodzinnych.',
'Wykonałem(-am) co najmniej jedno zadanie:'
'\n\n- Uporządkowałem(-am) album rodzinny - opisałem(-am) zdjęcia i ułożyłem(-am) je chronologicznie.'
'\n\n- Ze zdjęć rodziny zrobiłem(-am) prezentację multimedialną i pokazałem(-am) na uroczystości rodzinnej.',
'Prowadziłem(-am) kronikę rodziny. Zapisałem(-am) w niej np. kilka ciekawych rodzinnych przygód, wywiady przeprowadzone ze starszymi członkami rodziny, słowniczek pierwszych słów młodszego rodzeństwa.',
]
),
SprawData(
id: 'genealog',
title: 'Genealog',
level: '3',
comment: 'Poznając historię swojej rodziny, poznaje historię Polski.',
tasks: [
'Drzewo genealogiczne swojej rodziny (co najmniej trzy pokolenia wstecz) uzupełniłem(-am) o opis i w miarę możliwości zdjęcie każdej osoby umieszczonej na nim.',
'Poznałem(-am) najważniejsze wydarzenia z historii mojej rodziny. Umieściłem(-am) je na osi czasu razem z najważniejszymi wydarzeniami z ostatnich 100 lat historii Polski.',
'Uporządkowałem(-am) dokumentację i pamiątki rodzinne (świadectwa, dyplomy, listy, pamiątki). Najciekawsze z nich pokazałem(-am) znajomym lub członkom zastępu lub drużyny.',
'Współorganizowałem(-am) i uczestniczyłem(-am) w rodzinnej wycieczce do miejsc ważnych dla rodziny (np. miejscowość, z której pochodzą przodkowie, kościół, w którym brali ślub, miejsce, gdzie poznali się rodzice, miejsce walki, w której uczestniczył ktoś z rodziny).',
]
),
SprawData(
id: 'genealog',
title: 'Genealog',
level: '4',
comment: 'Propaguje genealogię jako sposób na poznawanie historii Polski przez dzieje własnej rodziny.',
tasks: [
'Rozbudowałem(-am) drzewo genealogiczne swojej rodziny do przynajmniej czterech pokoleń wstecz.',
'Wykonałem(-am) co najmniej jedno zadanie:'
'\n\n- Wykorzystałem(-am) jeden z serwisów umożliwiający budowę drzewa genealogicznego do umieszczenia swojego w Internecie. Zaprosiłem(-am) innych członków rodziny do korzystania z niego.'
'\n\n- Opracowałem(-am) swoje drzewo genealogiczne w bogatej oprawie graficznej.',
'Wykonałem(-am) co najmniej jedno zadanie:'
'\n\n- Skorzystałem(-am) z zasobów archiwum państwowego, kościelnego lub prywatnego, aby uzupełnić wiedzę zawartą w moim drzewie genealogicznym.'
'\n\n- Skorzystałem(-am) z zasobów internetowych, aby uzupełnić wiedzę zawartą w moim drzewie genealogicznym.',
'Sporządziłem(-am) listę stron w Internecie przydatnych w pracach genealogicznych. Udostępniłem(-am) ją osobom zainteresowanym opracowaniem własnego drzewa genealogicznego.'
]
),]
),
SprawFamilyData(
id: '4',
sprawData:[
  SprawData(
id: 'historyk',
title: 'Historyk',
level: '2',
comment: 'Interesuje się tym, co było kiedyś.',
tasks: [
'Odwiedziłem(-am) w mojej miejscowości lub podczas wyjazdu dwa muzea poświęcone dawnym czasom. Opowiedziałem(-am) o jednej z obejrzanych wystaw.',
'Na podstawie różnych (minimum dwóch) dostępnych źródeł (pamiętniki, dokumenty, encyklopedia, przekaz ustny, itd.) sporządziłem(-am) notatkę o patronie drużyny, szkoły lub ulicy. Wykorzystałem(-am) ją na zbiórce lub w szkole.',
'Stworzyłem(-am) plansze historyczne ukazujące epoki historyczne lub okresy z historii harcerstwa (wraz z ich ramami czasowymi i charakterystycznymi elementami). Udostępniłem(-am) je w szkole, harcówce lub Internecie lub ozdobiłem(-am) swój pokój.',
'Przeczytałem(-am) beletrystyczną historyczną książkę dla dzieci (np. z serii: „Kroniki Archeo”, „Wojna oczami dzieci”, „Pan Samochodzik”, „Polscy superbohaterowie”, „Strażnicy historii”, „Zdarzyło się w Polsce”), najciekawszymi fragmentami podzieliłem(-am) się z zastępem.',
]
),
SprawData(
id: 'historyk',
title: 'Historyk',
level: '3',
comment: 'Poznaje historię swojego państwa. Korzysta ze źródeł historycznych (materialnych i niematerialnych).',
tasks: [
'Wykonałem(-am) jedno z zadań:'
'\n\n- Stworzyłem(-am) albumy starych fotografii mojej miejscowości lub okolicy i porównałem(-am) je z aktualnymi fotografiami na zasadzie „wczoraj i dziś”, dopisałem(-am) do nich merytoryczne komentarze lub opisy. Zaprezentowałem(-am) je zainteresowanym osobom.'
'\n\n- Obejrzałem(-am) film, w którym wskazałem(-am) niehistoryczne elementy na podstawie przeczytanej literatury. Przedstawiłem(-am) swoje obserwacje na forum drużyny.',
'Przeczytałem(-am) minimum dwie książki historyczne (naukowe lub popularnonaukowe). Zachęciłem(-am) innych do zapoznania się z nimi lub napisałem recenzję i udostępniłem(-am) ją w mediach społecznościowych.',
'Wykonałem(-am) jedno z zadań:'
'\n\n- Zrekonstruowałem(-am) urządzenie, przedmiot lub element stroju z dawnych czasów. Wykorzystałem(-am) go do przygotowania rekonstrukcji, gry lub zbiórki.'
'\n\n- Wykonałem(-am) grę planszową lub karcianą na temat interesujących mnie wydarzeń historycznych. Przeprowadziłem(-am) ją w drużynie lub klasie.',
'Odwiedziłem(-am) minimum cztery instytucje, w których poszerzyłem(-am) swoją wiedzę historyczną (np. muzeum, archiwum, biblioteka, zamek). Najciekawsze informacje przedstawiłem(-am) zastępowi lub drużynie w atrakcyjny sposób, osadzając je w odpowiedniej epoce historycznej.',
]
),
SprawData(
id: 'historyk',
title: 'Historyk',
level: '4',
comment: 'Bierze udział w wydarzeniach upamiętniających historię. Poznaje literaturą historyczną. Propaguje historię w swoim środowisku rówieśniczym, lokalnym. Współpracuje z instytucjami krzewiącymi historię. Ma pierwsze osiągnięcia naukowe.',
tasks: [
'Wykonałem(-am) jedno z zadań:'
'\n\n- Nawiązałem(-am) współpracę z grupą rekonstrukcyjną odtwarzającą interesujący mnie okres historyczny.'
'\n\n- Nawiązałem(-am) współpracę z instytucją krzewiącą historię.',
'Wykonałem(-am) jedno z zadań:'
'\n\n- Zorganizowałem(-am) rajd, wycieczkę lub wyjście do muzeum lub spacer historyczny, podczas którego pełniłem(-am) funkcję przewodnika.'
'\n\n- Zorganizowałem grę lub rajd historyczny dla patroli harcerskich (zastępów lub drużyn).',
'Wykonałem(-am) jedno z zadań:'
'\n\n- Wraz z zespołem przygotowałem(-am) wystawę historyczną (np. na temat historii mojej miejscowości lub wybranego jej epizodu, historii mojego środowiska harcerskiego).'
'\n\n- Zainicjowałem(-am) i przeprowadziłem(-am) inscenizację wybranego wydarzenia historycznego.',
'Wykonałem(-am) jedno z zadań:'
'\n\n- Odkryłem(-am) i poznałem(-am) zapomniane lub mało znane miejsca historyczne (np. z działań wojennych z, wojny polsko-bolszewickiej, czasów zaborów i powstań, z historii harcerstwa), z pomocą wszystkich dostępnych źródeł historycznych opisałem(-am) miejsce, zaopiekowałem(-am) się nim. Swoje osiągnięcia i wnioski upubliczniłem(-am) dla większej społeczności (np. na portalu Otwarte Zabytki, Harcerska mapa Niepodległej itp.).',
'\n\n- Napisałem(-am) artykuł dotyczący interesującego mnie wydarzenia historycznego, korzystając z wybranej nauki pomocniczej historii (np. paleografia, numizmatyka, archiwistyka, heraldyka) oraz minimum czterech różnych źródeł. Opublikowałem(-am) artykuł w wybrany sposób.',
]
),
]
),
SprawFamilyData(
id: '5',
notesForLeaders: [
'Ta sprawność dotyczy wiedzy i umiejętności związanych z poznawaniem różnorodności kultury w Polsce. Informacji i specjalistów można szukać w każdym muzeum etnograficznym lub skansenie.'
],
sprawData:[
  SprawData(
id: 'etnograf',
title: 'Etnograf',
level: '2',
comment: 'Wie, czym jest etnografia. Zna główne grupy etnograficzne w Polsce.',
tasks: [
'Dowiedziałem(-am) się, czym jest etnografia. Uzasadniłem(-am), czemu badanie i zachowywanie kultury jest ważne.',
'Poznałem(-am) kilka grup etnograficznych np. Kaszubów, Ślązaków, Podhalan, Mazurów. Dowiedziałem(-am) się, czym się wyróżniają i gdzie mieszkają.',
'Byłem(-am) w skansenie lub muzeum etnograficznym. Porównałem(-am) wiedzę tam zdobytą z wcześniej poznaną grupą etnograficzną. Opowiedziałem(-am) o swoich wrażeniach zastępowi.',
]
),
SprawData(
id: 'etnograf',
title: 'Etnograf',
level: '3',
comment: 'Wie, czym jest kulturowe dziedzictwo materialne i niematerialne. Poznaje różnorodność kultury w Polsce.',
tasks: [
'Odszukałem(-am) elementy różnorodnego dziedzictwa kulturowego (np. język, architektura, organizacje społeczne, sztuka, elementy stroju) w Polsce z kręgu co najmniej czterech kultur, np. żydowskiej, niemieckiej, czeskiej, ukraińskiej, litewskiej.',
'Odwiedziłem(-am) przynajmniej jedno miejsce lub wydarzenie związane z kulturą ludową (np. skansen, muzeum, wydarzenie związane z doroczną obrzędowością), dowiadując się czegoś o sposobie życia i zwyczajach ludzi. Wyniki zaprezentowałem(-am) na zbiórce.',
'Wykonałem(-am) określoną czynność metodą tradycyjną, np. haft, wyplecenie koszyka, wyrób masła.',
'Rozmawiałem(-am) z etnologiem lub antropologiem kultury na temat różnorodności kulturowej Polski i jej poznawania.',
]
),
SprawData(
id: 'etnograf',
title: 'Etnograf',
level: '4',
comment: 'Poszerza wiedzę etnograficzną na podstawie rozmów i literatury. Propaguje pozyskaną wiedzę.',
tasks: [
'Przeprowadziłem(-am) zwiad etnograficzny, odwiedzając wybraną społeczność i dowiadując się o jej sposobie życia.',
'Zapoznałem(-am) się z gwarą lub dialektem wybranego regionu lub językiem mniejszości zamieszkującej na tym terenie. Nauczyłem(-am) się wiersza lub piosenki w wybranej gwarze, dialekcie lub języku i rozumiem o czym jest utwór.',
'Dowiedziałem(-am) się, czym jest kultura i jakie są jej przejawy w sferze materialnej (np. strój, zdobnictwo) i symbolicznej (np. język, gesty, zwyczaje).',
'Przeprowadziłem(-am) zajęcia dla wędrowników na temat kultury, jej poznawania i rozumienia.',
]
),
]
),
SprawFamilyData(
id: '6',
sprawData:[
  SprawData(
id: 'astronom',
title: 'Astronom',
level: '1',
comment: 'Spogląda w górę i widzi gwieździste niebo nad głową, które go zachwyca i zaciekawia.',
tasks: [
'Odwiedziłem(-am) planetarium, wziąłem(wzięłam) udział w pokazie tematycznym.',
'Wskazałem(-am) na nocnym niebie gwiazdozbiór Wielkiej i Małej Niedźwiedzicy wraz z Gwiazdą Polarną. Nauczyłem członków mojego zastępu znajdować ją.',
'Zaobserwowałem(-am) na niebie przynajmniej jedną planetę Układu Słonecznego.',
]
),
SprawData(
id: 'astronom',
title: 'Astronom',
level: '2',
comment: 'Zdobywa podstawową wiedzę z zakresu astronomii, uczy się obserwacji nieba i zjawisk astronomicznych.',
tasks: [
'Korzystałem(-am) z mapy nieba, aby zidentyfikować gwiazdozbiory i najjaśniejsze gwiazdy. Za jej pomocą wyznaczyłem(-am) również układ gwiazd o różnych porach roku i nocy.',
'Wskazałem(-am) na niebie minimum 8 podstawowych gwiazdozbiorów, w tym jeden charakterystyczny dla nieba letniego i jeden dla nieba zimowego.',
'Pogłębiłem(-am) swoją wiedzę z zakresu astronomii, np.: wiem, jakie planety tworzą układ słoneczny, co oznaczają pojęcia: galaktyka, droga mleczna, mgławica, kometa, meteor, rok świetlny, satelita, zaćmienie słońca i księżyca itp. Dla zastępu przeprowadziłem(-am) zbiórkę (lub blok zajęć na biwaku lub obozie) z astronomii, podczas której zapoznałem(-am) innych z podstawowymi zjawiskami astronomicznymi i zasadami obserwacji nieba.',
]
),
SprawData(
id: 'astronom',
title: 'Astronom',
level: '3',
comment: 'Astronomia go wabi i nurtuje. Stawia nowe pytania i szuka odpowiedzi na nie. Poszukuje i obserwuje.',
tasks: [
'Skorzystałem(-am) z programów komputerowych do nauki astronomii i obserwacji nieba (np. Stellarium, Stark Walk 2, Sky Safari czy NASA itp.), by na bieżąco śledzić zjawiska astronomiczne.',
'Zorganizowałem(-am) dla harcerzy „noc pod gwiazdami”, podczas której zapoznałem(-am) ich z podstawowymi konstelacjami nieba i ciałami niebieskimi.',
'Zgromadziłem(-am) biblioteczkę popularnonaukową. Na bieżąco śledziłem(-am) portale astronomiczne. Podczas realizacji sprawności śledziłem(-am) wydarzenia lub zjawiska astronomiczne: np. zaćmienie księżyca, przelot stacji kosmicznej, przelot komety, fazy księżyca.',
'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
'\n\n- Zorganizowałem(-am) dla drużyny przegląd kina „kosmicznego”: np. Apollo 13, Grawitacja, Interstaller, Marsjanin.'
'\n\n- Zorganizowałem(-am) wyjazd zastępu lub drużyny do planetarium lub obserwatorium astronomicznego.'
]
),
SprawData(
id: 'astronom',
title: 'Astronom',
level: '3',
comment: 'Astronomia jest jego pasją, a niebo ma przed nim coraz mniej tajemnic.',
tasks: [
'Skorzystałem(-am) z programów komputerowych do nauki astronomii i obserwacji nieba (np. Stellarium, Stark Walk 2, Sky Safari czy NASA itp.), by na bieżąco śledzić zjawiska astronomiczne.',
'Zorganizowałem(-am) dla harcerzy „noc pod gwiazdami”, podczas której zapoznałem(-am) ich z podstawowymi konstelacjami nieba i ciałami niebieskimi.',
'Zgromadziłem(-am) biblioteczkę popularnonaukową. Na bieżąco śledziłem(-am) portale astronomiczne. Podczas realizacji sprawności śledziłem(-am) wydarzenia lub zjawiska astronomiczne: np. zaćmienie księżyca, przelot stacji kosmicznej, przelot komety, fazy księżyca.',
'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
'\n\n- Zorganizowałem(-am) dla drużyny przegląd kina „kosmicznego”: np. Apollo 13, Grawitacja, Interstaller, Marsjanin.'
'\n\n- Zorganizowałem(-am) wyjazd zastępu lub drużyny do planetarium lub obserwatorium astronomicznego.'
]
),
SprawData(
id: 'astronom',
title: 'Astronom',
level: '1',
comment: 'Astronomia jest jego pasją, a niebo ma przed nim coraz mniej tajemnic.',
tasks: [
'Odwiedziłem(-am) planetarium, wziąłem(wzięłam) udział w pokazie tematycznym.',
'Wskazałem(-am) na nocnym niebie gwiazdozbiór Wielkiej i Małej Niedźwiedzicy wraz z Gwiazdą Polarną. Nauczyłem członków mojego zastępu znajdować ją.',
'Zaobserwowałem(-am) na niebie przynajmniej jedną planetę Układu Słonecznego.',
]
),
]
),
SprawFamilyData(
id: '7',
sprawData:[
  SprawData(
id: 'geolog',
title: 'Geolog',
level: '2',
comment: 'Poznaje pracę geologów. Powiększa zbiór skał i minerałów.',
tasks: [
'Nauczyłem(-am) się rozróżniać kilka rodzajów skał. Zaprezentowałem(-am) członkom zastępu swoje zbiory skał i minerałów.',
'Skompletowałem(-am) sprzęt do prac terenowych związanych ze zbieraniem okazów skał i minerałów (m.in. młotek, dłuto, łopatka, lupa).',
'Podczas rajdu lub wycieczki drużyny wskazałem(-am) 3 charakterystyczne formy terenu, wraz z komentarzem na temat ich pochodzenia (formy erozji lub akumulacji rzecznej, lodowcowej, eolicznej).',
]
),
SprawData(
id: 'geolog',
title: 'Geolog',
level: '3',
comment: 'Uprawia geoturystykę - odwiedza miejsca, gdzie może rozwijać swoją wiedzę geologiczną.',
tasks: [
'Zlokalizowałem(-am) i odwiedziłem(-am) w swoim regionie min. 3 stanowiska geologiczne różnego typu. Przedstawiłem(-am) dokumentację zdjęciową na zbiórce drużyny lub zastępu, opowiadając o tym, jaką wiedzę o historii geologicznej regionu można czerpać z obserwacji danego stanowiska.',
'Zalogowałem(-am) się w przynajmniej jednej skrytce geologicznej EarthCache (https://www.geocaching.pl/earthcache.php).',
'Odwiedziłem(-am) przynajmniej 3 z wybranych miejsc:'
'\n\n- teren nadmorski (wydmowy lub klifowy)'
'\n\n- meandry rzeczne lub pradolinę rzeki'
'\n\n- formy krasowe (np. jaskinie)'
'\n\n- formy skalne'
'\n\n- nieczynny, udostępniony kamieniołom lub kopalnię'
'\n\n- geopark lub Jurapark.',
'Zgromadziłem(-am) własną, skatalogowaną kolekcję skał i minerałów lub skamieniałości. Zaprezentowałem(-am) ją na wystawie lub w Internecie.',
]
),
SprawData(
id: 'geolog',
title: 'Geolog',
level: '4',
comment: 'Propaguje wiedzę na temat geologii.',
tasks: [
'Zaplanowałem(-am) i odbyłem(-am) 2-dniową wycieczkę geologiczną po wybranym regionie, uwzględniającą ciekawe stanowiska geologiczne oraz możliwości pozyskania okazów skał i minerałów lub formy ochrony przyrody nieożywionej. Folder opisujący wycieczkę zilustrowałem(-am) wykonanymi samodzielnie zdjęciami.',
'Przygotowałem(-am) prezentację dla zastępu lub drużyny na temat wybranego zagadnienia geologicznego.',
'Założyłem(-am) własną geologiczną skrytkę EarthCache (https://www.geocaching.pl/earthcache.php).',
]
),
]
),
SprawFamilyData(
id: '8',
sprawData:[
  SprawData(
id: 'religioznawca',
title: 'Religioznawca',
level: '1',
comment: 'Posiada podstawową wiedzę na temat największych monoteistycznych religii świata. Potrafi zachować się właściwie w przestrzeni sakralnej i podczas ceremonii religijnych.',
tasks: [
'Rozpoznałem(-am) symbole i nazwy świętych ksiąg islamu, judaizmu i chrześcijaństwa. Dowiedziałem(-am) się, jak nazywa się Bóg w każdej z tych religii.',
'Odwiedziłem(-am) (np. z rodzicami lub zastępem) świątynię, miejsce modlitwy lub cmentarz należące do innej religii lub wyznania niż moje własne. Zastosowałem(-am) się do zasad ubioru i zachowania w miejscu kultu lub podczas ceremonii religijnej.',
'Na zbiórce zastępu lub drużyny opowiedziałem(-am) lub pokazałem(-am) wybrany zwyczaj związany z Hanuką lub Ramadanem bądź innym dużym świętem religijnym religii innej niż chrześcijaństwo.',
'Zaprezentowałem(-am) modlitwę lub piosenkę religijną innego niż moje własne wyznania lub religii.',
]
),
SprawData(
id: 'religioznawca',
title: 'Religioznawca',
level: '2',
comment: 'Rozróżnia wyznania chrześcijańskie i religie istnie jące na świecie. Zna podobieństwa i różnice między nimi. Upowszechnia zasady właściwego zachowania w przestrzeni sakralnej i podczas ceremonii religijnych.',
tasks: [
'Na zbiórce zastępu przedstawiłem(-am) święta, symbole, wydarzenia i najważniejsze postacie judaizmu, islamu, chrześcijaństwa wschodniego i zachodniego.',
'Pomogłem(-am) zorganizować wycieczkę zastępu lub drużyny do świątyni wyznawców wybranej religii, wyznania lub obrządku (innej niż większości uczestników) i przedstawiłem(-am) informacje o niej. Przygotowałem(-am) członków zastępu lub drużyny pod względem właściwego ubioru i zachowania.',
'Na podstawie materiałów udostępnionych przez wybrany kościół lub związek wyznaniowy zarejestrowany w Polsce przygotowałem(-am) prezentację na temat podobieństw i różnic w zakresie głównych zasad wiary i zwyczajów pomiędzy nim a rzymskim katolicyzmem.',
'Rozmawiałem(-am) (np. na zlocie) lub korespondowałem(-am) ze skautem z zagranicy o tym, w jaki sposób spędza czas w „święty dzień” (np. niedzielę, sobotę, piątek).',
]
),
SprawData(
id: 'religioznawca',
title: 'Religioznawca',
level: '3',
comment: 'Wie, z czego wynikają różnice pomiędzy głównymi religiami i wyznaniami chrześcijańskimi. Upowszechnia tę wiedzę oraz ideę dialog u międzyreligijnego i ekumenizmu. Dyskutuje na tematy związane z religią, wiarą, wartościami.',
tasks: [
'Na zbiórce zastępu w ciekawej formie (np. gra, quiz, turniej wiedzy) przedstawiłem(-am) historię i okoliczności powstania największych religii świata: ich wspólne wydarzenia, postacie i miejsca.',
'W odniesieniu do 3 różnych związków wyznaniowych działających w Polsce: odszukałem(-am) najważniejsze informacje dotyczące tego, kim jest i ile jest osób boskich, jak powstał świat, skąd się wziął człowiek. Dowiedziałem(-am) się, gdzie są największe ośrodki wyznawców, jaka jest organizacja kościoła lub wspólnoty wyznaniowej – czy jest hierarchiczny i jakie są najważniejsze zwyczaje i zasady działania. Zrobiłem(-am) to, realizując jedno z poniższych zadań:'
'\n\n- Zapoznałem(-am) się ze stronami internetowymi trzech różnych związków wyznaniowych zarejestrowanych w Polsce, w tym co najmniej jednego należącego do religii niechrześcijańskiej (np. Związek Gmin Wyznaniowych Żydowskich, Muzułmański Związek Religijny w RP).'
'\n\n- Wziąłem(wzięłam) udział w Nocy Świątyń lub innym wydarzeniu, podczas którego odwiedziłem(-am) minimum 3 świątynie, wysłuchałem(-am) wykładu oraz rozmawiałem(-am) wyznawcami różnych wyznań lub religii.',
'Poznałem(-am) współczesne inicjatywy z zakresu dialogu międzyreligijnego i ekumenizmu. Przedstawiłem(-am) je kolegom z zastępu lub drużyny, wskazując najważniejsze zagadnienia i wyzwania w prowadzeniu dialogu.',
'Brałem(-am) udział w dyskusji o wartościach na zbiórce zastępu lub drużyny, którą zainicjowałem(-am) przedstawieniem w ciekawej formie (np. gawęda, scenka) historii zainspirowanej dwiema opowieściami lub mitami z wierzeń kultur współczesnych i minionych.',
]
),
SprawData(
id: 'religioznawca',
title: 'Religioznawca',
level: '4',
comment: 'Zna główne prawdy i zasady wiary oraz święta najwię kszych religii świata. Posiada pogłębioną wiedzę o wybranej religii. Propaguje tolera ncję religijną w swojej społeczności.',
tasks: [
'Poznałem(-am) główne dogmaty wiary i święta trzech największych religii świata (judaizm, chrześcijaństwo, islam). Wziąłem(wzięłam) udział w święcie innego wyznania lub religii niż własna (np. na otwartych spotkaniach, podczas festiwali, u znajomych).',
'Poznałem(-am) kilka największych wyznań w obrębie jednej wybranej religii monoteistycznej. Przeanalizowałem(-am) je pod względem różnic w zakresie prawd i zasad wiary, sposobów jej praktykowania, zasad organizacyjnych, struktury kościołów lub związków wyznaniowych. Wziąłem(wzięłam) udział w nabożeństwie przynajmniej jednego z nich, przygotowując się wcześniej pod kątem znaczenia każdego z elementów nabożeństwa.',
'Przeprowadziłem(-am) w zastępie lub w drużynie dyskusję na temat tolerancji religijnej (m.in. idee, skutki braku tolerancji w społeczeństwie, potencjalne trudności). Wykorzystałem(-am) najważniejsze dokumenty na temat dialogu międzyreligijnego i ekumenizmu (np. Deklarację o stosunku Kościoła katolickiego do religii niechrześcijańskich, Deklarację o wolności religijnej, Wspólną Deklarację o Usprawiedliwieniu). Przygotowałem(-am) podsumowanie dyskusji dla jej uczestników i uczestniczek, uwzględniając różne opinie.',
'Poznałem(-am) historię i zakres większych zmian dotyczących obrzędów, praktyk religijnych, świąt, zwyczajów i sposobu rozumienia wartości, jaką reprezentuje wybrana religia lub wyznanie. Podjąłem(podjęłam) refleksję na temat ich źródeł, w tym uwarunkowań kulturowych i roli lokalnych tradycji. Przeprowadziłem(-am) w szczepie lub hufcu warsztaty lub dyskusję na ten temat.',
]
)
]
),
]),

          SprawGroupData(
                id: 'pasje_i_specjalnosci',
                title: 'Pasje i specjalności',
                familyData: [
                      SprawFamilyData(
                          id: '1',
                          sprawData: [
                                SprawData(
                                    id: 'kolekcjoner',
                                    title: 'Kolekcjoner',
                                    level: '1',
                                    comment: 'Tworzy drobne kolekcje na interesujące tematy. Potrafi wyjaśnić, skąd wzięła się dana rzecz i jakie są jej właściwości.',
                                    tasks: [
                                          'Przez co najmniej miesiąc zbierałem(-am) wybrane przedmioty i przechowywałem(-am) je w bezpiecznym miejscu tak, aby nie uległy zniszczeniu.',
                                          'Pogłębiłem(-am) wiedzę na temat wybranego przedmiotu z mojej kolekcji. Zrobiłem(-am) jego zdjęcie i opis.',
                                          'Przedstawiłem(-am) swoją kolekcję na zbiórce zastępu. Podzieliłem(-am) się z zastępem swoją wiedzą na temat zbioru.',
                                    ]),
                                SprawData(
                                    id: 'kolekcjoner',
                                    title: 'Kolekcjoner',
                                    level: '2',
                                    comment: 'Posiada kolekcję, którą stale uzupełnia. Kontaktuje się z innymi osobami kolekcjonującymi te same przedmioty.',
                                    tasks: [
                                          'Stworzyłem(-am) własną kolekcję wybranych przedmiotów lub systematycznie powiększałem(-am) kolekcję, którą otrzymałem(-am).',
                                          'Opracowałem(-am) system katalogowania własnych zbiorów i posługiwałem(-am) się nim, uzupełniając swoją kolekcję.',
                                          'Nawiązałem(-am) kontakt z co najmniej jedną osobą, posiadającą kolekcję zbliżoną do mojej. Wymieniłem(-am) się doświadczeniami dotyczącymi powiększania kolekcji, jejprzechowywania i prezentowania itp.',
                                    ]),
                                SprawData(
                                    id: 'kolekcjoner',
                                    title: 'Kolekcjoner',
                                    level: '3',
                                    comment: 'Prezentuje swoje eksponaty na wystawach lub w Internecie.',
                                    tasks: [
                                          'Zbudowałem(-am) zadbaną i wyróżniającą się w moim najbliższym otoczeniu kolekcję.',
                                          'Pozyskałem(-am) wiedzę na temat kolekcjonowanych przedmiotów. Stworzyłem(-am) zestawienie źródeł (książki, miejsca internetowe itp.), z których czerpię wiedzę na temat przedmiotów, które kolekcjonuję.',
                                          'Zorganizowałem(-am) zajęcia, warsztaty lub prelekcję na temat zbieranych eksponatów.',
                                          'Zaprezentowałem(-am) najciekawsze elementy mojej kolekcji na wystawie lub w Internecie.',
                                    ]),
                                SprawData(
                                    id: 'kolekcjoner',
                                    title: 'Kolekcjoner',
                                    level: '4',
                                    comment: 'Prowadzi wartościową kolekcję. Zaraża innych swoją pasją.',
                                    tasks: [
                                          'Pozyskałem(-am) co najmniej jeden rzadki przedmiot do swojej kolekcji.',
                                          'Skompletowałem(-am) specjalistyczne publikacje na temat kolekcjonowanych przedmiotów.',
                                          'Przedstawiłem(-am) swoją kolekcję na zbiórce drużyny lub innym forum harcerskim. Podzieliłem(-am) się z innymi harcerzami wiedzą o korzyściach, jakie kolekcjonowanie daje mi w życiu codziennym.',
                                          'Nawiązałem(-am) kontakty ze społecznością kolekcjonerów. Brałem(-am) udział w spotkaniach lub dyskusjach na forach lub wystawach itp.',
                                    ]),

                          ]),
                      SprawFamilyData(
                          id: '2',
                          sprawData: [
                                SprawData(
                                    id: 'przyjaciel_ksiazki',
                                    title: 'Przyjaciel Książki',
                                    level: '1',
                                    comment: 'Poszukuje i znajduje książki, dzięki którym przekonuje się, że czytanie jest przyjemne.',
                                    tasks: [
                                          'Stworzyłem(-am) listę książek, które chciałbym(chciałabym) przeczytać. Przeczytałem(-am) co najmniej dwie książki z mojej listy.',
                                          'Znalazłem(-am) książkę, którą polubiłem(-am). Zachęciłem(-am) do jej przeczytania członków mojego zastępu lub kolegów z klasy.',
                                          'Samodzielnie wykonałem(-am) kilka zakładek do swoich książek.',
                                          'Zrobiłem(-am) spis alfabetyczny posiadanych książek.',
                                    ]),
                                SprawData(
                                    id: 'przyjaciel_ksiazki',
                                    title: 'Przyjaciel książki',
                                    level: '2',
                                    comment: 'Regularnie czyta różne książki. Korzysta z zasobów bibliotecznych. Gromadzi własna biblioteczkę i/lub e-biblioteczkę.',
                                    tasks: [
                                          'Przeczytałem(-am) książki z 3 różnych gatunków literatury, w tym przynajmniej jedną popularnonaukową.',
                                          'Zapisałem(-am) się do lokalnej biblioteki. Poznałem(-am) obowiązujące w niej zasady i się do nich stosuje. Regularnie (co najmniej raz w miesiącu) odwiedzałem(-am) bibliotekę i wypożyczałem(-am) książki.',
                                          'Wykonałem(-am) co najmniej jedno zadanie:'
                                              '\n\n- Wykonałem(-am) drobne naprawy introligatorskie kilku książek.'
                                              '\n\n- Pełniłem(-am) dyżur w bibliotece szkolnej lub publicznej.',
                                          'Sporządziłem(-am) listę książek, które chciałbym mieć w swojej biblioteczce (książek w wersji drukowanej lub/i elektronicznej). Zakupiłem(-am) je za własne oszczędności lub poprosiłem o sprezentowanie przez rodzinę lub znajomych.',
                                    ]),
                                SprawData(
                                    id: 'przyjaciel_ksiazki',
                                    title: 'Przyjaciel książki',
                                    level: '3',
                                    comment: 'Poszerza swoje gusta literackie. Sięga po książki poradnikowe i rozwijające wiedzę.',
                                    tasks: [
                                          'Śledziłem(-am) nowości wydawnicze w wybranej dziedzinie i przeczytałem(-am) przynajmniej 2 z nich.',
                                          'Wzbogaciłem(-am) swoją prywatną biblioteczkę. Choć jedną książkę do mojej biblioteczki znalazłem (-am) w antykwariacie.',
                                          'Wykonałem(-am) co najmniej jedno zadanie:'
                                              '\n\n− Stworzyłem(-am) ex libris biblioteczki swojej lub harcerskiej. Umieściłem(-am) go w książkach moich lub należących do mojego środowiska harcerskiego.'
                                              '\n\n− Prowadziłem(-am) w czasie próby na sprawność bibliotekę drużyny (szczepu) lub obozu.',
                                          'Na podstawie wybranej książki o charakterze poradnikowym lub naukowym itp. Wykonałem(-am) jedno z poniższych zadań:'
                                              '\n\n− Przygotowałem(-am) dla osoby prowadzącej zajęcia materiały na określony temat.'
                                              '\n\n− Przygotowałem(-am) miniporadnik na wybrany temat.',
                                    ]),
                                SprawData(
                                    id: 'przyjaciel_ksiazki',
                                    title: 'Przyjaciel książki',
                                    level: '4',
                                    comment: 'Orientuje się w najciekawszych aktualnie wydawanych pozycjach. Dużo czyta oraz dzieli się swoją pasją do książek.',
                                    tasks: [
                                          'Przedstawiłem(-am) i uzasadniłem(-am) propozycje książek, które warto dodać do biblioteczki drużyny lub przeczytać w ramach prób na stopnie.',
                                          'Wykonałem(-am) jedno z zadań:'
                                              '\n\n− Urządziłem(-am) w drużynie lub szkole itp. wieczór wspólnego czytania wybranej książki, spotkanie z autorem lub podobną imprezę literacką.'
                                              '\n\n− Urządziłem(-am) w drużynie lub szkole itp. wystawę ciekawych książek, prezentując na niej także własne zbiory.',
                                          'Wykonałem(-am) jedno z zadań:'
                                              '\n\n− Nawiązałem(-am) kontakt z antykwariatem, poznałem(-am) sposoby gromadzenia wydawnictw antykwarycznych i przechowywania oraz zabezpieczania starodruków.'
                                              '\n\n− Nawiązałem(-am) kontakt z muzeum lub archiwum, poznałem(-am) sposoby gromadzenia, przechowywania oraz zabezpieczania starodruków.',
                                          'Stworzyłem(-am) analogowy lub cyfrowy katalog swojego księgozbioru.',
                                    ]),
                          ]),
                      SprawFamilyData(
                          id: '3',
                          sprawData: [
                                SprawData(
                                    id: 'kronikarz',
                                    title: 'Kronikarz',
                                    level: '1',
                                    comment: 'Prowadzi kronikę. Na bieżąco odnotowuje ważne wydarzenia.',
                                    tasks: [
                                          'Prowadziłem(-am) w okresie próby kronikę (zastępu, drużyny lub prywatną), posługując się kilkoma rodzajami pisma.',
                                          'Sporządziłem(-am) notatkę z wydarzeń na podstawie relacji świadków',
                                          'Przez czas trwania próby dbałem(-am) o to, by kronika była zawsze tam, gdzie drużyna.',
                                          'Zapoznałem(-am) się z twórczością wybranego polskiego kronikarza.',
                                    ]),
                                SprawData(
                                    id: 'kronikarz',
                                    title: 'Kronikarz',
                                    level: '2',
                                    comment: 'Ma świadomość, w jaki sposób relacjonuje się zdarzenia w kronice. Rozumie obrzędową rolę kroniki w drużynie. Uwieczniając wydarzenia, wykazuje się kreatywnością.',
                                    tasks: [
                                          'Przygotowałem(-am) minimum 3 wydarzenia z życia zastępu lub drużyny, umieszczając wpis w kronice zastępu lub drużyny. W ramach wpisów uwzględniłem(-am) ważne dla środowiska elementy obrzędowe i anegdotyczne. Wykazałem(-am) się kreatywnością w ich tworzeniu.',
                                          'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                              '\n\n– Skontaktowałem(-am) się z kimś, kto prowadził kronikę w swoim środowisku i przeprowadziłem(-am) z tą osobą wywiad, uzyskując następujące informacje: sposób prowadzenia kroniki, zbierania informacji, opieki nad kroniką i wykorzystanie jej do pracy z zastępem lub drużyną.'
                                              '\n– Przejrzałem(-am) kroniki swojego środowiska i spisałem(-am) swoje wnioski dotyczące sposobów prowadzenia kroniki, które przedstawiłem(-am) na forum drużyny.',
                                          'Poszukałem(-am) w Internecie informacji na temat kaligrafii, akcesoriów i materiałów wykorzystywanych w kaligrafii. Wybrałem(-am) jeden krój, z pomocą którego stworzyłem(-am) wpis w kronice.',
                                          'Przygotowałem(-am) wpis do kroniki drużyny, opisując dłuższy wyjazd drużyny, tzn. biwak, obóz, zimowisko i umieszczając zdjęcia, rysunki, itd. podnoszące wartość artystyczną relacji.',
                                    ]),
                                SprawData(
                                    id: 'kronikarz',
                                    title: 'Kronikarz',
                                    level: '3',
                                    comment: 'Prowadzi kronikę, tworząc wpisy o bardzo różnorodnym charakterze. Pomaga młodszym w odnalezieniu się na funkcji kronikarza.',
                                    tasks: [
                                          'Prowadziłem(-am) w okresie próby kronikę, opisując minimum 7 wydarzeń dotyczących drużyny. Oprawę graficzną opisów dopasowałem(-am) do klimatu lub treści wydarzenia.',
                                          'Stworzyłem(-am) jeden wpis do kroniki metodą scrapbookingu.',
                                          'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                              '\n\n– Stworzyłem(-am) oprawę kroniki według własnego pomysłu lub zmodyfikowałem(-am) istniejącą tak, aby pasowała do istniejącej obrzędowości drużyny.'
                                              '\n– Stworzyłem(-am) bogato zdobioną okazjonalną kartę (np. na rozpoczęcie roku harcerskiego lub szkolnego) w kronice oraz wprawiłem(-am) ją we właściwe miejsce w kronice, nie uszkadzając innych wpisów. \n– Zreperowałem(-am) uszkodzoną kartę (np. podarta strona) w kronice z zastosowaniem właściwych technik i materiałów uzupełniających ubytek.',
                                          'Przeprowadziłem(-am) dla innych harcerzy warsztaty doskonalące umiejętności prowadzenia kronik.',
                                    ]),
                          ]),
                      SprawFamilyData(
                          id: '4',
                          sprawData: [
                                SprawData(
                                    id: 'k6',
                                    title: 'K6',
                                    level: '1',
                                    comment: 'Gra w kilka gier stolikowych. Potrafi wyjaśnić zasady gry zastępowi.',
                                    tasks: [
                                          'Zagrałem(-am) w 5 różnych gier stolikowych z rodziną, zastępem lub znajomymi.',
                                          'Na zbiórce zastępu zaproponowałem(-am) grę dobraną odpowiednio do wieku i doświadczenia graczy. Wyjaśniłem(-am) zasady i poprowadziłem(-am) rozgrywkę.',
                                          'Zagrałem(-am) w co najmniej jedną grę planszową lub karcianą o tematyce harcerskiej lub historycznej.',
                                          'Naprawiłem(-am) i zakonserwowałem(-am) grę stolikową (naprawa pudełka, wsadzenie kart w koszulki, uzupełnienie brakujących elementów).',
                                    ]),
                                SprawData(
                                    id: 'k6',
                                    title: 'K6',
                                    level: '2',
                                    comment: 'Wie, jak różne gry stolikowe wpływają na zdolności. Orientuje się w popularnych grach stolikowych.',
                                    tasks: [
                                          'Poznałem(-am) przynajmniej jedną grę na refleks, strategię, rozwijającą logiczne myślenie, zdolności ekonomiczne, planowania, pamięć, wiedzę, kreatywne myślenie (mogą się pokrywać). Zaprezentowałem(-am) te gry, wplatając je w prace mojego zastępu.',
                                          'Wziąłem(wzięłam) udział w turnieju gier planszowych lub karcianych.',
                                          'Zorganizowałem(-am) miniturniej gier stolikowych w zastępie lub drużynie.',
                                          'Znam przynajmniej jeden portal, blog lub vlog o grach stolikowych.',
                                    ]),
                                SprawData(
                                    id: 'k6',
                                    title: 'K6',
                                    level: '3',
                                    comment: 'Zna podstawowe mechaniki gier. Umiejętnie dobiera grę do graczy.',
                                    tasks: [
                                          'Zorganizowałem(-am) turniej gier stolikowych w dowolnym środowisku lub pracowałem(-am) na targach gier stolikowych, wyjaśniając gry.',
                                          'Poznałem(-am) mechaniki stosowane w grach i potrafię je zidentyfikować w grach, w które gram. Na zbiórce drużyny zaprezentowałem(-am) historię, twórców oraz rodzaje gier planszowych i karcianych.',
                                          'Zorganizowałem(-am) w swoim środowisku (drużyna, szkoła, kółko zainteresowań) akcję promującą gry planszowe i karciane. Zorganizowałem(-am) turniej gier w systemie szwajcarskim.',
                                          'Samodzielnie lub wraz z zespołem stworzyłem(-am) prostą grę planszową lub karcianą o tematyce harcerskiej i upowszechniłem(-am) ją w środowisku harcerskim.'
                                    ]),
                                SprawData(
                                    id: 'k6',
                                    title: 'K6',
                                    level: '4',
                                    comment: 'Tworzy własne gry stolikowe. Rozumie różnicę między „ciekawym pomysłem” a „grywalnym pomysłem”.',
                                    tasks: [
                                          'Określiłem(-am) potrzebę edukacyjną, docelową grupę wiekową i zakres wiedzy, który można przekazać za pomocą gry. Odpowiednio dobrałem(-am) mechanikę do projektowanej gry i stworzyłem(-am) fabułę.',
                                          'Zapoznałem(-am) się z materiałami o projektowaniu gier - np. Laboratorium Gier. Stworzyłem(-am) prototyp gry w kilku egzemplarzach i przeprowadziłem(-am) testy. Na bazie uzyskanej informacji zwrotnej poprawiłem(-am) grę i przeprowadziłem(-am) kolejną serię testów. Cykl powtarzałem(-am) do momentu, gdy gra stała się grywalna (uzyskała dobre oceny od 125 testujących i w większości określali ją jako atrakcyjną).',
                                          'Stworzoną grę zaproponowałem(-am) wydawnictwu lub spopularyzowałem(-am) samodzielnie (np. upubliczniając materiały do samodzielnego wydruku).',
                                          '',
                                    ]),
                          ]),
                      SprawFamilyData(
                          id: '5',
                          sprawData: [
                                SprawData(
                                    id: 'grpg_owiec',
                                    title: 'GRPGowiec',
                                    level: '2',
                                    comment: 'Ma świadomość, w jaki sposób relacjonuje się zdarzenia w kronice. Rozumie obrzędową rolę kroniki w drużynie. Uwieczniając wydarzenia, wykazuje się kreatywnością.',
                                    tasks: [
                                          'Przygotowałem(-am) minimum 3 wydarzenia z życia zastępu lub drużyny, umieszczając wpis w kronice zastępu lub drużyny. W ramach wpisów uwzględniłem(-am) ważne dla środowiska elementy obrzędowe i anegdotyczne. Wykazałem(-am) się kreatywnością w ich tworzeniu.',
                                          'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                                              '\n\n– Skontaktowałem(-am) się z kimś, kto prowadził kronikę w swoim środowisku i przeprowadziłem(-am) z tą osobą wywiad, uzyskując następujące informacje: sposób prowadzenia kroniki, zbierania informacji, opieki nad kroniką i wykorzystanie jej do pracy z zastępem lub drużyną.'
                                              '\n– Przejrzałem(-am) kroniki swojego środowiska i spisałem(-am) swoje wnioski dotyczące sposobów prowadzenia kroniki, które przedstawiłem(-am) na forum drużyny.  ',
                                          'Poszukałem(-am) w Internecie informacji na temat kaligrafii, akcesoriów i materiałów wykorzystywanych w kaligrafii. Wybrałem(-am) jeden krój, z pomocą którego stworzyłem(-am) wpis w kronice.',
                                          'Przygotowałem(-am) wpis do kroniki drużyny, opisując dłuższy wyjazd drużyny, tzn. biwak, obóz, zimowisko i umieszczając zdjęcia, rysunki, itd. podnoszące wartość artystyczną relacji.',
                                    ]),
                                SprawData(
                                    id: 'grpg_owiec',
                                    title: 'GRPGowiec',
                                    level: '3',
                                    comment: 'Odkrywa różnorodność gier fabularnych, poznaje inne systemy i settingi. Prowadzi dla rówieśników jako Mistrz Gry proste scenariusze, tworząc klimat rozgrywki.',
                                    tasks: [
                                          'Poznałem(-am) jeden system RPG. Współtworzyłem(-am) jej klimat swoją grą aktorską, dobieraniem rekwizytów i interakcją ze światem gry.',
                                          'Jako Mistrz(-yni) Gry poprowadziłem(-am) krótki scenariusz (np. dla zastępu).',
                                          'Dowiedziałem(-am) się, jakie są najpopularniejsze systemy i settingi rozgrywki. Poznałem(-am) i zagrałem(-am) w co najmniej dwa z nich.',
                                    ]),
                                SprawData(
                                    id: 'grpg_owiec',
                                    title: 'GRPGowiec',
                                    level: '4',
                                    comment: 'Tworzy złożone scenariusze na kilka sesji w różnych systemach. Prowadzi je, tworząc właściwy klimat.',
                                    tasks: [
                                          'Stworzyłem(-am) złożony scenariusz do przeprowadzenia w ciągu kilku sesji w co najmniej dwóch systemach i przeprowadziłem(-am) przynajmniej jeden.',
                                          'Stworzyłem(-am) własne materiały na sesje, dbając o ich estetykę. Zaaranżowałem(-am) przestrzeń w klimatyczny sposób.',
                                          'W czasie sesji odwoływałem(-am) się do bestiariuszy i dodatków, śledziłem(-am) zdolności posiadane przez graczy i reagowałem(-am) we właściwy sposób.',
                                          'Stworzyłem(-am) scenariusz i przeprowadziłem(-am) przynajmniej jednego LARPa.',
                                    ]),

                          ]),

                      SprawFamilyData(
                          id: '6',
                          sprawData: [
                                SprawData(
                                    id: 'straznik_granicy',
                                    title: 'Strażnik granicy',
                                    level: '1',
                                    comment: 'Zna podstawowe informacje dotyczące granicy państwowej, rozwija podstawowe cechy osobowości przydatne funkcjonariuszowi Straży Granicznej (pamięć, refleks, spostrzegawczość, cierpliwość).',
                                    tasks: [
                                          'Wiem, co to jest granica i jakie są jej rodzaje (morska, lądowa, lotnicza). Wymieniłem(-am) kraje graniczące z Polską.',
                                          'Dowiedziałem(-am) się, co trzeba zrobić, żeby przekroczyć granicę. Wymieniłem(-am) podstawowe dokumenty uprawniające do przekroczenia granicy. Wiem, co to jest dowód osobisty, paszport i wiza. Wymieniłem(-am) i wskazałem(-am) na mapie przejścia graniczne w swoim  województwie.',
                                          'Ćwiczyłem(-am) refleks, pamięć i spostrzegawczość w grach typu „znajdź odróżniające szczegóły”, KIM, memory, domino itp. (co najmniej 5 razy w trakcie trwania próby).',
                                          'Regularnie ćwiczę. Wykonałem(-am) po 10 brzuszków, pompek i przysiadów.',
                                    ]),
                                SprawData(
                                    id: 'straznik_granicy',
                                    title: 'Strażnik granicy',
                                    level: '2',
                                    comment: 'Interesuje się funkcjonowaniem granicy państwowej i Straży Granicznej.',
                                    tasks: [
                                          'Dowiedziałem(-am) się, jak dzieli się obszar granicy państwowej i czym różnią się jej poszczególne elementy (granica właściwa, pas drogi granicznej, strefa nadgraniczna). Wiem, czym jest oznaczana granica państwa na mapie i w terenie oraz na różnych odcinkach. Wyjaśniłem(-am), na czym polega różnica między granicą zewnętrzną i granicą wewnętrzną strefy Schengen.',
                                          'Skrycie obserwowałem(-am) innych (samemu nie będąc widzianym). Sporządziłem(-am) meldunek z zaobserwowanych zdarzeń.',
                                          'Uczestniczyłem(-am) w grze odtwarzającej działanie placówki Straży Granicznej lub strażnicy Korpusu Ochrony Pogranicza.',
                                          'Poznałem(-am) podstawowe zadania Straży Granicznej. Odróżniłem(-am) funkcjonariusza Straży Granicznej po wykonywanych zadaniach i mundurze od innych służb. Rozpoznałem(-am) oznaczenia stopni służbowych na mundurach funkcjonariuszy Straży Granicznej.',
                                    ]),
                                SprawData(
                                    id: 'straznik_granicy',
                                    title: 'Strażnik graniczny',
                                    level: '3',
                                    comment: 'Pogłębia wiedzę dotyczącą funkcjonowania granicy i Straży Granicznej, włącza tematykę ochrony granic w prowadzone przez siebie gry i zajęcia dla środowiska harcerskiego (zastępu, drużyny).',
                                    tasks: [
                                          'W czasie ćwiczeń rozpoznałem(-am) ślady ludzi, określając przy tym: ich wiek, kierunek marszu i sposób poruszania się.',
                                          'Zdobyłem(-am) wiedzę na temat rozpoznawania i zabezpieczania śladów. Zdobytą wiedzę wykorzystałem(-am) przeprowadzając w terenie zajęcia dla zastępu.',
                                          'Opracowałem(-am) grę terenową, planszową lub komputerową dotyczącą ochrony granic, wykorzystując tematykę profilaktyki przestępczości granicznej (przemyt, fałszerstwa dokumentów, nielegalna migracja itp.).',
                                          'Poznałem(-am) strukturę Straży Granicznej. Wymieniłem(-am) Oddziały Straży Granicznej. Dowiedziałem(-am) się, gdzie znajduje się najbliższa mojemu miejscu zamieszkania jednostka Straży Granicznej.',
                                    ]),
                                SprawData(
                                    id: 'straznik_granicy',
                                    title: 'Strażnik granicy',
                                    level: '4',
                                    comment: 'Promuje wiedzę dotyczącą tematyki granicznej. Nawiązuje współpracę ze Strażą Graniczną szkoląc harcerzy i propagując wiedzę na temat funkcjonowania granicy.',
                                    tasks: [
                                          'Odbyłem(-am) kilkudniową wędrówkę po wybranym odcinku granicy lub brałem(-am) udział w wycieczce na wybrane przejście graniczne. Zapoznałem(-am) się ze specyfiką poznanego odcinka granicy i związanymi z tym szczególnymi cechami pełnionej tu służby granicznej.',
                                          'Przeprowadziłem(-am) dla młodszych zajęcia dotyczące jednego z poniższych tematów:'
                                              '\n\n- historia polskich formacji granicznych,'
                                              '\n\n- nielegalna migracja,'
                                              '\n\n- przemyt narkotyków, broni i materiałów niebezpiecznych,'
                                              '\n\n- nielegalny wwóz odpadów,'
                                              '\n\n- nielegalny wywóz zabytków,'
                                              '\n\n- handel ludźmi,'
                                              '\n\n- przemyt egzotycznych zwierząt, roślin oraz produktów z nich pochodzących (wg konwencji CITES).'
                                              '\n\n- Wykonałem(-am) prostą grę edukacyjną (memory, domino, układanka itp.) dotyczącą wybranego tematu.',
                                          'Poznałem(-am) zasady rekrutacji do Straży Granicznej. Przeszedłem(-am) pozytywnie test sprawnościowy, wymagany od kandydatów do SG.',
                                          'Pełniłem(-am) służbę na rzecz uchodźców lub uczestniczyłem(-am) w akcji profilaktycznej związanej z problematyką handlu ludźmi.',
                                    ]),
                          ]),

                      SprawFamilyData(
                          id: '7',
                          sprawData: [
                                SprawData(
                                    id: 'obronca',
                                    title: 'Obrońca',
                                    level: '1',
                                    comment: 'Unika niebezpieczeństw. Radzi sobie w trudnych sytuacjach.',
                                    tasks: [
                                          'Pokazałem(-am) kilka sposobów, jak unikać kontaktu z niebezpiecznymi osobami (udawanie rozmowy przez telefon, przyłączenie się do przechodniów itp.).',
                                          'Poprawnie poinformowałem(-am) policję przez telefon o niebezpieczeństwie podczas rzeczywistego wydarzenia lub symulacji.',
                                          'Wykonałem(-am) minimum trzy techniki obrony lub ataku w bliskim kontakcie.',
                                          'Wykonałem(-am) pad w tył i przód.',
                                          'Obroniłem(-am) się przy użyciu improwizowanej tarczy znajdującej się w pobliżu (np. tornister) podczas rzeczywistego wydarzenia lub symulacji.',
                                          'Skutecznie uciekłem(-am) od zagrożenia (agresora, pożaru itp.), pokonując przeszkody terenowe (schody, ogrodzenie, tłum ludzi itp.) podczas rzeczywistego wydarzenia lub symulacji.',
                                    ]),
                                SprawData(
                                    id: 'obronca',
                                    title: 'Obrońca',
                                    level: '2',
                                    comment: 'Doskonali swoją wiedzę z zakresu samoobrony.',
                                    tasks: [
                                          'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności Obrońca (*).',
                                          'Zastosowałem(-am) odpowiednie techniki i obroniłem(-am) się przed: atakami z przodu rąk i nóg oraz uszeniem przedramieniem.',
                                          'Wykonałem(-am) przewrót przez bark w przód i w tył.',
                                          'Ewakuowałem(-am) osobę z miejsca zagrożenia podczas rzeczywistego wydarzenia lub symulacji.',
                                          'Przeprowadziłem(-am) dla zastępu dwa treningi sprawnościowe na refleks, równowagę i koordynację ruchową.',
                                          'Wziąłem(wzięłam) udział w drużynowych lub sportowych zawodach z zakresu samoobrony (zapasy, walki kogutów itp.).',
                                    ]),
                                SprawData(
                                    id: 'obronca',
                                    title: 'Obrońca',
                                    level: '3',
                                    comment: 'Dzieli się wiedzą z zakresu samoobrony.',
                                    tasks: [
                                          'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności Obrońca (**).',
                                          'Zastosowałem(-am) odpowiednie techniki i obroniłem(-am) się przed atakami rąk i nóg z różnych kierunków oraz atakami noża (z góry i z dołu).',
                                          'Wykazałem(-am) się umiejętnością stosowania trzech innych technik samoobrony.',
                                          'Ewakuowałem(-am) osobę z miejsca zagrożenia podczas rzeczywistego wydarzenia lub symulacji.',
                                          'Przeprowadziłem(-am) dla zastępu dwa treningi sprawnościowe na refleks, równowagę i koordynację ruchową.',
                                          'Wziąłem(wzięłam) udział w drużynowych lub sportowych zawodach z zakresu samoobrony (zapasy, walki kogutów itp.).',
                                    ]),
                          ]),
                      SprawFamilyData(
                          id: '8',
                          sprawData: [
                                SprawData(
                                    id: 'strazak',
                                    title: 'Strażak',
                                    level: '2',
                                    comment: 'Posiada podstawową wiedzę i umiejętności niezbędne w działaniach strażackich.',
                                    tasks: [
                                          'W czasie zbiórek zastępów wykazałem(-am) się znajomością:'
                                              '\n\n− stopni Państwowej Straży Pożarnej oraz stopni funkcyjnych Ochotniczej Straży Pożarnej,'
                                              '\n\n- struktury organizacyjnej Związku Ochotniczych Straży Pożarnych RP,'
                                              '\n\n− podstawowych przyczyny pożarów,'
                                              '\n\n− rodzajów węży oraz sprzętu do ich obsługi oraz zasad konserwacji.',
                                          'Wspólnie z zastępem zbudowałem(-am) linię wężową.',
                                          'Sprawnie ubrałem(-am) się w osobiste uzbrojenie strażaka.',
                                          'Wiem, jakimi środkami gaśniczymi należy gasić różnego rodzaju pożary.',
                                          'Podczas zbiórki drużyny opowiedziałem(-am) o szkodach dla środowiska, które niosą pożary traw i lasów.',
                                    ]),
                                SprawData(
                                    id: 'strazak',
                                    title: 'Strażak',
                                    level: '3',
                                    comment: 'W czasie ćwiczeń wykazuje się umiejętnościami gaszenia prostych pożarów.',
                                    tasks: [
                                          'Wykazałem(-am) się znajomością budowy i zasady działania gaśnicy i hydronetki. W czasie ćwiczeń sprawnie posługiwałem(-am) się nimi oraz kocem gaśniczym, bosakiem, sprzętem burzącym i tłumicą.',
                                          'W czasie ćwiczeń wykazałem?(-am) się znajomością budowy, zasad działania i obsługi motopompy.',
                                          'Poznałem(-am) środki transportowe używane przez straże pożarne. Potrafiłem(-am) rozwinąć skróty określeń samochodów strażackich. W czasie wizyty w remizach strażackich dokładnie poznałem(-am) co najmniej dwa typy pojazdów pożarniczych.',
                                          'W czasie ćwiczeń udzieliłem(-am) pierwszej pomocy w przypadku oparzenia, porażenia prądem oraz zatrucia gazami pożarowymi.',
                                          'Wziąłem(wzięłam) udział w zawodach Młodzieżowych Drużyn Pożarniczych.',
                                    ]),
                                SprawData(
                                    id: 'strazak',
                                    title: 'Strażak',
                                    level: '4',
                                    comment: 'W czasie ćwiczeń kieruje pracą grupy harcerzy-strażaków.',
                                    tasks: [
                                          'Zebrałem(-am) informacje o stanie zaopatrzenia wybranej miejscowości w wodę oraz ustaliłem(-am) najdogodniejsze miejsce na ustawienie motopompy.',
                                          'W czasie ćwiczeń:'
                                              '\n\n− kierowałem(-am) budową linii wężowej oraz gaszeniem ognia przez zastęp podczas ćwiczeń,'
                                              '\n− dostosowałem wodne prądy gaśnicze do odpowiedniego rodzaju pożaru.',
                                          'Ukończyłem(-am) co najmniej 15-godzinny kurs pierwszej pomocy.',
                                          'Prowadziłem(-am) służbową korespondencję radiową, używając kryptonimów.',
                                          'Poszerzyłem(-am) wiedzę z zakresu jednej ze specjalizacji ratowniczych (ratownictwo wodne, techniczne, chemiczne, wysokościowe itp.).',
                                          'Brałem(-am) udział w przygotowaniu harcerzy do udziału w zawodach Młodzieżowych Drużyn Pożarniczych.',
                                    ]),
                          ]),
                      SprawFamilyData(
                          id: '9',
                          sprawData: [
                                SprawData(
                                    id: 'pocztowiec',
                                    title: 'Pocztowiec',
                                    level: '2',
                                    comment: 'Poznaje zasady działania poczty harcerskiej i angażuje się w proste projekty.',
                                    tasks: [
                                          'Poznałem(-am) zasady działania poczt harcerskich oraz ich historię. Przeczytałem(-am) książkę J. Kasprzaka „Tropami powstańczej przesyłki”.',
                                          'Poznałem(-am) zasady kolekcjonowania zbiorów filatelistycznych. Brałem(-am) czynny udział w przygotowaniu wystawy filatelistycznej.',
                                          'Wykonałem(-am) skrzynkę pocztową i byłem(-am) odpowiedzialny(-a) za przyjmowanie oraz rozprowadzanie korespondencji na obozie.',
                                          'Założyłem(-am) skrzynkę poczty elektronicznej (e-mail), nauczyłem(-am) się redagować i wysyłać listy pocztą elektroniczną.',
                                    ]),
                                SprawData(
                                    id: 'pocztowiec',
                                    title: 'Pocztowiec',
                                    level: '3',
                                    comment: 'Realizuje w zespołach projekty pocztowe.',
                                    tasks: [
                                          'Uczestniczyłem(-am) w obsłudze pocztowej na zlocie, obozie, imprezie hufca albo imprezie publicznej.',
                                          'Wykonałem(-am) samodzielnie klisze lub pieczątkę dla poczty harcerskiej (np. linoryt).',
                                          'Przez okres próby prowadziłem(-am) współpracę z inną pocztą harcerską, realizując przynajmniej jeden wspólny projekt.',
                                          'Przygotowałem(-am) projekt wydawnictwa poczty harcerskiej do druku.',
                                          'Wykonałem(-am) co najmniej jedno z zadań:'
                                              '\n\n– przygotowałem(-am) własne zbiory wydawnictw poczty harcerskiej do wystawy;'
                                              '\n– przesłałem(-am) wydawnictwa swojej poczty do Centralnego Archiwum Poczt Harcerskich.',
                                    ]),
                                SprawData(
                                    id: 'pocztowiec',
                                    title: 'Pocztowiec',
                                    level: '4',
                                    comment: 'Kieruje dużymi projektami organizowanymi przez pocztę harcerską.',
                                    tasks: [
                                          'Kierowałem(-am) kilkoma projektami tematycznymi poczty.',
                                          'Zorganizowałem(-am) sieć obsługi pocztowej na dużym obozie lub zlocie.',
                                          'Zrealizowałem(-am) projekt pocztowy we współpracy z Pocztą Polską, Polskim Związkiem Filatelistycznym lub odpowiednią organizacją, firmą spedycyjną lub logistyczną.',
                                          'Zrealizowałem(-am) dodatkowe zadanie mistrzowskie w porozumieniu z naczelnikiem macierzystej PH.',
                                    ]),
                          ]),
                      SprawFamilyData(
                          id: '10',
                          sprawData: [
                                SprawData(
                                    id: 'krotkofalowiec',
                                    title: 'Krótkofalowiec',
                                    level: '2',
                                    comment: 'Prowadzi nasłuchy, poznaje podstawową wiedzę krótkofalarską.',
                                    tasks: [
                                          'Poznałem(-am) międzynarodowy podział pasm radiowych oraz służby korzystające z nich. Opowiedziałem(-am) o tym swojemu zastępowi.',
                                          'Poznałem(-am) zakresy amatorskich pasm KF i ich wewnętrzny podział oraz podstawowe wyrazy Q-kodu i podstawowe skróty służbowe.',
                                          'Poznałem(-am) zasady budowy znaków rozpoznawczych i prefiksy minimum pięciu państw. Dokonałem(-am) nasłuchów z co najmniej dziesięciu krajów.',
                                          'Obsługiwałem(-am) odbiornik komunikacyjny. Pełniłem(-am) dyżur nasłuchowy w pracy sieci i odebrałem(-am) kierowany doń radiogram.',
                                    ]),
                                SprawData(
                                    id: 'krotkofalowiec',
                                    title: 'Krótkofalowiec',
                                    level: '3',
                                    comment: 'Prowadzi łączności krótkofalarskie na własnoręcznie rozstawionym sprzęcie.',
                                    tasks: [
                                          'Przeprowadziłem(-am) na stacji klubowej co najmniej dwadzieścia łączności.',
                                          'Poznałem(-am) procedurę pracy amatorskiej, międzynarodowy system głoskowania oraz sposoby budowy znaków rozpoznawczy(-am) w sieci służbowej łączności radiotelefonicznej i przekazałem(-am) co najmniej dwadzieścia radiogramów.',
                                          'Poznałem(-am) procedurę pracy służbowej oraz sposób prowadzenia dokumentacji stacyjnej (radiogramy, log). Pracowałem(-am) w sieci służbowej łączności radiotelefonicznej i przekazałem(-am) co najmniej dwadzieścia radiogramów.',
                                          'Poznałem(-am) zasady rozchodzenia się fal KF i UKF, wybrałem(-am) właściwe miejsce w terenie dla usytuowania anteny oraz dobrałem(-am) odpowiedni typ anteny w zależności od wymaganego zasięgu.',
                                          'Przygotowałem(-am) do pracy przenośną radiostację i przeprowadziłem(-am) szkolenie zastępu w tym zakresie.',
                                    ]),
                                SprawData(
                                    id: 'krotkofalowiec',
                                    title: 'Krótkofalowiec',
                                    level: '4',
                                    comment: 'Osiąga mistrzostwo w łączności krótkofalarskiej. Propaguje tę formę aktywności wśród młodszych.',
                                    tasks: [
                                          'Odebrałem(-am) i nadałem(-am) kluczem 60 znaków na minutę według PARIS.',
                                          'Poznałem(-am) minimum 20 znaków Q-kodu oraz znaki służbowe dotyczące korespondencji radiowej. Nawiązałem(-am) co najmniej 20 łączności telegrafią na radiostacji klubowej i przekazałem(-am telegrafią co najmniej 10 radiogramów podczas pracy amatorskiej lub służbowej.',
                                          'Pracowałem(-am) co najmniej raz z terenowego stanowiska (obóz, biwak), utrzymując łączność z wybranym korespondentem w macierzystej lub innej miejscowości.',
                                          'Wykonałem(-am) proste urządzenie telegraficzne, np. generator do nauki telegrafii, wykorzystałem(-am) je podczas swoich zajęć z zastępem.',
                                    ]),
                          ]),
                ],
          ),

          SprawGroupData(
              id: 'sportowe',
              title: 'Sportowe',
              familyData: [

                    // Tu można wrzucać rodziny sprawności z kategorii "sprawności sportowe"

              ]
          ),

          SprawGroupData(
              id: 'wodne',
              title: 'Wodne',
              familyData: [

                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'plywak',
                                  title: 'Pływak',
                                  level: '1',
                                  comment: 'W wodzie czuje się swobodnie, potrafi się w niej poruszać i zanurzyć.',
                                  tasks: [
                                        'Przepłynąłem(-ęłam) 100 metrów, w tym połowę na plecach.',
                                        'Wytrzymałem(-am) 20 sekund pod wodą.',
                                        'Położyłem(-am) się na wodzie i utrzymałem(-am) się na niej przez 30 sekund.'
                                  ]),

                              SprawData(
                                  id: 'plywak',
                                  title: 'Pływak',
                                  level: '2',
                                  comment: 'Potrafi skakać do wody, nurkować i orientować się pod wodą. Jest w stanie przepłynąć dłuższy dystans.',
                                  tasks: [
                                        'Przepłynąłem(-ęłam) 200 metrów, w tym połowę na plecach.',
                                        'Skoczyłem(-am) do wody z wysokości 1 metra i przepłynąłem(przepłynęłam) pod wodą 10 metrów.',
                                        'Wyciągnąłem(-am) trzy przedmioty znajdujące się 1,5 metra pod wodą.',
                                        'Przepłynąłem(-ęłam) między nogami kolegi pod wodą.'
                                  ]),

                              SprawData(
                                  id: 'plywak',
                                  title: 'Pływak',
                                  level: '3',
                                  comment: 'Zna przynajmniej trzy style pływackie, pracuje nad swoją techniką pływania.',
                                  tasks: [
                                        'Przepłynąłem(-ęłam) 400 metrów co najmniej trzema różnymi stylami.',
                                        'Bezpiecznie skoczyłem(-am) do wody na kilka sposobów (np. skokiem ratowniczym, w kamizelce asekuracyjnej itp.)',
                                        'Pracowałem(-am) nad techniką pływania wybranym stylem. Z pomocą instruktora lub Internetu poznałem(-am) dokładnie wybraną technikę i przygotowałem(-am) dla siebie zestaw ćwiczeń, które powtórzyłem(-am) podczas min. 3 treningów.',
                                        'Wykonałem(-am) poprawnie nawroty – odkryty (np. w żabce) i koziołkowy (np. w kraulu).'
                                  ]),

                              SprawData(
                                  id: 'plywak',
                                  title: 'Pływak',
                                  level: '4',
                                  comment: 'Zna wszystkie (4) style pływackie. Jest w stanie przepłynąć większy dystans bez przerwy. Wie, w jaki sposób można holować tonącego.',
                                  tasks: [
                                        'Przepłynąłem(-am) 800 m, dowolnie wybierając style płynięcia, bez przerw.',
                                        'Przepłynąłem(-am) 100 metrów stylem zmiennym (25 m stylem motylkowym, 25 m grzbietem, 25 m żabką i 25 m kraulem).',
                                        'Przepłynąłem(-am) pod wodą 20 metrów.',
                                        'Pracowałem(-am) nad techniką pływania wybranym stylem (innym niż w sprawności ***) – z pomocą instruktora lub Internetu poznałem dokładnie wybraną technikę i przygotowałem(-am) dla siebie zestaw ćwiczeń, które powtórzyłem(-am) podczas min. 3 treningów.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '2',
                        sprawData: [
                              SprawData(
                                  id: 'ratownik_specjalista',
                                  title: 'Ratownik specjalista',
                                  level: '1',
                                  comment: 'Wie, jakie zasady bezpieczeństwa obowiązują nad wodą, potrafi wezwać pomoc.',
                                  tasks: [
                                        'W czasie zajęć na wodzie zawsze pływałem(-am) w kamizelce asekuracyjnej lub ratunkowej.',
                                        'Opowiedziałem(-am), jak oznacza się kąpieliska w Polsce, co oznaczają poszczególne flagi oraz w jakich miejscach należy unikać kąpieli.',
                                        'Skompletowałem(-am) apteczkę zastępu lub wachty na biwak, rejs lub obóz.',
                                        'Prawidłowo wezwałem(-am) pomoc w przypadku wypadku nad wodą lub w czasie pozoracji wypadku.',
                                        'Zawiązałem(-am) węzeł ratowniczy.'
                                  ]),

                              SprawData(
                                  id: 'ratownik_specjalista',
                                  title: 'Ratownik specjalista',
                                  level: '2',
                                  comment: 'Potrafi udzielić podstawowej pomocy w wypadku nad wodą.',
                                  tasks: [
                                        'Odwiedziłem(-am) z drużyną, zastępem lub wachtą stację ratownictwa wodnego lub sekcję wodną straży pożarnej.',
                                        'Udzieliłem(-am) pomocy w przypadku skaleczenia i oparzenia słonecznego.',
                                        'Zapobiegłem(-am) wystąpieniu udaru słonecznego, w czasie zajęć na wodzie zawsze nosiłem(-am) czapkę.',
                                        'Wskazałem(-am) na mapie, gdzie na najbliższych zbiornikach wodnych zlokalizowane są służby mogące nieść pomoc na wodzie.',
                                        'Zawiązałem(-am) węzeł ratowniczy w wodzie oraz na lądzie z zawiązanymi oczami.'
                                  ]),

                              SprawData(
                                  id: 'ratownik_specjalista',
                                  title: 'Ratownik specjalista',
                                  level: '3',
                                  comment: 'Potrafi zachować się w sytuacji wypadku na wodzie.',
                                  tasks: [
                                        'Rozpoznałem(-am) oznaki hipotermii i opowiedziałem(-am), jak postąpić w przypadku jej wystąpienia.',
                                        'Ustawiłem(-am) odpowiednio jednostkę (jacht, kajak, łódź motorową itp.) w przypadku pozorowanego pożaru na jednostce.',
                                        'Prawidłowo podałem(-am) koło ratunkowe, założyłem(-am) pas ratunkowy i kamizelkę asekuracyjną.',
                                        'Ukończyłem(-am) przynajmniej 9-godzinny kurs pierwszej pomocy, w którym wykonywano ćwiczenia RKO na fantomie.',
                                        'Zaprezentowałem(-am) przynajmniej pięć sposobów wzywania pomocy na wodach śródlądowych.',
                                        'Skoczyłem(-am) do wody na nogi w kamizelce ratunkowej z wysokości 2 metrów.'
                                  ]),

                              SprawData(
                                  id: 'ratownik_specjalista',
                                  title: 'Ratownik specjalista',
                                  level: '4',
                                  comment: 'Potrafi zachować się w przypadku niebezpiecznego zdarzenia na wodzie.',
                                  tasks: [
                                        'Opisałem(-am) procedurę wzywania pomocy przez radiotelefon UKF, odebrałem(-am) pozorowany komunikat MAYDAY, PAN-PAN i SECURITE.',
                                        'Posługiwałem(-am) się szelkami asekuracyjnymi na pokładzie.',
                                        'Opowiedziałem(-am), jak działają i do czego służą: tyczka z chorągiewką oraz pława świetlna.',
                                        'Zaprezentowałem(-am) użycie (bez odpalania) środków pirotechnicznych środków wzywania pomocy: flary, rakiety i pławki dymnej.',
                                        'Posiadam odznakę Ratownik ZHP lub ukończyłem(-am) inny 15-godzinny kurs pierwszej pomocy.'
                                  ]),
                        ]
                    ),


                    SprawFamilyData(
                        id: '3',
                        sprawData: [
                              SprawData(
                                  id: 'ratownik_wodny',
                                  title: 'Ratownik wodny',
                                  level: '1',
                                  comment: 'Dba o własne bezpieczeństwo na wodzie. Potrafi pływać i nurkować. Zna podstawy pierwszej pomocy.',
                                  tasks: [
                                        'Wie, czym się różni kamizelka asekuracyjna od ratunkowej, poprawnie założyłem(-am) jedną z nich.',
                                        'Przepłynąłem(-ęłam) 200 metrów dowolnym stylem.',
                                        'Wyciągnąłem(-am) przedmiot z wody z głębokości 2 metrów.',
                                        'Utrzymałem(-am) się na powierzchni wody w pozycji pionowej przez minutę, pracując tylko nogami.',
                                        'Pełniłem(-am) funkcję sanitariusza na wycieczce lub rejsie.'
                                  ]),

                              SprawData(
                                  id: 'ratownik_wodny',
                                  title: 'Ratownik wodny',
                                  level: '2',
                                  comment: 'W czasie zajęć na wodzie zawsze używa środków asekuracyjnych i pilnuje innych w tym zakresie. Posługuje się podstawowym sprzętem ratowniczym. Jest dobrym pływakiem.',
                                  tasks: [
                                        'Przed zajęciami na wodzie sprawdziłem(-am) poprawność założenia środków asekuracyjnych u innych członków zastępu.',
                                        'Opowiedziałem(-am) zastępowi, jak oznaczane są kąpieliska w Polsce i w jakich miejscach powinno się unikać kąpieli.',
                                        'Przepłynąłem(-ęłam) 600 metrów, w tym min. 200 na plecach.',
                                        'Przepłynąłem(-ęłam) pod wodą 15 metrów.',
                                        'Prawidłowo podałem(-am) koło ratunkowe.',
                                        'Przepłynąłem(-am) 25 metrów w ubraniu.',
                                        'Poznałem(-am) min. jeden sposób holowania tonącego i przeholowałem(-am) kogoś na dystansie 25 metrów.'
                                  ]),

                              SprawData(
                                  id: 'ratownik_wodny',
                                  title: 'Ratownik wodny',
                                  level: '3',
                                  comment: 'Zna skoki i style ratownicze oraz sposoby holowania. Używa bardziej zaawansowanego sprzętu ratowniczego.',
                                  tasks: [
                                        'Skoczyłem(-am) do wody sposobem ratowniczym.',
                                        'Przepłynąłem(-ęłam) 50 metrów kraulem ratowniczym i 50 metrów żabką ratowniczą.',
                                        'Poznałem(-am) min. dwa sposoby holowania tonącego i przeholowałem(-am) kogoś na dystansie 50 metrów.',
                                        'Podczas symulacji ułożyłem(-am) poszkodowanego z podejrzeniem urazu kręgosłupa na desce ratowniczej.',
                                        'Rzuciłem(-am) rzutką ratowniczą trzy razy na odległość min. 15 metrów. Po każdym rzucie poprawnie ją sklarowałem(-am).'
                                  ]),

                              SprawData(
                                  id: 'ratownik_wodny',
                                  title: 'Ratownik wodny',
                                  level: '4',
                                  comment: 'Potrafi udzielić pomocy tonącemu w różnych sytuacjach. Potrafi pływać łodzią ratowniczą. Używa zaawansowanego sprzętu ratowniczego i zna sposoby wzywania pomocy.',
                                  tasks: [
                                        'Podczas ćwiczeń odpaliłem(-am) pławkę dymną, flarę ratowniczą lub rakietę spadochronową.',
                                        'Przepłynąłem(-ęłam) 400 metrów dowolnym sposobem w czasie poniżej osiem minut.',
                                        'Przepłynąłem(-ęłam) 25 metrów pod wodą.',
                                        'Holowałem(-am) osobę udającą tonącego na dystansie 150 metrów z zastosowaniem trzech sposobów holowania. Wyciągnąłem(-am) tę osobę na brzeg i ułożyłem(-am) w pozycji bezpiecznej.',
                                        'Przepłynąłem(-ęłam) ratowniczą łodzią wiosłową za pomocą dwóch wioseł dystans 75 metrów w linii prostej do boi, dopłynąłem(-ęłam) do niej rufą i powróciłem(-am) do miejsca startu w czasie krótszym niż 2:40 minut.',
                                        'Brałem(-am) udział w symulowanej akcji ratowniczej polegającej na przepłynięciu dystansu co najmniej 20 metrów, wydobyciu manekina położonego na dnie i holowaniu go w pasie ratowniczym do brzegu.'
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '4',
                        sprawData: [
                              SprawData(
                                  id: 'foka',
                                  title: 'Foka',
                                  level: '1',
                                  comment: 'Pływa i nurkuje w ABC.',
                                  tasks: [
                                        'Przepłynąłem(-am) prawidłowo w płetwach i w masce dystans 25 metrów, oddychając przez fajkę.',
                                        'Zanurkowałem(-am) na głębokość 2 metrów i wydobyłem(-am) przedmiot z dna kąpieliska lub basenu.',
                                        'Wytrzymałem(-am) pod wodą bez oddechu przez 30 sekund.',
                                        'Wytłumaczyłem(-am), jak wygląda i co oznacza flaga A MKS oraz jak wygląda flaga nurkowa.'
                                  ]),

                              SprawData(
                                  id: 'foka',
                                  title: 'Foka',
                                  level: '2',
                                  comment: 'Nurkuje w ABC w basenie i na wodach otwartych.',
                                  tasks: [
                                        'Skompletowałem(-am) swoje wyposażenie ABC (płetwy, maska, fajka).',
                                        'Nurkowałem(-am) w ABC. Brałem(-am) udział w wyławianiu zagubionych przedmiotów na wodzie otwartej lub lustracji dna np. przystani.',
                                        'Kontrolowałem(-am) swoje ciało pod wodą, wykonałem(-am) tzw. korek.',
                                        'Pokazałem(-am) podstawowe znaki nurkowe stosowane do komunikacji pod wodą.',
                                        'Założyłem(-am) maskę pod wodą i wydmuchałem(-am) z niej wodę.',
                                        'Przepłynąłem(-ęłam) w płetwach dystans 50 metrów oddychając przez fajkę.'
                                  ]),

                              SprawData(
                                  id: 'foka',
                                  title: 'Foka',
                                  level: '3',
                                  comment: 'Jest płetwonurkiem uznanej organizacji nurkowej.',
                                  tasks: [
                                        'Zdobyłem(-am) podstawowy stopień płetwonurka (OWD) w uznanej federacji nurkowej (PADI, PSAI, SSI, SDI, NAUI, CMAS)'
                                  ]),

                              SprawData(
                                  id: 'foka',
                                  title: 'Foka',
                                  level: '4',
                                  comment: 'Jest zaawansowanym płetwonurkiem uznanej organizacji nurkowej.',
                                  tasks: [
                                        'Zdobyłem(-am) stopień zaawansowanego płetwonurka (AOWD) w uznanej federacji nurkowej (PADI, PSAI, SSI, SDI, NAUI, CMAS)'
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '5',
                        sprawData: [
                              SprawData(
                                  id: 'meteorolog',
                                  title: 'Meteorolog',
                                  level: '1',
                                  comment: 'Potrafi rozpoznać podstawowe zjawiska pogodowe.',
                                  tasks: [
                                        'Opowiedziałem(-am), co to jest wiatr.',
                                        'Pokazałem(-am) szkwał na jeziorze.',
                                        'Wyjaśniłem(-am), jak powstaje rosa, deszcz i śnieg.',
                                        'Przed wycieczką zastępu lub wachty wysłuchałem(-am) prognozy pogody w radio lub telewizji i na jej podstawie dobrałem(-am) odpowiednią odzież.',
                                        'Wytłumaczyłem(-am), ile stopni Celsjusza oznacza ciepło, ile zimno.'
                                  ]),

                              SprawData(
                                  id: 'meteorolog',
                                  title: 'Meteorolog',
                                  level: '2',
                                  comment: 'Rozpoznaje zjawiska pogodowe.',
                                  tasks: [
                                        'Narysowałem(-am) i wytłumaczyłem(-am), na czym polega zjawisko bryzy nocnej i dziennej.',
                                        'Będąc na wycieczce, spływie lub rejsie rozpoznałem(-am), z jaką siłą wieje wiatr w skali Beauforta.',
                                        'Zaobserwowałem(-am) chmurę cumulonimbus. Opowiedziałem(-am), jakie niesie ona zagrożenia.',
                                        'Wskazałem(-am) cztery oznaki, na podstawie których można przewidzieć dobrą lub złą pogodę.',
                                        'Opowiedziałem(-am), jaką wartość ma ciśnienie normalne oraz jakie wartości ma ciśnienie niskie i wysokie.'
                                  ]),

                              SprawData(
                                  id: 'meteorolog',
                                  title: 'Meteorolog',
                                  level: '3',
                                  comment: 'Potrafi określić i przewidzieć zjawiska pogodowe.',
                                  tasks: [
                                        'Zaprezentowałem(-am) skalę Beauforta w zakresie od 0 do 7 stopni. W czasie zajęć nad wodą pięć razy wskazałem(-am), z jaką siłą wieje wiatr.',
                                        'Posługiwałem(-am) się skalą stanu morza do określenia warunków na jeziorze.',
                                        'Rozpoznałem(-am) cztery rodzaje chmur na niebie. Opowiedziałem(-am), kiedy te chmury występują.',
                                        'Omówiłem(-am) powstawanie i działanie podstawowych zjawisk atmosferycznych (szkwał, deszcz, mgła, wiatr).',
                                        'Wytłumaczyłem(-am) zasadę działania systemu ostrzegania meteorologicznego na Wielkich Jeziorach Mazurskich.',
                                        'Przed zajęciami sprawdziłem(-am) prognozę pogody w serwisie internetowym. Przekazałem(-am) ją wachcie lub zastępowi.'
                                  ]),

                              SprawData(
                                  id: 'meteorolog',
                                  title: 'Meteorolog',
                                  level: '4',
                                  comment: 'Wykorzystuje prognozy pogody i wiedze meteorologiczną na poziomie zaawansowanym.',
                                  tasks: [
                                        'Zastosowałem(-am) numeryczne prognozy pogody z przynajmniej trzech serwisów.',
                                        'Przynajmniej raz ściągnąłem(-ęłam) i zastosowałem(-am) griby.',
                                        'Na podstawie mapy synoptycznej przewidziałem(-am) pogodę na najbliższą dobę.',
                                        'Wysłuchałem(-am) ze zrozumieniem prognozy pogody w języku angielskim.',
                                        'Przynajmniej raz odebrałem(-am) i zanotowałem(-am) morską prognozę pogody dla rybaków i żeglarzy.',
                                        'Zaprezentowałem(-am) pełną skalę Beauforta.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '6',
                        sprawData: [
                              SprawData(
                                  id: 'marynista',
                                  title: 'Marynista',
                                  level: '1',
                                  comment: 'Wie, jakie znaczenie dla Polski ma Morze Bałtyckie i jakie najważniejsze miejsca się nad nim znajdują. Zna podstawowe symbole używane przez Marynarkę Wojenną i marynarkę handlową. Zna przesądy żeglarskie.',
                                  tasks: [
                                        'Znalazłem(-am) w swoim otoczeniu 10 produktów, które mogły dotrzeć do Polski drogą morską oraz nazwałem(-am) przynajmniej trzy gatunki ryb żyjących w Bałtyku.',
                                        'Rozpoznałem(-am) Banderę Marynarki Wojennej RP i Proporzec Marynarki Wojennej RP, prawidłowo zachowałem(-am) się w czasie podniesienia Flagi Polski lub Bandery ZHP.',
                                        'Wymieniłem(-am) i wskazałem(-am) na mapie przynajmniej dwa duże polskie porty morskie, dwa znane ośrodki wypoczynkowe i dwa porty rybackie.',
                                        'Nazwałem(-am) oznaczenia funkcji na statku stosowane w marynarce handlowej.',
                                        'Zaśpiewałem(-am) przynajmniej jedną pieśń morską.',
                                        'Opowiedziałem(-am) o przynajmniej pięciu zwyczajach i przesądach żeglarskich.'
                                  ]),

                              SprawData(
                                  id: 'marynista',
                                  title: 'Marynista',
                                  level: '2',
                                  comment: 'Zna tradycje żeglarskie i postaci ważne dla harcerskiego ruchu wodnego. Rozpoznaje polskie i harcerskie bandery i proporce oraz żaglowce.',
                                  tasks: [
                                        'Poznałem(-am) pochodzenie marynarskiego munduru. Wytłumaczyłem(-am) genezę kroju kołnierza, trzech pasków na kołnierzu, czarnych krawatów i wstążek na czapce, rozszerzanych spodni i sznurków na rozcięciach munduru.',
                                        'Poznałem(-am) historię Władysława Wagnera i jachtów Zjawa.',
                                        'Wiem, kim byli Mariusz Zaruski, Witold Bublewski i Bolesław Romanowski. Opowiedziałem(-am) o życiu i dokonaniach wybranej postaci związanej z harcerskim ruchem wodnym.',
                                        'Dowiedziałem(-am) się, jakie ryby poławiane są na Morzu Bałtyckim oraz jakie produkty przyjmują polskie porty. Byłem(-am) w minimum jednym polskim porcie morskim.',
                                        'Rozpoznałem(-am) Banderę ZHP, Yacht Klubu Polski, Ligi Morskiej i Rzecznej oraz Jacht Klubu Marynarki Wojennej Kotwica. Rozpoznałem(-am) wygląd proporca drużynowego, retmana, pilota chorągwi i Naczelnika ZHP.',
                                        'Wybiłem(-am) prawidłowo szklanki na dzwonie ze wskazaniem godzin.',
                                        'Poznałem(-am) nazwy przynajmniej pięciu polskich żaglowców, pokazałem(-am) je na zdjęciach.'
                                  ]),

                              SprawData(
                                  id: 'marynista',
                                  title: 'Marynista',
                                  level: '3',
                                  comment: 'Zna historie Polskiej Marynarki Wojennej oraz Harcerskiego Ruchu Wodnego. Zna kilka szant i piosenek żeglarskich. Wie, jakie gatunki chronione są w Bałtyku i na czym polega ich ochrona.',
                                  tasks: [
                                        'Poznałem(-am) historię żaglowca Zawisza Czarny oraz Leonida Teligi i jego jachtu Opty.',
                                        'Poznałem(-am) położenie przynajmniej jednej polskiej platformy wiertniczej na Morzu Bałtyckim.',
                                        'Opowiedziałem(-am) przynajmniej jeden epizod z dziejów Polskiej Marynarki Wojennej w czasie II wojny światowej (np. ucieczka ORP Batory, internowanie i ucieczka ORP Orzeł, udział niszczycieli w Bitwie o Narwik, ochrona konwojów walki dywizjonu lotniczego z Pucka itp).',
                                        'Poznałem(-am) genezę i przebieg Bitwy pod Oliwą (1627).',
                                        'Dowiedziałem(-am) się, czym zajmuje się Stacja Morska na Helu i jakie są problemy ochrony fok i morświnów.',
                                        'Rozpoznałem(-am) różnicę pomiędzy szantą oraz piosenką żeglarską, zaśpiewałem(-am) cztery szanty i cztery pieśni kubryku.',
                                        'Prawidłowo zachowałem(-am) się wchodząc na jacht morski, prawidłowo oddałem(-am) salut Banderze, opisałem(-am) wygląd Wielkiej i Małej Gali Flagowej.',
                                        'Przeczytałem(-am) przynajmniej jedną książkę Karola Borchardta.'
                                  ]),

                              SprawData(
                                  id: 'marynista',
                                  title: 'Marynista',
                                  level: '4',
                                  comment: 'Zna porty morskie, interesuje się Morzem Bałtyckim, gatunkami w nim występującymi oraz krajami nadbałtyckimi. Poznałem żaglowiec ZHP s/y Zawisza Czarny.',
                                  tasks: [
                                        'Poznałem(-am) najważniejsze porty Polski i ich rolę dla polskiej gospodarki. Poznałem(-am) podstawowe fakty o wybranym polskim porcie morskim (np. wartość przeładowanych towarów, ilość przeładowanych towarów, rodzaje towarów przeładowywanych w polskich portach). Przedstawiłem(-am) zdobyte informacje w ciekawej formie.',
                                        'Rozpoznałem(-am) bandery wszystkich państw i obszarów leżących nad Morzem Bałtyckim Wskazałem(-am), gdzie jacht nosi banderę odwiedzanego kraju.',
                                        'Zgłębiłem(-am) problematykę występowania gatunków obcych w Morzu Bałtyckim i opowiedziałem(-am) o tych gatunkach i problemach z tym związanych swojemu zastępowi lub drużynie.',
                                        'Prowadziłem(-am) uroczystość podniesienia bandery na obozie lub rejsie, prawidłowo oddawałem(-am) honory Banderą.',
                                        'Brałem(-am) udział w rejsie lub odwiedziłem(-am) flagowy jacht ZHP s/y Zawisza Czarny.',
                                        'Za pomocą systemów opartych o AIS wskazałem(-am), gdzie aktualnie znajduje się s/y Zawisza Czarny, STS Dar Młodzieży.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '7',
                        sprawData: [
                              SprawData(
                                  id: 'szyper',
                                  title: 'Szyper',
                                  level: '1',
                                  comment: 'Aktywnie uczestniczy w żeglowaniu jachtem.',
                                  tasks: [
                                        'Podczas żeglugi obsługiwałem(-am) szoty foka, balastowałem(-am) oraz odpowiadałem(-am) na komendy żeglarskie.',
                                        'Podczas żeglugi wyczuwałem(-am) wiatr, pokazywałem(-am), skąd wieje, rozróżniałem(-am) halsy oraz bajdewind, półwiatr, baksztag i fordewind.',
                                        'Sterowałem(-am) na punkt oraz ostrzyłem(-am) i odpadałem(-am) na żaglach i w przód oraz wstecz na silniku, a następnie na podstawie obserwacji wyjaśniłem(-am) zasadę działania steru.',
                                        'Obsługiwałem(-am) cumę dziobową i rufową oraz odbijacze podczas manewrów portowych.',
                                        'Pagajowałem(-am) lub wiosłowałem(-am) na komendę w przód, wstecz i hamowałem(-am) pagajami lub wiosłami.',
                                        'Sterując awaryjnie, zatrzymałem(-am) jacht w linii wiatru.'
                                  ]),

                              SprawData(
                                  id: 'szyper',
                                  title: 'Szyper',
                                  level: '2',
                                  comment: 'Sprawnie i świadomie obsługuje stanowiska manewrowe podczas żeglowania jachtem.',
                                  tasks: [
                                        'Podczas żeglugi obsługiwałem(-am) jednocześnie ster i szot grota oraz obsługiwałem(-am) szoty foka aktywnie, wybierając i luzując żagiel do granicy łopotu.',
                                        'Wyjaśniłem(-am) konieczność halsowania pod wiatr i określenia kąt martwy oraz zaobserwowałem(-am) zależność pomiędzy kursem względem wiatru, przechyłem jachtu a pozorną prędkością wiatru.',
                                        'Jachtem typu ket lub slup o długości kadłuba poniżej 6 metrów wykonałem(-am) skuteczne i bezpieczne zwroty na wiatr i z wiatrem.',
                                        'Jachtem o długości kadłuba poniżej 6 metrów sterowałem(-am) przy podejściu do kei.',
                                        'Jednocześnie sterując i obsługując silnik, wykonałem(-am) cyrkulację i porównałem(-am) promienie skrętu w lewo i w prawo z silnikiem ustawionym na wprost oraz ze skrętem silnika podążającym za sterem.',
                                        'Awaryjnie stanąłem(-ęłam) jachtem w dryf oraz pełniłem(-am) funkcję obserwatora w czasie ćwiczenia alarmu „człowiek za burtą”.'
                                  ]),

                              SprawData(
                                  id: 'szyper',
                                  title: 'Szyper',
                                  level: '3',
                                  comment: 'Kieruje jachtem podczas manewrów pod żaglami i na silniku.',
                                  tasks: [
                                        'Podczas żeglugi kierowałem(-am) pracą załogi poprzez zapowiedź manewru, przydzielanie stanowisk i zadań oraz wydawanie i egzekwowanie komend we właściwym momencie.',
                                        'Porównałem(-am) przechył, prędkość i opór na sterze przed i po zarefowaniu żagli oraz wyjaśniłem(-am) innym siły działające na żagle, miecz i ster jachtu.',
                                        'Jachtem o długości kadłuba powyżej 5 metrów wykonałem(-am) skuteczne i bezpieczne manewry na żaglach: zwroty przez sztag i rufę, dojście i odejście od boi, żegluga na biegu wstecznym.',
                                        'Jachtem o długości kadłuba powyżej 5 metrów wykonałem(-am) skuteczne i bezpieczne manewry portowe: zatrzymania i dryfowania w basenie portowym (lub ograniczonym akwenie), podejścia rufą pod wiatr równolegle i prostopadle do kei.',
                                        'Jachtem o długości kadłuba powyżej 5 metrów wykonałem(-am) skuteczne i bezpieczne manewry na silniku: kotwiczenia i podejścia do boi w różnych warunkach.',
                                        'Jachtem o długości kadłuba powyżej 5 metrów wykonałem(-am) próbne manewry awaryjne: stanięcie w dryf oraz podejście do człowieka za burtą.'
                                  ]),

                              SprawData(
                                  id: 'szyper',
                                  title: 'Szyper',
                                  level: '4',
                                  comment: 'Kieruje jachtem podczas szkolenia i żeglugi swobodnej.',
                                  tasks: [
                                        'Podczas żeglugi kierowałem(-am) pracą załogi poprzez omówienie manewru planowego, zapasowego i awaryjnego, przydzielanie stanowisk i zadań oraz ustalenie zasad komunikacji w trakcie.',
                                        'Wyjaśniłem(-am) zasady optymalnego ustawienie żagli do panujących warunków oraz zademonstrowałem(-am) prawidłowy trym w różnych kursach względem wiatru, wskazując wiatr rzeczywisty i pozorny.',
                                        'Jachtem kabinowym o długości kadłuba powyżej 7,5 metrów wykonałem(-am) skuteczne i bezpieczne manewry na żaglach: zwroty przez sztag i rufę, dojście i odejście od boi, żegluga na biegu wstecznym.',
                                        'Jachtem kabinowym o długości kadłuba powyżej 7,5 metrów wykonałem(-am) skuteczne i bezpieczne manewry portowe: wejście między Y bomy rufą i dziobem do kei, cumowanie rufą do kei z użyciem mooringu lub boi.',
                                        'Jachtem mieczowym wykonałem(-am) skuteczny i bezpieczny manewr sztrandowania w celu postoju przy dzikim brzegu.',
                                        'Jachtem o długości kadłuba powyżej 7,5 metrów wykonałem(-am) próbne manewry awaryjne: stanięcie w dryf oraz podejście do człowieka za burtą na żaglach i na silniku.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '8',
                        sprawData: [
                              SprawData(
                                  id: 'bosman',
                                  title: 'Bosman',
                                  level: '1',
                                  comment: 'Uczestniczy w przygotowaniu jachtu do żeglugi i postoju.',
                                  tasks: [
                                        'Zawiązałem(-am) węzły: knagowy, ósemka, płaski, ratowniczy przed sobą i na sobie oraz zbuchtowałem(-am) linę.',
                                        'Sklarowałem(-am) żagle przed i po żeglowaniu.',
                                        'Wskazałem(-am) i nazwałem(-am) elementy jachtu: dziób, rufa, burty, grot, fok, maszt, szoty, bom, miecz, rumpel.',
                                        'Zmieniałem(-am) obroty i biegi oraz odstawiłem(-am) (wyłączyłem(-am)) silnik zaburtowy.'
                                  ]),

                              SprawData(
                                  id: 'bosman',
                                  title: 'Bosman',
                                  level: '2',
                                  comment: 'Aktywnie uczestniczy w przygotowaniu jachtu do żeglugi i postoju.',
                                  tasks: [
                                        'Zawiązałem(-am) węzły: rożkowy, wyblinka, cumowy żeglarski oraz z zakrytymi oczami zawiązałem(-am) węzły: knagowy, ósemka, płaski.',
                                        'Samodzielnie przygotowałem(-am) mały jacht do żeglugi i sklarowałem(-am) po pływaniu — zarefowałem(-am) i rozrefowałem(-am) żagiel, użyłem(-am) cum i szpringów oraz założyłem(-am) odbijacze tak, żeby skutecznie pracowały.',
                                        'Wskazałem(-am) i nazwałem(-am) elementy jachtu: kokpit, skrzynka mieczowa, sztagi, wanty, pieski, kabestan.',
                                        'Samodzielnie sprawdziłem(-am) poziom oleju w silniku benzynowym czterosuwowym lub Diesla oraz asystowałem(-am) podczas tankowania paliwa do zbiornika.'
                                  ]),

                              SprawData(
                                  id: 'bosman',
                                  title: 'Bosman',
                                  level: '3',
                                  comment: 'Potrafi bezpiecznie obsłużyć instalacje jachtowe, zacumować jacht, postawić i położyć maszt. Kieruje pracami załogi.',
                                  tasks: [
                                        'Nauczyłem(-am) inną osobę wiązać węzły z zakresu pierwszej gwiazdki (jungi) oraz wykonałem(-am) opaskę z juzingu na końcówce liny miękkiej.',
                                        'Wraz z załogą przesunąłem i obróciłem(-am) na cumach jacht przy kei. Zabezpieczyłem(-am) łódź zacumowaną wzdłuż kei (alongside) przy wietrze dopychającym z użyciem cum, szpringów i odbijaczy.',
                                        'Wyjaśniałem(-am) załodze zasady bezpiecznego korzystania z instalacji jachtowych oraz asystowałem(-am) przy wymianie akumulatora i butli gazowej na jachcie.',
                                        'Zademonstrowałem(-am) załodze czynności przy uruchamianiu i odstawianiu silnika zaburtowego oraz zatankowałem(-am) odpowiedni rodzaj paliwa do zbiornika jachtu.',
                                        'Wraz z załogą położyłem(-am) i postawiłem(-am) maszt.'
                                  ]),

                              SprawData(
                                  id: 'bosman',
                                  title: 'Bosman',
                                  level: '4',
                                  comment: 'Kieruje przygotowaniem jachtu do postoju i żeglugi. Zna bardziej zaawansowane węzły i sploty. Potrafi obsługiwać instalacje jachtowe, wyjaśnić ich działanie. Wie, jak taklować lub roztaklować jacht.',
                                  tasks: [
                                        'Wyjaśniłem(-am) zasady użycia oraz nauczyłem(-am) inną osobę wiązać węzły z zakresu pierwszej i drugiej gwiazdki oraz samodzielnie wykonałem(-am) dodatkowe prace linowe, np. opaskę turecką, kulkę bosmańską, sploty na linach miękkich.',
                                        'Wyjaśniałem(-am), demonstrowałem(-am) czynności oraz kierowałem(-am) pracą załogi podczas przygotowania jachtu do żeglugi i postoju.',
                                        'Samodzielnie wymieniłem(-am) butlę gazową i akumulator na jachcie oraz podłączyłem(-am) akumulator do ładowania z lądu lub na lądzie.',
                                        'Wyjaśniłem(-am) i zademonstrowałem(-am) sprawdzanie oleju, paliwa i chłodzenia w silniku zaburtowym lub stacjonarnym oraz samodzielnie wykręciłem(-am) świecę w silniku benzynowym w celu sprawdzenia iskry.',
                                        'Uczestniczyłem(-am) w taklowaniu jachtu przed pierwszym pływaniem lub w zabezpieczeniu jachtu po sezonie, lub w slipowaniu lub wodowaniu jachtu.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '9',
                        sprawData: [
                              SprawData(
                                  id: 'nawigator',
                                  title: 'Nawigator',
                                  level: '1',
                                  comment: 'Używa kompasu, czyta mapy papierowe i korzysta z wyszukiwania na mapach cyfrowych.',
                                  tasks: [
                                        'Wskazałem(-am) z pomocą kompasu północ i południe oraz wschód i zachód.',
                                        'Wskazałem(-am) na mapie i opowiedziałem(-am) o zbiornikach wodnych w mojej okolicy.',
                                        'Odszukałem(-am) na mapie nazwę cieku lub rzeki, która przepływa w mojej najbliższej okolicy oraz sprawdziłem(-am), dokąd ona płynie i do której zlewni należy.',
                                        'Zaplanowałem(-am) podróż do innego miasta środkami komunikacji publicznej za pomocą internetowego serwisu mapowego (Google Maps, Jak Dojadę, itp.).',
                                        'Podczas wędrówki obejrzałem(-am) budowlę hydrotechniczną: śluzę, tamę lub jaz.'
                                  ]),

                              SprawData(
                                  id: 'nawigator',
                                  title: 'Nawigator',
                                  level: '2',
                                  comment: 'Używa kompasu i odbiornika satelitarnego, orientuje się w przestrzeni na podstawie mapy papierowe lub cyfrowej.',
                                  tasks: [
                                        'Wyznaczyłem(-am) azymut na mapie i w terenie, posługując się kompasem magnetycznym.',
                                        'Ustaliłem(-am) współrzędne geograficzne swojego domu lub namiotu oraz kilku wybranych punktów w mojej okolicy przy użyciu odbiornika nawigacji satelitarnej (np. aplikacja GPS w telefonie).',
                                        'Zorientowałem(-am) mapę papierową na podstawie obiektów w terenie.',
                                        'Podczas poruszania się po wodzie wskazałem(-am) obiekty na brzegu na podstawie mapy lub opisu.',
                                        'Wskazałem(-am) na mapie jezioro rynnowe, morenowe i sztuczny zalew oraz omówiłem(-am) ich cechy istotne dla żeglarzy.'
                                  ]),

                              SprawData(
                                  id: 'nawigator',
                                  title: 'Nawigator',
                                  level: '3',
                                  comment: 'Świadomie używa odbiornika satelitarnego, wykonuje proste pomiary i obliczenia na mapie, monitoruje realizację planu podróży na wodzie.',
                                  tasks: [
                                        'W aplikacji lub odbiorniku nawigacji satelitarnej (GPS) zapisałem(-am) przebytą drogę podczas wędrówki. Wyświetliłem(-am) na mapie cyfrowej, sprawdziłem(-am) i omówiłem(-am) kompletność oraz dokładność swojego śladu.',
                                        'Zorientowałem(-am) się w przestrzeni i wskazałem(-am) kierunek północny na podstawie położenia słońca i gwiazd.',
                                        'Zmierzyłem(-am) drogę na papierowej mapie turystycznej oraz, znając swoją prędkość, obliczyłem(-am) czas dotarcia do celu (ETA).',
                                        'Podczas rejsu lub spływu korzystałem(-am) z przewodników (locji) i opisów dróg wodnych, portów itp.',
                                        'Omówiłem(-am) elementy regulujące nurt rzeki: opaska, ostroga, tama równoległa oraz żółte romby na przęsłach mostu.'
                                  ]),

                              SprawData(
                                  id: 'nawigator',
                                  title: 'Nawigator',
                                  level: '4',
                                  comment: 'Używa map elektronicznych i papierowych oraz pomocy nawigacyjnych do planowania i realizacji podróży morskiej.',
                                  tasks: [
                                        'W aplikacji lub chartploterze do nawigacji jachtowej ustawiłem(-am) i aktywowałem(-am) punkty (waypoints) oraz trasę (route) żeglugi.',
                                        'Określiłem(-am) pozycję jachtu na papierowej mapie morskiej na podstawie obserwacji dwóch punktów oraz na podstawie obserwacji jednego punktu i pomiaru głębokości.',
                                        'Wyznaczyłem(-am) na papierowej mapie morskiej pozycję jachtu na podstawie kursu, prędkości, czasu itd. od ostatniej pozycji obserwowanej.',
                                        'Przeczytałem(-am) w locji opisy i obejrzałem(-am) na mapie podejścia do trzech portów morskich i zatokowych w Polsce. Zrobiłem(-am) notatki, na podstawie których opowiedziałem(-am) innym o każdym z nich.',
                                        'Podczas żeglugi zidentyfikowałem(-am) na mapie mijane i widoczne obiekty na wodzie i na brzegu.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '10',
                        sprawData: [
                              SprawData(
                                  id: 'jurysta_morski',
                                  title: 'Jurysta morski',
                                  level: '1',
                                  comment: 'Stosuje podstawowe przepisy prawa drogi i ochrony środowiska.',
                                  tasks: [
                                        'Rozróżniałem(-am) napędy mijanych jednostek na wodzie i stosowałem(-am) prawo drogi: (1) żagle (2) wiosła (3) silnik.',
                                        'Dowiedziałem(-am) się, jak mijają się dwie łodzie wiosłowe płynące z przeciwka, aby uniknąć zderzenia (lewymi burtami).',
                                        'Rozpoznałem(-am) na wodzie „duże” statki, który mają prawo drogi przed jednostkami rekreacyjnymi.',
                                        'Zwracałem(-am) uwagę na mijane znaki na drodze wodnej i dowiedziałem(-am) się, co one oznaczają.',
                                        'Śmieci powstające na jachcie podczas żeglugi zabrałem(-am) do odpowiedniego śmietnika na lądzie.'
                                  ]),

                              SprawData(
                                  id: 'jurysta_morski',
                                  title: 'Jurysta morski',
                                  level: '2',
                                  comment: 'Stosuje typowe przepisy prawa drogi i ochrony środowiska.',
                                  tasks: [
                                        'Zastosowałem(-am) na wodzie zasadę „wyprzedany ma prawo drogi przed wyprzedającym”.',
                                        'Ustaliłem(-am) hals mijanych jachtów na żaglach. Zastosowałem(-am) odpowiednio zasadę „prawy hals przed lewym halsem”.',
                                        'W trakcie żeglugi regularnie zaglądałem(-am) pod żagiel, aby sprawdzić, czy po zawietrznej znajduje się jacht, któremu należy ustąpić drogi.',
                                        'Płynąc na silniku, przy spotkaniu z motorówką, zastosowałem(-am) zasadę „prawej strony” do ustalenia prawa drogi.',
                                        'Opowiedziałem(-am), jakie są prawne ograniczenia prowadzenia jachtów żaglowych i motorowych po wodach śródlądowych bez patentu.',
                                        'Wyjaśniłem(-am) negatywny wpływ odpadków spożywczych (biodegradowalnych) oraz innych śmieci na środowisko wodne.'
                                  ]),

                              SprawData(
                                  id: 'jurysta_morski',
                                  title: 'Jurysta morski',
                                  level: '3',
                                  comment: 'Stosuje przepisy prawa drogi i zasady ochrony środowiska na wodach śródlądowych.',
                                  tasks: [
                                        'Prowadziłem(-am) jacht pod żaglami przy spotkaniu z innym jachtem oraz przy wyprzedzaniu.',
                                        'Prowadziłem(-am) jacht żaglowy na silniku przy spotkaniu z innym jachtem oraz przy wyprzedzaniu.',
                                        'Wyjaśniłem(-am) znaczenie czerwonego, zielonego lub białego światła poruszającego się nocą po wodzie.',
                                        'Rozpoznałem(-am) typ oraz znaczenie wskazanych znaków żeglugowych.',
                                        'Dowiedziałem(-am) się, jakie uprawnienia na wodach śródlądowych posiadają posiadacze patentów żeglarskich.',
                                        'Zdałem(-am) śmieci z jachtu na ląd oraz zabezpieczyłem(-am) używane i zużyte płyny (paliwo, oleje, rozpuszczalniki, farby itp.) przed przedostaniem się do wody.'
                                  ]),

                              SprawData(
                                  id: 'jurysta_morski',
                                  title: 'Jurysta morski',
                                  level: '4',
                                  comment: 'Stosuje przepisy prawa drogi i zasady ochrony środowiska na wodach morskich. Zna oznaczenie szlaku żeglownego, rozpoznaje statki po oznakowaniu dziennym i nocnym.',
                                  tasks: [
                                        'Podczas żeglugi oceniłem(-am) ryzyko zderzenia na podstawie obserwacji namiaru burtowego oraz podjąłem(-ęłam) działanie zgodne z prawidłami MPZZM (colreg).',
                                        'Podczas żeglugi prowadzałem(-am) obserwację m.in. znaków i sieci, innych jednostek, śmieci w wodzie, głębokości oraz nasłuch radiowy.',
                                        'Wyjaśniłem(-am), jak rozpoznać statek: (1) nieodpowiadający za swoje ruchy, (2) wyprzedzany, (3) o ograniczonej zdolności manewrowej, (4) ograniczony swoim zanurzeniem, (5) zajęty połowem, (6) żaglowy i o napędzie mechanicznym w dzień i w nocy.',
                                        'Wyjaśniłem(-am) różnice pomiędzy oznaczeniem kierunku oznakowania szlaku żeglownego na wodach śródlądowych i morskich.',
                                        'Dowiedziałem(-am) się, jakie uprawnienia na wodach morskich posiadają posiadacze patentów żeglarskich.',
                                        'Przed żeglowaniem wyjaśniłem(-am) oraz podczas rejsu nadzorowałem(-am) przestrzegania zasad ochrony środowiska przez załogę.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '11',
                        sprawData: [
                              SprawData(
                                  id: 'mechanik',
                                  title: 'Mechanik',
                                  level: '1',
                                  comment: 'Potrafi bezpiecznie zachować się na jachcie motorowym, zna jego podstawową budowę.',
                                  tasks: [
                                        'Poznałem(-am) zasady bezpieczeństwa panujące na jachcie motorowodnym.',
                                        'Poznałem(-am) podstawową budowę łodzi motorowodnej oraz małego silnika zaburtowego.',
                                        'Zawiązałem(-am) 10 węzłów.',
                                        'Przepłynąłem(-am) łodzią o napędzie motorowym jako załogant.'
                                  ]),

                              SprawData(
                                  id: 'mechanik',
                                  title: 'Mechanik',
                                  level: '2',
                                  comment: 'Potrafi prawidłowo używać silnika, dbać o niego i sprawdzić podstawowe parametry.',
                                  tasks: [
                                        'Poznałem(-am) szczegółową budowę łodzi motorowodnej oraz zasady działania silnika dwu- i czterosuwowego.',
                                        'Przygotowałem(-am) silnik do uruchomienia. Sklarowałem(-am) go po pływaniu.',
                                        'Sprawdziłem(-am) poziom oleju i stan paliwa w silniku.',
                                        'Korzystając z pomocy innych, prawidłowo zamontowałem(-am) silnik przyczepny na pawęży lub pantografie.'
                                  ]),

                              SprawData(
                                  id: 'mechanik',
                                  title: 'Mechanik',
                                  level: '3',
                                  comment: 'Poznaje bardziej skomplikowane silniki, potrafi samodzielnie przygotować, sklarować i zabezpieczyć silnik oraz wykonać proste naprawy.',
                                  tasks: [
                                        'Poznałem(-am) budowę mocniejszych silników zaburtowych oraz stacjonarnych, zasady ich działania i metody przenoszenia napędu.',
                                        'Przygotowałem(-am) samodzielnie łódź i silnik do wypłynięcia. Sklarowałem(-am) i zabezpieczyłem(-am) go po pływaniu.',
                                        'Wykonałem(-am) prostą naprawę lub konserwację silnika zaburtowego lub jego elementu.',
                                        'Nauczyłem(-am) inną osobę budowy małego silnika zaburtowego.'
                                  ]),

                              SprawData(
                                  id: 'mechanik',
                                  title: 'Mechanik',
                                  level: '4',
                                  comment: 'Potrafi dokonać trudniejszych napraw w większych silnikach, wymienić i wyregulować niezbędne elementy.',
                                  tasks: [
                                        'Oceniłem(-am) stan techniczny pędnika, mechanizmu przenoszenia napędu oraz mechanizm sterujący. Wymieniłem(-am) uszkodzony pędnik w silniku stacjonarnym.',
                                        'Samodzielnie wymieniłem(-am) olej, filtr paliwa i oleju w silniku stacjonarnym.',
                                        'Dokonałem(-am) zabiegów regulacyjnych silnika.',
                                        'Kontrolowałem(-am) i oceniłem(-am) pracę silnika, poziom ciśnienia oleju, działanie układu chłodniczego oraz ładowania akumulatora.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '12',
                        sprawData: [
                              SprawData(
                                  id: 'szyper_motorowodny',
                                  title: 'Szyper motorowodny',
                                  level: '1',
                                  comment: 'Potrafi uruchomić silnik, trzymać kurs i zmieniać biegi na silniku.',
                                  tasks: [
                                        'Prawidłowo uruchomiłem(-am) mały silnik zaburtowy.',
                                        'Byłem(-am) załogantem na łodzi motorowodnej.',
                                        'Poznałem(-am) budowę łodzi motorowodnej.',
                                        'Trzymałem(-am) kurs i zmieniałem(-am) biegi.'
                                  ]),

                              SprawData(
                                  id: 'szyper_motorowodny',
                                  title: 'Szyper motorowodny',
                                  level: '2',
                                  comment: 'Potrafi prowadzić jacht motorowy i wykonać podstawowe manewry.',
                                  tasks: [
                                        'Prowadziłem(-am) jacht motorowy, gdy na akwenie znajdowały się też inne jednostki.',
                                        'Wykonałem(-am) manewry: odejście od nadbrzeża, dojście do nadbrzeża, alarm „człowiek za burtą”, kotwiczenia.',
                                        'Poznałem(-am) prawo drogi, szczególnie dotyczące jachtów motorowych. Stosowałem(-am) zasady podczas pływania.',
                                        'Poznałem(-am) niebezpieczeństwa, które mogą pojawić się na łódce oraz zapobiegałem(-am) im.'
                                  ]),

                              SprawData(
                                  id: 'szyper_motorowodny',
                                  title: 'Szyper motorowodny',
                                  level: '3',
                                  comment: 'Potrafi prowadzić jacht motorowy w trudniejszych warunkach. Wie, jak przeprowadzić akcję ratunkową przy pomocy jachtu motorowego.',
                                  tasks: [
                                        'Poznałem(-am) prawo panujące na wodach śródlądowych - oznaczenie szlaków żeglownych, podstawy locji, sygnały dźwiękowe. Wskazałem(-am) kilka znaków i boi oraz opowiedziałem(-am), co one oznaczają.',
                                        'Brałem(-am) udział w akcji ratunkowej z wykorzystaniem łodzi motorowodnej.',
                                        'W trudnych warunkach pogodowych wykonałem(-am) manewry: odejście od nadbrzeża, dojście do nadbrzeża, alarm „człowiek za burtą”, kotwiczenia, holowania.',
                                        'Kierowałem(-am) załogą jachtu motorowego, wydawałem(-am) komendy i egzekwowałem(-am) ich wykonanie we właściwym momencie.'
                                  ]),

                              SprawData(
                                  id: 'szyper_motorowodny',
                                  title: 'Szyper motorowodny',
                                  level: '4',
                                  comment: 'Manewruje większymi jachtami motorowymi. Ma doświadczenie w rejsach.',
                                  tasks: [
                                        'Pełniłem(-am) funkcję osoby odpowiedzialnej za maszynownię i instalacje jachtowe w czasie rejsu morskiego lub śródlądowego.',
                                        'Manewrowałem(-am) jachtem motorowym o długości większej niż 8 metrów, wykonałem(-am) manewry podejścia i odejścia od kei, cyrkulacji, człowiek za burtą.',
                                        'Sterowałem(-am) jachtem wyposażonym w napęd motorowy za pomocą kierownicy lub koła sterowego.',
                                        'Odbyłem(-am) dwa rejsy po wodach morskich w łącznym czasie co najmniej 200 godzin żeglugi.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '13',
                        sprawData: [
                              SprawData(
                                  id: 'kajakarz',
                                  title: 'Kajakarz',
                                  level: '1',
                                  comment: 'Pływa kajakiem, prawidłowo wiosłuje wiosłem kajakowym, przestrzega zasad bezpieczeństwa.',
                                  tasks: [
                                        'Uczestniczyłem(-am) w co najmniej jednym spływie kajakowym.',
                                        'W czasie spływów zachowałem(-am) się bezpiecznie, zawsze używałem(-am) kamizelki.',
                                        'Wsiadłem(-am) do kajaka z brzegu i/lub z pomostu lub kei.',
                                        'Wskazałem(-am) i nazwałem(-am) części kajaka - dziób, rufę, prawą i lewą burtę oraz kokpit.',
                                        'Bezpiecznie pokonałem(-am) przeszkodę podczas spływu.',
                                        'Potrafię pływać. Zdobyłem(-am) kartę pływacką.'
                                  ]),

                              SprawData(
                                  id: 'kajakarz',
                                  title: 'Kajakarz',
                                  level: '2',
                                  comment: 'Skutecznie kieruje kajakiem. Czyta locje rzeki. Wie, jak spakować kajak na spływ.',
                                  tasks: [
                                        'Uczestniczyłem(-am) w co najmniej trzech spływach kajakowych.',
                                        'Wiosłowałem(-am) na wprost i wstecz oraz zawróciłem(-am) kajakiem.',
                                        'Potrafię czytać locję rzeki. Podczas spływu sterowałem(-am) kajakiem tak, aby nie wpłynąć na przeszkody. Pokazałem(-am) innym, na jakie miejsca na rzece należy uważać.',
                                        'WPoprawnie spakowałem(-am) się na spływ i wymieniłem(-am) elementy ekwipunku na spływ jednodniowy.',
                                        'Wszedłem(-am) do kajaka z wody płytkiej.',
                                        'Uczestniczyłem(-am) w załadunku i wyładunku kajaków.'
                                  ]),

                              SprawData(
                                  id: 'kajakarz',
                                  title: 'Kajakarz',
                                  level: '3',
                                  comment: 'Zna i używa bardziej zaawansowanych technik wiosłowania i sterowania kajakiem. Potrafi udzielić pomocy podczas wywrotki kajaka.',
                                  tasks: [
                                        'Uczestniczyłem(-am) w co najmniej pięciu spływach kajakowych w tym przynajmniej raz z noclegiem.',
                                        'Pokazałem(-am), jak piórkować.',
                                        'W czasie wiosłowania wykorzystałem(-am) kontrę sterującą.',
                                        'Skompletowałem(-am) sprzęt ratowniczy na spływ, podałem(-am) rzutkę ratowniczą (na ziemi)',
                                        'Brałem(-am) udział w pozorowanej wywrotce kajaka.',
                                        'Znam zasady rozłożenia ładunku w kajaku na spływ wielodniowy, zaprezentowałem(-am) je podczas pakowania i opowiedziałem(-am), jak rozłożyć ciężar',
                                  ]),

                              SprawData(
                                  id: 'kajakarz',
                                  title: 'Kajakarz',
                                  level: '4',
                                  comment: 'Steruje kajakiem tak, aby pływać bezpiecznie. Potrafi zaplanować i poprowadzić spływ kajakowy.',
                                  tasks: [
                                        'Uczestniczyłem(-am) w co najmniej 10 spływach kajakowych na różnych akwenach w tym co najmniej w dwóch wielodniowych.',
                                        'Wiem, co to jest kabina. Zaprezentowałem(-am), jak ją wykonać.',
                                        'Opowiedziałem(-am), jak pomóc wywróconemu kajakowi, holowałem(-am) kajakarza na dziobie swojego kajaka.',
                                        'Pełniłem(-am) funkcję osoby zamykającej spływ lub prowadzącej.',
                                        'Wziąłem(wzięłam) udział w spływie w charakterze obsługi spływu.',
                                        'Napisałem(-am) plan spływu. Zrobiłem(-am) to w oparciu o przepisy państwowe jak i związkowe.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '14',
                        sprawData: [
                              SprawData(
                                  id: 'zwiadowca_wodny',
                                  title: 'Zwiadowca wodny',
                                  level: '1',
                                  comment: 'Zna pospolitą faunę i florę wodną. Potrafi rozpoznać podstawowe budowle hydrotechniczne. Wie, jakie zbiorniki wodne znajdują się w pobliżu jego miejsca zamieszkania.',
                                  tasks: [
                                        'Brałem(-am) udział w zwiadzie jeziora lub stawu (wody stojącej).',
                                        'Rozpoznałem(-am) pospolite okazy flory i fauny wodnej (np. trzcina, tatarak, moczarka kanadyjska, kaczka krzyżówka, rybitwa).',
                                        'Rozpoznałem(-am) na ilustracji lub w terenie zaporę, śluzę, jaz i opisałem(-am) do czego służą.',
                                        'Scharakteryzowałem(-am) różnice między kanałem a rzeką. Przedstawiłem(-am) przykład kanału i rzeki.',
                                        'Wskazałem(-am) na mapie zbiorniki wodne znajdujące się w okolicy miejsca zamieszkania.'
                                  ]),

                              SprawData(
                                  id: 'zwiadowca_wodny',
                                  title: 'Zwiadowca wodny',
                                  level: '2',
                                  comment: 'Zna najważniejsze zbiorniki wodne Polski. Rozpoznaje chronione gatunki i budowle hydrotechniczne, które może spotkać na rzece.',
                                  tasks: [
                                        'Rozpoznałem(-am) na ilustracji lub w terenie faszynę, opaskę, ostrogę i opisałem(-am) do czego służą.',
                                        'Narysowałem(-am) z pamięci mapę konturową Polski i naniosłem(-am) na nią najważniejsze rzeki, kanały, jeziora, zalewy, porty śródlądowe i morskie.',
                                        'Przedstawiłem(-am) definicje dorzecza, działu wodnego, zlewiska. Podałem(-am) kilka przykładów rzek Polski z przyporządkowaniem do odpowiednich dorzeczy.',
                                        'Rozpoznałem(-am) trzy chronione gatunki roślin wodnych, np. grążel żółty, grzybienie białe, kosaciec syberyjski.',
                                        'Podałem(-am) klasyfikację rzek Polski pod względem malowniczości wraz z przykładami.'
                                  ]),

                              SprawData(
                                  id: 'zwiadowca_wodny',
                                  title: 'Zwiadowca wodny',
                                  level: '3',
                                  comment: 'Potrafi czytać rzekę, wie jak jest zbudowana. Interesuje się turystyką związaną ze zbiornikami wodnymi w swojej okolicy.',
                                  tasks: [
                                        'Przeprowadziłem(-am) zwiad rzeki na długości 100 metrów, oceniając napotkane trudności i przedstawiając bezpieczne sposoby ich pokonania.',
                                        'Przedstawiłem(-am) na schemacie lub modelu budowę rzeki. Poprawnie rozpoznałem(-am) zjawiska zachodzące na powierzchni rzeki (bystrze, mielizna itp.).',
                                        'Przedstawiłem(-am) zasadę działania śluzy oraz zasady obowiązujące podczas śluzowania.',
                                        'Scharakteryzowałem(-am) klasyfikację trudności rzek.',
                                        'Scharakteryzowałem(-am) rzeki, jeziora, zbiorniki wodne z terenu swojego powiatu pod kątem walorów turystycznych.'
                                  ]),

                              SprawData(
                                  id: 'zwiadowca_wodny',
                                  title: 'Zwiadowca wodny',
                                  level: '4',
                                  comment: 'Potrafi przygotować bezpieczny spływ. Zna szlaki wodne w swoim województwie.',
                                  tasks: [
                                        'Przedstawiłem(-am) zasady organizacji spływu i przepisy obowiązujące podczas spływu.',
                                        'Opracowałem(-am) trasę spływu, uwzględniając wiek i umiejętności uczestników.',
                                        'Wytłumaczyłem(-am) pojęcia: zlewnia, zlewisko, dorzecze, dział wodny, ciek wodny, rzeka uregulowana lub skanalizowana, rzeka spławna lub żeglowna, spadek lub spad rzeki, rzeka stała, okresowa lub epizodyczna, rzeka wodospadowa, górska lub nizinna, melioracja, irygacja, retencja, eutrofizacja.',
                                        'Scharakteryzowałem(-am) szlaki wodne swojego województwa pod względem stopnia trudności, klasy czystości oraz walorów turystycznych.',
                                        'Sporządziłem(-am) listę niezbędnego ekwipunku spływowego, wyposażyłem(-am) skrzynkę bosmańską na spływ.'
                                  ]),

                        ]
                    ),

                    SprawFamilyData(
                        id: '15',
                        sprawData: [
                              SprawData(
                                  id: 'wiking',
                                  title: 'Wiking',
                                  level: '1',
                                  comment: 'Potrafię bezpiecznie zachować się na łodzi.',
                                  tasks: [
                                        'Wziąłem(wzięłam) udział w przynajmniej kilkugodzinnej wycieczce wodnej jako wioślarz na kajaku, kanadyjce lub czółnie (np. wzdłuż brzegu jeziora albo na łatwej rzece).',
                                        'Brałem(-am) udział w regatach na kanadyjce lub łodzi wiosłowej.',
                                        'Zamieniłem(-am) się miejscem ze sternikiem nie wychodząc z łodzi.',
                                        'Bezpiecznie przeszedłem(przeszłam) z łódki do łódki na wodzie.'
                                  ]),

                              SprawData(
                                  id: 'wiking',
                                  title: 'Wiking',
                                  level: '2',
                                  comment: 'Wiem, jak zachować się podczas wywrotki kanadyjki.',
                                  tasks: [
                                        'Wziąłem(wzięłam) udział w kilkudniowym spływie jako sternik łodzi wiosłowej lub kanadyjki na rzece o niskim stopniu trudności.',
                                        'Uczestniczyłem(-am) w ćwiczeniach z wywrotek kanadyjek. Przygotowałem(-am) wywróconą łódź do pływania.',
                                        'Wsiadłem(-am) do kanadyjki na płytkiej i głębokiej wodzie.'
                                  ]),

                              SprawData(
                                  id: 'wiking',
                                  title: 'Wiking',
                                  level: '3',
                                  comment: 'Potrafię zarządzać załogą i dowodzić łodzią oraz zorganizować miejsce noclegu mojego zastępu.',
                                  tasks: [
                                        'Wziąłem(wzięłam) udział w trwającym min. tydzień spływie na rzece o średnim stopniu trudności z min. jedną przenoską.',
                                        'Zarządzałem(-am) załogą podczas przenoski na spływie.',
                                        'Dowodziłem(-am) czółnem na rzece.',
                                        'Zorganizowałem(-am) biwak dla zastępu na spływie, pamiętając o poprawnym rozbiciu namiotu, zabezpieczeniu sprzętu kuchennego i żywności, klarowaniu i zabezpieczeniu łodzi.'
                                  ]),

                              SprawData(
                                  id: 'wiking',
                                  title: 'Wiking',
                                  level: '4',
                                  comment: 'Potrafię dowodzić i organizować pływania wielu jednostek.',
                                  tasks: [
                                        'Dowodziłem(-am) patrolem podczas spływu. Przygotowałem(-am) niezbędne dokumenty, zatwierdziłem(-am) spływ w komendzie hufca.',
                                        'Wziąłem(wzięłam) udział w spływie rzeką o charakterze górskim.',
                                        'Zorganizowałem(-am) regaty wioślarskie dla drużyny.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '16',
                        sprawData: [
                              SprawData(
                                  id: 'bosman_wioslarski',
                                  title: 'Bosman wioślarski',
                                  level: '1',
                                  comment: 'Zna budowę łodzi wiosłowej i nazwy elementów podstawowego osprzętu. Umie sklarować łódkę i przygotować niezbędne wyposażenie.',
                                  tasks: [
                                        'Brałem(-am) udział w wodowaniu łodzi i wyciąganiu jej na brzeg.',
                                        'Sklarowałem(-am) łódź przed i po pływaniu.',
                                        'Skompletowałem(-am) wyposażenie łodzi do pływania (odpowiednie wiosła, kamizelki, klarszmata, cuma).',
                                        'Zawiązałem(-am) węzły: ósemka, ratowniczy, cumowniczy.',
                                        'Poprawnie wskazałem(-am) nazwy części łodzi wiosłowej (dziób, rufa, prawa i lewa burta, dno, kokpit, bakista lub luk). Nazwałem(-am) osprzęt jachtowy używany na kajaku lub kanadyjce (ucho cumownicze, kipa, knaga).'
                                  ]),

                              SprawData(
                                  id: 'bosman_wioslarski',
                                  title: 'Bosman wioślarski',
                                  level: '2',
                                  comment: 'Wie, jak zabezpieczyć sprzęt na zimę i dokonać prostych napraw. Zna kilka węzłów.',
                                  tasks: [
                                        'Dowodziłem(-am) zastępem podczas wodowania i wyciągania łodzi.',
                                        'Uczestniczyłem(-am) w zabezpieczeniu sprzętu pływającego na zimę.',
                                        'Dokonałem(-am) przeglądu pagajów lub wioseł. Pod okiem bosmana naprawiłem(-am) zauważone uszkodzenia – szlifowałem(-am), lakierowałem(-am).',
                                        'Zbuchtowałem(-am) linę, zakończyłem(-am) linę opaską.',
                                        'Zastosowałem(-am) węzły: ósemkę, sztyk, żeglarski, rybacki, kotwiczny, knagowy, wyblinkę, flagowy, rożkowy i ratowniczy.'
                                  ]),

                              SprawData(
                                  id: 'bosman_wioslarski',
                                  title: 'Bosman wioślarski',
                                  level: '3',
                                  comment: 'Posługuje się narzędziami i elektronarzędziami przy bardziej zaawansowanych naprawach, dbając o bezpieczeństwo.',
                                  tasks: [
                                        'Uczestniczyłem(-am) w naprawach łodzi laminatowych – czyściłem(-am), szlifowałem(-am), malowałem(-am) elementy kadłuba pod nadzorem.',
                                        'Posługiwałem(-am) się piłami ręcznymi, tarnikiem, pilnikiem, dłutem, heblem, wiertarką, szlifierką kątową i oscylacyjną podczas zbiórki bosmańskiej.',
                                        'Podczas prac szkutniczych stosowałem(-am) zasady BHP i odpowiednią odzież ochronną (rękawice, maseczka).',
                                        'Opracowałem(-am) sposób doraźnej naprawy kajaka lub kanadyjki na spływie. Przygotowałem(-am) skrzynkę bosmańską z niezbędnym sprzętem, który zabrałem(-am) na spływ.'
                                  ]),

                              SprawData(
                                  id: 'bosman_wioslarski',
                                  title: 'Bosman wioślarski',
                                  level: '4',
                                  comment: 'Samodzielnie dokonuje większych napraw, dba o bezpieczeństwo swoje i innych.',
                                  tasks: [
                                        'Samodzielnie dokonałem(-am) naprawy uszkodzenia łodzi laminatowej – oczyściłem(-am) uszkodzone miejsce, laminowałem(-am), szlifowałem(-am) łatę, malowałem(-am) powierzchnię, odpowiednio zadbałem(-am) o narzędzia.',
                                        'Opracowałem(-am) zasady BHP podczas posługiwania się narzędziami tradycyjnymi i elektrycznymi.',
                                        'Samodzielnie wykonałem(-am) pagaj lub wiosło.'
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '17',
                        sprawData: [
                              SprawData(
                                  id: 'oryl',
                                  title: 'Oryl',
                                  level: '1',
                                  comment: 'Potrafi poprawnie wiosłować i bezpiecznie zachować się na łodzi.',
                                  tasks: [
                                        'Poprawnie wiosłowałem(-am) pagajem na czółnie lub kanadyjce lub wiosłem na kajaku i odpowiednio reagowałem(-am) na komendy sternika',
                                        'Wsiadłem(-am) i wysiadłem(-am) z lub do kanadyjki lub kajaka z brzegu i pomostu.',
                                        'Odbiłem(-am) i dobiłem(-am) do brzegu oraz podawałem(-am) cumę na wodzie stojącej.',
                                        'Wraz z zastępem zbudowałem(-am) tratwę z materiałów, które są pod ręką. Wprawiłem(-am) tratwę w ruch i pokonałem(-am) na niej co najmniej 50 metrów.'
                                  ]),

                              SprawData(
                                  id: 'oryl',
                                  title: 'Oryl',
                                  level: '2',
                                  comment: 'Potrafi sterować łodzią wiosłową i wiosłować wiosłami w dulkach.',
                                  tasks: [
                                        'Pokonałem(-am) tor slalomowy na wodzie stojącej, płynąc jako sternik kajaka lub kanadyjki.',
                                        'Odbiłem(-am) i dobiłem(-am) do brzegu w wybranym miejscu na rzece.',
                                        'Poprawnie wydawałem(-am) wioślarzowi komendy na wiosła oraz podczas odchodzenia i podchodzenia do kei.',
                                        'Poprawnie wiosłowałem(-am) dwoma wiosłami w dulkach (na bączku lub wędkarskiej lub szalupie ratowniczej).',
                                        'Przeprawiłem(-am) się przez rzekę lub zatokę jeziora na belce, zabezpieczając ubrania przed zamoknięciem.'
                                  ]),

                              SprawData(
                                  id: 'oryl',
                                  title: 'Oryl',
                                  level: '3',
                                  comment: 'Potrafi wiosłować wiosłem długim, “na pych”, śrubkować, piórkować.',
                                  tasks: [
                                        'Wiosłowałem(-am) długim wiosłem w dulce na wydrze, trenerze, DZ lub smoczej łodzi.',
                                        'Pokonałem(-am) wyznaczoną trasę śrubkując z rufy do przodu i wstecz.',
                                        'Poprawnie piórkowałem(-am) z burty.',
                                        'Wiosłowałem(-am) "na pych" wiosłem pychowym lub żerdzią.',
                                        'Płynąłem(płynęłam) w szyku podczas defilady.'
                                  ]),

                              SprawData(
                                  id: 'oryl',
                                  title: 'Oryl',
                                  level: '4',
                                  comment: 'Potrafi dowodzić wioślarzami i wydawać komendy. Wie, jak podjąć człowieka, który wypadł za burtę. Przekazuje umiejętności wiosłowania młodszym.',
                                  tasks: [
                                        'Dowodziłem(-am) wioślarzami na szalupie. Poprawnie wydawałem(-am) komendy wioślarzom i sternikowi (wiosła, wiosła basta, naprzód, prawa naprzód, lewa wstecz) itd.',
                                        'Wiosłowałem(-am) sposobem rybackim "z ręki" jednym wiosłem.',
                                        'Wykonałem(-am) na łodzi wiosłowej podejście do człowieka za burtą. Podjąłem(-ęłam) człowieka na pokład.',
                                        'Zorganizowałem(-am) naukę wiosłowania pagajem z burty, jednym i dwoma wiosłami w dulkach, piórkowania, śrubkowania, wiosłowania na pych.',
                                        'Wytłumaczyłem(-am) młodszym i bezbłędnie zademonstrowałem(-am) elementy prowadzenia łodzi spływowej (dowodzenie, służba oka, promowanie, jeleni skok, przejście przez bystrze, przejście przez przeszkodę, przenoska, dobicie do brzegu, zachowanie po wywrotce).'
                                  ]),
                        ]
                    ),

              ]
          ),

      SprawGroupData(
        id: 'lotnicze',
        title: 'Lotnicze',
        familyData: [

          SprawFamilyData(
              id: '1',
              sprawData: [
                SprawData(
                    id: 'gawedziarz_lotniczy',
                    title: 'Gawędziarz Lotniczy',
                    level: '2',
                    comment: 'W ciekawy sposób opowiada gawędy lotnicze. Potrafi wyszukać informacje w książkach, czasopismach i Internecie oraz z nich skorzystać. ',
                    tasks: [
                      'Opowiedziałem(-am) 5 legendarnych i baśniowych opowieści lotniczych. Wykazałem(-am) się wiedzą, z jakiego kraju i okresu pochodzą. Wskazałem(-am) wydawnictwa, w których są zamieszczone. ',
                      'Opowiedziałem(-am) trzy życiorysy ludzi lotnictwa. Wykazałem(-am) się wiedzą, w jakim celu opowiada się gawędy, i jak mogą być one realizowane przez harcerzy, przestawiłem(-am) różne formy gawęd. ',
                      'WWyszukałem(-am) w książkach lub czasopismach trzy fragmenty, które następnie przeczytałem(-am) jako gawędy i wskazałem(-am) ich główne wątki. Wykazałem(-am) się umiejętnością płynnego czytania oraz recytowania wierszy. ',
                      'Wykorzystałem(-am) swe umiejętności gawędziarskie podczas zajęć lotniczych w drużynie lub zastępie albo dla popularyzacji lotnictwa wśród harcerzy lub kolegów spoza ZHP.',
                      'Prowadziłem(-am) notatnik z informacjami, w jakich wydawnictwach (książkach, czasopismach) można znaleźć materiały do gawęd ukazujące cechy potrzebne lotnikowi (silna wola, wytrwałość, dzielność, systematyczność, dokładność, koleżeńskość, odwaga). ',
                      'Przekazałem(-am) swoją wiedzę o lotnictwie w inny sposób niż gawęda tj. napisałem(-am) artykuł do gazetki, wykonałem(-am) plansze, kilka ilustracji na określony temat.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '2',
              sprawData: [
                SprawData(
                    id: 'kolekcjoner_lotniczy',
                    title: 'Kolekcjoner Lotniczy',
                    level: '2',
                    comment: 'Prowadzi kolekcję lotniczą w sposób uporządkowany. Potrafi ją zaprezentować i o niej opowiedzieć',
                    tasks: [
                      'Objaśniłem(-am) lotniczą treść swego zbioru.',
                      'Wykazałem(-am) się wiedzą, gdzie i jakie zbiory lotnicze tego rodzaju można obejrzeć oraz gdzie zrzeszeni są ich zbieracze.',
                      'Prawidłowo, według ustalonego systemu (porządku) prowadziłem(-am) swoją kolekcję lotniczą. Wyjaśniłem(-am) przyjętą zasadę porządkowania zbioru.',
                      'Znalazłem(-am) źródła informacji dotyczących samolotów przedstawionych na eksponatach zawartych w zbiorze. ',
                      'Zebrałem(-am) ponad 50 eksponatów do swego zbioru lotniczego i prawidłowo je przechowuję (np. prowadząc albumy, teczki, kartotekę).',
                      'Opowiedziałem(-am) na zbiórce zastępu czy drużyny o najciekawszych eksponatach ze zbioru i dziejach samolotów, które te eksponaty przedstawiają.',
                      'Zorganizowałem(-am) pokaz zbioru dla kolegów.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '3',
              sprawData: [
                SprawData(
                    id: 'awiatyk',
                    title: 'Awiatyk',
                    level: '2',
                    comment: 'Projektuje i wykonuje awiatyki.',
                    tasks: [
                      'Przeczytałem(-am) kilka publikacji (książek lub artykułów) z wybranej dziedziny awiatyki.',
                      'Wykazałem(-am) się znajomością oznakowania i kolorystyki samolotów oraz znajomością odznak lotniczych zgodnie z zasadami estetyki, perspektywy i kompozycji kształtów i barw, a zarazem poprawnie z punktu widzenia techniki lotniczej.',
                      'Wykonałem(-am) lub zaprojektowałem(-am) awiatyk (nie ilustrację).',
                      'Wykonałem(-am) 5 projektów lub przedmiotów z wybranej dziedziny awiatyki.',
                      'Zebrałem(-am) kolekcję z wybranej dziedziny awiatyki i sporządziłem(-am) album, kartotekę (lub inny rodzaj zbiorów) oraz uzasadniłem(-am) przyjęty podział zbioru.',
                      'Urządziłem(-am) wystawę (np. dla drużyny) swych prac lub zbioru, bądź zorganizowałem(-am) konkurs na temat awiatyki.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '4',
              sprawData: [
                SprawData(
                    id: 'historyk_lotniczy',
                    title: 'Historyk Lotniczy',
                    level: '3',
                    comment: 'Pasjonuje się historią lotnictwa, biegle się w niej porusza i potrafi się nią dzielić.',
                    tasks: [
                      'Wykazałem(-am) się znajomością w zarysie polskiej i międzynarodowej historii lotnictwa: legendy lotnicze, pierwsze próby i pierwsze wzloty, pierwsze sukcesy i współczesne rekordy, rozwój baloniarstwa, spadochroniarstwa, szybownictwa, lotnictwa silnikowego i pocisków rakietowych.',
                      'Rozpoznałem(-am) najważniejsze historyczne maszyny latające polskie i zagraniczne.',
                      'Zorganizowałem(-am) pogadankę o dowolnie wybranych postaciach i faktach okresu legendarnego lub pionierskiego albo z tradycji polskiego lotnictwa. Podkreśliłem(-am) cechy charakteru osób, o których opowiadałem(-am).',
                      'Zebrałem(-am) wiadomości i ilustracje z historii lotnictwa. Prowadziłem(-am) album poświęcony twórcom lotnictwa, wybranym jego bohaterom lub konstruktorom albo wykonałem(-am) model samolotu historycznego.',
                      'Zorganizowałem(-am) wśród kolegów grę z historii lotnictwa (np. obrazkowe kino, konkurs wiedzy).',
                      'Przeczytałem(-am), co najmniej trzy książki z działu historii lotnictwa.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '5',
              sprawData: [
                SprawData(
                    id: 'konstruktor_latawcow',
                    title: 'Konstruktor Latawców',
                    level: '1',
                    comment: 'Operuje latawcem. Potrafi skonstruować prosty model i wyjaśnić zasadę jego lotu.',
                    tasks: [
                      'Rozpoznałem(-am) różne rodzaje latawców. Wykazałem(-am) się wiedzą, jaka jest konstrukcja każdego z nich i jakie miały zastosowanie dawniej i dziś.',
                      'Wyjaśniłem(-am), jakie siły działają na latawiec w locie i od czego zależy prawidłowy lot.',
                      'Wyregulowałem(-am) latawiec, aby prawidłowo wzbijał się w powietrze i latał.',
                      'Samodzielnie zbudowałem(-am) latawiec płaski.',
                      'Wspólnie z zastępem zbudowałem(-am) latawiec skrzynkowy. Zbudowałem(-am) wyciąg do latawca i go zastosowałem(-am).',
                      'Uczestniczyłem(-am) ze swym latawcem w zawodach latawcowych np. z okazji Święta Latawca.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '6',
              sprawData: [
                SprawData(
                    id: 'modelarz_kartonowek',
                    title: 'Modelarz Kartonówek',
                    level: '1',
                    comment: 'Konstruuje proste modele kartonowe i potrafi wyjaśnić ich działanie.',
                    tasks: [
                      'Opowiedziałem(-am) o pierwszych próbach wzlotów szybowcowych.',
                      'Wyjaśniłem(-am), jakie cechy charakteru musi mieć dobry lotnik.',
                      'Wyjaśniłem(-am), jakie siły działają na szybowce w locie.',
                      'Wyważyłem(-am) i wyregulowałem(-am) latający kartonowy model szybowca, aby wykonywał lot prosty.',
                      'Na modelu zademonstrowałem(-am) działanie sterów i lotek.',
                      'Wykonałem(-am) z papieru strzałę i gołębia oraz model latający szybowca z kartonu (bez użycia kleju).',
                      'Brałem(-am) udział w zawodach kartonówek.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '7',
              sprawData: [
                SprawData(
                    id: 'mlody_astronauta',
                    title: 'Młody Astronauta',
                    level: '1',
                    comment: 'Konstruuje proste modele rakiet i potrafi wyjaśnić ich działanie.',
                    tasks: [
                      'Poznałem(-am) i stosuję zasady bezpieczeństwa używania modeli rakiet.',
                      'Wyjaśniłem(-am) zasady poruszania się rakiety oraz budowę wyrzutni i urządzenia do startu modeli rakiet.',
                      'Opowiedziałem(-am) kolegom o ważniejszych wydarzeniach z dziejów astronautyki oraz zasługach Polaków w jej rozwoju lub brałem(-am) udział w konkursie wiedzy kosmicznej.',
                      'Zbudowałem(-am) model rakiety z silniczkiem rakietowym i zorganizowałem(-am) pokaz startu rakiety wśród swoich kolegów lub brałem(-am) udział w zawodach modeli rakiet.',
                      'Nauczyłem(-am) kolegów budowy modeli rakiet.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '8',
              sprawData: [
                SprawData(
                    id: 'modelarz_redukcyjny',
                    title: 'Modelarz Redukcyjny',
                    level: '2',
                    comment: 'Konstruuje modele samolotów wiernie oddające wygląd.',
                    tasks: [
                      'Rozpoznałem(-am) 3 typy polskich szybowców i 12 typów używanych w Polsce samolotów lub śmigłowców.',
                      'Wykazałem(-am) się znajomością nazw części samolotu, wyjaśniłem(-am) działanie sterów.',
                      'Zbudowałem(-am) 3 modele z drewna lub kartonu wiernie oddające wygląd samolotów lub skleiłem(-am) 5 modeli plastikowych, estetycznie i prawidłowo je malując.',
                      'Wziąłem(wzięłam) udział w konkursie modeli samolotów z tworzyw sztucznych lub zademonstrowałem(-am) własne modele w zastępie.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '9',
              sprawData: [
                SprawData(
                    id: 'radiomodelarz',
                    title: 'Radiomodelarz',
                    level: '2',
                    comment: 'Obsługuje model samolotu sterowany zdalnie i potrafi wyjaśnić działanie zdalnego sterowania.',
                    tasks: [
                      'Poznałem(-am) przynajmniej dwa systemy zdalnego sterowania samolotem; wiem, czym one się charakteryzują. Dowiedziałem(-am) się, jaką rolę w urządzeniu zdalnie sterowanym spełniają przekaźniki elektromechaniczne, czujniki i silniki elektryczne.',
                      'Wyjaśniłem(-am), gdzie i na jakich warunkach można uzyskać zezwolenie na budowę urządzeń nadawczo-odbiorczych do sterowania radiomodelarskiego.',
                      'Narysowałem(-am) i objaśniłem(-am) schemat blokowy jednokanałowego nadajnika i odbiornika sterowania falami radiowymi.',
                      'Zademonstrowałem(-am) na zbiórce zastępu lub drużyny funkcjonowanie zestawu zdalnego sterowania modeli samolotów, wyjaśniłem(-am) kolegom na czym ono polega.',
                      'Przeprowadziłem(-am) pokaz akrobacji lotniczej z wykorzystaniem zestawu zdalnego sterowania.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '10',
              sprawData: [
                SprawData(
                    id: 'konstruktor_lotniczy',
                    title: 'Konstruktor Lotniczy',
                    level: '3',
                    comment: 'Konstruuje zaawansowane modele samolotów.',
                    tasks: [
                      'Opowiedziałem(-am) o kilku najnowszych osiągnięciach techniki lotniczej, różnych doświadczalnych rodzajach samolotów i układach aerodynamicznych. Objaśniłem(-am) zasady lotu różnego rodzaju statków latających.',
                      'Wyjaśniłem(-am), jaką rolę spełniają poszczególne elementy konstrukcyjne i urządzenia aerodynamiczne samolotów.',
                      'Objaśniłem(-am), do czego służy wirnik ogonowy śmigłowca oraz jak steruje się śmigłowcem. Wyważyłem(-am) i wyregulowałem(-am) model o układzie nietypowym: kaczki lub bezogonowca.',
                      'Zbudowałem(-am) model latający o układzie nietypowym: kaczki lub bezogonowca.',
                      'Zbudowałem(-am) model doświadczalny własnego pomysłu dowolnego statku powietrznego (np. śmigłowiec, pionowzlot, samolot skróconego startu, poduszkowiec) lub ze specjalnymi urządzeniami aerodynamicznymi (sploty, zaburzacze, hamulce aerodynamiczne, interceptory zamiast lotek itp.) i zademonstrowałem(-am) jego działanie.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '11',
              sprawData: [
                SprawData(
                    id: 'pomocnik_sedziego_modelarstwa',
                    title: 'Pomocnik Sędziego Sportowego Modelarstwa Lotniczego i Kosmicznego',
                    level: '3',
                    comment: 'Asystuje przy sędziowaniu zawodów modeli latających.',
                    tasks: [
                      'Wykazałem(-am) się znajomością przepisów Kodeksu Sportowego FAI (w szczególności część 4a i 4b), dotyczących zawodów modelarskich. Wykazałem(-am) się znajomością organizacji pracy komisji sędziowskiej.',
                      'Wykazałem(-am) się znajomością kategorii, klas i konkurencji w zawodach modeli latających - lotniczych i kosmicznych.',
                      'Wykazałem(-am) się znajomością zasad posługiwania się stoperem i pomiaru czasu lotu modeli.',
                      'Pod nadzorem sędziego prowadziłem(-am) zorganizowany trening zawodników ubiegających się o zdobycie modelarskich odznak sportowych.',
                      'Pełniłem(-am) obowiązki pomocnika lub asystenta sędziego-chronometrażysty w zawodach i otrzymałem(-am) pozytywną ocenę sędziego.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '12',
              sprawData: [
                SprawData(
                    id: 'paralotniarz',
                    title: '(Para)Lotniarz',
                    level: '1',
                    comment: 'Konstruuje prosty latawiec i wyjaśnia na nim pilotaż lotnią.',
                    tasks: [
                      'Wyjaśniłem(-am) i zademonstrowałem(-am) zasady lotu i pilotażu lotni lub paralotni, korzystając z samodzielnie zbudowanego latawca płaskiego. ',
                      'Wykazałem(-am) się znajomością podstawowych zasad wykonywania lotów m.in. w jakich warunkach można je wykonywać.',
                      'Opowiedziałem(-am) o najważniejszych faktach z historii lotniarstwa lub paralotniarstwa i sportu lotniowego/paralotniowego.',
                      'Uczestniczyłem(-am) (jako widz) w zawodach lub pokazach lotniowych lub paralotniowych.'
                    ]),
                SprawData(
                    id: 'paralotniarz',
                    title: '(Para)Lotniarz',
                    level: '2',
                    comment: 'Przygotowuje lotnię do lotu. Rozróżnia rodzaje i zastosowanie lotni.',
                    tasks: [
                      'Zademonstrowałem(-am) i wyjaśniłem(-am) kolegom zasady sterowania lotnią lub paralotnią.',
                      'Brałem(-am) udział w składaniu i rozkładaniu lotni lub paralotni i przygotowaniu jej do lotów. Prawidłowo założyłem(-am) i przymocowałem(-am) uprząż do lotni/paralotni.',
                      'Rozróżniłem(-am) przynajmniej 3 rodzaje lotni lub paralotni oraz uprzęży dla pilotów lotniowych/paralotniowych i ich zastosowanie.',
                      'Wykazałem(-am) się wiedzą, jak prawidłowo udzielić pierwszej pomocy w prostych przypadkach. Wykazałem(-am) się umiejętnością bezpiecznego podejścia do poszkodowanego oraz prawidłowo udrożniłem(-am) drogi oddechowe. Wykazałem(-am) się wiedzą z zasad higieny lotniczej.',
                      'Wykazałem(-am) się znajomością historii lotniarstwa lub paralotniarstwa w Polsce i na świecie. '
                    ]),
                SprawData(
                    id: 'paralotniarz',
                    title: '(Para)Lotniarz',
                    level: '3',
                    comment: 'Ocenia warunki do lotu. Steruje skrzydłem lotni w sposób kontrolowany. Udziela pierwszej pomocy poszkodowanemu.',
                    tasks: [
                      'Określiłem(-am) kierunek i prędkość wiatru względem zbocza oraz możliwości latania w danych warunkach.',
                      'Wykonałem(-am) ćwiczenia przygotowawcze do wstępnego szkolenia w pilotażu lotni (rozbieg i dobieg z lotnią lub paralotnią, utrzymanie lotni lub paralotni w łożu wiatru, lot latawcowy na uwięzi).',
                      'Wykazałem(-am) się wiedzą, jak prawidłowo udzielić pierwszej pomocy. Prawidłowo zabezpieczyłem(-am) poszkodowanego z podejrzeniem uszkodzenia kręgosłupa lub złamaniami kończyn. Założyłem(-am) kołnierz ortopedyczny i ułożyłem(-am) poszkodowanego na desce ortopedycznej.',
                      'Wykazałem(-am) się znajomością podstawowych zasady dotyczące startów za wyciągarką.',
                      'Wykazałem(-am) się znajomością wymagań do uzyskania Harcerskiego Znaku Lotniczego. '
                    ]),
              ]
          ),

          SprawFamilyData(
              id: '13',
              sprawData: [
                SprawData(
                    id: 'szybownik',
                    title: 'Szybownik',
                    level: '1',
                    comment: 'Konstruuje prosty szybowiec i wyjaśnia na nim lot szybowy.',
                    tasks: [
                      'Wyjaśniłem(-am) i zademonstrowałem(-am) zasady lotu i pilotażu szybowca, korzystając z samodzielnie zbudowanego prostego modelu szybowca.',
                      'Wykazałem(-am) się wiedzą, w jakich warunkach można wykonywać loty oraz znajomością podstawowych zasad wykonywania lotów.',
                      'Opowiedziałem(-am) o najważniejszych faktach z historii szybownictwa i sportu szybowcowego.',
                      'Uczestniczyłem(-am) (jako widz) w zawodach lub startach szybowcowych.'
                    ]),
                SprawData(
                    id: 'szybownik',
                    title: 'Szybownik',
                    level: '2',
                    comment: 'Asystuje przy startach szybowców.',
                    tasks: [
                      'Wykazałem(-am) się wiedzą, jakie siły działają na szybowiec w locie i jakie warunki sprzyjają lotom szybowcowym. W terenie lub na mapie wskazałem(-am), gdzie powstają prądy wznoszące.',
                      'Wykazałem(-am) się wiedzą dot. zasad bezpieczeństwa obowiązujące na starcie szybowcowym. Pełniłem(-am) funkcję dyżurnego i chronometrażysty na starcie.',
                      'Uczestniczyłem(-am) w wykładaniu, wyhangarowaniu i transporcie szybowca, wykładaniu znaków startowych i przygotowywaniu szybowca do lotu – samodzielnie podpinałem(-am) linę holowniczą i wypuszczałem(-am) szybowiec przy starcie.',
                      'Zapoznałem(-am) się z przynajmniej jedną książką o tematyce szybowcowej.',
                      'Wykonałem(-am) lot pasażerski szybowcem. '
                    ]),
              ]
          ),

          SprawFamilyData(
              id: '14',
              sprawData: [
                SprawData(
                    id: 'lotnik_samolotowy',
                    title: 'Lotnik Samolotowy',
                    level: '1',
                    comment: 'Interesuje się pilotażem lotniczym.',
                    tasks: [
                      'Wymieniłem(-am) wymagania zdrowotne i psychiczne stawiane lotnikom. Wykazałem(-am) się wiedzą dot. warunków przyjęcia na szkolenia lotnicze (wiek, wykształcenie) i główne rodzaje pracy w lotnictwie.',
                      'Wykazałem(-am) się znajomością nazw głównych części samolotu.',
                      'Rozpoznałem(-am) polskie odznaki lotnicze cywilne i wojskowe.',
                      'Poruszałem(-am) się po lotnisku zgodnie z obowiązującymi zasadami i rozpoznałem(-am) znaki startowe.',
                      'Zbudowałem(-am) poprawnie latający model na uwięzi lub zdalnie sterowany. Zademonstrowałem(-am) start modelu, lot sterowany i lądowanie.'
                    ]),
                SprawData(
                    id: 'lotnik_samolotowy',
                    title: 'Lotnik Samolotowy',
                    level: '2',
                    comment: 'Wykazuje się pogłębioną wiedzą nt pilotażu i doświadcza pierwszych lotów samolotem sportowym.',
                    tasks: [
                      'Określiłem(-am) nawigacyjną prędkość, meteorologiczny kierunek i prędkość wiatru oraz możliwości latania w danych warunkach.',
                      'Wykazałem(-am) się znajomością przeznaczenia dźwigara, kesonu, wręgi, żebra, okucia i pokrycia.',
                      'Scharakteryzowałem(-am) różnice w konstrukcji kratownicowej i półskorupowej.',
                      'Zademonstrowałem(-am) ruchy sterami samolotu i opisałem(-am) główne przyrządy pokładowe.',
                      'Wskazałem(-am) podstawowe typy silników lotniczych oraz najpopularniejszych producentów.',
                      'Odbyłem(-am) lot pasażerski samolotem sportowym lub turystycznym.'
                    ]),
              ]
          ),

          SprawFamilyData(
              id: '15',
              sprawData: [
                SprawData(
                    id: 'baloniarz',
                    title: 'Baloniarz',
                    level: '1',
                    comment: 'Konstruuje proste modele balonów i potrafi wyjaśnić ich działanie.',
                    tasks: [
                      'Wyjaśniłem(-am) zasady unoszenia się balonu w powietrzu oraz budowę balonu sportowego.',
                      'Rozpoznałem(-am) rodzaje balonów i wykazałem(-am) się znajomością ich zastosowania.',
                      'Stosowałem(-am) przepisy bezpiecznego wypuszczania balonów na ogrzane powietrze.',
                      'Wraz z zastępem zbudowałem(-am) z bibułki balon na ogrzane powietrze.',
                      'Brałem(-am) udział w pokazie wypuszczania modelu balonu na ogrzane powietrze lub w zawodach modeli balonów.'
                    ]),
                SprawData(
                    id: 'baloniarz',
                    title: 'Baloniarz',
                    level: '2',
                    comment: 'Wykazuje się pogłębioną wiedzą na temat baloniarstwa i doświadcza pierwszych lotów balonem.',
                    tasks: [
                      'Opowiedziałem(-am) kolegom o sukcesach Polaków w zawodach Gordon-Bennetta oraz o najważniejszych faktach z dziejów balonu i historii baloniarstwa w Polsce.',
                      'Wykazałem(-am) się znajomością cech charakteru i wymagań zdrowotnych, jakie powinien spełniać pilot balonowy. Przedstawiłem(-am), w jaki sposób systematycznie je ćwiczyć.',
                      'Rozpoznałem(-am) różne rodzaje balonów oraz wykazałem(-am) się znajomością ich budowy, teorii lotu oraz sposobów kierowania nimi.',
                      'Pomagałem(-am) w organizacji pokazu balonowego lub zawodów balonowych.',
                      'Jako pasażer wykonałem(-am) wzlot na uwięzi, balonem.'
                    ]),
                SprawData(
                    id: 'baloniarz',
                    title: 'Baloniarz',
                    level: '3',
                    comment: 'Asystuje przy lotach balonem.',
                    tasks: [
                      'Opowiedziałem(-am) o dziejach baloniarstwa w Polsce i na świecie, wykazując się ich dobrą znajomością.',
                      'Wykazałem(-am) się znajomością wymagań do uzyskania Harcerskiego Znaku Balonowego.',
                      'Wykazałem(-am) się umiejętnością podstawowej obsługi balonu na ogrzane powietrze, przy starcie i po lądowaniu.',
                      'Brałem(-am) czynny udział w przygotowaniach do wzlotu balonu.',
                      'Jako pasażer wykonałem(-am) lot balonem na ogrzane powietrze.'
                    ]),
              ]
          ),

          SprawFamilyData(
              id: '16',
              sprawData: [
                SprawData(
                    id: 'mlody_spadochroniarz',
                    title: 'Młody Spadochroniarz',
                    level: '1',
                    comment: ' Interesuje się spadochroniarstwem.',
                    tasks: [
                      'Wykazałem(-am) się wiedzą, gdzie znajduje się najbliższe lotnisko, na którym odbywają się skoki spadochronowe.',
                      'Odwiedziłem(-am) lotnisko, gdy odbywały się na nim skoki spadochronowe i wie jak bezpiecznie poruszać się po lotnisku.',
                      'Przeprowadziłem(-am) wywiad ze skoczkiem spadochronowym.',
                      'Uczestniczyłem(-am) (jako widz) w zawodach lub pokazach spadochronowych.',
                      'Wziąłem(wzięłam) udział w zajęciach popularyzujących spadochroniarstwo.',
                      'Wykazałem(-am) się wiedzą z zakresu podstawowych pojęć związanych ze skokami spadochronowymi (lina desantowa, piguła, sonda, wysokościomierz, rękaw, czasza, pilocik itd.).'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '17',
              sprawData: [
                SprawData(
                    id: 'aspirant_spadochronowy',
                    title: 'Aspirant Spadochronowy',
                    level: '2',
                    comment: 'Asystuje przy organizacji zrzutowiska.',
                    tasks: [
                      'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności Młody spadochroniarz (*).',
                      'Wykazałem(-am) się wiedzą z wybranego fragmentu historii spadochroniarstwa.',
                      'Wykazałem(-am) się wiedzą nt budowy spadochronu szybującego. Rozpoznałem(-am) różne typy spadochronów (szkolny, celnościowy, zapasowy itp.).',
                      'Wykazałem(-am) się wiedzą nt podstawowego wyposażenia skoczka spadochronowego.',
                      'Odwiedziłem(-am) (np. na lotnisku, w hangarze) różne statki powietrzne, z których można wykonywać skoki spadochronowe. Opisałem(-am) ich przystosowanie do skoków.',
                      'Brałem(-am) udział w pracach pomocniczych na starcie spadochronowym. Pomagałem(-am) w rozstawieniu rękawa, znaków ziemia-powietrze, stołów spadochronowych itp.',
                      'Wyszukałem(-am) ciekawe informacje ze stron internetowych dotyczących spadochroniarstwa.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '18',
              sprawData: [
                SprawData(
                    id: 'spadochroniarz',
                    title: 'Spadochroniarz',
                    level: '3',
                    comment: 'Doświadcza elementów spadochroniarstwa i przygotowuje się do samodzielnego skoku. ',
                    tasks: [
                      'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności Aspirant spadochronowy (**).',
                      'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności Lotnika tunelowego (**) lub wykonałem(-am) skok ze spadochronem (samodzielny lub w tandemie).',
                      'Wykazałem(-am) się wiedzą z historii spadochroniarstwa krajowego i światowego.',
                      'Wykazałem(-am) się wiedzą na poziomie kursu spadochronowego (przepisy Prawa Lotniczego w zakresie spadochroniarstwa, zasady aerodynamiki, podstawy meteorologii, higiena lotnicza itp.)',
                      'Prawidłowo zabezpieczyłem(-am) poszkodowanego skoczka z podejrzeniem uszkodzenia kręgosłupa lub złamaniami kończyn.',
                      'Poprawnie zgasiłem(-am) czaszę spadochronu na wietrze.',
                      'Przeanalizowałem(-am) nagrania video skoków spadochronowych. W trzech nagraniach wskazałem(-am) na potencjalnie niebezpieczne zachowanie wymagające poprawy.',
                      'Nawiązałem(-am) kontakt z harcerskim środowiskiem spadochronowym. Poznałem(-am) harcerskie przepisy dotyczące specjalności lotniczej i spadochroniarstwa.',
                      'Przeprowadziłem(-am) dla drużyny lub zastępu grę o tematyce spadochronowej.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '19',
              sprawData: [
                SprawData(
                    id: 'pomocnik_ukladacza_spadochronowego',
                    title: 'Pomocnik Układacza Spadochronowego',
                    level: '3',
                    comment: 'Przygotowuje spadochrony do skoku i transportu.',
                    tasks: [
                      'Wykazałem(-am) się znajomością podstawowych zasad przechowywania, konserwacji i transportu sprzętu spadochronowego.',
                      'Dokonałem(-am) wizualnej oceny spadochronu szybującego i kontenera oraz wskazałem(-am) ewentualne uszkodzenia.',
                      'Pod nadzorem osoby uprawnionej poprawnie ułożyłem(-am) spadochron szybujący na dwa sposoby (tak jak do skoku i magazynowo).',
                      'Sprawdziłem(-am) poprawność przygotowania zestawu spadochronowego do skoku (karta spadochronu, plomba, AAD, zawleczka, itp.).',
                      'Poprawnie podczepiłem(-am) czaszę spadochronu do kontenera za pomocą systemu trzech kółek. Wyjaśniłem(-am) sposób działania tego systemu.',
                      'Przeprowadziłem(-am) dla drużyny lub zastępu zajęcia lub konkurs na temat budowy i działania spadochronu szybującego.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '20',
              sprawData: [
                SprawData(
                    id: 'pomocnik_sedziego_spadochronowego',
                    title: 'Pomocnik Sędziego Spadochronowego',
                    level: '3',
                    comment: 'Asystuje sędziemu podczas zawodów spadochronowych.',
                    tasks: [
                      'Wykazałem(-am) się znajomością podstawowych przepisów Kodeksu Sportowego FAI dotyczących zawodów spadochronowych.',
                      'Wykazałem(-am) się znajomością zasad pomiaru i punktowania wyniku co najmniej dwóch dyscyplin spadochronowych.',
                      'Wymieniłem(-am) krajowe i światowe rekordy w poszczególnych konkurencjach spadochronowych.',
                      'Prowadziłem(-am) obserwację przestrzeni powietrznej podczas zawodów (treningu) przy użyciu telemetru.',
                      'Odbyłem(-am) praktykę pomocnika sędziego sportowego podczas zawodów spadochronowych i uzyskałem(-am) pozytywną ocenę sędziego.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '21',
              sprawData: [
                SprawData(
                    id: 'doswiadczony_spadochroniarz',
                    title: 'Doświadczony Spadochroniarz',
                    level: '4',
                    comment: 'W bezpieczny sposób podchodzi do wykonywania skoków spadochronowych.',
                    tasks: [
                      'Odczytałem(-am) i zinterpretowałem(-am) komunikat pogodowy.',
                      'Na podstawie danych meteo określiłem(-am) kierunek do zrzutu i punkt rozpoczęcia zrzutu skoczków spadochronowych z samolotu.',
                      'Na planie lotniska wykreśliłem(-am) rundę do lądowania spadochronu, znając jego doskonałość, prędkość postępową oraz prędkość i kierunek wiatru w kilku wariantach.',
                      'Wykazałem(-am) się znajomością wszystkich obowiązujących znaków i sygnałów używanych podczas prowadzenia skoków spadochronowych. Wykładałem(-am) znaki na lotnisku przed rozpoczęciem skoków.',
                      'Wykazałem(-am) się znajomością alfabetu ICAO. Prowadziłem(-am) nasłuch komunikacji radiowej na lotnisku podczas zrzutu skoczków.',
                      'Wyjaśniłem(-am) zasady dot. kolejności wyrzutu skoczków w zależności od rodzaju skoku.',
                      'Przeprowadziłem(-am) zbiórkę dla zastępu lub drużyny na lotnisku, w trakcie której wyjaśniłem(-am) sposób zorganizowania i wykonywania skoków (lądowisko, runda do lądowania, komunikacja radiowa i naziemna).'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '22',
              sprawData: [
                SprawData(
                    id: 'pilot_spadochronu',
                    title: 'Pilot Spadochronu',
                    level: '4',
                    comment: 'Wykonuje skoki na strugi i biegle steruje czaszą spadochronu.',
                    tasks: [
                      'Wykonałem(-am) stabilne skoki na strugi relatywne.',
                      'Utrzymałem(-am) kierunek spadania i otworzyłem(-am) spadochron na kierunku wyrzutu.',
                      'Po otwarciu spadochronu pierwszy zakręt wykonałem(-am) używając wyłącznie tylnych taśm (bez użycia sterówek).',
                      'Poprawnie zbudowałem(-am) rundę do lądowania zachowując wysokości i kąt skrętów.',
                      'Wylądowałem(-am) w ograniczonym terenie o wymiarach 100x100 metrów.',
                      'Wylądowałem(-am) na nogi bez podparcia innymi częściami ciała.',
                      'Przeprowadziłem(-am) ćwiczenia dla zastępu lub drużyny rozwijające refleks, precyzję i koordynację ruchową.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '23',
              sprawData: [
                SprawData(
                    id: 'spadochroniarz_zwiadowca',
                    title: 'Spadochroniarz Zwiadowca',
                    level: '4',
                    comment: 'Samodzielnie dokonuje zwiadu taktycznego, kontaktuje się przez radio i zapewnia sobie przetrwanie w warunkach leśnych.',
                    tasks: [
                      'Wykazałem(-am) się znajomością historii polskich wojskowych jednostek specjalnych. Rozpoznałem(-am) znaki identyfikacyjne tych formacji oraz wymieniłem(-am) ich główne zadania.',
                      'Wykazałem(-am) się wiedzą, jakimi cechami winien odznaczać się wojskowy zwiadowca oraz wskazałem(-am), które z umiejętności wojskowych zwiadowców zostały przeniesione na grunt skautingu.',
                      'Samodzielnie wykonałem(-am) elementy maskujące odzież potrzebne do skrytego przemieszczania się w terenie. Uwzględniłem(-am) przy tym różne pory roku.',
                      'Wykonałem(-am) samodzielnie nocny marsz na odległość około 10 km wykorzystując techniki skrytego przemieszczania się, a następnie prowadziłem(-am) obserwację rejonu wskazanego na mapie przez opiekuna próby. W trakcie obserwacji wykonałem(-am) szkic obserwowanego rejonu.',
                      'Będąc w terenie, za pomocą radiowych środków łączności przekazałem(-am) meldunek załodze statku powietrznego o miejscu położenia wybranego obiektu. Wykazałem(-am) się znajomością sposobu określania położenia obowiązującego w nawigacji lotniczej.',
                      'Przez dwie doby przetrwałem(-am) samodzielnie w wyznaczonym terenie leśnym. Przez cały czas pozostawałem(-am) niezauważony i żywiłem(-am) się wyłącznie „darami lasu”.',
                      'Przeprowadziłem(-am) zbiórkę w terenie dla zastępu lub drużyny rozwijającą umiejętności zwiadowcy.',
                      'Przeprowadziłem(-am) zbiórkę historyczną zastępu lub drużyny poruszającą tematykę działalności Cichociemnych Spadochroniarzy Armii Krajowej.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '24',
              sprawData: [
                SprawData(
                    id: 'spadochroniarz_ratownik',
                    title: 'Spadochroniarz Ratownik',
                    level: '4',
                    comment: 'Reaguje na niebezpieczeństwa, stosuje odpowiednie algorytmy zachowania, współpracuje ze służbami mundurowymi.',
                    tasks: [
                      'Wykazałem(-am) się wiedzą na temat bojowego ratownictwa i poszukiwań (CSAR), w szczególności zastosowania w tym celu spadochroniarstwa.',
                      'Rozpoznałem(-am) oznaczenia stopni służbowych obowiązujących w formacjach działających na rzecz bezpieczeństwa powszechnego (Wojsko, Policja, Straż Pożarna).',
                      'Wykazałem(-am) się wiedzą na temat możliwych zagrożeń aktami terroryzmu oraz algorytmu postępowania w przypadku zauważenia podejrzanych przedmiotów porzuconych w miejscach publicznych, znalezienia niewypałów lub niewybuchów.',
                      'Ukończyłem(-am) szkolenie z czerwonej taktyki lub inny kurs pierwszej pomocy w warunkach polowych.',
                      'Brałem(-am) udział w akcji poszukiwawczej.',
                      'Sporządziłem(-am) plan, a następnie przeprowadziłem(-am) z drużyną ćwiczenia ewakuacji biwaku lub obozu w bezpieczne miejsce na wypadek zaistnienia zagrożeń naturalnych.',
                      'Przeprowadziłem(-am) zbiórkę dla drużyny lub zastępu z udziałem przedstawiciela wybranej służby mundurowej na temat zachowania się w sytuacji klęski żywiołowej lub katastrofy (budowlanej, komunikacyjnej, naturalnej).'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '25',
              sprawData: [
                SprawData(
                    id: 'spadochroniarz_operator',
                    title: 'Spadochroniarz Operator',
                    level: '4',
                    comment: 'Szkoli się z samoobrony, strzelectwa i potrafi omówić spadochroniarstwo wojskowe.',
                    tasks: [
                      'Wykazałem(-am) się znajomością wymagań stawianym kandydatom na żołnierzy zawodowych w jednostkach powietrzno-desantowych. Osiągnąłem(osiągnęłam) sprawność pozwalającą na zaliczenie egzaminu z wychowania fizycznego według norm określonych w takich jednostkach (co najmniej na poziomie dostatecznym).',
                      'Wykazałem(-am) się wiedzą, na czym polegają różnice pomiędzy wykonywaniem skoków sportowych i wojskowych.',
                      'Omówiłem(-am) rodzaje skoków spadochronowych wykonywanych przez skoczków wojskowych (desantowe, HALO, HAHO, LALO).',
                      'Wykazałem(-am) się znajomością warunków nadawania tytułu i Odznaki Skoczka Spadochronowego Wojsk Powietrzno–Desantowych.',
                      'Ukończyłem(-am) kurs samoobrony bądź rozwija w sposób ciągły swoje umiejętności w dziedzinie sportów lub sztuk walki.',
                      'Omówiłem(-am) budowę i działanie broni palnej krótkiej i długiej na wybranych egzemplarzach. Wykazałem(-am) się znajomością zasad bezpiecznego posługiwania się bronią. Wykazałem(-am) się wiedzą, jakiego rodzaju uzbrojenie znajduje się na wyposażeniu jednostek powietrzno-desantowych.',
                      'Ukończyłem(-am) szkolenie strzeleckie z broni palnej.',
                      'Zorganizowałem(-am) dla zastępu lub drużyny zawody strzeleckie z broni pneumatycznej przestrzegając przepisów strzeleckich i zasad bezpieczeństwa. Wyjaśniłem(-am) zasady bezpieczeństwa podczas działań strzeleckich oraz omówiłem(-am) podstawy prawidłowego strzelania.',
                      'Przeprowadziłem(-am) dla drużyny lub kilku środowisk grę terenową o tematyce obronnej, rozwijającą sprawność fizyczną, umiejętności orientacji w terenie w dzień i w nocy oraz umiejętności strzeleckie.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '26',
              sprawData: [
                SprawData(
                    id: 'lotnik_tunelowy',
                    title: 'Lotnik Tunelowy',
                    level: '1',
                    comment: 'Zachowuje spokój w tunelu aerodynamicznym i stosuje się do komend instruktora.',
                    tasks: [
                      'Ukończyłem(-am) odpowiednie szkolenie przygotowawcze (instruktaż) do latania w tunelu aerodynamicznym.',
                      'Wykazałem(-am) się wiedzą na temat bezpieczeństwa w trakcie latania w tunelu (ubiór, zachowanie w tunelu).',
                      'Wykazałem(-am) się znajomością podstawowych sygnałów obowiązujących w tunelu i potrafiłem(-am) się do nich zastosować podczas latania (wydłuż nogi, głowa do góry, rozluźnij się).',
                      'Zachowałem(-am) poprawną sylwetkę podczas latania w tunelu (nogi wyprostowane, ręce ugięte pod kątem 90 stopni, głowa do góry, wzrok skierowany na wprost, wygięcie całego tułowia w kształcie banana).',
                      'Wykonałem(-am) minimum dwa loty z instruktorem w tunelu aerodynamicznym.'
                    ]),
                SprawData(
                    id: 'lotnik_tunelowy',
                    title: 'Lotnik Tunelowy',
                    level: '2',
                    comment: 'Utrzymuje się stabilnie na strugach w tunelu aerodynamicznym.',
                    tasks: [
                      'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności (*).',
                      'Przez okres jednego miesiąca przed lataniem regularnie wykonywałem(-am) ćwiczenia wzmacniające mięśnie ramion, tułowia oraz gibkość.',
                      'Ukończyłem(-am) odpowiednie szkolenie przygotowawcze (instruktaż) przed samodzielnym lataniem w tunelu aerodynamicznym.',
                      'Opanowałem(-am) neutralną sylwetkę podczas latania w tunelu stosując wszystkie sygnały pokazane przez instruktora.',
                      'Wykonałem(-am) minimum 10 minutowy trening w tunelu aerodynamicznym.',
                      'Opowiedziałem(-am) w zastępie o sporcie tunelowym, konkurencjach i osiągach Polaków.'
                    ]),
                SprawData(
                    id: 'lotnik_tunelowy',
                    title: 'Lotnik Tunelowy',
                    level: '3',
                    comment: 'Samodzielnie porusza się w tunelu aerodynamicznym.',
                    tasks: [
                      'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności (**).',
                      'Przez okres trzech miesięcy regularnie wykonywałem(-am) ćwiczenia znacząco poprawiając siłę mięśni ramion, tułowia i gibkość.',
                      'Ukończyłem(-am) odpowiednie szkolenie przygotowawcze (instruktaż) przed lataniem w tunelu aerodynamicznym na poziomie kursu AFF.',
                      'Wykazałem(-am) się umiejętnością samodzielnego wejścia i wyjścia z tunelu aerodynamicznego.',
                      'Wykazałem(-am) się umiejętnością przemieszczania się we wszystkich płaszczyznach, wykonywania obrotów o 360 stopni w prawo i w lewo, przechodzenia do pozycji delta oraz inicjowania otwarcia spadochronu głównego.',
                      'Przeprowadziłem(-am) dla zastępu lub drużyny zajęcia popularyzujące latanie tunelowe.'
                    ]),
                SprawData(
                    id: 'lotnik_tunelowy',
                    title: 'Lotnik Tunelowy',
                    level: '4',
                    comment: 'Lata w tunelu z innymi osobami. Startuje w zawodach tunelowych.',
                    tasks: [
                      'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności (***).',
                      'Osiągnąłem(osiągnęłam) sprawność fizyczną i techniczną pozwalającą na pełną kontrolę nad ciałem podczas latania w tunelu w wybranej sylwetce.',
                      'W sposób biegły wykonałem(-am) cztery różne formacje Random (FS-2 lub VFS-2) wchodząc w każdą z ról.',
                      'Wziąłem(wzięłam) udział w zawodach tunelowych.',
                      'Pomogłem(-am) instruktorowi w przeprowadzeniu szkolenia przygotowawczego dla osób początkujących.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '27',
              sprawData: [
                SprawData(
                    id: 'spotter',
                    title: 'Spotter',
                    level: '1',
                    comment: 'Rozpoznaje samoloty cywilne i wojskowe, znaki sił powietrznych i linii lotniczych. Bezpiecznie porusza się po lotnisku.',
                    tasks: [
                      'Rozpoznałem(-am) i rozróżniłem(-am) samoloty cywilne i wojskowe. Rozpoznałem(-am) znaki sił powietrznych i linii lotniczych przynajmniej trzech krajów.',
                      'Wykazałem(-am) się znajomością zasad bezpiecznego poruszania się po lotniskach.',
                      'Wykazałem(-am) się wiedzą, gdzie w Polsce znajdują się lotniska pasażerskie. Wymieniłem(-am) przynajmniej pięć cywilnych portów lotniczych. Odwiedziłem(-am) port lotniczy.',
                      'Wykazałem(-am) się znajomością alfabetu fonetycznego ICAO. Poprawnie podałem(-am) znaki boczne obserwowanych samolotów.',
                      'Wykazałem(-am) się wiedzą, jakim sprzętem posługują się spotterzy.',
                      'Wykazałem(-am) się znajomością internetowych serwisów tematycznych poświęconych planespottingowi (namierzaniu samolotów).'
                    ]),
                SprawData(
                    id: 'spotter',
                    title: 'Spotter',
                    level: '2',
                    comment: 'Rozpoznaje modele i typy obserwowanych samolotów. Sprawnie przemieszcza się po lotnisku.',
                    tasks: [
                      'Rozpoznałem(-am) i rozróżniłem(-am) samoloty cywilne i wojskowe. Rozpoznałem(-am) znaki sił powietrznych i linii lotniczych przynajmniej dziesięciu krajów.',
                      'Rozpoznałem(-am) modele i typy obserwowanych samolotów.',
                      'Wykazałem(-am) się znajomością zasad bezpiecznego poruszania się po lotniskach. Wykazałem(-am) się wiedzą, jak przygotować się do poruszania w pobliżu lotniska.',
                      'Wykazałem(-am) się wiedzą, gdzie w Polsce znajdują się lotniska pasażerskie. Wymieniłem(-am) wszystkie porty lotnicze w Polsce. Odwiedziłem(-am) port lotniczy. Wykazałem(-am) się znajomością jego topografii.',
                      'Wykazałem(-am) się wiedzą, jakim sprzętem posługują się spotterzy. W czasie próby kompletowałem(-am) podstawowy sprzęt do obserwacji.',
                      'Wykazałem(-am) się wiedzą, jakie funkcje na lotnisku może pełnić spotter. Uzasadniłem(-am) społeczne zaufanie dla obserwatorów.',
                      'Nawiązałem(-am) kontakt ze stowarzyszeniem spotterów. Dowiedziałem(-am) się, na czym polega to hobby. Swoją wiedzą podzieliłem(-am) się z zastępem.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '28',
              sprawData: [
                SprawData(
                    id: 'spotter_specjalista',
                    title: 'Spotter Specjalista',
                    level: '3',
                    comment: 'Dzieli się swoją wiedzą i umiejętnościami spotterskimi.',
                    tasks: [
                      'Rozpoznałem(-am) i rozróżniłem(-am) samoloty cywilne i wojskowe. Rozpoznałem(-am) znaki sił powietrznych i linii lotniczych przynajmniej dwudziestu krajów.',
                      'Rozpoznałem(-am) modele i typy obserwowanych samolotów. Opowiedziałem(-am) o danych technicznych wybranych modeli samolotów.',
                      'Przeprowadziłem(-am) zajęcia z zasad bezpiecznego poruszania się po lotniskach.',
                      'Wykazałem(-am) się wiedzą, gdzie w Polsce znajdują się lotniska pasażerskie. Wymieniłem(-am) wszystkie porty lotnicze w Polsce. Odwiedziłem(-am) port lotniczy, wykazałem(-am) się znajomością jego topografii. Przedstawiłem(-am) jego historię.',
                      'Wykazałem(-am) się wiedzą, jakim sprzętem posługują się spotterzy. Skompletowałem(-am) sprzęt do obserwacji. Za jego pomocą prowadziłem(-am) własne obserwacje i dokumentację.',
                      'Zorganizowałem(-am) wycieczkę zastępu lub drużyny na lotnisko pod opieką doświadczonego spottera.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '29',
              notesForLeaders: ['Należy upewnić się, że działania z zakresu operowania dronem będą prowadzone zgodnie z obowiązującymi w danym momencie przepisami.'],
              sprawData: [
                SprawData(
                    id: 'spotter_fotograf',
                    title: 'Spotter Fotograf',
                    level: '3',
                    comment: 'Fotografuje statki powietrzne, rozpoznaje je i wyjaśnia różnice.',
                    tasks: [
                      'Rozpoznałem(-am) i rozróżniłem(-am) samoloty cywilne i wojskowe. Rozpoznałem(-am) znaki sił powietrznych i linii lotniczych przynajmniej dwudziestu krajów.',
                      'Rozpoznałem(-am) modele i typy obserwowanych samolotów. Opowiedziałem(-am) o danych technicznych wybranych modeli samolotów.',
                      'Wykazałem(-am) się wiedzą, jakim sprzętem posługują się spotterzy. Skompletowałem(-am) sprzęt do obserwacji i sprzęt fotograficzny. Za jego pomocą prowadziłem(-am) własne obserwacje i dokumentację.',
                      'Wykazałem(-am) się znajomością internetowych serwisów tematycznych poświęconych planespottingowi. Korzystałem(-am) z nich w realizacji swoich zainteresowań.',
                      'Zorganizowałem(-am) w szkole lub w hufcu wystawę własnych fotografii wykonanych podczas obserwacji.',
                      'Na podstawie nazewnictwa ICAO stworzyłem(-am) nazwę klubu planespottingowego działającego na wybranym lotnisku.'
                    ]),

              ]
          ),

          SprawFamilyData(
              id: '30',
              sprawData: [
                SprawData(
                    id: 'operator_drona',
                    title: 'Operator Drona',
                    level: '1',
                    comment: 'Asystuje przy operowaniu dronem.',
                    tasks: [
                      'Poprawnie wykonałem(-am) manewry startu i lądowania.',
                      'Wykonałem(-am) trening lotu dronem w symulatorze.',
                      'Sprawdziłem(-am) stan baterii i oszacowałem(-am) czas możliwego lotu.',
                      'Poprawnie skalibrowałem(-am) żyroskop w statku powietrznym.',
                      'Podczas lotu poprawnie instruowałem(-am) operatora drona o wymaganych manewrach.',
                      'Wyjaśniłem(-am) zasadę działania śmigła.'
                    ]),
                SprawData(
                    id: 'operator_drona',
                    title: 'Operator Drona',
                    level: '2',
                    comment: 'Samodzielnie operuje dronem w podstawowym zakresie.',
                    tasks: [
                      'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności (*).',
                      'Poprawnie wykonałem(-am) manewry dronem stale kontrolując parametry lotu:'
                          '\n\n– start i lądowanie;'
                          '\n\n– heading na kierunek świata lub podany w stopniach;'
                          '\n\n– podlecenie do obszaru i uchwycenie go w kadrze;'
                          '\n\n– przelot nad przeszkodą.',
                      'Sprawdziłem(-am) stan techniczny i przygotowałem(-am) drona do lotu. (np. poprawność działania silników, gimbala i jego kontroli, prawidłowość przykręcenia śmigieł oraz działanie systemów pomocniczych: GPS i żyroskop).',
                      'Nagrałem(-am) krótki filmik z wykorzystaniem drona.',
                      'Obejrzałem(-am) kilka wideorelacji z zawodów dronów sportowych. Zaobserwowałem(-am) różnice w budowie pomiędzy dronami filmującymi i sportowymi.',
                      'Wykazałem(-am) się znajomością zagrożeń związanych z lotem dronem.',
                      'Opowiedziałem(-am) kolegom z zastępu o działaniu drona.'
                    ]),
                SprawData(
                    id: 'operator_drona',
                    title: 'Operator Drona',
                    level: '3',
                    comment: 'Biegle operuje dronem.',
                    tasks: [
                      'Zdobyłem(-am) wiedzę i umiejętności na poziomie sprawności (**).',
                      'Przez co najmniej 30 sekund kołowałem(-am) nad obiektem poruszającym się w sposób nieregularny (np. rower, biegnąca osoba) z obiektywem skierowanym w jego kierunku bez wcześniejszej znajomości trasy.',
                      'Z użyciem drona wykonałem(-am) wideorelację dowolnego wydarzenia z życia drużyny lub zastępu.',
                      'Wykazałem(-am) się wiedzą z zakresu warunków prawnych prowadzenia operacji dronem.',
                      'Poprawnie oceniłem(-am) warunki meteorologiczne do wykonywania lotów dronem.',
                      'Przeprowadziłem(-am) zdjęcia popularyzujące loty dronami w drużynie lub zastępie.'
                    ]),

              ]
          ),


        ],
      ),

          SprawGroupData(
              id: 'jezdzieckie',
              title: 'Jeździeckie',
              familyData: [

                    SprawFamilyData(
                        id: '1',
                        sprawData: [
                              SprawData(
                                  id: 'jezdziec',
                                  title: 'Jeździec',
                                  level: '1',
                                  comment:'Przekazuje wiedzę na temat maści i odmian koni. Prawidłowo podchodzi do koni i odczytuje ich reakcje. Prawidłowo przygotowuje konia do jazdy oraz zakłada rząd jeździecki, nazywa jego części. Porusza się w trzech chodach w zastępie podczas jazdy konnej.',
                                  tasks: [
                                        'Poznałem(-am) budowę zewnętrzną, maści i odmiany koni. Wiedzę tę przekazałem(-am) swojemu zastępowi podczas zbiórki.',
                                        'Potrafiłem(-am) prawidłowo podejść do konia, odczytać i zinterpretować jego reakcje. Wskazałem(-am) najważniejsze zasady obowiązujące w stajni oraz na ujeżdżalni.',
                                        'Poznałem(-am) budowę siodła wszechstronnego oraz ogłowia. Prawidłowo wyczyściłem(-am) i założyłem(-am) rząd jeździecki na konia.',
                                        'Poruszałem(-am) się w zastępie konnym w równowadze w stępie, kłusie anglezowanym oraz galopie w dosiadzie odciążającym.',
                                  ]),
                              SprawData(
                                  id: 'jezdziec',
                                  title: 'Jeździec',
                                  level: '2',
                                  comment:'Skompletował(-a) odpowiedni strój do jazdy. Rozróżnia podstawowy sprzęt. Prawidłowo wyjeżdża podstawowe figury na ujeżdżalni. Porusza się w równowadze w trzech podstawowych chodach.',
                                  tasks: [
                                        'Skompletowałem(-am) odpowiedni i bezpieczny strój do jazdy konnej.',
                                        'Rozróżniłem(-am) i opisałem(-am) podstawowy sprzęt jeździecki.',
                                        'Poznałem(-am) podstawowe figury na ujeżdżalni, prawidłowo je wyjeżdżałem(-am): wyjeżdżanie narożników, koła, wolty, półwolty, zmiany kierunków na 3 różne sposoby, wężyki, serpentyny.',
                                        'Poruszałem(-am) się w równowadze w trzech podstawowych chodach w dosiadzie ujeżdżeniowym oraz odciążającym.',
                                  ]),
                              SprawData(
                                  id: 'jezdziec',
                                  title: 'Jeździec',
                                  level: '3',
                                  comment:'Przekazuje wiedzę dotyczącą podstaw jazdy, pomocy jeździeckich. Pokazuje elementy ujeżdżeniowe. Prawidłowo pokonuje przeszkody do 60 cm.',
                                  tasks: [
                                        'Wytłumaczyłem(-am) zastępowi podstawy teorii jazdy konnej, a także czym jest dosiad i jakie są jego rodzaje.',
                                        'Zaprezentowałem(-am) na zbiórce różne pomoce używane w jeździectwie, wskazałem(-am) ich dobre i złe strony.',
                                        'Prawidłowo wykonałem(-am) najazd na przeszkodę, skok oraz lądowanie. Pokonałem(-am) przeszkody do 60cm.',
                                        'Przygotowałem(-am) pokaz ujeżdżeniowy dla zastępu lub drużyny. Pokazałem(-am) następujące elementy ujeżdżenia: stęp pośredni, kłus roboczy anglezowany, koło w kłusie ćwiczebnym, galop roboczy (na prawo i na lewo), zatrzymanie z kłusu, nieruchomość 5’.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '2',
                        sprawData: [
                              SprawData(
                                  id: 'adept_ujezdzania',
                                  title: 'Adept Ujeżdżania',
                                  level: '1',
                                  comment:'Orientuje się na czworoboku, przedstawia, jak są rozmieszczone konkretne litery na czworoboku, umie się na nim odnaleźć, prawidłowo wykonuje podstawowe figury ujeżdżeniowe w podstawowych chodach.',
                                  tasks: [
                                        'Pokazałem(-am) położenie liter na małym i dużym czworoboku. Wykonałem(-am) szkic – oznaczając je.',
                                        'Rozrysowałem(-am) podstawowe figury ujeżdzeniowe. Zaprezentowałem(-am) je na zbiórce.',
                                        'Wykonałem(-am) płynne przejścia we wszystkich trzech chodach.',
                                        'Wymieniłem(-am) i rozpoznałem(-am) sprzęt użytkowany w tej dyscyplinie.',
                                  ]),
                              SprawData(
                                  id: 'adept_ujezdzania',
                                  title: 'Adept Ujeżdżania',
                                  level: '2',
                                  comment:'Doskonale odnajduje się na czworoboku, wie czym wyróżnia się ta dyscyplina. Rozróżnia oraz prawidłowo wykonuje figury ujeżdzeniowe, a także rodzaje chodów konia. Potrafi zaopiekować się koniem ujeżdżeniowym.',
                                  tasks: [
                                        'Wykonałem(-am) prawidłowo koło o średnicy 20 m we wszystkich trzech chodach.',
                                        'Wymieniłem(-am) wszystkie figury ujeżdzeniowe i rodzaje chodów konia.',
                                        'Prawidłowo dobrałem(-am) strój dla konia i jeźdźca charakterystyczny dla tej dyscypliny. Przygotowałem(-am) przykładową stylizację (może być w formie projektu) – zaprezentowałem(-am) ją na zbiórce.',
                                        'Opiekowałem(-am) się koniem, czyszcząc go, zaplatając grzywę (koreczki), karmiąc i ścieląc boks.',
                                  ]),
                              SprawData(
                                  id: 'adept_ujezdzania',
                                  title: 'Adept Ujeżdżania',
                                  level: '3',
                                  comment:'Wyjeżdża elementy ujeżdżeniowe podstawowe oraz te bardziej zaawansowane, charakteryzuje specjalistyczny dla tej dyscypliny sprzęt – umie go prawidłowo dopasować.',
                                  tasks: [
                                        'Założyłem(-am) samodzielnie owijki z podkładem.',
                                        'Założyłem(-am) i dopasowałem(-am) ogłowie munsztukowe.',
                                        'Wykonałem(-am) serpentynę w  kontrgalopie, zaprezentowałem(-am) kłus wyciągnięty.',
                                        'Wskazałem(-am) reprezentantów Polski w tej dyscyplinie i wymieniłem(-am) ich sukcesy.',
                                        'Pracowałem(-am) z koniem na lonży, przygotowując go do pracy ujeżdżeniowej.',
                                  ]),
                        ]
                    ),

                    SprawFamilyData(
                        id: '3',
                        sprawData: [
                              SprawData(
                                  id: 'skoczek',
                                  title: 'Skoczek',
                                  level: '1',
                                  comment:'Utrzymuje równowagę podczas wykonywania skoku. Poprawnie pokonuje przeszkody. Wykonuje szereg gimnastyczny. Zmienia nogę po skoku.',
                                  tasks: [
                                        'Utrzymałem(-am) równowagę w skoku, podążałem(-am) za koniem, zarówno z kłusu, jak i z galopu.',
                                        'Pokonałem(-am) parkur złożony z 4 przeszkód o wysokości min. 50-60cm (duże konie) i 40-50 cm (kucyki).',
                                        'Pokonałem(-am) szereg gimnastyczny ułożony z co najmniej trzech przeszkód ustawionych na zasadzie skok-wyskok.',
                                        'Po skoku oceniłem(-am), a w razie potrzeby zmieniłem(-am) nogę, na którą koń galopuje.',
                                  ]),
                              SprawData(
                                  id: 'skoczek',
                                  title: 'Skoczek',
                                  level: '2',
                                  comment:'Pokonuje parkur złożony z 8 przeszkód. Odlicza foule w linii. Pokonuje szereg gimnastyczny z zachowaniem równowagi i kontaktu z koniem. Bierze udział w zawodach towarzyskich.',
                                  tasks: [
                                        'Przejechałem(-am) parkur złożony z 8 różnych przeszkód o wysokości 70-80cm (duże konie) i 60-70 cm (kucyki).',
                                        'Odliczyłem(-am) foule w linii.',
                                        'Pokonałem(-am) szereg gimnastyczny zróżnicowany wysokościowo.',
                                        'Co najmniej raz wziąłem(wzięłam) udział w zawodach towarzyskich.',
                                  ]),
                              SprawData(
                                  id: 'skoczek',
                                  title: 'Skoczek',
                                  level: '3',
                                  comment:'Pokonuje parkur złożony z więcej niż 8 przeszkód. Kompletuje ubiór na zawody zgodny z obowiązującym regulaminem. Bierze udział w zawodach. Przekazuje wiedzę na temat jazdy skokowej i zawodów.',
                                  tasks: [
                                        'Przejechałem(-am) parkur złożony z więcej niż 8 przeszkód o wysokości powyżej 80 cm (duże konie) i 70 cm (kucyki).',
                                        'Skompletowałem(-am) prawidłowy ubiór na zawody jeździeckie.',
                                        'Wziąłem(Wzięłam) udział w różnych zawodach (towarzyskich i regionalnych) przynajmniej 2 razy.',
                                        'Zaprezentowałem(-am) innym harcerzom swoją wiedzę na temat jazdy skokowej i zawodów.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '4',
                        sprawData: [
                              SprawData(
                                  id: 'zawodnik_hobby_horses',
                                  title: 'Zawodnik Hobby Horses',
                                  level: '1',
                                  comment:'Wie, co to jest Hobby Horsing, potrafi to wytłumaczyć. Posiada własnego Hobby Horsa. Zna trzy podstawowe chody podczas jazdy na Hobby Horse. Potrafi ułożyć trasę z niskimi przeszkodami naturalnymi.',
                                  tasks: [
                                        'Nauczyłem(-am) się, czym jest Hobby Horsing. Przygotowałem(-am) zbiórkę na ten temat dla swojego zastępu.',
                                        'Posiadam swojego Hobby Horsa, dbam o niego, wykonałem(-am) dla niego nowy sprzęt (np. uszyłem(-am) derkę).',
                                        'Zaprezentowałem(-am), jak należy się poruszać się w trzech podstawowych chodach z Hobby Horsem.',
                                        'Pojechałem(-am) w teren i ustawiłem(-am) parkur z naturalnych elementów o wys. 30-40 cm. Nagrałem(-am) filmik, jak go pokonuję.',
                                  ]),
                              SprawData(
                                  id: 'zawodnik_hobby_horses',
                                  title: 'Zawodnik Hobby Horses',
                                  level: '2',
                                  comment:'Posiada swojego Hobby Horsa. Tworzy układy ujeżdżeniowe do dowolnej piosenki. Organizuje zawody Hobby Horsing.',
                                  tasks: [
                                        'Wykonałem(-am) własnego Hobby Horsa. Zaprezentowałem(-am) go na zbiórce. Nadałem(-am) mu imię oraz przedstawiłem(-am) jego dane (rasa, maść, wiek). Opowiedziałem(-am) o cechach charakterystycznych dla tej rasy.',
                                        'Ustawiłem(-am) i przejechałem(-am) parkur złożony z co najmniej 6 przeszkód o wysokości 60 cm.',
                                        'Stworzyłem(-am) układ ujeżdżeniowy do dowolnej piosenki. Zastosowałem(-am) figury z poziomu SOJ (Srebrna Odznaka Jeździecka Polskiego Związku Jeździeckiego).',
                                        'Zorganizowałem(-am) zawody Hobby Horsing dla własnego zastępu: ujeżdżeniowe, skokowe lub Pony Games. Nagrałem(-am) filmik z tego wydarzenia i zaprezentowałem(-am) na zbiórce drużyny.',
                                  ]),
                              SprawData(
                                  id: 'zawodnik_hobby_horses',
                                  title: 'Zawodnik Hobby Horses',
                                  level: '3',
                                  comment:'Regularnie trenuje na własnoręcznie zrobionych min. trzech Hobby Horsach. Prowadzi zajęcia majsterkowe dla zastępu lub drużyny na których pokazuje, jak zrobić własnego Hobby Horsa. Bierze udział w przygotowaniach zawodów „Potęgi Skoku” i Dnia Hobby Horsing.',
                                  tasks: [
                                        'Wykonałem(-am) co najmniej trzy Hobby Horses. Powiedziałem(-am), jakiej są rasy i maści. Regularnie na nich trenuję.',
                                        'Przeprowadziłem(-am) zbiórkę o tym, jak zrobić własnego Hobby Horsa.',
                                        'Przygotowałem(-am) zawody „Potęgi Skoku”.',
                                        'Zorganizowałem(-am) Dzień Hobby Horsing dla całej drużyny. Wymyśliłem(-am) dla drużyny choreografię do kadryla jeździeckiego.',
                                  ]),
                              SprawData(
                                  id: 'zawodnik_hobby_horses',
                                  title: 'Zawodnik Hobby Horses',
                                  level: '4',
                                  comment:'Przekazuje wiedzę o trenowaniu i utrzymywaniu w porządku swoich Hobby Horses. Wykona własną stajnię Hobby Horses. Organizuje zawody Hobby Horses dla innych drużyn',
                                  tasks: [
                                        'Wykonałem(-am) stajnię dla moich Hobby Horses. Uszyłem(-am) derki i kantary.',
                                        'Zorganizowałem(-am) dla drużyny zajęcia o tym, jak zrobić własną stajnię Hobby Horses i jak dbać o swoje Hobby Horses.',
                                        'Zorganizowałem(-am) Zawody Hobby Horses dla innej drużyny. Przygotowałem(-am) zawody skokowe, ujeżdżeniowe i Pony Games.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '5',
                        sprawData: [
                              SprawData(
                                  id: 'woltyzer',
                                  title: 'Woltyżer',
                                  level: '1',
                                  comment:'Przestrzega podstawowych zasad lonżowania konia. Zna podstawowy sprzęt do woltyżerki. Wsiada i zsiada z konia z obydwóch stron. Wykonuje podstawowe ćwiczenia na koniu gimnastycznym, stojącym oraz chodzącym stępem',
                                  tasks: [
                                        'Prawidłowo wsiadałem(-am) i zsiadałem(-am) z konia, zarówno z prawej, jak i lewej strony (dopuszczalna jest pomoc asystenta).',
                                        'Prawidłowo wykonałem(-am) następujące ćwiczenia:'
                                            '\n\nA) na koniu gimnastycznym: wskok, siad podstawowy, klęk, flaga, młynek, nożyce, stanie;'
                                            '\nB) na koniu stojącym: siad podstawowy, flaga, młynek, rybka w przód i tył;'
                                            '\nC) na koniu chodzącym stępem na lonży: flaga, młynek, jazda bokiem i tyłem, martwy Indianin.',
                                        'Wymieniłem(-am) i opisałem(-am) podstawowy sprzęt używany do woltyżerki.',
                                        'Poznałem(-am) zasady prawidłowego lonżowania konia i zastosowałem(-am) je w praktyce.',
                                  ]),
                              SprawData(
                                  id: 'woltyzer',
                                  title: 'Woltyżer',
                                  level: '2',
                                  comment:'Utrzymuje równowagę w trzech podstawowych chodach. Prawidłowo wykonuje ćwiczenia na koniu stojącym oraz chodzącym w trzech chodach. Zakłada i dopasowuje sprzęt woltyżerski.',
                                  tasks: [
                                        'Utrzymywałem(-am) równowagę w stępie, kłusie i galopie.',
                                        'Prawidłowo wykonałem(-am) następujące ćwiczenia:'
                                            '\n\nA) na koniu stojącym: młynek, stanie, nożyce, zeskok odwrócony, podpór przodem;'
                                            '\nB) na koniu chodzącym w trzech chodach na lonży: wskok, flaga, młynek, jazda bokiem i tyłem.',
                                        'Prawidłowo założyłem(-am) i dopasowałem(-am) sprzęt woltyżerski (ogłowie, wypinacze, pas).',
                                        'Przygotowałem(-am) pokaz woltyżerski dla swojego zastępu.',
                                  ]),
                              SprawData(
                                  id: 'woltyzer',
                                  title: 'Woltyżer',
                                  level: '3',
                                  comment:'Prezentuje wymyślone przez siebie układy. Przekazuje wiedzę na temat woltyżerki mniej doświadczonym osobom, uczy je podstawowych ćwiczeń. Prawidłowo wykonuje ćwiczenia na koniu stojącym oraz chodzącym w trzech chodach.',
                                  tasks: [
                                        'Przedstawiłem(-am) swojemu zastępowi w dowolny sposób regulamin dyscypliny woltyżerka.',
                                        'Prawidłowo wykonałem(-am) następujące ćwiczenia:'
                                            '\n\nA) na koniu stojącym: wskok trzema sposobami bez asystenta;'
                                            '\nB) na koniu chodzącym w trzech chodach na lonży: wskok, zeskok, zeskok-wskok, rybka, nożyce, stanie, podpór przodem.',
                                        'Zaprezentowałem(-am) 5 figur wymyślonych przez siebie w układzie choreograficznym.',
                                        'Nauczyłem(-am) mniej doświadczone osoby podstawowych ćwiczeń na koniu gimnastycznym.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '6',
                        sprawData: [
                              SprawData(
                                  id: 'westernowiec',
                                  title: 'Westernowiec',
                                  level: '1',
                                  comment:'Nosi strój zgodny z kanonem dyscypliny. Rozpoznaje elementy rzędu jeździeckiego. Wsiada i zsiada na konia „po strzemieniu”. Porusza się w stępie, kłusie oraz cofa.',
                                  tasks: [
                                        'Skompletowałem(-am) odpowiedni i bezpieczny strój do jazdy konnej, a także wytłumaczyłem(-am), jak wygląda strój jeźdźca zgodny z kanonem tej dyscypliny.',
                                        'Rozpoznałem(-am) podstawowe elementy rzędu jeździeckiego związane z tą dyscypliną.',
                                        'Wsiadałem(-am) i zsiadałem(-am) na konia „po strzemieniu”.',
                                        'Poruszałem(-am) się w kłusie i stępie, wykonałem(-am) zatrzymania z obu chodów, cofałem(-am).',
                                  ]),
                              SprawData(
                                  id: 'westernowiec',
                                  title: 'Westernowiec',
                                  level: '2',
                                  comment:'Porusza się w trzech chodach, wykonuje płynne przejścia pomiędzy nimi. Rozpoznaje kiełzna. Opisuje jedną z konkurencji oraz korzenie tej dyscypliny.',
                                  tasks: [
                                        'Opisałem(-am) jedną z konkurencji rozgrywanych w stylu western.',
                                        'Rozpoznałem(-am) kiełzna charakterystyczne dla tej dyscypliny.',
                                        'Dowiedziałem(-am) się, jakie są korzenie tej dyscypliny, przedstawiłem(-am) je innym harcerzom.',
                                        'Poruszałem(-am) się w trzech chodach – wykonywałem(-am) płynne przejścia pomiędzy nimi, zatrzymania, cofanie.',
                                  ]),
                              SprawData(
                                  id: 'westernowiec',
                                  title: 'Westernowiec',
                                  level: '3',
                                  comment:'Opisuje najważniejsze klasy pokazowe w western. Samodzielnie przygotowuje konia. Poprawnie trzyma wodze. Rozpoznaje typowe dla westernu rasy koni. Porusza się w trzech chodach, prawidłowo wykonuje figury westernowe, zachowuje balans przy przejściach pomiędzy nimi.',
                                  tasks: [
                                        'Wymieniłem(-am) i opisałem(-am) najważniejsze klasy pokazowe w stylu western.',
                                        'Samodzielnie przygotowałem(-am) konia do jazdy.',
                                        'Nauczyłem(-am) się, jak trzyma się wodzę w stylu western. Zaprezentowałem(-am), jak wygląda to w różnych kategoriach.',
                                        'Rozpoznałem(-am) typowe rasy koni użytkowane w stylu westernowym.',
                                        'Poruszałem(-am) się w trzech chodach – wykonywałem(-am) płynne przejścia pomiędzy nimi, zatrzymania, cofanie, ruchy boczne oraz zmiany nogi w galopie, spin.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '7',
                        sprawData: [
                              SprawData(
                                  id: 'powozacy',
                                  title: 'Powożący',
                                  level: '1',
                                  comment:'Opiekuje się koniem. Widzi różnicę pomiędzy uprzężą szorową a chomątową. Rozpoznaje kiełzna zaprzęgowe. Wie, jak bezpiecznie zaprzęgać konie.',
                                  tasks: [
                                        'Rozpoznałem(-am) kiełzna wykorzystywane w zaprzęgach.',
                                        'Dowiedziałem(-am) się, czym różni uprząż szorowa od chomątowej. Opowiedziałem(-am) o tym.',
                                        'Opiekowałem(-am) się koniem, czyszcząc go, zaplatając grzywę i ogon, karmiąc i ścieląc boks.',
                                        'Poznałem(-am) zasady bezpiecznego zaprzęgania i stosowałem(-am) je w praktyce.',
                                  ]),
                              SprawData(
                                  id: 'powozacy',
                                  title: 'Powożący',
                                  level: '2',
                                  comment:'Wymienia i rozpoznaje rodzaje uprzęży oraz typy pojazdów. Dopasowuje uprzęże oraz wymienia, z czego się składają. Pełni funkcję luzaka, opowiada, na czym ona polega',
                                  tasks: [
                                        'Wymieniłem(-am) rodzaje uprzęży i typy pojazdów, rozpoznając je na rysunkach lub zdjęciach.',
                                        'Zademonstrowałem(-am) i opowiedziałem(-am) o tym, jaką funkcję pełni luzak w dyscyplinie powożenia.',
                                        'Poznałem(-am) budowę uprzęży szorowej lub chomątowej. Zakładałem(-am) i dopasowywałem(-am) je, poznając przy tym zasady zaprzęgania koni w pojedynkę i w parze.',
                                        'Brałem(-am) udział w przygotowaniach do zawodów zaprzęgów, pełniąc funkcję luzaka.',
                                  ]),
                              SprawData(
                                  id: 'powozacy',
                                  title: 'Powożący',
                                  level: '3',
                                  comment:'Wyjaśnia terminologię związaną z powożeniem. Rozróżnia style zaprzęgów. Wsiada i zsiada z pojazdu, odmierza lejce. Prowadzi zastęp jedno- lub wielokonny. Znajduje informacje na temat reprezentantów Polski w tej dziedzinie',
                                  tasks: [
                                        'Poznałem(-am) budowę uprzęży. Dowiedziałem(-am) się, co to jest munsztuk zaprzęgowy, liverpool, fasculce, blendysz, duga itp. oraz opowiedziałem(-am) o tym na zbiórce zastępu lub drużyny.',
                                        'Przedstawiłem(-am) za pomocą multimediów, jak najłatwiej rozróżnić style zaprzęgów: angielski, węgierski, bałagulski i inne.',
                                        'Prawidłowo wsiadałem(-am) i zsiadałem(-am) z pojazdu, odmierzyłem(-am) lejce.',
                                        'Prowadziłem(-am) zastęp jednokonny lub parokonny po placu po liniach prostych i w zakrętach zgodnie z zatwierdzonym schematem.',
                                        'Znalazłem(-am) informacje na temat reprezentantów Polski w tej dyscyplinie i opowiedziałem(-am) o ich sukcesach.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '8',
                        sprawData: [
                              SprawData(
                                  id: 'zawodnik_working_equitation',
                                  title: 'Zawodnik Working Equitation',
                                  level: '1',
                                  comment:'Wie, co to jest Working Equitation. Porusza się płynnie w trzech chodach. Poprawnie pokonuje przeszkody. Prawidłowo wyjeżdża podstawowe figury ujeżdżeniowe.',
                                  tasks: [
                                        'Poruszałem(-am) się płynnie i w równowadze w trzech podstawowych chodach.',
                                        'Poprawnie pokonałem(-am) przeszkody w stępie: slalom między tyczkami, trzy beczki, bramka, gliniany garnek, przeniesienie kubka z jednej tyczki na drugą.',
                                        'Wykonałem(-am) i przedstawiłem(-am) pracę dotyczącą Working Equitation, a dokładniej: co to jest, obowiązujące zasady i skojarzenia.',
                                        'Prawidłowo wyjeżdżałem(-am): woltę, półwolty, zatrzymanie, nieruchomość 6s, koło.',
                                  ]),
                              SprawData(
                                  id: 'zawodnik_working_equitation',
                                  title: 'Zawodnik Working Equitation',
                                  level: '2',
                                  comment:'Bierze udział w zawodach na poziomie L. Pokonuje przeszkody w kłusie. Monitoruje rozwój dyscypliny i ma jeźdźca, na którym się wzoruje. Pokazuje innym, jak prawidłowo pokonuje się podane przeszkody.',
                                  tasks: [
                                        'Wziąłem(Wzięłam) udział w zawodach regionalnych lub towarzyskich na poziomie L, osiągnąłem(osiągnęłam) wynik min. 55%.',
                                        'Poprawnie pokonałem(-am) przeszkody w kłusie: ósemka między beczkami, skok przez kostki słomy, gliniany garnek, objeżdżanie tyczek lub przeszkód, przeniesienie kubka z jednej tyczki na drugą.',
                                        'Aktywnie monitorowałem(-am) rozwój dyscypliny Working Equitation w Polsce, znalazłem(-am) informacje na temat aktualnych zawodów i szkoleń, a także wskazałem(-am) jeźdźca, na którym się wzoruję.',
                                        'Przygotowałem(-am) pokaz dla zastępu lub drużyny, na którym pokazałem(-am), jak pokonuję podane przeszkody. Wykonałem(-am) je w dwóch formach: na szybkość oraz na dokładność.',
                                  ]),
                              SprawData(
                                  id: 'zawodnik_working_equitation',
                                  title: 'Zawodnik Working Equitation',
                                  level: '3',
                                  comment:'Współorganizuje zawody z elementami WE. Prawidłowo pokonuje podane przeszkody i figury ujeżdżeniowe. Przekazuje wiedzę, jak poprawnie technicznie pokonać przeszkody.',
                                  tasks: [
                                        'Współorganizowałem(-am) u siebie w stajni zawody z elementami Working Equitation dla kolegów lub zastępu.',
                                        'Prawidłowo wykonałem(-am): cofnięcie 6 kroków, łopatką do wewnątrz w stępie, ustępowanie od łydki w stępie, półpiruet, serpentynę o 3 łukach ze zmianami nogi na linii środkowej (w galopie), zatrzymanie z kłusa.',
                                        'Poprawnie pokonałem(-am) przeszkody (w kłusie lub galopie): wyciągnięcie tyczki z beczki, użycie tyczki do zdjęcie pierścienia, włożenie tyczki do beczki, chód boczny przez kłodę (stęp), bramka.',
                                        'Nauczyłem(-am) mniej doświadczonych jeźdźców poprawnie technicznego pokonywania podstawowych przeszkód.',
                                        'Zorganizowałem(-am) tor przeszkód składający się z minimum 7 elementów i pokonałem(-am) go w jak najszybszym tempie.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '9',
                        sprawData: [
                              SprawData(
                                  id: 'zawodnik_trec',
                                  title: 'Zawodnik TREC',
                                  level: '1',
                                  comment:'Ma świadomość, czym są zawody TREC PTTK, rozróżnia ich fazy. Prawidłowo orientuje się w terenie. Bierze udział w dwóch fazach TREC – MA oraz PTV.',
                                  tasks: [
                                        'Wytłumaczyłem(-am) zastępowi, czym są zawody TREC PTTK, oraz wyjaśniłem(-am) skróty Faza PTV, MA, POR.',
                                        'Posługiwałem(-am) się mapą topograficzną. Wziąłem(Wzięłam) udział w rozgrywkach INO.',
                                        'Wziąłem(Wzięłam) udział w fazie MA (kontrola tempa). Osiągnąłem(osiągnęłam) wyniki: galop - powyżej 27 sekund, stęp - poniżej 95 sekund.',
                                        'Poprawnie pokonałem(-am) przeszkody z fazy PTV: niskie gałęzie, korytarz, nieruchomość w siodle, prowadzenie konia po literze "S", dosiadanie konia.',
                                  ]),
                              SprawData(
                                  id: 'zawodnik_trec',
                                  title: 'Zawodnik TREC',
                                  level: '2',
                                  comment:'Trenuje elementy TREC, wyjeżdżając w teren, prawidłowo odnajduje się na mapie. Przekazuje wiedzę na temat TREC PTTK innym harcerzom. Sprawnie pokonuje coraz trudniejsze elementy fazy PTV oraz osiąga coraz lepsze wyniki w fazie MA.',
                                  tasks: [
                                        'Zaprezentowałem(-am) zastępowi w dowolnej formie regulamin TREC PTTK.',
                                        'Uczestniczyłem(-am) w wycieczce konnej, podczas której zaznaczałem(-am) na mapie topograficznej przejechaną trasę.',
                                        'Wziąłem(Wzięłam) udział w fazie MA (kontrola tempa). Osiągnąłem(-am) wyniki: galop - powyżej 30 sekund, stęp - poniżej 80 sekund.',
                                        'Poprawnie pokonałem(-am) przeszkody z fazy PTV: przejazd na koniu po literze "S", nieruchomość, bramka, kłoda, ósemka.',
                                  ]),
                              SprawData(
                                  id: 'zawodnik_trec',
                                  title: 'Zawodnik TREC',
                                  level: '3',
                                  comment:'Bierze udział w zawodach TREC PTTK. Organizuje zawody z elementami tej dyscypliny dla innych. Sprawnie pokonuje coraz trudniejsze elementy fazy PTV oraz osiąga coraz lepsze wyniki w fazie MA',
                                  tasks: [
                                        'Wziąłem(Wzięłam) udział w zawodach TREC PTTK.',
                                        'Zorganizowałem(-am) zawody z elementami TREC dla znajomych ze stajni lub/i harcerstwa.',
                                        'Wziąłem(Wzięłam) udział w fazie MA (kontrola tempa). Osiągnąłem(-am) wyniki: galop - powyżej 33,5 sekund, stęp - poniżej 70 sekund.',
                                        'Poprawnie pokonałem(-am) przeszkody z fazy PTV: mostek przejechany na koniu, cofanie, wprowadzanie konia do przyczepy, szereg (cross), zjazd z pochyłości.',                       ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '10',
                        sprawData: [
                              SprawData(
                                  id: 'turysta_konny',
                                  title: 'Turysta Konny',
                                  level: '1',
                                  comment:'Zna podstawową wiedzę dotyczącą chowu, hodowli i popasu. Wykonuje ćwiczenia rozluźniające w siodle. Porusza się w 3 podstawowych chodach. Bierze udział w wycieczkach konnych odbywających się okolicach ośrodka.',
                                  tasks: [
                                        'Za pomocą dowolnej formy przedstawiłem(-am) podstawowe informacje na temat chowu i hodowli koni: typy i rasy koni, maści koni, podstawowe części ciała, ogólne wiadomości o zasadach żywienia koni.',
                                        'Poznałem(-am) zasady bezpiecznego popasu koni, prawidłowo uwiązałem(-am) konia.',
                                        'Prawidłowo wykonywałem(-am) podstawowe ćwiczenia rozluźniające w siodle.',
                                        'W równowadze i harmonii poruszałem(-am) się stępem, kłusem i galopem.',
                                        'Wziąłem(Wzięłam) udział w wycieczce konnej, podczas której poznałem(-am) walory przyrodniczo-krajoznawcze okolic ośrodka.',
                                  ]),
                              SprawData(
                                  id: 'turysta_konny',
                                  title: 'Turysta Konny',
                                  level: '2',
                                  comment:'Dzieli się wiedzą na temat anatomii konia, pomocy jeździeckich, powodowania koniem, wyjazdów w teren i rajdów. Porusza się w trzech podstawowych chodach, pokonuje w nich niskie przeszkody. Potrafi poruszać się w terenie otwartym. Bierze udział w dwudniowych rajdach.',
                                  tasks: [
                                        'Posiadałem(-am) i potrafiłem(-am) przedstawić w ciekawy sposób: anatomię konia, zasady stosowania pomocy jeździeckich, powodowanie koniem w podstawowych chodach.',
                                        'Poruszałem(-am) się konno w trzech chodach, zachowując płynność chodów. Potrafiłem(-am) pokonać drążki i cavaletti w tych chodach podstawowych.',
                                        'Zaprezentowałem(-am) swojemu zastępowi zasady bezpieczeństwa obchodzenia się z końmi, wyjazdów w teren oraz rajdów konnych.',
                                        'Nauczyłem(-am) się jazdy w terenie otwartym i zadrzewionym z pokonywaniem przeszkód naturalnych oraz podjazdów i zjazdów, a także przekraczaniem przeszkód wodnych. Przy pokonywaniu przeszkód zachowywałem(-am) odpowiedni kontakt z koniem oraz dosiad w równowadze.',
                                        'Brałem(-am) udział w dwudniowym rajdzie konnym, podczas którego poznałem(-am) walory przyrodniczo-krajoznawcze w promieniu 30 km. W praktyce poznałem(-am) zasady oznaczeń szlaków konnych, rozróżniałem(-am) szlaki konne, piesze i rowerowe.',
                                  ]),
                              SprawData(
                                  id: 'turysta_konny',
                                  title: 'Turysta Konny',
                                  level: '3',
                                  comment:'Przekazuje wiedzę na temat poruszania się po drogach, przygotowania konia do wyjazdu oraz poruszania się konia. Prawidłowo stosuje pomoce jeździeckie. Pokonuje przeszkody do 40 cm. Bierze udział w wycieczkach konnych i rajdach konnych.',
                                  tasks: [
                                        'Nauczyłem(-am) się podstawowych zasady z prawa o ruchu drogowym dotyczących poruszania się po drogach publicznych, nauczyłem(-am) się, jak przygotować konia do wyjazdu oraz jak zachować się w terenie i na postojach.',
                                        'Za pomocą dowolnej formy przedstawiłem(-am) i nauczyłem(-am) młodszych kolegów: jak koń się porusza (jak prawidłowo stawia nogi w różnych chodach), jakie są główne wady budowy koni.',
                                        'Prawidłowo stosowałem(-am) pomoce jeździeckie, jeździłem(-am) chodami zebranymi i wyciągniętymi, wykonywałem(-am) poprawnie wszystkie podstawowe figury na ujeżdżalni.',
                                        'Pokonywałem(-am) w równowadze przeszkody do 40 cm zarówno na ujeżdżalni, jak i w terenie.',
                                        'Brałem(-am) udział w rajdzie czterodniowym oraz w 4 wycieczkach konnych po różnych trasach o różnych celach krajoznawczych.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '11',
                        sprawData: [
                              SprawData(
                                  id: 'konny_rekonstruktor_historyczny',
                                  title: 'Konny Rekonstruktor Historyczny',
                                  level: '2',
                                  comment:'Wie, jaki jest odpowiedni strój w danej epoce. Opowiada o danej epoce historycznej. Posiada wiedzę na temat różnych grup rekonstrukcyjnych, szczególnie działających w jego okolicy zamieszkania.',
                                  tasks: [
                                        'Posiadłem(-am) wiedzę na temat różnych grup rekonstrukcyjnych, znalazłem(-am) informacje o tym, jakie grupy działają w okolicy mojego zamieszkania.',
                                        'Opowiedziałem(-am) o danej epoce historycznej związanej z zakresem rekonstrukcji – podstawowe daty, bitwy, wydarzenia, umundurowanie (ubiór), itp.',
                                        'Wskazałem(-am), z jakich elementów składa się strój rekonstruktora w wybranej przeze mnie epoce.',
                                        'Poruszałem(-am) się konno w pełnym stroju w trzech chodach.',
                                  ]),
                              SprawData(
                                  id: 'konny_rekonstruktor_historyczny',
                                  title: 'Konny Rekonstruktor Historyczny',
                                  level: '3',
                                  comment:'Opowiada o rasach koni wykorzystywanych w rekonstrukcji. Organizuje pokazy jazdy. Opowiada szczegółowo o danej epoce historycznej. Posługuje się dodatkowymi atrybutami historycznymi związanymi z rekonstrukcją.',
                                  tasks: [
                                        'Zorganizowałem(-am) pokaz jazdy dla swojej drużyny, opowiedziałem(-am) szczegółowo o danej epoce historycznej.',
                                        'Zaprezentowałem(-am) posługiwanie się dodatkowymi atrybutami historycznymi (broń biała, palna, lasso, itp.) związanymi z rekonstrukcją.',
                                        'Opowiedziałem(-am) o różnych rasach koni wykorzystywanych w danej rekonstrukcji.',
                                        'Odwiedziłem(-am) w swojej okolicy zamieszkania grupę rekonstrukcyjną, na zbiórce opowiedziałem(-am), jak wygląda takie spotkanie oraz jakie warunki trzeba spełnić, aby zostać rekonstruktorem.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '12',
                        sprawData: [
                              SprawData(
                                  id: 'opiekun_koni',
                                  title: 'Opiekun Koni',
                                  level: '1',
                                  comment:'Wymienia oraz stosuje się do podstawowych zasad pracy w stajni. Rozróżnia stanowisko i boks, a także podstawowe pasze objętościowe i treściwe. Prawidłowo przygotowuje i podaje pasze dla koni.',
                                  tasks: [
                                        'Poznałem(-am) podstawowe zasady bezpieczeństwa pracy przy koniach. Stosowałem(-am) je w praktyce, a także w dowolnej formie przedstawiłem(-am) je swojemu zastępowi.',
                                        'Rozróżniłem(-am) stanowisko i boks, omówiłem(-am) ich wady i zalety, prawidłowo je pościeliłem(-am).',
                                        'Dowiedziałem(-am) się, czym odżywia się koń. Wymieniłem(-am) podstawowe pasze objętościowe i treściwe. W obecności osoby odpowiedzialnej przygotowałem(-am) i zadałem(-am) paszę koniom w stajni.',
                                        'Prawidłowo złapałem(-am) konia, prowadziłem(-am) go, wprowadzałem(-am) i wyprowadzałem(-am) z boksu.',
                                  ]),
                              SprawData(
                                  id: 'opiekun_koni',
                                  title: 'Opiekun Koni',
                                  level: '2',
                                  comment:'Rozróżnia rośliny jadalne i trujące dla koni. Dba o bezpieczeństwo konia i siebie. Prawidłowo odczytuje mowę koni, chętnie przekazuje wiedzę na ten temat innym. Prawidłowo przygotowuje pastwisko do wypasu. Zakłada na konia podstawowy sprzęt stajenny.',
                                  tasks: [
                                        'Rozpoznałem(-am) na pastwisku, czy wszystkie rośliny są jadalne dla koni, wymieniłem(-am) 5 roślin trujących. Sprawdziłem(-am), czy siano i pasza treściwa są zdatne do zjedzenia dla konia (np. brak pleśni).',
                                        'Brałem(-am) udział w przygotowaniu pastwiska do wypasu: sprzątałem(-am) odchody po koniach, sprawdzałem(-am), czy ogrodzenie jest całe, przygotowałem(-am) wraz z opiekunem miejsca poboru siana przez zwierzęta, sprawdziłem(-am) stan poideł, czyszcząc je.',
                                        'Prawidłowo założyłem(-am) derkę i owijki lub ochraniacze stajenne. Rozróżniłem(-am) rodzaje derek i ochraniaczy, nauczyłem(-am) się, kiedy stosować każdy z rodzajów.',
                                        'Prawidłowo odczytałem(-am) mowę ciała konia (ogólny wygląd, ustawienie zadu, głowa, mowa nóg, mowa ogona). Na podstawie odczytanych sygnałów konia bezpiecznie podszedłem(podeszłam) do konia. Sygnały mowy końskiej wskazałem(-am) zastępowi.',
                                  ]),
                              SprawData(
                                  id: 'opiekun_koni',
                                  title: 'Opiekun Koni',
                                  level: '3',
                                  comment:'Prawidłowo kieruje zespołem podczas prac stajennych. Przekazuje wiedzę na temat dobrostanu koni oraz ich prawidłowego utrzymania.',
                                  tasks: [
                                        'Kierowałem(-am) pracą wachty stajennej na obozie lub w klubie.',
                                        'Przedstawiłem(-am) zastępowi lub drużynie 5 zasad dobrostanu zwierząt, w swojej pracy z końmi zastosowałem(-am) te zasady w praktyce.',
                                        'Opisałem(-am) poprawne warunki utrzymania koni w stajni, posiłkując się najnowszym rozporządzeniem Ministra Rolnictwa i Rozwoju Wsi w sprawie minimalnych warunków utrzymywania zwierząt gospodarskich',
                                        'Przygotowałem(-am) dyskusję dla zastępu lub drużyny o rodzajach systemu utrzymania koni, przedstawiłem(-am) zalety i wady każdego systemu.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '13',
                        sprawData: [
                              SprawData(
                                  id: 'zootechnik',
                                  title: 'Zootechnik',
                                  level: '1',
                                  comment:'Rozróżnia pojęcia chów i hodowla, przekazuje innym, jak je prawidłowo definiować. Dzieli się swoją wiedzą na temat ras i typów użytkowych, a także budowy konia. Wymienia składowe oceny wartości użytkowej. Wskazuje na koniach zadane maści i odmiany.',
                                  tasks: [
                                        'Rozróżniałem(-am) pojęcia chów i hodowla, przedstawiłem(-am) za pomocą wizualizacji (np. mapy myśli), jak prawidłowo definiować te pojęcia.',
                                        'Poznałem(-am) typy użytkowe i rasy koni. Opowiedziałem(-am) zastępowi o typach użytkowych koni, wymieniłem(-am) kilka ras koni, które należą do danych grup. Poznałem(-am) podział koni na gorącokrwiste, zimnokrwiste i prymitywne, podałem(-am) przykładowe rasy koni należące do konkretnego rodzaju.',
                                        'Wskazałem(-am) na koniu poszczególne elementy jego budowy, wymieniłem(-am) główne wady budowy u koni.',
                                        'Uczestniczyłem(-am) w pokazie hodowlanym koni.',
                                        'Wskazałem(-am) na koniach u siebie w stajni zadane maści i odmiany.',
                                  ]),
                              SprawData(
                                  id: 'zootechnik',
                                  title: 'Zootechnik',
                                  level: '2',
                                  comment:'Dzieli się wiedzą z zakresu: rozrodu koni, eksterieru, prób dzielności. Opisuje etapy rozwoju konia, zwraca uwagę na jego stan psychiczny i fizyczny. Ocenia budowę koni. Na przykładach wymienia rasy koni ze względu na typ koni.',
                                  tasks: [
                                        'Opowiedziałem(-am) zastępowi lub drużynie o okresie trwania ciąży u konia, terminie przeprowadzania stanówki i odsadzaniu źrebiąt.',
                                        'Zaprezentowałem(-am) w dowolny sposób charakterystyczne cechy przedstawicieli koni hodowlanych w Polsce podzielonych na konie zimnokrwiste, gorącokrwiste, półkrwi oraz prymitywne.',
                                        'Poznałem(-am), na jakiej podstawie ocenia się eksterier u koni, oceniłem(-am) budowę min. 3 koni, wskazując prawidłowości i wady postawy.',
                                        'Uczestniczyłem(-am) w próbie dzielności koni i wiem, na czym polega ocena wartości hodowlanej.',
                                        'Opisałem(-am) poszczególne etapy rozwoju konia od źrebaka do konia w podeszłym wieku, zwracałem(-am) uwagę na stan psychiczny i fizyczny. Odróżniłem(-am) na pastwisku, czy koń jest młody czy w podeszłym wieku.',
                                  ]),
                              SprawData(
                                  id: 'zootechnik',
                                  title: 'Zootechnik',
                                  level: '3',
                                  comment:'Korzysta z Ksiąg Stadnych. Wskazuje i zapobiega złym nawykom i narowom. Poznał, czym jest imbred. Ocenia wiek konia po zębach. Dzieli się wiedzą na temat przyznawania klas ogierom rozpłodowym.',
                                  tasks: [
                                        'Prawidłowo korzystałem(-am) z Ksiąg Stadnych, wyszukałem(-am) konkretnego konia po ustalonych wcześniej założeniach. Wykonałem(-am) teoretyczny rodowód konia do 3 pokoleń wstecz.',
                                        'Rozpoznałem(-am) narowy i złe nawyki u koni. Potrafiłem(-am) je wskazać oraz im zapobiegać.',
                                        'Korzystałem(-am) ze strony bazakoni.pl, stworzyłem(-am) na niej przykładowy rodowód, zwracając szczególną uwagę na imbred. Wytłumaczyłem(-am), co to jest imbred, czemu tak ważne jest jego obliczanie i kontrola w hodowli.',
                                        'Prawidłowo oceniałem(-am) wiek trzech różnych (wiekowo) koni na podstawie obecności rejestrów i kształtu powierzchni trącej siekaczy w szczęce górnej i żuchwie.',
                                        'Poznałem(-am) zasady przyznawania klas ogierom rozpłodowym, przygotowałem(-am) na ten temat zajęcia dla zastępu.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '14',
                        sprawData: [
                              SprawData(
                                  id: 'dietetyk_konny',
                                  title: 'Dietetyk Konna',
                                  level: '1',
                                  comment:'Rozpoznaje podstawowe pasze. Prezentuje zasady karmienia i pojenia. Karmi konie oraz czyści poidła. Zna budowę układu pokarmowego konia',
                                  tasks: [
                                        'Rozpoznawałem(-am) podstawowe pasze objętościowe i treściwe w żywieniu koni.',
                                        'Poznałem(-am) i zaprezentowałem(-am) zasady karmienia i pojenia koni.',
                                        'Wziąłem(Wzięłam) czynny udział w karmieniu koni pod okiem specjalisty.',
                                        'Kontrolowałem(-am) stan poideł i żłobów. Przynajmniej raz wziąłem(wzięłam) udział w ich czyszczeniu.',
                                        'Poznałem(-am) podstawową budowę układu pokarmowego koni, wskazałem(-am) różnice między nim a układem pokarmowym ludzi.',
                                  ]),
                              SprawData(
                                  id: 'dietetyk_konny',
                                  title: 'Dietetyk Konna',
                                  level: '2',
                                  comment:'Ocenia jakość pasz. Opisuje, na czym polega ocena BSC. Przedstawia, w jakich momentach lub aspektach należy zmienić pasze. Przygotowuje i zadaje mesz. Charakteryzuje budowę układu pokarmowego konia.',
                                  tasks: [
                                        'Oceniłem(-am) organoleptycznie jakość podawanych pasz treściwych i objętościowych.',
                                        'Poznałem(-am), co to jest skala oceny BCS. Krótko opisałem(-am) zastępowi, na czym ona polega.',
                                        'Przedstawiłem(-am) zastępowi w ciekawej formie, w jakich aspektach lub momentach należy zmienić paszę bądź ilości podawania (np. klacz wysokoźrebna).',
                                        'Przygotowałem(-am) mesz dla koni, pod okiem specjalisty zadałem(-am) go koniom w stajni.',
                                        'Poznałem(-am) i scharakteryzowałem(-am) dokładną budowę układu pokarmowego konia. Dowiedziałem(-am) się, w jaki sposób koń pobiera pasze.',
                                  ]),
                              SprawData(
                                  id: 'dietetyk_konny',
                                  title: 'Dietetyk Konna',
                                  level: '3',
                                  comment:'Pomaga przy układaniu dawki pokarmowej. Dokonuje oceny BCS. Opisuje objawy podstawowych chorób układu pokarmowego konia. Wymienia metody oceny wagi konia. Kontroluje pobieranie paszy przez konie. Obserwuje specjalistę podczas kontroli uzębienia',
                                  tasks: [
                                        'Byłem(-am) obecny(-a) przy układaniu dawki pokarmowej przez specjalistę żywienia koni. Następnie przedstawiłem(-am) zastępowi, na co należy zwracać uwagę przy układaniu zbilansowanej dawki, a także opowiedziałem(-am), jak taki specjalista pracuje.',
                                        'Pod opieką specjalisty dokonałem(-am) oceny BCS u min. 5 różnych koni. Wskazałem(-am), który koń jest w normie, który ma nadwagę lub niedowagę.',
                                        'Poznałem(-am) i opisałem(-am) objawy podstawowych chorób układu pokarmowego dowiedziałem(-am) się, jakie są wskazania dietetyczne w takich przypadkach.',
                                        'Wymieniłem(-am) kilka metod oceny wagi koni, wziąłem(wzięłam) udział w takiej ocenie wybraną przez siebie metodą.',
                                        'Kontrolowałem(-am) pobieranie paszy przez konie, dowiedziałem(-am), o czym mogą świadczyć pozostawione resztki paszy w żłobie. Byłem(-am) obecny podczas kontroli uzębienia koni w stajni. Zaprezentowałem(-am) zastępowi, dlaczego tak ważna jest regularna kontrola stomatologiczna u koni.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '15',
                        sprawData: [
                              SprawData(
                                  id: 'zaklinacz_koni',
                                  title: 'Zaklinacz Koni',
                                  level: '1',
                                  comment:'Zauważa, jak działa mowa ciała między koniem a człowiekiem. Uczy konia sztuczki. Obserwuje pokazy i prezentuje, jakie są sztuczki',
                                  tasks: [
                                        'Prawidłowo odczytywałem(-am) mowę ciała konia (ogólny wygląd, ustawienie zadu, głowy, mowa nóg, mowa ogona). Na podstawie odczytanych sygnałów konia bezpiecznie podchodziłem(-am) do konia. Sygnały mowy końskiej wskazałem(-am) zastępowi.  ',
                                        'Dowiedziałem(-am) się, jak konie odczytują mowę ciała człowieka, podczas pracy z koniem stosowałem(-am) się do tych zasad.',
                                        'Za zgodą właściciela i pod okiem osoby doświadczonej nauczyłem(-am) konia wykonywać buziaka.',
                                        'Obserwowałem(-am) pokaz końskich sztuczek.',
                                        'Przygotowałem(-am) w formie graficznej informacje, jakie sztuczki potrafi wykonywać koń.',
                                  ]),
                              SprawData(
                                  id: 'zaklinacz_koni',
                                  title: 'Zaklinacz Koni',
                                  level: '2',
                                  comment:'Uczy konie kilku sztuczek. Widzi wady i zalety sztuczek oraz wskazuje, z jakich naturalnych zachowań wywodzą się sztuczki. Wymienia autorytety, które pracują na zasadzie sztuczek.',
                                  tasks: [
                                        'Pod okiem specjalisty nauczyłem(-am) konie trzech dowolnych sztuczek.',
                                        'Wskazałem(-am) zalety i wady konkretnych sztuczek, np. leżenie, wyrzut nogi, wyrzut z zadnich nóg.',
                                        'Obserwowałem(-am) przez min. 3h zachowania koni na łące, poznałem(-am) ich naturalne reakcje. Zauważyłem(-am), jak naturalne zachowania łączą się w wyuczone sztuczki.',
                                        'Wymieniłem(-am) min. 3 autorytety, które pracują z końmi na zasadzie sztuczek.',
                                  ]),
                              SprawData(
                                  id: 'zaklinacz_koni',
                                  title: 'Zaklinacz Koni',
                                  level: '3',
                                  comment:'Uczy konie sztuczek i tworzy pokazy. Bierze udział w sesjach zdjęciowych końskich sztuczek. Przekazuje wiedzę, jak wykonać z koniem sztuczki.',
                                  tasks: [
                                        'Pod okiem specjalisty przygotowałem(-am) konia (nauczyłem(-am) sztuczek) do swojego przedstawienia.',
                                        'Zaprezentowałem(-am) swój autorski program końskich sztuczek.',
                                        'Nauczyłem(-am) min. 2 osoby, jak poprawnie i bezpiecznie wykonać z koniem min. 3 sztuczki.',
                                        'Wziąłem(Wzięłam) udział w sesji zdjęciowej, w której były przedstawione końskie sztuczki.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '16',
                        sprawData: [
                              SprawData(
                                  id: 'rozmawiajacy_z_konmi',
                                  title: 'Rozmawiający z Końmi',
                                  level: '1',
                                  comment:'Odczytuje i przekazuje innym, jak należy interpretować mowę końskiego ciała. Podchodzi odpowiednio do konia, zakłada kantar, prowadzi, odwrażliwia na dotyk, uczy ustępować od nacisku, zatrzymuje. Porozumiewa się z koniem za pomocą mowy ciała. Gra w trzy pierwsze gry Parelliego.',
                                  tasks: [
                                        'Prawidłowo odczytywałem(-am) mowę ciała konia (ogólny wygląd, ustawienie zadu, głowy, mowa nóg, mowa ogona). Na podstawie odczytanych sygnałów konia bezpiecznie podchodziłem(-am) do konia. Sygnały mowy końskiej wskazałem(-am) zastępowi.',
                                        'Prawidłowo podszedłem(podeszłam) do konia na wolności, założyłem(-am) kantar, prowadziłem(-am) konia w ręku, odwrażliwiałem(-am) konia na swój dotyk po całym ciele, nauczyłem(-am) konia ustępować od nacisku, zatrzymałem(-am) konia, prowadząc go w ręku.',
                                        'Nauczyłem(-am) się, jak konie odczytują mowę ciała człowieka, podczas pracy z koniem stosowałem(-am) się do tych zasad. Przygotowałem(-am) instrukcję porozumiewania się z koniem za pomocą mowy ciała człowieka.',
                                        'Poznałem(-am) 7 gier Parelliego. Zagrałem(-am) z koniem w grę w zaprzyjaźnianie, w jeża oraz w prowadzenie.',
                                  ]),
                              SprawData(
                                  id: 'rozmawiajacy_z_konmi',
                                  title: 'Rozmawiający z Końmi',
                                  level: '2',
                                  comment:'Gra w gry Parelliego. Odczula konia na różne przedmioty. Pracuje zgodnie z założeniami bezstresowej pracy. Pracuje z koniem z ziemi. Lonżuje prawidłowo konia.',
                                  tasks: [
                                        'Grałem(-am) w 7 gier Parelliego.',
                                        'Dowiedziałem(-am) się, na czym polega odczulanie koni oraz jak je prawidłowo przeprowadzić. Odczuliłem(-am) konia na min. jedną rzecz.',
                                        'Przygotowałem(-am) i przeszedłem(przeszłam) z koniem zgodnie z założeniami bezstresowej pracy: przechodzenie przez drągi ułożone w "L" w przód i tył, wejście na plandekę, skoki w ręku oraz inne wedle możliwości.',
                                        'W trakcie swojej edukacji jeździeckiej oprócz jazdy konnej regularnie pod okiem specjalisty pracowałem(-am) z koniem z ziemi jako element treningowy.',
                                        'Poznałem(-am) prawidłowe zasady lonżowania konia, pod okiem specjalisty lonżowałem(-am) konia zgodnie z biomechaniką ruchu oraz potrzebami ruchowymi i psychicznymi konia.',
                                  ]),
                              SprawData(
                                  id: 'rozmawiajacy_z_konmi',
                                  title: 'Rozmawiający z Końmi',
                                  level: '3',
                                  comment:'Stosując różne źródła, poszerza swoją wiedzę na temat pracy z ziemi i komunikacji człowiekkoń. Analizując różne osoby i ich sposoby pracy, odnalazł(-a) najbardziej mu odpowiadający nurt naturalnej pracy z koniem. Nawiązuje kontakt z koniem w sposób bezpieczny i przyjazny dla konia i człowieka. Pracuje z użyciem naturalnych pomocy. Przekazuje wiedzę na temat porozumienia i harmonii w pracy z ziemi.',
                                  tasks: [
                                        'Przeczytałem(-am) książkę dotyczącą pracy z koniem z ziemi lub komunikowania się z koniem, zaprezentowałem(-am) „złote myśli” i pomysły na zadania swojemu zastępowi.',
                                        'Wyszukałem(-am) w Internecie lub innych źródłach różne osobistości, które wypracowały swoją metodę pracy z ziemi. Przeanalizowałem(-am) je, a następnie stworzyłem(-am) porównanie sposobów pracy, na sam koniec wybrałem(-am) metodę najbardziej mi odpowiadającą.',
                                        'Nawiązałem(-am) kontakt z koniem, tak aby po puszczeniu konia luzem, podążał za mną. W wersji na wolności wykonałem(-am) z koniem podstawowe ćwiczenia pracy z ziemi.',
                                        'Pracowałem(-am) z koniem z ziemi na ujeżdżalni oraz w terenie, w swojej pracy używałem(-am) naturalnych pomocy, stosowałem(-am) się do zasad bezpiecznej komunikacji z koniem.',
                                        'Przygotowałem(-am) film instruktażowy o tym, jak pracuje się z koniem z ziemi w porozumieniu i harmonii. Przedstawiłem(-am) swój filmik na zbiórce.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '17',
                        sprawData: [
                              SprawData(
                                  id: 'lonzujacy',
                                  title: 'Lonżujący',
                                  level: '1',
                                  comment:'Zna podstawy lonżowania koni, zwraca uwagę na mowę ciała konia oraz ton głosu. Prawidłowo posługuje się pomocami przy lonży.',
                                  tasks: [
                                        'Wymieniłem(-am) podstawowe wyposażenie lonżującego oraz konia, którego lonżujemy. Zabezpieczyłem(-am) strzemiona w siodle na czas lonżowania, dlaczego należy to robić.',
                                        'Obserwując prowadzenie lonży przez specjalistę, zauważałem(-am) i wskazałem(-am) mowę ciała konia (ogólny wygląd, głowa, ustawienie zadu, mowa nóg, mowa ogona) oraz mowę ciała osoby prowadzącej (ustawienie rąk, kroki).',
                                        'Nauczyłem(-am) się prawidłowo trzymać bat oraz prawidłowo trzymałem(-am) i zwijałem(-am) lonże. Poznałem(-am) podstawowe błędy przy posługiwaniu się tymi pomocami.',
                                        'Przeprowadziłem(-am) dyskusję na temat tego, dlaczego ważny jest ton głosu w trakcie prowadzenia lonży oraz jak go dostosować.',
                                  ]),
                              SprawData(
                                  id: 'lonzujacy',
                                  title: 'Lonżujący',
                                  level: '2',
                                  comment:'Wyjaśnia, po co stosuje się lonże. Opowiada o wodzach pomocniczych oraz czasie pracy konia w poszczególnych chodach. Ćwiczy lonżowanie i uatrakcyjnia trening.',
                                  tasks: [
                                        'W dowolny sposób przedstawiłem(-am) zalety i wady poszczególnych wodzy pomocniczych. Nauczyłem(-am) się, kiedy należy ich stosować. Poznałem(-am) kilka sposobów przypinania lonży, zaprezentowałem(-am) je na zbiórce.',
                                        'Wymieniłem(-am) min. 5 celów, dla których lonżujemy konia.  Pod okiem osoby doświadczonej lonżowałem(-am) konia min. dwa razy, stosując zasady prawidłowego lonżowania.',
                                        'Dowiedziałem(-am) się, jaka musi być minimalna średnica koła, po którym porusza się koń oraz minimalny i maksymalny czas pracy konia w danych chodach oraz co ile powinno się zmieniać chody.',
                                        'Przygotowałem(-am) i zaprezentowałem(-am) kilka ćwiczeń dla konia, aby uatrakcyjnić sesję treningową poprzez zaangażowanie psychiczne. Swoje pomysły na ćwiczenia zapisałem(-am) w notatniku.  ',
                                  ]),
                              SprawData(
                                  id: 'lonzujacy',
                                  title: 'Lonżujący',
                                  level: '3',
                                  comment:'Dopasowuje wodze pomocnicze, prawidłowo planuje odpowiedni trening dostosowany do konia oraz prowadzi go. Przekazuje mniej doświadczonym kolegom wiedzę na temat tego, w jaki sposób lonżować konia oraz prowadzić lonże z jeźdźcem na grzbiecie konia.',
                                  tasks: [
                                        'Prawidłowo dopasowałem(-am) wodze pomocnicze: wypinacze, chambon, gogue, wodze Pessoa, nauczyłem(-am) się, na co zwracać uwagę przy dopasowaniu tych pomocy.',
                                        'Zaplanowałem(-am) 3 sesje treningowe dla różnych koni (młody koń, koń wracający po kontuzji nogi, koń w podeszłym wieku), odpowiednio dostosowałem(-am) poziom zajęć i atrakcyjność ćwiczeń dla konia, tak aby poruszał się w harmonii i w spokoju psychicznym.',
                                        'Pod okiem specjalisty lonżowałem(-am) konia na podwójnej lonży, odpowiednio dobierając wyposażenie, a w trakcie sesji zadbałem(-am) o bezpieczeństwo pracy (nauczyłem(-am) się posługiwać bezpiecznie dwoma lonżami).',
                                        'Przygotowałem(-am) i przedstawiłem(-am) pokaz dla zastępu lub drużyny dotyczący tego, jak należy lonżować konia, pokazałem(-am) sposób na rozluźnienie konia, poprawę pracy mięśni brzucha oraz zaangażowania kończyn. Nauczyłem(-am) gości podstaw lonżowania.',
                                        'Prowadziłem(-am) pod okiem specjalisty jazdę dla osoby początkującej na lonży, podczas zajęć panowałem(-am) nad koniem, a także uważałem(-am) na jeźdźca na grzbiecie, tłumaczyłem(-am) jeźdźcowi podstawowe ćwiczenia gimnastyczno-rozluźniające na koniu.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '18',
                        sprawData: [
                              SprawData(
                                  id: 'pomocnik_weterynarza',
                                  title: 'Pomocnik Weterynaża',
                                  level: '1',
                                  comment:'Pokazuje kilka najważniejszych struktur kostnych konia. Opowiada o temperaturze i odrobaczaniu oraz o odpowiedniej diecie dla konia, a także potrafi wymienić podstawowe choroby koni.',
                                  tasks: [
                                        'Poznałem(-am) budowę konia. Wskazałem(-am) na koniu przebieg kręgosłupa, łopatkę, nadgarstek, biodro, kolano, staw skokowy.',
                                        'Zmierzyłem(-am) temperaturę konia pod opieką specjalisty, wskazałem(-am) prawidłowy zakres temperatur.',
                                        'Pomagałem(-am) w odrobaczaniu konia, dowiedziałem(-am) się, czemu należy odrobaczać konie (co jaki czas należy to robić, jakie są sposoby podawania).',
                                        'Wykonałem(-am) wywiad z lekarzem weterynarii na temat układu pokarmowego, diety oraz najczęstszych chorób u koni.',
                                  ]),
                              SprawData(
                                  id: 'pomocnik_weterynarza',
                                  title: 'Pomocnik Weterynaża',
                                  level: '2',
                                  comment:'Prawidłowo posługuje się terminologią anatomiczną. Mierzy temperaturę (kontroluje, czy jest odpowiednia), tętno i liczbę oddechów. Rozpoznaje najczęstsze objawy chorobowe i dopasowuje je do choroby. Kontroluje stan apteczki, uzupełnia ją.',
                                  tasks: [
                                        'Poznałem(-am) budowa ogólną, budowę anatomiczną konia, układ szkieletowy oraz położenie najważniejszych narządów.',
                                        'Prawidłowo zmierzyłem(-am) temperaturę, tętno i liczbę oddechów konia, poznałem(-am) ich prawidłowe wartości.',
                                        'Poznałem(-am) objawy najczęściej występujących chorób u koni (gruda, kolka, ochwat, obtarcie kłębu, zagwożdżenie), nauczyłem(-am) się, jak postępować, kiedy pojawią się określone objawy. Zapoznałem(-am) się z procedurą wzywania pomocy w nagłych wypadkach.',
                                        'Poznałem(-am) skład apteczki, skontrolowałem(-am) jej stan, wszelkie ubytki uzupełniłem(-am). Zastosowałem(-am) wcierki i założyłem(-am) opatrunek na kopyto.',
                                  ]),
                              SprawData(
                                  id: 'pomocnik_weterynarza',
                                  title: 'Pomocnik Weterynaża',
                                  level: '3',
                                  comment:'Opowiada o podstawowej anatomii konia. Udziela pomocy w przypadku problemów zdrowotnych. Przekazuje wiedzę na temat temperatury konia, oddechów, tętna, nawodnienia. Zwraca uwagę na szczepienia oraz ich powód.',
                                  tasks: [
                                        'Poznałem(-am) anatomię konia (szkielet, podstawowe układy pokarmowy, krwionośny, mięśniowy, oddechowy). Zaprezentowałem(-am), gdzie znajdują się poszczególne narządy, wskazując je na koniu (anatomia topograficzna).',
                                        'Poznałem(-am) postępowanie teoretyczne i nauczyłem(-am) się, jak udzielić pierwszej pomocy w przypadku zranienia, ochwatu, kolki, odwodnienia, podbicia i mięśniochwatu. W razie nagłego przypadku swoją wiedzę teoretyczną wykorzystałem(-am) w praktyce.',
                                        'Nauczyłem(-am) mniej doświadczone osoby, jak prawidłowo zmierzyć temperaturę, liczbę oddechów, tętno, nawodnienie oraz stan błon śluzowych.',
                                        'Poznałem(-am) cykl podstawowych szczepień i odrobaczeń, nauczyłem(-am) się, na co się szczepi konie i kiedy należy to zrobić, a także czym różni się odrobaczanie jedno- i wieloskładnikowe. Przeanalizowałem(-am) wykaz szczepień znajdujący się w paszporcie konia, wyznaczyłem(-am), kiedy powinno być następne szczepienie, pomagałem lekarzowi weterynarii podczas zabiegu iniekcji.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '19',
                        sprawData: [
                              SprawData(
                                  id: 'podkuwacz',
                                  title: 'Podkuwacz',
                                  level: '1',
                                  comment:'Zna budowę anatomiczną kopyta, rodzaje podków oraz zasady prawidłowego podkuwania koni. Pomaga podkuwaczowi (kowalowi). Trzyma prawidłowo nogi konia. Pielęgnuje kopyta w odpowiedni sposób.',
                                  tasks: [
                                        'Poznałem(-am) budowę anatomiczną końskiego kopyta.',
                                        'Poznałem(-am) rodzaje podków i ich przeznaczenie oraz zasady prawidłowego podkuwania koni.',
                                        'Pomagałem(-am) podczas rozczyszczania kopyta konia, wykonując polecenia podkuwacza (kowala). Prawidłowo trzymałem(-am) nogi konia.',
                                        'Pielęgnowałem(-am) kopyta w podstawowym zakresie.',
                                  ]),
                              SprawData(
                                  id: 'podkuwacz',
                                  title: 'Podkuwacz',
                                  level: '2',
                                  comment:'Rozpoznaje wady budowy kopyt. Prawidłowo pielęgnuje kopyta, odpowiednio reaguje przy problemach z nimi związanymi. Pomaga przy podkuwaniu. Przekazuje wiedzę dotyczącą podnoszenia kończyn i codziennej pielęgnacji innym osobom.',
                                  tasks: [
                                        'Rozpoznałem(-am) wady budowy kopyt.',
                                        'Poznałem(-am) zasady pielęgnacji kopyt (postępowania w przypadku gnicia strzałki, obluzowania podków, codziennej pielęgnacji) i stosowałem(-am) je w praktyce.',
                                        'Uczestniczyłem(-am) w podkuwaniu koni, zdejmując stare podkowy, prawidłowo rozczyszczając kopyto (w obecności specjalisty).',
                                        'Nauczyłem(-am) mniej doświadczonych harcerzy zasad bezpiecznego podnoszenia kończyn i codziennej pielęgnacji kopyt.',
                                        'Poznałem(-am) terminarz rozczyszczania i kucia koni.',
                                  ]),
                              SprawData(
                                  id: 'podkuwacz',
                                  title: 'Podkuwacz',
                                  level: '3',
                                  comment:'Wie, jakie są naturalne sposoby strugania koni. Prawidłowo postępuje w przypadku zagwożdżenia. Przekazuje wiedzę dotyczącą podkuwania i pielęgnacji kopyt. Dobiera podkowy w stosunku do wady budowy kopyta.',
                                  tasks: [
                                        'Poznałem(-am) i zastosowałem(-am) w praktyce naturalne sposoby strugania koni w obecności specjalisty.',
                                        'Postąpiłem(-am) prawidłowo w przypadku zagwożdżenia.',
                                        'Nauczyłem(-am) mniej doświadczonych kolegów zasad trzymania nóg do podkuwania i pielęgnacji kopyt.',
                                        'Poznałem(-am) różne podkowy, dobrałem(-am) i oceniłem(-am) je w stosunku do wady.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '20',
                        sprawData: [
                              SprawData(
                                  id: 'zoofizjoterapeuta_koni',
                                  title: 'Zoofizjoterapeuta Koni',
                                  level: '2',
                                  comment:'Wyjaśnia, czym jest zoofizjoterapia. Wskazuje na koniu podstawowe struktury kostne i mięśniowe. Przekazuje wiedzę dotyczącą masażu koni. Regularnie rozciąga swoje ciało poprzez stretching.',
                                  tasks: [
                                        'Wyjaśniłem(-am), czym jest zoofizjoterapia, a także co wchodzi w jej skład, podałem(-am) kilka przykładów działań zoofizjoterapeuty.',
                                        'Wskazałem(-am) na żywym koniu i nazwałem(-am) takie struktury jak: czaszka, przebieg kręgosłupa, klatka piersiowa, łopatka, guz krzyżowy, guz biodrowy, guz kulszowy, mięsień najdłuższy grzbietu, mięsień czworoboczny.',
                                        'Opowiedziałem(-am) zastępowi, po co masuje się konie, kiedy można, a kiedy nie można masować, pokazałem(-am) zastępowi podstawowe chwyty do masaży: głaskanie, uciskanie, ugniatanie, oklepywanie, rozcieranie.',
                                        'Dowiedziałem(-am) się, dlaczego ruch fizyczny jest ważny zarówno u ludzi, jak i zwierząt.',
                                        'Codziennie ćwiczyłem(-am) stretching, aby utrzymać zdrowie w pojęciu fizjoterapeutycznym.',
                                  ]),
                              SprawData(
                                  id: 'zoofizjoterapeuta_koni',
                                  title: 'Zoofizjoterapeuta Koni',
                                  level: '3',
                                  comment:'Znajduje zalety i wady masażu. Wykonuje masaż „wzdłuż kręgosłupa”. Wskazuje na koniu poszczególne struktury anatomiczne. Opisuje, czym jest więzadło karkowe i jaką pełni funkcje u koni. Unika własnych kontuzji i rozpoznaje reakcje na ból.',
                                  tasks: [
                                        'Zaprezentowałem(-am) w ciekawej formie zalety i wady: masażu, laseroterapii, magnetoterapii, leczenie ruchem, stretching.',
                                        'Wykonałem(-am) na koniu masaż „wzdłuż kręgosłupa", nauczyłem(-am) się, kiedy powinien być stosowany.',
                                        'Wskazałem(-am) na koniu poszczególne struktury anatomiczne i je scharakteryzowałem(-am): odcinki kręgosłupa w tym atlas, kończyna piersiowa i miednicza (poszczególne kości i stawy), m. płatowaty, m. ramienno-głowowy, m. trójkątny ramienia, mm. pośladkowe, m. czworogłowy uda.',
                                        'Opisałem(-am), czym jest więzadło karkowe, gdzie leży oraz jakie ma znaczenie w funkcjonowaniu koni.',
                                        'Nauczyłem(-am) się, jak wygląda reakcja na ból oraz jak unikać własnych kontuzji podczas masażu. Oceniałem(-am), czy mięsień jest spięty czy rozluźniony.',
                                  ]),
                              SprawData(
                                  id: 'zoofizjoterapeuta_koni',
                                  title: 'Zoofizjoterapeuta Koni',
                                  level: '4',
                                  comment:'Pomaga podczas zabiegów zoofizjoterapeutycznych. Wskazuje ważne struktury kości i ważniejsze mięśnie. Ocenia prawidłowość kopyt. Przekazuje wiedzę na temat zoofizjoterapii pod kątem bezpieczeństwa ludzi i koni. Pokazuje ćwiczenia stretchingowe wykonywane na koniach.',
                                  tasks: [
                                        'Asystowałem(-am) podczas zabiegów zoofizjoterapeutycznych koni, aktywnie pomagałem(-am) specjaliście.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '21',
                        sprawData: [
                              SprawData(
                                  id: 'saddle_fitter',
                                  title: 'Saddle Fitter',
                                  level: '1',
                                  comment:'Opisuje budowę siodła oraz ogłowia, prawidłowo zakłada je na konia. Konserwuje sprzęt skórzany. Sprawdza, czy grzbiet konia jest w dobrym stanie (takim, że można założyć siodło), rozpoznaje symptomy źle dopasowanego siodła, które widoczne są na grzbiecie.',
                                  tasks: [
                                        'Poznałem(-am) podstawową budowę siodła, poznałem(-am) pojęcie terlica oraz wymieniłem(-am) i opisałem(-am) typy siodeł. Poznałem(-am) podstawową budowę ogłowia, rozróżniłem(-am) i opisałem(-am) nachrapniki.',
                                        'Wziąłem(Wzięłam) udział w czyszczeniu i konserwacji sprzętu skórzanego (siodło, ogłowie).',
                                        'Prawidłowo założyłem(-am) siodło i ogłowie na trzech koniach o różnej budowie, jeśli koń w swoim sprzęcie posiadał dodatkowe elementy: wytok, podogonie, podkładki, również założyłem(-am) je prawidłowo.',
                                        'W trakcie siodłania i po jeździe kontrolowałem(-am) grzbiet konia. Rozpoznałem(-am) podstawowe problemy związane ze źle dopasowanym siodłem (otarcia, białe włosy, opuchlizny, zanik mięśni, blizny lub zgrubienia).',
                                  ]),
                              SprawData(
                                  id: 'saddle_fitter',
                                  title: 'Saddle Fitter',
                                  level: '2',
                                  comment:'Wyznacza granice, w których powinno leżeć siodło. Przekazuje wiedzę, dlaczego należy sprawdzać siodło, czym jest terlica oraz jakie mamy rodzaje wędzideł. Składa i dopasowuje ogłowie po konserwacji.',
                                  tasks: [
                                        'Wyznaczyłem(-am) na koniu granice, w których powinno leżeć siodło, tak aby nie wchodziło na łopatki oraz nie wychodziło poza odcinek piersiowy konia.',
                                        'Wytłumaczyłem(-am) zastępowi, czym jest terlica, jak jest zbudowana oraz jakie ma wady i zalety.',
                                        'Poznałem(-am) rodzaje wędzideł i krótko je scharakteryzowałem(-am) zastępowi. Oceniłem(-am), czy wędzidło jest odpowiednio długie.',
                                        'Złożyłem(-am) ogłowie po konserwacji oraz poprawnie dopasowałem(-am) na nowo do konia.',
                                        'Przedstawiłem(-am) w dowolnej formie, dlaczego należy regularnie sprawdzać jakość siodła oraz jego dopasowanie do konia.',
                                  ]),
                              SprawData(
                                  id: 'saddle_fitter',
                                  title: 'Saddle Fitter',
                                  level: '3',
                                  comment:'Pokazuje, na jakich mięśniach leży siodło. Wykonuje podstawową ocenę siodła. Przekazuje wiedzę na temat tego, jak siodłać i kiełznać konia. Dyskutuje na temat wad i zalet różnych wodzy pomocniczych.',
                                  tasks: [
                                        'Wymieniłem(-am) i pokazałem(-am) na koniu, na jakich mięśniach leży siodło.',
                                        'Wykonałem(-am) podstawową ocenę siodła: test terlicy, symetria siodła, stan paneli (np. jakość wypełnienia), szerokość kanału. Dowiedziałem(-am) się, dlaczego szerokość kanału min. 6 cm jest ważna dla grzbietu konia.',
                                        'Wykonałem(-am) podstawową ocenę siodła leżącego na grzbiecie konia: czy leży w odpowiednich granicach anatomicznych konia (nie jest za długie), ochrona kłębu, ochrona kręgosłupa, przyleganie paneli - czy terlica jest odpowiedniej szerokości.',
                                        'Pokazałem(-am) mniej doświadczonym kolegom, jak poprawnie siodłać i kiełznać konia.',
                                        'Poznałem(-am) rodzaje wodzy pomocniczej. W zastępie lub drużynie przeprowadziłem(-am) dyskusję na temat tego, czy są one potrzebne, do czego i dla kogo.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '22',
                        sprawData: [
                              SprawData(
                                  id: 'wychowawca_zrebiat',
                                  title: 'Wychowawca Źrebiąt',
                                  level: '2',
                                  comment:'Zna etapy życia konia. Prezentuje, jakie są różnice między końmi w pierwszych okresach życia oraz czego powinien się nauczyć źrebak w pierwszych miesiącach życia. Czyści źrebaka.',
                                  tasks: [
                                        'Wskazałem(-am) i scharakteryzowałem(-am) etapy życia konia.',
                                        'Rozróżniłem(-am) na pastwisku czy źrebak jest noworodkiem, odsadkiem i roczniakiem. Przedstawiłem(-am) w dowolnej formie podobieństwa i różnice pomiędzy nimi, zwracając uwagę na budowę ciała oraz charakterystyczne zachowania.',
                                        'Przy pomocy osoby doświadczonej czyściłem(-am) źrebaka zgrzebłem plastikowym i szczotką z miękkim włosiem.',
                                        'Uczestniczyłem(-am) w sesji treningowej źrebiąt jako pomocnik. Następnie wykonałem(-am) mapę myśli dotyczącą wczesnego szkolenia źrebiąt, czyli dotyczącą tego, czego źrebak powinien się nauczyć w pierwszych miesiącach życia.',
                                  ]),
                              SprawData(
                                  id: 'wychowawca_zrebiat',
                                  title: 'Wychowawca Źrebiąt',
                                  level: '3',
                                  comment:'Przekazuje wiedzę na temat imprintingu. Bierze udział w sesji treningowej źrebaka. Wskazuje, do ilu godzin po porodzie należy wykonać pierwszą sesję. Trzyma źrebaka w pozycji bezpiecznej.',
                                  tasks: [
                                        'Przedstawiłem(-am) zastępowi, co to jest imprinting zwierząt, kto opisał tę metodę dla koni oraz jakie są jej główne cele.',
                                        'Wziąłem(Wzięłam) udział w sesji treningowej źrebaka, gdzie przy specjaliście uczyłem(-am) konia podawania nóg, chodzenia na uwiązie lub odczulania na jakiś „straszny” bodziec.',
                                        'Wskazałem(-am), do ilu godzin po porodzie należy wykonać pierwszą sesję imprintingu.',
                                        'Zaprezentowałem(-am) i nauczyłem(-am) mniej doświadczone osoby, jak należy trzymać źrebaka w pozycji bezpiecznej (na sztucznym lub pluszowym koniu).',
                                  ]),
                              SprawData(
                                  id: 'wychowawca_zrebiat',
                                  title: 'Wychowawca Źrebiąt',
                                  level: '4',
                                  comment:'Nazywa zabawy źrebiąt. Poznaje zasady planowania sesji treningowych oraz zalety i wady wczesnego szkolenia źrebiąt. Prezentuje zasady postępowania przy źrebiętach.',
                                  tasks: [
                                        'Obserwując zabawy źrebiąt na pastwisku, wskazałem(-am) i nazwałem(-am) zabawy źrebiąt np. przyszczypywanie, skakanie, podskoki, wspinanie się itd.',
                                        'Poznałem(-am) zasady planowania sesji imprintingowych, dowiedziałem(-am) się, co w której sesji można wprowadzić, oraz ile powinna trwać taka sesja. Pod opieką specjalisty zaplanowałem(-am) jedną sesję treningową.',
                                        'Przedstawiłem(-am) w dowolnej formie zalety i wady wczesnego szkolenia źrebiąt.',
                                        'Pod opieką specjalisty zaprezentowałem(-am) zastępowi zasady bezpiecznego podstępowania przy źrebakach, pokazałem(-am), jak prawidłowo przyuczać do zakładania kantara, jak odczulać na dotyk człowieka, jak prowadzić na uwiązie oraz jak odczulić źrebię na różne przedmioty, np. folia, parasolka.',
                                  ]),
                        ]
                    ),
                    SprawFamilyData(
                        id: '23',
                        sprawData: [
                              SprawData(
                                  id: 'hipoterapeuta',
                                  title: 'Hipoterapeuta',
                                  level: '2',
                                  comment:'Tłumaczy harcerzom, czym jest hipoterapia. Pomaga w przygotowaniu konia. Opisuje konia oraz hipoterapeutę. Prezentuje ćwiczenia hipoterapeutyczne.',
                                  tasks: [
                                        'Nauczyłem(-am) się, czym jest hipoterapia. Wytłumaczyłem(-am) zastępowi, na czym polega.',
                                        'Pomogłem(-am) przygotować konia do hipoterapii pod okiem specjalisty.',
                                        'Opisałem(-am), jakimi cechami powinien charakteryzować się odpowiedni koń do hipoterapii oraz jaki powinien być hipoterapeuta.',
                                        'Zaprezentowałem(-am) w stępie podstawowe ćwiczenia wykonywanie w hipoterapii.',
                                  ]),
                              SprawData(
                                  id: 'hipoterapeuta',
                                  title: 'Hipoterapeuta',
                                  level: '3',
                                  comment:'Przedstawia wiedzę na temat hipoterapii i jej rodzaje. Prowadzi konia, wymyśla ćwiczenia. Dba o dopasowanie sprzętu przed hipoterapią. Zna wskazania i przeciwwskazania do tej terapii.',
                                  tasks: [
                                        'Poznałem(-am) rodzaje hipoterapii, w dowolny sposób swoją wiedzę na ten temat przedstawiłem(-am) zastępowi.',
                                        'Wymieniłem(-am) min. po 5 wskazań i przeciwwskazań do hipoterapii.',
                                        'Pomagałem(-am) w hipoterapii, jako osoba prowadząca konia.',
                                        'Wymyśliłem(-am) po dwa ćwiczenia odpowiednie dla dziecka MPD, z zespołem Downa oraz upośledzeniem umysłowym. Swoje propozycje pokazałem(-am) specjaliście.',
                                        'Nauczyłem(-am) się, jaki sprzęt jest wymagany w hipoterapii dla konia i pacjenta, odpowiednio zadbałem(-am) przed terapią o prawidłowe dopasowanie sprzętu.',
                                  ]),
                              SprawData(
                                  id: 'hipoterapeuta',
                                  title: 'Hipoterapeuta',
                                  level: '4',
                                  comment:'Zna kanony pracy hipoterapeuty. Dobiera konia do pacjenta oraz układa wstępny plan zajęć. Orientuje się w podstawowych jednostkach chorobowych oraz jak oddziaływaniu konia na pacjenta. Ocenia postawę jeźdźca.',
                                  tasks: [
                                        'Poznałem(-am) kanony pracy hipoterapeuty i przedstawiłem(-am) je zainteresowanym kolegom z drużyny.',
                                        'Pod okiem specjalisty dobrałem(-am) konia do pacjenta, a także wybrałem(-am) miejsce, czas zajęć oraz plan zmiany kierunków.',
                                        'Wymieniłem(-am) wskazania, przeciwwskazania względne i bezwzględne. Wytłumaczyłem(-am) powyższe pojęcia. Zaklasyfikowałem(-am), czy dana jednostka chorobowa jest wskazaniem, przeciwskazaniem względnym czy bezwzględnym.',
                                        'Poznałem(-am) objawy i charakterystykę podstawowych jednostek chorobowych: MPD, Zespół Downa, upośledzenie umysłowe oraz autyzm. Pod okiem specjalisty brałem(-am) udział w przeprowadzeniu wywiadu hipoterapeutycznego z nowym pacjentem.',
                                        'Poznałem(-am), w jaki sposób oddziałuje koń na jeźdźca. Oceniałem(-am) postawę jeźdźca: przodopochylenie, tyłopochylenie i prawidłowe ustawienie miednicy.',
                                  ]),
                        ]
                    ),

              ])

    ]
).build();
