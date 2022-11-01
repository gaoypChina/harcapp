import 'equipment.dart';
import 'ingredient.dart';
import 'product.dart';

class Meal{

  static const String TAG_JARSKIE = "#Jarskie";
  static const String TAG_JEDNOGARNKOWE = "#Jednogarnkowe";

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

  static Meal owsianka_z_bakaliami = Meal.create("Owsianka z bakaliami",
      [
        Ingredient(Product.platki_owsiane, 100, Unit.g),
        Ingredient(Product.banan, 4, Unit.g),
        Ingredient(Product.rodzynki, 12, Unit.g),
        Ingredient(Product.orzechy_laskowe, 8, Unit.g),
        Ingredient(Product.orzechy_wloskie, 8, Unit.g),
        Ingredient(Product.orzechy_nerkowca, 8, Unit.g),
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

  static Meal chili_con_carne = Meal.create("Chili con carne",
      [
        Ingredient(Product.piersi_z_kurczaka, 60, Unit.g),
        Ingredient(Product.majeranek, 3, Unit.g),
        Ingredient(Product.sos_slodko_kwasny, 100, Unit.ml),
        Ingredient(Product.papryka_czerwona, 30, Unit.g),
        Ingredient(Product.pomidor, 40, Unit.g),
        Ingredient(Product.cukinia, 30, Unit.g),
        Ingredient(Product.kukurydza_puszka, 25, Unit.g),
        Ingredient(Product.groszek_zielony, 25, Unit.g),
        Ingredient(Product.cebula, 0.25, Unit.item),
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
      fire: true);

  static Meal kotlety_sojowe_z_ryzem = Meal.create("Kotlety sojowe z ryżem",
      [
        Ingredient(Product.bulion, 1, Unit.item),
        Ingredient(Product.soja, 90, Unit.g),
        Ingredient(Product.sol, 1, Unit.spoonS),
        Ingredient(Product.olej_rzepakowy, 2, Unit.spoonB),
        Ingredient(Product.ryz_bialy, 80, Unit.g),
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
      fire: true);

  static Meal leczo = Meal.create("Leczo",
      [
        Ingredient(Product.kielbasa_parowkowa, 60, Unit.g),
        Ingredient(Product.kielbasa_podwawelska, 60, Unit.g),
        Ingredient(Product.papryka_czerwona, 0.5, Unit.item),
        Ingredient(Product.cebula, 0.25, Unit.item),
        Ingredient(Product.cukinia, 50, Unit.g),
        Ingredient(Product.kukurydza_puszka, 60, Unit.g),
        Ingredient(Product.pomidor, 80, Unit.g),
        Ingredient(Product.czosnek, 1, Unit.clove),
        Ingredient(Product.oliwa_z_oliwek, 20, Unit.ml),
        Ingredient(Product.sol, 0.1, Unit.spoonS),
        Ingredient(Product.pieprz, 0.05, Unit.spoonS),
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
      fire: true);

  static Meal risotto = Meal.create("Risotto",
      [
        Ingredient(Product.ryz_bialy, 80, Unit.g),
        Ingredient(Product.mielonka, 60, Unit.g),
        Ingredient(Product.marchew, 30, Unit.g),
        Ingredient(Product.pietruszka_korzen, 30, Unit.g),
        Ingredient(Product.cukinia, 30, Unit.g),
        Ingredient(Product.por, 30, Unit.g),
        Ingredient(Product.kukurydza_puszka, 60, Unit.g),
        Ingredient(Product.koncentrat_pomidorowy, 40, Unit.ml),
        Ingredient(Product.cebula, 0.25, Unit.item),
        Ingredient(Product.czosnek, 1, Unit.clove),
        Ingredient(Product.sol, 0.1, Unit.spoonS),
        Ingredient(Product.pieprz, 0.05, Unit.spoonS),
        Ingredient(Product.bazylia, 2, Unit.g),
        Ingredient(Product.olej_rzepakowy, 1, Unit.spoonB),
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

  static Meal carbonara = Meal.create(
      "Carbonara",
      [
        Ingredient(Product.makaron, 100, Unit.g),
        Ingredient(Product.boczek_wedzony, 60, Unit.g),
        Ingredient(Product.czosnek, 1, Unit.clove),
        Ingredient(Product.jajko, 1, Unit.item),
        Ingredient(Product.natka_pietruszki, 5, Unit.g),
        Ingredient(Product.ser_zolty, 20, Unit.g),
        Ingredient(Product.sol, 0.1, Unit.spoonS),
        Ingredient(Product.pieprz, 0.05, Unit.spoonS),
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

  static Meal makaron_z_pesto = Meal.create(
      "Makaron z pesto",
      [
        Ingredient(Product.makaron, 100, Unit.g),
        Ingredient(Product.ser_zolty, 20, Unit.g),
        Ingredient(Product.pomidor, 60, Unit.g),
        Ingredient(Product.bazylia, 2, Unit.g),
        Ingredient(Product.czosnek, 0.5, Unit.clove),
        Ingredient(Product.oliwa_z_oliwek, 1, Unit.spoonS),
        Ingredient(Product.sol, 0.1, Unit.spoonS),
        Ingredient(Product.pieprz, 0.05, Unit.spoonS),
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

  static Meal kaszki_dzieciece = Meal.create("Kaszki dziecięce",
      [
        Ingredient(Product.kaszka_dziecieca, 100, Unit.g),
        Ingredient(Product.czekolada_gorzka, 20, Unit.g),
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

  static Meal nalesniki = Meal.create("Naleśniki",
  [
    Ingredient(Product.maka_przenna, 100, Unit.g),
    Ingredient(Product.jajko, 0.5, Unit.item),
    Ingredient(Product.mleko_spozywcze_2_0_pro, 100, Unit.ml),
    //add(new Ingredient(dzem, 400, UNIT_G),
    Ingredient(Product.olej_rzepakowy, 1, Unit.spoonB),
    Ingredient(Product.sol, 0.1, Unit.spoonS)
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

  static Meal puree_z_warzywami = Meal.create(
      "Puree z warzywami",
  [
    Ingredient(Product.ziemniaki, 400, Unit.g),
    Ingredient(Product.maslo_ekstra, 15, Unit.g),
    Ingredient(Product.mleko_spozywcze_2_0_pro, 30, Unit.ml),
    Ingredient(Product.groszek_zielony, 50, Unit.g),
    Ingredient(Product.marchew, 50, Unit.g),
    Ingredient(Product.kukurydza_puszka, 50, Unit.g),
    Ingredient(Product.sol, 0.1, Unit.spoonS)
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

  static Meal buraki_na_ostro = Meal.create(
      "Buraki na ostro",
      [
        Ingredient(Product.burak, 500, Unit.g),
        Ingredient(Product.chrzan, 120, Unit.g),
        Ingredient(Product.czosnek, 6, Unit.clove),
        Ingredient(Product.smietana, 300, Unit.g),
        Ingredient(Product.sol, 0.1, Unit.spoonS)
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
        'Doprawić solą',
      ],
      tags: [TAG_JARSKIE],
      fire: true,
      water: false);

  static List<Meal> all = [
    jajecznica,
    twarog_ze_smietana,
    tosty_francuskie,
    owsianka_z_bakaliami,
    chili_con_carne,
    kotlety_sojowe_z_ryzem,
    leczo,
    risotto,
    carbonara,
    makaron_z_pesto,
    kaszki_dzieciece,
    nalesniki,
    puree_z_warzywami,
    buraki_na_ostro
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

  static Meal create(String name, List<Ingredient> ingredients, Map<Equipment, int> equipment, List<String> prepSteps, {List<String> tags: const [], bool fire: false, bool water: false}){

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
