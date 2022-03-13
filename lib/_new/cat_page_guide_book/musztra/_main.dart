import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_classes/org.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/dimen.dart';

import '../../module_statistics_registrator.dart';


class MusztraFragment extends StatefulWidget {

  const MusztraFragment({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MusztraFragmentState();

}

class MusztraFragmentState extends State<MusztraFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.musztra;

  ListView listKomendy = ListView(
      padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
      physics: const BouncingScrollPhysics(),
      children: const <Widget>[
        Item('Baczność',
            'Polecenie przyjęcia postawy zasadniczej.'
                '\n\nSzczegóły dotyczące komendy w zakładce "Baczność i spocznij".'),
        Item('Spocznij',
            'Polecenie przyjęcia postawy swobodnej.'
                '\n\nSzczegóły dotyczące komendy w zakładce "Baczność i spocznij".'),
        Item('Powstań',
            'Polecenie przyjęcia postawy stojącej.'),
        Item('Wróć',
            'Polecenie przerwania aktualnie wykonywanej komendy, lub cofnięcia ostatniej wydanej komendy.'),
        Item('W prawo - zwrot',
            'Polecenie wykonania obrotu o dziewięćdziesiąt stopni w prawo.'
                '\n\nObrót wykonywany jest na dwa tempa:'
                '\nTempo pierwsze - obrót na obcasie prawego buta i na czubku lewego buta,'
                '\nTempo drugie - najkrótszą droga dostawia energicznie nogę pozostawioną w tyle.'),
        Item('W lewo - zwrot',
            'Polecenie wykonania obrotu o dziewięćdziesiąt stopni w lewo.'
                '\n\nObrót wykonywany jest na dwa tempa:'
                '\nTempo pierwsze - obrót na obcasie lewego buta i na czubku prawego buta,'
                '\nTempo drugie - najkrótszą droga dostawia energicznie nogę pozostawioną w tyle.'),
        Item('W tył - zwrot',
            'Polecenie wykonania obrotu o sto osiemdziesiąt stopni przez lewe ramię.'
                '\n\nObrót wykonywany jest na dwa tempa:'
                '\nTempo pierwsze - obrót na obcasie lewego buta i na czubku prawego buta,'
                '\nTempo drugie - najkrótszą droga dostawia energicznie nogę pozostawioną w tyle.'),
        Item('W <i>[szyk zbiórkowy]</i> - zbiórka.',
            'Polecenie ustawienia się w zadanym szyku zbiórkowym z lewej strony prowadzącego.'
                '\n\nPrzykład:'
                '\n<i>• W szeregu - zbiórka.</i>'
                '\n<i>• W dwuszeregu - zbiórka.</i>'),
        Item('W <i>[szyk marszowy]</i> - zbiórka',
            'Polecenie ustawienia się w zadanym szyku marszowym za prowadzącym.'
                '\n\nPrzykład:'
                '\n<i>• W rzędzie - zbiórka.</i>'
                '\n<i>• W kolumnie dwójkowej - zbiórka.</i>'),
        Item('W <i>[szyk zbiórkowy]</i> frontem do <i>[osoba]</i> - zbiórka',
            'Polecenie ustawienia się w zadanym szyku zbiórkowym 3 kroki naprzeciwko wskazanej osoby.'
                '\n\nPrzykład:'
                '\n<i>• W szeregu frontem do mnie - zbiórka.</i>'
                '\n<i>• W dwuszeregu frontem do druha komendanta - zbiórka.'),
        Item('W <i>[szyk marszowy]</i> czołem do <i>[osoba]</i> - zbiórka',
            'Polecenie ustawienia się w zadanym szyku marszowym za wskazaną osobą.'
                '\n\nPrzykład:'
                '\n<i>• W rzędze czołem do mnie - zbiórka.</i>'
                '\n<i>• W kolumnie dwójkowej czołem do druhny przybocznej - zbiórka.</i>'),
        Item('W <i>[szyk zbiórkowy]</i>, <i>[miejsce]</i>, frontem do <i>[kierunek]</i>, prawe skrzydło na wysokości <i>[miejsce]</i> - zbiórka',
            'Polecenie ustawienia się w zadanym szyku zbiórkowym w zadanym miejscu i kierunku.'
                '\n\nPrzykład:'
                '\n<i>• W szeregu na placu apelowym, frontem do jadalni, czoło na wysokości masztu - zbiórka.</i>'
                '\n<i>• W dwuszeregu przed magazynem, w frontem do bramy, czoło na wysokości drzwi - zbiórka.</i>'),
        Item('W <i>[szyk marszowy]</i>, <i>[miejsce]</i>, w kierunku <i>[kierunek]</i>, czoło na wysokości <i>[miejsce]</i> - zbiórka',
          'Polecenie ustawienia się w zadanym szyku marszowym w zadanym miejscu i kierunku.'
              '\n\nPrzykład:'
              '\n<i>• W rzędzie na placu apelowym, w kierunku jadalni, czoło na wysokości masztu - zbiórka.</i>'
              '\n<i>• W kolumnie dwójkowej przed magazynem, w kierunku bramy, czoło na wysokości drzwi - zbiórka.',
          error: 'Polecenie ustawienia się w zadanym szyku marszowym w zadanym miejscu i kierunku.'
              '\n\nPrzykład:'
              '\n<i>• W rzędzie na placu apelowym, w kierunku jadalni, czoło na wysokości masztu - zbiórka.</i>'
              '\n<i>• W kolumnie dwójkowej przed magazynem, w kierunku bramy, czoło na wysokości drzwi - zbiórka.</i>',

        ),
        Item('Równaj w prawo',
            'Polecenie wyrównania szeregów.'
                '\n\nKażdy szereg równa do prawoskrzydłowego z zachowaniem kilkucentymetrowych odstępów między kolejnymi osobami.'),
        Item('Pokryj, wyrównaj',
            'Polecenie wyrównania szeregów i rzędów.'
                '\n\nKażdy szereg równa do prawoskrzydłowego z zachowaniem kilkucentymetrowych odstępów między kolejnymi osobami.'
                '\n\nKażdy rząd równa do czoła z zachowaniem odległości wyciągniętej ręki prawoskrzydłowego między szeregami.'),
        Item('Kolejno - odlicz',
            'Polecenie odliczenia kolejno przez pierwszy szereg szyku zbiórkowego lub lewy rząd szyku marszowego.'
                '\n\nLiczenie odbywa się od prawego skrzydła do lewego w szyku zbiórkowym i od czoła do ogona lewego rzędu szyku marszowego.'
                '\n\nPo podaniu ostatniej liczby, jeżeli szyk jest niepełny, to lewoskrzydłowy ostatniego szeregu (lub ogon prawego rzędu) powinien podać głośno - "niepełny".'),
        Item('Do <i>[liczba]</i> - odlicz',
            'Komenda cyklicznego odliczenia od jeden do zadanej liczby przez pierwszy szereg szyku zbiórkowego lub lewy rząd szyku marszowego.'
                '\n\nPrzykład:'
                '\n<i>• Do dwóch - odlicz.</i>'
                '\n<i>• Do trzech - odlicz.</i>'),
        Item('Wystąp',
            'Polecenie wystąpienia 3 kroki przed szyk.'
                '\n\nKażdorazowo po wystąpieniu harcerz przyjmuje postawę zasadniczą.'
                '\n\nPo wystąpieniu harcerza wywołanego z pierwszego szeregu, jego miejsce zajmuje harcerz z drugiego szeregu.'),
        Item('Do <i>[osoba]</i> - wystąp',
            'Polecenie wystąpienia z szyku i podążenia najkrótszą drogą przed wskazaną osobę, z zachowaniem odległości 3 kroków.'
                '\n\nPrzykład:'
                '\n<i>• Do mnie - wystąp.</i>'
                '\n<i>• Do druha kwatermistrza - wystąp.</i>'
                '\n\nKażdorazowo po wystąpieniu harcerz przyjmuje postawę zasadniczą.'
                '\n\nPo wystąpieniu harcerza wywołanego z pierwszego szeregu, jego miejsce zajmuje harcerz z drugiego szeregu.'),
        Item('Do/na <i>[miejsce]</i> - wystąp',
            'Polecenie wystąpienia z szyku i podążenia najkrótszą drogą do wskazanego miejsca, z zachowaniem odległości 3 kroków.'
                '\n\nPrzykład:'
                '\n<i>• Do namiotu - wystąp.</i>'
                '\n<i>• Na plac apelowy - wystąp.</i>'
                '\n\nKażdorazowo po wystąpieniu harcerz przyjmuje postawę zasadniczą.'
                '\n\nPo wystąpieniu harcerza wywołanego z pierwszego szeregu, jego miejsce zajmuje harcerz z drugiego szeregu.'),
        Item('Wstąp',
            'Polecenie zajęcia na powrót swojego miejsca w szyku.'
                '\n\nOsoba wykonje zwrot we wskazanym kierunku i najkrótszą drogą zajmuje swoje miejsce i przyjmuje postawę szyku.'),
        Item('Na wprost - marsz',
            'Polecenie rozpoczęcia przemieszczania kolumny na wprost.'),
        Item('Krok na wprost - marsz',
            'Polecenie przemieszczenia kolumny o jeden krok na wprost.'),
        Item('<i>[Liczba]</i> kroków na wprost - marsz',
            'Polecenie przemieszczenia kolumny na wprost o zadaną liczbę kroków.'
                '\n\nPrzykład:'
                '\n<i>• Trzy kroki na wprost - marsz.</i>'
                '\n<i>• Dziesięć kroków na wprost - marsz.</i>'),
        Item('Krok w tył - marsz',
          'Polecenie przemieszczenia kolumny o jeden krok w tył.',
          error: 'Błędem jest podanie komendy przesuwającej kolumnę o więcej niż jeden krok w tył, np.:'
              '\n<i>• Trzy kroki w tył - marsz.</i>'
              '\n\nAby przemieścić kolumnę o więcej niż jeden krok w tył, należy posłużyć się komendą "na wprost - marsz", wcześniej zmieniając front szyku.',
        ),
        Item('Za <i>[osoba]</i> - marsz',
            'Polecenie rozpoczęcia przemieszczania szyku za wskazaną osobą.'
                '\n\nPrzykład:'
                '\n<i>• Za mną - marsz.</i>'
                '\n<i>• Za druhem drużynowym - marsz.</i>'),
        Item('Kierunek <i>[miejsce]</i> - marsz',
            'Polecenie przemieszczenia kolumny najkrótszą drogą w zadane miejsce.'
                '\n\nPrzykład:'
                '\n<i>• Kierunek harcówka - marsz.</i>'
                '\n<i>• Kierunek plac apelowy - marsz.</i>'),
        Item('Kierunek <i>[kierunek]</i> - marsz',
            'Polecenie rozpoczęcia przemieszczania kolumny w zadanym kierunku.\n'
                '\n\nPrzykład:'
                '\n<i>• Kierunek na wprost - marsz.</i>'
                '\n<i>• Kierunek w prawo - marsz.</i>'
                '\n\nCzoło kolumny w marszu obiera zadany kierunek i kontynuuje przemieszczanie się na wprost.'
                '\n\nKierunki:'
                '\n• na wprost (0°)'
                '\n• w prawo skos (45°)'
                '\n• prawo (90°)'
                '\n• w tył na prawo (135°)'
                '\n• w tył (180°)'
                '\n• w tył na lewo (225°)'
                '\n• lewo (270°)'
                '\n• w lewo skos (315°)'),
        Item('W miejscu - marsz',
            'Polecenie rozpoczęcia marszu w miejscu.'
                '\n\nMarsz w miejscu polega na podnoszeniu i opuszczaniu na przemian prawej i lewej nogi, np. celem wyrównania tempa marszu podczas chwilowego zatrzymania.'),
        Item('Biegiem - marsz',
            'Polecenie rozpoczęcia przemieszczania kolumny biegiem.'
                '\n\nCzłon "biegiem" może być zastosowany do wszystkich komend marszowych uzględniających kierunek, miejsce docelowe lub osobę prowadzącą kolumnę.'),
        Item('Szybszy - krok',
            'Polecenie przyszpieszenia tempa marszu.'),
        Item('Wolniejszy - krok',
            'Polecenie spowolnienia tempa marszu.'),
        Item('Równy - krok',
            'Polecenie wyrównania (zsynchronizowania) kroku podczas marszu.'
                '\n\nWykonanie komendy można wspomóc przez akcentowanie gwizdkiem lub głosem "lewa" stawianej lewej nogi.'),
        Item('Dowolny - krok',
            'Polecenie rozsynchronizowania kroku podczas marszu.'),
        Item('Stój',
            'Polecenie zatrzymania kolumny.'
                '\n\nPo komendzie wykonywany jest jeszcze jeden krok, po czym kolumna zatrzymuje się w miejscu i przyjmuje postawę zasadniczą.'),
        Item('Czoło - stój',
            'Polecenie zatrzymania czoła kolumny. Następni harcerze dochodzą do poprzedników i zatrzymują się z zachowaniem regulaminowej odległości, przyjmując postawę swobodną.'),
        Item('Stawaj w prawo',
            'Polecenie zatrzymania czoła kolumny i wykonania zwrotu w prawo. Następni harcerze, podchodząc do porzednikow, wykonują te same czynności z zachowaniem odpowiednich odstępów, odległości, równania i krycia.'),
        Item('Stawaj w lewo',
            'Polecenie zatrzymania czoła kolumny i wykonania zwrotu w lewo. Następni harcerze, podchodząc do porzednikow, wykonują te same czynności z zachowaniem odpowiednich odstępów, odległości, równania i krycia.'),
        Item('<i>[Szyk zbiórkowy]</i> w prawo - twórz',
            'Polecenie utworzenia zadanego szyku zbiórkowego ze zwrotem w prawo.'
                '\n\nPrzykład:'
                '\n<i>• Dwójki w prawo - twórz.</i>'
                '\n<i>• Trójki w prawo - twórz.</i>'
                '\n\nSposób utworzenia kolumny dwójkowej z szeregu:'
                '\n• (Przed komendą podana winna zostać komenda "do dwóch - odlicz").'
                '\n• Harcerze, na których podczas odliczania wypadła liczba jeden, wykonują w prawo zwrot. Oznaczeni liczbą dwa wykonują lewą nogą wykrok w przód, w prawo skos, z jednoczesnym zwrotem w prawo.'
                '\n\nWięcej w zakładce "Rodzaje szyków".'),
        Item('<i>[Szyk zbiórkowy]</i> w lewo - twórz',
            'Polecenie utworzenia zadanego szyku zbiórkowego ze zwrotem w lewo.'
                '\n\nPrzykład:'
                '\n<i>• Dwójki w lewo - twórz.</i>'
                '\n<i>• Czwórki w lewo - twórz.</i>'
                '\n\nSposób utworzenia kolumny dwójkowej z szeregu:'
                '\n• (Przed komendą podana winna zostać komenda "do dwóch - odlicz").'
                '\n• Harcerze, na których podczas odliczania wypadła liczba jeden, wykonują w lewo zwrot. Oznaczeni liczbą dwa wykonują prawą nogą wykrok w przód, w lewo skos, z jednoczesnym zwrotem w lewo.'
                '\n\nWięcej w zakładce "Rodzaje szyków".'),
        Item('<i>[Szyk marszowy]</i> - twórz',
            'Polecenie utworzenia zadanego szyku marszowego.'
                '\n\nPrzykład:'
                '\n<i>• Rząd - twórz.</i>'
                '\n<i>• Kolumnę dwójkową - twórz.</i>'
                '\n\nPrzejście w marszu z kolumny dwójkowej w rząd:'
                '\nHarcerze z lewego rzędu przesuwają się za swych prawych sąsiadów, nie przerywając marszu i zachowując prawidłową odległość.'
                '\n\nPrzejście w marszu z rzędu w kolumnę dwójkową:'
                '\nHarcerze tworzą kolumnę dwójkową od czoła na zasadzie przechodzenia w przód na lewo od swych poprzedników.'),
        Item('Rozejść się',
            'Polecene opuszczenia szyku w dowolnym kierunku.'),
        Item('W tył - rozejść się',
            'Polecenie wykonania zwrotu w tył przez lewe ramię i rozpraszenia się.'),
        Item('W kierunku <i>[miejsce]</i> - rozejść się',
            'Polecenie opuszczenia szyku w zadanym kierunku.'
                '\n\nPrzykład:'
                '\n<i>• W kierunku lasu - rozejść się.</i>'
                '\n<i>• W kierunku stołówki - rozejść się.</i>'),
        Item('Do/na <i>[miejsce]</i> - rozejść się',
            'Polecenie opuszczenia szyku i przejścia najszybszą drogą do zadanego miejsca.'
                '\n\nPrzykład:'
                '\n<i>• Do namiotów - rozejść się.</i>'
                '\n<i>• Na stołówkę - rozejść się.</i>'),
        Item('<i>[Jednostkami]</i> - odmaszerować',
            'Polecenie opuszczenia miejsca aktualnego pobytu w zadanych jednostkach.'
                '\n\nPrzykład:'
                '\n<i>• Zastępami odmaszerować.</i>'
                '\n<i>• Drużynami odmaszerować.</i>'
                '\n\nOsoby stojące w szyku przyjmują postawę swobodną i czekają na decyzje dowódców swoich jednostek, a osoby stojące poza szykiem udają się w dowolnym kierunku.'),
        Item('<i>[Jednostkami]</i> - meldować',
            'Polecenie wystąpienia dowódców podanych jednostek i w celu złożenia meldunku prowadzącemu.'
                '\n\nPrzykład:'
                '\n<i>• Patrolami - meldować.</i>'
                '\n<i>• Zastępami meldować.</i>'),
        Item('Do hymnu państwowego',
            'Polecenie rozpoczęcia odśpiewywania hymnu państwowego.'),
        Item('Do hymnu Związku Harcerstwa Polskiego',
            'Polecenie rozpoczęcia odśpiewywania hymnu Związku Harcerstwa Polskiego.'),
        Item('Sztandar <i>[jednostka]</i> - wprowadzić',
            'Polecenie wprowadzenia sztandaru zadanej jednostki przez poczet sztandarowy jednostki.'
                '\n\nPrzykład:'
                '\n<i>• Sztandar hufca - wprowadzić.</i>'
                '\n<i>• Sztandar szczepu - wprowadzić.</i>'),
        Item('Poczet flagowy - odmaszerować',
            'Polecenie opuszczenia placu apelowego przez poczet flagowy.'),
        Item('<i>[Jednostka]</i>, do defilady, w kolumnę marszową, kierunek <i>[kierunek]</i> - maszerować',
            'Polecenie przeprowadzenia zadanej jednostki przez dowódcę jednostki we wskazanym kierunku krokiem defiladowym.'
                '\n\nPrzykład:'
                '\n<i>• Hufiec, do defilady, w kolumnę marszową, kierunek w prawo - maszerować.</i>'
                '\n<i>• Chowągiew, do defilady, w kolumnę marszową, kierunek w lewo - maszerować.</i>'),
      ]);

  ListView listBacznoscSpocznij = ListView(
    padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
    physics: const BouncingScrollPhysics(),
    children: const <Widget>[
      Item('Postawa zasadnicza - Baczność',
        'Postawa zasadnicza wyraża gotowość do przyjęcia, wykonania i podawania komendy.',
      ),
      Item('Postawa zasadnicza - Postawa',
        '• Postawa ciała pozostaje nieruchoma.'
            '\n• Ciężar ciała spoczywa na obu stopach,'
            '\n• Pięty złączone, stopy lekko rozwarte (mniej więcej na szerokość własnej stopy)'
            '\n• Brzuch lekko wciągnięty,'
            '\n• Klatka piersiowa lekko wysunięta przez swobodne cofnięcie ramion,'
            '\n• Ramiona na równej wysokości, położone równolegle do linii frontu,'
            '\n• Ręce opuszczone swobodnie wzdłuż tułowia, dotykają uda nasadą dłoni oraz złączonymi i wyprostowanymi palcami,'
            '\n• Głowa lekko podniesiona, wzrok skierowany na wprost, usta zamknięte.',
      ),
      Item('Postawa zasadnicza - Kiedy?',
          '• Po komendzie "baczność",'
              '\n• Po komendzie "zbiórka",'
              '\n• Po komendzie "stój",'
              '\n• W czasie oddawania honorów,'
              '\n• W czasie składania meldunku,'
              '\n• Na zapowiedź komendy dwuczłonowej,'
              '\n• Wydając komendy w miejscu.'
      ),
      Item('Postawa swobodna - Spocznij',
          'Postawa swobodna jest formą odpoczynku harcerza.'
      ),
      Item('Postawa swobodna - Postawa',
          'Przyjmując postawę swobodną, wysuwa się energicznie lewą nogę do przodu, o połowę długości stopy. Ciężar spoczywa na prawej nodze. Ręce opuszczone swobodnie.'
              '\n\nW tej postawie harcerz może poprawiać umundurowanie, zmieniać położenie nóg.'
              '\n\nDrużyny zwyczajowo mogą przyjmować odmienną postawę swobodną, np. w lekkim rozkroku ze skrzyżowanymi rękami z tyłu tułowia. Dotyczy to tylko zbiórek w gronie drużyny/szczepu i nie może mieć miejsca w czasie innych wystąpień.'
      ),
    ],
  );

  ListView listSzyki = ListView(
    padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
    physics: const BouncingScrollPhysics(),
    children: const <Widget>[
      Item('Rodzaje szyków:',
          'Szyk jest to ustalone regulaminem ustawienie harcerzy w celu wykonania wspólnych działań.'
              '\n\nRodzaje szyków:'
              '\n• Zbiórkowy - szereg, dwuszereg, trójszereg itd.,'
              '\n• Marszowy - rząd, kolumna dwójkowa, kolumna trójkowa itd.'
      ),
      Item('Elementy szyku:',
          '• <b>Front</b> - kierunek ustawienia harcerzy,'
              '\n• <b>Skrzydło</b> - prawe i lewe zakończenie szyku,'
              '\n• <b>Odstęp</b> - oddalenie między harcerzami wzdłuż frontu,'
              '\n• <b>Odległość</b> - oddalenie między harcerzami w głąb szyku,'
              '\n• <b>Czoło kolumny</b> - przednia część kolumny,'
              '\n• <b>Koniec kolumny</b> - tylna część kolumny,'
              '\n• <b>Kierunkowy</b> - harcerz, do którego pozostali równają i dostosowują swój ruch. Przyjmuje się, że jest to harcerz na prawym skrzydle czoła kolumny. Drużynowy może wyznaczyć na kierunkowego harcerza zajmującego inną pozycję, np. na lewym skrzydle, przed szykiem. Do kierunkowego pozostali równają i dostosowują swój ruch,'
              '\n• <b>Zamykający</b> - harcerz maszerujący jako ostatni. Przyjmuje się, że jest to harcerz znajdujący się w ostatnim szeregu kolumny, na lewym skrzydle. Drużynowy może wyznaczyć innego zamykającego i polecić mu np. zajęcie pozycji tuż za szykiem.'
      ),
      Item('Przekształcanie szyku:',
          '• <b>Przejście z szeregu/dwuszeregu w kolumnę dwójkową/czwórkową</b>'
              '\n- Harcerze, na których podczas odliczania wypadła liczba jeden, wykonują w prawo zwrot.'
              '\n- Oznaczeni liczbą dwa wykonują lewą nogą wykrok w przód, w prawo skos, z jednoczesnym zwrotem w prawo; energicznie dostawiając prawą nogę do lewej, stają na lewo od swych poprzedników.'
              '\n\n• <b>Przejście z szeregu w kolumnę trójkową</b>'
              '\n- Oznaczeni liczbą jeden - wykonują prawą nogą krok w tył, w lewo w skos, z jednoczesnym zwrotem w prawo.'
              '\n- Oznaczeni liczbą dwa - wykonują w prawo zwrot.'
              '\n- Oznaczeni liczbą trzy - wykonują lewą nogą krok w przód, w prawo w skos z jednoczesnym zwrotem w prawo.'
              '\n\n• <b>Przejście z kolumny dwójkowej/czwórkowej w szereg/dwuszereg</b>'
              '\n- Nieparzyste rzędy (albo oznaczeni liczbą jeden) wykonują wykrok prawą nogą w przód, w lewo skos, z jednoczesnym zwrotem w lewo.'
              '\n- Parzyste rzędy (albo oznaczeni liczbą dwa) wykonują w lewo zwrot.'
              '\n\n• <b>Przejście z kolumny trójkowej w szereg</b>'
              '\n- Prawy rząd (albo oznaczeni liczbą jeden) wykonuje prawą nogą krok w przód, w prawo skos, z jednoczesnym zwrotem w lewo.'
              '\n- Środkowy rząd (albo oznaczeni liczbą dwa) wykonuje zwrot w lewo.'
              '\n- Lewy rząd (albo oznaczeni liczbą trzy) wykonuje wykrok lewą nogą w tył, w lewo skos, z jednoczesnym zwrotem w lewo.'
              '\n\n• <b>Przejście w marszu z kolumny dwójkowej w rząd</b>'
              '\n- Harcerze z lewego rzędu przesuwają się za swych prawych sąsiadów, nie przerywając marszu i zachowując prawidłową odległość.'
              '\n\n• <b>przejście w marszu z rzędu w kolumnę dwójkową</b>'
              '\n- Harcerze tworzą kolumnę dwójkową od czoła na zasadzie przechodzenia w przód na lewo od swych poprzedników.'
      ),
    ],
  );

  ListView listApel = ListView(
    padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
    physics: const BouncingScrollPhysics(),
    children: const <Widget>[
      Item('Ogólne uwagi:',
          'Komendę "baczność" podaną na apelu należy rozumieć jako patrzenie w kierunku, gdzie dzieją się rzeczy ważne.'
      ),
      Item('Meldowanie:',
        '• "<i>[Jednostka]</i> na moją komendę, baczność! <i>[Podjednostkami]</i> meldować".'
            '\n• Dowódcy podjednostek podchodzą do prowadzącego apel i stają 3 kroki przed nim.'
            '\n• Następuje jednoczesne oddanie honorów.'
            '\n• Prowadzący apel podaje komendę "spocznij".'
            '\n• Prowadzący apel kolejno odbiera meldunki.'
            '\n• Następuje jednoczesne oddanie honorów.'
            '\n• Prowadzący apel podaje komendę "wstąp".',
        error: 'Nie należy stosować meldowania 3-stopniowego.',
      ),
      Item('Rozkaz:',
          '• "Baczność".'
              '\n• Odczytanie nagłówka, daty, numeru rozkazu.'
              '\n• "Spocznij".'
              '\n• Odczytanie treści rozkazu.'
              '\n• "Baczność".'
              '\n• "Czuwaj! Podpisał <i>[osoba]</i>".'
              '\n• "Spocznij".'
              '\n\nDobrym obyczajem jest, aby osoby wyczytane w rozkazie odpowiadały "Służba"; nie dotyczy to przypadku odczytania kary.'
      ),
      Item('Nikt nie podaje komendy "Na prawo patrz", "na lewo patrz", "na raport patrz", "na sztandar patrz".',
          'Podczas śpiewania hymnu salutują:'
              '\n• Asystujący przy podnoszeniu flagi,'
              '\n• dowódcy grup w szyku,'
              '\n• nie pokryci instruktorzy stojący w szyku,'
              '\n• instruktorzy nie stojący w szyku, po uprzednim zwróceniu się w kierunku masztu.'
              '\n\nKto salutuje, nie śpiewa hymnu.'
              '\nWszyscy zwracają głowy w kierunku masztu.'
      ),
    ],
  );

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
              title: const Text('Musztra'),
              centerTitle: true,
              backgroundColor: background_(context),
              pinned: true,
              floating: true,
              actions: <Widget>[
                IconButton(icon: Icon(Icons.info_outline, color: appBarTextEnab_(context)), onPressed: () => showGeneralInfo(context))
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: const [
                  Tab(text: 'Komendy'),
                  Tab(text: 'Baczność i spocznij'),
                  Tab(text: 'Rodzaje szyków'),
                  Tab(text: 'Apel'),
                ],
                indicator: AppTabBarIncdicator(color: orgColor[Org.zhp]),
              ),
            )
          ],
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: [
              listKomendy,
              listBacznoscSpocznij,
              listSzyki,
              listApel,
            ],
          ),
        ),
      )
  );

  void showGeneralInfo(BuildContext context) => showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetDef(
      title: 'Informacje ogólne',
      builder: (context) => AppText(
        '• Wydający komendy w miejscu przyjmuje postawę zasadniczą (baczność).'
            '\n\n• W przypadku komend dwuczłonowych (np. w prawo - zwrot, za mną - marsz), na zapowiedź komendy (pierwszy człon) przyjmuje się postawę zasadniczą, po haśle (drugim członie) wykonuje polecenie.'
            '\n\n• Przejmując dowodzenie musztrą należy pierwszą wydaną komendę poprzedzić zapowiedzią <i>"Na moją komendę..."</i>.'
            '\n\n• Każdą komendę można poprzedzić nazwą lub typem jednostki której wydawana jest komenda, np.: <i>"Drużyna, baczność"</i>, lub <i>"Zastęp Orły, za mną marsz"</i>.',
        size: Dimen.TEXT_SIZE_BIG,
        colorItalic: hintEnab_(context),
      ),
    ),
  );

}

class Item extends StatelessWidget{

  final String title, description, error;

  const Item(this.title, this.description, {this.error, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimen.LIST_SEP_MARG/1.5, bottom: Dimen.LIST_SEP_MARG/1.5),
      child: Column(
          children: [
            AppText(title, globalBold: true, colorItalic: hintEnab_(context), size: Dimen.TEXT_SIZE_BIG),
            const SizedBox(height: Dimen.DEF_MARG),
            AppText(description, colorItalic: hintEnab_(context), size: Dimen.TEXT_SIZE_BIG),
            if(error!=null)
              const SizedBox(height: Dimen.DEF_MARG),
            if(error!=null)
              AppText(error, color: Colors.red)
          ]
      ),
    );
  }
}