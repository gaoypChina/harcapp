import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'hufce.dart';

List<Person> allPeople = [
  ABRAHAM_PRAGER,
  ADAM_DUDAK,
  ADAM_SKLODOWSKI,
  AGNIESZKA_DURSKA,
  AGNIESZKA_RADECKA_KUBICKA,
  AGNIESZKA_TYLKO,
  ALAN_FILAS,
  ALEKSANDRA_ANTKIEWICZ,
  ALEKSANDRA_CHRUSTEK,
  ALEKSANDRA_KOSTRZEWA,
  ALEKSANDRA_KOWALSKA,
  ALEKSANDRA_KOZUBAL,
  ANTONINA_PIERZCHALA,
  ANTONINA_SZTYGLIC,
  ARTUR_KOSTRZEWA,
  ARTUR_RUSA,
  BARBARA_THOMAS,
  BARTOSZ_DABROWSKI,
  BARTOSZ_IGNASIAK,
  BENIAMIN_PLUCINSKI,
  BRUNO_BRONCEL,
  DANIEL_IWANICKI,
  DANIEL_KORZEB,
  DAWID_LOBODA,
  DAWID_WYSZYNSKI,
  DOMINIKA_GORZYNSKA,
  DOMINIKA_HOCHMANSKA,
  DORIAN_JAREK,
  EMILIA_WITKOWSKA,
  EVELINA_STASILOVIC,
  EWA_BYSTRZYNSKA,
  FILIP_BERGIER,
  FILIP_KWIATKOWSKI,
  FILIP_SOCHAJ,
  FILIP_SWIDEREK,
  FRANCISZEK_LINKE,
  FRANCISZEK_MICHALSKI,
  FRANCISZEK_TOMASZCZYK,
  GRZEGORZ_BOROWIEC,
  GRZEGORZ_ZAWADZKI,
  HANNA_CZAJKOWSKA,
  HANNA_RYBACKA,
  HANNA_WNEKOWICZ,
  HELENA_LATOSINSKA,
  HELENA_SWIATKOWSKA,
  HUBERT_FRUKOWSKI,
  HUBERT_JANIK,
  HUBERT_SULSKI,
  JADWIGA_BILINSKA,
  JADWIGA_GORSKA,
  JADWIGA_SZEWCZYK,
  JAGIENKA_KULCZYCKA,
  JAKUB_EJDUK,
  JAKUB_KLUCZKOWSKI,
  JAKUB_MLYNSKI,
  JAKUB_SKUCHA,
  JAKUB_STEFANSKI,
  JAKUB_ZDANOWICZ_ZASIDKO,
  JAN_KUCZA,
  JAN_STANULA,
  JAROSLAW_JAKUBIAK,
  JAROSLAW_ZASACKI,
  JOANNA_MICHALOWSKA,
  JOANNA_PAJAK,
  JULIA_BIENIEK,
  JULIA_GRODZKA,
  JULIA_KARAS,
  JULIA_PILCH,
  JULIA_SIUDMAK,
  JULIA_TYSZKIEWICZ,
  JULIANNA_KLUS,
  JULITA_STEPIEN,
  KACPER_BACZKOWSKI,
  KACPER_CIESIELSKI,
  KACPER_KORDEK,
  KACPER_KOZLUK,
  KACPER_SMOLKA,
  KACPER_SWITKIEWICZ,
  KACPER_SZCZENSY,
  KACPER_TOMCZYK,
  KACPER_WIDZ,
  KACPER_WIETRZYKOWSKI,
  KAJETAN_RUSZKOWSKI,
  KAJETAN_WYGNANSKI,
  KAROLINA_MARCINKOWSKA,
  KAMIL_GORNIK,
  KAMIL_ORGANISTA,
  KAMIL_ZAK,
  KAROL_GOLABEK,
  KAROL_MALUS,
  KATARZYNA_STUDNICKA,
  KLARA_MAZEK,
  KLAUDIA_STASINSKA,
  KLAUDIUSZ_PALUCH,
  KORNEL_GOLEBIEWSKI,
  KORNELIA_PRZYCZOLKA,
  KRZYSZTOF_KANIEWSKI,
  KRZYSZTOF_KRAWCZYK,
  KRZSZTOF_MALIKIEWICZ,
  LAURA_FRASZEWSKA,
  LAURA_NOWAKOWSKA,
  LILIANA_MIROTA,
  LUKASZ_SZEPIELAK,
  LUKASZ_KRYWULT,
  LUKASZ_RYBINSKI,
  LUCJA_SLAZYK,
  MACIEJ_BATKO,
  MACIEJ_GRZELAZKA,
  MACIEJ_LADOS,
  MACIEJ_PAWLICA,
  MACIEJ_SZOLC,
  MALGORZATA_KLOC,
  MALWINA_TRUSZKOWSKA,
  MARCEL_RYCHTER,
  MARCIN_JANKOWIAK,
  MAREK_LEWANCZYK,
  MAREK_MUSIALIK,
  MARLENA_BANIA,
  MARIA_MAGDALENA_DESKUR,
  MARTA_SZYMANDERSKA,
  MARTYNA_BULAKOWSKA,
  MARTYNA_WASILEWSKA,
  MARYSIA_SLUGAJ,
  MATEUSZ_CIAGLO,
  MATEUSZ_GAWRYSIAK,
  MATEUSZ_KOBYLAREK,
  MATEUSZ_KORZENIOWSKI,
  MATEUSZ_MIKLASZEWSKI,
  MAXIMILIAN_STEINHOFF,
  MICHAL_DYDERSKI,
  MICHAL_JABCZYNSKI,
  MICHAL_JANAS,
  MICHAL_KARWOWSKI,
  MICHAL_METEL,
  MIKOLAJ_GORECKI,
  MIKOLAJ_LUKASIK,
  MICHAL_SUPINSKI,
  NADIA_OSSOWSKA,
  NADIA_WYSZOGRODZKA,
  NATALIA_STODOLNA,
  OLGA_JAJKO,
  OLIWIA_STANCZYK,
  OLIWIER_STARCZEWSKI,
  OSKAR_PARDYAK,
  PATRYCJA_PIETRAS,
  PATRYCJA_SZCZESNA,
  PAULINA_BURDZIK,
  PAULINA_LUBOS,
  PAWEL_KIMEL,
  PAWEL_MARUD,
  PIOTR_MACIEJ_KABATA,
  PIOTR_SOSNOWSKI,
  PIOTR_TUROWSKI,
  PIOTR_ZIEMBIKIEWICZ,
  PRZEMYSLAW_KLUCZKOWSKI,
  RADOSLAW_RELIDZYNSKI,
  RAFAL_BARAN,
  RAFAL_KOWALSKI,
  RAFAL_LALIK,
  ROBERT_MAZUR,
  ROBERT_ROBOTYCKI,
  SANDRA_RZESZUREK,
  SARA_WALCZYNSKA_GORA,
  SEBASTIAN_KOPROWSKI,
  SEBASTIAN_SUGALSKI,
  SEWERYN_WOLINSKI,
  STANISLAW_WRONSKI,
  STEFAN_KRYCZKA,
  SZYMON_BARCZYK,
  SZYMON_CHORAZY,
  SZYMON_DRATWINSKI,
  SZYMON_DROPEK,
  SZYMON_JAWOREK,
  SZYMON_PODGORNY,
  SZYMON_ZDZIEBKO,
  TOMASZ_BUKOWIECKI,
  WANDA_MARCHEL,
  WERONIKA_ZAWIERUCHA,
  WIKTOR_KARPALA,
  WIKTORIA_WOJCIK,
  WINCENTY_DIETRYCH,
  WOJCIECH_GRUSZCZYNSKI,
  WOJCIECH_TURSKI,
  WOJCIECH_WALACH,
  WOJCIECH_WOLNIK,
  WOJCIECH_ZIELINSKI,
  ZBYSZEK_CHODAKOWSKI,
  ZOFIA_FABROWSKA,
  ZOFIA_KOSIDER,
  ZOFIA_SZAFRANEK,
  ZOFIA_ZAWADZKA,
  ZUZANNA_JAWORSKA,
  ZUZANNA_KOLIS,
  ZUZANNA_KOWALCZYK,
  ZUZANNA_MIERZEJEWSKA,
  ZUZANNA_PIWKO,
  ZUZANNA_WARCHOL
];

Map<String, Person> __getAllPeopleByEmailMap(){
  Map<String, Person> result = {};

  for(Person person in allPeople)
    for(String email in person.email)
      result[email] = person;

  return result;
}

Map<String, Person> allPeopleByEmailMap = __getAllPeopleByEmailMap();

const Person ABRAHAM_PRAGER = Person(
  name: 'Abraham Prager',
  druzyna: '1. Czarnkowska Drużyna Wielopoziomowa „Puszcza” im. Jana Kilińskiego',
  email: ['abraham.p@wp.pl']
);
const Person ADAM_DUDAK = Person(name: 'Adam Dudak', hufiec: huf_zhp_warszawa_ursynow, druzyna: '234 Warszawska Drużyna Harcerska "Forteca"');
const Person ADAM_SKLODOWSKI = Person(
name: 'Adam Skłodowski',
druzyna: '58 MDH "Cichociemni"',
hufiec: 'Eldorado',
stopH: StopZHP.zhrWywiadowca,
org: Org.zhr_o,
email: []
);
const Person AGNIESZKA_DURSKA = Person(name: 'Agnieszka Durska', stopI: 'phm.', hufiec: huf_zhp_lodz_baluty);
const Person AGNIESZKA_RADECKA_KUBICKA = Person(
    name: 'Agnieszka Radecka-Kubicka ',
    druzyna: '5. Gromada Zuchów',
    hufiec: huf_zhp_ziemi_sanockiej,
    org: Org.zhp,
    email: ['irja@interia.pl']
);
const Person AGNIESZKA_TYLKO = Person(name: 'Agnieszka Tylko', stopH: StopZHP.zhpPionierka,
  hufiec: huf_zhp_myslenice,
  druzyna: '3,14. Myślenicka Drużyna Starszoharcerska "Awangarda"',
  org: Org.zhp,
);
const Person ALAN_FILAS = Person(
  name: 'Alan Filas',
  stopI: 'phm.',
  druzyna: '2. Szczep „Malta”',
  hufiec: huf_zhp_poznan_nowe_miasto,
  email: ['alan.filas@zhp.net.pl']
);

const Person ALEKSANDRA_ANTKIEWICZ = Person(
    name: 'Ola Antkiewicz ',
    druzyna: '35. Chynowska Drużyna Wielopoziomowa "Vis Verum"',
    hufiec: huf_zhp_grojec,
    org: Org.zhp,
    email: ['drzewonadrzewie@gmail.com']
);
const Person ALEKSANDRA_CHRUSTEK = Person(
    name: 'Aleksandra Chrustek',
    stopH: StopZHP.zhpHOd,
    stopI: 'pwd.',
    hufiec: huf_zhp_warszawa_mokotow,
    org: Org.zhp,
    email: ['olachrustek@gmail.com']
);
const Person ALEKSANDRA_KOSTRZEWA = Person(name: 'Ola Kostrzewa', org: Org.zhp);
const Person ALEKSANDRA_KOWALSKA = Person(
    name: 'Aleksandra Kowalska ',
    druzyna: '17. ZODH',
    hufiec: huf_zhp_zgierz,
    email: ['kowalskaola057@gmail.com'],
    org: Org.zhp,
);
const Person ALEKSANDRA_KOZUBAL = Person(name: 'Aleksandra Kozubal', stopH: StopZHP.zhpSamarytanka, org: Org.zhp);
const Person ANTONINA_PIERZCHALA = Person(
    name: 'Antonina Pierzchała',
    druzyna: '41 Drużyna Harcerska "Huba"',
    hufiec: huf_zhp_ostrowiec_swietokrzyski,
    org: Org.zhp,
    email: ['tosiaczek118@gmail.com']
);
const Person ANTONINA_SZTYGLIC = Person(
  name: 'Antonina Sztyglic',
  hufiec: huf_zhp_lask,
  druzyna: '5. Wieluńska Drużyna Harcerek Starszych "Kozy"',
  org: Org.zhp,
  email: ['sztyglica@gmail.com']
);
const Person ARTUR_KOSTRZEWA = Person(
  name: 'Artur Kostrzewa',
  druzyna: 'Puszczanie',
  hufiec: huf_zhp_krakow_pdg,
  org: Org.zhp,
  email: ['arturkos321@gmail.com'],
);
const Person ARTUR_RUSA = Person(name: 'Artur Rusa', stopH: StopZHP.zhpWywiadowca, hufiec: huf_zhp_pulawy, druzyna: '113 SDSH', org: Org.zhp,);
const Person BARBARA_THOMAS = Person(name: 'Barbara Thomas', stopI: 'phm.');
const Person BARTOSZ_DABROWSKI = Person(name: 'Bartosz Dąbrowski', stopH: StopZHP.zhpWywiadowca, org: Org.zhp);
const Person BARTOSZ_IGNASIAK = Person(name: 'Bartosz Ignasiak', stopH: StopZHP.zhpHOc, stopI: 'pwd.', druzyna: '8 Drużyna Wędrownicza "Kuźnia Płomienia"');
const Person BENIAMIN_PLUCINSKI = Person(
  name: 'Beniamin Pluciński',
  druzyna: '17. ZODH',
  email: ['ekhemmmik@gmail.com']
);
const Person BRUNO_BRONCEL = Person(
  name: 'Bruno Broncel',
  stopH: StopZHP.zhpMlodzik,
  druzyna: '55. DHSiW "Exigo"',
  hufiec: huf_zhp_karkonoski,
  org: Org.zhp,
  email: ['bruno.broncel@gmail.com']
);
const Person DANIEL_IWANICKI = Person(
    name: 'Daniel Iwanicki',
    stopH: StopZHP.zhpHOc,
    stopI: 'phm.',
    druzyna: '72. WDHS "Uroczysko"',
    email: ['daniel.iwanicki@zhp.net.pl']
);
const Person DANIEL_KORZEB = Person(name: 'Daniel Korzeb', stopH: StopZHP.zhpOdkrywca,
  druzyna: '39. HDŻ Burza',
  hufiec: huf_zhp_czestochowa,
  org: Org.zhp,
);
const Person DAWID_LOBODA = Person(
    name: 'Dawid Łoboda',
    druzyna: '63. GDH im. mi. Hieronima Degutowskiego "Zapora"',
    hufiec: huf_zhr_3_gdynski,
    stopH: StopZHP.zhrHOc,
    org: Org.zhr_o,
    email: ['dawidekk728@gmail.com']
);
const Person DAWID_WYSZYNSKI = Person(name: 'Dawid Wyszyński', stopH: StopZHP.dhc, org: Org.zhp,);
const Person DOMINIKA_GORZYNSKA = Person(name: 'Dominika Gorzyńska', stopH: StopZHP.zhpPionierka,
  druzyna: '11. Gdańska Drużyna Starszoharcerska "Cegły" im. Anny Burdówny',
  hufiec: huf_zhp_gdansk_srodmiesie,
  org: Org.zhp,
);
const Person DOMINIKA_HOCHMANSKA = Person(
  name: 'Dominika Hochmańska',
  stopI: 'pwd.',
  org: Org.zhp
);
const Person DORIAN_JAREK = Person(name: 'Dorian Jarek', stopI: 'pwd.',
    druzyna: '13. Konińska Drużyna Wędrownicza "Wadery"',
    hufiec: huf_zhp_konin,
    org: Org.zhp);
const Person EMILIA_WITKOWSKA = Person(
    name: 'Emilia Witkowska',
    druzyna: '307 WDHiZ',
    hufiec: 'Warszawa Mokotów',
    stopI: 'pwd.',
    stopH: StopZHP.zhpHRd,
    org: Org.zhp,
    email: ['emilia.witkowska@zhp.net.pl', 's206102@sggw.edu.pl']
);
const Person EVELINA_STASILOVIC = Person(
  name: 'Evelina Stasilovič',
  stopH: StopZHP.zhpOchotniczka,
  druzyna: '9. Wileńska Drużyna Harcerek "Viator" im. kardynała Stefana Wyszyńskiego',
  org: Org.zhp_n_l,
  email: ['evelina.stasilovic@gmail.com']
);
const Person EWA_BYSTRZYNSKA = Person(name: 'Ewa Bystrzyńska', stopH: StopZHP.dhd, org: Org.zhp);
const Person FILIP_BERGIER = Person(
    name: 'Filip Bergier',
    stopH: StopZHP.zhpWywiadowca,
    druzyna: '72. WDHS "Uroczysko"',
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp,
    email: ['janberg7272@gmail.com', 'filip.bergier@zhp.net.pl']
);
const Person FILIP_KWIATKOWSKI = Person(name: 'Filip Kwiatkowski', stopH: StopZHP.dhc, org: Org.zhp);
const Person FILIP_SOCHAJ = Person(name: 'Filip Sochaj');
const Person FILIP_SWIDEREK = Person(name: 'Filip Świderek');
const Person FRANCISZEK_LINKE = Person(
  name: 'pwd. Franciszek Linke',
  stopI: 'pwd.',
  org: Org.zhp,
  email: ['franciszek.linke@zhp.net.pl']
);
const Person FRANCISZEK_MICHALSKI = Person(
    name: 'Franciszek Michalski ',
    druzyna: '254. WDH Matecznik im. Janka Bytnara "Rudego"',
    hufiec: huf_zhp_warszawa_zoliborz,
    org: Org.zhp,
    email: ['franciszek.michalski@zhp.net.pl']
);
const Person FRANCISZEK_TOMASZCZYK = Person(
  name: 'Franciszek Tomaszczyk',
  stopH: StopZHP.zhpWywiadowca, hufiec: huf_zhp_ziemi_cieszynskiej,
  druzyna: '33. CDH "Czarne stopy", 4. GZ "Radosne Misie"',
  org: Org.zhp
);
const Person GRZEGORZ_BOROWIEC = Person(
  name: 'Grzegorz Borowiec',
  stopH: StopZHP.zhpHOc,
  druzyna: '66. WDW "Tornado"',
  hufiec: huf_zhp_torun,
  org: Org.zhp,
);
const Person GRZEGORZ_ZAWADZKI = Person(
    name: 'Grzegorz Zawadzki',
    druzyna: '8. DSH "Ignis"',
    hufiec: huf_zhp_kutno,
);
const Person HANNA_CZAJKOWSKA = Person(
  name: 'Hanna Czajkowska',
  org: Org.zhp,
  email: ['hanna.czajkowska@zhp.net.pl']
);
const Person HANNA_RYBACKA = Person(name: 'Hanna Rybacka',
  druzyna: 'Gromada Zuchowa Ogniste Feniksy',
  hufiec: huf_zhp_zdunska_wola,
  stopH: StopZHP.zhpSamarytanka,
  stopI: 'pwd.',
  org: Org.zhp,
  email: ['hanna.rybacka@zhp.net.pl']
);
const Person HANNA_WNEKOWICZ = Person(
  name: 'Hanna Wnękowicz',
  druzyna: '12. DH Szare Wilki w Brodach',
  hufiec: huf_zhp_zary,
  org: Org.zhp,
  email: ['hannawnekowicz93@gmail.com']
);
const Person HELENA_LATOSINSKA = Person(name: 'Helena Latosińska',
  druzyna: '39. Wielopoziomowa Drużyna Harcerska "Leśne Stwory z Radlina"',
  hufiec: huf_zhp_ziemi_wodzislawskiej,
  org: Org.zhp,
);
const Person HELENA_SWIATKOWSKA = Person(
    name: 'Helena Świątkowska ',
    druzyna: '',
    hufiec: '',
    stopH: StopZHP.zhpSamarytanka,
    org: Org.zhr_o,
    email: ['helena.swiatkowska@zhr.pl']
);
const Person HUBERT_FRUKOWSKI = Person(
  name: 'Hubert Frukowski'
);
const Person HUBERT_JANIK = Person(
  name: 'Hubert Janik',
  druzyna: '7. BDH "Białe Czaple"',
  hufiec: huf_zhp_bydgoszcz_miasto,
  org: Org.zhp,
  email: ['hubert.janik@zhp.net.pl']
);
const Person HUBERT_SULSKI = Person(
    name: 'Hubert Sulski',
    druzyna: '23. DSH Legendarne Smoki',
    hufiec: huf_zhp_ziemi_wodzislawskiej,
    stopH: StopZHP.dhc,
    org: Org.zhp,
    email: ['hksik2007@gmail.com']
);
const Person JADWIGA_BILINSKA = Person(
  name: 'Jadwiga Bilińska',
  stopI: 'phm.',
  stopH: StopZHP.zhpSamarytanka,
  hufiec: huf_zhp_zielonka,
  druzyna: '132. Mazowiecka Drużyna Harcerska "Wielkie Bractwo Halicza"',
  org: Org.zhp,
  email: ['jadwiga.bilinska@zhp.net.pl']
);
const Person JADWIGA_GORSKA = Person(
  name: 'Jadwiga Górska',
  stopH: StopZHP.zhpHOd,
  email: ['jdzgorska@gmail.com', 'jadwiga.gorska@zhp.net.pl'],
  org: Org.zhp
);
const Person JADWIGA_SZEWCZYK = Person(
  name: 'Jadwiga Szewczyk',
  email: ['jadzia.m.szewczyk@gmail.com'],
);
const Person JAGIENKA_KULCZYCKA = Person(
  name: 'Jagienka Kulczycka',
  stopH: StopZHP.zhpOchotniczka,
  druzyna: '36. Kaliska Drużyna Harcerska "Orły"',
  hufiec: huf_zhp_kalisz,
  org: Org.zhp,
  email: ['jagienkakulczycka@gmail.com', 'kulczyckajagienka@gmail.com'],
);
const Person JAKUB_EJDUK = Person(
    name: 'Jakub Ejduk',
    stopI: 'pwd.',
    stopH: StopZHP.zhpHOc,
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp
);
const Person JAKUB_KLUCZKOWSKI = Person(
    name: 'Jakub Kluczkowski',
    stopI: 'pwd.',
    stopH: StopZHP.zhpHOc,
    hufiec: huf_zhp_ziemi_koszalinskiej,
    org: Org.zhp,
    email: ['jakub.kluczkowski@zhp.net.pl']
);
const Person JAKUB_MLYNSKI = Person(
  name: 'Jakub Młyński',
  druzyna: '77. WDH im."Harcerskiego Batalionu Szturmowego Zośka"',
  hufiec: huf_zhp_gdansk_srodmiesie,
  org: Org.zhp,
  email: ['kubamlynski4@gmail.com']
);
const Person JAKUB_SKUCHA = Person(name: 'Jakub Skucha', stopH: StopZHP.dhc);
const Person JAKUB_STEFANSKI = Person(name: 'Jakub Stefański', stopH: StopZHP.dhc, org: Org.zhp);
const Person JAKUB_ZDANOWICZ_ZASIDKO = Person(name: 'Jakub Zdanowicz-Zasidko', stopH: StopZHP.dhc);
const Person JAN_KUCZA = Person(
  name: 'Jan Kucza',
  org: Org.zhp,
  email: ['jan.kucza@zhp.net.pl']
);
const Person JAN_STANULA = Person(
  name: 'Jan Stanula',
  druzyna: '4. DSH Ogniste Płomyki',
  hufiec: huf_zhp_trzebinia,
  org: Org.zhp
);
const Person JAROSLAW_JAKUBIAK = Person(name: 'Jarosław Jakubiak', stopH: StopZHP.dhc,
  hufiec: huf_zhp_uk,
);
const Person JAROSLAW_ZASACKI = Person(name: 'Jarosław Zasacki', stopH: StopZHP.zhpHOc, stopI: 'phm.',
  hufiec: huf_zhr_zielonagora_topor,
  org: Org.zhr_c,
);
const Person JOANNA_MICHALOWSKA = Person(name: 'Joanna Michałowska', stopH: StopZHP.zhpSamarytanka,
  druzyna: '18. Poznańska Drużyna Harcerek im. Olgi Drahonowskiej-Małkowskiej',
  org: Org.zhp,
);
const Person JOANNA_PAJAK = Person(
name: 'Asia Pająk',
druzyna: '124ŁGDH Płomienie',
hufiec: huf_zhp_lodz_gorna,
stopH: StopZHP.zhpHOd,
org: Org.zhp,
email: ['joanna.pajak@zhp.net.pl', 'pasiajak1@gmail.com']
);
const Person JULIA_BIENIEK = Person(
    name: 'Julia Bieniek',
    druzyna: '254. Warszawska Drużyna Harcerska im. Janka Bytnara "Rudego" Matecznik',
    org: Org.zhp,
    email: ['juliamariabieniek@gmail.com']
);
const Person JULIA_GRODZKA = Person(
    name: 'Julka Grodzka',
    druzyna: '2. DH Śpiący Rycerz',
    hufiec: huf_zhp_ziemi_rybnickiej,
    stopH: StopZHP.zhpSamarytanka,
    email: ['jucia.grodzka@gmail.com', 'grodzka.julia@zhp.net.pl']
);
const Person JULIA_KARAS = Person(
  name: 'Julia Karaś',
  stopH: StopZHP.zhpPionierka,
  druzyna: '78. Grunwaldzka Wielopoziomowa Drużyna Harcerska Halny im. hm. Józefy Kantor',
  hufiec: huf_zhp_beskidzki,
  org: Org.zhp,
  email: ['karasjulka81@gmail.com']
);
const Person JULIA_PILCH = Person(name: 'Julia Pilch', stopH: StopZHP.dhd,);
const Person JULIA_SIUDMAK = Person(name: 'Julia Siudmak');
const Person JULIA_TYSZKIEWICZ = Person(
    name: 'Julia Tyszkiewicz',
    druzyna: '328. WDW "Fantasmagoria"',
    hufiec: huf_zhp_warszawa_centrum,
    org: Org.zhp,
    email: ['julia.tyszkiewicz@zhp.net.pl']
);
const Person JULIANNA_KLUS = Person(
  name: 'Julianna Klus',
  druzyna: '208. Warszawska Drużyna Harcerska "Helios"',
  hufiec: huf_zhp_warszawa_mokotow,
  org: Org.zhp,
  email: ['julianna.klus@zhp.net.pl', 'julianna.klus4@gmail.com']
);
const Person JULITA_STEPIEN = Person(name: 'Julita Stępień');
const Person KACPER_BACZKOWSKI = Person(name: 'Kacper Bączkowski', stopH: StopZHP.dhc, org: Org.zhp);
const Person KACPER_CIESIELSKI = Person(
    name: 'Kacper Ciesielski',
    druzyna: '17. Zgierska Obronną Drużyna Harcerska "Sokoły"',
    hufiec: huf_zhp_zgierz,
    stopH: StopZHP.zhpOdkrywca,
    org: Org.zhp,
    email: ['yorunokoibito@gmail.com']
);
const Person KACPER_KORDEK = Person(name: 'Kacper Kordek', stopH: StopZHP.zhpCwik);
const Person KACPER_KOZLUK = Person(
  name: 'Kacper Koźluk',
  email: ['kacper@kozluk.pl']
);
const Person KACPER_SMOLKA = Person(name: 'Kacper Smółka', org: Org.zhp, email: ['kacper.smolka@zhp.net.pl ']);
const Person KACPER_SWITKIEWICZ = Person(name: 'Kacper Świtkiewicz', stopH: StopZHP.dhc, org: Org.zhp);
const Person KACPER_SZCZENSY = Person(name: 'Kacper Szczęsny', stopH: StopZHP.zhpWywiadowca, org: Org.zhp);
const Person KACPER_TOMCZYK = Person(
  name: 'Kacper Tomczyk',
  druzyna: '77. Wrzesińska Drużyna Wędrownicza "Huragan"',
  hufiec: huf_zhp_wrzesnia_wrzos,
  org: Org.zhp,
  email: ['celnysnajper@gmail.com']
);
const Person KACPER_WIDZ = Person(
    name: 'Kacper Widz',
    stopH: StopZHP.zhpMlodzik,
    org: Org.zhp,
    hufiec: huf_zhp_lublin,
    druzyna: '8. Lubelska Drużyna Wędrownicza "Infiniti"',
);
const Person KACPER_WIETRZYKOWSKI = Person(
  name: 'Kacper Wietrzykowski',
  org: Org.zhp,
  email: ['kacper.wietrzykowski@zhp.net.pl']
);

const KAJETAN_RUSZKOWSKI = Person(
  name: 'Kajetan Ruszkowski',
  druzyna: 'XV. ŁDH ,,Zielony Płomień" im. Andrzeja Małkowskiego',
  hufiec: huf_zhr_lodz,
  stopH: StopZHP.zhpHOc,
  org: Org.zhr_o,
);
const Person KAJETAN_WYGNANSKI = Person(
  name: 'Kajetan Wygrański',
  druzyna: '62. MDSH "Krzemień"',
  hufiec: huf_zhp_pruszkow,
  stopH: StopZHP.zhpOdkrywca,
  org: Org.zhp,
);
const Person KAROLINA_MARCINKOWSKA = Person(name: 'Karolina Marcinkowska');
const Person KAMIL_GORNIK = Person(
  name: 'Kamil Gurnik',
  stopH: StopZHP.zhpCwik,
  druzyna: '64. WDHS Etos',
  hufiec: huf_zhp_warszawa_praga_pn,
  org: Org.zhp,
  email: ['kamilgurnik@gmail.com']
);
const Person KAMIL_ORGANISTA = Person(
    name: 'Kamil Organista',
    stopI: 'pwd.',
    stopH: StopZHP.zhpHOc,
    org: Org.zhp,
    email: ['k.furiao@gmail.com', 'k.organista@onet.pl']
);
const Person KAMIL_ZAK = Person(name: 'Kamil Żak', stopH: StopZHP.zhpHOc);
const Person KAROL_GOLABEK = Person(
  name: 'Karol Gołąbek',
  stopH: StopZHP.zhpMlodzik,
  druzyna: '44. Drużyna Starszoharcerska "Potok" w Miękinii',);
const Person KAROL_MALUS = Person(name: 'Karol Malus', stopH: StopZHP.dhc);
const Person KATARZYNA_STUDNICKA = Person(
    name: 'Katarzyna Studnicka',
    stopI: 'pwd.',
    stopH: StopZHP.dhd,
    druzyna: '12. DH "Na Tropie"',
    hufiec: huf_zhp_andrychow, org: Org.zhp,
    email: ['katarzyna.studnicka@zhp.net.pl']
);
const Person KLARA_MAZEK = Person(name: 'Klara Mazek');
const Person KLAUDIA_STASINSKA = Person(
  name: 'Klaudia Stasińska',
  stopI: 'phm.',
  stopH: StopZHP.zhpHOd,
  druzyna: '45 Nowomiejska Gromada Zuchowa „Czterolistne Koniczynki”',
  hufiec: huf_zhp_poznan_nowe_miasto,
  org: Org.zhp,
  email: ['klaudia.stasinska@zhp.net.pl', 'claudia.stasinska@gmail.com']
);
const Person KLAUDIUSZ_PALUCH = Person(name: 'Klaudiusz Paluch');
const Person KORNEL_GOLEBIEWSKI = Person(
  name: 'Kornel Gołębiewski',
  email: ['kornelg2001@wp.pl']
);
const Person KORNELIA_PRZYCZOLKA = Person(
  name: 'Kornelia Przyczółka',
  stopH: StopZHP.zhpOchotniczka,
  email: ['alicjaspacer@gmail.com'],
);
const Person KRZYSZTOF_KANIEWSKI = Person(
  name: 'Krzysztof Kaniewski',
  stopH: StopZHP.zhpHOc,
  druzyna: '1. DW "Geneza"',
  hufiec: huf_zhp_legionowo,
  org: Org.zhp,
  email: ['krzysztof.kaniewski@zhp.net.pl']
);
const Person KRZYSZTOF_KRAWCZYK = Person(name: 'Krzysztof Krawczyk', stopH: StopZHP.dhc);
const Person KRZSZTOF_MALIKIEWICZ = Person(
  name: 'Krzysztof Malikiewicz',
  stopH: StopZHP.zhpHRc,
  hufiec: huf_zhp_trzebinia,
  email: ['krzysztof.malikiewicz@zhp.net.pl']
);
const Person LAURA_FRASZEWSKA = Person(name: 'Laura Fraszewska');
const Person LAURA_NOWAKOWSKA = Person(
  name: 'Laura Nowakowska',
  druzyna: '25. GGDSH "Zawiszacy" im. dh. Stefana Mirowskiego',
  hufiec: huf_zhp_grodzisk_mazowiecki,
  org: Org.zhp,
  email: ['kocham.racuchy.pl@gmail.com', 'laura.elwartowska@edu.sp1grodzisk.pl']
);
const Person LILIANA_MIROTA = Person(
    name: 'Liliana Mirota',
    druzyna: '7 BDH wrzosowisko',
    hufiec: huf_zhp_redukta,
    stopH: StopZHP.zhpOchotniczka,
    org: Org.zhp,
    email: ['lilianamirota@gmail.com', 'lilianokotek@wp.pl']
);
const Person LUKASZ_SZEPIELAK = Person(name: 'Łukasz Szepielak', stopH: StopZHP.dhc, org: Org.zhp,);
const Person LUKASZ_SZTANDERA = Person(
  name: 'Łukasz Sztandera',
  stopH: StopZHP.zhpWywiadowca,
  hufiec: huf_zhp_kielce_poludnie,
  druzyna: '29. Kielecka Drużyna Harcerska "Bukowina"',
  org: Org.zhp,
  email: ['lukasz.sztandera@zhp.net.pl']
);
const Person LUKASZ_KRYWULT = Person(name: 'Łukasz Krywult', stopH: StopZHP.zhpCwik, org: Org.zhp,);
const Person LUKASZ_RYBINSKI = Person(name: 'Łukasz Rybiński', stopI: 'pwd.');
const Person LUCJA_SLAZYK = Person(
    name: 'Łucja Ślazyk',
    druzyna: '47. ŁWDW',
    hufiec: huf_zhp_lodz_polesie,
    stopH: StopZHP.dhd,
    email: ['l.z.slazyk@gmail.com', 'podstawczak0@gmail.com']
);
const Person MACIEJ_BATKO = Person(name: 'Maciej Batko', stopH: StopZHP.dhc,
  druzyna: '117. Elbląskiej Męskiej Drużyny Harcerskiej "Mato"',
  email: ['maciej.batko@uczen11.elblag.pl', 'maciemaciek160@gmail.com', 'maciut2007@gmail.com']
);
const Person MACIEJ_GRZELAZKA = Person(
    name: 'Maciej Grzelązka ',
    druzyna: '314. "Pierścienia"',
    hufiec: '',

    stopH: StopZHP.zhpMlodzik,
    org: Org.zhp,
    email: ['maciej.grzelazka@gmail.com']
);
const Person MACIEJ_LADOS = Person(
  name: 'Maciej Ładoś',
  stopI: 'pwd.',
  druzyna: '8. PgDW Granat',
  hufiec: huf_zhp_krakow_pdg,
  org: Org.zhp,
  email: ['macieklad@gmail.com', 'maciej.lados@zhp.net.pl'],
);
const Person MACIEJ_PAWLICA = Person(
  name: 'Maciej Pawlica',
  druzyna: '1. Nadarzyńska Drużyna Starszoharcerska "Impessa"',
  hufiec: huf_zhp_pruszkow,
  org: Org.zhp,
  email: ['maciek.pawlica@outlook.com']
);
const Person MACIEJ_SZOLC = Person(
  name: 'Maciej Szolc',
  druzyna: '17. Drużyna Harcerska "Salamandra" z Jejkowic',
  hufiec: huf_zhp_ziemi_rybnickiej,
  email: ['maciekszolc12@gmail.com']
);
const Person MALGORZATA_KLOC = Person(
  name: 'Małgorzata Kloc',
  stopH: StopZHP.zhpPionierka,
  druzyna: '9. Gliwicka Drużyna Harcerzy Starszych "Lukarna" im. płk. Witolda Pileckiego',
  hufiec: huf_zhp_ziemi_gliwickiej,
  org: Org.zhp,
  email: ['malgorzata.kloc@zhp.net.pl']
);
const MALWINA_TRUSZKOWSKA = Person(
  name: 'Malwina Truszkowska',
  stopH: StopZHP.zhpPionierka,
  druzyna: '23. Warszawska Drużyna Wędrownicza „Binduga”',
  hufiec: huf_zhp_warszawa_mokotow,
  org: Org.zhp,
  email: ['malwina.truszkowska@zhp.net.pl', 'malvisianna@gmail.com']
);
const Person MARCEL_RYCHTER = Person(
  name: 'Marcel Rychter',
  druzyna: 'Szczep Podhale, Toronto, Kanada',
  email: ['m.rychter@gmail.com', 'm.rychter1441@gmail.com']
);
const Person MARCIN_JANKOWIAK = Person(name: 'Marcin Jankowiak', hufiec: huf_zhp_jarocin, org: Org.zhp,);
const Person MAREK_LEWANCZYK = Person(
  name: 'Marek Lewańczyk',
  stopH: StopZHP.zhpHOc,
  stopI: 'pwd.',
  druzyna: '7. GDH "Wilki"',
  email: ['marek.lewanczyk@zhp.net.pl']
);
const Person MAREK_MUSIALIK = Person(name: 'Marek Musialik', stopH: StopZHP.dhc, org: Org.zhp);
const Person MARLENA_BANIA = Person(
    name: 'Marlena Bania',
    stopH: StopZHP.zhpPionierka,
    druzyna: '9. Gliwicka Drużyna Harcerzy Starszych "Lukarna" im. Witolda Pileckiego',
    hufiec: huf_zhp_ziemi_gliwickiej,
    org: Org.zhp,
    email: ['marlena.bania6474@gmail.com', 'marlena.bania@zhp.net.pl']
);
const Person MARIA_MAGDALENA_DESKUR = Person(
  name: 'Maria Magdalena Deskur',
  email: ['nenadeskur12@gmail.com']
);
const Person MARTA_SZYMANDERSKA = Person(name: 'Marta Szymanderska', stopH: StopZHP.dhd, hufiec: huf_zhp_warszawa_mokotow, org: Org.zhp);
const Person MARTYNA_BULAKOWSKA = Person(
  name: 'Martyna Bułakowska',
  stopH: StopZHP.zhpHOd,
  stopI: 'pwd.',
  druzyna: '17 Rudzka Grubwaldzka Drużyna Harcerska "VICTORY"',
  hufiec: huf_zhp_ruda_slaska,
  org: Org.zhp,
  email: ['m.bulakowska1997@gmail.com']
);
const Person MARTYNA_WASILEWSKA = Person(
    name: 'Martyna Wasilewska',
    druzyna: '7. BDSH "Żywica"',
    hufiec: 'Reduta',
    stopH: StopZHP.zhpPionierka,
    org: Org.zhp,
    email: ['martynawasilewska.1972@gmail.com', 'martynawas91@gmail.com']
);
const Person MARYSIA_SLUGAJ = Person(
  name: 'Marysia Ślugaj',
  stopH: StopZHP.zhpHOd,
  hufiec: huf_zhp_wrzesnia_wrzos,
  druzyna: '77. Wrzesińska Drużyna Wędrownicza "Huragan"',
  email: ['nutkiq@gmail.com', 'giyuu@op.pl']
);
const Person MATEUSZ_CIAGLO = Person(name: 'Mateusz Ciągło', stopH: StopZHP.dhc);
const Person MATEUSZ_GAWRYSIAK = Person(name: 'Mateusz Gawrysiak', stopH: StopZHP.zhpCwik);
const Person MATEUSZ_KOBYLAREK = Person(
    name: 'Mateusz Kobylarek',
    stopH: StopZHP.zhpMlodzik,
    druzyna: '35. Poznańska Drużyna Harcerska im. I Polskiej Samodzielnej Kompanii Commando',
    hufiec: huf_zhp_poznan_wilda,
    org: Org.zhp,);
const Person MATEUSZ_KORZENIOWSKI = Person(
    name: 'Mateusz Korzeniowski ',
    druzyna: '1. DH D.R.E.S.Z.C.Z',
    hufiec: huf_zhp_wieliczka,

    stopH: StopZHP.dhc,
    org: Org.zhp,
    email: ['mateusz.korzeniowski@zhp.net.pl']
);
const Person MATEUSZ_MIKLASZEWSKI = Person(
    name: 'Mateusz Miklaszewski ',
    druzyna: '12. DH Silva',
    hufiec: huf_zhp_augustow,
    stopI: 'pwd.',
    stopH: StopZHP.dhc,
    org: Org.zhp,
    email: ['mateusz.miklaszewski@gmail.com']
);
const Person MAXIMILIAN_STEINHOFF = Person(
  name: 'Maximilian Steinhoff',
  //stop_h: StopZHP.dhc,
  stopI: 'pwd.',
  druzyna: 'Próbna Drużyna Harcerzy w Berlinie ZHP Świat "Miś Wojtek"',
);
const Person MICHAL_DYDERSKI = Person(
  name: 'Michał Dyderski',
  stopH: StopZHP.zhpHOc,
  stopI: 'pwd.',
  druzyna: '93. PDW',
  hufiec: huf_zhp_poznan_wilda,
  org: Org.zhp,
  email: ['michal.dyderski6@gmail.com', 'michal.dyderski@zhp.net.pl']
);
const Person MICHAL_JABCZYNSKI = Person(
  name: 'Michał Jabczyński',
  stopH: StopZHP.zhpHRc,
  stopI: 'pwd.',
  druzyna: '9. DH "Feniks"',
  hufiec: huf_zhp_gniezno,
  org: Org.zhp,
  email: ['michal.jabczynski@gmail.com']
);
const Person MICHAL_JANAS = Person(
  name: 'Michał Janas',
  email: ['mdjanas@gmail.com']
);
const Person MICHAL_KARWOWSKI = Person(
    name: 'Michał Karwowski',
    stopH: StopZHP.zhpHOc,
    stopI: 'phm.',
    druzyna: '72. Szczep WDHiGZ "Ostoja"',
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp,
);
const Person MICHAL_METEL = Person(
  name: 'Michał Mętel',
  druzyna: 'Szczep „Unia” im. Władysława Jagiełły',
  stopH: StopZHP.zhpHOc,
  stopI: 'pwd.',
  hufiec: huf_zhp_krakow_nowa_huta,
  org: Org.zhp,
  email: ['michal.metel@zhp.net.pl'],
);
const Person MIKOLAJ_GORECKI = Person(
  name: 'Mikołaj Górecki',
  druzyna: '30. PgDSHW "Waganci"',
  hufiec: huf_zhp_krakow_pdg,
  org: Org.zhp,
  email: ['mikolaj.gorecki.pl@gmail.com']
);
const Person MIKOLAJ_LUKASIK = Person(
    name: 'Mikołaj Łukasik',
    druzyna: '8. PgDSH "Pandora"',
    hufiec: huf_zhp_krakow_pdg,
    stopH: StopZHP.dhc,
    org: Org.zhp,
    email: ['mikiriki2017@gmail.com']
);
const Person MICHAL_SUPINSKI = Person(
  name: 'Michał Supiński',
  stopH: StopZHP.zhpHOc,
  stopI: 'pwd.',
  druzyna: '149. Poznańska Drużyna Harcerska „Bzura” im. generała Tadeusza Kutrzeby',
  hufiec: huf_zhp_poznan_nowe_miasto,
  org: Org.zhp,
  email: ['michal.supinskii@gmail.com']
);
const Person NADIA_OSSOWSKA = Person(
  name: 'Nadia Ossowska',
  stopH: StopZHP.dhd,
  druzyna: '6. Zagłębiowska Drużyna Harcerska "Eleusis" im.Stanisława Żółkiewskiego',
  hufiec: huf_zhp_ziemi_bedzinskiej,
  org: Org.zhp,
  email: ['nadia.ossowska.2007@gmail.com'],
);
const Person NADIA_WYSZOGRODZKA = Person(
  name: 'Nadia Wyszogrodzka',
  druzyna: '1. Drużyna Specjalnościowa "Grom" im. Cichociemnych Spadochroniarzy Armi Krajowej w Węgrowie',
  hufiec: huf_zhp_doliny_liwca,
  org: Org.zhp
);
const Person NATALIA_STODOLNA = Person(
    name: 'Natalia Stodolna ',
    druzyna: '1. DSH Viatores ',
    hufiec: huf_zhp_zielona_gora,
    stopH: StopZHP.zhpSamarytanka,
    org: Org.zhp,
    email: ['natalia.stodolna@zhp.net.pl']
);
const Person OLGA_JAJKO = Person(
  name: 'Olga Jajko',
  stopI: 'pwd.',
  druzyna: '1. Krakowska Drużyna Harcerska HRP',
  org: Org.hrp,
  email: ['olgajajko2004@gmail.com']
);
const Person OLIWIA_STANCZYK = Person(
  name: 'Oliwia Stańczyk',
  org: Org.zhp,
  email: ['oliwia.stanczyk@zhp.net.pl']
);
const Person OLIWIER_STARCZEWSKI = Person(
  name: '- Oliwier Starczewski',
  druzyna: '16 GDH ,,Cichociemni" im. Adama "Pługa" Borysa',
  hufiec: huf_zhp_gdansk_srodmiesie,
  org: Org.zhp,
  email: ['staryoliwierszoli@gmail.com']
);
const Person OSKAR_PARDYAK = Person(name: 'Oskar Pardyak', stopI: 'pwd.', stopH: StopZHP.zhpHOc, org: Org.zhp);
const Person PATRYCJA_PIETRAS = Person(
  name: 'Patrycja Pietras',
  druzyna: '6. ZDH "Eleusis"',
  hufiec: huf_zhp_ziemi_bedzinskiej,
  org: Org.zhp,
  email: ['patusiapietras2101@gmail.com']
);
const Person PATRYCJA_SZCZESNA = Person(name: 'Patrycja Szczęsna', stopI: 'pwd.', stopH: StopZHP.zhpHOd, hufiec: huf_zhp_warszawa_praga_pn, org: Org.zhp);
const Person PAULINA_BURDZIK = Person(name: 'Paulina Burdzik', stopI: 'pwd.', hufiec: huf_zhp_krakow_pdg, org: Org.zhp, comment: 'J. niemiecki',);
const Person PAULINA_LUBOS = Person(
  name: 'Paulina Lubos',
  druzyna: '4 Niezależna Drużyna Harcerek "Casus"',
  org: Org.sh,
  email: ['4ndhcasus@gmail.com'],
);
const Person PAWEL_KIMEL = Person(
  name: 'Paweł Kimel',
  email: ['pawel.kimel@gmail.com']
);
const Person PAWEL_MARUD = Person(name: 'Piotr Marud');
const Person PIOTR_MACIEJ_KABATA = Person(name: 'Piotr Maciej Kabata');
const Person PIOTR_SOSNOWSKI = Person(name: 'Piotr Sosnowski', stopI: 'pwd.',
  druzyna: 'II. SzDHiZ, 74. Poznańska Drużyna Wędrownicza "Lewe Skrzydło" im. Dywizjonu 303',
  hufiec: huf_zhp_poznan_wilda,
  org: Org.zhp,
);
const Person PIOTR_TUROWSKI = Person(
  name: 'Piotr Turowski',
  stopI: 'pwd.',
  org: Org.zhp,
  email: ['piotr.turowski@zhp.net.pl']
);
const Person PIOTR_ZIEMBIKIEWICZ = Person(name: 'Piotr Ziembikiewicz', stopI: 'phm.');
const Person PRZEMYSLAW_KLUCZKOWSKI = Person(name: 'Przemysław Kluczkowski');
const Person RADOSLAW_RELIDZYNSKI = Person(
  name: 'Radosław Relidzyński',
  stopI: 'pwd.',
  stopH: StopZHP.zhpHOc,
  druzyna: 'Warszawska Drużyna Wędrownicza "Halny"',
  hufiec: huf_zhp_warszawa_praga_pn,
  org: Org.zhp
);
const Person RAFAL_BARAN = Person(
  name: 'Rafał Baran',
  stopH: StopZHP.dhc,
  druzyna: '72. Dąbrowska Drużyna Starszoharcerska "Niebieska Mgła"',
);
const Person RAFAL_KOWALSKI = Person(
  name: 'Radał Kowalski',
  stopH: StopZHP.zhpMlodzik,
  hufiec: huf_zhp_rzeszow,
  druzyna: '14. DH im. K.K. Baczyńskiego',
  org: Org.zhp,
);
const Person RAFAL_LALIK = Person(name: 'Rafał Lalik', stopH: StopZHP.zhpHOc,
  druzyna: '30. Podgórska Drużyna Harcerska "Zielone Stopy"',
  hufiec: huf_zhp_krakow_pdg,
  org: Org.zhp,
);
const Person ROBERT_MAZUR = Person(name: 'Robert Mazur', stopH: StopZHP.zhpOdkrywca);
const Person ROBERT_ROBOTYCKI = Person(name: 'Robert Rybotycki', stopH: StopZHP.zhpOdkrywca, org: Org.zhp,);
const Person SANDRA_RZESZUREK = Person(name: 'Sandra Rzeszutek', email: ['sandrarzeszutek@wp.pl']);
const Person SARA_WALCZYNSKA_GORA = Person(name: 'Sara Walczyńska-Góra', stopH: StopZHP.zhpPionierka, org: Org.zhp);
const Person SEBASTIAN_KOPROWSKI = Person(
  name: 'Stanisław Koprowski',
  stopI: 'pwd.',
  stopH: StopZHP.zhpHOc,
  druzyna: '37. Harcerska Drużyna Męska im. Franciszka Drake’a',
  hufiec: huf_zhp_brodnica,
  email: ['sebastian.koprowski@zhp.net.pl']
);
const Person SEBASTIAN_SUGALSKI = Person(
  name: 'Sebastian Sugalski',
  stopH: StopZHP.zhpHOc,
  stopI: 'pwd.',
  druzyna: 'Zielony Szczep 10-ych Koszalińskich Drużyn Harcerskich i Gromad Zuchowych',
  hufiec: huf_zhp_ziemi_koszalinskiej,
  email: ['sugalski29@gmail.com'],
);
const Person SEWERYN_WOLINSKI = Person(name: 'Seweryn Woliński', stopH: StopZHP.zhpOdkrywca, org: Org.zhp);
const Person STANISLAW_WRONSKI = Person(name: 'Stanisław Wroński');
const Person STEFAN_KRYCZKA = Person(name: 'Stefan Kryczka', stopH: StopZHP.zhpCwik, druzyna: '295. Warszawska drużyna "Wataha"');
const Person SZYMON_BARCZYK = Person(
    name: 'Szymon Barczyk',
    druzyna: '60. WDH "Amber"',
    hufiec: huf_zhp_warszawa_ursus_wlochy,
    org: Org.zhp,
    email: ['szbarsz5@gmail.com']
);
const Person SZYMON_CHORAZY = Person(
  name: 'Szymon Chorąży',
  druzyna: '72. WDHS "Uroczysko"',
  hufiec: huf_zhp_warszawa_praga_pn,
  org: Org.zhp
);
const Person SZYMON_DRATWINSKI = Person(
  name: 'Szymon Dratwiński',
  stopH: StopZHP.zhpCwik,
  druzyna: '16. Krakowska Drużyna Harcerska',
  hufiec: huf_zhp_krakow_srodmiescie,
  org: Org.zhp,
  email: ['szymon.dratwinski@gmail.com']
);
const Person SZYMON_DROPEK = Person(name: 'Szymon Dropek',
  druzyna:'7. Kwidzyńska Drużyna Harcerska',
  hufiec: huf_zhp_kwidzyn,
  org: Org.zhp,
  email: ['szymon111drop@gmail.com']
);
const Person SZYMON_JAWOREK = Person(name: 'Szymon Jaworek',
  druzyna: '17 DH "Gryfne Bajtle"',
  hufiec: huf_zhp_ziemi_tarnogorskiej
);
const Person SZYMON_PODGORNY = Person(name: 'Szymon Podgórny',
    druzyna:'19. Pyzdrska Drużyna Wędrownicza "Wataha", 5 Pyzdrski szczep "Orion"',
    hufiec: huf_zhp_wrzesnia_wrzos,
    org: Org.zhp,
    email: ['szymon.podgorny@zhp.net.pl']
);
const Person SZYMON_ZDZIEBKO = Person(name: 'Szymon Zdziebko');
const Person TOMASZ_BUKOWIECKI = Person(
  name: 'Tomasz Bukowiecki',
  stopH: StopZHP.zhpOdkrywca,
  druzyna: '25. Wielopoziomowa Drużyna Harcerska "Brzask" im. Cichociemnych Spadochroniarzy Armii Krajowej',
  hufiec: huf_zhp_legionowo,
  org: Org.zhp,
  email: ['tomasz.bukowiecki@zhp.net.pl']
);
const Person WANDA_MARCHEL = Person(
    name: 'Wanda Marchel',
    stopH: StopZHP.zhpOchotniczka,
    druzyna: '13. DH szczęściarze',
    hufiec: huf_zhp_opole,
    org: Org.zhp
);
const Person WERONIKA_ZAWIERUCHA = Person(
    name: 'Weronika Zawierucha',
    druzyna: '43. ZDHS Parasol',
    hufiec: huf_zhp_zgierz,

    stopH: StopZHP.zhpPionierka,
    org: Org.zhp,
    email: ['zawieruchaweronika570@gmail.com']
);
const Person WIKTOR_KARPALA = Person(name: 'Wiktor Karpała', stopH: StopZHP.zhpHOc, stopI: 'pwd.',
  druzyna:'74. DH "Desant" im. 1. SBS gen. bryg. Stanisława Sosabowskiego',
  hufiec: huf_zhp_podkrakowski,
  org: Org.zhp,
);
const Person WIKTORIA_PRUSZYNSKA = Person(
  name: 'Wiktoria Pruszyńska',
);
const Person WIKTORIA_WOJCIK = Person(
  name: 'Wiktoria Wójcik',
  stopH: StopZHP.zhpSamarytanka,
  email: ['wiktoria.wojcik1@zhp.net.pl']
);
const Person WINCENTY_DIETRYCH = Person(name: 'Wincenty Dietrych', stopH: StopZHP.dhc);
const Person WOJCIECH_GRUSZCZYNSKI = Person(name: 'Wojciech Gruszczyński', stopH: StopZHP.zhpCwik,
  druzyna: '35. Poznańska Drużyna Harcerska',
  org: Org.zhp,
);
const Person WOJCIECH_TURSKI = Person(name: 'Wojciech Turski', stopH: StopZHP.zhpCwik, org: Org.zhp);
const Person WOJCIECH_WALACH = Person(
  name: 'Wojciech Wałach',
  druzyna: '34. DH "Watra" im. Braci Buchalików',
  hufiec: huf_zhp_ziemi_rybnickiej,
  org: Org.zhp,
  email: ['wojtek.w.2008@gmail.com'],
);
const Person WOJCIECH_WOLNIK = Person(
    name: 'Wojciech Wolnik',
    stopH: StopZHP.zhpMlodzik,
    druzyna: '7. Przemeckiej Drużyna Harcerska im. Jana Pawła II',
    hufiec: huf_zhp_wolsztyn,
    org: Org.zhp
);
const Person WOJCIECH_ZIELINSKI = Person(name: 'Wojciech Zielinski', stopH: StopZHP.dhc);
const Person ZBYSZEK_CHODAKOWSKI = Person(name: 'Zbyszek Chodakowski', stopH: StopZHP.zhpCwik, org: Org.zhp);
const Person ZOFIA_FABROWSKA = Person(
    name: 'Zofia Fabrowska',
    stopH: StopZHP.zhpHOd,
    stopI: 'pwd.',
    org: Org.zhp,
    email: ['zofia.fabrowska@zhp.net.pl']
);
const Person ZOFIA_KOSIDER = Person(
    name: 'Zosia Kosider',
    druzyna: '1. DH "Wilcza Sfora"',
    hufiec: huf_zhp_ziemi_wodzislawskiej,
    org: Org.zhp,
    email: ['zosiakosider@gmail.com']
);
const Person ZOFIA_SZAFRANEK = Person(
  name: 'Zofia Szafranek',
  stopH: StopZHP.zhpPionierka,
  druzyna: '39. Wielopoziomowa Drużyna Harcerska "Leśne Stwory" w Radlinie',
  hufiec: huf_zhp_ziemi_wodzislawskiej,
  org: Org.zhp,
  email: ['zofia.szafranek2008@gmail.com']
);
const Person ZOFIA_ZAWADZKA = Person(
    name: 'Zofia Zawadzka',
    stopH: StopZHP.zhpTropicielka,
    hufiec: huf_zhp_warszawa_zoliborz,
    druzyna: '128. WDH',
    org: Org.zhp
);
const Person ZUZANNA_JAWORSKA = Person(
    name: 'Zuzanna Jaworska',
    stopI: 'pwd.',
    stopH: StopZHP.zhpHOd,
    org: Org.zhp,
    hufiec: huf_zhp_wroclaw
);
const Person ZUZANNA_KOLIS = Person(
  name: 'Zuzanna Kolis',
  stopH: StopZHP.zhpOchotniczka,
  druzyna: 'Wilki',
  hufiec: huf_zhp_glowno,
  org: Org.zhp,
  email: ['koliszuzia@gmail.com'],
);
const Person ZUZANNA_KOWALCZYK = Person(
  name: 'Zuzanna Kowalczyk',
  stopH: StopZHP.zhpOchotniczka,
  hufiec: huf_zhp_stargard,
  druzyna: '1. Choszczeńska Drużyna Starszoharcerska ,,Regulus" im. Janusza Korczaka',
  org: Org.zhp
);
const Person ZUZANNA_MIERZEJEWSKA = Person(
  name: 'Zuzanna Mierzejewska',
  stopH: StopZHP.zhpOchotniczka,
  druzyna: '13. Lubańska Drużyna Starszoharcerska "Brzask"',
  hufiec: huf_zhp_luban,
  org: Org.zhp
);
const Person ZUZANNA_PIWKO = Person(
  name: 'Zuza Piwko',
  stopH: StopZHP.zhpHOc,
  stopI: 'pwd.',
  druzyna: '46 Wrocławska Drużyna Harcerska "Arda"',
  hufiec: huf_zhp_wroclaw_wschod,
  org: Org.zhp,
  email: ['zuzanna.piwko@zhp.net.pl']
);
const Person ZUZANNA_WARCHOL = Person(name: 'Zuzanna Warchoł', druzyna: '113. TWDH "Pustynna Burza"', org: Org.zhp, hufiec: huf_zhp_szczecin_pogodno);

class Person{

  final String name;
  final StopZHP? stopH;
  final String? stopI;
  final String? druzyna;
  final String? hufiec;
  final Org? org;
  final String? comment;
  final List<String> email;

  const Person({
    required this.name,
    this.stopH,
    this.stopI,
    this.druzyna,
    this.hufiec,
    this.org,
    this.comment,
    this.email = const []
  });
  
}

class PersonCardSimple extends StatelessWidget{

  String get name => person.name;
  StopZHP? get stopH => person.stopH;
  String? get stopI => person.stopI;
  String? get druzyna => person.druzyna;
  String? get hufiec => person.hufiec;
  Org? get org => person.org;
  String? get comment => person.comment;

  final Person person;
  final Color? textColor;

  const PersonCardSimple(this.person, {this.textColor, super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          if(stopH != null
              && stopH != StopZHP.zhpHOc
              && stopH != StopZHP.zhpHOd
              && stopH != StopZHP.zhpHRc
              && stopH != StopZHP.zhpHRd
          ) Text('${stopShortName(stopH)} ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textColor??textEnab_(context))),
          if(stopI != null) Text('$stopI ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textColor??textEnab_(context))),
          Text(name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.bold, color: textColor??textEnab_(context))),
          if(stopH == StopZHP.zhpHOc
              || stopH == StopZHP.zhpHOd
              || stopH == StopZHP.zhpHRc
              || stopH == StopZHP.zhpHRd
          ) Text(' ${stopShortName(stopH)}', style: AppTextStyle(color: textColor??textEnab_(context))),
          Expanded(child: Container()),
        ],
      )
  );
}

class PersonCard extends StatelessWidget{

  String get name => person!.name;
  StopZHP? get stopH => person!.stopH;
  String? get stopI => person!.stopI;
  String? get druzyna => person!.druzyna;
  String? get hufiec => person!.hufiec;
  Org? get org => person!.org;
  String? get comment => person!.comment;

  final Person? person;
  final double textSize;
  final Color? textColor;
  
  const PersonCard(this.person, {this.textSize = Dimen.TEXT_SIZE_BIG, this.textColor, super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [

      SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            if(stopH != null
                && stopH != StopZHP.zhpHOc
                && stopH != StopZHP.zhpHOd
                && stopH != StopZHP.zhpHRc
                && stopH != StopZHP.zhpHRd
            ) Text('${stopShortName(stopH)} ', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
            if(stopI != null) Text('$stopI ', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
            Text(name, style: AppTextStyle(fontSize: textSize, fontWeight: weight.halfBold, color: textColor??textEnab_(context))),
            if(stopH == StopZHP.zhpHOc
                || stopH == StopZHP.zhpHOd
                || stopH == StopZHP.zhpHRc
                || stopH == StopZHP.zhpHRd
            ) Text(' ${stopShortName(stopH)}', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
            //Expanded(child: Container()),
            if(org != null) Text(' (', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context), fontWeight: weight.halfBold)),
            if(org != null)
              Text(orgName[org!]!, style: AppTextStyle(fontSize: textSize, color: orgColor[org!], fontWeight: weight.halfBold)),
            if(org != null) Text(')', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context), fontWeight: weight.halfBold)),

          ],
        ),
      ),

      if(hufiec != null)
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(hufiec!, style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
        ),

      if(druzyna != null)
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(druzyna!, style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
        ),

    ],
  );
}