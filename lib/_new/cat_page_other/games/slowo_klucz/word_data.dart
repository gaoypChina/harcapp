const int WORD_LIST_VERISON = 2;

class WordData{

  static List<WordData> get all {
    List<WordData> words = List.of(_ALL_WORDS);
    //words.removeWhere((word) => word.diff<4);
    return words;
  }

  final String data;
  final int diff;
  const WordData(this.data, {this.diff= 4});
}

List<WordData> get all {
  List<WordData> words = List.of(_ALL_WORDS);
  words.removeWhere((word) => word.diff<4);
  return words;
}

const List<WordData> _ALL_WORDS = [
  WordData('abdykacja', diff: 1), //
  WordData('abecadło'), //
  WordData('absolwent', diff: 4), //osoba kończąca studia - nazwa wódki
  WordData('abstrakcja', diff: 3), //
  WordData('abstynent'), //
  WordData('adidasy'), //
  WordData('adres', diff: 6), //
  WordData('adwokat', diff: 4), //prawnik - likier
  WordData('aerobik', diff: 3), //
  WordData('afera'), //
  WordData('afryka', diff: 6), //
  WordData('agresja', diff: 6), //wojna -
  WordData('agrest'), //
  WordData('akademik', diff: 6), //ciasno - dom studencki - syf
  WordData('akcja', diff: 6), //
  WordData('akompaniament', diff: 3), //
  WordData('akrobata', diff: 3), //
  WordData('aktor'), //
  WordData('akumulator', diff: 3), //
  WordData('akwarium'), //
  WordData('alarm', diff: 6), //
  WordData('alaska', diff: 6), //stan - śnieg - północ
  WordData('album', diff: 4), //zestaw zdjęć - kolekcja piosenek
  WordData('alergia'), //
  WordData('alfabet', diff: 6), //
  WordData('aligator'), //
  WordData('alkohol', diff: 6), //
  WordData('alladyn'), //
  WordData('alpinista', diff: 3), //
  WordData('amator', diff: 3), //
  WordData('ambasada'), //
  WordData('ambona'), //
  WordData('ameryka', diff: 6), //
  WordData('amputacja', diff: 2), //
  WordData('amulet'), //
  WordData('amunicja'), //
  WordData('analfabeta'), //
  WordData('anarchia'), //
  WordData('anegdota', diff: 1), //
  WordData('anglia', diff: 6), //
  WordData('anioł', diff: 6), //
  WordData('anonim', diff: 3), //
  WordData('antarktyda', diff: 6), //
  WordData('antena'), //
  WordData('antybiotyk'), //
  WordData('aparat', diff: 4), //
  WordData('apel'), //
  WordData('apetyt'), //
  WordData('aplauz', diff: 1), //
  WordData('apokalipsa'), //
  WordData('apteka'), //
  WordData('arab', diff: 6), //kebab - uchodźcy - islam
  WordData('arbuz'), //
  WordData('archeolog', diff: 3), //
  WordData('architekt'), //
  WordData('archiwum'), //
  WordData('arena'), //
  WordData('areszt'), //
  WordData('armata'), //
  WordData('armia', diff: 6), //
  WordData('aromat'), //
  WordData('artykuł', diff: 4), //produkt spożywczy - fragment gazety
  WordData('artystka'), //
  WordData('arystoteles', diff: 6), //
  WordData('as', diff: 4), //karta - zuch
  WordData('asfalt'), //
  WordData('astronauta', diff: 6), //
  WordData('astronomia', diff: 2), //
  WordData('asystent'), //
  WordData('atlas'), //
  WordData('atleta'), //
  WordData('atom', diff: 6), //
  WordData('atrament'), //
  WordData('atrapa', diff: 2), //
  WordData('audycja'), //
  WordData('aukcja'), //
  WordData('australia'), //
  WordData('auto', diff: 6), //
  WordData('autobus', diff: 6), //
  WordData('autograf'), //
  WordData('autor'), //
  WordData('autostop'), //
  WordData('autostrada', diff: 6), //
  WordData('awans', diff: 6), //
  WordData('awantura'), //
  WordData('awaria', diff: 1), //
  WordData('azja'), //
  WordData('azyl', diff: 1), //
  WordData('babka', diff: 5), //ciasto - babcia - budowla z piasku
  WordData('baca', diff: 6), //
  WordData('badminton'), //
  WordData('bagaż'), //
  WordData('bagnet', diff: 2), //
  WordData('bagno'), //
  WordData('bajka', diff: 6), //
  WordData('bakteria'), //
  WordData('bal', diff: 4), //impreza - kłoda
  WordData('bałagan'), //
  WordData('balet'), //
  WordData('balkon'), //
  WordData('balon', diff: 6), //
  WordData('bałwan', diff: 6), //
  WordData('bambus', diff: 4), //roślina / materiał - Murzyn
  WordData('banan', diff: 6), //
  WordData('bandyta', diff: 6), //
  WordData('bank', diff: 6), //
  WordData('bańka', diff: 5), //bańka mydlana - sto złotych - blaszane naczynie
  WordData('banknot', diff: 6), //
  WordData('bankomat'), //
  WordData('bankrut'), //
  WordData('bar', diff: 6), //
  WordData('baran', diff: 4), //zwierzę - idiota
  WordData('bariera', diff: 3), //
  WordData('barka', diff: 2), //
  WordData('barman'), //
  WordData('barwa'), //
  WordData('barykada', diff: 1), //
  WordData('basen', diff: 6), //
  WordData('bat', diff: 2), //
  WordData('bateria', diff: 6), //
  WordData('baton', diff: 6), //
  WordData('bawełna', diff: 6), //
  WordData('bazar'), //
  WordData('bazie', diff: 3), //
  WordData('bazyliszek', diff: 6), //
  WordData('bestia', diff: 6), //
  WordData('bęben', diff: 4), //instrument - duży brzuch
  WordData('beczka'), //
  WordData('beksa', diff: 6), //
  WordData('blef', diff: 3), //
  WordData('benzyna'), //
  WordData('berek', diff: 2), //
  WordData('beret'), //
  WordData('berlin', diff: 6), //
  WordData('berło', diff: 3), //
  WordData('bezpieczeństwo', diff: 6), //
  WordData('bezpiecznik'), //
  WordData('bezrobocie', diff: 6), //
  WordData('bezsenność'), //
  WordData('białko', diff: 6), //
  WordData('biały', diff: 4), //kolor - człowiek
  WordData('białystok', diff: 6), //
  WordData('biblia', diff: 6), //
  WordData('biblioteka'), //
  WordData('biceps'), //
  WordData('bicz', diff: 2), //
  WordData('biedak'), //
  WordData('biedronka', diff: 4), //owad - sklep
  WordData('bieg', diff: 4), //poruszanie się - przerzutki
  WordData('biegunka'), //
  WordData('bielizna'), //
  WordData('bierki', diff: 4), //gra - nazwa zbiorcza figur szachowych
  WordData('bijatyka'), //
  WordData('bikini', diff: 6), //plaża - słońce - bielizna
  WordData('bilans', diff: 4), //
  WordData('bilard'), //
  WordData('bilet', diff: 6), //
  WordData('biodro', diff: 3), //
  WordData('bitwa', diff: 6), //
  WordData('biurko', diff: 6), //
  WordData('biuro'), //
  WordData('biurokracja'), //
  WordData('biurowiec', diff: 3), //
  WordData('biust'), //
  WordData('biustonosz'), //
  WordData('biwak'), //
  WordData('biznes'), //
  WordData('bizon', diff: 2), //
  WordData('biżuteria'), //
  WordData('blacha'), //
  WordData('błąd'), //
  WordData('błazen', diff: 2), //
  WordData('błękit'), //
  WordData('błysk'), //
  WordData('bliskość'), //
  WordData('blizna'), //
  WordData('bliźniak'), //
  WordData('blokada', diff: 2), //
  WordData('blondynka'), //
  WordData('błotnik'), //
  WordData('błoto'), //
  WordData('błyskawica'), //
  WordData('błyskotka', diff: 2), //
  WordData('boazeria', diff: 1), //
  WordData('bobas'), //
  WordData('bochenek'), //
  WordData('bocian', diff: 6), //
  WordData('bogacz', diff: 6), //
  WordData('bohater', diff: 4), //osoba w książce - osoba zasłużona
  WordData('boisko'), //
  WordData('boja', diff: 2), //
  WordData('bojkot', diff: 1), //
  WordData('bojler', diff: 4), //urządzenie grzewcze - duży brzuch
  WordData('boks'), //
  WordData('ból', diff: 6), //
  WordData('bomba'), //
  WordData('bombka', diff: 4), //bomba - ozdoba choinkowa
  WordData('bosman'), //
  WordData('brama'), //
  WordData('bramka', diff: 4), //drzwi w płocie - bramka piłkarska
  WordData('bramkarz', diff: 4), //piłkarz - ochroniarz
  WordData('bransoletka', diff: 3), //
  WordData('brat', diff: 6), //
  WordData('brew'), //
  WordData('brexit', diff: 6), //Wielka Brytania - UE - polityka
  WordData('broda'), //
  WordData('broszka', diff: 2), //
  WordData('broszura', diff: 2), //
  WordData('browar', diff: 4), //fabryka piwa - potocznie piwo
  WordData('brud'), //
  WordData('brudas'), //
  WordData('brudnopis'), //
  WordData('brukowiec'), //
  WordData('brunetka'), //
  WordData('brzeg'), //
  WordData('brzoza', diff: 6), //drzewo - las - roślina
  WordData('brzuch'), //
  WordData('brzuchomówca'), //
  WordData('brzydal'), //
  WordData('brzytwa'), //
  WordData('bubel'), //
  WordData('budka'), //
  WordData('budowla'), //
  WordData('budyń'), //
  WordData('budzik'), //
  WordData('bukiet'), //
  WordData('buldożer'), //
  WordData('bułka'), //
  WordData('bunkier'), //
  WordData('bunt'), //
  WordData('buntownik'), //
  WordData('burak', diff: 4), //warzywo - osoba małomiasteczkowa
  WordData('burdel'), //
  WordData('burza'), //
  WordData('busola', diff: 1), //
  WordData('butelka'), //
  WordData('buty'), //
  WordData('buziak'), //
  WordData('bydło', diff: 4), //grupa zwierząt - grupa niekulturalnych ludzi
  WordData('całość'), //
  WordData('camping'), //
  WordData('cebula', diff: 6), //
  WordData('cedzak'), //
  WordData('cegła'), //
  WordData('cel'), //
  WordData('cela'), //
  WordData('celnik', diff: 2), //
  WordData('celownik', diff: 4), //karabin - przyrząd optyczny - przypadek (komu? czemu?)
  WordData('cena', diff: 6), //sklep - koszt - pieniądze
  WordData('cennik', diff: 3), //
  WordData('centrala'), //
  WordData('centrum'), //
  WordData('cenzura', diff: 1), //
  WordData('cera'), //
  WordData('cerata'), //
  WordData('cesarz'), //
  WordData('chaos'), //
  WordData('chata'), //
  WordData('chichot', diff: 3), //
  WordData('chipsy'), //
  WordData('chirurg'), //
  WordData('chleb'), //
  WordData('chlebak'), //
  WordData('chlew'), //
  WordData('chłop'), //
  WordData('chmiel'), //
  WordData('chmura'), //
  WordData('chochla'), //
  WordData('chodnik'), //
  WordData('choinka'), //
  WordData('chomik'), //
  WordData('chór'), //
  WordData('chorągiew'), //
  WordData('chrupki'), //
  WordData('chrust'), //
  WordData('chrzest'), //
  WordData('chudzielec'), //
  WordData('chuligan'), //
  WordData('chusta'), //
  WordData('chusteczka'), //
  WordData('chwast'), //
  WordData('chwyt'), //
  WordData('ciągły'), //
  WordData('ciągnik'), //
  WordData('ciało'), //
  WordData('ciastkarnia'), //
  WordData('ciastko'), //
  WordData('ciasto'), //
  WordData('ciąża', diff: 3), //
  WordData('ciecz'), //
  WordData('cielak'), //
  WordData('ciemnia'), //
  WordData('ciemność'), //
  WordData('cienkopis', diff: 3), //
  WordData('ciepło'), //
  WordData('cierń'), //
  WordData('cięcie'), //
  WordData('ciężar', diff: 4), //// duża waga - trud
  WordData('ciężarówka', diff: 3), //
  WordData('ciężki'), //
  WordData('cios'), //
  WordData('cisza'), //
  WordData('ciuciubabka'), //
  WordData('cmentarz'), //
  WordData('córka'), //
  WordData('cudzoziemiec'), //
  WordData('cukier'), //
  WordData('cukierek'), //
  WordData('cukiernica', diff: 3), //
  WordData('ćwiartka', diff: 4), //,// ćwiartka kurczaka - 1 / 4 - 250 ml wódki
  WordData('ćwiek', diff: 2), //
  WordData('cycki', diff: 3), //
  WordData('cyfra'), //
  WordData('cygan', diff: 6), //
  WordData('cygaro'), //
  WordData('cylinder'), //
  WordData('cyrk'), //
  WordData('cyrkiel'), //
  WordData('cysterna'), //
  WordData('cytat'), //
  WordData('cytryna'), //
  WordData('czajnik'), //
  WordData('czapka'), //
  WordData('czarnoziem', diff: 6), //ukraina - rola - rośliny
  WordData('czarodziej'), //
  WordData('czarownica'), //
  WordData('czas'), //
  WordData('czaszka'), //
  WordData('czcionka'), //
  WordData('czekolada'), //
  WordData('czepek'), //
  WordData('czereśnia'), //
  WordData('czerń'), //
  WordData('czerwień'), //
  WordData('człowiek'), //
  WordData('czołg', diff: 6), //
  WordData('czółno', diff: 1), //
  WordData('czoło'), //
  WordData('czosnek', diff: 6), //
  WordData('czubek'), //
  WordData('czujnik'), //
  WordData('czupryna', diff: 3), //
  WordData('czystka'), //
  WordData('czytelnia'), //
  WordData('dach'), //
  WordData('dachówka'), //
  WordData('dalekowidz'), //
  WordData('dalmatyńczyk', diff: 6), //101 dalmatynczyków - pies - zwierzę
  WordData('daltonista'), //
  WordData('dama'), //
  WordData('darmozjad'), //
  WordData('darowizna'), //
  WordData('debata'), //
  WordData('debiut'), //
  WordData('dedykacja'), //
  WordData('defensywa'), //
  WordData('dekalog'), //
  WordData('dekolt'), //
  WordData('dekoracja'), //
  WordData('delegacja', diff: 1), //
  WordData('delfin'), //
  WordData('demon'), //
  WordData('demonstracja', diff: 1), //
  WordData('dentysta'), //
  WordData('depilator', diff: 1), //
  WordData('deptak', diff: 2), //
  WordData('deser'), //
  WordData('deska', diff: 5), //drewno - pojazd - toaleta
  WordData('deskorolka'), //
  WordData('destrukcja'), //
  WordData('deszcz'), //
  WordData('detektyw'), //
  WordData('dętka'), //
  WordData('dezerter', diff: 1), //
  WordData('dezodorant', diff: 3), //
  WordData('diabeł'), //
  WordData('dialog'), //
  WordData('dieta'), //
  WordData('dinozaur', diff: 6), //prehistoria - zwierzę - olbrzym
  WordData('dioda'), //
  WordData('disco'), //
  WordData('dłoń'), //
  WordData('długopis'), //
  WordData('długość'), //
  WordData('dmuchawiec'), //
  WordData('dno', diff: 4), //żenada - spód akwenów wodnych
  WordData('doba'), //
  WordData('dobranocka'), //
  WordData('dobroczyńca', diff: 2), //
  WordData('dodatek'), //
  WordData('dodawanie'), //
  WordData('dogrywka'), //
  WordData('dojazd'), //
  WordData('dokładka'), //
  WordData('doktor', diff: 4), //stopień naukowy - lekarz
  WordData('dokument'), //
  WordData('dół', diff: 6), //kierunek - dolina w ziemi
  WordData('dolar', diff: 6), //waluta - USA - symbol
  WordData('dolina'), //
  WordData('dom'), //
  WordData('domator'), //
  WordData('domena', diff: 3), //
  WordData('domino'), //
  WordData('domofon'), //
  WordData('donica', diff: 6), //roślina - ogród - wazon
  WordData('doping', diff: 4), //zachęcanie do walki - używanie zakazanych substancji
  WordData('dorożka', diff: 6), //transport - koń
  WordData('dosięgnąć', diff: 2), //
  WordData('dostawa'), //
  WordData('doświadczenie'), //
  WordData('dotyk'), //
  WordData('dowcip'), //
  WordData('dowód'), //
  WordData('dowódca'), //
  WordData('dożywocie'), //
  WordData('drabina'), //
  WordData('dres'), //
  WordData('dreszczowiec', diff: 3), //
  WordData('drewno'), //
  WordData('droga'), //
  WordData('drogowskaz'), //
  WordData('dromader'), //
  WordData('dron'), //
  WordData('drops'), //
  WordData('drukarka'), //
  WordData('drukarnia', diff: 3), //
  WordData('drut'), //
  WordData('drużyna'), //
  WordData('drwal'), //
  WordData('dryf'), //
  WordData('drzazga'), //
  WordData('drzemka'), //
  WordData('drzewo', diff: 6), //
  WordData('drzwi'), //
  WordData('duch', diff: 6), //
  WordData('duet'), //
  WordData('duplikat'), //
  WordData('dusza', diff: 6), //
  WordData('dworzec'), //
  WordData('dwukropek', diff: 2), //
  WordData('dyktafon'), //
  WordData('dylemat', diff: 1), //
  WordData('dyliżans', diff: 3), //
  WordData('dym', diff: 6), //
  WordData('dymisja'), //
  WordData('dynamika'), //
  WordData('dynamit'), //
  WordData('dynamo', diff: 2), //
  WordData('dynia'), //
  WordData('dyscyplina'), //
  WordData('dysk', diff: 5), //
  WordData('dyskietka'), //
  WordData('dyskoteka'), //
  WordData('dyskwalifikacja', diff: 3), //
  WordData('dystrybucja', diff: 1), //
  WordData('dywan'), //
  WordData('dzban', diff: 4), //naczynie - debil
  WordData('dżdżownica'), //
  WordData('dziadek'), //
  WordData('działka'), //
  WordData('działo'), //
  WordData('dziczyzna'), //
  WordData('dzida'), //
  WordData('dziecko'), //
  WordData('dzielnica'), //
  WordData('dziennik'), //
  WordData('dziewczyna'), //
  WordData('dzikus'), //
  WordData('dziób'), //
  WordData('dziupla'), //
  WordData('dziura'), //
  WordData('dziurkacz'), //
  WordData('dżungla', diff: 6), //
  WordData('dzwon'), //
  WordData('dzwonnik', diff: 3), //
  WordData('echo'), //
  WordData('egipt'), //
  WordData('egoista', diff: 3), //
  WordData('egzamin'), //
  WordData('egzekucja', diff: 3), //
  WordData('ekierka'), //
  WordData('ekran'), //
  WordData('ekshumacja', diff: 1), //
  WordData('ekspedientka'), //
  WordData('ekspedycja', diff: 3), //
  WordData('eksplozja'), //
  WordData('eksponat'), //
  WordData('ekstradycja', diff: 1), //
  WordData('ekwipunek'), //
  WordData('elektronika'), //
  WordData('elektrownia'), //
  WordData('elektryk'), //
  WordData('elementarz'), //
  WordData('eliminacja', diff: 3), //
  WordData('elipsa'), //
  WordData('elita'), //
  WordData('emeryt'), //
  WordData('emigracja'), //
  WordData('emocje'), //
  WordData('encyklopedia'), //
  WordData('epicentrum', diff: 1), //
  WordData('erupcja'), //
  WordData('eskimos'), //
  WordData('eskorta', diff: 1), //
  WordData('estrada'), //
  WordData('etykieta'), //
  WordData('europa'), //
  WordData('eutanazja'), //
  WordData('ewakuacja'), //
  WordData('ewolucja'), //
  WordData('fabryka'), //
  WordData('facet'), //
  WordData('fajerwerki'), //
  WordData('fajka'), //
  WordData('fajtłapa'), //
  WordData('fakt'), //
  WordData('fala', diff: 5), //
  WordData('falstart'), //
  WordData('fałsz'), //
  WordData('farba'), //
  WordData('farma'), //
  WordData('farmer'), //
  WordData('fart'), //
  WordData('fartuch'), //
  WordData('fartuszek'), //
  WordData('fasola'), //
  WordData('fatamorgana'), //
  WordData('faul'), //
  WordData('ferie'), //
  WordData('ferma'), //
  WordData('festiwal'), //
  WordData('fiasko'), //
  WordData('fiolet'), //
  WordData('figa', diff: 4), //owoc - zaciśnięta pięść
  WordData('figura'), //
  WordData('fikołek'), //
  WordData('filar'), //
  WordData('filharmonia'), //
  WordData('filiżanka'), //
  WordData('film'), //
  WordData('filtr'), //
  WordData('finał'), //
  WordData('firanka'), //
  WordData('flaga'), //
  WordData('flaki', diff: 4), //danie - trzewia
  WordData('flakon'), //
  WordData('flamaster'), //
  WordData('flaming'), //
  WordData('flaszka'), //
  WordData('flegma', diff: 2), //
  WordData('flet'), //
  WordData('flirt'), //
  WordData('flota'), //
  WordData('folia'), //
  WordData('folklor'), //
  WordData('fontanna'), //
  WordData('foremka'), //
  WordData('formularz'), //
  WordData('formuła'), //
  WordData('forsa'), //
  WordData('forteca'), //
  WordData('fortepian'), //
  WordData('fortuna'), //
  WordData('fosa'), //
  WordData('fotel'), //
  WordData('fotograf'), //
  WordData('fotografia'), //
  WordData('fotokomórka', diff: 1), //
  WordData('fotomontaż', diff: 1), //
  WordData('fragment'), //
  WordData('francja'), //
  WordData('frędzel', diff: 2), //
  WordData('frytki'), //
  WordData('fryzjerka'), //
  WordData('fryzura'), //
  WordData('fujara', diff: 6), //
  WordData('furgonetka'), //
  WordData('furmanka'), //
  WordData('furtka'), //
  WordData('fusy'), //
  WordData('futerał'), //
  WordData('futro'), //
  WordData('futryna'), //
  WordData('gąbka'), //
  WordData('gablota', diff: 3), //
  WordData('gacie'), //
  WordData('gaduła'), //
  WordData('galaktyka'), //
  WordData('galareta'), //
  WordData('galeria'), //
  WordData('galop'), //
  WordData('gang'), //
  WordData('gangster'), //
  WordData('gapa'), //
  WordData('garaż'), //
  WordData('garb'), //
  WordData('garbus', diff: 4), //samochód - osoba
  WordData('garderoba'), //
  WordData('gardło'), //
  WordData('garncarz', diff: 3), //
  WordData('garnek'), //
  WordData('garnitur'), //
  WordData('garnuszek'), //
  WordData('gąsienica'), //
  WordData('gaśnica'), //
  WordData('gaz'), //
  WordData('gazda'), //
  WordData('gazeta'), //
  WordData('gazociąg'), //
  WordData('gdańsk'), //
  WordData('gdynia'), //
  WordData('generał'), //
  WordData('geniusz'), //
  WordData('geometria'), //
  WordData('gepard'), //
  WordData('gęś'), //
  WordData('giełda'), //
  WordData('giermek'), //
  WordData('gilotyna'), //
  WordData('gimnazjum'), //
  WordData('gimnastyka'), //
  WordData('gips'), //
  WordData('gitara'), //
  WordData('gladiator'), //
  WordData('gładki'), //
  WordData('głębia'), //
  WordData('globus'), //
  WordData('głodówka'), //
  WordData('głos'), //
  WordData('głośnik'), //
  WordData('głosowanie'), //
  WordData('głowa'), //
  WordData('głuchoniemy', diff: 2), //
  WordData('głuchy'), //
  WordData('gniazdo'), //
  WordData('gniew'), //
  WordData('gnojówka'), //
  WordData('gobelin', diff: 1), //
  WordData('godło'), //
  WordData('godzina'), //
  WordData('gogle'), //
  WordData('gol'), //
  WordData('golarka'), //
  WordData('golas'), //
  WordData('golf'), //
  WordData('gołąb'), //
  WordData('gonitwa'), //
  WordData('góra'), //
  WordData('gorączka'), //
  WordData('góral'), //
  WordData('górnik'), //
  WordData('gorzelnia'), //
  WordData('gorycz'), //
  WordData('gość'), //
  WordData('gościnność'), //
  WordData('gospoda'), //
  WordData('gosposia'), //
  WordData('gotowość'), //
  WordData('gra', diff: 5), //
  WordData('grabarz'), //
  WordData('grabie'), //
  WordData('gracz'), //
  WordData('grad'), //
  WordData('gradobicie'), //
  WordData('graffiti'), //
  WordData('gramofon'), //
  WordData('granat', diff: 4), //owoc - ładunek wybuchowy
  WordData('granica'), //
  WordData('gratulacje'), //
  WordData('grawitacja'), //
  WordData('grill'), //
  WordData('grób'), //
  WordData('grobowiec'), //
  WordData('groch'), //
  WordData('grochówka'), //
  WordData('grom'), //
  WordData('grosz'), //
  WordData('grubas'), //
  WordData('gruszka', diff: 4), //owoc - urządzenie
  WordData('grymas'), //
  WordData('gryzmoły'), //
  WordData('gryzoń'), //
  WordData('grzbiet'), //
  WordData('grzebień'), //
  WordData('grzechotka'), //
  WordData('grzejnik'), //
  WordData('grzmot'), //
  WordData('grzyb', diff: 4), //organizm - osoba znguśniała
  WordData('grzybobranie'), //
  WordData('grzywa'), //
  WordData('grzywna'), //
  WordData('guma'), //
  WordData('gumka'), //
  WordData('guzik'), //
  WordData('gwarancja'), //
  WordData('gwiazda', diff: 4), //obiekt astronomiczny - znana osoba
  WordData('gwiazdor'), //
  WordData('gwiazdozbiór'), //
  WordData('gwinea'), //
  WordData('gwint', diff: 4), //szyjka butelki - gra karciana z Wiedźmina
  WordData('gwizd'), //
  WordData('gwizdek'), //
  WordData('gwóźdź'), //
  WordData('haczyk'), //
  WordData('hałas'), //
  WordData('halogen', diff: 1), //
  WordData('hamak'), //
  WordData('hamburger'), //
  WordData('hamulec'), //
  WordData('handel'), //
  WordData('hangar'), //
  WordData('harakiri', diff: 2), //
  WordData('harcerz'), //
  WordData('harfa'), //
  WordData('harmonia', diff: 4), //balans - instrument
  WordData('harmonijka'), //
  WordData('harpun'), //
  WordData('hashtag'), //
  WordData('hasło'), //
  WordData('hazard'), //
  WordData('hejnał'), //
  WordData('hejter'), //
  WordData('helikopter'), //
  WordData('hełm'), //
  WordData('herb'), //
  WordData('herbata'), //
  WordData('herbatnik'), //
  WordData('heroina', diff: 6), //
  WordData('hetman', diff: 6), //
  WordData('hierarchia'), //
  WordData('hieroglif'), //
  WordData('higiena'), //
  WordData('himalaje'), //
  WordData('hipis'), //
  WordData('hipnoza'), //
  WordData('hipopotam'), //
  WordData('historia', diff: 6), //
  WordData('hodowca'), //
  WordData('hodowla'), //
  WordData('hojny'), //
  WordData('hokeista'), //
  WordData('hokej'), //
  WordData('holownik'), //
  WordData('horoskop'), //
  WordData('horror'), //
  WordData('horyzont'), //
  WordData('hostessa', diff: 3), //
  WordData('hotdog'), //
  WordData('hotel'), //
  WordData('hulajnoga'), //
  WordData('huragan'), //
  WordData('hurtownia'), //
  WordData('huśtawka'), //
  WordData('hydrant'), //
  WordData('identyfikator'), //
  WordData('idol'), //
  WordData('iglica'), //
  WordData('igła', diff: 4), //rodzaj liścia - narzędzie do szycia
  WordData('igloo'), //
  WordData('igrzyska'), //
  WordData('ikona'), //
  WordData('iloczyn'), //
  WordData('iloraz'), //
  WordData('imadło', diff: 1), //
  WordData('imbryk', diff: 2), //
  WordData('imieniny'), //
  WordData('import'), //
  WordData('impuls'), //
  WordData('indianin', diff: 6), //
  WordData('indyk'), //
  WordData('inicjał', diff: 2), //
  WordData('instrukcja'), //
  WordData('instrument'), //
  WordData('inteligencja'), //
  WordData('interpunkcja', diff: 1), //
  WordData('inwalida'), //
  WordData('inwazja'), //
  WordData('inżynier'), //
  WordData('iskra'), //
  WordData('izba'), //
  WordData('izolacja'), //
  WordData('jabłecznik'), //
  WordData('jabłko'), //
  WordData('jabłoń'), //
  WordData('jacht'), //
  WordData('jadalnia'), //
  WordData('jadłospis'), //
  WordData('jądro', diff: 4), //środek czegoś - część organu płciowego
  WordData('jagoda'), //
  WordData('jaguar'), //
  WordData('jajecznica'), //
  WordData('jajko'), //
  WordData('jamnik'), //
  WordData('japonki'), //
  WordData('jarmark'), //
  WordData('jarosz'), //
  WordData('jaskinia'), //
  WordData('jaskiniowiec'), //
  WordData('jasność'), //
  WordData('jasnowidz'), //
  WordData('jaszczurka'), //
  WordData('jazda', diff: 6), //
  WordData('jednorożec'), //
  WordData('jednoślad', diff: 3), //
  WordData('jedynak'), //
  WordData('jedzenie'), //
  WordData('jeleń', diff: 4), //zwierzę - idiota
  WordData('jelito'), //
  WordData('jesień'), //
  WordData('jezioro'), //
  WordData('język'), //
  WordData('jojo'), //
  WordData('jubiler'), //
  WordData('junior'), //
  WordData('kabaret'), //
  WordData('kabel'), //
  WordData('kabina'), //
  WordData('kabriolet'), //
  WordData('kaczka'), //
  WordData('kafelek'), //
  WordData('kaftan'), //
  WordData('kaganiec', diff: 3), //
  WordData('kajak'), //
  WordData('kajdanki'), //
  WordData('kaktus'), //
  WordData('kałamarz'), //
  WordData('kalambury', diff: 3), //
  WordData('kalendarz'), //
  WordData('kalesony'), //
  WordData('kalkulator'), //
  WordData('kaloryfer'), //
  WordData('kalosze'), //
  WordData('kameleon'), //
  WordData('kamera'), //
  WordData('kamień'), //
  WordData('kamikadze'), //
  WordData('kamizelka'), //
  WordData('kampania'), //
  WordData('kamyk'), //
  WordData('kanał', diff: 4), //program telewizyjny - sztuczna rzeka
  WordData('kanapka'), //
  WordData('kangur'), //
  WordData('kant', diff: 4), //filozof - róg mebla
  WordData('kantor'), //
  WordData('kapeć'), //
  WordData('kapelusz'), //
  WordData('kąpiel'), //
  WordData('kąpielówki'), //
  WordData('kapitał'), //
  WordData('kapitan'), //
  WordData('kapłan'), //
  WordData('kaptur'), //
  WordData('kapusta'), //
  WordData('karabin'), //
  WordData('karate'), //
  WordData('karawana'), //
  WordData('karciarz'), //
  WordData('karczma'), //
  WordData('karetka'), //
  WordData('karmnik'), //
  WordData('karoseria'), //
  WordData('karta', diff: 5), //do gry - zakładka w przeglądarce - kredytowa
  WordData('karton'), //
  WordData('karuzela'), //
  WordData('karykatura', diff: 3), //
  WordData('karzeł'), //
  WordData('kasa', diff: 4), //pieniądze - fiskalna
  WordData('kaseta'), //
  WordData('kasjerka'), //
  WordData('kask'), //
  WordData('kaskader'), //
  WordData('kasownik'), //
  WordData('kasztan'), //
  WordData('kat'), //
  WordData('kąt', diff: 4), //miara rozwarcia - miejsce w domu
  WordData('katapulta'), //
  WordData('katarynka'), //
  WordData('katastrofa'), //
  WordData('katecheta'), //
  WordData('kątomierz'), //
  WordData('kawaler'), //
  WordData('kawał', diff: 4), //duży kawałek - dowcip
  WordData('kciuk'), //
  WordData('kelner'), //
  WordData('kibic'), //
  WordData('kibol'), //
  WordData('kiełbasa', diff: 6), //
  WordData('kielich'), //
  WordData('kieliszek', diff: 6), //
  WordData('kierowca'), //
  WordData('kierownica'), //
  WordData('kierunek'), //
  WordData('kierunkowskaz'), //
  WordData('kieszeń'), //
  WordData('kieszonkowiec'), //
  WordData('kij'), //
  WordData('kilof'), //
  WordData('kimono'), //
  WordData('kineskop', diff: 3), //
  WordData('kino'), //
  WordData('kiosk'), //
  WordData('klakson'), //
  WordData('kłamca'), //
  WordData('klamka'), //
  WordData('kłamstwo'), //
  WordData('klapki'), //
  WordData('klaps'), //
  WordData('klasa'), //
  WordData('klaser'), //
  WordData('klasówka'), //
  WordData('klasztor'), //
  WordData('klatka'), //
  WordData('klaun'), //
  WordData('klawiatura'), //
  WordData('klawisz'), //
  WordData('kłębek'), //
  WordData('klęcznik'), //
  WordData('klej'), //
  WordData('klejnot'), //
  WordData('klekot'), //
  WordData('kleks'), //
  WordData('klepsydra'), //
  WordData('kleszcze', diff: 4), //
  WordData('klient'), //
  WordData('klif'), //
  WordData('klips'), //
  WordData('klisza'), //
  WordData('klocek', diff: 5), //zabawka - kupa - część hamulca
  WordData('kłoda'), //
  WordData('kłódka'), //
  WordData('klon'), //
  WordData('klosz'), //
  WordData('kłótnia'), //
  WordData('klucz', diff: 5), //narzędzie - część zamka - kluczyć
  WordData('kłusownik'), //
  WordData('kobieta'), //
  WordData('kobra'), //
  WordData('kod', diff: 5), //szyfr - kod kreskowy / pocztowy - program komputerowy
  WordData('kogut'), //
  WordData('kok'), //
  WordData('kokarda'), //
  WordData('koks'), //
  WordData('koktajl'), //
  WordData('kolacja'), //
  WordData('kolano', diff: 4), //zgięcie rury - cześć nogi
  WordData('kolarz'), //
  WordData('kolczyk'), //
  WordData('kołdra'), //
  WordData('kolec'), //
  WordData('kolęda'), //
  WordData('kolej'), //
  WordData('kolejka', diff: 5), //górska - pociąg - szereg ludzi
  WordData('kolekcja'), //
  WordData('kolekcjoner'), //
  WordData('kolia'), //
  WordData('kolizja'), //
  WordData('kołnierz'), //
  WordData('koło', diff: 5), //kształt - opona - osiedle Warszawy
  WordData('kolor'), //
  WordData('kolorowanka'), //
  WordData('kołowrotek', diff: 3), //
  WordData('kolumna'), //
  WordData('kołyska'), //
  WordData('komar'), //
  WordData('kombajn', diff: 3), //
  WordData('kombinerki'), //
  WordData('kombinezon', diff: 3), //
  WordData('kometa'), //
  WordData('komiks'), //
  WordData('komin'), //
  WordData('kominiarka'), //
  WordData('kominiarz'), //
  WordData('komórka'), //
  WordData('kompas'), //
  WordData('komplet'), //
  WordData('kompot'), //
  WordData('kompozytor'), //
  WordData('komputer'), //
  WordData('komunikacja'), //
  WordData('koń', diff: 6), //
  WordData('kończyć'), //
  WordData('konduktor'), //
  WordData('konewka'), //
  WordData('konfesjonał'), //
  WordData('koniczyna'), //
  WordData('koniec'), //
  WordData('konserwa'), //
  WordData('kontrast'), //
  WordData('kontrola'), //
  WordData('kontynent'), //
  WordData('kopalnia'), //
  WordData('koparka'), //
  WordData('koperta'), //
  WordData('kopia'), //
  WordData('kopniak'), //
  WordData('kopyto'), //
  WordData('koralik'), //
  WordData('korba'), //
  WordData('korek', diff: 4), //kolejka samochodów - zatyczka
  WordData('kornik'), //
  WordData('korona'), //
  WordData('koronawirus', diff: 6), //
  WordData('koronka'), //
  WordData('korrida', diff: 1), //
  WordData('korytarz'), //
  WordData('koryto'), //
  WordData('korzeń'), //
  WordData('kosa'), //
  WordData('kość'), //
  WordData('kościotrup'), //
  WordData('kosmita'), //
  WordData('kosmos'), //
  WordData('kostium'), //
  WordData('kostka'), //
  WordData('kosz'), //
  WordData('koszmar'), //
  WordData('koszula'), //
  WordData('koszyk'), //
  WordData('koszykówka'), //
  WordData('kot', diff: 4), //zwierzę - ktoś nowy
  WordData('kotlet'), //
  WordData('kotłownia'), //
  WordData('kotwica'), //
  WordData('kowboj'), //
  WordData('kozak', diff: 5), //wojownik - ktoś odważny - grzyb - but
  WordData('kozioł'), //
  WordData('kraj'), //
  WordData('kraków', diff: 6), //
  WordData('kran'), //
  WordData('krasnal'), //
  WordData('krata'), //
  WordData('krawat'), //
  WordData('krawcowa', diff: 2), //
  WordData('krawężnik'), //
  WordData('krążek'), //
  WordData('kreda'), //
  WordData('kręgle'), //
  WordData('krem'), //
  WordData('kreska'), //
  WordData('kret'), //
  WordData('krew'), //
  WordData('krok'), //
  WordData('krokodyl'), //
  WordData('król'), //
  WordData('królewna'), //
  WordData('królik'), //
  WordData('kromka'), //
  WordData('kropidło'), //
  WordData('kropka'), //
  WordData('kropla', diff: 6), //
  WordData('krótkofalówka'), //
  WordData('krótkowidz'), //
  WordData('krowa'), //
  WordData('krwiodawca'), //
  WordData('krwiopijca'), //
  WordData('kryjówka'), //
  WordData('krzak'), //
  WordData('krzesło'), //
  WordData('krzyk'), //
  WordData('krzyż'), //
  WordData('krzyżówka'), //
  WordData('ksiądz'), //
  WordData('książka'), //
  WordData('księgarnia'), //
  WordData('księżyc'), //
  WordData('kształt'), //
  WordData('kubek'), //
  WordData('kucharz'), //
  WordData('kufel'), //
  WordData('kujon'), //
  WordData('kukułka'), //
  WordData('kukurydza'), //
  WordData('kula'), //
  WordData('kulig'), //
  WordData('kura', diff: 6), //
  WordData('kurier'), //
  WordData('kurczak'), //
  WordData('kurnik'), //
  WordData('kurs'), //
  WordData('kurtyna'), //
  WordData('kurz'), //
  WordData('kusza'), //
  WordData('kwadrat'), //
  WordData('kwas', diff: 5), //substancja chemiczna - przykra sytuacja - narkotyki
  WordData('kwiat'), //
  WordData('labirynt'), //
  WordData('laboratorium'), //
  WordData('ład'), //
  WordData('lada'), //
  WordData('ładunek'), //
  WordData('lakier'), //
  WordData('łakomczuch'), //
  WordData('lalka'), //
  WordData('łamigłówka'), //
  WordData('lampa'), //
  WordData('łańcuch'), //
  WordData('łapówka'), //
  WordData('las'), //
  WordData('laser'), //
  WordData('laska'), //
  WordData('łaskotki'), //
  WordData('lasso'), //
  WordData('latarka'), //
  WordData('latarnia'), //
  WordData('latawiec'), //
  WordData('lato'), //
  WordData('lawa'), //
  WordData('ława'), //
  WordData('łazienka'), //
  WordData('łeb'), //
  WordData('legenda'), //
  WordData('lejce', diff: 2), //
  WordData('lej'), //
  WordData('lęk'), //
  WordData('lekarz'), //
  WordData('leming', diff: 4), //warszawiak - zwierzę
  WordData('lemoniada'), //
  WordData('lep', diff: 2), //
  WordData('lew'), //
  WordData('lewitacja'), //
  WordData('leżak'), //
  WordData('licytacja'), //
  WordData('liczba'), //
  WordData('licznik'), //
  WordData('liczydło'), //
  WordData('limuzyna'), //
  WordData('linia'), //
  WordData('linijka'), //
  WordData('linoskoczek', diff: 1), //
  WordData('lis'), //
  WordData('liść'), //
  WordData('list', diff: 6), //
  WordData('listonosz'), //
  WordData('litera'), //
  WordData('litr'), //
  WordData('lizak'), //
  WordData('lód', diff: 6), //
  WordData('lodołamacz', diff: 1), //
  WordData('lodowisko'), //
  WordData('lodówka'), //
  WordData('lody', diff: 6), //
  WordData('łodyga'), //
  WordData('łódź', diff: 4), //miasto - statek
  WordData('lodziarnia'), //
  WordData('łokieć'), //
  WordData('lokomotywa'), //
  WordData('lokówka'), //
  WordData('lont'), //
  WordData('łopata'), //
  WordData('lornetka'), //
  WordData('losowanie'), //
  WordData('lot'), //
  WordData('loteria'), //
  WordData('lotnia', diff: 2), //
  WordData('lotnisko'), //
  WordData('łóżko'), //
  WordData('lufa'), //
  WordData('łuk'), //
  WordData('lunatyk', diff: 3), //
  WordData('luneta'), //
  WordData('lupa'), //
  WordData('łupież'), //
  WordData('łuska'), //
  WordData('lustro'), //
  WordData('lutownica'), //
  WordData('łysina'), //
  WordData('łyżka'), //
  WordData('łyżwa'), //
  WordData('łza'), //
  WordData('maczuga'), //
  WordData('magik'), //
  WordData('magister'), //
  WordData('magnes'), //
  WordData('magnetofon'), //
  WordData('majonez'), //
  WordData('majster'), //
  WordData('majtki'), //
  WordData('mak'), //
  WordData('makaron'), //
  WordData('malarz'), //
  WordData('malina'), //
  WordData('małpa', diff: 4), //zwierzę - złośliwie o kobiecie
  WordData('maluch', diff: 4), //dziecko - samochód
  WordData('małżeństwo'), //
  WordData('mandat'), //
  WordData('manekin'), //
  WordData('mango'), //
  WordData('mapa'), //
  WordData('maraton'), //
  WordData('marchew'), //
  WordData('margines'), //
  WordData('mars', diff: 4), //planeta - baton
  WordData('marsz'), //
  WordData('marzenie'), //
  WordData('masa'), //
  WordData('masakra'), //
  WordData('masaż'), //
  WordData('maść', diff: 4), // maść konia - maść do smarowania
  WordData('maseczka'), //
  WordData('maska'), //
  WordData('maskotka'), //
  WordData('masło'), //
  WordData('maszt'), //
  WordData('maszyna'), //
  WordData('materac'), //
  WordData('materia'), //
  WordData('matka'), //
  WordData('mazak'), //
  WordData('mebel'), //
  WordData('medal'), //
  WordData('meksykanin'), //
  WordData('metka'), //
  WordData('metro', diff: 6), //książka/gra - pociąg pod ziemią -
  WordData('mickiewicz'), //
  WordData('miękki'), //
  WordData('mięsień'), //
  WordData('mięso'), //
  WordData('mikrofala', diff: 6), //AGD - fala elektromagnetyczna - kuchnia
  WordData('mikrofon'), //
  WordData('mikroskop'), //
  WordData('mikser'), //
  WordData('mikstura'), //
  WordData('milczenie'), //
  WordData('miliard'), //
  WordData('miłość'), //
  WordData('mina', diff: 4), //bomba - wyraz twarzy
  WordData('miniatura'), //
  WordData('miód'), //
  WordData('miotła'), //
  WordData('miś'), //
  WordData('miska'), //
  WordData('mleko'), //
  WordData('młodość'), //
  WordData('młot', diff: 4), //narzędzie - osoba
  WordData('młyn'), //
  WordData('mnich'), //
  WordData('mniejszość'), //
  WordData('mnożenie'), //
  WordData('moc'), //// 4potęga - miara fizyczna
  WordData('moda', diff: 4), //miara statystyczna - fashion
  WordData('model', diff: 5), //zawód - system założeń - projekt plastyczny
  WordData('modlitwa'), //
  WordData('mogiła'), //
  WordData('mokry'), //
  WordData('molo'), //
  WordData('moneta', diff: 6), //
  WordData('monitor'), //
  WordData('morderca'), //
  WordData('morze', diff: 6), //
  WordData('moskwa'), //
  WordData('most'), //
  WordData('motocykl'), //
  WordData('motor'), //
  WordData('motyka', diff: 6), //
  WordData('motyl'), //
  WordData('mozaika', diff: 2), //
  WordData('mózg', diff: 6), //
  WordData('mrowisko'), //
  WordData('mrówka'), //
  WordData('mrówkojad'), //
  WordData('mróz'), //
  WordData('mucha'), //
  WordData('muchomor'), //
  WordData('mumia'), //
  WordData('mundur'), //
  WordData('mundurek', diff: 4), //skóra ziemniaka - ubranie
  WordData('mur'), //
  WordData('murarz'), //
  WordData('murzyn'), //
  WordData('muszla', diff: 4), //ślimak - kibel
  WordData('musztarda', diff: 3), //
  WordData('muzeum'), //
  WordData('muzyka'), //
  WordData('mydelniczka', diff: 3), //
  WordData('mydło'), //
  WordData('myjnia'), //
  WordData('myśleć'), //
  WordData('myśliwy'), //
  WordData('mysz', diff: 4), //zwierzę - mysz komputerowa
  WordData('nabój'), //
  WordData('nacisk'), //
  WordData('nadajnik'), //
  WordData('nadawca'), //
  WordData('nadmiar'), //
  WordData('nadwaga'), //
  WordData('nagroda'), //
  WordData('naklejka'), //
  WordData('nakrętka'), //
  WordData('naleśnik'), //
  WordData('nałóg'), //
  WordData('nalot', diff: 5), //samolot - wjazd na chatę - warstwa na powierzchni
  WordData('namiot'), //
  WordData('napój'), //
  WordData('narty'), //
  WordData('następca'), //
  WordData('naszyjnik'), //
  WordData('nauczyciel'), //
  WordData('nawias'), //
  WordData('negatyw'), //
  WordData('nekrolog'), //
  WordData('nerka'), //
  WordData('nić', diff: 6), //krawiectwo - nić porozumienia
  WordData('niebieski'), //
  WordData('niebo'), //
  WordData('niedźwiedź'), //
  WordData('niski'), //
  WordData('nocnik'), //
  WordData('noga', diff: 5), //kończyna - podparcie mebli - słabeusz
  WordData('nosze'), //
  WordData('notatnik'), //
  WordData('notes'), //
  WordData('nowożeńcy'), //
  WordData('nowy'), //
  WordData('nóż'), //
  WordData('nożyce'), //
  WordData('numer', diff: 4), //liczba - żart
  WordData('nurek'), //
  WordData('nuta', diff: 5), //piosenka - element muzyczny - smak
  WordData('obcas'), //
  WordData('obiad'), //
  WordData('obiektyw'), //
  WordData('objazd'), //
  WordData('obornik'), //
  WordData('obowiązek'), //
  WordData('obrączka'), //
  WordData('obraz'), //
  WordData('obrona'), //
  WordData('obrót'), //
  WordData('obrus'), //
  WordData('obserwator'), //
  WordData('obsługa'), //
  WordData('obstawa', diff: 3), //
  WordData('obudowa'), //
  WordData('obwarzanek'), //
  WordData('obwodnica'), //
  WordData('ocean'), //
  WordData('ochrona'), //
  WordData('oczko', diff: 5), //oko - gra - tłuszcz w zupie - akwen
  WordData('odbiorca'), //
  WordData('odbiornik'), //
  WordData('odcisk'), //
  WordData('oddech'), //
  WordData('oddział', diff: 4), //wojsko - dział
  WordData('odjazd'), //
  WordData('odkrycie'), //
  WordData('odkurzacz'), //
  WordData('odpoczynek'), //
  WordData('odpowiedź'), //
  WordData('odra', diff: 5), //rzeka - choroba
  WordData('odwet'), //
  WordData('odzież'), //
  WordData('odznaka'), //
  WordData('ogień'), //
  WordData('ogłoszenie'), //
  WordData('ognisko'), //
  WordData('ogniwo'), //
  WordData('ogon', diff: 6), //
  WordData('ogórek'), //
  WordData('ogród'), //
  WordData('ogryzek'), //
  WordData('okienko', diff: 4), //szyba - okno w komputerze
  WordData('okładka'), //
  WordData('oklaski'), //
  WordData('okno'), //
  WordData('oko'), //
  WordData('okrąg'), //
  WordData('okręt'), //
  WordData('okruch'), //
  WordData('okrzyk'), //
  WordData('okulary'), //
  WordData('okulista'), //
  WordData('olbrzym'), //
  WordData('olej'), //
  WordData('oliwa'), //
  WordData('ołówek'), //
  WordData('ołtarz'), //
  WordData('omlet'), //
  WordData('oparcie', diff: 4), //element krzesła - wsparcie
  WordData('opaska'), //
  WordData('opatrunek'), //
  WordData('opiekun'), //
  WordData('opona'), //
  WordData('orbita'), //
  WordData('order'), //
  WordData('organy', diff: 4), //instrument - narządy wewnętrzne
  WordData('orkiestra'), //
  WordData('oryginał'), //
  WordData('orzech'), //
  WordData('orzeł'), //
  WordData('oscypek'), // 7
  WordData('osiedle'), //
  WordData('osoba'), //
  WordData('ostateczność', diff: 3), //
  WordData('ostry'), //
  WordData('oszczep'), //
  WordData('ośmiornica'), //
  WordData('otwieracz'), //
  WordData('otwór'), //
  WordData('owad'), //
  WordData('owca'), //
  WordData('owoc'), //
  WordData('ozdoba'), //
  WordData('pacha'), //
  WordData('pachołek'), //
  WordData('pacierz'), //
  WordData('pacjent'), //
  WordData('pacyfista'), //
  WordData('paczka'), //
  WordData('pączek'), //
  WordData('pagórek'), //
  WordData('pajac'), //
  WordData('pająk'), //
  WordData('pałac'), //
  WordData('palacz'), //
  WordData('palarnia'), //
  WordData('palec'), //
  WordData('paleta'), //
  WordData('paliwo'), //
  WordData('palma', diff: 6), //
  WordData('paluszki'), //
  WordData('pan'), //
  WordData('pancerz'), //
  WordData('panika'), //
  WordData('panna'), //
  WordData('pantofel'), //
  WordData('papier'), //
  WordData('papieros'), //
  WordData('paproć'), //
  WordData('papryka'), //
  WordData('papuga'), //
  WordData('paraliż'), //
  WordData('parapet'), //
  WordData('parasol'), //
  WordData('parawan'), //
  WordData('parkiet'), //
  WordData('parking'), //
  WordData('parowiec'), //
  WordData('parowóz'), //
  WordData('partner'), //
  WordData('paryż'), //
  WordData('pas'), //
  WordData('pasażer'), //
  WordData('pasta'), //
  WordData('pasterz'), //
  WordData('paszport'), //
  WordData('patelnia'), //
  WordData('patrol'), //
  WordData('patyk'), //
  WordData('pauza', diff: 4), //przerwa - przerwa w muzyce
  WordData('paw'), //
  WordData('paznokieć'), //
  WordData('pazur'), //
  WordData('pchła'), //
  WordData('pech'), //
  WordData('pęcherz'), //
  WordData('pechowiec'), //
  WordData('pędzel'), //
  WordData('pegaz'), //
  WordData('pełnia'), //
  WordData('pensja'), //
  WordData('pępek'), //
  WordData('perfumy'), //
  WordData('perkusja'), //
  WordData('peron'), //
  WordData('perspektywa'), //
  WordData('peruka'), //
  WordData('peryskop'), //
  WordData('pestka'), //
  WordData('petarda'), //
  WordData('pewny'), //
  WordData('pętla', diff: 4), //supeł - autobusowa
  WordData('piana'), //
  WordData('pianino'), //
  WordData('piasek'), //
  WordData('piaskownica'), //
  WordData('piec'), //
  WordData('pieczarka'), //
  WordData('pieczątka'), //
  WordData('pieczeń'), //
  WordData('pieczywo'), //
  WordData('piegi'), //
  WordData('piekarnia'), //
  WordData('piekarz'), //
  WordData('piekło'), //
  WordData('pielucha'), //
  WordData('pień'), //
  WordData('pieniądze'), //
  WordData('pierogi'), //
  WordData('pierś'), //
  WordData('pierścień'), //
  WordData('pies', diff: 6), //przyjaciel - zwierzę
  WordData('pięść'), //
  WordData('pieszy'), //
  WordData('pięta'), //
  WordData('piętro'), //
  WordData('pietruszka'), //
  WordData('pigułka'), //
  WordData('pijak'), //
  WordData('pikieta'), //
  WordData('piła'), //
  WordData('piłka', diff: 4), //mała piła - zabawka
  WordData('piłkarz'), //
  WordData('pilot'), //
  WordData('pinezka'), //
  WordData('pingwin'), //
  WordData('pion', diff: 4), //kierunek - pionek
  WordData('pionek'), //
  WordData('piórnik'), //
  WordData('pióro'), //
  WordData('pióropusz'), //
  WordData('piorun'), //
  WordData('piosenka'), //
  WordData('piramida'), //
  WordData('pirat', diff: 6), //
  WordData('piruet'), //
  WordData('pisanka'), //
  WordData('pisarz'), //
  WordData('pisklę'), //
  WordData('pistolet'), //
  WordData('piwnica'), //
  WordData('piwo'), //
  WordData('piżama'), //
  WordData('pizza'), //
  WordData('plac'), //
  WordData('placek'), //
  WordData('płacz'), //
  WordData('plagiat'), //
  WordData('plakat'), //
  WordData('plakietka', diff: 3), //
  WordData('plama'), //
  WordData('plan'), //
  WordData('planeta'), //
  WordData('plansza'), //
  WordData('plaster'), //
  WordData('platforma'), //
  WordData('plaża'), //
  WordData('plebania'), //
  WordData('plecak'), //
  WordData('plecy'), //
  WordData('płetwa'), //
  WordData('plomba'), //
  WordData('płomień'), //
  WordData('plon'), //
  WordData('płot'), //
  WordData('plotka'), //
  WordData('plusk'), //
  WordData('pluskwa', diff: 4), //insekt - podsłuch
  WordData('płyn'), //
  WordData('płyta'), //
  WordData('pływak'), //
  WordData('pobocze'), //
  WordData('pobudka'), //
  WordData('pocałunek'), //
  WordData('pochylnia'), //
  WordData('pociąg'), //
  WordData('pocisk'), //
  WordData('początek'), //
  WordData('poczta'), //
  WordData('podarunek'), //
  WordData('podatek'), //
  WordData('podbródek'), //
  WordData('podbrzusze'), //
  WordData('poddasze'), //
  WordData('podeszwa'), //
  WordData('podgłówek'), //
  WordData('podkładka'), //
  WordData('podkolanówki'), //
  WordData('podkop'), //
  WordData('podkowa'), //
  WordData('podkreślenie', diff: 2), //
  WordData('podkład'), //
  WordData('podłoga'), //
  WordData('podpis'), //
  WordData('podpórka'), //
  WordData('podróżnik'), //
  WordData('poduszka'), //
  WordData('podwozie'), //
  WordData('podział'), //
  WordData('pogłoska'), //
  WordData('pogoda'), //
  WordData('pogotowie'), //
  WordData('pogrzeb'), //
  WordData('pojazd'), //
  WordData('pokarm'), //
  WordData('pokład'), //
  WordData('pokłon'), //
  WordData('pokój', diff: 4), //pomieszczenie - brak wojny
  WordData('pokrętło', diff: 4), //
  WordData('pokrywka'), //
  WordData('pole', diff: 4), //łąka - fragment szachownicy
  WordData('polewa'), //
  WordData('policjant'), //
  WordData('policzek'), //
  WordData('polityk'), //
  WordData('polska'), //
  WordData('półka'), //
  WordData('półkula', diff: 5), //obszar kuli ziemskiej - połowa kuli - część mózgu
  WordData('północ', diff: 4), //kierunek - godzina
  WordData('połowa'), //
  WordData('polowanie'), //
  WordData('półprosta', diff: 2), //
  WordData('południe'), //
  WordData('półwysep'), //
  WordData('pomarańcza'), //
  WordData('pomidor'), //
  WordData('pomnik'), //
  WordData('pomoc'), //
  WordData('pomost'), //
  WordData('pompka'), //
  WordData('popielniczka'), //
  WordData('popiersie'), //
  WordData('popiół'), //
  WordData('poprzeczka'), //
  WordData('poprzednik'), //
  WordData('porażka'), //
  WordData('portfel'), //
  WordData('portki'), //
  WordData('portret'), //
  WordData('porzeczka'), //
  WordData('pościel'), //
  WordData('pośladek'), //
  WordData('poślizg', diff: 4), //opóźnienie - poślizgnięcie się na czymś (np. lodzie)
  WordData('potok'), //
  WordData('potwór'), //
  WordData('powaga'), //
  WordData('powieka'), //
  WordData('powódź'), //
  WordData('powóz'), //
  WordData('powrót'), //
  WordData('powstanie'), //
  WordData('pożar'), //
  WordData('poziom', diff: 5), //kierunek - etap w grze - wysokość
  WordData('pozostawiać'), //
  WordData('poznań', diff: 6), //
  WordData('pozytywka', diff: 2), //
  WordData('praca'), //
  WordData('prąd', diff: 4), //elektryczność - wartki strumnień
  WordData('pralka'), //
  WordData('prasa'), //
  WordData('prawo'), //
  WordData('prędkość'), //
  WordData('prezent'), //
  WordData('prezydent'), //
  WordData('probówka'), //
  WordData('procent'), //
  WordData('proch'), //
  WordData('procesor'), //
  WordData('profesor'), //
  WordData('prognoza'), //
  WordData('prom', diff: 4), //kosmiczny - wodny
  WordData('promotor'), //
  WordData('promień'), //
  WordData('prostokąt'), //
  WordData('proszek'), //
  WordData('przechodzień'), //
  WordData('przeciąg'), //
  WordData('przeciek', diff: 4), //wyciek z rury - wyciek informacji
  WordData('przecinek', diff: 3), //
  WordData('przedłużacz'), //
  WordData('przedwiośnie', diff: 4), //
  WordData('przedział', diff: 4), //zakres liczb - miejsce w pociągu
  WordData('przegroda'), //
  WordData('przejście'), //
  WordData('przekrój'), //
  WordData('przełącznik'), //
  WordData('przemiana'), //
  WordData('przepiórka'), //
  WordData('przerwa'), //
  WordData('prześcieradło'), //
  WordData('przesiadka'), //
  WordData('przeskok'), //
  WordData('prześwietlenie'), //
  WordData('przeszczep'), //
  WordData('przewodnik'), //
  WordData('przód'), //
  WordData('przycisk'), //
  WordData('przyczepa'), //
  WordData('przynęta'), //
  WordData('przypał'), //
  WordData('przyprawa'), //
  WordData('przysiad'), //
  WordData('przyssawka'), //
  WordData('przystań'), //
  WordData('przystanek'), //
  WordData('przyszłość'), //
  WordData('pszczoła'), //
  WordData('ptak', diff: 6), //
  WordData('puchar'), //
  WordData('pudełko'), //
  WordData('puder'), //
  WordData('pułapka'), //
  WordData('punkt'), //
  WordData('pustak'), //
  WordData('pustynia'), //
  WordData('puszka'), //
  WordData('rachunek'), //
  WordData('rączka', diff: 4), //ręka - uchwyt
  WordData('radar'), //
  WordData('radio'), //
  WordData('radiowóz'), //
  WordData('rak', diff: 4), //zwierzę - nowotwór
  WordData('rakieta'), //
  WordData('ramię'), //
  WordData('ramka'), //
  WordData('rana'), //
  WordData('randka'), //
  WordData('reakcja'), //
  WordData('rebus'), //
  WordData('recepta'), //
  WordData('ręcznik'), //
  WordData('redukcja', diff: 2), //
  WordData('reflektor'), //
  WordData('reinkarnacja', diff: 1), //
  WordData('ręka'), //
  WordData('rękaw'), //
  WordData('rękawica'), //
  WordData('rekin'), //
  WordData('reklama'), //
  WordData('rękopis'), //
  WordData('remis'), //
  WordData('rentgen'), //
  WordData('reporter'), //
  WordData('reszka'), //
  WordData('rewers'), //
  WordData('rewolwer'), //
  WordData('reżyser'), //
  WordData('robak'), //
  WordData('robot'), //
  WordData('rodeo'), //
  WordData('rodzina'), //
  WordData('róg', diff: 5), //poroże - kant - instrument
  WordData('rogalik'), //
  WordData('rolnik'), //
  WordData('rondo'), //
  WordData('ropucha'), //
  WordData('rosa'), //
  WordData('rosja', diff: 6), //
  WordData('roszada'), //
  WordData('rower'), //
  WordData('równanie'), //
  WordData('równik'), //
  WordData('równowaga'), //
  WordData('róża'), //
  WordData('rozbitek'), //
  WordData('rozkład'), //
  WordData('rozłam'), //
  WordData('rozmowa'), //
  WordData('rozporek', diff: 3), //
  WordData('rozwijać'), //
  WordData('ruch'), //
  WordData('ruina'), //
  WordData('ruletka'), //
  WordData('rura', diff: 6), //
  WordData('rusztowanie'), //
  WordData('ryba'), //
  WordData('rybak'), //
  WordData('rycerz'), //
  WordData('rynna'), //
  WordData('rysunek'), //
  WordData('rytm'), //
  WordData('rzeka', diff: 6), //
  WordData('rzęsa'), //
  WordData('rzeźnia'), //
  WordData('rzeźba'), //
  WordData('rzut'), //
  WordData('saksofon'), //
  WordData('sakwa', diff: 1), //
  WordData('salto'), //
  WordData('samobójca'), //
  WordData('samochód'), //
  WordData('samolot'), //
  WordData('samotnik'), //
  WordData('samuraj'), //
  WordData('sandał'), //
  WordData('sanki'), //
  WordData('saper'), //
  WordData('schemat'), //
  WordData('schody'), //
  WordData('schronisko'), //
  WordData('ściąga'), //
  WordData('ściana'), //
  WordData('ścieżka'), //
  WordData('scyzoryk'), //
  WordData('sedes'), //
  WordData('sędzia'), //
  WordData('sejf'), //
  WordData('sekunda'), //
  WordData('selfie'), //
  WordData('sen'), //
  WordData('senator'), //
  WordData('ser'), //
  WordData('serce'), //
  WordData('seria'), //
  WordData('serwetka'), //
  WordData('sezon'), //
  WordData('siano'), //
  WordData('siarka'), //
  WordData('siatka'), //
  WordData('siatkówka'), //
  WordData('sieć', diff: 4), //komputerowa - na ryby
  WordData('siedzenie'), //
  WordData('siekiera'), //
  WordData('sienkiewicz'), //
  WordData('sierota'), //
  WordData('sierp'), //
  WordData('silnik'), //
  WordData('siłownia'), //
  WordData('siodełko'), //
  WordData('siostra'), //
  WordData('sito'), //
  WordData('skakanka'), //
  WordData('skalp'), //
  WordData('skarb'), //
  WordData('skarbonka'), //
  WordData('skarpeta'), //
  WordData('sklep', diff: 6), //
  WordData('skłon'), //
  WordData('sknera'), //
  WordData('skoczek'), //
  WordData('skok', diff: 4), //wyskok - napad
  WordData('skóra', diff: 6), //
  WordData('skorupa'), //
  WordData('skręt'), //
  WordData('skrytka'), //
  WordData('skrzydło'), //
  WordData('skrzynka'), //
  WordData('skrzypce'), //
  WordData('skup'), //
  WordData('skuter'), //
  WordData('ślad'), //
  WordData('slajd'), //
  WordData('slalom'), //
  WordData('ślepy'), //
  WordData('ślimak'), //
  WordData('slipy'), //
  WordData('śliwka'), //
  WordData('słodycze'), //
  WordData('słoik', diff: 4), //naczynie - przyjezdny Warszawiak
  WordData('słomka'), //
  WordData('słoń'), //
  WordData('słony'), //
  WordData('słońce'), //
  WordData('słonecznik'), //
  WordData('słownik'), //
  WordData('słowo'), //
  WordData('słuchawka'), //
  WordData('słup'), //
  WordData('smark'), //
  WordData('smażalnia'), //
  WordData('śmiech'), //
  WordData('śmieci'), //
  WordData('śmierć'), //
  WordData('śmierdziel'), //
  WordData('śmietnik'), //
  WordData('śmigło'), //
  WordData('smoczek', diff: 4), //mały smok - gryzak
  WordData('smok'), //
  WordData('smoła'), //
  WordData('snajper'), //
  WordData('śniadanie'), //
  WordData('śnieg'), //
  WordData('śnieżka', diff: 6), //
  WordData('sofa'), //
  WordData('sok'), //
  WordData('sokowirówka'), //
  WordData('solarium'), //
  WordData('sopel'), //
  WordData('sowa'), //
  WordData('spacer'), //
  WordData('spacja'), //
  WordData('spadochron'), //
  WordData('śpiew'), //
  WordData('spinacz'), //
  WordData('śpioch'), //
  WordData('spirala'), //
  WordData('śpiwór'), //
  WordData('splot'), //
  WordData('spływ'), //
  WordData('spodek'), //
  WordData('spódnica'), //
  WordData('spodnie'), //
  WordData('spokój'), //
  WordData('sport'), //
  WordData('sportowiec'), //
  WordData('spotkanie'), //
  WordData('spóźnienie'), //
  WordData('sprężyna'), //
  WordData('spust'), //
  WordData('spychacz'), //
  WordData('średnik'), //
  WordData('środek', diff: 6), //
  WordData('śruba'), //
  WordData('śrubokręt'), //
  WordData('stacja', diff: 5), //
  WordData('stadion'), //
  WordData('stado'), //
  WordData('stan'), //
  WordData('starość'), //
  WordData('statek'), //
  WordData('statyw'), //
  WordData('ster'), //
  WordData('stereo'), //
  WordData('stojak'), //
  WordData('stokrotka'), //
  WordData('stół'), //
  WordData('stołek'), //
  WordData('stolica'), //
  WordData('stołówka'), //
  WordData('stonoga'), //
  WordData('stop', diff: 6), //
  WordData('stopa'), //
  WordData('stoper'), //
  WordData('stopień'), //
  WordData('stopka'), //
  WordData('strach'), //
  WordData('stragan'), //
  WordData('strajk'), //
  WordData('straszydło'), //
  WordData('strażak'), //
  WordData('strefa'), //
  WordData('strój'), //
  WordData('strona'), //
  WordData('strumień'), //
  WordData('struna'), //
  WordData('strup'), //
  WordData('struś'), //
  WordData('stryczek'), //
  WordData('strzał'), //
  WordData('strzała'), //
  WordData('strzelec'), //
  WordData('strzykawka'), //
  WordData('strzyżenie'), //
  WordData('student'), //
  WordData('studnia'), //
  WordData('suchar'), //
  WordData('sufit'), //
  WordData('sufler'), //
  WordData('sukces'), //
  WordData('sukienka'), //
  WordData('suma'), //
  WordData('supeł'), //
  WordData('susza'), //
  WordData('suszarka'), //
  WordData('sutanna'), //
  WordData('suwak'), //
  WordData('swastyka'), //
  WordData('świadectwo'), //
  WordData('świat'), //
  WordData('światło'), //
  WordData('świder'), //
  WordData('świeca'), //
  WordData('świecznik'), //
  WordData('święto'), //
  WordData('świnia', diff: 4), //zwierzę - osoba nieuczciwa
  WordData('świniopas', diff: 1), //
  WordData('świstak'), //
  WordData('sygnał'), //
  WordData('sygnalizacja'), //
  WordData('sygnet', diff: 2), //
  WordData('sylwester', diff: 4), //imię - ostatni dzień roku
  WordData('symbol'), //
  WordData('sypialnia'), //
  WordData('syrena', diff: 4), //kobieta ryba - rodzaj alarmu
  WordData('system'), //
  WordData('szabla'), //
  WordData('szachownica'), //
  WordData('szachy'), //
  WordData('szafa'), //
  WordData('szalik'), //
  WordData('szał'), //
  WordData('szambo', diff: 4), //
  WordData('szampon'), //
  WordData('szary'), //
  WordData('szatnia'), //
  WordData('szczebel'), //
  WordData('szczelina'), //
  WordData('szczeniak'), //
  WordData('szczoteczka'), //
  WordData('szczudła', diff: 2), //
  WordData('szczur'), //
  WordData('szczyt'), //
  WordData('szef'), //
  WordData('szelki'), //
  WordData('szept'), //
  WordData('szereg'), //
  WordData('szeroki'), //
  WordData('szeryf'), //
  WordData('sześciopak', diff: 7), //
  WordData('szewc'), //
  WordData('szkielet'), //
  WordData('szklanka'), //
  WordData('szklarnia'), //
  WordData('szkło'), //
  WordData('szkoła'), //
  WordData('szlaban'), //
  WordData('szminka'), //
  WordData('sznur'), //
  WordData('szofer'), //
  WordData('szpagat'), //
  WordData('szpieg'), //
  WordData('szpilka'), //
  WordData('szpital'), //
  WordData('szpon'), //
  WordData('szprycha'), //
  WordData('szpula'), //
  WordData('szrama'), // //3
  WordData('sztabka'), //
  WordData('sztanga'), //
  WordData('sztuka', diff: 5), //okaz - kultura - jednostka towaru
  WordData('sztylet'), //
  WordData('szufelka'), //
  WordData('szuflada'), //
  WordData('szyfr'), //
  WordData('szyja'), //
  WordData('szyna', diff: 4), //szynka - fragment torów
  WordData('tabela'), //
  WordData('tablet'), //
  WordData('tabletka'), //
  WordData('tablica'), //
  WordData('taboret'), //
  WordData('taczka'), //
  WordData('taksówkarz'), //
  WordData('talerz'), //
  WordData('talizman', diff: 3), //
  WordData('tandem'), //
  WordData('taniec'), //
  WordData('tapeta'), //
  WordData('tarcza'), //
  WordData('taśma'), //
  WordData('tatuaż'), //
  WordData('teatr'), //
  WordData('tęcza', diff: 6), //
  WordData('teczka'), //
  WordData('telefon'), //
  WordData('teleskop'), //
  WordData('teleturniej'), //
  WordData('telewizor'), //
  WordData('temperówka'), //
  WordData('tenis'), //
  WordData('tenisówki'), //
  WordData('termometr'), //
  WordData('termos'), //
  WordData('terrorysta'), //
  WordData('tlen', diff: 6), //powietrze - chemia
  WordData('tłumacz'), //
  WordData('tłumik'), //
  WordData('tłuszcz'), //
  WordData('toaleta'), //
  WordData('toast'), //
  WordData('topór'), //
  WordData('torba'), //
  WordData('torebka'), //
  WordData('tornado'), //
  WordData('torpeda'), //
  WordData('tort'), //
  WordData('tortura'), //
  WordData('trąba'), //
  WordData('traktor'), //
  WordData('trampolina'), //
  WordData('trampki'), //
  WordData('tramwaj'), //
  WordData('transparent'), //
  WordData('tratwa'), //
  WordData('trawa'), //
  WordData('trawnik'), //
  WordData('trębacz'), //
  WordData('trema'), //
  WordData('trening'), //
  WordData('tresura'), //
  WordData('trójmiasto', diff: 6), //
  WordData('trójząb', diff: 6), //posejdon - broń
  WordData('tron'), //
  WordData('trop'), //
  WordData('trucizna'), //
  WordData('trumna'), //
  WordData('trup'), //
  WordData('truskawka'), //
  WordData('trzepak'), //
  WordData('tulipan'), //
  WordData('tunel'), //
  WordData('turban'), //
  WordData('turysta'), //
  WordData('tusz'), //
  WordData('twardy'), //
  WordData('twarz'), //
  WordData('tyczka'), //
  WordData('tytoń'), //
  WordData('tytuł'), //
  WordData('ubaw'), //
  WordData('ucho'), //
  WordData('uchwyt'), //
  WordData('ucieczka'), //
  WordData('uduszenie'), //
  WordData('układanka'), //
  WordData('ukłon'), //
  WordData('ukos', diff: 3), //
  WordData('ukryty'), //
  WordData('ul', diff: 6), //pszczoła - miód - dom
  WordData('ułamek'), //
  WordData('ulewa'), //
  WordData('ulica'), //
  WordData('ulotka'), //
  WordData('umywalka'), //
  WordData('unia'), //
  WordData('unik'), //
  WordData('upadek'), //
  WordData('upał'), //
  WordData('uran', diff: 6), //elektrownia - chemia - pierwiastek - promieniowanie
  WordData('urna'), //
  WordData('usunąć'), //
  WordData('uścisk'), //
  WordData('uśmiech'), //
  WordData('usta'), //
  WordData('używka'), //
  WordData('wachlarz'), //
  WordData('wafel'), //
  WordData('waga'), //
  WordData('wagary'), //
  WordData('wagon'), //
  WordData('wakacje'), //
  WordData('walec'), //
  WordData('wałek'), //
  WordData('walka'), //
  WordData('wampir', diff: 6), //zmierzch - kreatura - krew
  WordData('wanna'), //
  WordData('warcaby'), //
  WordData('warga'), //
  WordData('warkocz'), //
  WordData('warszawa'), //
  WordData('warzywo'), //
  WordData('wąski'), //
  WordData('wata'), //
  WordData('wąż', diff: 4), //ogrodowy - zwierzę
  WordData('wazon'), //
  WordData('wczasy'), //
  WordData('wdowa'), //
  WordData('wędka'), //
  WordData('węgiel'), //
  WordData('węgorz'), //
  WordData('wektor'), //
  WordData('wentyl'), //
  WordData('wesoły'), //
  WordData('wers'), //
  WordData('węzeł'), //
  WordData('wiadro'), //
  WordData('wianek'), //
  WordData('wiatr'), //
  WordData('wiatrak'), //
  WordData('widelec'), //
  WordData('widły'), //
  WordData('widz'), //
  WordData('wieczór'), //
  WordData('większość'), //
  WordData('wielbłąd'), //
  WordData('wielki'), //
  WordData('wieloryb'), //
  WordData('wiertarka'), //
  WordData('wiertło'), //
  WordData('wierzchołek'), //
  WordData('wieszak'), //
  WordData('wieża'), //
  WordData('więzienie'), //
  WordData('wieżowiec'), //
  WordData('wilk'), //
  WordData('winda'), //
  WordData('wino'), //
  WordData('wiosło'), //
  WordData('wiosna'), //
  WordData('wir'), //
  WordData('wirus', diff: 4), //program komputerowy - choroba
  WordData('wisła'), //
  WordData('wiśnia'), //
  WordData('wizjer'), //
  WordData('wjazd'), //
  WordData('władca'), //
  WordData('włosy'), //
  WordData('woda'), //
  WordData('wodorost'), //
  WordData('wodospad'), //
  WordData('wojna'), //
  WordData('wojsko', diff: 6), //wojna - porządek
  WordData('wolny', diff: 5), //ang. free - ang. slow
  WordData('worek'), //
  WordData('wóz'), //
  WordData('wózek'), //
  WordData('wróbel'), //
  WordData('wrotki'), //
  WordData('wschód'), //
  WordData('wściekły'), //
  WordData('wspólny'), //
  WordData('wstęga'), //
  WordData('wstyd'), //
  WordData('wtyczka'), //
  WordData('wulkan'), //
  WordData('wybory'), //
  WordData('wybuch'), //
  WordData('wycieraczka'), //
  WordData('wydech'), //
  WordData('wykres'), //
  WordData('wymioty'), //
  WordData('wynik'), //
  WordData('wypadek'), //
  WordData('wypieki', diff: 4), //przetwory pszenne - rumieńce
  WordData('wyrok'), //
  WordData('wyścig'), //
  WordData('wysokość'), //
  WordData('wyspa'), //
  WordData('wytrych'), //
  WordData('wywar'), //
  WordData('wywiad'), //
  WordData('wzór', diff: 4), //formuła matematyczna - przykład do naśladowania
  WordData('wzrok'), //
  WordData('youtube'), //
  WordData('żabka', diff: 5), //zwierzę - klips - sklep
  WordData('zabawa'), //
  WordData('zabawka'), //
  WordData('zabobon', diff: 1), //
  WordData('zachód'), //
  WordData('zaćmienie'), //
  WordData('zagadka'), //
  WordData('żagiel', diff: 6), //
  WordData('zając', diff: 6), //zwierzę - skakać
  WordData('zakaz'), //
  WordData('zakład'), //
  WordData('zakonnik'), //
  WordData('zakopane'), //
  WordData('zakres'), //
  WordData('zakręt'), //
  WordData('zakupy'), //
  WordData('załoga'), //
  WordData('żaluzje'), //
  WordData('zamek'), //budowla - mechanizm w drzwiach / kłódce
  WordData('zamiana', diff: 3), //
  WordData('zapach', diff: 6), // zmysł - woń
  WordData('zapałka'), //
  WordData('zapalniczka'), //
  WordData('zapora', diff: 3), //
  WordData('zarost'), //
  WordData('żarówka'), //
  WordData('zasięg', diff: 5), //
  WordData('zasłona'), //
  WordData('zaspa'), //
  WordData('zatoka'), //
  WordData('zawór'), //
  WordData('zbrodnia'), //
  WordData('zbroja'), //
  WordData('zderzak'), //
  WordData('zdjęcie'), //
  WordData('zebra', diff: 4), //przejście dla pieszych - zwierzę
  WordData('żebrak'), //
  WordData('zęby'), //
  WordData('zegar'), //
  WordData('żel', diff: 3), //
  WordData('żelazo'), //
  WordData('zenit', diff: 1), //
  WordData('zestaw'), //
  WordData('zeszyt', diff: 6), //szkoła - książka - pisanie
  WordData('ziarno'), //
  WordData('zielony', diff: 6), //
  WordData('ziemia', diff: 4), //kula ziemska - gleba
  WordData('ziemniak', diff: 6), //warzywo - Ameryka - roślina
  WordData('zima', diff: 6), //
  WordData('zioło', diff: 4), //roślina - marihuana
  WordData('zjawa'), //
  WordData('złącze'), //
  WordData('złamany'), //
  WordData('zlew'), //
  WordData('złodziej'), //
  WordData('złom'), //
  WordData('złomowisko', diff: 2), //
  WordData('złoty', diff: 4), //kolor - PLN
  WordData('zły', diff: 6), //
  WordData('żmija'), //
  WordData('zmysł', diff: 6), //
  WordData('zmywacz'), //
  WordData('znaczek'), //
  WordData('znak', diff: 5), //
  WordData('znicz'), //
  WordData('żniwa'), //  // 3
  WordData('żołnierz'), //
  WordData('żółtko', diff: 3), //
  WordData('żółty', diff: 6), //
  WordData('żółw', diff: 6), //
  WordData('źrenica', diff: 2), //
  WordData('źródło', diff: 4), //miejsce pochodzenia informacji - początek rzeki
  WordData('zupa'), //
  WordData('żuraw', diff: 4), //ptak - dźwig
  WordData('żurawina'), //
  WordData('związek', diff: 4), //para (ludzie) - substancja chemiczna
  WordData('zwierciadło', diff: 3), //
  WordData('zwłoki', diff: 4), //śmierć - czas
  WordData('zwrot', diff: 4), //kierunek - oddanie pieniędzy
  WordData('życie', diff: 6), //
  WordData('zygzak', diff: 2), //
  WordData('żyła', diff: 4), //miedzi / złota - część ciała
  WordData('żyletka', diff: 2), //
  WordData('żyrafa', diff: 6), //
  WordData('żyrandol', diff: 3), //
];
