import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';

//   -> zmienić na spację
// /am -> (-am)
// /łam -> (-am)

SprawBook sprawBookZHPHarcSim2022 = SprawBookData(
    id: SprawBookData.ZHP_HARC_SIM_2022_ID,
    title: 'Sprawności harcerskie ZHP',
    source: '',
    color: SprawBookData.SPRAW_BOOK_ZHP_HARC_SIM_2022_COLOR,
    icon: SprawBookData.SPRAW_BOOK_ZHP_HARC_SIM_2022_ICON,
    male: true,
    female: true,
    groupData: [

      SprawGroupData(
          id: 'spraw_wyrobienie_harcerskie',
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
                        'Wziąłem(-łam) udział w obozie lub biwaku pod namiotami. Poznałem(-am) zasady bezpieczeństwa i przestrzegałem(-am) ich. Pozostawiłem(-am) po sobie porządek.',
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
                        'Wziąłem(-am) udział w budowie jednego z urządzeń obozowych wspólnego użytku (np. latryny, bramy, stanowiska na sprzęt ppoż.).',
                        'Pełniłem(-am) służbę wartowniczą na obozie lub biwaku.',
                      ]),
                  SprawData(
                      id: 'wyga',
                      title: 'Wyga',
                      level: '3',
                      comment: 'Potrafi zapewniać sobie w terenie komfortowy i bezpieczny sposób bytowania (spanie, jedzenie, przechowywanie rzeczy, załatwianie potrzeb fizjologicznych, mycie). Potrafi zorganizować bytowanie grupy w terenie (służby kuchenne, zapewnienie bezpieczeństwa). Kieruje budową podstawowych urządzeń obozowych.',
                      tasks: [
                        'Wziąłem(-am) udział w kilkudniowym rajdzie/wyprawie z nocowaniem na łonie przyrody, podczas którego minimalizowałem(-am) swój wpływ na środowisko (odpowiednio gospodarując wodą i odpadami, przygotowując nocleg, zabezpieczając ognisko).',
                        'Wykonałem(-am) co najmniej jedno z poniższych zadań:'
                            '\n\n– Kierowałem(-am) służbą kuchenną/zastępem służbowym.'
                            '\n\n– Przygotowałem(-am) młodszych harcerzy do pełnienia wart i dowodziłem(-am) zastępem wartowniczym.',
                        'Potrafię używać i dbam o sprzęt drużyny/szczepu. Brałem(-am) udział w jego konserwacji.',
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
                        'Wziąłem(-am) udział w przygotowaniu obozu, np. tworzeniu preliminarza, przygotowaniu sprzętu, organizacji transportu, zaplanowaniu zakupów żywieniowych. Poznałem(-am) zasady prowadzenia gospodarczej dokumentacji obozu i pod nadzorem kwatermistrza pomogłem(-am) ją prowadzić.',
                        'Wziąłem(-am) udział w minimum dwudniowej wyprawie w nowej dla mnie formie turystyki (np. obozie wędrownym, rowerowym, rejsie, spływie itp.).'
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
          id: 'spraw_zdrowie',
          title: 'Zdrowie',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'ratownik',
                      title: 'Ratownik/Ratowniczka',
                      level: '1',
                      comment: 'Podczas rzeczywistego wydarzenia lub symulacji wykazuje się umiejętnościami udzielania pierwszej pomocy w sytuacjach, które mogą przydarzyć się w domu. Zna numery alarmowe, wie, kiedy i w jaki sposób z nich korzystać.',
                      tasks: [
                        'Udzieliłem(-am) pomocy w następujących sytuacjach:'
                            '\n\n– Opatrzyłem(-am) ranę, zabezpieczyłem(-am) oparzenie.'
                            '\n\n– Zareagowałem(-am) właściwie w sytuacji omdlenia.'
                            '\n\n– Zadbałem(-am) o bezpieczeństwo osoby nieprzytomnej (oceniłem(-am) przytomność, udrożniłem(-am) drogi oddechowe i sprawdziłem(-am) oddech u poszkodowanego nieprzytomnego).',
                        'Znam numery alarmowe, skorzystałem(-am) z nich w sytuacji rzeczywistej lub symulowanej podając dyspozytorowi niezbędne informacje.',
                        'Unieruchomiłem(-am) rękę w przypadku urazu.',
                        'Oceniłem(-am) czy mogę bezpiecznie udzielić pierwszej pomocy poszkodowanemu. Bezpiecznie zdjąłem(zdjęłam) rękawiczki.'
                      ]),
                  SprawData(
                      id: 'ratownik',
                      title: 'Ratownik/Ratowniczka',
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
                      title: 'Ratownik/Ratowniczka',
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
                      title: 'Lider Zdrowia/Liderka Zdrowia',
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
                      title: 'Lider Zdrowia/Liderka Zdrowia',
                      level: '2',
                      comment: 'Przestrzega zaleceń zdrowego odżywiania się. Bierze udział w całodziennych formach aktywnego wypoczynku na łonie natury. Regularnie ćwiczy wybraną dziedzinę sprawności fizycznej, poprawiając swoje wyniki. Bierze udział w różnych formach zespołowej aktywności fizycznej.',
                      tasks: [
                        'Wraz z rodzicami ułożyłem(-am) dla siebie tygodniowy jadłospis zgodnie z zasadami zbilansowanej diety. Pilnowałem(-am) jego przestrzegania (np. nie dojadając między posiłkami).',
                        'Wziąłem(wzięłam) udział w całodziennej wycieczce pieszej/rowerowej/kajakowej. Dowiedziałem(-am) się jak i przygotowałem(-am) na niej obiad niewymagający gotowania.',
                        'Przez okres próby ćwiczyłem(-am) wybrany sport lub dziedzinę sprawności fizycznej (np. szybkość, skoczność, celność, utrzymywanie równowagi). Wziąłem(wzięłam) udział w zawodach sportowych w konkurencji wymagającej posługiwania się ćwiczoną sprawnością (np. wyścigi, skok w dal, rzucanie do celu, wyścig z jajkiem) i zająłem(zajęłam) czołowe miejsce lub znacząco poprawiłem(-am) swój wynik z początku próby.',
                        'Wziąłem(wzięłam) udział w meczu rekreacyjnym trzech różnych sportów drużynowych (np. piłki nożnej, piłki siatkowej, piłki ręcznej, dwóch ogni, hokeja na trawie).',
                        'Znam i stosuję (wprowadzam w swoje życie) zasady zdrowego odżywiania się/zdrowe nawyki żywieniowe. Przez okres min. 2 miesięcy dbałem(-am) o prawidłowe nawodnienie organizmu, pijąc min. 2 litry wody dziennie, i unikałem(-am) słodkich przekąsek.'
                      ]),
                  SprawData(
                      id: 'lider_zdrowia',
                      title: 'Lider Zdrowia/Liderka Zdrowia',
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
                      title: 'Lider Zdrowia/Liderka Zdrowia',
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
                        'Własnoręcznie przygotowałem(-am) niespodziankę dla dziecka (własnoręcznie wykonana zabawka, uszyte/przerobione ubranko, ulubiony podwieczorek).',
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
                      title: 'Epidemiolog/Epidemiolożka',
                      level: '1',
                      comment: 'Umie w czasie epidemii zadbać o siebie.',
                      tasks: [
                        'Wiem, jak się zachowywać w czasie epidemii. Ograniczyłem(-am) do minimum wyjścia z domu i bezpośrednie kontakty z innymi osobami. Zachowałem(-am) kontakt telefoniczny/internetowy z moimi bliskimi, z którymi nie mieszkam (np. dziadkami).',
                        'Myłem(-am) ręce kilka/kilkanaście razy dziennie przez 30 sekund. Obowiązkowo myłem(-am) ręce po powrocie do domu i po kontakcie z innymi osobami.',
                        'Codziennie uczyłem(-am) się, niezależnie od tego, czy otrzymywałem(-am) materiały do nauki (jeżeli nie otrzymałem(-am) materiałów ze szkoły, czytałem(-am) lektury i powtarzałem(-am) sobie wcześniej zrealizowany materiał).',
                        'Wziąłem(-am) udział w zdalnej zbiórce zastępu.'
                      ]),
                  SprawData(
                      id: 'epidemiolog',
                      title: 'Epidemiolog/Epidemiolożka',
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
                      title: 'Epidemiolog/Epidemiolożka',
                      level: '3',
                      comment: 'Pełni służbę informacyjną w czasie epidemii.',
                      tasks: [
                        'Dowiedziałem(-am) się, czym różni się bakteria od wirusa, dlatego wiem, na czym polegają działania prewencyjne. Zastosowałem(-am) się do zaleceń służb sanitarnych.',
                        'Unikałem(-am) fake newsów - wiedzę czerpałem(-am) z oficjalnych portali. Przekazywałem(-am) sprawdzone informacje do swoich znajomych m. in. za pomocą mediów społecznościowych.',
                        'Pomogłem(-am) rodzeństwu lub kolegom/młodszym harcerzom (najlepiej w trybie internetowym) w nauce wybranego przedmiotu.',
                        'Opracowałem(-am) samodzielnie lub z inną osobą zbiórkę dla zastępu i przeprowadziłem(-am) ją z wykorzystaniem łączy internetowych.'
                      ]),
                  SprawData(
                      id: 'epidemiolog',
                      title: 'Epidemiolog/Epidemiolożka',
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
                      title: 'Bezpieczny/Bezpieczna',
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
                      title: 'Bezpieczny/Bezpieczna',
                      level: '2',
                      comment: 'Dba o swoje bezpieczeństwo w domu, w szkole, na drodze, w lesie i w podróży.',
                      tasks: [
                        'Nauczyłem(-am) się zabezpieczać dom przed złodziejami i zdarzeniami losowymi. Sporządziłem(-am) listę kontrolną czynności, które należy wykonać przed wyjściem z domu/mieszkania (zamknięcie okien i balkonu, wyłączenie kuchenki gazowej, wyłączenie urządzeń elektrycznych, sprawdzenie kranów z wodą itp.). Regularnie ją stosowałem(-am) przed każdym wyjściem z domu.',
                        'Wykonałem co najmniej jedno z poniższych zadań:'
                            '\n\n- poruszając się po drodze poza miastem, zastosowałem(-am) komplet odblasków zapewniający widoczność mojej sylwetki ze wszystkich stron;'
                            '\n\n- poruszając się rowerem po drodze, zastosowałem(-am) kamizelkę odblaskową i kask rowerowy.',
                        'Poznałem(-am) zasady bezpieczeństwa na obozie. Wziąłem(-am) udział w rożnego rodzaju alarmach (np. przeciwpożarowym, ewakuacyjnym), sprawnie wykonując polecenia opiekunów.',
                        'Opracowałem(-am) trasę dotarcia do wyznaczonego punktu, wykorzystując m.in. komunikację publiczną (np. miejską). Sprawdziłem(-am) rozkład jazdy, wybrałem(-am) odpowiednie połączenie i zakupiłem(-am) bilet MPK/PKS/PKP. Zapoznałem(-am) się z podstawowymi zasadami korzystania z komunikacji publicznej (np. kiedy i jak odbijamy bilety, które miejsca w autobusach i tramwajach są przeznaczone dla mnie, dla starszych i chorych, jak używamy rączek i uchwytów podczas podróży na stojąco, do czego służą dzwonki alarmowe i gdzie się znajdują).'
                      ]),
                  SprawData(
                      id: 'bezpieczny',
                      title: 'Bezpieczny/Bezpieczna',
                      level: '3',
                      comment: 'Dba o swoje bezpieczeństwo w domu, w szkole, na drodze, w lesie i w podróży.',
                      tasks: [
                        'Sprawdziłem(-am) w mieszkaniu/domu, gdzie znajdują się zawory: gazu, wody i wyłącznik prądu. Nauczyłem(-am) się je obsługiwać. Dowiedziałem(-am) się, kiedy i w jakich okolicznościach należy je zamknąć.',
                        'Poznałem(-am) zasady bezpiecznego poruszania się w miejscach publicznych pieszo, na rowerze, rolkach, hulajnodze itp. (zgodnie z tym, z czego korzystam). Zastosowałem(-am) się do tych zasad w czasie mojego codziennego korzystania z chodnika, jezdni, ścieżki rowerowej.',
                        'Na obozie pomagałem(-am) w przeprowadzeniu dla młodszych instruktażu dotyczącego bezpieczeństwa (np. zapoznając z zasadami posługiwania się ogniem, wartowania, ewakuowania się z obozu). Pomagałem(-am) w przeprowadzeniu alarmów np. przeciwpożarowego, ewakuacyjnego.',
                        'Dowiedziałem(-am) się, jak rozpoznać kleszcza. Zapoznałem(-am) się z poprawnymi technikami wyciągania kleszczy i prawidłowo usuwałem(-am) te pasożyty. Zaopatrzyłem(-am) się w narzędzia umożliwiające usuwanie kleszczy: pęseta, pętla, kleszczołapki itp.',
                        'Wybrałem(-am) się na samodzielną wycieczkę do innego miasta/innej części regionu mojego zamieszkania. Przed wyjazdem skompletowałem(-am) i zabezpieczyłem(-am) przed zgubieniem i kradzieżą dokumenty oraz pieniądze. Sprawdziłem(-am) prognozy pogody i przygotowałem(-am) odpowiedni ubiór na wyjazd. Skorzystałem(-am) z komunikacji publicznej, zakupiłem(-am) odpowiedni bilet (zniżka) na przejazd pociągiem lub autobusem. Podczas przejazdu dostosowałem(-am) się do zasad bezpieczeństwa obowiązujących wszystkich podróżnych.'
                      ]),
                  SprawData(
                      id: 'bezpieczny',
                      title: 'Bezpieczny/Bezpieczna',
                      level: '4',
                      comment: 'Dba o swoje bezpieczeństwo w domu, w szkole, na drodze, w lesie i w podróży. Doświadczeniami dzieli się z młodszymi.',
                      tasks: [
                        'Dowiedziałem(-am) się, na czym polega w domu zagrożenie tlenkiem węgla i pożarem. Wykonałem(-am) co najmniej jedno zadanie:'
                            '\n\n- zainstalowałem(-am) w domu czujnik CO,'
                            '\n\n- zaopatrzyłem(-am) dom w podręczną gaśnicę dostosowaną do gaszenia drobnych pożarów, które najczęściej występują w mieszkaniach, a których nie należy gasić wodą.',
                        'Zapoznałem(-am) młodszych z regulaminem/zasadami poruszania się po drogach. Uwzględniłem(-am) przy tym zagrożenia wynikające z analizy potencjalnych niebezpieczeństw w mojej okolicy jak np. niebezpieczne przejścia przez jezdnię, ulice bez chodników, miejsca na drogach ze słabą widocznością dla kierowcy (zakręty, wzniesienia). Przeprowadziłem(-am) bezpiecznie grupę (np. zastęp, drużynę) po różnych rodzajach dróg/ulic na dystansie kilku kilometrów.',
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
          id: 'spraw_przyrodnicze',
          title: 'Przyrodnicze',
          familyData: [

            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'ekolog',
                      title: 'Ekolog/Ekolożka',
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
                      title: 'Ekolog/Ekolożka',
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
                      title: 'Ekolog/Ekolożka',
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
                      title: 'Ekolog/Ekolożka',
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
                      title: 'Przyrodnik/Przyrodniczka',
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
                      title: 'Przyrodnik/Przyrodniczka',
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
                      title: 'Przyrodnik/Przyrodniczka',
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
                      title: 'Przyrodnik/Przyrodniczka',
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
                      title: 'Przyjaciel/Przyjaciółka roślin',
                      level: '1',
                      comment:'Rozpoznaje podstawowe rośliny uprawiane w polskich domach i ogródkach czy rosnące w lasach i na łąkach. Sadzi i opiekuje się roślinami.',
                      tasks: [
                        'Wyhodowałem(-am) z nasion, pestek lub cebulek wybraną przez siebie roślinę, opiekowałem(-am) się nią i udokumentowałem(-am) np. na zdjęciach etapy jej wzrastania i przedstawiłem(-am) je na zbiórce.',
                        'Odwiedziłem(-am) ogród botaniczny (lub byłem(-am) na łące, w lesie, w polu itp.) i opowiedziałem(-am) na zbiórce o swoich obserwacjach dotyczących występującej tam roślinności.',
                        'Opiekowałem(-am) się roślinami w domu, w harcówce, w szkolnej pracowni lub na działce przez cały okres próby na sprawność.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_roslin',
                      title: 'Przyjaciel/Przyjaciółka roślin',
                      level: '2',
                      comment: 'Zna rośliny chronione, w tym też takie, które wymagają w naszym kraju specjalnej troski.',
                      tasks: [
                        'Odnalazłem(-am) i odwiedziłem(-am) w swojej okolicy co najmniej dwa drzewa/grupy drzew – pomniki przyrody.',
                        'Opowiedziałem(-am) w drużynie o interesujących roślinach występujących w rezerwacie przyrody w mojej okolicy.',
                        'Przygotowałem(-am) w ciekawej formie informację o wybranych 15 roślinach chronionych występujących w Polsce i przedstawiłem(-am) ją na zbiórce zastępu, drużyny lub w klasie. Celem mojej prezentacji było zapobieżenie niszczeniu roślin chronionych wynikającemu z niewiedzy, dlatego co najmniej połowa prezentowanych roślin to takie, na które możemy natrafić w swoim otoczeniu.',
                      ]),
                  SprawData(
                      id: 'przyjaciel_roslin',
                      title: 'Przyjaciel/Przyjaciółka roślin',
                      comment: 'Działa na rzecz ochrony roślin.',
                      level: '3',
                      tasks: [
                        'Przedstawiłem(-am) na zbiórce drużyny w ciekawy sposób wybrane gatunki roślin występujących na świecie, zagrożonych wyginięciem („czerwona księga”).',
                        'Poprowadziłem(-am) wycieczkę zastępu/drużyny w celu poznania środowiska roślinnego najbliższej okolicy. Ciekawie opowiedziałem(-am) o co najmniej 8 roślinach, które napotkaliśmy (np. na łące, w lesie). Przygotowując wyprawę, korzystałem(-am) ze swoich zbiorów: albumów, atlasów, zielników, zbiorów cyfrowych itp. na temat roślin.',
                        'Zorganizowałem(-am) i poprowadziłem(-am) wyprawę zastępu/drużyny do ogrodu botanicznego, parku narodowego, rezerwatu przyrody albo muzeum przyrodniczego.',
                      ]),

                ]
            ),

            SprawFamilyData(
                id: '4',
                sprawData: [
                  SprawData(
                      id: 'zielarz',
                      title: 'Zielarz/Zielarka',
                      level: '2',
                      comment: 'Zna podstawowe zioła występujące w Polsce. Potrafi je wykorzystać.',
                      tasks: [
                        'Znalazłem(-am) w lesie i na łące co najmniej 6 roślin jadalnych, które zebrałem w celu wykorzystania.',
                        'Przygotowałem(-am) napar (herbatę) z pokrzywy, mięty, rumianku lub innego zioła.',
                        'W czasie wędrówki zastępu pokazałem(-am) innym harcerzom/harcerkom miejsce występowania co najmniej 3 roślin użytkowych (opowiedziałem(-am) o ich zastosowaniu) i co najmniej 3 trujących (wyjaśniłem(-am) dlaczego należy ich unikać).',
                      ]),
                  SprawData(
                      id: 'zielarz',
                      title: 'Zielarz/Zielarka',
                      level: '3',
                      comment: 'Zna zasady zbierania i przechowywania ziół.',
                      tasks: [
                        'Samodzielnie wysuszyłem(-am) i odpowiednio spakowałem(-am) przyprawy, które następnie wziąłem (wzięłam) na biwak – np. bazylia, natka pietruszki itp., w tym co najmniej jedną przyprawę samodzielnie znalezioną w terenie.',
                        'Przyrządziłem(-am) ziołowy środek przydatny w leczeniu, kosmetyce, w gospodarstwie domowym.',
                        'Prowadziłem(-am) zbiór roślin (zgodnie z kalendarzem ich zbierania). Zebrałem(-am), zasuszyłem(-am) i przechowałem(-am) co najmniej 3 wybrane rośliny, tak aby nie straciły swoich właściwości.',
                        'Zorganizowałem(-am) i poprowadziłem(-am) wyprawę zastępu/drużyny na łąkę lub do lasu w celu zbierania ziół i innych roślin jadalnych.',
                      ]),
                  SprawData(
                      id: 'zielarz',
                      title: 'Zielarz/Zielarka',
                      level: '4',
                      comment: 'Korzysta z darów lasu i łąki do przyrządzania posiłków we wszystkich porach roku. Propaguje ziołolecznictwo.',
                      tasks: [
                        'Przygotowałem co najmniej 8 potraw (minimum 4 ciepłe) z wykorzystaniem samodzielnie zebranych, dziko rosnących owoców i ziół (przy wykorzystaniu dodatkowo takich produktów jak kasza, mąką i miód).',
                        'Potrafię zebrać „w terenie” rośliny jadalne o każdej porze roku. Przygotowałem(-am) posiłek leśny na wypadzie zastępu/drużyny wiosną, latem, jesienią i zimą.',
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
                      title: 'Florysta/Florystka',
                      level: '2',
                      comment: 'Rozpoznaje najpopularniejsze kwiaty ogrodowe, doniczkowe i polne. Pielęgnuje własny ogródek kwiatowy. Układa bukiety kwiatowe, korzystając z roślin sezonowych.',
                      tasks: [
                        'Rozpoznałem(-am) co najmniej 15 różnych kwiatów w tym kwiaty ogrodowe, doniczkowe i polne.',
                        'Pielęgnowałem(-am) w czasie próby własny ogródek kwiatowy (np. na klombie, w doniczkach, na działce) składający się co najmniej z kilku gatunków.',
                        'Dowiedziałem(-am) się, w jakich miesiącach i porach roku kwitną w Polsce poszczególne kwiaty. Ułożyłem(-am) 3 bukiety, w tym jeden wyłącznie z roślin sezonowych.',
                      ]),
                  SprawData(
                      id: 'florysta',
                      title: 'Florysta/Florystka',
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
                      title: 'Ogrodnik/Ogrodniczka',
                      comment: 'Rozpoznaje nasiona popularnych warzyw. Hoduje własne warzywa. Przygotowuje warzywa do przechowywania podczas zimy.',
                      level: '2',
                      tasks: [
                        'Rozpoznałem(-am) nasiona popularnych warzyw np. marchwi, pietruszki, sałaty, ogórków, buraczków, groszku i dyni.',
                        'Wyhodowałem(-am) samodzielnie co najmniej 5 warzyw z nasion lub rozsady. Starałem(-am) się nie korzystać z nawozów sztucznych oraz oszczędnie gospodarowałem(-am) wodą (np. łapałem(-am) deszczówkę).',
                      ]),
                  SprawData(
                      id: 'ogrodnik',
                      title: 'Ogrodnik/Ogrodniczka',
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
                      title: 'Sadownik/Sadowniczka',
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
                        'Zorganizowałem(-am) zbiórkę w terenie dla zastępu/drużyny/patrolu poświęconą lasom. Pokazałem(-am) różnice między lasami naturalnymi (puszczami) a lasem gospodarczym (uprawą leśną) i zaprezentowałem(-am) korzyści płynące z jednego i drugiego rodzaju lasów. Zapoznałem(-am) uczestników zbiórki z rodzajami drewna pozyskiwanymi z lasu i dalszym jego wykorzystaniem.',
                      ]),

                ]
            ),


            SprawFamilyData(
                id: '9',
                sprawData: [
                  SprawData(
                      id: 'znawca_grzybow',
                      title: 'Znawca/Znawczyni grzybów',
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
                      title: 'Przyjaciel/Przyjaciółka zwierząt',
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
                      title: 'Przyjaciel/Przyjaciółka zwierząt',
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
                      title: 'Przyjaciel/Przyjacióła zwierząt',
                      level: '3',
                      comment: 'Jest znawcą zwyczajów zwierząt. Zna obowiązujące prawo dotyczące ochrony zwierząt i potrafi przekazać swoją wiedzę innym.',
                      tasks: [
                        'Podczas samodzielnej wyprawy do lasu obserwowałem(-am) wybrane zwierzę i podążałem(-am) jego śladem, dokumentując jego życie (w sposób bezpieczny dla niego i dla mnie). Przedstawiłem(-am) jego zwyczaje na forum zastępu/drużyny.',
                        'Zorganizowałem(-am) dla zastępu wyprawę do lasu, muzeum przyrodniczego lub zoo. Opowiedziałem(-am) o wybranych gatunkach zwierząt.',
                        'Przedstawiłem(-am) na forum zastępu/drużyny wybrane gatunki zwierząt żyjących na całym świecie, zagrożonych wyginięciem („czerwona księga”). Opowiedziałem(-am) o produktach pochodzących z nielegalnego handlu zagrożonymi gatunkami, zwracając uwagę na wyroby popularnie przywożone jako pamiątki z wakacji. Opowiedziałem(-am) na zbiórce zastępu lub w klasie szkolnej o tym, jakie zwierzęta można hodować w domu w Polsce zgodnie z obowiązującym prawem.',
                        'Przez 2 tygodnie doradzałem(-am) młodszemu rodzeństwu lub członkowi drużyny w opiece nad zwierzęciem domowym. Zrobiłem(-am) dla niego listę dobrych praktyk w opiece nad zwierzętami (np. niepozostawianie w samochodzie, zapewnianie wody do picia itp.).',
                      ]),
                  SprawData(
                      id: 'przyjaciel_zwierzat',
                      title: 'Przyjaciel/Przyjacióła zwierząt',
                      level: '4',
                      comment: 'Bierze czynny udział w ochronie zwierząt i propagowaniu stylu życia, który minimalizuje ich cierpienie.',
                      tasks: [
                        'Zorganizowałem(-am) dla swojego zastępu/drużyny służbę na rzecz zwierząt.',
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
                      title: 'Hodowca/Hodowczyni (ptaków, gryzoni, drobiu, ryb)',
                      level: '2',
                      comment: 'Świadomie prowadzi hodowlę wybranych zwierząt (np. ptaków, gryzoni, drobiu, ryb).',
                      tasks: [
                        'Przed założeniem hodowli dowiedziałem(-am) się z rzetelnego źródła wiedzy, w jaki sposób należy dbać o interesujące mnie zwierzęta. Dowiedziałem(-am) się, które zwierzęta hodowlane są obce/inwazyjne i jakie są konsekwencje ich umyślnego lub przypadkowego uwolnienia do środowiska naturalnego. Oceniłem(-am) swoje możliwości i po uzyskaniu zgody rodziców/opiekunów dokonałem(-am) wyboru zwierząt do hodowli.',
                        'Przygotowałem(-am) dla swoich zwierząt właściwe pomieszczenia i przynajmniej od 2 miesięcy utrzymuje je w stałej czystości.',
                        'W trakcie trwania próby (przynajmniej 2 miesiące) samodzielnie karmiłem/am swoje zwierzęta. W przypadku własnej niedyspozycji zapewniłem(-am) sobie zastępstwo.',
                        'Zaprezentowałem(-am) na zbiórce zastępu wyhodowane przez siebie zwierzęta, opowiedziałem(-am) o ich zwyczajach, sposobach żywienia i zapobiegania chorobom.',
                      ]),
                  SprawData(
                      id: 'hodowca',
                      title: 'Hodowca/Hodowczyni (ptaków, gryzoni, drobiu, ryb)',
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
                      title: 'Pszczelarz/Pszczelarka',
                      level: '2',
                      comment: 'Umie odróżnić pszczołę od innych podobnych owadów, wie jak się zachowuje i co produkuje.',
                      tasks: [
                        'Przygotowałem(-am) plakat/prezentację na temat różnic w wyglądzie między pszczołami, osami, trzmielami i szerszeniami. Zaprezentowałem(-am) go na zbiórce zastępu/drużyny i opowiedziałem(-am) o tym, co pożytecznego robią pszczoły i trzmiele.',
                        'Obserwowałem(-am) pracę pszczół na łące lub w ogrodzie. Opowiedziałem(-am) członkom mojego zastępu, co zaobserwowałem(-am)',
                        'Posmakowałem(-am) co najmniej 3 różne rodzaje miodu (np. rzepakowy, lipowy, gryczany, spadziowy, wielokwiatowy, manuka) i podjąłem(-jęłam) próbę opisania różnic w ich smakach.',
                        'Wybrałem(-am) się do sklepu pszczelarskiego w swojej okolicy lub zajrzałem(-am) do sklepu internetowego dla pszczelarzy. Opowiedziałem(-am), co ciekawego tam widziałem(-am).',
                      ]),
                  SprawData(
                      id: 'pszczelarz',
                      title: 'Pszczelarz/Pszczelarka',
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
                      title: 'Pszczelarz/Pszczelarka',
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
          id: 'spraw_wych_gospodarcze_i_ekonomiczne',
          title: 'Gospodarcze i ekonomiczne',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności wspierające wychowanie gospodarcze i ekonomiczne"

          ]
      ),

      SprawGroupData(
          id: 'spraw_komputerowe',
          title: 'Komputerowe',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności komputerowe"

          ]
      ),

      SprawGroupData(
          id: 'spraw_zaradnosc_zyciowa',
          title: 'Zaradność życiowa',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności wspierajace zaradność życiową"

          ]
      ),

      SprawGroupData(
          id: 'spraw_terenoznawstwo_i_turystyka',
          title: 'Terenoznawstwo i turystyka',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności dotyczące terenoznawstwa i turystyki"

          ]
      ),

      SprawGroupData(
          id: 'spraw_artystyczne',
          title: 'Artystyczne',
          familyData: [
            SprawFamilyData(
                id: '1',
                sprawData: [
                  SprawData(
                      id: 'muzyk',
                      title: 'Muzyk/Muzyczka',
                      level: '1',
                      comment:'Gra na wybranym instrumencie. Potrafi zagrać kilka ulubionych utworów. Posługuje się zapisem nutowym.',
                      tasks: [
                        'Nauczyłem(-am) się grać na wybranym instrumencie. Przygotowałem(-am) wybrany utwór, który zaprezentowałem(-am) przed większym gronem (drużyną, rodziną).',
                        'Zebrałem(-am) zbiór przynajmniej 5 ulubionych utworów, które potrafię zagrać na instrumencie (może być w postaci śpiewnika bądź zeszytu/segregatora nutowego).',
                        'Zapisałem(-am) w formie nut gamę w tonacji C, nazwałem(-am) jej dźwięki. Powiedziałem(-am) czym są i do czego służą: klucz wiolinowy, krzyżyk, bemol, kasownik.',
                      ]),
                  SprawData(
                      id: 'muzyk',
                      title: 'Muzyk/Muzyczka',
                      level: '2',
                      comment:'Gra na wybranym instrumencie również w duecie/tercecie. Właściwie dobiera utwory do okoliczności. Zna najpopularniejsze utwory znanych kompozytorów.',
                      tasks: [
                        'W duecie (bądź w większym zespole) przygotowałem(-am) wybrany utwór muzyczny, który zaprezentowałem(-am) przed większym gronem (drużyną, rodziną).',
                        'Przygotowałem(-am) zestaw piosenek związanych z tematem ogniska/kominku drużyny. Akompaniowałem(-am) podczas ich wykonywania.',
                        'Rozpoznałem(-am) przynajmniej 5 utworów różnych kompozytorów – podałem(-am) nazwiska autorów.',
                      ]),
                  SprawData(
                      id: 'muzyk',
                      title: 'Muzyk/Muzyczka',
                      level: '3',
                      comment:'Bierze udział w konkursach/przeglądach muzycznych. Propaguje w swoim środowisku świat muzyki. Angażuje się w oprawę muzyczną wydarzeń harcerskich.',
                      tasks: [
                        'Wziąłem/wzięłam udział w konkursie/przeglądzie muzycznym.',
                        'Zorganizowałem(-am) wyjście zastępu lub drużyny na koncert (np. do filharmonii/opery/klubu muzycznego).',
                        'Wziąłem/wzięłam udział w przygotowaniu uroczystości harcerskiej, organizując oprawę muzyczną.',
                      ]),
                  SprawData(
                      id: 'muzyk',
                      title: 'Muzyk/Muzyczka',
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
                      title: 'Gitarzysta/Gitarzystka',
                      level: '2',
                      comment:'Wykorzystuje gitarę do akompaniowania zastępowi/drużynie.',
                      tasks: [
                        'Akompaniowałem(-am) drużynie przy wykonaniu minimum 5 piosenek (np. w czasie ogniska, na zbiórce).',
                        'Nastroiłem(-am) gitarę przy pomocy stroika.',
                        'Grając na gitarze wykorzystałem(-am) akordy barowe. Płynnie przechodziłem(-am) z nich na zwykłe i odwrotnie.',
                      ]),
                  SprawData(
                      id: 'gitarzysta',
                      title: 'Gitarzysta/Gitarzystka',
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
                      title: 'Piosenkarz/Piosenkarka',
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
                      title: 'Piosenkarz/Piosenkarka',
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
                      title: 'Piosenkarz/Piosenkarka',
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
                      title: 'Piosenkarz/Piosenkarka',
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
                      title: 'Aktor/Aktorka',
                      level: '2',
                      comment:'Prezentuje publicznie swoje umiejętności aktorskie. Bierze udział w przedstawieniach lub zajęciach teatralnych.',
                      tasks: [
                        'Zaprezentowałem(-am) się przed publicznością w jednej z form aktorskich: monolog, dialog, pantomima, teatr radia, teatr lalek, teatr tańca.',
                        'Wykonałem(-am) jedno z poniższych zadań:'
                            '\n\n- Wziąłem/wzięłam udział w warsztacie teatralnym.'
                            '\n\n- Wziąłem/wzięłam udział w przedstawieniu /nagraniu filmu /słuchowisku przygotowanym przez drużynę.',
                        'Wybrałem(-am) jedną z ról mojego ulubionego aktora/aktorki i odtworzyłem(-am) jej kilkuminutowy fragment przed członkami zastępu. Zadbałem(-am) o odpowiedni kostium i charakteryzację.',
                      ]),
                  SprawData(
                      id: 'aktor',
                      title: 'Aktor/Aktorka',
                      level: '3',
                      comment:'Prezentuje się przed publicznością w różnych formach aktorskich. Bierze udział w poprzedzonych próbami przedstawieniach lub zajęciach kółka teatralnego.',
                      tasks: [
                        'Zaprezentowałem(-am) się przed publicznością w trzech różnych formach aktorskich np. monolog, dialog, pantomima, teatr radia, teatr lalek, teatr tańca.',
                        'Wykonałem(-am) jedno z poniższych zadań:'
                            '\n\n- uczęszczałem(-am) na zajęcia/warsztaty teatralne przynajmniej przez 3 miesiące'
                            '\n\n- wziąłem/wzięłam udział w poprzedzonym próbami przedstawieniu/nagraniu filmu/słuchowisku przygotowanym przez drużynę.',
                        'Wybrałem(-am) jedną z klasycznych ról (np. z dzieł Sofoklesa, Szekspira, Mickiewicza, Słowackiego, itp.) i odtworzyłem(-am) jej kilkuminutowy fragment przed członkami zastępu. Zadbałem(-am) o odpowiedni kostium i charakteryzację.',
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '5',
                sprawData: [
                  SprawData(
                      id: 'lalkarz',
                      title: 'Lalkarz/Lalkarka',
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
                      title: 'Wodzirej/Wodzirejka',
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
                      title: 'Recytator/Recytatorka',
                      level: '2',
                      comment:'Ćwiczy dykcję. Recytuje prozę i wiersze.',
                      tasks: [
                        'Zaprezentowałem(-am) członkom zastępu podstawowe ćwiczenia doskonalące dykcję.',
                        'Obejrzałem(-am) na żywo lub na nagraniu trzy interpretacje prozy lub wierszy w wykonaniu profesjonalistów. Zinterpretowałem(-am) utwór poetycki lub prozatorski, dobierając barwę głosu, modulację, tempo i rytm.',
                        'Wziąłem/wzięłam udział w konkursie recytatorskim.',
                        'Uczestniczyłem(-am) w przygotowaniu wieczoru poezji, prezentując swoje ulubione utwory.',
                      ]),
                  SprawData(
                      id: 'recytator',
                      title: 'Recytator/Recytatorka',
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
                      title: 'Gawędziarz/Gawędziarka',
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
                      title: 'Reżyser Teatralny/Reżyserka Teatralna',
                      level: '3',
                      comment:'Przygotowuje różne przedstawienia do wystawienia, pełniąc rolę reżysera. Opracowuje scenariusze. Dobiera rekwizyty i dekoracje',
                      tasks: [
                        'Wraz z zastępem lub grupą kolegów przygotowałem(-am) do wystawienia (pełniąc rolę reżysera) sztukę lalkową, teatrzyk harcerski, program kabaretowy itp.',
                        'Opracowałem(-am) scenariusz przedstawienia (własny lub adaptowany) i prowadziłem(-am) próby z zespołem.',
                        'Dobrałem(-am) do przedstawienia rekwizyty i nadzorowałem(-am) powstanie dekoracji.',
                      ]),
                  SprawData(
                      id: 'rezyser_teatralny',
                      title: 'Reżyser Teatralny/Reżyserka Teatralna',
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
                      title: 'Reżyser Teatralny/Reżyserka Teatralna',
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
                      title: 'Plastyk/Plastyczka',
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
                      title: 'Plastyk/Plastyczka',
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
                      title: 'Plastyk/Plastyczka',
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
                      title: 'Malarz/Malarka',
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
                      title: 'Malarz/Malarka',
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
                      title: 'Malarz/Malarka',
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
                      title: 'Malarz/Malarka',
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
                      title: 'Rzeźbiarz/Rzeźbiarka',
                      level: '2',
                      comment:'Poszerza swoją wiedzę o rzeźbiarstwie. Posługując się narzędziami rzeźbiarskimi wykonuje różne elementy zdobnictwa obozowego.',
                      tasks: [
                        'Zobaczyłem/ am co najmniej 5 pomników. Dowiedziałem(-am) się, kto jest ich autorem i jaką techniką zostały wykonane.',
                        'Korzystając z narzędzi rzeźbiarskich do drewna (np. dłuta, rylce, tarniki) wykonałem(-am) na obozie element zdobnictwa obozowego rzeźbiony w drewnie.',
                        'Wykonałem(-am) gipsowy model jednego z symboli harcerskich lub skautowych.',
                      ]),
                  SprawData(
                      id: 'rzezbiarz',
                      title: 'Rzeźbiarz/Rzeźbiarka',
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
                      title: 'Architekt/Architektka Wnętrz',
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
                      title: 'Architekt/Architektka',
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
                      title: 'Fotograf/Fotografka',
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
                      title: 'Fotograf/Fotografka',
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
                      title: 'Fotograf/Fotografka',
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
                      title: 'Fotograf/Fotografka',
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
                      title: 'Grafik Komputerowy/Graficzka Komputerowa',
                      level: '2',
                      comment:'Projektuje proste grafiki. Wykorzystuje programy graficzne do wykonania prac dla zastępu/drużyny.',
                      tasks: [
                        'Zaprojektowałem(-am) prostą grafikę w dowolnym programie graficznym np. plakat, zaproszenie.',
                        'Wykonałem(-am) ilustrację do kroniki drużyny używając dowolnego programu graficznego.',
                        'Obrobiłem(-am) fotografię używając dowolnego programu graficznego lub aplikacji na telefon.',
                      ]),
                  SprawData(
                      id: 'grafik_komputerowy',
                      title: 'Grafik Komputerowy/Graficzka Komputerowa',
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
                      title: 'Grafik Komputerowy/Graficzka Komputerowa',
                      level: '4',
                      comment:'Przygotowuje grafiki i wdraża do użytku. Przestrzega zasad korzystania z grafik, fotografii, krojów pisma zgodnie z prawem autorskim.',
                      tasks: [
                        'Przygotowałem(-am) listę lub repozytorium legalnych źródeł grafik, fotografii i krojów pisma (również tych zawierających polskie znaki). Wiem jak się nimi posługiwać zgodnie z obowiązującym prawem autorskim.',
                        'Zaprojektowałem(-am) identyfikację wizualną obejmującą logo/logotyp, papier firmowy, dwa gadżety i księgę znaku.',
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
          id: 'spraw_spoleczne_i_religijne',
          title: 'Społeczne i religijne',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności społeczne i religijne"

          ]
      ),

      SprawGroupData(
          id: 'spraw_naukowe',
          title: 'Naukowe',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności naukowe"

          ]
      ),

      SprawGroupData(
          id: 'spraw_pasje_i_specjalnosci',
          title: 'Pasje i specjalności',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności rozwijające pasje i specjalnosciowe"

          ]
      ),

      SprawGroupData(
          id: 'spraw_sportowe',
          title: 'Sportowe',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności sportowe"

          ]
      ),

      SprawGroupData(
          id: 'spraw_wodne',
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
                        'Skoczyłem(-am) do wody z wysokości 1 metra i przepłynąłem/przepłynęłam pod wodą 10 metrów.',
                        'Wyciągnąłem(-am) trzy przedmioty znajdujące się 1,5 metra pod wodą.',
                        'Przepłynąłem(-ęłam) między nogami kolegi/koleżanki pod wodą.'
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
                        'Skompletowałem(-am) apteczkę zastępu/wachty na biwak, rejs lub obóz.',
                        'Prawidłowo wezwałem(-am) pomoc w przypadku wypadku nad wodą lub w czasie pozoracji wypadku.',
                        'Zawiązałem(-am) węzeł ratowniczy.'
                      ]),

                  SprawData(
                      id: 'ratownik_specjalista',
                      title: 'Ratownik specjalista',
                      level: '2',
                      comment: 'Potrafi udzielić podstawowej pomocy w wypadku nad wodą.',
                      tasks: [
                        'Odwiedziłem(-am) z drużyną/zastępem/wachtą stację ratownictwa wodnego lub sekcję wodną straży pożarnej.',
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
                        'Holowałem(-am) osobę udającą tonącego na dystansie 150 metrów z zastosowaniem trzech sposobów holowania. Wyciągnąłem(-am) tę osobę na brzeg i ułożyłam(-em) w pozycji bezpiecznej.',
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
                        'Zanurkowałem(-am) na głębokość 2 metrów i wydobyłem(-am) przedmiot z dna kąpieliska/basenu.',
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
                        'Przed wycieczką zastępu/wachty wysłuchałem(-am) prognozy pogody w radio/ telewizji i na jej podstawie dobrałem(-am) odpowiednią odzież.',
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
                        'Przed zajęciami sprawdziłem(-am) prognozę pogody w serwisie internetowym. Przekazałem(-am) ją wachcie/zastępowi.'
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
                        'Wraz z załogą przesunąłem/przesunęłam i obróciłem(-am) na cumach jacht przy kei. Zabezpieczyłem(-am) łódź zacumowaną wzdłuż kei (alongside) przy wietrze dopychającym z użyciem cum, szpringów i odbijaczy.',
                        'Wyjaśniałem(-am) załodze zasady bezpiecznego korzystania z instalacji jachtowych oraz asystowałem(-am) przy wymianie akumulatora i butli gazowej na jachcie.',
                        'Zademonstrowałem(-am) załodze czynności przy uruchamianiu i odstawianiu silnika zaburtowego oraz zatankowałem(-am) odpowiedni rodzaj paliwa do zbiornika jachtu.',
                        'Wraz z załogą położyłem(-am) i postawiłem(-am) maszt.'
                      ]),

                  SprawData(
                      id: 'bosman',
                      title: 'Bosman',
                      level: '4',
                      comment: 'Kieruje przygotowaniem jachtu do postoju i żeglugi. Zna bardziej zaawansowane węzły i sploty. Potrafi obsługiwać instalacje jachtowe, wyjaśnić ich działanie. Wie, jak taklować/roztaklować jacht.',
                      tasks: [
                        'Wyjaśniłem(-am) zasady użycia oraz nauczyłem(-am) inną osobę wiązać węzły z zakresu pierwszej i drugiej gwiazdki oraz samodzielnie wykonałem(-am) dodatkowe prace linowe, np. opaskę turecką, kulkę bosmańską, sploty na linach miękkich.',
                        'Wyjaśniałem(-am), demonstrowałem(-am) czynności oraz kierowałem(-am) pracą załogi podczas przygotowania jachtu do żeglugi i postoju.',
                        'Samodzielnie wymieniłem(-am) butlę gazową i akumulator na jachcie oraz podłączyłem(-am) akumulator do ładowania z lądu lub na lądzie.',
                        'Wyjaśniłem(-am) i zademonstrowałem(-am) sprawdzanie oleju, paliwa i chłodzenia w silniku zaburtowym lub stacjonarnym oraz samodzielnie wykręciłem(-am) świecę w silniku benzynowym w celu sprawdzenia iskry.',
                        'Uczestniczyłem(-am) w taklowaniu jachtu przed pierwszym pływaniem lub w zabezpieczeniu jachtu po sezonie, lub w slipowaniu/wodowaniu jachtu.'
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
                        'Ustaliłem(-am) współrzędne geograficzne swojego domu/namiotu oraz kilku wybranych punktów w mojej okolicy przy użyciu odbiornika nawigacji satelitarnej (np. aplikacja GPS w telefonie).',
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
                        'Korzystając z pomocy innych, prawidłowo zamontowałem(-am) silnik przyczepny na pawęży/pantografie.'
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
                        'Wsiadłem(-am) do kajaka z brzegu i/lub z pomostu/kei.',
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
                        'Wziąłem(-am) udział w spływie w charakterze obsługi spływu.',
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
                        'Wytłumaczyłem(-am) pojęcia: zlewnia, zlewisko, dorzecze, dział wodny, ciek wodny, rzeka uregulowana/skanalizowana, rzeka spławna/żeglowna, spadek/spad rzeki, rzeka stała/okresowa/epizodyczna, rzeka wodospadowa/górska/nizinna, melioracja, irygacja, retencja, eutrofizacja.',
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
                        'Wziąłem(-am) udział w przynajmniej kilkugodzinnej wycieczce wodnej jako wioślarz na kajaku, kanadyjce lub czółnie (np. wzdłuż brzegu jeziora albo na łatwej rzece).',
                        'Brałem(-am) udział w regatach na kanadyjce lub łodzi wiosłowej.',
                        'Zamieniłem(-am) się miejscem ze sternikiem nie wychodząc z łodzi.',
                        'Bezpiecznie przeszedłem/przeszłam z łódki do łódki na wodzie.'
                      ]),

                  SprawData(
                      id: 'wiking',
                      title: 'Wiking',
                      level: '2',
                      comment: 'Wiem, jak zachować się podczas wywrotki kanadyjki.',
                      tasks: [
                        'Wziąłem(-am) udział w kilkudniowym spływie jako sternik łodzi wiosłowej lub kanadyjki na rzece o niskim stopniu trudności.',
                        'Uczestniczyłem(-am) w ćwiczeniach z wywrotek kanadyjek. Przygotowałem(-am) wywróconą łódź do pływania.',
                        'Wsiadłem(-am) do kanadyjki na płytkiej i głębokiej wodzie.'
                      ]),

                  SprawData(
                      id: 'wiking',
                      title: 'Wiking',
                      level: '3',
                      comment: 'Potrafię zarządzać załogą i dowodzić łodzią oraz zorganizować miejsce noclegu mojego zastępu.',
                      tasks: [
                        'Wziąłem(-am) udział w trwającym min. tydzień spływie na rzece o średnim stopniu trudności z min. jedną przenoską.',
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
                        'Wziąłem(-am) udział w spływie rzeką o charakterze górskim.',
                        'Zorganizowałem(-am) regaty wioślarskie dla drużyny.'
                      ]),
                ]
            ),

            SprawFamilyData(
                id: '16',
                sprawData: [
                  SprawData(
                      id: 'bosman wioślarski',
                      title: 'Bosman wioślarski',
                      level: '1',
                      comment: 'Zna budowę łodzi wiosłowej i nazwy elementów podstawowego osprzętu. Umie sklarować łódkę i przygotować niezbędne wyposażenie.',
                      tasks: [
                        'Brałem(-am) udział w wodowaniu łodzi i wyciąganiu jej na brzeg.',
                        'Sklarowałem(-am) łódź przed i po pływaniu.',
                        'Skompletowałem(-am) wyposażenie łodzi do pływania (odpowiednie wiosła, kamizelki, klarszmata, cuma).',
                        'Zawiązałem(-am) węzły: ósemka, ratowniczy, cumowniczy.',
                        'Poprawnie wskazałem(-am) nazwy części łodzi wiosłowej (dziób, rufa, prawa i lewa burta, dno, kokpit, bakista/luk). Nazwałem(-am) osprzęt jachtowy używany na kajaku lub kanadyjce (ucho cumownicze, kipa, knaga).'
                      ]),

                  SprawData(
                      id: 'bosman_wioślarski',
                      title: 'Bosman wioślarski',
                      level: '2',
                      comment: 'Wie, jak zabezpieczyć sprzęt na zimę i dokonać prostych napraw. Zna kilka węzłów.',
                      tasks: [
                        'Dowodziłem(-am) zastępem podczas wodowania i wyciągania łodzi.',
                        'Uczestniczyłem(-am) w zabezpieczeniu sprzętu pływającego na zimę.',
                        'Dokonałem(-am) przeglądu pagajów/wioseł. Pod okiem bosmana naprawiłem(-am) zauważone uszkodzenia – szlifowałem(-am), lakierowałem(-am).',
                        'Zbuchtowałem(-am) linę, zakończyłem(-am) linę opaską.',
                        'Zastosowałem(-am) węzły: ósemkę, sztyk, żeglarski, rybacki, kotwiczny, knagowy, wyblinkę, flagowy, rożkowy i ratowniczy.'
                      ]),

                  SprawData(
                      id: 'bosman_wioślarski',
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
                      id: 'bosman_wioślarski',
                      title: 'Bosman wioślarski',
                      level: '4',
                      comment: 'Samodzielnie dokonuje większych napraw, dba o bezpieczeństwo swoje i innych.',
                      tasks: [
                        'Samodzielnie dokonałem(-am) naprawy uszkodzenia łodzi laminatowej – oczyściłem(-am) uszkodzone miejsce, laminowałem(-am), szlifowałem(-am) łatę, malowałem(-am) powierzchnię, odpowiednio zadbałem(-am) o narzędzia.',
                        'Opracowałem(-am) zasady BHP podczas posługiwania się narzędziami tradycyjnymi i elektrycznymi.',
                        'Samodzielnie wykonałem(-am) pagaj/wiosło.'
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
                        'Wsiadłem(-am) i wysiadłem(-am) z/do kanadyjki lub kajaka z brzegu i pomostu.',
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
                        'Płynąłem/płynęłam w szyku podczas defilady.'
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
          id: 'spraw_lotnicze',
          title: 'Lotnicze',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności lotnicze"

          ]
      ),

      SprawGroupData(
          id: 'spraw_jezdzieckie',
          title: 'Jeździeckie',
          familyData: [

            // Tu można wrzucać rodziny sprawności z kategorii "sprawności jeździeckie"

          ]
      ),

    ]
).build();
