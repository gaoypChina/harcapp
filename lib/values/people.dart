import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'hufce.dart';

List<Person> allPeople = [
  ADAM_DUDAK,
  AGNIESZKA_DURSKA,
  AGNIESZKA_TYLKO,
  ALEKSANDRA_CHRUSTEK,
  ALEKSANDRA_KOSTRZEWA,
  ALEKSANDRA_KOZUBAL,
  ANTONINA_SZTYGLIC,
  ARTUR_RUSA,
  BARBARA_THOMAS,
  BARTOSZ_DABROWSKI,
  BARTOSZ_IGNASIAK,
  DANIEL_IWANICKI,
  DANIEL_KORZEB,
  DAWID_WYSZYNSKI,
  DOMINIKA_GORZYNSKA,
  DOMINIKA_HOCHMANSKA,
  DORIAN_JAREK,
  EWA_BYSTRZYNSKA,
  FILIP_BERGIER,
  FILIP_KWIATKOWSKI,
  FILIP_SOCHAJ,
  FILIP_SWIDEREK,
  FRANCISZEK_TOMASZCZYK,
  GRZEGORZ_BOROWIEC,
  GRZEGORZ_ZAWADZKI,
  HANNA_RYBACKA,
  HELENA_LATOSINSKA,
  HUBERT_FRUKOWSKI,
  JADWIGA_BILINSKA,
  JAKUB_EJDUK,
  JAKUB_KLUCZKOWSKI,
  JAKUB_SKUCHA,
  JAKUB_STEFANSKI,
  JAKUB_ZDANOWICZ_ZASIDKO,
  JAN_KUCZA,
  JAROSLAW_JAKUBIAK,
  JAROSLAW_ZASACKI,
  JOANNA_MICHALOWSKA,
  JULIA_PILCH,
  JULIA_SIUDMAK,
  JULITA_STEPIEN,
  KACPER_BACZKOWSKI,
  KACPER_KORDEK,
  KACPER_KOZLUK,
  KACPER_SWITKIEWICZ,
  KACPER_SZCZENSY,
  KACPER_TOMCZYK,
  KACPER_WIDZ,
  KAJETAN_RUSZKOWSKI,
  KAJETAN_WYGNANSKI,
  KAROLINA_MARCINKOWSKA,
  KAMIL_ZAK,
  KAROL_GOLABEK,
  KAROL_MALUS,
  KATARZYNA_STUDNICKA,
  KLARA_MAZEK,
  KLAUDIUSZ_PALUCH,
  KRZYSZTOF_KRAWCZYK,
  KRZSZTOF_MALIKIEWICZ,
  LAURA_FRASZEWSKA,
  LUKASZ_SZEPIELAK,
  LUKASZ_KRYWULT,
  LUKASZ_RYBINSKI,
  MACIEJ_BATKO,
  MALGORZATA_KLOC,
  MARCIN_JANKOWIAK,
  MAREK_MUSIALIK,
  MARLENA_BANIA,
  MARTA_SZYMANDERSKA,
  MARYSIA_SLUGAJ,
  MATEUSZ_CIAGLO,
  MATEUSZ_GAWRYSIAK,
  MATEUSZ_KOBYLAREK,
  MAXIMILIAN_STEINHOFF,
  MICHAL_KARWOWSKI,
  MIKOLAJ_GORECKI,
  NADIA_WYSZOGRODZKA,
  OLIWIA_STANCZYK,
  OSKAR_PARDYAK,
  PATRYCJA_SZCZESNA,
  PAULINA_BURDZIK,
  PAWEL_MARUD,
  PIOTR_SOSNOWSKI,
  PIOTR_MACIEJ_KABATA,
  PIOTR_ZIEMBIKIEWICZ,
  PRZEMYSLAW_KLUCZKOWSKI,
  RADOSLAW_RELIDZYNSKI,
  RAFAL_BARAN,
  RAFAL_KOWALSKI,
  RAFAL_LALIK,
  ROBERT_MAZUR,
  ROBERT_ROBOTYCKI,
  SARA_WALCZYNSKA_GORA,
  SEBASTIAN_KOPROWSKI,
  SEWERYN_WOLINSKI,
  STANISLAW_WRONSKI,
  STEFAN_KRYCZKA,
  SZYMON_CHORAZY,
  SZYMON_DROPEK,
  SZYMON_PODGORNY,
  SZYMON_ZDZIEBKO,
  WANDA_MARCHEL,
  WIKTOR_KARPALA,
  WIKTORIA_WOJCIK,
  WINCENTY_DIETRYCH,
  WOJCIECH_GRUSZCZYNSKI,
  WOJCIECH_TURSKI,
  WOJCIECH_WOLNIK,
  WOJCIECH_ZIELINSKI,
  ZBYSZEK_CHODAKOWSKI,
  ZOFIA_FABROWSKA,
  ZOFIA_ZAWADZKA,
  ZUZANNA_JAWORSKA,
  ZUZANNA_KOLIS,
  ZUZANNA_KOWALCZYK,
  ZUZANNA_MIERZEJEWSKA,
  ZUZANNA_WARCHOL
];

Map<String, Person> allPeopleMap = {for(Person person in allPeople) person.email: person};

const Person ADAM_DUDAK = Person(name: 'Adam Dudak', hufiec: huf_zhp_warszawa_ursynow, druzyna: '234 Warszawska Drużyna Harcerska "Forteca"');
const Person AGNIESZKA_DURSKA = Person(name: 'Agnieszka Durska', stop_i: 'phm.', hufiec: huf_zhp_lodz_baluty);
const Person AGNIESZKA_TYLKO = Person(name: 'Agnieszka Tylko', stop_h: StopZHP.pion,
  hufiec: huf_zhp_myslenice,
  druzyna: '3.14. Myślenicka Drużyna Starszoharcerska "Awangarda"',
  org: Org.zhp,
);
const Person ALEKSANDRA_CHRUSTEK = Person(
    name: 'Aleksandra Chrustek',
    stop_h: StopZHP.HOd,
    stop_i: 'pwd.',
    hufiec: huf_zhp_warszawa_mokotow,
    org: Org.zhp,
    email: 'olachrustek@gmail.com'
);
const Person ALEKSANDRA_KOSTRZEWA = Person(name: 'Ola Kostrzewa', org: Org.zhp);
const Person ALEKSANDRA_KOZUBAL = Person(name: 'Aleksandra Kozubal', stop_h: StopZHP.sam, org: Org.zhp);
const Person ANTONINA_SZTYGLIC = Person(
  name: 'Antonina Sztyglic',
  hufiec: huf_zhp_lask,
  druzyna: '5 Wieluńska Drużyna Harcerek Starszych "Kozy"',
  org: Org.zhp,
  email: 'sztyglica@gmail.com'
);
const Person ARTUR_RUSA = Person(name: 'Artur Rusa', stop_h: StopZHP.wyw, hufiec: huf_zhp_pulawy, druzyna: '113 SDSH', org: Org.zhp,);
const Person BARBARA_THOMAS = Person(name: 'Barbara Thomas', stop_i: 'phm.');
const Person BARTOSZ_DABROWSKI = Person(name: 'Bartosz Dąbrowski', stop_h: StopZHP.wyw, org: Org.zhp);
const Person BARTOSZ_IGNASIAK = Person(name: 'Bartosz Ignasiak', stop_h: StopZHP.HOc, stop_i: 'pwd.', druzyna: '8 Drużyna Wędrownicza "Kuźnia Płomienia"');
const Person DANIEL_IWANICKI = Person(
    name: 'Daniel Iwanicki',
    stop_h: StopZHP.HOc,
    stop_i: 'phm.',
    druzyna: '72. WDHS "Uroczysko"',
    email: 'daniel.iwanicki@zhp.net.pl'
);
const Person DANIEL_KORZEB = Person(name: 'Daniel Korzeb', stop_h: StopZHP.odk,
  druzyna: '39. HDŻ Burza',
  hufiec: huf_zhp_czestochowa,
  org: Org.zhp,
);
const Person DAWID_WYSZYNSKI = Person(name: 'Dawid Wyszyński', stop_h: StopZHP.dhc, org: Org.zhp,);
const Person DOMINIKA_GORZYNSKA = Person(name: 'Dominika Gorzyńska', stop_h: StopZHP.pion,
  druzyna: '11. Gdańska Drużyna Starszoharcerska "Cegły" im. Anny Burdówny',
  hufiec: huf_zhp_gdansk_srodmiesie,
  org: Org.zhp,
);
const Person DOMINIKA_HOCHMANSKA = Person(
  name: 'Dominika Hochmańska',
  stop_i: 'pwd.',
  org: Org.zhp
);
const Person DORIAN_JAREK = Person(name: 'Dorian Jarek', stop_i: 'pwd.',
    druzyna: '13. Konińska Drużyna Wędrownicza "Wadery"',
    hufiec: huf_zhp_konin,
    org: Org.zhp);
const Person EWA_BYSTRZYNSKA = Person(name: 'Ewa Bystrzyńska', stop_h: StopZHP.dhd, org: Org.zhp);
const Person FILIP_BERGIER = Person(
    name: 'Filip Bergier',
    stop_h: StopZHP.wyw,
    druzyna: '72. WDHS "Uroczysko"',
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp
);
const Person FILIP_KWIATKOWSKI = Person(name: 'Filip Kwiatkowski', stop_h: StopZHP.dhc, org: Org.zhp);
const Person FILIP_SOCHAJ = Person(name: 'Filip Sochaj');
const Person FILIP_SWIDEREK = Person(name: 'Filip Świderek');
const Person FRANCISZEK_TOMASZCZYK = Person(
  name: 'Franciszek Tomaszczyk',
  stop_h: StopZHP.wyw, hufiec: huf_zhp_ziemi_cieszynskiej,
  druzyna: '33. CDH "Czarne stopy", 4. GZ "Radosne Misie"',
  org: Org.zhp
);
const Person GRZEGORZ_BOROWIEC = Person(
  name: 'Grzegorz Borowiec',
  stop_h: StopZHP.HOc,
  druzyna: '66. WDW "Tornado"',
  hufiec: huf_zhp_torun,
  org: Org.zhp,
);
const Person GRZEGORZ_ZAWADZKI = Person(
    name: 'Grzegorz Zawadzki',
    druzyna: '8. DSH "Ignis"',
    hufiec: huf_zhp_kutno,
);
const Person HANNA_RYBACKA = Person(name: 'Hanna Rybacka',
  druzyna: 'Gromada Zuchowa Ogniste Feniksy',
  hufiec: huf_zhp_zdunska_wola,
  stop_h: StopZHP.sam,
  stop_i: 'pwd.',
  org: Org.zhp,
  email: 'hanna.rybacka@zhp.net.pl'
);
const Person HELENA_LATOSINSKA = Person(name: 'Helena Latosińska',
  druzyna: '39. Wielopoziomowa Drużyna Harcerska "Leśne Stwory z Radlina"',
  hufiec: huf_zhp_ziemi_wodzislawskiej,
  org: Org.zhp,
);
const Person HUBERT_FRUKOWSKI = Person(
  name: 'Hubert Frukowski'
);
const Person JADWIGA_BILINSKA = Person(
  name: 'Jadwiga Bilińska',
  stop_i: 'phm.',
  stop_h: StopZHP.sam,
  hufiec: huf_zhp_zielonka,
  druzyna: '132. Mazowiecka Drużyna Harcerska "Wielkie Bractwo Halicza"',
  org: Org.zhp,
  email: 'jadwiga.bilinska@zhp.net.pl'
);
const Person JAKUB_EJDUK = Person(
    name: 'Jakub Ejduk',
    stop_i: 'pwd.',
    stop_h: StopZHP.HOc,
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp
);
const Person JAKUB_KLUCZKOWSKI = Person(
    name: 'Jakub Kluczkowski',
    stop_i: 'pwd.',
    stop_h: StopZHP.HOc,
    hufiec: huf_zhp_ziemi_koszalinskiej,
    org: Org.zhp,
    email: 'jakub.kluczkowski@zhp.net.pl'
);
const Person JAKUB_SKUCHA = Person(name: 'Jakub Skucha', stop_h: StopZHP.dhc);
const Person JAKUB_STEFANSKI = Person(name: 'Jakub Stefański', stop_h: StopZHP.dhc, org: Org.zhp);
const Person JAKUB_ZDANOWICZ_ZASIDKO = Person(name: 'Jakub Zdanowicz-Zasidko', stop_h: StopZHP.dhc);
const Person JAN_KUCZA = Person(
  name: 'Jan Kucza',
  org: Org.zhp,
  email: 'jan.kucza@zhp.net.pl'
);
const Person JAROSLAW_JAKUBIAK = Person(name: 'Jarosław Jakubiak', stop_h: StopZHP.dhc,
  hufiec: huf_zhp_uk,
);
const Person JAROSLAW_ZASACKI = Person(name: 'Jarosław Zasacki', stop_h: StopZHP.HOc, stop_i: 'phm.',
  hufiec: huf_zhr_zielonagora_topor, org: Org.zhr_c,
);
const Person JOANNA_MICHALOWSKA = Person(name: 'Joanna Michałowska', stop_h: StopZHP.sam,
  druzyna: '18. Poznańska Drużyna Harcerek im. Olgi Drahonowskiej-Małkowskiej',
  org: Org.zhp,
);
const Person JULIA_PILCH = Person(name: 'Julia Pilch', stop_h: StopZHP.dhd,);
const Person JULIA_SIUDMAK = Person(name: 'Julia Siudmak');
const Person JULITA_STEPIEN = Person(name: 'Julita Stępień');
const Person KACPER_BACZKOWSKI = Person(name: 'Kacper Bączkowski', stop_h: StopZHP.dhc, org: Org.zhp);
const Person KACPER_KORDEK = Person(name: 'Kacper Kordek', stop_h: StopZHP.cw);
const Person KACPER_KOZLUK = Person(
  name: 'Kacper Koźluk',
  email: 'kacper@kozluk.pl'
);
const Person KACPER_SWITKIEWICZ = Person(name: 'Kacper Świtkiewicz', stop_h: StopZHP.dhc, org: Org.zhp);
const Person KACPER_SZCZENSY = Person(name: 'Kacper Szczęsny', stop_h: StopZHP.wyw, org: Org.zhp);
const Person KACPER_TOMCZYK = Person(
  name: 'Kacper Tomczyk',
  druzyna: '77. Wrzesińska Drużyna Wędrownicza "Huragan"',
  hufiec: huf_zhp_wrzesnia_wrzos,
  org: Org.zhp,
  email: 'celnysnajper@gmail.com'
);
const Person KACPER_WIDZ = Person(
    name: 'Kacper Widz',
    stop_h: StopZHP.ml,
    org: Org.zhp,
    hufiec: huf_zhp_lublin,
    druzyna: '8. Lubelska Drużyna Wędrownicza "Infiniti"',
);

const KAJETAN_RUSZKOWSKI = Person(
  name: 'Kajetan Ruszkowski',
  druzyna: 'XV. ŁDH ,,Zielony Płomień" im. Andrzeja Małkowskiego',
  hufiec: huf_zhr_lodz,
  stop_h: StopZHP.HOc,
  org: Org.zhr_o,
);
const Person KAJETAN_WYGNANSKI = Person(
  name: 'Kajetan Wygrański',
  druzyna: '62. MDSH "Krzemień"',
  hufiec: huf_zhp_pruszkow,
  stop_h: StopZHP.odk,
  org: Org.zhp,
);
const Person KAROLINA_MARCINKOWSKA = Person(name: 'Karolina Marcinkowska');
const Person KAMIL_ZAK = Person(name: 'Kamil Żak', stop_h: StopZHP.HOc);
const Person KAROL_GOLABEK = Person(
  name: 'Karol Gołąbek',
  stop_h: StopZHP.ml,
  druzyna: '44. Drużyna Starszoharcerska "Potok" w Miękinii',);
const Person KAROL_MALUS = Person(name: 'Karol Malus', stop_h: StopZHP.dhc);
const Person KATARZYNA_STUDNICKA = Person(
    name: 'Katarzyna Studnicka',
    stop_i: 'pwd.',
    stop_h: StopZHP.dhd,
    druzyna: '12. DH "Na Tropie"',
    hufiec: huf_zhp_andrychow, org: Org.zhp,
    email: 'katarzyna.studnicka@zhp.net.pl'
);
const Person KLARA_MAZEK = Person(name: 'Klara Mazek');
const Person KLAUDIUSZ_PALUCH = Person(name: 'Klaudiusz Paluch');

const Person KRZYSZTOF_KRAWCZYK = Person(name: 'Krzysztof Krawczyk', stop_h: StopZHP.dhc);
const Person KRZSZTOF_MALIKIEWICZ = Person(
  name: 'Krzysztof Malikiewicz',
  stop_h: StopZHP.HRc,
  hufiec: huf_zhp_trzebinia,
  email: 'krzysztof.malikiewicz@zhp.net.pl'
);
const Person LAURA_FRASZEWSKA = Person(name: 'Laura Fraszewska');
const Person LUKASZ_SZEPIELAK = Person(name: 'Łukasz Szepielak', stop_h: StopZHP.dhc, org: Org.zhp,);
const Person LUKASZ_SZTANDERA = Person(
  name: 'Łukasz Sztandera',
  stop_h: StopZHP.wyw,
  hufiec: huf_zhp_kielce_poludnie,
  druzyna: '29. Kielecka Drużyna Harcerska "Bukowina"',
  org: Org.zhp,
  email: 'lukasz.sztandera@zhp.net.pl'
);
const Person LUKASZ_KRYWULT = Person(name: 'Łukasz Krywult', stop_h: StopZHP.cw, org: Org.zhp,);
const Person LUKASZ_RYBINSKI = Person(name: 'Łukasz Rybiński', stop_i: 'pwd.');
const Person MACIEJ_BATKO = Person(name: 'Maciej Batko', stop_h: StopZHP.dhc,
  druzyna: '117. Elbląskiej Męskiej Drużyny Harcerskiej "Mato"',
);
const Person MALGORZATA_KLOC = Person(
  name: 'Małgorzata Kloc',
  stop_h: StopZHP.pion,
  druzyna: '9. Gliwicka Drużyna Harcerzy Starszych "Lukarna" im. płk. Witolda Pileckiego',
  hufiec: huf_zhp_ziemi_gliwickiej,
  org: Org.zhp,
  email: 'malgorzata.kloc@zhp.net.pl'
);
const Person MARCIN_JANKOWIAK = Person(name: 'Marcin Jankowiak', hufiec: huf_zhp_jarocin, org: Org.zhp,);
const Person MAREK_MUSIALIK = Person(name: 'Marek Musialik', stop_h: StopZHP.dhc, org: Org.zhp);
const Person MARLENA_BANIA = Person(
    name: 'Marlena Bania',
    stop_h: StopZHP.pion,
    druzyna: '9. Gliwicka Drużyna Harcerzy Starszych "Lukarna" im. Witolda Pileckiego',
    hufiec: huf_zhp_ziemi_gliwickiej,
    org: Org.zhp);
const Person MARTA_SZYMANDERSKA = Person(name: 'Marta Szymanderska', stop_h: StopZHP.dhd, hufiec: huf_zhp_warszawa_mokotow, org: Org.zhp);
const Person MARYSIA_SLUGAJ = Person(
  name: 'Marysia Ślugaj',
  stop_h: StopZHP.HOd,
  hufiec: huf_zhp_wrzesnia_wrzos,
  druzyna: '77 Wrzesińska Drużyna Wędrownicza "Huragan"',
  email: 'nutkiq@gmail.com'
);
const Person MATEUSZ_CIAGLO = Person(name: 'Mateusz Ciągło', stop_h: StopZHP.dhc);
const Person MATEUSZ_GAWRYSIAK = Person(name: 'Mateusz Gawrysiak', stop_h: StopZHP.cw);
const Person MATEUSZ_KOBYLAREK = Person(
    name: 'Mateusz Kobylarek',
    stop_h: StopZHP.ml,
    druzyna: '35. Poznańska Drużyna Harcerska im. I Polskiej Samodzielnej Kompanii Commando',
    hufiec: huf_zhp_poznan_wilda,
    org: Org.zhp,);
const Person MAXIMILIAN_STEINHOFF = Person(
  name: 'Maximilian Steinhoff',
  //stop_h: StopZHP.dhc,
  stop_i: 'pwd.',
  druzyna: 'Próbna Drużyna Harcerzy w Berlinie ZHP Świat "Miś Wojtek"',
);
const Person MICHAL_KARWOWSKI = Person(
    name: 'Michał Karwowski',
    stop_h: StopZHP.HOc,
    stop_i: 'phm.',
    druzyna: '72. Szczep WDHiGZ "Ostoja"',
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp,
);
const Person MIKOLAJ_GORECKI = Person(
  name: 'Mikołaj Górecki',
  druzyna: '30. PgDSHW "Waganci"',
  hufiec: huf_zhp_krakow_pdg,
  org: Org.zhp,
);
const Person NADIA_WYSZOGRODZKA = Person(
  name: 'Nadia Wyszogrodzka',
  druzyna: '1. Drużyna Specjalnościowa "Grom" im. Cichociemnych Spadochroniarzy Armi Krajowej w Węgrowie',
  hufiec: huf_zhp_doliny_liwca,
  org: Org.zhp
);
const Person OLIWIA_STANCZYK = Person(
  name: 'Oliwia Stańczyk',
  org: Org.zhp,
  email: 'oliwia.stanczyk@zhp.net.pl'
);
const Person OSKAR_PARDYAK = Person(name: 'Oskar Pardyak', stop_i: 'pwd.', stop_h: StopZHP.HOc, org: Org.zhp);
const Person PATRYCJA_SZCZESNA = Person(name: 'Patrycja Szczęsna', stop_i: 'pwd.', stop_h: StopZHP.HOd, hufiec: huf_zhp_warszawa_praga_pn, org: Org.zhp);
const Person PAULINA_BURDZIK = Person(name: 'Paulina Burdzik', stop_i: 'pwd.', hufiec: huf_zhp_krakow_pdg, org: Org.zhp, comment: 'J. niemiecki',);
const Person PAWEL_MARUD = Person(name: 'Piotr Marud');
const Person PIOTR_SOSNOWSKI = Person(name: 'Piotr Sosnowski', stop_i: 'pwd.',
  druzyna: 'II. SzDHiZ, 74. Poznańska Drużyna Wędrownicza "Lewe Skrzydło" im. Dywizjonu 303',
  hufiec: huf_zhp_poznan_wilda,
  org: Org.zhp,
);
const Person PIOTR_MACIEJ_KABATA = Person(name: 'Piotr Maciej Kabata');
const Person PIOTR_ZIEMBIKIEWICZ = Person(name: 'Piotr Ziembikiewicz', stop_i: 'phm.');
const Person PRZEMYSLAW_KLUCZKOWSKI = Person(name: 'Przemysław Kluczkowski');
const Person RADOSLAW_RELIDZYNSKI = Person(
  name: 'Radosław Relidzyński',
  stop_i: 'pwd.',
  stop_h: StopZHP.HOc,
  druzyna: 'Warszawska Drużyna Wędrownicza "Halny"',
  hufiec: huf_zhp_warszawa_praga_pn,
  org: Org.zhp
);
const Person RAFAL_BARAN = Person(
  name: 'Rafał Baran',
  stop_h: StopZHP.dhc,
  druzyna: '72. Dąbrowska Drużyna Starszoharcerska "Niebieska Mgła"',
);
const Person RAFAL_KOWALSKI = Person(
  name: 'Radał Kowalski',
  stop_h: StopZHP.ml,
  hufiec: huf_zhp_rzeszow,
  druzyna: '14. DH im. K.K. Baczyńskiego',
  org: Org.zhp,
);
const Person RAFAL_LALIK = Person(name: 'Rafał Lalik', stop_h: StopZHP.HOc,
  druzyna: '30. Podgórska Drużyna Harcerska "Zielone Stopy"',
  hufiec: huf_zhp_krakow_pdg,
  org: Org.zhp,
);
const Person ROBERT_MAZUR = Person(name: 'Robert Mazur', stop_h: StopZHP.odk);
const Person ROBERT_ROBOTYCKI = Person(name: 'Robert Rybotycki', stop_h: StopZHP.odk, org: Org.zhp,);
const Person SARA_WALCZYNSKA_GORA = Person(name: 'Sara Walczyńska-Góra', stop_h: StopZHP.pion, org: Org.zhp);
const Person SEBASTIAN_KOPROWSKI = Person(
  name: 'Stanisław Koprowski',
  stop_i: 'pwd.',
  stop_h: StopZHP.HOc,
  druzyna: '37. Harcerska Drużyna Męska im. Franciszka Drake’a',
  hufiec: huf_zhp_brodnica,
  email: 'sebastian.koprowski@zhp.net.pl'
);
const Person SEWERYN_WOLINSKI = Person(name: 'Seweryn Woliński', stop_h: StopZHP.odk, org: Org.zhp);
const Person STANISLAW_WRONSKI = Person(name: 'Stanisław Wroński');
const Person STEFAN_KRYCZKA = Person(name: 'Stefan Kryczka', stop_h: StopZHP.cw, druzyna: '295. Warszawska drużyna "Wataha"');
const Person SZYMON_CHORAZY = Person(
  name: 'Szymon Chorąży',
  druzyna: '72. WDHS "Uroczysko"',
  hufiec: huf_zhp_warszawa_praga_pn,
  org: Org.zhp
);
const Person SZYMON_DROPEK = Person(name: 'Szymon Dropek',
    druzyna:'7. Kwidzyńska Drużyna Harcerska',
    hufiec: huf_zhp_kwidzyn,
    org: Org.zhp
);
const Person SZYMON_PODGORNY = Person(name: 'Szymon Podgórny',
    druzyna:'19. Pyzdrska Drużyna Wędrownicza "Wataha", 5 Pyzdrski szczep "Orion"',
    hufiec: huf_zhp_wrzesnia_wrzos,
    org: Org.zhp,
    email: 'szymon.podgorny@zhp.net.pl'
);
const Person SZYMON_ZDZIEBKO = Person(name: 'Szymon Zdziebko');
const Person WANDA_MARCHEL = Person(
    name: 'Wanda Marchel',
    stop_h: StopZHP.och,
    druzyna: '13. DH szczęściarze',
    hufiec: huf_zhp_opole,
    org: Org.zhp
);
const Person WIKTOR_KARPALA = Person(name: 'Wiktor Karpała', stop_h: StopZHP.HOc, stop_i: 'pwd.',
  druzyna:'74. DH "Desant" im. 1. SBS gen. bryg. Stanisława Sosabowskiego',
  hufiec: huf_zhp_podkrakowski,
  org: Org.zhp,
);
const Person WIKTORIA_WOJCIK = Person(
  name: 'Wiktoria Wójcik',
  stop_h: StopZHP.sam,
  email: 'wiktoria.wojcik1@zhp.net.pl'
);
const Person WINCENTY_DIETRYCH = Person(name: 'Wincenty Dietrych', stop_h: StopZHP.dhc);
const Person WOJCIECH_GRUSZCZYNSKI = Person(name: 'Wojciech Gruszczyński', stop_h: StopZHP.cw,
  druzyna: '35. Poznańska Drużyna Harcerska',
  org: Org.zhp,
);
const Person WOJCIECH_TURSKI = Person(name: 'Wojciech Turski', stop_h: StopZHP.cw, org: Org.zhp);
const Person WOJCIECH_WOLNIK = Person(
    name: 'Wojciech Wolnik',
    stop_h: StopZHP.ml,
    druzyna: '7. Przemeckiej Drużyna Harcerska im. Jana Pawła II',
    hufiec: huf_zhp_wolsztyn,
    org: Org.zhp
);
const Person WOJCIECH_ZIELINSKI = Person(name: 'Wojciech Zielinski', stop_h: StopZHP.dhc);
const Person ZBYSZEK_CHODAKOWSKI = Person(name: 'Zbyszek Chodakowski', stop_h: StopZHP.cw, org: Org.zhp);
const Person ZOFIA_FABROWSKA = Person(
    name: 'Zofia Fabrowska',
    stop_h: StopZHP.HOd,
    stop_i: 'pwd.',
    org: Org.zhp,
    email: 'zofia.fabrowska@zhp.net.pl'
);
const Person ZOFIA_ZAWADZKA = Person(
    name: 'Zofia Zawadzka',
    stop_h: StopZHP.trop,
    hufiec: huf_zhp_warszawa_zoliborz,
    druzyna: '128. WDH',
    org: Org.zhp
);
const Person ZUZANNA_JAWORSKA = Person(
    name: 'Zuzanna Jaworska',
    stop_i: 'pwd.',
    stop_h: StopZHP.HOd,
    org: Org.zhp,
    hufiec: huf_zhp_wroclaw
);
const Person ZUZANNA_KOLIS = Person(
  name: 'Zuzanna Kolis',
  stop_h: StopZHP.och,
  druzyna: 'Wilki',
  hufiec: huf_zhp_glowno,
  org: Org.zhp,
  email: 'koliszuzia@gmail.com',
);
const Person ZUZANNA_KOWALCZYK = Person(
  name: 'Zuzanna Kowalczyk',
  stop_h: StopZHP.och,
  hufiec: huf_zhp_stargard,
  druzyna: '1. Choszczeńska Drużyna Starszoharcerska ,,Regulus" im. Janusza Korczaka',
  org: Org.zhp
);
const Person ZUZANNA_MIERZEJEWSKA = Person(
  name: 'Zuzanna Mierzejewska',
  stop_h: StopZHP.och,
  druzyna: '13. Lubańska Drużyna Starszoharcerska "Brzask"',
  hufiec: huf_zhp_luban,
  org: Org.zhp
);
const Person ZUZANNA_WARCHOL = Person(name: 'Zuzanna Warchoł', druzyna: '113. TWDH "Pustynna Burza"', org: Org.zhp, hufiec: huf_zhp_szczecin_pogodno);

class Person{

  final String name;
  final StopZHP stop_h;
  final String stop_i;
  final String druzyna;
  final String hufiec;
  final Org org;
  final String comment;
  final String email;

  const Person({
    @required this.name,
    this.stop_h,
    this.stop_i,
    this.druzyna,
    this.hufiec,
    this.org,
    this.comment,
    this.email
  });
  
}

class PersonCardSimple extends StatelessWidget{

  String get name => person.name;
  StopZHP get stop_h => person.stop_h;
  String get stop_i => person.stop_i;
  String get druzyna => person.druzyna;
  String get hufiec => person.hufiec;
  Org get org => person.org;
  String get comment => person.comment;

  final Person person;
  final Color textColor;

  const PersonCardSimple(this.person, {this.textColor, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if(stop_h != null
            && stop_h != StopZHP.HOc
            && stop_h != StopZHP.HOd
            && stop_h != StopZHP.HRc
            && stop_h != StopZHP.HRd
        ) Text('${stopShortName(stop_h)} ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textColor??textEnab_(context))),
        if(stop_i != null) Text('$stop_i ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textColor??textEnab_(context))),
        Text(name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.bold, color: textColor??textEnab_(context))),
        if(stop_h == StopZHP.HOc
            || stop_h == StopZHP.HOd
            || stop_h == StopZHP.HRc
            || stop_h == StopZHP.HRd
        ) Text(' ${stopShortName(stop_h)}', style: AppTextStyle(color: textColor??textEnab_(context))),
        Expanded(child: Container()),
      ],
    );
  }
}

class PersonCard extends StatelessWidget{

  String get name => person.name;
  StopZHP get stop_h => person.stop_h;
  String get stop_i => person.stop_i;
  String get druzyna => person.druzyna;
  String get hufiec => person.hufiec;
  Org get org => person.org;
  String get comment => person.comment;

  final Person person;
  final double textSize;
  final Color textColor;
  
  const PersonCard(this.person, {this.textSize = Dimen.TEXT_SIZE_BIG, this.textColor, Key key}): super(key: key);

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            if(stop_h != null
                && stop_h != StopZHP.HOc
                && stop_h != StopZHP.HOd
                && stop_h != StopZHP.HRc
                && stop_h != StopZHP.HRd
            ) Text('${stopShortName(stop_h)} ', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
            if(stop_i != null) Text('$stop_i ', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
            Text(name, style: AppTextStyle(fontSize: textSize, fontWeight: weight.halfBold, color: textColor??textEnab_(context))),
            if(stop_h == StopZHP.HOc
                || stop_h == StopZHP.HOd
                || stop_h == StopZHP.HRc
                || stop_h == StopZHP.HRd
            ) Text(' ${stopShortName(stop_h)}', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
            //Expanded(child: Container()),
            if(org != null) Text(' (', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context), fontWeight: weight.halfBold)),
            if(org != null)
              Text(orgName[org], style: AppTextStyle(fontSize: textSize, color: orgColor[org], fontWeight: weight.halfBold)),
            if(org != null) Text(')', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context), fontWeight: weight.halfBold)),

          ],
        ),
      ),

      if(hufiec != null)
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(hufiec, style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
        ),

      if(druzyna != null)
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(druzyna, style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
        ),

    ],
  );
}