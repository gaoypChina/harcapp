

class Subst{

  static const Subst P = Subst("P", "Fosfor");
  static const Subst K = Subst("K", "Potas");
  static const Subst Mn = Subst("Mn", "Mangan");
  static const Subst Li_ = Subst("[Li]", "Likopen");
  static const Subst Mg = Subst("Mg", "Magnez");
  static const Subst Bl_ = Subst("[Bł]", "Błonnik");
  static const Subst Fe = Subst("Fe", "Żelazo");
  static const Subst Ca = Subst("Ca", "Wapń");
  static const Subst Re_ = Subst("[Re]", "Resweratrol");
  static const Subst Bk_ = Subst("[Bk]", "Beta-karoten");
  static const Subst S = Subst("S", "Siarka");
  static const Subst Se = Subst("Se", "Selen");
  static const Subst Ni_ = Subst("[Ni]", "Niacyny");
  static const Subst Pe_ = Subst("[Pe]", "Pektyny");
  static const Subst So_ = Subst("[So]", "Sorbitol");
  static const Subst Fl_ = Subst("[Fl]", "Flawonoidy");
  static const Subst Kf_ = Subst("[Kf]", "Kwas foliowy");
  static const Subst Cu = Subst("Cu", "Miedź");
  static const Subst Zn = Subst("Zn", "Cynk");
  static const Subst Na = Subst("Na", "Sód");

  final String abbr;
  final String name;
  const Subst(this.abbr, this.name);
}

class Product{

  static const Product agrest = Product('Agrest', 'kuch_gooseberry', 41, 0, 11.8, 0.2, ['A', 'C'], [Subst.P, Subst.K]);
  static const Product ananas = Product('Ananas', 'kuch_pineapple', 54, 0.4, 13.6, 0.2, ['B1'], [Subst.Mn]);
  static const Product arbuz = Product('Arbuz', 'kuch_watermelon', 36, 0.6, 0.8, 0.1, ['A', 'B1', 'B6'], [Subst.Li_]);
  static const Product baklazan = Product('Bakłażan', 'kuch_aubergine', 21, 1.1, 6.3, 0.1, ['E', 'K'], [Subst.K]);
  static const Product banan = Product('Banan', 'kuch_banana', 95, 1, 23.5, 0.3, ['B2', 'B3', 'B6', 'B9'], [Subst.K]);
  static const Product bazylia = Product('Bazylia', 'kuch_herb', 23, 1, 3.2, 0.6, ['A', 'B6', 'C', 'E', 'K'], [Subst.Mg, Subst.Fe, Subst.K, Subst.Ca, Subst.P, Subst.Na, Subst.Zn]);
  static const Product bob = Product('Bób', 'kuch_beans', 66, 7.1, 14, 0.4, ['B3', 'E', 'K'], [Subst.Fe]);
  static const Product boczek_wedzony = Product('Boczek wędzony', 'kuch_bacon', 477, 12.7, 0, 47.3, [], []);
  static const Product brukselka = Product('Brukselka', 'kuch_brussels_sprouts', 37, 4.7, 8.7, 0.5, ['B2', 'C', 'E', 'K'], [Subst.K]);
  static const Product bulion = Product('Bulion (kostka)', 'kuch_soup', 13, 1.2, 2, 0.1, ['B2', 'B3'], [Subst.P, Subst.Na], unitManager: UnitManager(defUnit: Unit.item, gInItem: 10));
  static const Product bulka_tarta = Product('Bułka tarta', 'kuch_bread_3', 347, 9.7, 77.6, 1.9, [], []);
  static const Product burak = Product('Burak', 'kuch_beet', 38, 1.8, 9.5, 0.1, ['B9', 'E', 'K'], [Subst.P, Subst.K, Subst.Mn]);
  static const Product cebula = Product('Cebula', 'kuch_onion', 30, 1.4, 6.9, 0.4, ['E', 'K'], [Subst.S], unitManager: UnitManager(defUnit: Unit.item, gInItem: 100));
  static const Product chleb_wiejski = Product('Chleb wiejski', 'kuch_bread', 239, 5.8, 55.1, 1.3, [], [], unitManager: UnitManager(defUnit: Unit.breadSlice, gInBreadSlice: 30));
  static const Product chleb_zytni_pelnoziarnisty = Product('Chleb żytni pełnoziarnisty', 'kuch_bread_2', 237, 6.7, 53.9, 1.8, ['B1', 'B3', 'B5', 'B12'], [], unitManager: UnitManager(defUnit: Unit.breadSlice, gInBreadSlice: 35));
  static const Product chrupki_kukurydziane = Product('Chrupki kukurydziane', 'kuch_corn_chips', 352, 8.9, 78.9, 3, [], []);
  static const Product chrzan = Product('Chrzan', 'kuch_horseradish', 67, 4.5, 18.1, 0.6, ['C'], [Subst.K, Subst.S]);
  static const Product coca_cola = Product('Coca Cola', 'kuch_can', 42, 0, 10.4, 0, [], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 1));
  static const Product cukier = Product('Cukier', 'kuch_sugar_cube', 405, 0, 99.8, 0, [], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 1.2, mlInSpoonS: UnitManager.ML_IN_SPOON_S, mlInSpoonB: UnitManager.ML_IN_SPOON_B));
  static const Product cukier_puder = Product('Cukier puder', 'kuch_icing_sugar', 405, 0, 99.8, 0, [], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 1.2, mlInSpoonS: UnitManager.ML_IN_SPOON_S, mlInSpoonB: UnitManager.ML_IN_SPOON_B));
  static const Product cukierki_krowki = Product('Cukierki krówki', 'kuch_candy', 421, 4.3, 76.1, 10.7, [], []);
  static const Product cukinia = Product('Cukinia', 'kuch_courgette', 15, 1.2, 3.2, 0.1, ['E', 'K'], []);
  static const Product cynamon = Product('Cynamon', 'kuch_cinnamon', 247, 0.8, 9.5, 0.3, ['K'], [Subst.Fe, Subst.Ca, Subst.Mg], unitManager: UnitManager(defUnit: Unit.g, gInMl: .2, mlInSpoonS: UnitManager.ML_IN_SPOON_S, mlInSpoonB: UnitManager.ML_IN_SPOON_B));
  static const Product cytryna = Product('Cytryna', 'kuch_lemon', 36, 0.8, 9.5, 0.3, ['C'], [], unitManager: UnitManager(defUnit: Unit.item, gInItem: 80));
  static const Product czekolada_biala = Product('Czekolada biała', 'kuch_chocolate_white', 530, 7.7, 51, 38.4, [], []);
  static const Product czekolada_gorzka = Product('Czekolada gorzka', 'kuch_chocolate_dark', 554, 6.7, 56.6, 34.3, [], []);
  static const Product czekolada_mleczna = Product('Czekolada mleczna', 'kuch_chocolate', 549, 9.8, 54.7, 32.8, [], []);
  static const Product czosnek = Product('Czosnek', 'kuch_garlic', 146, 6.4, 32.6, 0.5, ['B1', 'B2', 'B3', 'C'], [Subst.S, Subst.K], unitManager: UnitManager(defUnit: Unit.clove, gInClove: 5));
  static const Product drozdze = Product('Drożdże', 'kuch_yeast', 92, 11, 7, 2, [], [Subst.Bl_]);
  //public static final Product cwikla = Product('Ćwikła', 0, 0, 41f, 1.6f, 10.2f, 0.1f, ['B9', 'E', 'K'}, [Subst.P, K, Mn]});
  static const Product daktyle_suszone = Product('Daktyle suszone', 'kuch_dactyl', 277, 2, 74, 0.4, ['B1'], [Subst.Bl_, Subst.Fe, Subst.Ni_]);
  static const Product fasola_biala = Product('Fasola biała', 'kuch_beans', 288, 21.4, 61.6, 1.6, ['B1', 'B2', 'B6', 'E', 'K'], [Subst.K]);
  static const Product figi_suszone = Product('Figi suszone', 'kuch_fig', 290, 3.6, 78, 1.2, ['B1'], [Subst.Ca, Subst.Bl_, Subst.Pe_, Subst.K]);
  static const Product grejpfrut = Product('Grejpfrut', 'kuch_grejpfrut', 36, 0.6, 9.8, 0.2, ['C'], [Subst.Bl_]);
  static const Product groch = Product('Groch', 'kuch_beans', 293, 23.8, 60.2, 1.4, ['B1', 'B2', 'B3', 'B6', 'E', 'H'], [Subst.K]);
  static const Product groszek_zielony = Product('Groszek zielony', 'kuch_beans_green', 75, 6.7, 17, 0.4, ['B1', 'B3'], []);
  static const Product gruszka = Product('Gruszka', 'kuch_pear', 54, 0.6, 14.4, 0.2, ['C'], [Subst.So_, Subst.Bl_]);
  static const Product herbatniki = Product('Herbatniki', 'kuch_biscuit', 437, 8.2, 76.8, 11, [], []);
  static const Product jablko = Product('Jabłko', 'kuch_apple', 46, 0.4, 12.1, 0.4, ['A', 'B6', 'C', 'E', 'K'], [Subst.Bl_, Subst.Fl_]);
  static const Product jagody = Product('Jagody', 'kuch_blueberries', 153, 0.3, 38.2, 0.2, ['A', 'E'], []);
  static const Product jajko = Product('Jajko', 'kuch_egg', 245, 14.4, 0.8, 20.8, ['A', 'B1', 'B2', 'B5', 'B6', 'B9', 'B12', 'D', 'E', 'H', 'K'], [], unitManager: UnitManager(defUnit: Unit.item, gInItem: 52));
  static const Product kabanosy = Product('Kabanosy', 'kuch_dry_sausage', 326, 27.4, 0, 24.3, [], []);
  static const Product kakao_w_proszku = Product('Kakao w proszku', 'kuch_hot_chocolate', 448, 18.2, 50.6, 21.7, [], []);
  static const Product kapusta_biala = Product('Kapusta biała', 'kuch_cabbage', 29, 1.7, 7.4, 0.2, ['A', 'B2', 'B6', 'B9', 'C', 'D', 'E', 'K'], [Subst.K]);
  static const Product kapusta_czerwona = Product('Kapusta czerwona', 'kuch_cabbage_red', 27, 1.9, 6.7, 0.2, ['A', 'B2', 'B6', 'B9', 'C', 'D', 'K'], []);
  static const Product kapusta_kiszona = Product('Kapusta kiszona', 'kuch_sauerkraut', 12, 1.1, 3.4, 0.2, ['A', 'B2', 'B6', 'B9', 'C', 'D', 'K'], []);
  static const Product kapusta_pekinska = Product('Kapusta pekińska', 'kuch_cabbage_chineese', 12, 1.2, 3.2, 0.2, ['A', 'B2', 'B6', 'B9', 'C', 'D', 'E', 'K'], []);
  static const Product kasza_gryczana = Product('Kasza gryczana', 'kuch_groats_gryczana', 132, 4.5, 25, 2.3, ['B1', 'B2', 'B3', 'B6'], [Subst.Kf_], unitManager: UnitManager(waterExpandFactor: 2.5));
  static const Product kasza_jaglana = Product('Kasza jaglana', 'kuch_groats_jaglana', 346, 10.5, 71.6, 2.9, ['B1', 'B2', 'B3', 'B6'], [Subst.Kf_], unitManager: UnitManager(waterExpandFactor: 2.5));
  static const Product kasza_jeczmienna = Product('Kasza jęczmienna', 'kuch_groats_jeczmienna', 327, 6.9, 75, 2.2, ['B1', 'B2', 'B3', 'B6'], [Subst.Kf_], unitManager: UnitManager(waterExpandFactor: 2.5));
  static const Product kasza_peczak = Product('Kasza pęczak', 'kuch_groats_peczak', 334, 8.4, 74.9, 2, ['B1', 'B2', 'B3', 'B6'], [Subst.Kf_], unitManager: UnitManager(waterExpandFactor: 2.5));
  static const Product kasza_manna = Product('Kasza manna', 'kuch_groats_manna', 34.8, 8.7, 76.7, 1.3, ['B1', 'B2', 'B6'], [Subst.Bl_, Subst.P, Subst.Fe, Subst.Cu], unitManager: UnitManager(waterExpandFactor: 2.5));
  static const Product kaszka_dziecieca = Product('Kaszka dziecięca', 'kuch_baby_food', 427, 12, 10, 72, [], [], unitManager: UnitManager(waterExpandFactor: 2.5));
  static const Product kawa = Product('Kawa', 'kuch_coffee', 2, 0.2, 0.3, 0, [], []);
  static const Product ketchup = Product('Ketchup', 'kuch_ketchup', 93, 1.8, 22.2, 1, [], []);
  static const Product kielbasa = Product('Kiełbasa', 'kuch_sausage_1', 323, 25.6, 0, 24.8, [], []);
  static const Product kielbasa_krakowska = Product('Kiełbasa krakowska', 'kuch_sausage_2', 323, 25.6, 0, 24.8, [], []);
  static const Product kielbasa_parowkowa = Product('Kiełbasa parówkowa', 'kuch_sausage_3', 323, 11, 0, 31.5, [], []);
  static const Product kielbasa_podwawelska = Product('Kiełbasa podwawelska', 'kuch_salami', 247, 17.3, 0.9, 19.6, [], []);
  static const Product koncentrat_pomidorowy = Product('Koncentrat pomidorowy', 'kuch_tomato_sauce', 92, 5.6, 16.7, 1.5, ['C', 'E', 'B1', 'B2', 'B3', 'B6', 'K'], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 1.2, mlInSpoonS: UnitManager.ML_IN_SPOON_S, mlInSpoonB: UnitManager.ML_IN_SPOON_B));
  static const Product kukurydza_puszka = Product('Kukurydza puszka', 'kuch_corn', 110, 3.7, 23.4, 1.5, ['B1', 'B3', 'B6', 'E'], []);
  static const Product majeranek = Product('Majeranek', 'kuch_marjoram', 271, 60, 12.6, 7, ['A', 'B', 'C', 'K'], [Subst.Ca, Subst.Fe, Subst.Mg, Subst.K, Subst.P]);
  static const Product makaron = Product('Makaron', 'kuch_pasta', 363, 10, 78.5, 1.6, ['B1', 'B3', 'B6'], [], unitManager: UnitManager(waterExpandFactor: 2.1));
  static const Product maliny = Product('Maliny', 'kuch_raspberry', 29, 1.3, 12, 0.3, ['B2', 'B9'], [Subst.Bl_, Subst.Zn, Subst.P]);
  static const Product mandarynki = Product('Mandarynki', 'kuch_tangerine', 42, 0.6, 11.2, 0.2, ['A', 'B1', 'B9', 'C'], [Subst.Bl_, Subst.Bk_]);
  static const Product marchew = Product('Marchew', 'kuch_carrot', 27, 1, 8.7, 0.2, ['A', 'B6', 'E', 'K'], [Subst.Ca, Subst.K, Subst.Bk_]);
  static const Product margaryna = Product('Margaryna', 'kuch_butter', 710, 0.3, 0.4, 80, [], []);
  static const Product maslo_ekstra = Product('Masło ekstra', 'kuch_butter', 735, 0.7, 0.7, 82.5, ['A', 'B12', 'C', 'D', 'E'], []);
  static const Product maka_przenna = Product('Mąka pszenna', 'kuch_flour', 35, 1, 0.6, 7.5, [], []);
  static const Product melon = Product('Melon', 'kuch_melon', 36, 0.9, 8.4, 0.3, ['A', 'B3', 'B6', 'C'], [Subst.K, Subst.Bk_]);
  static const Product mielonka = Product('Mielonka', 'kuch_canned_food', 171, 12.8, 3.7, 11.7, ['B6', 'B12', 'D', 'E', 'K'], []);
  static const Product mieso_mielone_wieprzowe = Product('Mięso mielone (wieprzowe)', 'kuch_minced_meat', 263, 16.8, 0, 16.0, ['B1', 'B2', 'B3', 'E', 'K'], [Subst.Ca, Subst.Fe, Subst.K, Subst.Mg, Subst.P]);
  static const Product migdaly = Product('Migdały', 'kuch_almond', 572, 20, 20.5, 52, ['B2', 'E'], [Subst.Bl_, Subst.K]);
  static const Product mleko_spozywcze_1_5_pro = Product('Mleko spożywcze 1.5%', 'kuch_milk', 47, 3.4, 5, 1.5, ['A', 'B2', 'B6', 'B12', 'D', 'E', 'K', 'H'], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.92));
  static const Product mleko_spozywcze_2_0_pro = Product('Mleko spożywcze 2.0%', 'kuch_milk_2', 51, 3.4, 4.9, 2, ['A', 'B2', 'B6', 'B12', 'D', 'E', 'K', 'H'], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.92));
  static const Product mleko_spozywcze_3_2_pro = Product('Mleko spożywcze 3.2%', 'kuch_milk_3_2', 61, 3.3, 4.8, 3.2, ['A', 'B2', 'B6', 'B12', 'D', 'E', 'K', 'H'], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.92));
  static const Product mleko_zageszczone = Product('Mleko zagęszczone', 'kuch_concentrated_milk', 131, 6.6, 9.4, 7.5, ['A', 'B2', 'B6', 'B12', 'D', 'E', 'K', 'H'], []);
  static const Product morele_suszone = Product('Morele suszone', 'kuch_apricot', 284, 5.4, 72.2, 1.2, ['A', 'B1', 'B3', 'B6'], [Subst.Bk_, Subst.K, Subst.Bl_]);
  static const Product musztarda = Product('Musztarda', 'kuch_mustard', 162, 5.7, 22, 6.4, [], []);
  static const Product natka_pietruszki = Product('Natka pietruszki', 'kuch_parsley', 60, 3.7, 9, 1, ['A', 'B2', 'B6', 'B9', 'C', 'E', 'K'], [Subst.Ca, Subst.Fe, Subst.Mg, Subst.K, Subst.Cu, Subst.Bk_]);
  static const Product nektarynka = Product('Nektarynka', 'kuch_peach', 48, 0.9, 11.8, 0.2, ['E'], [], unitManager: UnitManager(defUnit: Unit.item, gInItem: 115));
  static const Product ocet = Product('Ocet', 'kuch_vinegar', 20, 0, 5, 0, [], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.39));
  static const Product olej_rzepakowy = Product('Olej rzepakowy', 'kuch_oil', 900, 0, 0, 100, [], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.86, mlInSpoonS: UnitManager.ML_IN_SPOON_S, mlInSpoonB: UnitManager.ML_IN_SPOON_B));
  static const Product oliwa_z_oliwek = Product('Oliwa z oliwek', 'kuch_olive_oil', 897, 0, 0.2, 99.6, [], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.64, mlInSpoonS: UnitManager.ML_IN_SPOON_S, mlInSpoonB: UnitManager.ML_IN_SPOON_B));
  static const Product oliwki = Product('Oliwki', 'kuch_olives', 147, 1.4, 4.1, 13.9, ['A', 'B', 'C', 'E'], []);
  static const Product oregano = Product('Oregano', 'kuch_oregano', 306, 9, 69, 4, ['C', 'A', 'E', 'K'], [Subst.Kf_, Subst.Bl_, Subst.Mg, Subst.P, Subst.Fe, Subst.Ca], unitManager: UnitManager(defUnit: Unit.g, gInMl: 0.2, mlInSpoonS: UnitManager.ML_IN_SPOON_S, mlInSpoonB: UnitManager.ML_IN_SPOON_B));
  static const Product orzechy_laskowe = Product('Orzechy laskowe', 'kuch_hazelnuts', 695, 14.4, 11, 65.9, ['B1', 'B5', 'B6', 'E'], []);
  static const Product orzechy_nerkowca = Product('Orzechy nerkowca', 'kuch_cashews', 638, 17, 24, 54, ['B1', 'B5', 'B6', 'E'], []);
  static const Product orzechy_pistacjowe = Product('Orzechy pistacjowe', 'kuch_pistachio', 618, 20.8, 17.5, 51.6, ['B1', 'B5', 'B6', 'E'], []);
  static const Product orzechy_wloskie = Product('Orzechy włoskie', 'kuch_walnut', 679, 16, 18, 60.3, ['B1', 'B5', 'B6', 'E'], []);
  static const Product orzeszki_ziemne = Product('Orzeszki ziemne', 'kuch_peanut', 634, 26, 13.3, 53, ['B1', 'B3', 'B5', 'B6', 'E'], []);
  static const Product paluszki = Product('Paluszki', 'kuch_salty_sticks', 384, 9.9, 75.2, 4.9, [], []);
  static const Product papryka_czerwona = Product('Papryka czerwona', 'kuch_paprika', 35, 1.2, 6.9, 0.3, ['A', 'B6', 'B9', 'C', 'E', 'K'], [Subst.K, Subst.Bk_], unitManager: UnitManager(defUnit: Unit.item, gInItem: 120));
  static const Product parmezan = Product('Ser parmezan', 'kuch_parmezan', 451, 41.5, 0.1, 42, ['A', 'D', 'E', 'K'], [Subst.Ca, Subst.P, Subst.Mg, Subst.Fe, Subst.Zn, Subst.Cu, Subst.K]);
  static const Product parowki = Product('Parówki', 'kuch_sausage', 347, 9.5, 0, 34.3, [], []);
  static const Product passata = Product('Passata pomidorowa', 'kuch_passata', 92, 5.6, 16.7, 1.5, ['C', 'E', 'B1', 'B2', 'B3', 'B6', 'K'], [], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 1.2));
  static const Product pasztet_z_drobiu = Product('Pasztet z drobiu', 'kuch_pie', 27, 0.96, 0.44, 2.38, ['B3', 'B6', 'B12', 'D', 'E', 'K'], []);
  static const Product pestki_dyni = Product('Pestki dyni', 'kuch_pumpkin_seed', 596, 29, 15, 46.7, [], []);
  static const Product pieczarka = Product('Pieczarka', 'kuch_mushroom', 24, 2.6, 2.5, 0.4, ['B2', 'B3', 'B5', 'B12', 'C', 'D'], []);
  static const Product pieprz = Product('Pieprz', 'kuch_pepper', 255, 45, 11, 3, ['B2', 'B9', 'C'], [Subst.Ca, Subst.Fe, Subst.Mg, Subst.K, Subst.Cu, Subst.Bk_], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.2, mlInSpoonS: UnitManager.ML_IN_SPOON_S));
  static const Product piersi_indycze = Product('Piersi indycze', 'kuch_turkey', 109, 21.3, 0, 2.6, ['B6', 'B12', 'D', 'E', 'K'], []);
  static const Product piersi_z_kurczaka = Product('Piersi z kurczaka', 'kuch_chicken', 100, 21.5, 0, 1.3, ['B6', 'B12', 'D', 'E', 'K'], []);
  static const Product pietruszka_korzen = Product('Pietruszka korzeń', 'kuch_horseradish', 83, 2.6, 17.1, 0.5, ['A', 'B1', 'B3', 'B6', 'B9', 'C', 'E'], [Subst.P, Subst.K, Subst.Cu, Subst.Mn]);
  static const Product platki_owsiane = Product('Płatki owsiane', 'kuch_cereals', 390, 11.9, 69.3, 7.2, ['B1', 'B9', 'K'], [], unitManager: UnitManager(waterExpandFactor: 3));
  static const Product pomidor = Product('Pomidor', 'kuch_tomato', 29, 0.9, 5.2, 0.5, ['A', 'C', 'E', 'K'], [], unitManager: UnitManager(defUnit: Unit.item, gInItem: 170));
  static const Product por = Product('Por', 'kuch_leek', 47, 1.7, 9.9, 0.1, ['B6', 'B9', 'C', 'K'], [Subst.Fe, Subst.Mn, Subst.Bk_]);
  static const Product pomarancza = Product('Pomarańcza', 'kuch_orange', 51, 0.9, 11.3, 0.2, ['B1', 'B6', 'B9', 'C'], [Subst.Bl_, Subst.Ca]);
  static const Product pulpa_pomidorowa = Product('Pulpa pomidorowa', 'kuch_tomato_sauce', 29, 0.9, 5.2, 0.5, ['A', 'C', 'E', 'K'], [], unitManager: UnitManager(defUnit: Unit.g));
  static const Product rodzynki = Product('Rodzynki', 'kuch_raisen', 298, 2.3, 71.2, 0.5, ['C', 'E', 'K'], [Subst.Bl_, Subst.Fe, Subst.K]);
  static const Product ryz_bialy = Product('Ryż biały', 'kuch_rice', 349, 6.7, 78.9, 0.7, ['B6', 'E'], [], unitManager: UnitManager(waterExpandFactor: 2.4));
  static const Product ser_twarogowy_chudy = Product('Ser twarogowy chudy', 'kuch_curd', 98, 19.8, 3.5, 0.5, ['B2', 'E'], []);
  static const Product ser_twarogowy_poltlusty = Product ('Ser twarogowy półtłusty', 'kuch_curd', 132, 18.7, 3.7, 4.7, ['B2', 'E'], []);
  static const Product ser_twarogowy_pelnotlusty = Product('Ser twarogowy pełnotłusty', 'kuch_curd', 176, 17.7, 3.5, 10.1, ['A', 'B2', 'E'], []);
  static const Product ser_zolty = Product('Ser żółty', 'kuch_cheese', 344, 1.4, 26, 26, ['A', 'D', 'E', 'K'], [Subst.Ca, Subst.P, Subst.Mg, Subst.Fe, Subst.Zn, Subst.Cu, Subst.K], unitManager: UnitManager(defUnit: Unit.slice, gInSlice: 14));
  static const Product serek_homogenizowany_waniliowy = Product('Serek homogenizowany waniliowy', 'kuch_cheese_cream', 158, 16.8, 13.3, 4.2, ['B2', 'E'], []);
  static const Product slonecznik_ziarno = Product('Słonecznik ziarno', 'kuch_sunflower', 580, 22.5, 12.3, 49, ['B1', 'B9'], []);
  static const Product soja = Product('Soja', 'kuch_soya', 412, 34.3, 19.6, 32.7, [], []);
  static const Product sok_jablkowy_100_pro = Product('Sok jabłkowy 100%', 'kuch_apple_juice', 45, 0.4, 10, 0.4, ['A', 'B6', 'C', 'E', 'K'], [Subst.Bl_, Subst.Fl_], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 1));
  static const Product sok_pomaranczowy_100_pro = Product('Sok pomarańczowy 100%', 'kuch_orange_juice', 45, 0.5, 10.5, 0.1, ['B1', 'B6', 'B9', 'C'], [Subst.Bl_, Subst.Ca], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 1));
  static const Product sos_slodko_kwasny = Product('Sos słodko-kwaśny', 'kuch_sauce', 86, 19.8, 0.7, 0.2, ['B2', 'B6', 'C'], [Subst.Na, Subst.Cu, Subst.Mn], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 1.2));
  static const Product sol = Product('Sól', 'kuch_salt', 0, 0, 0, 0, [], [Subst.Na], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.86, mlInSpoonS: UnitManager.ML_IN_SPOON_S));
  static const Product szczypiorek = Product('Szczypiorek', 'kuch_chives', 39, 4.1, 3.9, 0.8, ['A', 'B1', 'B2', 'C'], [Subst.Bk_]);
  static const Product szynka_wedzona = Product('Szynka wędzona', 'kuch_ham_leg', 389, 23, 0, 33, ['B3'], [], unitManager: UnitManager(defUnit: Unit.slice, gInSlice: 14));
  static const Product sledz_w_pomidorach = Product('Śledź w pomidorach', 'kuch_fish_can_red', 177, 13.7, 1.8, 12.8, ['A', 'B2', 'B5', 'B6', 'B12', 'C', 'D'], []);
  static const Product smietana = Product('Śmietana', 'kuch_cream', 193, 2.9, 2.1, 20, ['A', 'B6', 'B12', 'D'], [Subst.Ca, Subst.Fe, Subst.Mg], unitManager: UnitManager(defUnit: Unit.ml, gInMl: 0.64, mlInSpoonB: UnitManager.ML_IN_SPOON_B));
  static const Product truskawki = Product('Truskawki', 'kuch_strawberry', 28, 0.7, 7.2, 0.4, ['C', 'B2', 'K'], [Subst.Bl_, Subst.K]);
  static const Product tunczyk_w_oleju = Product('Tuńczyk w oleju', 'kuch_fish_can_yellow', 190, 27.1, 0, 9, ['A', 'B2', 'B5', 'B6', 'B12', 'C', 'D'], []);
  static const Product tymianek = Product('Tymianek', 'kuch_thyme', 101, 5.5, 24, 1.7, ['B', 'A', 'C', 'E', 'K'], [Subst.Mg, Subst.Mn, Subst.Fe, Subst.Se, Subst.Ca, Subst.K], unitManager: UnitManager(defUnit: Unit.g, gInMl: 0.2, mlInSpoonS: UnitManager.ML_IN_SPOON_S, mlInSpoonB: UnitManager.ML_IN_SPOON_B));

  static const Product winogrona = Product('Winogrona', 'kuch_grapes', 69, 0.5, 17.6, 0.2, ['A', 'B6', 'C', 'K'], [Subst.Re_]);
  static const Product ziemniaki = Product('Ziemniaki', 'kuch_potatoes', 85, 1.9, 20.5, 0.1, ['B1', 'B2', 'B3', 'B5', 'B6', 'C', 'E', 'K'], [Subst.K], unitManager: UnitManager(defUnit: Unit.g, gInItem: 100));

  static const List<Product> all = [
    agrest, ananas, arbuz, baklazan, banan, bazylia, bob, boczek_wedzony, brukselka,
    bulion, bulka_tarta, burak, cebula, chleb_wiejski, chleb_zytni_pelnoziarnisty,
    chrupki_kukurydziane, chrzan, coca_cola, cukier, cukier_puder, cukierki_krowki, cukinia, cynamon,
    cytryna, czekolada_biala, czekolada_gorzka, czekolada_mleczna, czosnek,
//cwikla,
    daktyle_suszone, drozdze, fasola_biala, figi_suszone, grejpfrut,
    groch, groszek_zielony, gruszka, herbatniki, jablko, jagody,
    jajko, kabanosy, kakao_w_proszku, kapusta_biala, kapusta_czerwona, kapusta_kiszona,
    kapusta_pekinska, kasza_gryczana, kasza_jaglana, kasza_jeczmienna, kasza_peczak,
    kasza_manna, kaszka_dziecieca, kawa, ketchup, kielbasa, kielbasa_krakowska, kielbasa_parowkowa, kielbasa_podwawelska,
    koncentrat_pomidorowy, kukurydza_puszka, majeranek, makaron, maliny, mandarynki, marchew, margaryna, maslo_ekstra, maka_przenna,
    melon, mielonka, mieso_mielone_wieprzowe, migdaly, mleko_spozywcze_1_5_pro, mleko_spozywcze_2_0_pro, mleko_spozywcze_3_2_pro, mleko_zageszczone,
    morele_suszone, musztarda, natka_pietruszki, nektarynka, ocet, olej_rzepakowy, oliwa_z_oliwek,
    oliwki, oregano, orzechy_laskowe, orzechy_nerkowca, orzechy_pistacjowe, orzechy_wloskie, orzeszki_ziemne, paluszki, papryka_czerwona,
    parowki, passata, pasztet_z_drobiu, pestki_dyni, pieczarka, pieprz, piersi_indycze, piersi_z_kurczaka,
    pietruszka_korzen, platki_owsiane, pomidor, por, pomarancza, rodzynki, ryz_bialy,
    ser_twarogowy_chudy, ser_twarogowy_poltlusty, ser_twarogowy_pelnotlusty,
    ser_zolty, serek_homogenizowany_waniliowy, slonecznik_ziarno, soja, sok_jablkowy_100_pro, sok_pomaranczowy_100_pro,
    sos_slodko_kwasny, sol, szczypiorek, szynka_wedzona, sledz_w_pomidorach, smietana, truskawki,
    tunczyk_w_oleju, tymianek, winogrona, ziemniaki
  ];

  static const int UNIT_G = 0;
  static const int UNIT_ML = 1;
  static const int UNIT_ITEM = 2;
  static const int UNIT_SPOON_S = 3;
  static const int UNIT_SPOON_B = 4;
  static const int UNIT_BREAD_SLICE = 5;
  static const int UNIT_SLICE = 6;
  static const int UNIT_CLOVE = 7;

  final String name;
  final String _fileName;

  final double kcal100, proteins100, carbohyd100, fat100;
  final List<String> vitamins;
  final List<Subst> other;
  final UnitManager unitManager;

  const Product(
    this.name,
    this._fileName,

    this.kcal100,
    this.proteins100,
    this.carbohyd100,
    this.fat100,

    this.vitamins,
    this.other,
    {this.unitManager = const UnitManager()}
  );

  String get fileName => 'assets/images/kuch/$_fileName.svg';
}

enum Unit{g, ml, item, spoonS, spoonB, breadSlice, slice, clove}
class UnitManager{

  static const double ML_IN_SPOON_S = 5;
  static const double ML_IN_SPOON_B = 15;

  final Unit defUnit;

  final double waterExpandFactor;
  final double? gInMl;
  final double? gInItem;
  final double? gInSlice;
  final double? gInBreadSlice;
  final double? mlInSpoonS;
  final double? mlInSpoonB;
  final double? gInClove;

  int get unitCount{
    int count = 0;
    if(gInMl != null) count++;
    if(gInItem != null) count++;
    if(gInSlice != null) count++;
    if(gInBreadSlice != null) count++;
    if(mlInSpoonS != null) count++;
    if(mlInSpoonB != null) count++;
    if(gInClove != null) count++;

    return count;
  }

  const UnitManager({
    this.defUnit = Unit.g,
    this.waterExpandFactor = 1,
    this.gInMl,
    this.gInItem,
    this.gInSlice,
    this.gInBreadSlice,
    this.mlInSpoonS,
    this.mlInSpoonB,
    this.gInClove
  });

  double? getGIn(Unit unit){
    switch (unit){
      case Unit.g: return 1;
      case Unit.ml: return gInMl;
      case Unit.item: return gInItem;
      case Unit.slice: return gInSlice;
      case Unit.breadSlice: return gInBreadSlice;
      case Unit.spoonS: return mlInSpoonS;
      case Unit.spoonB: return mlInSpoonB;
      case Unit.clove: return gInClove;
      default: return -1;
    }
  }

  double getG(final Unit unit, double amount) => getGIn(unit)!*amount;

  double convert(Unit from, Unit? to, double amount){
    switch (to){
      case Unit.g: return getG(from, amount);
      case Unit.ml: return getG(from, amount)/gInMl!;
      case Unit.item: return getG(from, amount)/gInItem!;
      case Unit.spoonS: return convert(Unit.g, Unit.ml, getG(from, amount))/mlInSpoonS!;
      case Unit.spoonB: return convert(Unit.g, Unit.ml, getG(from, amount))/mlInSpoonB!;
      case Unit.breadSlice: return getG(from, amount)/gInBreadSlice!;
      case Unit.slice: return getG(from, amount)/gInSlice!;
      case Unit.clove: return getG(from, amount)/gInClove!;
      default: return -1;
    }
  }

  static String unitName(Unit? unit){
    switch (unit){
      case Unit.g:
        return "g";
      case Unit.ml:
        return "ml";
      case Unit.item:
        return "szt.";
      case Unit.spoonS:
        return "łyżecz.";
      case Unit.spoonB:
        return "łyż.";
      case Unit.breadSlice:
        return "krom.";
      case Unit.slice:
        return "plastr.";
      case Unit.clove:
        return "ząb.";
      default:
        return '?????????';
    }
  }
}
