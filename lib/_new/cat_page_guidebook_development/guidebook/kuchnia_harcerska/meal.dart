import 'equipment.dart';
import 'ingredient.dart';
import 'product.dart';

class Meal{

  static const String TAG_JARSKIE = "#Jarskie";
  static const String TAG_JEDNOGARNKOWE = "#Jednogarnkowe";

  static Meal bigos_cyganski = Meal.create('Bigos cygański',
      [
        const Ingredient(Product.cebula, 5, Unit.item),
        const Ingredient(Product.ziemniaki, 1, Unit.item),
        const Ingredient(Product.kielbasa, 200, Unit.g),
        const Ingredient(Product.czosnek, 3, Unit.clove),
        const Ingredient(Product.pulpa_pomidorowa, 150, Unit.g),
        const Ingredient(Product.sol, 0.1, Unit.spoonS),
        const Ingredient(Product.pieprz, 0.1, Unit.spoonS),
        const Ingredient(Product.olej_rzepakowy, 20, Unit.ml),
      ],
      {
        Equipment.PATELNIA:1,
        Equipment.GARNEK:1,
        Equipment.NOZ: 1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.DREWNIANA_SZPATULKA:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
      },
      [
        'Kiełbasę pokroić w kostkę i podsmażyć na rumiano.',
        'Do garnka wrzucić ziemniaki pokrojone w kostkę i gotować do miękkości.',
        'Do garnka dorzucić cebulę pokrojoną w piórka i dusić.',
        'Gdy cebula się zeszkli, dodać kiełbasę.',
        'Wszystko zalać pulpą pomidorową.',
        'Doprawić solą i pieprzem.',
        'Gotować 15min.',
        'Pokroić i dodać czosnek.',
        'Gotować 5 min.',
      ],
      fire: true,
      water: false
  );

  static Meal buraki_na_ostro = Meal.create(
      "Buraki na ostro",
      [
        const Ingredient(Product.burak, 500, Unit.g),
        const Ingredient(Product.chrzan, 120, Unit.g),
        const Ingredient(Product.czosnek, 6, Unit.clove),
        const Ingredient(Product.smietana, 300, Unit.g),
        const Ingredient(Product.sol, 0.1, Unit.spoonS)
      ],
      {
        Equipment.GARNEK:1,
        Equipment.TARKA:1,
        Equipment.NOZ:1,
        Equipment.LYZKA_DO_MIESZANIA:1
      },
      [
        'Buraki ugotowac bez opierania.',
        'Obrać i zetrzeć buraki na tarce.',
        'Obrać i drobno pokroić czosnek.',
        'Buraki, czosnek, chrzan i śmietanę wymieszać.',
        'Doprawić solą.',
      ],
      tags: [TAG_JARSKIE],
      fire: true,
      water: false
  );

  static Meal burito = Meal.create(
      "Burito",
      [
        const Ingredient(Product.mieso_mielone_wieprzowe, 500, Unit.g),
        const Ingredient(Product.cebula, 1, Unit.item),
        const Ingredient(Product.papryka_czerwona, .5, Unit.item),
        const Ingredient(Product.passata, 200, Unit.g),
        const Ingredient(Product.fasola_czerwona, 400, Unit.g),
        const Ingredient(Product.olej_rzepakowy, 1, Unit.spoonB),
        const Ingredient(Product.tortilla_przenna, 6, Unit.item),
        const Ingredient(Product.sol, 1, Unit.spoonS),
        const Ingredient(Product.slodka_papryka, 1, Unit.spoonS),
        const Ingredient(Product.ostra_papryka, 1, Unit.spoonS),
      ],
      {
        Equipment.PATELNIA:1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.NOZ:1,
        Equipment.DREWNIANA_SZPATULKA:1,
      },
      [
        'Paprykę i cebulę pokroić w kostkę i podsmażyć na rozgrzanym oleju do zeszklenia.',
        'Dodać na patelnię mięso z przyprawami i rozdrobnić w miarę możliwości szpatułką.',
        'Do usmażonego mięsa dodać fasolę oraz passatę pomidorową. Wymieszać i w razie potrzeby doprawić.',
        'Tortille podgrzać na patelni przez 1 minutę z każdej strony, nałożyć 1/6 farszu i zawinąć.',
      ],
      fire: true,
      water: false
  );

  static Meal chili_con_carne = Meal.create("Chili con carne",
      [
        const Ingredient(Product.piersi_z_kurczaka, 60, Unit.g),
        const Ingredient(Product.majeranek, 3, Unit.g),
        const Ingredient(Product.sos_slodko_kwasny, 100, Unit.ml),
        const Ingredient(Product.papryka_czerwona, 30, Unit.g),
        const Ingredient(Product.pomidor, 40, Unit.g),
        const Ingredient(Product.cukinia, 30, Unit.g),
        const Ingredient(Product.kukurydza_puszka, 25, Unit.g),
        const Ingredient(Product.groszek_zielony, 25, Unit.g),
        const Ingredient(Product.cebula, 0.25, Unit.item),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1,
      },
      [
        'Pokroić mięso w kostkę i wymieszać z przyprawami.',
        'Pokroić wszystkie warzywa w kostkę.',
        'Przygotować sos. Jeśli w proszku: przygotować według zaleceń (zazwyczaj trzeba rozpuścić w szklance wody).',
        'Rozgrzać olej w garnku.',
        'Wrzucić na gorący olej mięso i cebulę.',
        'Mieszać dopóki mięso nie będzie usmażone.',
        'Dodać sos do mięsa i mieszać przez 5 min.',
        'Wrzucić wszystkie warzywa.',
        'Całość mieszać przez 10 – 15 min. lub dopóki potrawa nie będzie ciepła.',
      ],
      tags: [TAG_JEDNOGARNKOWE],
      water: false,
      fire: true
  );

  static Meal chlopski_garnek = Meal.create("Chłopski garnek",
      [
        const Ingredient(Product.olej_rzepakowy, 2, Unit.spoonB),
        const Ingredient(Product.cebula, 1, Unit.item),
        const Ingredient(Product.boczek_wedzony, 150, Unit.g),
        const Ingredient(Product.kielbasa, 300, Unit.g),
        const Ingredient(Product.bulion, 1, Unit.item),
        const Ingredient(Product.ziemniaki, 3, Unit.item),
        const Ingredient(Product.majeranek, 1, Unit.spoonB),
        const Ingredient(Product.slodka_papryka, 1, Unit.spoonB),
        const Ingredient(Product.pieprz, 1, Unit.spoonB),
        const Ingredient(Product.papryka_czerwona, 0.5, Unit.item),
        const Ingredient(Product.passata, 130, Unit.ml),
        const Ingredient(Product.sol, 1, Unit.spoonS),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1,
      },
      [
        'Do szerokiego garnka wlać oliwę lub olej.',
        'Dodać obraną i pokrojoną w kosteczkę cebulę.',
        'Dodać pokrojony w kostkę parzony boczek.',
        'Mieszając co chwilę smażyć na umiarkowanym ogniu aż cebula się zeszkli a boczek zacznie się rumienić.',
        'Dodać pokrojoną na plasterki kiełbasę.',
        'Dodać obrane i pokrojone w kostkę ziemniaki, paprykę w proszku i majeranek.',
        'Wszystko wymieszać, a następnie dodać 500 ml gorącej wody i bulion.',
        'Przykryć i gotować przez ok. 10 minut, do czasu aż ziemniaki będą miękkie.',
        'Dodać pokrojoną paprykę, wymieszać i gotować przez ok. 5 minut.',
        'Wlać przecier, doprawić solą i gotować przez ok. 3 minuty.'
      ],
      tags: [TAG_JEDNOGARNKOWE],
      water: true,
      fire: true
  );

  static Meal grochowka_wojskowa = Meal.create("Grochówka wojskowa",
      [
        const Ingredient(Product.groch, 500, Unit.g),
        const Ingredient(Product.boczek_wedzony, 300, Unit.g),
        const Ingredient(Product.kielbasa, 100, Unit.g),
        const Ingredient(Product.marchew, 1, Unit.item),
        const Ingredient(Product.pietruszka_korzen, 1, Unit.item),
        const Ingredient(Product.seler, 100, Unit.g),
        const Ingredient(Product.cebula, 1, Unit.item),
        const Ingredient(Product.czosnek, 2, Unit.clove),
        const Ingredient(Product.ziemniaki, 3, Unit.item),
        const Ingredient(Product.smietana, 50, Unit.ml),
        const Ingredient(Product.sol, 0.1, Unit.spoonS),
        const Ingredient(Product.pieprz, 0.4, Unit.spoonS),
        const Ingredient(Product.lisc_laurowy, 1, Unit.item),
        const Ingredient(Product.ziele_angielskie, 1, Unit.spoonS),
        const Ingredient(Product.majeranek, 1, Unit.spoonS),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
        Equipment.NOZ:1,
        Equipment.TARKA:1,
        Equipment.DESKA_DO_KROJENIA:1,
      },
      [
        'Zamoczyć groch na kilka godzin',
        'Do grochu dolać wody, ziele angielskie, listek laurowy, kminek, majeranek, sól, pieprz i gotować.',
        'Zetrzeć marchewkę, pietruszkę i seler i dodać do garnka.',
        'Na patelni podsmażyć kiełbasę, boczek, cebulę.',
        'Gdy cebula się zezłoci, całość z patelni dodać do garnka.',
        'Ziemniaki pokroić w kostkę i dodać do garnka.',
        'Gdy ziemniaki zmiękną, dodać śmietanę.',
        'Można przyprawić solem, pieprzem i majerankiem.'
      ],
      water: true,
      fire: true
  );

  static Meal gulasz_wieprzowy = Meal.create("Gulasz wieprzowy",
      [
        const Ingredient(Product.szynka_wieprzowa, 1000, Unit.g),
        const Ingredient(Product.cebula, 2, Unit.item),
        const Ingredient(Product.czosnek, 2, Unit.clove),
        const Ingredient(Product.ostra_papryka, .3, Unit.spoonS),
        const Ingredient(Product.slodka_papryka, .5, Unit.spoonS),
        const Ingredient(Product.sol, .5, Unit.spoonS),
        const Ingredient(Product.pieprz, .5, Unit.spoonS),
        const Ingredient(Product.majeranek, 1, Unit.spoonS),
        const Ingredient(Product.lisc_laurowy, 3, Unit.item),
        const Ingredient(Product.koncentrat_pomidorowy, 3, Unit.spoonS),
        const Ingredient(Product.por, 200, Unit.g),
        const Ingredient(Product.marchew, 1, Unit.item),
        const Ingredient(Product.olej_rzepakowy, 1, Unit.spoonB),
        const Ingredient(Product.maka_przenna, 1, Unit.spoonB),
      ],
      {
        Equipment.RECZNIK_PAPIEROWY:1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.NOZ:1,
        Equipment.PATELNIA:1,
        Equipment.MENAZKA:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
      },
      [
        'Mięso na gulasz wieprzowy umyć, odcisnąć papierowym ręcznikiem, pokroić w małą kostkę.',
        'Cebulę pokroić w piórka, zeszklić na oleju w głębokiej patelni, przełożyć do menażki.',
        'Na tej samej patelni, obsmażyć mięso wieprzowe na złoty kolor.',
        'Obrać i pokrić marchewkę, umyć i cienko pokroić pora. Wszystko to razem z cebulą dodać do mięsa na patelni.',
        'Do patelni dolać wody, aż do przykrycia mięsa.',
        'Dusić ok. 15 min. na małym ogniu, pod przykryciem.',
        'Dodać przyprawy: paprykę w proszku, liść laurowy, posiekany czosnek, majeranek i koncentrat pomidorowy. Doprawić solą i pieprzem.',
        'Wszystko dusić, aż mięsko będzie miękkie. Na końcu dodać łyżkę mąki, rozrobioną z odrobiną wody. zGotować jeszcze ok. 5 min.',
      ],
      water: true,
      fire: true
  );

  static Meal jajecznica = Meal.create(
      'Jajecznica',
      const [
        Ingredient(Product.jajko, 3, Unit.item),
        Ingredient(Product.szynka_wedzona, 1, Unit.slice),
        Ingredient(Product.cebula, 40, Unit.g),
        Ingredient(Product.olej_rzepakowy, 1, Unit.spoonB),
      ],
      {
        Equipment.PATELNIA:1,
        Equipment.DREWNIANA_SZPATULKA:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1
      },
      [
        'Pokroić szynkę i cebulę w kostkę.',
        'W płaskim naczyniu podgrzać olej na ogniu.',
        'Podsmażyć pokrojoną cebulę do momentu aż się zaszkli.',
        'Dodać szynkę i smażyć przez ok. 2 min.',
        'Dodać jajka i smażyć przez 8 min. lub do momentu, kiedy będzie oczekiwana konsystencja.',
        'Zdjąć gotową jajecznicę z ognia.'
      ],
      fire: true
  );

  static Meal kaszki_dzieciece = Meal.create("Kaszki dziecięce",
      [
        const Ingredient(Product.kaszka_dziecieca, 100, Unit.g),
        const Ingredient(Product.czekolada_gorzka, 20, Unit.g),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
      },
      [
        'Zagotować wodę (tyle ile jest napisane na opakowaniu kaszki).',
        'Zdjąć wodę z ognia.',
        'Do gorącej wody powoli wsypywać kaszkę stale mieszając.',
        'Mieszać dopóki kaszka nie będzie miała jednolitej konsystencji.',
        'Dla smaku można dodać 2 kawałki czekolady na osobę.',
      ],
      tags: [TAG_JEDNOGARNKOWE],
      water: true,
      fire: true);

  static Meal kaszotto_z_kurczakiem_i_warzywami = Meal.create("Kaszotto z kurczakiem i warzywami",
      [
        const Ingredient(Product.piersi_z_kurczaka, 500, Unit.g),
        const Ingredient(Product.oliwa_z_oliwek, 2, Unit.spoonB),
        const Ingredient(Product.cebula, 1, Unit.item),
        const Ingredient(Product.czosnek, 3, Unit.clove),
        const Ingredient(Product.por, 1, Unit.item),
        const Ingredient(Product.marchew, 1, Unit.item),
        const Ingredient(Product.papryka_czerwona, .5, Unit.item),
        const Ingredient(Product.pieczarka, 200, Unit.g),
        const Ingredient(Product.kasza_gryczana, 200, Unit.g),
        const Ingredient(Product.szpinak, 50, Unit.g),
        const Ingredient(Product.sol, 1, Unit.spoonS),
        const Ingredient(Product.pieprz, 1, Unit.spoonS),
        const Ingredient(Product.oregano, 1, Unit.spoonS),
        const Ingredient(Product.passata, 1, Unit.spoonB),
        const Ingredient(Product.curry, 1, Unit.spoonB),
      ],
      {
        Equipment.PATELNIA:1,
        Equipment.DREWNIANA_SZPATULKA:1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.NOZ:1,
      },
      [
        'Cebulę i czosnek drobno posiekać, kurczaka pokroić w kostkę.',
        'Wszystko podsmażyć na dużej patelni, przyprawić curry.',
        'Dodać posiekanego pora, marchew, paprykę oraz rozdrobniony szpinak, doprawić solą i pieprzem.',
        'Smażyć przez ok. 2 minuty mieszając. Przykryć i smażyć na małym ogniu do momentu zmięknięcia warzyw.',
        'Na patelnię wsypać suchą kaszę gryczaną, wymieszać i smażyć przez ok. 2 minuty',
        'Wlać wodę, dusić przez 10-15 minut aż kasza spęcznieje.',
        'Dodać przecier, oregano ewentualnie sól i pieprz.',
      ],
      tags: [TAG_JEDNOGARNKOWE],
      water: true,
      fire: true
  );

  static Meal knedle_ze_sliwkami = Meal.create("Knedle ze śliwkami",
      [
        const Ingredient(Product.ziemniaki, 330, Unit.g),

        const Ingredient(Product.maka_przenna, 120, Unit.g),
        const Ingredient(Product.maka_ziemniaczana, 30, Unit.g),
        const Ingredient(Product.jajko, 1, Unit.item),
        const Ingredient(Product.sol, 0.1, Unit.spoonS),
        const Ingredient(Product.sliwka, 180, Unit.g),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1,
      },
      [
        'Ugotować ziemniaki, następnie zmielić.',
        'Do ziemniaków dodać jajka i mąkę przenną i dokładnie wymieszać.',
        'Mąkę ziemniaczaną dosywać małymi partiami - dopóki ciasto nie będzie odchodzić od ręki.',
        'Śliwki przekroić na pół i pozbawić pestki.',
        'Ciasto zwinąć w rulon i pokroić na kawałki.',
        'Kawałki ciasta rozpłaszczyć i zawinąć w nie śliwki.',
        'Gotować we wrzątku.',
      ],
      tags: [TAG_JARSKIE],
      water: true,
      fire: true
  );

  static Meal kotlety_sojowe_z_ryzem = Meal.create("Kotlety sojowe z ryżem",
      [
        const Ingredient(Product.bulion, 1, Unit.item),
        const Ingredient(Product.soja, 90, Unit.g),
        const Ingredient(Product.sol, 1, Unit.spoonS),
        const Ingredient(Product.olej_rzepakowy, 2, Unit.spoonB),
        const Ingredient(Product.ryz_bialy, 80, Unit.g),
      ],
      {
        Equipment.PATELNIA:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
        Equipment.MENAZKA:1,
      },
      [
        'Rozpuścić bulion w 100 ml ciepłej wody i nasączyć w nim kotlety (opcjonalne).',
        'Rozgrzać olej na patelni.',
        'Na rozgrzanym oleju ułożyć soję (po 30 g).',
        'Po 4 min obrócić kotlety.',
        'Po 4 min przełożyć kotlety z patelni do naczynia w rozłożonym ręcznikiem papierowym (żeby odsączał olej).',
        'W garnku zagotować wodę i lekko ją posolić (1 mała łyżeczka).',
        'Do gotującej się wody włożyć ryż.',
        'Gotować przez ok. 10 min. i wyjąć gotowy ryż.',
      ],
      tags: [TAG_JARSKIE],
      water: true,
      fire: true
  );

  static Meal kurczak_z_ryzem_w_sosie = Meal.create("Kurczak z ryżem w sosie",
      [
        const Ingredient(Product.piersi_z_kurczaka, 200, Unit.g),
        const Ingredient(Product.ryz_bialy, 100, Unit.g),
        const Ingredient(Product.papryka_czerwona, 1, Unit.item),
        const Ingredient(Product.marchew, 2, Unit.item),
        const Ingredient(Product.ananas, 200, Unit.g),
        const Ingredient(Product.olej_rzepakowy, 10, Unit.ml),
        const Ingredient(Product.maka_ziemniaczana, 80, Unit.g),

        const Ingredient(Product.ketchup, 4, Unit.spoonB),
        const Ingredient(Product.miod, 2, Unit.spoonB),
        const Ingredient(Product.ocet, 6, Unit.spoonB),

        const Ingredient(Product.sol, 0.1, Unit.spoonS),
        const Ingredient(Product.pieprz, 0.1, Unit.spoonS),
      ],
      {
        Equipment.PATELNIA:1,
        Equipment.GARNEK:1,
        Equipment.MENAZKA:1,
        Equipment.DREWNIANA_SZPATULKA:1,
        Equipment.NOZ:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
        Equipment.DESKA_DO_KROJENIA:1,
      },
      [
        'Ugotować ryż.',
        'Na patelni rozgrzać olej, następnie dodać pokrojoną w cienkie słupki marchewkę i paprykę pokrojoną w średniej wielkości kostkę.',
        'Warzywa dusić do miękkości. Kurczaka pokroić w kostkę, przełożyć do miski, przyprawić solą i pieprzem i dodać mąkę ziemniaczaną – całość dokładnie wymieszać.',
        'Tak przygotowanego kurczaka dodać na patelnię i podsmażać, aż mięso się zetnie.',
        'W międzyczasie przygotować sos: 4 łyżki ketchupu, 2 łyżki miodu, 6 łyżek octu ryżowego.',
        'Na patelnię dodać pokrojonego ananasa oraz wcześniej przygotowany sos.',
        'Wymieszać dokładnie i przyprawić solą i pieprzem.',
        'Podać z ugotowanym ryżem.'
      ],
      water: true,
      fire: true
  );

  static Meal leczo = Meal.create("Leczo",
      [
        const Ingredient(Product.kielbasa_parowkowa, 60, Unit.g),
        const Ingredient(Product.kielbasa_podwawelska, 60, Unit.g),
        const Ingredient(Product.papryka_czerwona, 0.5, Unit.item),
        const Ingredient(Product.cebula, 0.25, Unit.item),
        const Ingredient(Product.cukinia, 50, Unit.g),
        const Ingredient(Product.kukurydza_puszka, 60, Unit.g),
        const Ingredient(Product.pomidor, 80, Unit.g),
        const Ingredient(Product.czosnek, 1, Unit.clove),
        const Ingredient(Product.oliwa_z_oliwek, 20, Unit.ml),
        const Ingredient(Product.sol, 0.1, Unit.spoonS),
        const Ingredient(Product.pieprz, 0.05, Unit.spoonS),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
      },
      [
        'Pokroić mięso i warzywa w kostkę (cukinię trzeba najpierw wydrążyć).',
        'Rozgrzać oliwę w garnku i dorzucić mięso.',
        'Smażyć mięso przez 5 min regularnie mieszając.',
        'Dorzucić cebulę, czosnek i dodać paprykę w proszku (ostrą i słodką).',
        'Dodać wszystkie warzywa, dokładnie wymieszać i dusić przez 30 min.',
        'Doprawić solą i pieprzem.',
      ],
      tags: [TAG_JEDNOGARNKOWE],
      water: false,
      fire: true
  );

  static Meal lazanki = Meal.create("Łazanki",
      [
        const Ingredient(Product.kielbasa, 900, Unit.g),
        const Ingredient(Product.kapusta_kiszona, 900, Unit.g),
        const Ingredient(Product.cebula, 1, Unit.item),
        const Ingredient(Product.oliwa_z_oliwek, 2, Unit.spoonB),
        const Ingredient(Product.makaron_lazanki, 500, Unit.g),
        const Ingredient(Product.lisc_laurowy, 4, Unit.item),
        const Ingredient(Product.ziele_angielskie, 5, Unit.g),
        const Ingredient(Product.sol, 0.5, Unit.g),
        const Ingredient(Product.pieprz, 0.5, Unit.g),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
        Equipment.PATELNIA:1,
      },
      [
        'Kapustę włożyć do garnka, zalać wodą, zagotować.',
        'Dodać ziele angielskie, liść laurowy, sól.',
        'Gotować 60 minut.',
        'Odcedzić ugotowaną kapustę i drobno pokroić.',
        'Makaron łazanki ugotować z dodatkiem oliwy, odcedzić.',
        'Kiełbasę i cebulę pokroić w kostkę, podsmażyć na patelni.',
        'Dodać do makaronu kapustę, kiełbasę i cebulę. Zamieszać i podsmażyć',
      ],
      tags: [],
      water: true,
      fire: true
  );

  static Meal makaron_z_pesto = Meal.create(
      "Makaron z pesto",
      [
        const Ingredient(Product.makaron, 100, Unit.g),
        const Ingredient(Product.ser_zolty, 20, Unit.g),
        const Ingredient(Product.pomidor, 60, Unit.g),
        const Ingredient(Product.bazylia, 2, Unit.g),
        const Ingredient(Product.czosnek, 0.5, Unit.clove),
        const Ingredient(Product.oliwa_z_oliwek, 1, Unit.spoonS),
        const Ingredient(Product.sol, 0.1, Unit.spoonS),
        const Ingredient(Product.pieprz, 0.05, Unit.spoonS),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.MENAZKA:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
      },
      [
        'Ugotować makaron lekko soląc i dodając łyżkę oleju.',
        'Utrzeć ser.',
        'Posiekać pomidory, czosnek i bazylię na jak najdrobniejsze kawałki.',
        'Wrzucić wszystkie składniki do jednego naczynia i dokładnie wymieszać.',
        'Wymieszać makaron z pesto i posypujemy serem.',
      ],
      tags: [TAG_JARSKIE, TAG_JEDNOGARNKOWE],
      water: true,
      fire: true);

  static Meal makaron_ze_szpinakiem_kurczakiem_feta = Meal.create(
      "Makaron ze szpinakiem, kurczakiem i fetą",
      [
        const Ingredient(Product.piersi_z_kurczaka, 400, Unit.g),
        const Ingredient(Product.szpinak, 200, Unit.g),
        const Ingredient(Product.ser_feta, 200, Unit.g),
        const Ingredient(Product.makaron_swiderki, 250, Unit.g),
        const Ingredient(Product.czosnek, 1, Unit.clove),
        const Ingredient(Product.slodka_papryka, 1, Unit.spoonB),
        const Ingredient(Product.sol, 1, Unit.spoonS),
        const Ingredient(Product.pieprz, 0.5, Unit.spoonS),
        const Ingredient(Product.olej_rzepakowy, 2, Unit.spoonB),
      ],
      {
        Equipment.MENAZKA:1,
        Equipment.LYZKA_DO_MIESZANIA:1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.NOZ:1,
        Equipment.GARNEK:1,
        Equipment.PATELNIA:1,
      },
      [
        'Szpinak zagrzać w menażce z wodą, dodać do rozgnieciony ząbek czosnku, sól i pieprz. Dusić do odparowania.',
        'Piersi z kurczaka pokrić w większą kostkę, doprawić solą i papryką. Usmażyć na oleju do zrumienienia.',
        'Ser feta pokroić w kostkę.',
        'Makaron ugotować w osolonej wodzie i odcedzić.',
        'Do makaronu dodać szpinak, mięso i fetę. Mieszać i gotować jeszcze kilka minut.'
      ],
      water: true,
      fire: true
  );

  static Meal nalesniki = Meal.create("Naleśniki",
      [
        const Ingredient(Product.maka_przenna, 100, Unit.g),
        const Ingredient(Product.jajko, 0.5, Unit.item),
        const Ingredient(Product.mleko_spozywcze_2_0_pro, 100, Unit.ml),
        //add(new Ingredient(dzem, 400, UNIT_G),
        const Ingredient(Product.olej_rzepakowy, 1, Unit.spoonB),
        const Ingredient(Product.sol, 0.1, Unit.spoonS)
      ],
      {
        Equipment.PATELNIA:1,
        Equipment.LYZKA_DO_MIESZANIA:1
      },
      [
        'Mleko wymieszać z taką samą ilością wody.',
        'Jajka roztrzepać i dodać razem z mąką do mieszanki.',
        'Całość dokładnie wymieszać i lekko posolić.',
        'Rozgrzać olej na patelni.',
        'Turowo rozlewać część ciasta po patelni.',
        'Na każdą turę rozlane ciasto po 3 min. odwrócić, a po kolejnych 3 min. zdjąć z patelni.',
        'Posmarować gotowe naleśniki dżemem i zwinąć w ruloniki.'
      ],
      tags: [TAG_JARSKIE],
      fire: true,
      water: true);

  static Meal owsianka_z_bakaliami = Meal.create("Owsianka z bakaliami",
      [
        const Ingredient(Product.platki_owsiane, 100, Unit.g),
        const Ingredient(Product.banan, 4, Unit.g),
        const Ingredient(Product.rodzynki, 12, Unit.g),
        const Ingredient(Product.orzechy_laskowe, 8, Unit.g),
        const Ingredient(Product.orzechy_wloskie, 8, Unit.g),
        const Ingredient(Product.orzechy_nerkowca, 8, Unit.g),
      ],
      {
        Equipment.MENAZKA:1,
      },
      [
        'Do gorącej wody dodać owsiankę.',
        'Gotować jeszcze przez 2 min.',
        'Zdjąć owsiankę z ognia.',
        'Odsączyć wodę.',
        'Dodać bakalie.',
      ],
      tags: [TAG_JARSKIE, TAG_JEDNOGARNKOWE],
      water: true,
      fire: true);

  static Meal placki_ziemniaczane = Meal.create(
      "Placki ziemniaczane",
      [
        const Ingredient(Product.ziemniaki, 500, Unit.g),
        const Ingredient(Product.maka_przenna, .5, Unit.spoonB),
        const Ingredient(Product.cebula, .5, Unit.item),
        const Ingredient(Product.jajko, 1, Unit.item),
        const Ingredient(Product.sol, .5, Unit.spoonS),
        const Ingredient(Product.olej_rzepakowy, 1, Unit.spoonB),
      ],
      {
        Equipment.NOZ:1,
        Equipment.TARKA:1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.LYZKA_DO_MIESZANIA:1
      },
      [
        'Ziemniaki obrać i zetrzeć na tarce o małych oczkach do większej miski.',
        'Zostawić misce bez mieszania, miskę delikatnie przechylić i odstawić tak na ok. 5 minut.',
        'W międzyczasie odlewać zbierający się sok. Na koniec docisnąć dłonią do miski i odlać pozostały sok.',
        'Dodać mąkę, drobno startą cebulę, jajko oraz dwie szczypty soli. Wymieszać.'
        'Rozgrzać patelnię, wlać olej. Nakładać porcje masy (1 łyżka) na rozgrzany olej i rozprowadzać ją na dość cienki placek. Smażyć na średnim ogniu przez ok. 2 - 3 minuty na złoty kolor, przewrócić na drugą stronę i powtórzyć smażenie.',
      ],
      fire: true,
      water: true
  );

  static Meal puree_z_warzywami = Meal.create(
      "Puree z warzywami",
      [
        const Ingredient(Product.ziemniaki, 400, Unit.g),
        const Ingredient(Product.maslo_ekstra, 15, Unit.g),
        const Ingredient(Product.mleko_spozywcze_2_0_pro, 30, Unit.ml),
        const Ingredient(Product.groszek_zielony, 50, Unit.g),
        const Ingredient(Product.marchew, 50, Unit.g),
        const Ingredient(Product.kukurydza_puszka, 50, Unit.g),
        const Ingredient(Product.sol, 0.1, Unit.spoonS)
      ],
      {
        Equipment.GARNEK:1,
        Equipment.TLUCZEK:1,
        Equipment.NOZ:1,
        Equipment.MENAZKA:1,
        Equipment.LYZKA_DO_MIESZANIA:1
      },
      [
        'Obrać i umyć ziemniaki.',
        'Ugotować ziemniaki w osolonej wodzie.'
            'Po ugotowaniu odsączyć wodę i dodać masło.',
        'Tłuczkiem dokładnie ubić do wymieszania się składników.',
        'Pokroić marchewkę w kostkę.',
        'W małym garnku z wodą gotować marchewkę do miękkości.',
        'Dodać groszek z puszki i gotować jeszcze przez około 2 min.',
        'Zdjąć garnek z ognia i dodać kukurydzę.'
      ],
      fire: true,
      water: true);

  static Meal racuchy_z_jablkami = Meal.create("Racuchy z jabłkami",
    [
      const Ingredient(Product.drozdze, 20, Unit.g),
      const Ingredient(Product.cukier, 30, Unit.g),
      const Ingredient(Product.mleko_spozywcze_2_0_pro, 150, Unit.ml),
      const Ingredient(Product.maka_przenna, 150, Unit.g),
      const Ingredient(Product.cynamon, 0.5, Unit.spoonS),
      // const Ingredient(Product.sol, 1, Unit.g),
      // const Ingredient(Product.jajko, 2, Unit.item),
      // const Ingredient(Product.jablko, 2, Unit.item),
      const Ingredient(Product.olej_rzepakowy, 6, Unit.spoonB),
      const Ingredient(Product.cukier_puder, 6, Unit.spoonS),
    ],
    {
      Equipment.PATELNIA: 1,
      Equipment.DREWNIANA_SZPATULKA: 1,
      Equipment.DESKA_DO_KROJENIA: 1,
      Equipment.GARNEK: 1,
      Equipment.MENAZKA: 1,
      Equipment.NOZ: 1
    },
    [
      'Podgrzać mleko w garnku.',
      'W menażce utrzeć drożdże z łyżką cukru do momentu rozpuszczenia.',
      'Upłynnione drożdże z cukrem dodać do ciepłego mleka.',
      'Dodać mąkę, resztę cukru, cynamon, szczyptę soli oraz jajka.',
      'Wszystko dokładnie wymieszać i odstawić w ciepłe miejsce na ok. 20 minut.',
      'Umyć, obierać i pokroić jabłka w cienkie półplastry.',
      'Gdy ciasto wyrośnie, dodać pokrojone jabłka, dokładnie wymieszać i ponownie odstawić w ciepłe miejsce na ok. 10 minut.',
      'Na rozgrzaną patelnię wlać kilka łyżek oleju, rozgrzać i smażyć racuchy z obu stron.',
      'Racuchy podać opruszone cukrem pudrem.'
    ],
    tags: [TAG_JARSKIE],
    water: false,
    fire: true,
  );

  static Meal risotto = Meal.create("Risotto",
      [
        const Ingredient(Product.ryz_bialy, 80, Unit.g),
        const Ingredient(Product.mielonka, 60, Unit.g),
        const Ingredient(Product.marchew, 30, Unit.g),
        const Ingredient(Product.pietruszka_korzen, 30, Unit.g),
        const Ingredient(Product.cukinia, 30, Unit.g),
        const Ingredient(Product.por, 30, Unit.g),
        const Ingredient(Product.kukurydza_puszka, 60, Unit.g),
        const Ingredient(Product.koncentrat_pomidorowy, 40, Unit.ml),
        const Ingredient(Product.cebula, 0.25, Unit.item),
        const Ingredient(Product.czosnek, 1, Unit.clove),
        const Ingredient(Product.sol, 0.1, Unit.spoonS),
        const Ingredient(Product.pieprz, 0.05, Unit.spoonS),
        const Ingredient(Product.bazylia, 2, Unit.g),
        const Ingredient(Product.olej_rzepakowy, 1, Unit.spoonB),
      ],
      {
        Equipment.GARNEK:2,
        Equipment.DREWNIANA_SZPATULKA:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1,
      },
      [
        'Ugotować ryż (posolić lekko).',
        'Pokroić cebulę w kostkę i wycisnąć kostkę.',
        'Przyprawić mięso pieprzem i solą i smażyć na małym oleju (można to pominąć, żeby danie było wegetariańskie).',
        'Dodać cebulę i czosnek.',
        'Pokroić wszystkie warzywa.',
        'W osolonej wodzie gotować warzywa przez ok. 5 min. (wyzwaniowcy mogą to zrobić w wodzie po ryżu).',
        'Po 5 min smażenia mięsa dodać przecier pomidorowy.',
        'Po 2 min dodać kukurydzę.',
        'Dodać ryż i dusić przez 5 do 10 min.',
      ],
      tags: [/*TAG_WEGE*/],
      water: true,
      fire: true);

  static Meal spaghetti_bolognese = Meal.create(
      "Spaghetti bolognese (na wypasie)",
      [
        const Ingredient(Product.makaron, 100, Unit.g),
        const Ingredient(Product.passata, 100, Unit.ml),
        const Ingredient(Product.mieso_mielone_wieprzowe, 100, Unit.g),
        const Ingredient(Product.parmezan, 10, Unit.g),
        const Ingredient(Product.koncentrat_pomidorowy, 1, Unit.spoonB),
        const Ingredient(Product.czosnek, 1, Unit.clove),
        const Ingredient(Product.tymianek, 0.2, Unit.spoonS),
        const Ingredient(Product.oregano, 0.2, Unit.spoonS),
        const Ingredient(Product.oliwa_z_oliwek, 10, Unit.ml),
        const Ingredient(Product.bazylia, 10, Unit.g),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.PATELNIA:1,
        Equipment.DREWNIANA_SZPATULKA:1,
        Equipment.TARKA:1,
      },
      [
        'Do garnka wlać wodę na makaron i zagotować, następnie dodać makaron i ugotować.',
        'Równocześnie na patelni rozgrzać 2 łyżki oliwy z oliwek.',
        'Na rozgrzaną patelnię wrzucić czosnek i cebulę.',
        'Po kilku minutach dodać na patelnię mięso. Rozdrabniać szpatułką, aby nie powstały grube mięsne grudki.',
        'Do mięsa dodać zioła oraz koncentrat. Całość chwilę podgrzewać.',
        'Dodać passatę, gotować na małym ogniu około 30 minut.'
      ],
      water: true,
      fire: true);

  static Meal spaghetti_carbonara = Meal.create(
      "Spaghetti carbonara",
      [
        const Ingredient(Product.makaron, 100, Unit.g),
        const Ingredient(Product.boczek_wedzony, 60, Unit.g),
        const Ingredient(Product.czosnek, 1, Unit.clove),
        const Ingredient(Product.jajko, 1, Unit.item),
        const Ingredient(Product.natka_pietruszki, 5, Unit.g),
        const Ingredient(Product.ser_zolty, 20, Unit.g),
        const Ingredient(Product.sol, 0.1, Unit.spoonS),
        const Ingredient(Product.pieprz, 0.05, Unit.spoonS),
      ],
      {
        Equipment.GARNEK:1,
        Equipment.MENAZKA:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1,
        Equipment.TARKA:1,
      },
      [
        'Wbić jajka do miski i roztrzepać oraz utrzeć parmezan.',
        'Ugotować makaron lekko soląc i dodając łyżkę oleju.',
        'Boczek pokroić drobno w kostkę.',
        'W rozgrzanym garnku podsmażyć boczek.',
        'Po 3 do 5 min dodać makaron i ok. 50 ml wody po makaronie.',
        'Całość wymieszać.',
        'Dodać połowę sera i polać całość wcześniej przygotowanymi jajkami.',
        'Po 2 min doprawić solą oraz pieprzem i posypać resztą sera.',
      ],
      water: true,
      fire: true);

  static Meal tosty_francuskie = Meal.create(
      "Tosty francuskie",
      const [
        Ingredient(Product.chleb_wiejski, 4, Unit.breadSlice),
        Ingredient(Product.jajko, 1, Unit.item),
        Ingredient(Product.ser_zolty, 2, Unit.slice),
        Ingredient(Product.szynka_wedzona, 2, Unit.slice),
        Ingredient(Product.olej_rzepakowy, 2, Unit.spoonB),
      ],
      {
        Equipment.PATELNIA:1,
        Equipment.RECZNIK_PAPIEROWY:1,
        Equipment.NOZ:1,
        Equipment.DESKA_DO_KROJENIA:1,
      },
      [
        'Przygotować kanapki (2 kromki z szynką i serem pomiędzy nimi).',
        'W małym naczyniu rozbić jajko i wymieszać białko z żółtkiem.',
        'Obtoczyć kanapki w jajku. Na patelni rozgrzać olej.',
        'Na rozgrzany olej położyć tosty.',
        'Po 3 min. odwrócić tosty.',
        'Po 3 min. zdjąć tosty z patelni do naczynia z wyłożonym ręcznikiem papierowym.',
      ],
      water: false,
      fire: true);

  static Meal twarog_ze_smietana = Meal.create(
      "Twaróg ze śmietaną",
      const [
        Ingredient(Product.ser_twarogowy_chudy, 100, Unit.g),
        Ingredient(Product.smietana, 1, Unit.spoonB),
        Ingredient(Product.cukier, 2, Unit.spoonS)
      ],
      {
        Equipment.MENAZKA:1,
        Equipment.LYZKA_DO_MIESZANIA:1
      },
      [
        'Do głębokiego naczynia wrzucić twaróg.',
        'Dodać śmietanę i cukier.',
        'Całość mieszać do uzyskania jednakowej konsystencji.'
      ],
      tags: [Meal.TAG_JARSKIE, Meal.TAG_JEDNOGARNKOWE],
  );

  static List<Meal> all = [
    bigos_cyganski,
    buraki_na_ostro,
    burito,
    chili_con_carne,
    chlopski_garnek,
    grochowka_wojskowa,
    gulasz_wieprzowy,
    jajecznica,
    kaszki_dzieciece,
    kaszotto_z_kurczakiem_i_warzywami,
    knedle_ze_sliwkami,
    kotlety_sojowe_z_ryzem,
    kurczak_z_ryzem_w_sosie,
    leczo,
    lazanki,
    makaron_z_pesto,
    makaron_ze_szpinakiem_kurczakiem_feta,
    nalesniki,
    owsianka_z_bakaliami,
    placki_ziemniaczane,
    puree_z_warzywami,
    racuchy_z_jablkami,
    risotto,
    spaghetti_bolognese,
    spaghetti_carbonara,
    tosty_francuskie,
    twarog_ze_smietana,
  ];

  final String name;

  final List<Ingredient> ingredients;
  final Map<Equipment, int> equipment;

  final List<String> prepSteps;

  final List<String> tags;

  final bool fire;
  final bool water;

  final double kcal100, proteins100, carbohyd100, fat100;
  final List<String> vitamins;
  final List<Subst> other;

  final double totalMass;

  const Meal(this.name, this.ingredients, this.equipment, this.prepSteps, this.tags, this.fire, this.water,
      this.kcal100, this.proteins100, this.carbohyd100, this.fat100, this.vitamins, this.other, this.totalMass);

  static Meal create(String name, List<Ingredient> ingredients, Map<Equipment, int> equipment, List<String> prepSteps, {List<String> tags = const [], bool fire = false, bool water = false}){

    double kcal100 = 0, proteins100 = 0, carbohyd100 = 0, fat100 = 0;
    List<String> vitamines = [];
    List<Subst> other = [];

    double totalMass = 0;

    for(Ingredient ingredient in ingredients){
      kcal100 += ingredient.product.kcal100 * ingredient.getAmountInUnit(Unit.g);
      proteins100 += ingredient.product.proteins100 * ingredient.getAmountInUnit(Unit.g);
      carbohyd100 += ingredient.product.carbohyd100 * ingredient.getAmountInUnit(Unit.g);
      fat100 += ingredient.product.fat100 * ingredient.getAmountInUnit(Unit.g);

      for(String vit in ingredient.product.vitamins)
        if(!vitamines.contains(vit)) vitamines.add(vit);

      for(Subst s in ingredient.product.other)
        if(!other.contains(s)) other.add(s);

      totalMass += ingredient.getAmountInUnit(Unit.g);
    }

    kcal100 /= (totalMass);
    proteins100 /= (totalMass);
    carbohyd100 /= (totalMass);
    fat100 /= (totalMass);

    return Meal(name, ingredients, equipment, prepSteps, tags, fire, water,
        kcal100, proteins100, carbohyd100, fat100, vitamines, other, totalMass);
  }
}
