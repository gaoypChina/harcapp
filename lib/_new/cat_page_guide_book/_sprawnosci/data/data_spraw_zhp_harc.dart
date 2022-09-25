import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_book.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_family.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw_group.dart';

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
                        'Wziąłem(-am) udział w kilkudniowym rajdzie/wyprawie z nocowaniem na łonie przyrody, podczas którego minimalizowałem/am swój wpływ na środowisko (odpowiednio gospodarując wodą i odpadami, przygotowując nocleg, zabezpieczając ognisko).',
                        'Wykonałem/am co najmniej jedno z poniższych zadań:'
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

    ]
).build();
