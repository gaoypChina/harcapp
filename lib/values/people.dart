import 'package:flutter/material.dart';
import 'package:harcapp/values/rank_harc.dart';
import 'package:harcapp/values/rank_instr.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import 'hufce.dart';

List<Person> allPeople = [
  ABRAHAM_PRAGER,
  ADAM_DAWID,
  ADAM_DUDAK,
  ADAM_SKLODOWSKI,
  AGATA_KOPYTKO,
  AGATA_MAJEWSKA,
  AGNIESZKA_DURSKA,
  AGNIESZKA_PIEKARSKA,
  AGNIESZKA_RADECKA_KUBICKA,
  AGNIESZKA_TYLKO,
  ALAN_FILAS,
  ALEKSANDER_PALKA,
  ALEKSANDRA_ANTKIEWICZ,
  ALEKSANDRA_CHRUSTEK,
  ALEKSANDRA_KOSTRZEWA,
  ALEKSANDRA_KOWALSKA,
  ALEKSANDRA_KOZUBAL,
  ALEKSANDRA_WOJCIECHOWSKA,
  ALICJA_JEZNACKA,
  ALICJA_MAJCHER,
  ANNA_RAJEWSKA,
  ANTONINA_PIERZCHALA,
  ANTONINA_ROMANSKA,
  ANTONINA_SZTYGLIC,
  ARTUR_KOSTRZEWA,
  ARTUR_RUSA,
  BARBARA_THOMAS,
  BARTOSZ_DABROWSKI,
  BARTOSZ_IGNASIAK,
  BENIAMIN_PLUCINSKI,
  BLAZEJ_KLEBBA,
  BRUNO_BRONCEL,
  BRUNO_WALERYCH,
  DAMIAN_SZYSZKA,
  DANIEL_IWANICKI,
  DANIEL_KORZEB,
  DAWID_LOBODA,
  DAWID_WYSZYNSKI,
  DOMINIKA_GORZYNSKA,
  DOMINIKA_HOCHMANSKA,
  DORIAN_JAREK,
  EMILIA_Z_FSE,
  EMILIA_BARABASZ,
  EMILIA_WARSZAJLO,
  EMILIA_WITKOWSKA,
  EVELINA_STASILOVIC,
  EWA_BYSTRZYNSKA,
  EWELINA_HUPKA,
  FILIP_BERGIER,
  FILIP_KWIATKOWSKI,
  FILIP_SOCHAJ,
  FILIP_SWIDEREK,
  FRANCISZEK_LINKE,
  FRANCISZEK_MICHALSKI,
  FRANCISZEK_TOMASZCZYK,
  GABRIEL_POZNANSKI,
  GRZEGORZ_BOROWIEC,
  GRZEGORZ_FRANKOW,
  GRZEGORZ_PAWLAK,
  GRZEGORZ_ZAWADZKI,
  HANNA_CISAKOWSKA,
  HANNA_CZAJKOWSKA,
  HANNA_KUJAWSKA,
  HANNA_RYBACKA,
  HANNA_WNEKOWICZ,
  HELENA_LATOSINSKA,
  HELENA_SWIATKOWSKA,
  HUBERT_FRUKOWSKI,
  HUBERT_JANIK,
  HUBERT_SULSKI,
  IGNACY_DUDZIAK,
  JADWIGA_BILINSKA,
  JADWIGA_GORSKA,
  JADWIGA_SZEWCZYK,
  JAGIENKA_KULCZYCKA,
  JAGODA_BLASZCZYK,
  JAGODA_SKOWRONSKA,
  JAKUB_DEBICKI,
  JAKUB_DUDA,
  JAKUB_EJDUK,
  JAKUB_KLEPACZ,
  JAKUB_KLUCZKOWSKI,
  JAKUB_LYSZKOWSKI,
  JAKUB_MLYNSKI,
  JAKUB_SKUCHA,
  JAKUB_STEFANSKI,
  JAKUB_STRACZYNSKI,
  JAKUB_ZDANOWICZ_ZASIDKO,
  JAN_JARECKI,
  JAN_JAWORSKI,
  JAN_KUCZA,
  JAN_NOWAK,
  JAN_STANULA,
  JANUSZ_ORLUTA,
  JAROSLAW_JAKUBIAK,
  JAROSLAW_ZASACKI,
  JOANNA_MICHALOWSKA,
  JOANNA_PAJAK,
  JOANNA_RACZKO,
  JULIA_BIENIEK,
  JULIA_GRODZKA,
  JULIA_JAROSZ,
  JULIA_KARAS,
  JULIA_PILCH,
  JULIA_SIUDMAK,
  JULIA_TYSZKIEWICZ,
  JULIANNA_KLUS,
  JULITA_STEPIEN,
  KACPER_BACZKOWSKI,
  KACPER_CIESIELSKI,
  KACPER_FRONC,
  KACPER_KORDEK,
  KACPER_KOZLUK,
  KACPER_SMOLKA,
  KACPER_SWITKIEWICZ,
  KACPER_SZCZENSY,
  KACPER_TOMCZYK,
  KACPER_WIDZ,
  KACPER_WIETRZYKOWSKI,
  KAJETAN_RUSZKOWSKI,
  KAJETAN_WITKOWSKI,
  KAJETAN_WYGNANSKI,
  KAROLINA_CZARNECKA,
  KAROLINA_MARCINKOWSKA,
  KAROLINA_WISNIEWSKA,
  KAMIL_GORNIK,
  KAMIL_ORGANISTA,
  KAMIL_ZAK,
  KAROL_FRANKOWSKI,
  KAROL_GOLABEK,
  KAROL_MALUS,
  KATARZYNA_LISAK,
  KATARZYNA_STUDNICKA,
  KLARA_MAZEK,
  KLAUDIA_STASINSKA,
  KLAUDIUSZ_PALUCH,
  KORNEL_GOLEBIEWSKI,
  KORNELIA_PRZYCZOLKA,
  KRZYSZTOF_KANIEWSKI,
  KRZYSZTOF_KRAWCZYK,
  KRZYSZTOF_MALIKIEWICZ,
  KRZYSZTOF_PIOTR_WAGROWSKI,
  KSENIA_OKRUCINSKA,
  LAURA_FRASZEWSKA,
  LAURA_NOWAKOWSKA,
  LENA_PATLA,
  LENA_WEISS,
  LILIANA_MIROTA,
  LUCJA_TALKOWSKA,
  LUKASZ_SZEPIELAK,
  LUKASZ_KRYWULT,
  LUKASZ_RYBINSKI,
  LUCJA_SLAZYK,
  MACIEJ_BATKO,
  MACIEJ_DOBROWOLSKI,
  MACIEJ_GRZELAZKA,
  MACIEJ_LADOS,
  MACIEJ_PAWLICA,
  MACIEJ_SZOLC,
  MACIEJ_WYSOCKI,
  MAGDALENA_KALISZ,
  MAGDALENA_KOZLOWSKA,
  MAJA_WOJTYNIAK,
  MAKSYMILIAN_SPADLO,
  MALGORZATA_KLOC,
  MALGORZATA_MASKO_HORYZA,
  MALGORZATA_SZMUK,
  MALWINA_TRUSZKOWSKA,
  MARCEL_RYCHTER,
  MARCEL_WOZNIAK,
  MARCELINA_WILCZAK,
  MARCIN_JANKOWIAK,
  MAREK_BOJARUN,
  MAREK_LEWANCZYK,
  MAREK_MUSIALIK,
  MARLENA_BANIA,
  MARIA_MAGDALENA_DESKUR,
  MARIA_PRZYBYLSKA,
  MARTA_SZYMANDERSKA,
  MARTYNA_BULAKOWSKA,
  MARTYNA_SADOWNIK,
  MARTYNA_WASILEWSKA,
  MARYSIA_SLUGAJ,
  MATEUSZ_CIAGLO,
  MATEUSZ_GAWRYSIAK,
  MATEUSZ_KOBYLAREK,
  MATEUSZ_KORZENIOWSKI,
  MATEUSZ_MIKLASZEWSKI,
  MATEUSZ_PYSZKA,
  MATEUSZ_STEPNIEWSKI,
  MATEUSZ_SWIEBODA,
  MATEUSZ_URBANIAK,
  MAXIMILIAN_STEINHOFF,
  MICHAL_DYDERSKI,
  MICHAL_JABCZYNSKI,
  MICHAL_JANAS,
  MICHAL_KARWOWSKI,
  MICHAL_METEL,
  MICHAL_SITEK,
  MICHAL_SUPINSKI,
  MICHAL_PIENIAZEK,
  MIECZYSLAW_MICHALIK,
  MIKOLAJ_GORECKI,
  MIKOLAJ_LUKASIK,
  MIKOLAJ_MATUSZEWSKI,
  NADIA_OSSOWSKA,
  NADIA_WYSZOGRODZKA,
  NATALIA_STODOLNA,
  OLGA_JAJKO,
  OLGA_LUCZAK,
  OLIWIA_MAJDA,
  OLIWIA_STANCZYK,
  OLIWIER_STARCZEWSKI,
  OSKAR_PARDYAK,
  OSKAR_SAKOWICZ,
  PATRYCJA_PIETRAS,
  PATRYCJA_SPYRKA,
  PATRYCJA_SZCZESNA,
  PAULINA_BURDZIK,
  PAULINA_LUBOS,
  PAWEL_KIMEL,
  PAWEL_MARUD,
  PIOTR_KUBOWICZ,
  PIOTR_MACIEJ_KABATA,
  PIOTR_SOSNOWSKI,
  PIOTR_TUROWSKI,
  PIOTR_URBANIEC,
  PIOTR_ZIEMBIKIEWICZ,
  PRZEMYSLAW_KLUCZKOWSKI,
  RADOSLAW_RELIDZYNSKI,
  RAFAL_BARAN,
  RAFAL_KOWALSKI,
  RAFAL_LALIK,
  ROBERT_LISZEWSKI,
  ROBERT_MAZUR,
  ROBERT_ROBOTYCKI,
  RYSZARD_LASECKI,
  SANDRA_RZESZUREK,
  SARA_WALCZYNSKA_GORA,
  SEBASTIAN_BINKOWICZ,
  SEBASTIAN_KOPROWSKI,
  SEBASTIAN_SUGALSKI,
  SEWERYN_WOLINSKI,
  STANISLAW_WRONSKI,
  STEFAN_KRYCZKA,
  SZYMON_BARCZYK,
  SZYMON_CHORAZY,
  SZYMON_DRATWINSKI,
  SZYMON_DROPEK,
  SZYMON_JACKIEWICZ,
  SZYMON_JAWOREK,
  SZYMON_PODGORNY,
  SZYMON_SITEK,
  SZYMON_ZDZIEBKO,
  TOMASZ_BUKOWIECKI,
  TOMASZ_FLORCZAK,
  TOMASZ_ZAGORSKI,
  WANDA_MARCHEL,
  WERONIKA_ZAWIERUCHA,
  WIKTOR_KARPALA,
  WIKTORIA_PINKOWSKA,
  WIKTORIA_WOJCIK,
  WINCENTY_DIETRYCH,
  WITOLD_JAKUBOWSKI,
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
  ZOFIA_ZBRUK,
  ZUZANNA_ANDRZEJCZAK,
  ZUZANNA_DUDEK,
  ZUZANNA_JAWORSKA,
  ZUZANNA_KOLIS,
  ZUZANNA_KOWALCZYK,
  ZUZANNA_MIERZEJEWSKA,
  ZUZANNA_NAWROT,
  ZUZANNA_NIEWEGLOWSKA,
  ZUZANNA_PIWKO,
  ZUZANNA_ROMANISZYN,
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
const Person ADAM_DAWID = Person(
    name: 'Adam Dawid',
    druzyna: '33. CDH „Czarne stopy”',
    hufiec: 'Hufiec Ziemi Cieszyńskiej',
    rankHarc: RankHarc.dhc,
    org: Org.zhp,
    email: ['treaxy09@gmail.com']
);
const Person ADAM_DUDAK = Person(
    name: 'Adam Dudak',
    hufiec: huf_zhp_warszawa_ursynow,
    druzyna: '234. Warszawska Drużyna Harcerska „Forteca”'
);
const Person ADAM_SKLODOWSKI = Person(
    name: 'Adam Skłodowski',
    druzyna: '58. MDH „Cichociemni”',
    hufiec: 'Eldorado',
    rankHarc: RankHarc.zhrWywiadowca,
    org: Org.zhr_o,
    email: []
);
const Person AGATA_KOPYTKO = Person(
    name: 'Agata',
    druzyna: '22. LDH „Potok”',
    hufiec: 'Lubelski Hufiec Harcerek „Rzeka”',
    rankHarc: RankHarc.zhpOchotniczka,
    org: Org.zhr_o,
    email: ['aga.kopyto28@gmail.com']
);
const Person AGATA_MAJEWSKA = Person(
    name: 'Agata Majewska',
    hufiec: huf_zhp_lodz_widzew,
    org: Org.zhp,
    email: ['agattam2004@gmail.com']
);
const Person AGNIESZKA_DURSKA = Person(name: 'Agnieszka Durska', rankInstr: RankInstr.phm, hufiec: huf_zhp_lodz_baluty);
const Person AGNIESZKA_PIEKARSKA = Person(
    name: 'Agnieszka Piekarska',
    druzyna: '3. Drużyna Wędrownicza „3DSH”',
    hufiec: huf_zhp_szczecinsko_wloszczowski,
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOd,
    org: Org.zhp,
    email: ['superbulinka@icloud.com', 'agapiekarskaa@gmail.com']
);
const Person AGNIESZKA_RADECKA_KUBICKA = Person(
    name: 'Agnieszka Radecka-Kubicka',
    druzyna: '5. Gromada Zuchów',
    hufiec: huf_zhp_ziemi_sanockiej,
    org: Org.zhp,
    email: ['irja@interia.pl']
);
const Person AGNIESZKA_TYLKO = Person(name: 'Agnieszka Tylko', rankHarc: RankHarc.zhpPionierka,
  hufiec: huf_zhp_myslenice,
  druzyna: '3,14. Myślenicka Drużyna Starszoharcerska „Awangarda”',
  org: Org.zhp,
);
const Person ALAN_FILAS = Person(
  name: 'Alan Filas',
  rankInstr: RankInstr.phm,
  druzyna: '2. Szczep „Malta”',
  hufiec: huf_zhp_poznan_nowe_miasto,
  email: ['alan.filas@zhp.net.pl']
);
const Person ALEKSANDER_PALKA = Person(
    name: 'Aleksander Palka',
    druzyna: '10. HDŻ',
    hufiec: 'Katowice',
    rankHarc: RankHarc.dhc,
    org: Org.zhp,
    email: ['tomaszml9236@gmail.com']
);
const Person ALEKSANDRA_ANTKIEWICZ = Person(
    name: 'Ola Antkiewicz',
    druzyna: '35. Chynowska Drużyna Wielopoziomowa „Vis Verum”',
    hufiec: huf_zhp_grojec,
    org: Org.zhp,
    email: ['drzewonadrzewie@gmail.com']
);
const Person ALEKSANDRA_CHRUSTEK = Person(
    name: 'Aleksandra Chrustek',
    rankHarc: RankHarc.zhpHOd,
    rankInstr: RankInstr.pwd,
    hufiec: huf_zhp_warszawa_mokotow,
    org: Org.zhp,
    email: ['olachrustek@gmail.com']
);
const Person ALEKSANDRA_KOSTRZEWA = Person(name: 'Ola Kostrzewa', org: Org.zhp);
const Person ALEKSANDRA_KOWALSKA = Person(
    name: 'Aleksandra Kowalska',
    druzyna: '17. ZODH',
    hufiec: huf_zhp_zgierz,
    email: ['kowalskaola057@gmail.com'],
    org: Org.zhp,
);
const Person ALEKSANDRA_KOZUBAL = Person(name: 'Aleksandra Kozubal', rankHarc: RankHarc.zhpSamarytanka, org: Org.zhp);
const Person ALEKSANDRA_TKOCZ = Person(
    name: 'Aleksandra Tkocz',
    druzyna: 'XIX. WDH „Sokół”',
    hufiec: huf_zhp_szczecin_dabie,
    rankHarc: RankHarc.zhpPionierka,
    org: Org.zhp,
    email: ['nikiii2115@gmail.com']
);
const Person ALEKSANDRA_WOJCIECHOWSKA = Person(
    name: 'Aleksandra Wojciechowska',
    hufiec: huf_zhp_plock,
    rankHarc: RankHarc.dhd,
    org: Org.zhp,
    email: ['aleksandra.wojciechowska@zhp.net.pl']
);
const Person ALICJA_JEZNACKA = Person(
    name: 'Alicja Jeznacka',
    druzyna: '79. WWDH „ALPHA”',
    hufiec: huf_zhp_warszawa_zoliborz,
    rankHarc: RankHarc.zhpHOd,
    org: Org.zhp,
    email: ['alicja.jeznacka@zhp.net.pl']
);
const Person ALICJA_MAJCHER = Person(
    name: 'Ala Majcher',
    druzyna: '222. WDH „Bukowina” im. Jerzego Kukuczki',
    hufiec: huf_zhp_warszawa_wola,
    org: Org.zhp,
    email: ['alicja.majcher@zhp.net.pl']
);
const Person ANNA_RAJEWSKA = Person(
    name: 'Anna Rajewska',
    druzyna: '2. Drużyna im. Leona Zadurskiego w Żukowie',
    hufiec: huf_zhp_kartuzy,
    email: ['anna.rajewska14@gmail.com']
);
const Person ANTONINA_PIERZCHALA = Person(
    name: 'Antonina Pierzchała',
    druzyna: '41. Drużyna Harcerska „Huba”',
    hufiec: huf_zhp_ostrowiec_swietokrzyski,
    org: Org.zhp,
    email: ['tosiaczek118@gmail.com']
);
const Person ANTONINA_ROMANSKA = Person(
  name: 'Antonina Romańska',
  rankInstr: RankInstr.pwd,
  rankHarc: RankHarc.dhd,
  org: Org.zhp,
  email: ['tosiaromanska@gmail.com']
);
const Person ANTONINA_SZTYGLIC = Person(
  name: 'Antonina Sztyglic',
  hufiec: huf_zhp_lask,
  druzyna: '5. Wieluńska Drużyna Harcerek Starszych „Kozy”',
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
const Person ARTUR_RUSA = Person(name: 'Artur Rusa', rankHarc: RankHarc.zhpWywiadowca, hufiec: huf_zhp_pulawy, druzyna: '113. SDSH', org: Org.zhp,);
const Person BARBARA_THOMAS = Person(name: 'Barbara Thomas', rankInstr: RankInstr.phm);
const Person BARTOSZ_DABROWSKI = Person(name: 'Bartosz Dąbrowski', rankHarc: RankHarc.zhpWywiadowca, org: Org.zhp);
const Person BARTOSZ_IGNASIAK = Person(name: 'Bartosz Ignasiak', rankHarc: RankHarc.zhpHOc, rankInstr: RankInstr.pwd, druzyna: '8. Drużyna Wędrownicza „Kuźnia Płomienia”');
const Person BENIAMIN_PLUCINSKI = Person(
  name: 'Beniamin Pluciński',
  druzyna: '17. ZODH',
  email: ['ekhemmmik@gmail.com']
);
const Person BLAZEJ_KLEBBA = Person(
  name: 'Błażej Klebba',
  druzyna: '45. Drużyna Harcerska „Tuptaki”',
  hufiec: huf_zhp_puck,
  rankHarc: RankHarc.zhpMlodzik,
  org: Org.zhp,
  email: ['blazej3klebba.onet.pl@gmail.com']
);
const Person BRUNO_BRONCEL = Person(
  name: 'Bruno Broncel',
  rankHarc: RankHarc.zhpMlodzik,
  druzyna: '55. DHSiW „Exigo”',
  hufiec: huf_zhp_karkonoski,
  org: Org.zhp,
  email: ['bruno.broncel@gmail.com']
);
const Person BRUNO_WALERYCH = Person(
  name: 'Bruno Walerych',
  org: Org.zhp,
  email: ['bruno.walerych@zhp.pl']
);
const Person DAMIAN_SZYSZKA = Person(
    name: 'Damian Szyszka',
    email: ['damianoszyszka@gmail.com']
);
const Person DANIEL_IWANICKI = Person(
    name: 'Daniel Iwanicki',
    rankHarc: RankHarc.zhpHOc,
    rankInstr: RankInstr.phm,
    druzyna: '72. WDHS „Uroczysko”',
    email: ['daniel.iwanicki@zhp.net.pl']
);
const Person DANIEL_KORZEB = Person(name: 'Daniel Korzeb', rankHarc: RankHarc.zhpOdkrywca,
  druzyna: '39. HDŻ Burza',
  hufiec: huf_zhp_czestochowa,
  org: Org.zhp,
);
const Person DAWID_LOBODA = Person(
    name: 'Dawid Łoboda',
    druzyna: '63. GDH im. mi. Hieronima Degutowskiego „Zapora”',
    hufiec: huf_zhr_3_gdynski,
    rankHarc: RankHarc.zhrHOc,
    org: Org.zhr_o,
    email: ['dawidekk728@gmail.com']
);
const Person DAWID_WYSZYNSKI = Person(name: 'Dawid Wyszyński', rankHarc: RankHarc.dhc, org: Org.zhp,);
const Person DOMINIKA_GORZYNSKA = Person(name: 'Dominika Gorzyńska', rankHarc: RankHarc.zhpPionierka,
  druzyna: '11. Gdańska Drużyna Starszoharcerska „Cegły” im. Anny Burdówny',
  hufiec: huf_zhp_gdansk_srodmiesie,
  org: Org.zhp,
);
const Person DOMINIKA_HOCHMANSKA = Person(
  name: 'Dominika Hochmańska',
  rankInstr: RankInstr.pwd,
  org: Org.zhp,
  email: ['dominika.hochmanska@gmail.com']
);
const Person DORIAN_JAREK = Person(
    name: 'Dorian Jarek',
    rankInstr: RankInstr.pwd,
    druzyna: '13. Konińska Drużyna Wędrownicza „Wadery”',
    hufiec: huf_zhp_konin,
    org: Org.zhp
);
const Person EMILIA_Z_FSE = Person(
    name: 'Emilia',
    druzyna: 'Ognisko Młodych Przewodniczek',
    org: Org.fse,
    email: ['rozapodcieniem@gmail.com']
);
const Person EMILIA_BARABASZ = Person(
    name: 'Emilia Barabasz',
    druzyna: '71. WGZ „Strażnicy Kraczaru”',
    hufiec: huf_zhp_warszawa_praga_pn,
    rankHarc: RankHarc.zhpHOd,
    org: Org.zhp,
    email: ['emilia.barabasz@zhp.net.pl']
);
const Person EMILIA_WARSZAJLO = Person(
  name: 'Emilia Warszajło',
  rankHarc: RankHarc.zhpSamarytanka,
  druzyna: '24. Szczep DHiGZ „Awangarda”',
  hufiec: huf_zhp_poznan_grunwald,
  org: Org.zhp,
  email: ['emiwarszajlo@gmail.com']
);
const Person EMILIA_WITKOWSKA = Person(
    name: 'Emilia Witkowska',
    druzyna: '307. WDHiZ',
    hufiec: huf_zhp_warszawa_mokotow,
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHRd,
    org: Org.zhp,
    email: ['emilia.witkowska@zhp.net.pl', 's206102@sggw.edu.pl']
);
const Person EVELINA_STASILOVIC = Person(
  name: 'Evelina Stasilovič',
  rankHarc: RankHarc.zhpOchotniczka,
  druzyna: '9. Wileńska Drużyna Harcerek „Viator” im. kardynała Stefana Wyszyńskiego',
  org: Org.zhp_n_l,
  email: ['evelina.stasilovic@gmail.com']
);
const Person EWA_BYSTRZYNSKA = Person(name: 'Ewa Bystrzyńska', rankHarc: RankHarc.dhd, org: Org.zhp);
const Person EWELINA_HUPKA = Person(
    name: 'Ewelina Hupka',
    druzyna: 'XXII. Drużyna Harcerska „Ignis”',
    hufiec: huf_zhp_wegierska_gorka,
    rankHarc: RankHarc.zhpPionierka,
    org: Org.zhp,
    email: ['ewelina.hupka@zhp.net.pl']
);
const Person FILIP_BERGIER = Person(
    name: 'Filip Bergier',
    rankHarc: RankHarc.zhpWywiadowca,
    druzyna: '72. WDHS „Uroczysko”',
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp,
    email: ['janberg7272@gmail.com', 'filip.bergier@zhp.net.pl']
);
const Person FILIP_KWIATKOWSKI = Person(name: 'Filip Kwiatkowski', rankHarc: RankHarc.dhc, org: Org.zhp);
const Person FILIP_SOCHAJ = Person(name: 'Filip Sochaj');
const Person FILIP_SWIDEREK = Person(name: 'Filip Świderek');
const Person FRANCISZEK_LINKE = Person(
  name: 'pwd. Franciszek Linke',
  rankInstr: RankInstr.pwd,
  org: Org.zhp,
  email: ['franciszek.linke@zhp.net.pl']
);
const Person FRANCISZEK_MICHALSKI = Person(
    name: 'Franciszek Michalski',
    druzyna: '254. WDH „Matecznik” im. Janka Bytnara „Rudego”',
    hufiec: huf_zhp_warszawa_zoliborz,
    org: Org.zhp,
    email: ['franciszek.michalski@zhp.net.pl']
);
const Person FRANCISZEK_TOMASZCZYK = Person(
  name: 'Franciszek Tomaszczyk',
  rankHarc: RankHarc.zhpWywiadowca, hufiec: huf_zhp_ziemi_cieszynskiej,
  druzyna: '33. CDH „Czarne stopy”, 4. GZ „Radosne Misie”',
  org: Org.zhp
);
const Person GABRIEL_POZNANSKI = Person(
    name: 'Gabriel Poznański',
    druzyna: '6. GZ „Jeźdźcy Smoków”',
    hufiec: huf_zhp_chodziez,
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOc,
    org: Org.zhp,
    email: ['gabriel.poznanski455@gmail.com']
);
const Person GRZEGORZ_BOROWIEC = Person(
  name: 'Grzegorz Borowiec',
  rankHarc: RankHarc.zhpHOc,
  druzyna: '66. WDW „Tornado”',
  hufiec: huf_zhp_torun,
  org: Org.zhp,
);
const Person GRZEGORZ_FRANKOW = Person(
    name: 'Grzegorz Franków',
    druzyna: '22. Kielecka Drużyna Harcerska',
    hufiec: huf_zhp_kielce_miasto,
    rankInstr: RankInstr.pwd,
    org: Org.zhp,
    email: ['grzegorz.frankow@zhp.net.pl']
);
const Person GRZEGORZ_PAWLAK = Person(
  name: 'Grzegorz Pawlak',
  email: ['grzegorz.pawlakk@gmail.com']
);
const Person GRZEGORZ_ZAWADZKI = Person(
    name: 'Grzegorz Zawadzki',
    druzyna: '8. DSH „Ignis”',
    hufiec: huf_zhp_kutno,
);
const Person HANNA_CISAKOWSKA = Person(
    name: 'Hania Cisakowska',
    rankHarc: RankHarc.zhpPionierka,
    email: ['hanna.cisakowska2009@gmail.com']
);
const Person HANNA_CZAJKOWSKA = Person(
  name: 'Hanna Czajkowska',
  org: Org.zhp,
  email: ['hanna.czajkowska@zhp.net.pl']
);
const Person HANNA_KUJAWSKA = Person(
  name: 'Hanna Kujawska',
  druzyna: '6. DSH „Wataha”',
  email: ['kujawskahanka@gmail.com']
);
const Person HANNA_RYBACKA = Person(name: 'Hanna Rybacka',
  druzyna: 'Gromada Zuchowa „Ogniste Feniksy”',
  hufiec: huf_zhp_zdunska_wola,
  rankHarc: RankHarc.zhpSamarytanka,
  rankInstr: RankInstr.pwd,
  org: Org.zhp,
  email: ['hanna.rybacka@zhp.net.pl']
);
const Person HANNA_WITKOWSKA = Person(
    name: 'Hanna Witkowska',
    druzyna: '66. Wrocławska Drużyna Harcerska „PSIAKI”',
    hufiec: huf_zhp_wroclaw_polnoc,
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOd,
    org: Org.zhp,
    email: ['hanna.witkowska@zhp.net.pl']
);
const Person HANNA_WNEKOWICZ = Person(
  name: 'Hanna Wnękowicz',
  druzyna: '12. DH „Szare Wilki” w Brodach',
  hufiec: huf_zhp_zary,
  org: Org.zhp,
  email: ['hannawnekowicz93@gmail.com']
);
const Person HELENA_LATOSINSKA = Person(name: 'Helena Latosińska',
  druzyna: '39. Wielopoziomowa Drużyna Harcerska „Leśne Stwory z Radlina”',
  hufiec: huf_zhp_ziemi_wodzislawskiej,
  org: Org.zhp,
);
const Person HELENA_SWIATKOWSKA = Person(
    name: 'Helena Świątkowska',
    rankHarc: RankHarc.zhpSamarytanka,
    org: Org.zhr_o,
    email: ['helena.swiatkowska@zhr.pl']
);
const Person HUBERT_FRUKOWSKI = Person(
  name: 'Hubert Frukowski'
);
const Person HUBERT_JANIK = Person(
  name: 'Hubert Janik',
  druzyna: '7. BDH „Białe Czaple”',
  hufiec: huf_zhp_bydgoszcz_miasto,
  org: Org.zhp,
  email: ['hubert.janik@zhp.net.pl']
);
const Person HUBERT_ = Person(
  name: 'Hubert Milerowicz',
  rankHarc: RankHarc.zhpOdkrywca,
  hufiec: huf_zhp_warszawa_ochota,
  druzyna: 'Środowisko „Szczep 224”',
  email: ['hubertmilerowicz@gmail.com']
);
const Person HUBERT_SULSKI = Person(
    name: 'Hubert Sulski',
    druzyna: '23. DSH „Legendarne Smoki”',
    hufiec: huf_zhp_ziemi_wodzislawskiej,
    rankHarc: RankHarc.dhc,
    org: Org.zhp,
    email: ['hksik2007@gmail.com']
);
const Person IGNACY_DUDZIAK = Person(
    name: 'Ignacy Dudziak',
    druzyna: '121. PgDSH „Szlak Łez” im. Plutonu „Alicja”',
    hufiec: huf_zhp_krakow_pdg,
    rankHarc: RankHarc.zhpWywiadowca,
    org: Org.zhp,
    email: ['ignacy.dudziak@zhp.net.pl']
);
const Person JADWIGA_BILINSKA = Person(
  name: 'Jadwiga Bilińska',
  rankInstr: RankInstr.phm,
  rankHarc: RankHarc.zhpSamarytanka,
  hufiec: huf_zhp_zielonka,
  druzyna: '132. Mazowiecka Drużyna Harcerska „Wielkie Bractwo Halicza”',
  org: Org.zhp,
  email: ['jadwiga.bilinska@zhp.net.pl']
);
const Person JADWIGA_GORSKA = Person(
  name: 'Jadwiga Górska',
  rankHarc: RankHarc.zhpHOd,
  email: ['jdzgorska@gmail.com', 'jadwiga.gorska@zhp.net.pl'],
  org: Org.zhp
);
const Person JADWIGA_SZEWCZYK = Person(
  name: 'Jadwiga Szewczyk',
  email: ['jadzia.m.szewczyk@gmail.com'],
);
const Person JAGIENKA_KULCZYCKA = Person(
  name: 'Jagienka Kulczycka',
  rankHarc: RankHarc.zhpOchotniczka,
  druzyna: '36. Kaliska Drużyna Harcerska „Orły”',
  hufiec: huf_zhp_kalisz,
  org: Org.zhp,
  email: ['jagienkakulczycka@gmail.com', 'kulczyckajagienka@gmail.com'],
);
const Person JAGODA_BLASZCZYK = Person(
  name: 'Jagoda Błaszczyk',
  druzyna: '29. Zgierska Drużyna Harcerska „Dakota”',
  hufiec: huf_zhp_zgierz,
  rankHarc: RankHarc.zhpOchotniczka,
  org: Org.zhp,
  email: ['blaszczykjagoda25@gmail.com']
);
const Person JAGODA_SKOWRONSKA = Person(
    name: 'Jagoda Skowrońska',
    druzyna: '125. „Aves”',
    hufiec: huf_zhp_nowe_miasto_lubawskie,
    rankHarc: RankHarc.zhpSamarytanka,
    org: Org.zhp,
    email: ['jagoda.skowronska@edu.szkolagortatowo.pl', 'jagodaskowronska2021@gmail.com']
);
const Person JAKUB_DEBICKI = Person(
    name: 'Jakub Dębicki',
    druzyna: '8. Drużyna Wędrownicza „Kuźnia Płomienia”',
    hufiec: huf_zhp_lask,
    rankHarc: RankHarc.zhpCwik,
    org: Org.zhp,
    email: ['j.debicki@icloud.com']
);
const Person JAKUB_DUDA = Person(
    name: 'Jakub Duda',
    email: ['jakubduda2006@gmail.com']
);
const Person JAKUB_EJDUK = Person(
    name: 'Jakub Ejduk',
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOc,
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp
);
const Person JAKUB_KLEPACZ = Person(
    name: 'Jakub Klepacz',
    druzyna: '7. ŁDW „Chaos”',
    hufiec: huf_zhp_lodz_gorna,
    rankHarc: RankHarc.zhpHOc,
    org: Org.zhp,
    email: ['jakub.klepacz@zhp.net.pl']
);
const Person JAKUB_KLUCZKOWSKI = Person(
    name: 'Jakub Kluczkowski',
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOc,
    hufiec: huf_zhp_ziemi_koszalinskiej,
    org: Org.zhp,
    email: ['jakub.kluczkowski@zhp.net.pl']
);
const Person JAKUB_LYSZKOWSKI = Person(
  name: 'Jakub Lyszkowski',
  email: ['kubalyszka@gmail.com']
);
const Person JAKUB_MLYNSKI = Person(
  name: 'Jakub Młyński',
  druzyna: '77. WDH im. Harcerskiego Batalionu Szturmowego „Zośka”',
  hufiec: huf_zhp_gdansk_srodmiesie,
  org: Org.zhp,
  email: ['kubamlynski4@gmail.com']
);
const Person JAKUB_SKUCHA = Person(name: 'Jakub Skucha', rankHarc: RankHarc.dhc);
const Person JAKUB_STEFANSKI = Person(name: 'Jakub Stefański', rankHarc: RankHarc.dhc, org: Org.zhp);
const Person JAKUB_STRACZYNSKI = Person(
    name: 'Jakub Strączyński',
    druzyna: '52. KDHS',
    hufiec: huf_zhp_kielce_miasto,
    email: ['pancernuq@gmail.com', 'pancernu2@gmail.com']
);
const Person JAKUB_ZDANOWICZ_ZASIDKO = Person(name: 'Jakub Zdanowicz-Zasidko', rankHarc: RankHarc.dhc);
const Person JAN_JARECKI = Person(
    name: 'Jan Jarecki',
    druzyna: '30. PgDSH „Waganci”',
    hufiec: huf_zhp_krakow_pdg,
    org: Org.zhp,
    email: ['jareckijan07@gmail.com', 'jan.jarecki@zhp.pl']
);
const Person JAN_JAWORSKI = Person(
    name: 'Jan Jaworski',
    druzyna: '125. DH „Aves” im. Harcerzy Spod Znaku Rodła',
    hufiec: huf_zhp_nowe_miasto_lubawskie,
    rankHarc: RankHarc.zhpCwik,
    org: Org.zhp,
    email: ['jaworskijan8@gmail.com']
);
const Person JAN_KUCZA = Person(
  name: 'Jan Kucza',
  druzyna: '12. PDHS „Parszywa Dwunastka”',
  hufiec: huf_zhp_legionowo,
  org: Org.zhp,
  email: ['jan.kucza@zhp.net.pl']
);
const Person JAN_NOWAK = Person(
    name: 'Jan Nowak',
    druzyna: '8. UDH „Knieja”',
    hufiec: huf_zhr_urynowski_hufiec_rawicz,
    rankHarc: RankHarc.zhpCwik,
    org: Org.zhr_o,
    email: ['lolekmarian.200@gmail.com']
);
const Person JAN_STANULA = Person(
  name: 'Jan Stanula',
  druzyna: '4. DSH Ogniste Płomyki',
  hufiec: huf_zhp_trzebinia,
  org: Org.zhp
);
const Person JANUSZ_ORLUTA = Person(
  name: 'Janusz Orluta',
  rankHarc: RankHarc.zhpHRc,
  rankInstr: RankInstr.hm,
  druzyna: 'Krąg Instruktorski "Amfibia"',
  email: ['janusz.orluta@zhp.net.pl']
);
const Person JAROSLAW_JAKUBIAK = Person(name: 'Jarosław Jakubiak', rankHarc: RankHarc.dhc,
  hufiec: huf_zhp_uk,
);
const Person JAROSLAW_ZASACKI = Person(name: 'Jarosław Zasacki', rankHarc: RankHarc.zhpHOc, rankInstr: RankInstr.phm,
  hufiec: huf_zhr_zielonagora_topor,
  org: Org.zhr_c,
);
const Person JOANNA_MICHALOWSKA = Person(name: 'Joanna Michałowska', rankHarc: RankHarc.zhpSamarytanka,
  druzyna: '18. Poznańska Drużyna Harcerek im. Olgi Drahonowskiej-Małkowskiej',
  org: Org.zhp,
);
const Person JOANNA_PAJAK = Person(
  name: 'Asia Pająk',
  druzyna: '124. ŁGDH „Płomienie”',
  hufiec: huf_zhp_lodz_gorna,
  rankHarc: RankHarc.zhpHOd,
  org: Org.zhp,
  email: ['joanna.pajak@zhp.net.pl', 'pasiajak1@gmail.com']
);
const Person JOANNA_RACZKO = Person(
    name: 'Joanna Raczko',
    druzyna: '33. WWDH „Korsarze” im. Marynarki Wojennej RP',
    hufiec: 'Wejherowo',
    rankInstr: RankInstr.pwd,
    org: Org.zhp,
    email: ['joanna.raczko@zhp.net.pl']
);
const Person JULIA_BIENIEK = Person(
    name: 'Julia Bieniek',
    druzyna: '254. Warszawska Drużyna Harcerska im. Janka Bytnara „Rudego” Matecznik',
    org: Org.zhp,
    email: ['juliamariabieniek@gmail.com']
);
const Person JULIA_JAROSZ = Person(
  name: 'Julia Jarosz',
  druzyna: '72. WDH „Knieja”',
  hufiec: huf_zhp_warszawa_praga_pn,
  rankInstr: RankInstr.pwd,
  rankHarc: RankHarc.zhpHOd,
  org: Org.zhp,
  email: ['julia.jarosz@zhp.net.pl']
);
const Person JULIA_GRODZKA = Person(
    name: 'Julka Grodzka',
    druzyna: '2. DH „Śpiący Rycerz”',
    hufiec: huf_zhp_ziemi_rybnickiej,
    rankHarc: RankHarc.zhpSamarytanka,
    email: ['jucia.grodzka@gmail.com', 'grodzka.julia@zhp.net.pl']
);
const Person JULIA_KARAS = Person(
  name: 'Julia Karaś',
  rankHarc: RankHarc.zhpPionierka,
  druzyna: '78. Grunwaldzka Wielopoziomowa Drużyna Harcerska „Halny” im. hm. Józefy Kantor',
  hufiec: huf_zhp_beskidzki,
  org: Org.zhp,
  email: ['karasjulka81@gmail.com']
);
const Person JULIA_PILCH = Person(name: 'Julia Pilch', rankHarc: RankHarc.dhd,);
const Person JULIA_SIUDMAK = Person(name: 'Julia Siudmak');
const Person JULIA_TYSZKIEWICZ = Person(
    name: 'Julia Tyszkiewicz',
    druzyna: '328. WDW „Fantasmagoria”',
    hufiec: huf_zhp_warszawa_centrum,
    org: Org.zhp,
    email: ['julia.tyszkiewicz@zhp.net.pl']
);
const Person JULIANNA_KLUS = Person(
  name: 'Julianna Klus',
  druzyna: '208. Warszawska Drużyna Harcerska „Helios”',
  hufiec: huf_zhp_warszawa_mokotow,
  org: Org.zhp,
  email: ['julianna.klus@zhp.net.pl', 'julianna.klus4@gmail.com']
);
const Person JULITA_STEPIEN = Person(name: 'Julita Stępień');

const Person KACPER_BACZKOWSKI = Person(
  name: 'Kacper Bączkowski',
  rankHarc: RankHarc.dhc,
  org: Org.zhp,
  email: ['baczkowski.kacper.04@gmail.com']
);
const Person KACPER_CIESIELSKI = Person(
    name: 'Kacper Ciesielski',
    druzyna: '17. Zgierska Obronną Drużyna Harcerska „Sokoły”',
    hufiec: huf_zhp_zgierz,
    rankHarc: RankHarc.zhpOdkrywca,
    org: Org.zhp,
    email: ['yorunokoibito@gmail.com']
);
const Person KACPER_FRONC = Person(
    name: 'Kacper Fronc',
    druzyna: '19.DH „Modrzewie” im. 12. Pułku Ułanów Podolskich z Telatyna',
    email: ['kacperfronc44@gmail.com']
);
const Person KACPER_KORDEK = Person(name: 'Kacper Kordek', rankHarc: RankHarc.zhpCwik);
const Person KACPER_KOZLUK = Person(
  name: 'Kacper Koźluk',
  email: ['kacper@kozluk.pl']
);
const Person KACPER_SMOLKA = Person(name: 'Kacper Smółka', org: Org.zhp, email: ['kacper.smolka@zhp.net.pl']);
const Person KACPER_SWITKIEWICZ = Person(name: 'Kacper Świtkiewicz', rankHarc: RankHarc.dhc, org: Org.zhp);
const Person KACPER_SZCZENSY = Person(name: 'Kacper Szczęsny', rankHarc: RankHarc.zhpWywiadowca, org: Org.zhp);
const Person KACPER_SZYMANKIEWICZ = Person(
  name: 'Kacper Szymankiewicz',
  druzyna: '15. Dąbrowska Drużyna Starszoharcerska „Niezłomni” im. Rotmistrza Witolda Pileckiego',
  hufiec: huf_zhp_dabrowa_gornicza,
  email: ['kacper.szymankiewicz@zhp.net.pl']
);
const Person KACPER_TOMCZYK = Person(
  name: 'Kacper Tomczyk',
  druzyna: '77. Wrzesińska Drużyna Wędrownicza „Huragan”',
  hufiec: huf_zhp_wrzesnia_wrzos,
  org: Org.zhp,
  email: ['celnysnajper@gmail.com']
);
const Person KACPER_WIDZ = Person(
    name: 'Kacper Widz',
    rankHarc: RankHarc.zhpMlodzik,
    org: Org.zhp,
    hufiec: huf_zhp_lublin,
    druzyna: '8. Lubelska Drużyna Wędrownicza „Infiniti”',
);
const Person KACPER_WIETRZYKOWSKI = Person(
  name: 'Kacper Wietrzykowski',
  hufiec: huf_zhp_legionowo,
  org: Org.zhp,
  email: ['kacper.wietrzykowski@zhp.net.pl']
);

const KAJETAN_RUSZKOWSKI = Person(
  name: 'Kajetan Ruszkowski',
  druzyna: 'XV. ŁDH „Zielony Płomień” im. Andrzeja Małkowskiego',
  hufiec: huf_zhr_lodz,
  rankHarc: RankHarc.zhpHOc,
  org: Org.zhr_o,
);
const Person KAJETAN_WITKOWSKI = Person(
    name: 'Kajetan Witkowski',
    druzyna: '2. DH Iskry',
    hufiec: huf_zhp_miedzyrzecz,
    rankHarc: RankHarc.zhpMlodzik,
    org: Org.zhp,
    email: ['kajetanwitkowski1602@gmail.com']
);
const Person KAJETAN_WYGNANSKI = Person(
  name: 'Kajetan Wygrański',
  druzyna: '62. MDSH „Krzemień”',
  hufiec: huf_zhp_pruszkow,
  rankHarc: RankHarc.zhpOdkrywca,
  org: Org.zhp,
);
const Person KAROLINA_CZARNECKA = Person(
    name: 'Karolina Czarnecka',
    rankHarc: RankHarc.dhd,
    org: Org.zhr_o,
    email: ['karolinaczarnecka2007@gmail.com']
);
const Person KAROLINA_MARCINKOWSKA = Person(name: 'Karolina Marcinkowska');
const Person KAROLINA_WISNIEWSKA = Person(
  name: 'Karolina Wiśniewska',
  rankHarc: RankHarc.dhc,
  druzyna: '70 WPDH „Nienudni”',
  hufiec: huf_zhp_podlasie_w_siedlcach,
  org: Org.zhp,
  email: ['carowis07@gmail.com']
);
const Person KAMIL_GORNIK = Person(
  name: 'Kamil Gurnik',
  rankHarc: RankHarc.zhpCwik,
  druzyna: '64. WDHS „Etos”',
  hufiec: huf_zhp_warszawa_praga_pn,
  org: Org.zhp,
  email: ['kamilgurnik@gmail.com']
);
const Person KAMIL_ORGANISTA = Person(
    name: 'Kamil Organista',
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOc,
    org: Org.zhp,
    email: ['k.furiao@gmail.com', 'k.organista@onet.pl']
);
const Person KAMIL_ZAK = Person(name: 'Kamil Żak', rankHarc: RankHarc.zhpHOc);
const Person KAROL_FRANKOWSKI = Person(
    name: 'Karol Frankowski',
    druzyna: '1. PDH „Borek”',
    rankHarc: RankHarc.zhpCwik,
    org: Org.zhr_o,
    email: ['karol.frankowski@zhr.pl']
);
const Person KAROL_GOLABEK = Person(
  name: 'Karol Gołąbek',
  rankHarc: RankHarc.zhpMlodzik,
  druzyna: '44. Drużyna Starszoharcerska „Potok” w Miękinii',);
const Person KAROL_MALUS = Person(name: 'Karol Malus', rankHarc: RankHarc.dhc);
const Person KATARZYNA_LISAK = Person(
    name: 'Katarzyna Lisak',
    druzyna: '88. DW „Wierchy”',
    hufiec: huf_zhp_beskidzki,
    rankHarc: RankHarc.zhpSamarytanka,
    org: Org.zhp,
    email: ['katarzyna.lisak@zhp.net.pl']
);
const Person KATARZYNA_STUDNICKA = Person(
    name: 'Katarzyna Studnicka',
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.dhd,
    druzyna: '12. DH „Na Tropie”',
    hufiec: huf_zhp_andrychow, org: Org.zhp,
    email: ['katarzyna.studnicka@zhp.net.pl']
);
const Person KLARA_MAZEK = Person(name: 'Klara Mazek');
const Person KLAUDIA_STASINSKA = Person(
  name: 'Klaudia Stasińska',
  rankInstr: RankInstr.phm,
  rankHarc: RankHarc.zhpHOd,
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
  rankHarc: RankHarc.zhpOchotniczka,
  email: ['alicjaspacer@gmail.com'],
);
const Person KRZYSZTOF_KANIEWSKI = Person(
  name: 'Krzysztof Kaniewski',
  rankHarc: RankHarc.zhpHOc,
  druzyna: '1. DW „Geneza”',
  hufiec: huf_zhp_legionowo,
  org: Org.zhp,
  email: ['krzysztof.kaniewski@zhp.net.pl']
);
const Person KRZYSZTOF_KRAWCZYK = Person(name: 'Krzysztof Krawczyk', rankHarc: RankHarc.dhc);
const Person KRZYSZTOF_MALIKIEWICZ = Person(
  name: 'Krzysztof Malikiewicz',
  rankHarc: RankHarc.zhpHRc,
  hufiec: huf_zhp_trzebinia,
  email: ['krzysztof.malikiewicz@zhp.net.pl']
);
const Person KRZYSZTOF_PIOTR_WAGROWSKI = Person(
  name: 'Krzysztof Piotr Wągrowski',
  druzyna: '8. Aleksandrowska Drużyna Harcerzy',
  hufiec: huf_zhr_lodz_polesie,
  rankHarc: RankHarc.zhpMlodzik,
  org: Org.zhr_o,
  email: ['krzysio.wagrowski@gmail.com']
);
const Person KSENIA_OKRUCINSKA = Person(
    name: 'Ksenia Okrucińska',
    druzyna: '51. TDH „Czarne Stopy”',
    rankHarc: RankHarc.zhpPionierka,
    org: Org.zhp,
    email: ['polaczekn48@gmail.com', 'ksenia_okrucinska@wp.pl']
);
const Person LAURA_FRASZEWSKA = Person(name: 'Laura Fraszewska');
const Person LAURA_NOWAKOWSKA = Person(
  name: 'Laura Nowakowska',
  druzyna: '25. GGDSH „Zawiszacy” im. dh. Stefana Mirowskiego',
  hufiec: huf_zhp_grodzisk_mazowiecki,
  org: Org.zhp,
  email: ['kocham.racuchy.pl@gmail.com', 'laura.elwartowska@edu.sp1grodzisk.pl']
);
const Person LENA_PATLA = Person(
    name: 'Lena Patla',
    druzyna: '3. Krośnieńska Górska Drużyna Harcerska „Adventure”',
    hufiec: huf_zhp_krosno,
    org: Org.zhp,
    email: ['lena.patla@icloud.com']
);
const Person LENA_WEISS = Person(
    name: 'Lena Weiss',
    druzyna: '8. SDSH',
    org: Org.zhp,
    email: ['weiss.lenaa@icloud.com']
);
const Person LILIANA_MIROTA = Person(
    name: 'Liliana Mirota',
    druzyna: '7. BDH „Wrzosowisko”',
    hufiec: huf_zhp_reduta,
    rankHarc: RankHarc.zhpOchotniczka,
    org: Org.zhp,
    email: ['lilianamirota@gmail.com', 'lilianokotek@wp.pl']
);
const Person LUCJA_TALKOWSKA = Person(
    name: 'Łucja Talkowska',
    druzyna: 'Callis',
    rankHarc: RankHarc.zhrOchotniczka,
    org: Org.zhr_o,
    email: ['lusitalkowska@gmail.com']
);
const Person LUKASZ_SZEPIELAK = Person(name: 'Łukasz Szepielak', rankHarc: RankHarc.dhc, org: Org.zhp,);
const Person LUKASZ_SZTANDERA = Person(
  name: 'Łukasz Sztandera',
  rankHarc: RankHarc.zhpWywiadowca,
  hufiec: huf_zhp_kielce_poludnie,
  druzyna: '29. Kielecka Drużyna Harcerska „Bukowina”',
  org: Org.zhp,
  email: ['lukasz.sztandera@zhp.net.pl']
);
const Person LUKASZ_KRYWULT = Person(name: 'Łukasz Krywult', rankHarc: RankHarc.zhpCwik, org: Org.zhp,);
const Person LUKASZ_RYBINSKI = Person(name: 'Łukasz Rybiński', rankInstr: RankInstr.pwd);
const Person LUCJA_SLAZYK = Person(
    name: 'Łucja Ślazyk',
    druzyna: '47. ŁWDW',
    hufiec: huf_zhp_lodz_polesie,
    rankHarc: RankHarc.dhd,
    email: ['l.z.slazyk@gmail.com', 'podstawczak0@gmail.com']
);
const Person MACIEJ_BATKO = Person(name: 'Maciej Batko', rankHarc: RankHarc.dhc,
  druzyna: '117. Elbląskiej Męskiej Drużyny Harcerskiej „Mato”',
  email: ['maciej.batko@uczen11.elblag.pl', 'maciemaciek160@gmail.com', 'maciut2007@gmail.com']
);
const Person MACIEJ_CHUSTECKI = Person(
  name: 'Maciej Chustecki',
  rankHarc: RankHarc.zhrMlodzik,
  druzyna: '15. samodzielny zastęp „Burza”',
  org: Org.zhr_o
);
const Person MACIEJ_DOBROWOLSKI = Person(
    name: 'Maciej Dobrowolski',
    hufiec: huf_zhp_elblag,
    rankInstr: RankInstr.phm,
    rankHarc: RankHarc.zhpHOc,
    org: Org.zhp,
    email: ['roinuj5@gmail.com', 'maciej.dobrowolski@zhp.net.pl']
);
const Person MACIEJ_GRZELAZKA = Person(
    name: 'Maciej Grzelązka',
    druzyna: '314. „Pierścienia”',
    rankHarc: RankHarc.zhpMlodzik,
    org: Org.zhp,
    email: ['maciej.grzelazka@gmail.com']
);
const Person MACIEJ_LADOS = Person(
  name: 'Maciej Ładoś',
  rankInstr: RankInstr.pwd,
  druzyna: '8. PgDW Granat',
  hufiec: huf_zhp_krakow_pdg,
  org: Org.zhp,
  email: ['macieklad@gmail.com', 'maciej.lados@zhp.net.pl'],
);
const Person MACIEJ_PAWLICA = Person(
  name: 'Maciej Pawlica',
  druzyna: '1. Nadarzyńska Drużyna Starszoharcerska „Impessa”',
  hufiec: huf_zhp_pruszkow,
  org: Org.zhp,
  email: ['maciek.pawlica@outlook.com']
);
const Person MACIEJ_PRZYBYSZ = Person(
    name: 'Maciej Przybysz',
    druzyna: '20. DW „Avengers”',
    hufiec: huf_zhp_legionowo,
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOc,
    org: Org.zhp,
    email: ['maciej.przybysz@zhp.net.pl']
);
const Person MACIEJ_SZOLC = Person(
  name: 'Maciej Szolc',
  druzyna: '17. Drużyna Harcerska „Salamandra” z Jejkowic',
  hufiec: huf_zhp_ziemi_rybnickiej,
  email: ['maciekszolc12@gmail.com']
);
const Person MACIEJ_WYSOCKI = Person(
    name: 'Maciej Wysocki',
    druzyna: 'WDHiZ „Matecznik”',
    hufiec: huf_zhp_warszawa_zoliborz,
    org: Org.zhp,
    email: ['pan.macieq@gmail.com']
);
const Person MAGDALENA_KALISZ = Person(
    name: 'Magdalena Kalisz',
    druzyna: '64. WDH „Skaut”',
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp,
    email: ['magdalena.kalisz@zhp.net.pl']
);
const Person MAGDALENA_KOZLOWSKA = Person(
    name: 'Magdalena Kozłowska',
    rankHarc: RankHarc.zhpSamarytanka,
    org: Org.zhp,
    email: ['madziakoz2008@gmail.com']
);
const Person MAKSYMILIAN_SPADLO = Person(
  name: 'Maksymilian Spadło',
  rankHarc: RankHarc.dhc,
  druzyna: '101. DSH „Lupus”',
  org: Org.zhp,
  email: ['maks118119@gmail.com'],
);
const Person MAJA_WOJTYNIAK = Person(
  name: 'Maja Wojtyniak',
  rankHarc: RankHarc.zhrOchotniczka,
  druzyna: '1. ZDH „Rzeka”',
  email: ['m.wojtyniak@zhr.pl']
);
const Person MALGORZATA_KLOC = Person(
  name: 'Małgorzata Kloc',
  rankHarc: RankHarc.zhpPionierka,
  druzyna: '9. Gliwicka Drużyna Harcerzy Starszych „Lukarna” im. płk. Witolda Pileckiego',
  hufiec: huf_zhp_ziemi_gliwickiej,
  org: Org.zhp,
  email: ['malgorzata.kloc@zhp.net.pl']
);
const Person MALGORZATA_MASKO_HORYZA = Person(
  name: 'Małgorzata Maśko-Horyza',
  rankInstr: RankInstr.phm,
  email: ['m.masko-horyza@zhp.net.pl', 'malgorzata.masko-horyza@zhp.net.pl'],
  org: Org.zhp,
);
const Person MALGORZATA_SZMUK = Person(
    name: 'Małgorzata Szmuk',
    druzyna: '16. DH WATAHA',
    email: ['szgosia2k19@gmail.com']
);
const MALWINA_TRUSZKOWSKA = Person(
  name: 'Malwina Truszkowska',
  rankHarc: RankHarc.zhpPionierka,
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
const Person MARCEL_WOZNIAK = Person(
  name: 'Marcel Woźniak',
  druzyna: '10. KDSH Zioła',
  hufiec: huf_zhp_ziemi_koszalinskiej,
  rankHarc: RankHarc.zhpCwik,
  org: Org.zhp,
  email: ['marcel.wozniak.144@gmail.com']
);
const Person MARCELINA_WILCZAK = Person(
    name: 'Marcelina Wilczak',
    druzyna: '1. DH „Bór”',
    hufiec: huf_zhp_trzebinia,
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOd,
    org: Org.zhp,
    email: ['marcelina.wilczak@zhp.net.pl', 'wilczakmarcelina@gmail.com']
);
const Person MARCIN_JANKOWIAK = Person(name: 'Marcin Jankowiak', hufiec: huf_zhp_jarocin, org: Org.zhp,);
const Person MAREK_BOJARUN = Person(
    name: 'Marek Bojarun',
    druzyna: '64. ODSH „Cień”',
    rankHarc: RankHarc.zhpWywiadowca,
    org: Org.zhp,
    email: ['marekbojarun220@gmail.com', 'm.bojarun09@gmail.com']
);
const Person MAREK_LEWANCZYK = Person(
  name: 'Marek Lewańczyk',
  rankHarc: RankHarc.zhpHOc,
  rankInstr: RankInstr.pwd,
  druzyna: '7. GDH „Wilki”',
  email: ['marek.lewanczyk@zhp.net.pl']
);
const Person MAREK_MUSIALIK = Person(name: 'Marek Musialik', rankHarc: RankHarc.dhc, org: Org.zhp);
const Person MARLENA_BANIA = Person(
    name: 'Marlena Bania',
    rankHarc: RankHarc.zhpPionierka,
    druzyna: '9. Gliwicka Drużyna Harcerzy Starszych „Lukarna” im. Witolda Pileckiego',
    hufiec: huf_zhp_ziemi_gliwickiej,
    org: Org.zhp,
    email: ['marlena.bania6474@gmail.com', 'marlena.bania@zhp.net.pl']
);
const Person MARIA_MAGDALENA_DESKUR = Person(
  name: 'Maria Magdalena Deskur',
  email: ['nenadeskur12@gmail.com']
);
const Person MARIA_PRZYBYLSKA = Person(
    name: 'Maria Przybylska',
    druzyna: '49. Łódzka Drużyna Harcerek im. gen. Elżbiety Zawackiej „Zo”',
    hufiec: huf_zhp_lodz_baluty,
    rankHarc: RankHarc.zhpSamarytanka,
    org: Org.zhp,
    email: ['marysia.przybylska10@gmail.com', 'maria.przybylska@zhp.net.pl']
);
const Person MARTA_SZYMANDERSKA = Person(name: 'Marta Szymanderska', rankHarc: RankHarc.dhd, hufiec: huf_zhp_warszawa_mokotow, org: Org.zhp);
const Person MARTYNA_BULAKOWSKA = Person(
  name: 'Martyna Bułakowska',
  rankHarc: RankHarc.zhpHOd,
  rankInstr: RankInstr.pwd,
  druzyna: '17 Rudzka Grubwaldzka Drużyna Harcerska „VICTORY”',
  hufiec: huf_zhp_ruda_slaska,
  org: Org.zhp,
  email: ['m.bulakowska1997@gmail.com']
);
const Person MARTYNA_SADOWNIK = Person(
    name: 'Martyna Sadownik',
    druzyna: '316. GDH „Huragan”',
    hufiec: huf_zhp_ziemi_gliwickiej,
    rankHarc: RankHarc.zhpPionierka,
    org: Org.zhp,
    email: ['martyna.sadownik@zhp.net.pl']
);
const Person MARTYNA_WASILEWSKA = Person(
    name: 'Martyna Wasilewska',
    druzyna: '7. BDSH „Żywica”',
    hufiec: 'Reduta',
    rankHarc: RankHarc.zhpPionierka,
    org: Org.zhp,
    email: ['martynawasilewska.1972@gmail.com', 'martynawas91@gmail.com']
);
const Person MARYSIA_SLUGAJ = Person(
  name: 'Marysia Ślugaj',
  rankHarc: RankHarc.zhpHOd,
  hufiec: huf_zhp_wrzesnia_wrzos,
  druzyna: '77. Wrzesińska Drużyna Wędrownicza „Huragan”',
  email: ['nutkiq@gmail.com', 'giyuu@op.pl']
);
const Person MATEUSZ_CIAGLO = Person(name: 'Mateusz Ciągło', rankHarc: RankHarc.dhc);
const Person MATEUSZ_GAWRYSIAK = Person(name: 'Mateusz Gawrysiak', rankHarc: RankHarc.zhpCwik);
const Person MATEUSZ_KOBYLAREK = Person(
    name: 'Mateusz Kobylarek',
    rankHarc: RankHarc.zhpMlodzik,
    druzyna: '35. Poznańska Drużyna Harcerska im. I Polskiej Samodzielnej Kompanii Commando',
    hufiec: huf_zhp_poznan_wilda,
    org: Org.zhp,);
const Person MATEUSZ_KORZENIOWSKI = Person(
    name: 'Mateusz Korzeniowski',
    druzyna: '1. DH D.R.E.S.Z.C.Z',
    hufiec: huf_zhp_wieliczka,

    rankHarc: RankHarc.dhc,
    org: Org.zhp,
    email: ['mateusz.korzeniowski@zhp.net.pl']
);
const Person MATEUSZ_MIKLASZEWSKI = Person(
    name: 'Mateusz Miklaszewski',
    druzyna: '12. DH Silva',
    hufiec: huf_zhp_augustow,
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.dhc,
    org: Org.zhp,
    email: ['mateusz.miklaszewski@gmail.com']
);
const Person MATEUSZ_PYSZKA = Person(
    name: 'Mateusz Pyszka',
    druzyna: '70. SDH',
    org: Org.zhr_o,
    email: ['mati.matixos@gmail.com']
);
const Person MATEUSZ_STEPNIEWSKI = Person(
  name: 'Mateusz Stępniewski',
  druzyna: '119',
  hufiec: huf_zhp_warszawa_zoliborz,
  rankHarc: RankHarc.zhpWywiadowca,
  org: Org.zhp,
  email: ['mateuszk.stepniewski@gmail.com']
);
const Person MATEUSZ_SWIEBODA = Person(
  name: 'Mateusz Świeboda',
  druzyna: '17. KDH Jaworznia',
  hufiec: huf_zhp_kielce_miasto,
  rankHarc: RankHarc.dhc,
  org: Org.zhp,
  email: ['etykik0@gmail.com']
);
const Person MATEUSZ_URBANIAK = Person(
    name: 'Mateusz Urbaniak',
    druzyna: '42 DDH „Czarne Stopy”',
    rankHarc: RankHarc.zhpCwik,
    org: Org.zhp,
    email: ['m.urbaniak125@gmail.com']
);
const Person MAXIMILIAN_STEINHOFF = Person(
  name: 'Maximilian Steinhoff',
  //stop_h: StopZHP.dhc,
  rankInstr: RankInstr.pwd,
  druzyna: 'Próbna Drużyna Harcerzy w Berlinie ZHP Świat „Miś Wojtek”',
);
const Person MICHAL_DYDERSKI = Person(
  name: 'Michał Dyderski',
  rankHarc: RankHarc.zhpHOc,
  rankInstr: RankInstr.pwd,
  druzyna: '93. PDW',
  hufiec: huf_zhp_poznan_wilda,
  org: Org.zhp,
  email: ['michal.dyderski6@gmail.com', 'michal.dyderski@zhp.net.pl']
);
const Person MICHAL_JABCZYNSKI = Person(
  name: 'Michał Jabczyński',
  rankHarc: RankHarc.zhpHRc,
  rankInstr: RankInstr.pwd,
  druzyna: '9. DH „Feniks”',
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
    rankHarc: RankHarc.zhpHOc,
    rankInstr: RankInstr.phm,
    druzyna: '72. Szczep WDHiGZ „Ostoja”',
    hufiec: huf_zhp_warszawa_praga_pn,
    org: Org.zhp,
);
const Person MICHAL_METEL = Person(
  name: 'Michał Mętel',
  druzyna: 'Szczep „Unia” im. Władysława Jagiełły',
  rankHarc: RankHarc.zhpHOc,
  rankInstr: RankInstr.pwd,
  hufiec: huf_zhp_krakow_nowa_huta,
  org: Org.zhp,
  email: ['michal.metel@zhp.net.pl'],
);
const Person MICHAL_PIENIAZEK = Person(
    name: 'Michał Pieniążek',
    druzyna: '1 KDH',
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHRc,
    org: Org.hrp,
    email: ['4michalpieniazek@gmail.com']
);
const Person MICHAL_SITEK = Person(
    name: 'Michał Sitek',
    druzyna: '21. EŚDH Horyzont',
    hufiec: huf_zhp_chrzanow,
    email: ['misiokikol@gmail.com']
);
const Person MICHAL_SUPINSKI = Person(
  name: 'Michał Supiński',
  rankHarc: RankHarc.zhpHOc,
  rankInstr: RankInstr.pwd,
  druzyna: '149. Poznańska Drużyna Harcerska „Bzura” im. generała Tadeusza Kutrzeby',
  hufiec: huf_zhp_poznan_nowe_miasto,
  org: Org.zhp,
  email: ['michal.supinskii@gmail.com']
);
const Person MIECZYSLAW_MICHALIK = Person(
  name: 'Mietek Michalik',
  email: ['mimich@onet.pl'],
);
const Person MIKOLAJ_GORECKI = Person(
    name: 'Mikołaj Górecki',
    druzyna: '30. PgDSHW „Waganci”',
    hufiec: huf_zhp_krakow_pdg,
    org: Org.zhp,
    email: ['mikolaj.gorecki.pl@gmail.com']
);
const Person MIKOLAJ_LUKASIK = Person(
    name: 'Mikołaj Łukasik',
    druzyna: '8. PgDSH „Pandora”',
    hufiec: huf_zhp_krakow_pdg,
    rankHarc: RankHarc.dhc,
    org: Org.zhp,
    email: ['mikiriki2017@gmail.com']
);
const Person MIKOLAJ_MATUSZEWSKI = Person(
  name: 'Mikołaj Matuszewski',
  druzyna: '43. CHDG „SULIMA” im. Rycerza Zawiszy Czarnego',
  hufiec: huf_zhp_czestochowa,
  org: Org.zhp,
  email: ['mikolaj.matuszewski@zhp.net.pl'],
);
const Person NADIA_OSSOWSKA = Person(
  name: 'Nadia Ossowska',
  rankHarc: RankHarc.dhd,
  druzyna: '6. Zagłębiowska Drużyna Harcerska „Eleusis” im.Stanisława Żółkiewskiego',
  hufiec: huf_zhp_ziemi_bedzinskiej,
  org: Org.zhp,
  email: ['nadia.ossowska.2007@gmail.com', 'nadia.ossowska@icloud.com'],
);
const Person NADIA_WYSZOGRODZKA = Person(
  name: 'Nadia Wyszogrodzka',
  druzyna: '1. Drużyna Specjalnościowa „Grom” im. Cichociemnych Spadochroniarzy Armi Krajowej w Węgrowie',
  hufiec: huf_zhp_doliny_liwca,
  org: Org.zhp
);
const Person NATALIA_STODOLNA = Person(
    name: 'Natalia Stodolna',
    druzyna: '1. DSH „Viatores”',
    hufiec: huf_zhp_zielona_gora,
    rankHarc: RankHarc.zhpSamarytanka,
    org: Org.zhp,
    email: ['natalia.stodolna@zhp.net.pl']
);
const Person OLGA_JAJKO = Person(
  name: 'Olga Jajko',
  rankInstr: RankInstr.pwd,
  druzyna: '1. Krakowska Drużyna Harcerska HRP',
  org: Org.hrp,
  email: ['olgajajko2004@gmail.com']
);
const Person OLGA_LUCZAK = Person(
    name: 'Olga Łuczak',
    druzyna: '1. DH „Huragan”',
    hufiec: huf_zhp_sieradz,
    org: Org.zhp,
    email: ['oluczak390@gmail.com']
);
const Person OLIWIA_MAJDA = Person(
    name: 'Oliwia Majda',
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOd,
    druzyna: '47. Bolszewska Gromada Zuchowa „Odważne Pingwiny”',
    hufiec: huf_zhp_wejherowo,
    org: Org.zhp,
    email: ['oliwia.majda@zhp.net.pl']
);
const Person OLIWIA_STANCZYK = Person(
  name: 'Oliwia Stańczyk',
  org: Org.zhp,
  email: ['oliwia.stanczyk@zhp.net.pl']
);
const Person OLIWIER_STARCZEWSKI = Person(
  name: '- Oliwier Starczewski',
  druzyna: '16 GDH „Cichociemni” im. Adama „Pługa” Borysa',
  hufiec: huf_zhp_gdansk_srodmiesie,
  org: Org.zhp,
  email: ['staryoliwierszoli@gmail.com']
);
const Person OSKAR_PARDYAK = Person(name: 'Oskar Pardyak', rankInstr: RankInstr.pwd, rankHarc: RankHarc.zhpHOc, org: Org.zhp);
const Person OSKAR_SAKOWICZ = Person(
    name: 'Oskar Sakowicz',
    druzyna: '50WDH-y „Sztorm” im. gen. Mariusza Zaruskiego',
    org: Org.sh,
    email: ['oskarsakowicz05@gmail.com']
);
const Person PATRYCJA_PIETRAS = Person(
  name: 'Patrycja Pietras',
  druzyna: '6. ZDH „Eleusis”',
  hufiec: huf_zhp_ziemi_bedzinskiej,
  org: Org.zhp,
  email: ['patusiapietras2101@gmail.com']
);
const Person PATRYCJA_SPYRKA = Person(
    name: 'Patrycja Spyrka',
    druzyna: '8. PgDSH „Pandora”',
    hufiec: huf_zhp_krakow_pdg,
    org: Org.zhp,
    email: ['patrycjaspyrka13@gmail.com']
);
const Person PATRYCJA_SZCZESNA = Person(name: 'Patrycja Szczęsna', rankInstr: RankInstr.pwd, rankHarc: RankHarc.zhpHOd, hufiec: huf_zhp_warszawa_praga_pn, org: Org.zhp);
const Person PATRYK_GRABOWSKI = Person(
    name: 'Patryk Grabowski',
    druzyna: '174. WDH-y „Wilki”',
    hufiec: huf_zhp_warszawa_ochota,
    org: Org.zhp,
    email: ['patryk.grabowski@zhp.net.pl']
);
const Person PAULINA_BURDZIK = Person(name: 'Paulina Burdzik', rankInstr: RankInstr.pwd, hufiec: huf_zhp_krakow_pdg, org: Org.zhp, comment: 'J. niemiecki',);
const Person PAULINA_LUBOS = Person(
  name: 'Paulina Lubos',
  druzyna: '4. Niezależna Drużyna Harcerek „Casus”',
  org: Org.sh,
  email: ['4ndhcasus@gmail.com'],
);
const Person PAWEL_KIMEL = Person(
  name: 'Paweł Kimel',
  email: ['pawel.kimel@gmail.com']
);
const Person PAWEL_MARUD = Person(name: 'Piotr Marud');
const Person PIOTR_KUBOWICZ = Person(
    name: 'Piotr Kubowicz',
    druzyna: '2. NDWP „Płomienie”',
    hufiec: huf_zhp_nowy_sacz,
    email: ['piotr.kubowicz@supersnow.com', 'ocwypyziuleh@gmail.com']
);
const Person PIOTR_MACIEJ_KABATA = Person(name: 'Piotr Maciej Kabata');
const Person PIOTR_SOSNOWSKI = Person(name: 'Piotr Sosnowski', rankInstr: RankInstr.pwd,
  druzyna: 'II. SzDHiZ, 74. Poznańska Drużyna Wędrownicza „Lewe Skrzydło” im. Dywizjonu 303',
  hufiec: huf_zhp_poznan_wilda,
  org: Org.zhp,
);
const Person PIOTR_TUROWSKI = Person(
  name: 'Piotr Turowski',
  rankInstr: RankInstr.pwd,
  org: Org.zhp,
  email: ['piotr.turowski@zhp.net.pl']
);
const Person PIOTR_URBANIEC = Person(
  name: 'Piotr Urbaniec',
  rankHarc: RankHarc.zhpWywiadowca,
  hufiec: huf_zhp_ziemi_rybnickiej,
  org: Org.zhp,
  email: ['piotr23042006@gmail.com'],
);
const Person PIOTR_ZIEMBIKIEWICZ = Person(name: 'Piotr Ziembikiewicz', rankInstr: RankInstr.phm);
const Person PRZEMYSLAW_KLUCZKOWSKI = Person(name: 'Przemysław Kluczkowski');
const Person RADOSLAW_RELIDZYNSKI = Person(
  name: 'Radosław Relidzyński',
  rankInstr: RankInstr.pwd,
  rankHarc: RankHarc.zhpHOc,
  druzyna: 'Warszawska Drużyna Wędrownicza „Halny”',
  hufiec: huf_zhp_warszawa_praga_pn,
  org: Org.zhp
);
const Person RAFAL_BARAN = Person(
  name: 'Rafał Baran',
  rankHarc: RankHarc.dhc,
  druzyna: '72. Dąbrowska Drużyna Starszoharcerska „Niebieska Mgła”',
);
const Person RAFAL_KOWALSKI = Person(
  name: 'Radał Kowalski',
  rankHarc: RankHarc.zhpMlodzik,
  hufiec: huf_zhp_rzeszow,
  druzyna: '14. DH im. K.K. Baczyńskiego',
  org: Org.zhp,
);
const Person RAFAL_LALIK = Person(name: 'Rafał Lalik', rankHarc: RankHarc.zhpHOc,
  druzyna: '30. Podgórska Drużyna Harcerska „Zielone Stopy”',
  hufiec: huf_zhp_krakow_pdg,
  org: Org.zhp,
);
const Person ROBERT_LISZEWSKI = Person(
    name: 'Robert Liszewski',
    druzyna: "25. Środowiskowa Drużyna Harcerska „Echo” im. Tony'ego Halika",
    hufiec: huf_zhp_sochaczew,
    rankHarc: RankHarc.zhpCwik,
    org: Org.zhp,
    email: ['liszewskir25@gmail.com']
);
const Person ROBERT_MAZUR = Person(name: 'Robert Mazur', rankHarc: RankHarc.zhpOdkrywca);
const Person ROBERT_ROBOTYCKI = Person(name: 'Robert Rybotycki', rankHarc: RankHarc.zhpOdkrywca, org: Org.zhp,);
const Person RYSZARD_LASECKI = Person(
    name: 'Ryszard Łasecki',
    druzyna: '102. WDH',
    hufiec: huf_zhp_wagrowiec,
    rankHarc: RankHarc.dhc,
    org: Org.zhp,
    email: ['lasecki.rysiu@gmail.com']
);
const Person SANDRA_RZESZUREK = Person(name: 'Sandra Rzeszutek', email: ['sandrarzeszutek@wp.pl']);
const Person SARA_WALCZYNSKA_GORA = Person(name: 'Sara Walczyńska-Góra', rankHarc: RankHarc.zhpPionierka, org: Org.zhp);
const Person SEBASTIAN_BINKOWICZ = Person(
  name: 'Sebastian Bińkowicz',
  email: ['sebastian.binkowicz@zhp.net.pl']
);
const Person SEBASTIAN_KOPROWSKI = Person(
  name: 'Stanisław Koprowski',
  rankInstr: RankInstr.pwd,
  rankHarc: RankHarc.zhpHOc,
  druzyna: '37. Harcerska Drużyna Męska im. Franciszka Drake’a',
  hufiec: huf_zhp_brodnica,
  email: ['sebastian.koprowski@zhp.net.pl']
);
const Person SEBASTIAN_SOBOLEWSKI = Person(
    name: 'Sebastian Sobolewski',
    email: ['sebastian.sobolewski05@gmail.com']
);
const Person SEBASTIAN_SUGALSKI = Person(
  name: 'Sebastian Sugalski',
  rankHarc: RankHarc.zhpHOc,
  rankInstr: RankInstr.pwd,
  druzyna: 'Zielony Szczep 10-ych Koszalińskich Drużyn Harcerskich i Gromad Zuchowych',
  hufiec: huf_zhp_ziemi_koszalinskiej,
  email: ['sugalski29@gmail.com'],
);
const Person SEWERYN_WOLINSKI = Person(name: 'Seweryn Woliński', rankHarc: RankHarc.zhpOdkrywca, org: Org.zhp);
const Person STANISLAW_WRONSKI = Person(name: 'Stanisław Wroński');
const Person STEFAN_KRYCZKA = Person(name: 'Stefan Kryczka', rankHarc: RankHarc.zhpCwik, druzyna: '295. Warszawska Drużyna „Wataha”');
const Person SZYMON_BARCZYK = Person(
    name: 'Szymon Barczyk',
    druzyna: '60. WDH „Amber”',
    hufiec: huf_zhp_warszawa_ursus_wlochy,
    org: Org.zhp,
    email: ['szbarsz5@gmail.com']
);
const Person SZYMON_CHORAZY = Person(
  name: 'Szymon „Durszlak” Chorąży',
  druzyna: '72. WDHS „Uroczysko”',
  hufiec: huf_zhp_warszawa_praga_pn,
  org: Org.zhp
);
const Person SZYMON_DRATWINSKI = Person(
  name: 'Szymon Dratwiński',
  rankHarc: RankHarc.zhpCwik,
  druzyna: '16. Krakowska Drużyna Harcerska',
  hufiec: huf_zhp_krakow_srodmiescie,
  org: Org.zhp,
  email: ['szymon.dratwinski@gmail.com']
);
const Person SZYMON_DROPEK = Person(name: 'Szymon Dropek',
  druzyna:'7. Kwidzyńska Drużyna Harcerska',
  hufiec: huf_zhp_kwidzyn,
  rankInstr: RankInstr.pwd,
  rankHarc: RankHarc.zhpHOc,
  org: Org.zhp,
  email: ['szymon111drop@gmail.com', 'szymon.dropek@zhp.net.pl']
);
const Person SZYMON_JACKIEWICZ = Person(
    name: 'Szymon Jackiewicz',
    druzyna: '63 DW „Nagi Ranka”',
    rankHarc: RankHarc.zhpWywiadowca,
    org: Org.zhp,
    email: ['szymbro300@gmail.com']
);
const Person SZYMON_JAWOREK = Person(name: 'Szymon Jaworek',
  druzyna: '17 DH „Gryfne Bajtle”',
  hufiec: huf_zhp_ziemi_tarnogorskiej
);
const Person SZYMON_PODGORNY = Person(name: 'Szymon Podgórny',
    druzyna:'19. Pyzdrska Drużyna Wędrownicza „Wataha”, 5 Pyzdrski szczep „Orion”',
    hufiec: huf_zhp_wrzesnia_wrzos,
    org: Org.zhp,
    email: ['szymon.podgorny@zhp.net.pl']
);
const Person SZYMON_SITEK = Person(
    name: 'Szymon Sitek',
    druzyna: '29 DSH „Ignis” w Zgórzu',
    hufiec: huf_zhp_garwolin,
    org: Org.zhp,
    email: ['szymonsitek09@gmail.com']
);
const Person SZYMON_ZDZIEBKO = Person(name: 'Szymon Zdziebko');
const Person TOMASZ_BUKOWIECKI = Person(
  name: 'Tomasz Bukowiecki',
  rankHarc: RankHarc.zhpOdkrywca,
  druzyna: '25. Wielopoziomowa Drużyna Harcerska „Brzask” im. Cichociemnych Spadochroniarzy Armii Krajowej',
  hufiec: huf_zhp_legionowo,
  org: Org.zhp,
  email: ['tomasz.bukowiecki@zhp.net.pl']
);
const Person TOMASZ_FLORCZAK = Person(
    name: 'Tomasz Florczak',
    druzyna: '99. Przemyska Drużyna Starszoharcerska',
    hufiec: huf_zhp_ziemi_przemyskiej,
    rankHarc: RankHarc.dhc,
    org: Org.zhp,
    email: ['tflorczak913@gmail.com']
);
const Person TOMASZ_ZAGORSKI = Person(
  name: 'Tomasz Zagórski',
  rankInstr: RankInstr.phm,
  org: Org.zhp,
  email: ['tomasz.zagorski@zhp.net.pl']
);
const Person WANDA_MARCHEL = Person(
    name: 'Wanda Marchel',
    rankHarc: RankHarc.zhpOchotniczka,
    druzyna: '13. DH „Szczęściarze”',
    hufiec: huf_zhp_opole,
    org: Org.zhp
);
const Person WERONIKA_ZAWIERUCHA = Person(
    name: 'Weronika Zawierucha',
    druzyna: '43. ZDHS „Parasol”',
    hufiec: huf_zhp_zgierz,
    rankHarc: RankHarc.zhpPionierka,
    org: Org.zhp,
    email: ['zawieruchaweronika570@gmail.com']
);
const Person WIKTOR_KARPALA = Person(name: 'Wiktor Karpała', rankHarc: RankHarc.zhpHOc, rankInstr: RankInstr.pwd,
  druzyna:'74. DH „Desant” im. 1. SBS gen. bryg. Stanisława Sosabowskiego',
  hufiec: huf_zhp_podkrakowski,
  org: Org.zhp,
);
const Person WIKTORIA_PINKOWSKA = Person(
    name: 'Wiktoria Pinkowska',
    druzyna: '8. Zgierska Wodna Drużyna Harcerzy Starszych „Nieskończoność”',
    hufiec: huf_zhp_zgierz,
    email: ['wiktoria.pinkowska@zhp.net.pl', 'w.pinkowskaa@gmail.com']
);
const Person WIKTORIA_PRUSZYNSKA = Person(
  name: 'Wiktoria Pruszyńska',
);
const Person WIKTORIA_WOJCIK = Person(
  name: 'Wiktoria Wójcik',
  rankHarc: RankHarc.zhpSamarytanka,
  email: ['wiktoria.wojcik1@zhp.net.pl']
);
const Person WINCENTY_DIETRYCH = Person(name: 'Wincenty Dietrych', rankHarc: RankHarc.dhc);
const Person WITOLD_JAKUBOWSKI = Person(
    name: 'Witold Jakubowski',
    druzyna: '50. WDW „BOREALIS”',
    hufiec: huf_zhp_warszawa_ursus_wlochy,
    rankHarc: RankHarc.zhpMlodzik,
    org: Org.zhp,
    email: ['shinypokemin.hunterxdddd@gmail.com']
);
const Person WOJCIECH_GRUSZCZYNSKI = Person(name: 'Wojciech Gruszczyński', rankHarc: RankHarc.zhpCwik,
  druzyna: '35. Poznańska Drużyna Harcerska',
  org: Org.zhp,
);
const Person WOJCIECH_GODECKI = Person(
  name: 'Wojciech Godecki',
  rankInstr: RankInstr.hm,
  druzyna: '„Złota Ósemka” im. Zawiszy Czarnego',
  hufiec: huf_zhp_dabrowa_gornicza,
  email: ['wojciech.godecki@zhp.net.pl']
);
const Person WOJCIECH_JUCYK = Person(
    name: 'Wojciech Jucyk',
    druzyna: '73 DSH „Los Niños”',
    hufiec: huf_zhp_konin,
    rankHarc: RankHarc.zhpOdkrywca,
    org: Org.zhp,
    email: ['wojtek.jucyk.buffon@gmail.com', 'wojciech.jucyk@zhp.net.pl']
);
const Person WOJCIECH_TURSKI = Person(name: 'Wojciech Turski', rankHarc: RankHarc.zhpCwik, org: Org.zhp);
const Person WOJCIECH_WALACH = Person(
  name: 'Wojciech Wałach',
  druzyna: '34. DH „Watra” im. Braci Buchalików',
  hufiec: huf_zhp_ziemi_rybnickiej,
  org: Org.zhp,
  email: ['wojtek.w.2008@gmail.com'],
);
const Person WOJCIECH_WOLNIK = Person(
    name: 'Wojciech Wolnik',
    rankHarc: RankHarc.zhpMlodzik,
    druzyna: '7. Przemeckiej Drużyna Harcerska im. Jana Pawła II',
    hufiec: huf_zhp_wolsztyn,
    org: Org.zhp
);
const Person WOJCIECH_ZIELINSKI = Person(name: 'Wojciech Zielinski', rankHarc: RankHarc.dhc);
const Person ZBYSZEK_CHODAKOWSKI = Person(name: 'Zbyszek Chodakowski', rankHarc: RankHarc.zhpCwik, org: Org.zhp);
const Person ZOFIA_FABROWSKA = Person(
    name: 'Zofia Fabrowska',
    rankHarc: RankHarc.zhpHOd,
    rankInstr: RankInstr.pwd,
    org: Org.zhp,
    email: ['zofia.fabrowska@zhp.net.pl']
);
const Person ZOFIA_KOSIDER = Person(
    name: 'Zosia Kosider',
    druzyna: '1. DH „Wilcza Sfora”',
    hufiec: huf_zhp_ziemi_wodzislawskiej,
    org: Org.zhp,
    email: ['zosiakosider@gmail.com']
);
const Person ZOFIA_SZAFRANEK = Person(
  name: 'Zofia Szafranek',
  rankHarc: RankHarc.zhpPionierka,
  druzyna: '39. Wielopoziomowa Drużyna Harcerska „Leśne Stwory” w Radlinie',
  hufiec: huf_zhp_ziemi_wodzislawskiej,
  org: Org.zhp,
  email: ['zofia.szafranek2008@gmail.com']
);
const Person ZOFIA_ZAWADZKA = Person(
    name: 'Zofia Zawadzka',
    rankHarc: RankHarc.zhpTropicielka,
    hufiec: huf_zhp_warszawa_zoliborz,
    druzyna: '128. WDH',
    org: Org.zhp
);
const Person ZOFIA_ZBRUK = Person(
    name: 'Zofia Zbruk',
    druzyna: '5. PDHS „Wagabunda” im. Kazimierza Nowaka',
    hufiec: huf_zhp_poznan_grunwald,
    org: Org.zhp,
    email: ['anonusiauvu@gmail.com']
);
const Person ZUZANNA_ANDRZEJCZAK = Person(
    name: 'Zuzanna Andrzejczak',
    druzyna: '15. ZWDH „Atlantyda”',
    hufiec: huf_zhp_zgierz,
    email: ['zuzannaandrzejczak12@gmail.com']
);
const Person ZUZANNA_DUDEK = Person(
    name: 'Zuzanna Dudek',
    druzyna: '8. Drużyna Harcerska „Tajne Śledzie”',
    hufiec: huf_zhp_olkusz,
    rankHarc: RankHarc.dhd,
    org: Org.zhp,
    email: ['z.dudek2011@gmail.com', 'zizigames2011@gmail.com']
);
const Person ZUZANNA_JAWORSKA = Person(
    name: 'Zuzanna Jaworska',
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOd,
    org: Org.zhp,
    hufiec: huf_zhp_wroclaw
);
const Person ZUZANNA_KOLIS = Person(
  name: 'Zuzanna Kolis',
  rankHarc: RankHarc.zhpOchotniczka,
  druzyna: 'Wilki',
  hufiec: huf_zhp_glowno,
  org: Org.zhp,
  email: ['koliszuzia@gmail.com'],
);
const Person ZUZANNA_KOWALCZYK = Person(
  name: 'Zuzanna Kowalczyk',
  rankHarc: RankHarc.zhpOchotniczka,
  hufiec: huf_zhp_stargard,
  druzyna: '1. Choszczeńska Drużyna Starszoharcerska „Regulus” im. Janusza Korczaka',
  org: Org.zhp
);
const Person ZUZANNA_MIERZEJEWSKA = Person(
  name: 'Zuzanna Mierzejewska',
  rankHarc: RankHarc.zhpOchotniczka,
  druzyna: '13. Lubańska Drużyna Starszoharcerska „Brzask”',
  hufiec: huf_zhp_luban,
  org: Org.zhp
);
const Person ZUZANNA_NAWROT = Person(
    name: 'Zuzanna Nawrot',
    druzyna: '9. BGZ „Pszczółki”',
    hufiec: huf_zhp_reduta,
    rankHarc: RankHarc.zhpSamarytanka,
    org: Org.zhp,
    email: ['zuzannanawrot5c@gmail.com']
);
const Person ZUZANNA_NIEWEGLOWSKA = Person(
    name: 'Zuzanna Niewęgłowska',
    druzyna: '307. WDH-EK „Zorza”',
    hufiec: huf_zhp_warszawa_mokotow,
    rankInstr: RankInstr.pwd,
    rankHarc: RankHarc.zhpHOd,
    org: Org.zhp,
    email: ["zuzanna.nieweglowska@zhp.net.pl", 'z.nieweglowska01@gmail.com']
);
const Person ZUZANNA_PIWKO = Person(
  name: 'Zuza Piwko',
  rankHarc: RankHarc.zhpHOc,
  rankInstr: RankInstr.pwd,
  druzyna: '46 Wrocławska Drużyna Harcerska „Arda”',
  hufiec: huf_zhp_wroclaw_wschod,
  org: Org.zhp,
  email: ['zuzanna.piwko@zhp.net.pl']
);
const Person ZUZANNA_ROMANISZYN = Person(
    name: 'Zuzanna Romaniszyn',
    druzyna: '321 Teraz',
    hufiec: huf_zhp_krakow_nowa_huta,
    email: ['zuziarysia19@outlook.com']
);
const Person ZUZANNA_WARCHOL = Person(name: 'Zuzanna Warchoł', druzyna: '113. TWDH „Pustynna Burza”', org: Org.zhp, hufiec: huf_zhp_szczecin_pogodno);

class Person{

  final String name;
  final RankHarc? rankHarc;
  final RankInstr? rankInstr;
  final String? druzyna;
  final String? hufiec;
  final Org? org;
  final String? comment;
  final List<String> email;

  const Person({
    required this.name,
    this.rankHarc,
    this.rankInstr,
    this.druzyna,
    this.hufiec,
    this.org,
    this.comment,
    this.email = const []
  });
  
}

class PersonCardSimple extends StatelessWidget{

  String get name => person.name;
  RankHarc? get rankHarc => person.rankHarc;
  RankInstr? get rankInstr => person.rankInstr;
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
          if(rankHarc != null
              && rankHarc != RankHarc.zhpHOc
              && rankHarc != RankHarc.zhpHOd
              && rankHarc != RankHarc.zhpHRc
              && rankHarc != RankHarc.zhpHRd
          ) Text('${rankHarcShortName(rankHarc)} ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textColor??textEnab_(context))),
          if(rankInstr != null) Text('$rankInstr ', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textColor??textEnab_(context))),
          Text(name, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.bold, color: textColor??textEnab_(context))),
          if(rankHarc == RankHarc.zhpHOc
              || rankHarc == RankHarc.zhpHOd
              || rankHarc == RankHarc.zhpHRc
              || rankHarc == RankHarc.zhpHRd
          ) Text(' ${rankHarcShortName(rankHarc)}', style: AppTextStyle(color: textColor??textEnab_(context))),
          Expanded(child: Container()),
        ],
      )
  );
}

class PersonCard extends StatelessWidget{

  String get name => person.name;
  RankHarc? get rankHarc => person.rankHarc;
  RankInstr? get rankInstr => person.rankInstr;
  String? get druzyna => person.druzyna;
  String? get hufiec => person.hufiec;
  Org? get org => person.org;
  String? get comment => person.comment;

  final Person person;
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
            if(rankHarc != null
                && rankHarc != RankHarc.zhpHOc
                && rankHarc != RankHarc.zhpHOd
                && rankHarc != RankHarc.zhpHRc
                && rankHarc != RankHarc.zhpHRd
            ) Text('${rankHarcShortName(rankHarc)} ', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
            if(rankInstr != null) Text('${rankInstrToStr(rankInstr!)}. ', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
            Text(name, style: AppTextStyle(fontSize: textSize, fontWeight: weight.halfBold, color: textColor??textEnab_(context))),
            if(rankHarc == RankHarc.zhpHOc
                || rankHarc == RankHarc.zhpHOd
                || rankHarc == RankHarc.zhpHRc
                || rankHarc == RankHarc.zhpHRd
            ) Text(' ${rankHarcShortName(rankHarc)}', style: AppTextStyle(fontSize: textSize, color: textColor??textEnab_(context))),
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