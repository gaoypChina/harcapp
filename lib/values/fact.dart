class Fact{
  
  final String text;
  final String source;
  final List<String> meaning;
  const Fact(this.text, {this.source, this.meaning});
  
}

const List<Fact> adwentFacts = [
  Fact('"Adwent", po łacinie "adventus" oznacza "przyjście".'),
  Fact('Czas Adwentu jest oczekiwaniem na narodzenie Boga.'),
  Fact('Nadejście Adwentu na Podlasiu i krańcach Mazowsza oraz Lubelszczyzny obwieszczano grą na ligawach - długim na ponad metr drewnianym rogu.'),
  Fact('Okres przedświątecznego wyciszenia tradycyjnie nakładał się z końcem prac rolniczych.'),
  Fact('Od dnia św. Łucji, 13 grudnia, tradycyjnie rozpoczynano przygotowania do Bożego Narodzenia. Na Pomorzu od tego dnia rozpoczynano kolędowanie po domach.'),
  Fact('W czasie Adwentu codziennie odprawiane są roraty: Msze Święte rozpoczynające się przed wschodem słońca.'),
  Fact('Roraty w Polsce obchodzi się od XIII wieku. Brali w nich udział przedstawiciele wszelkich stanów, w tym także królowie.'),
  Fact('Msza roratnia rozpoczyna się przy wyłączonych światłach - jedynym oświetleniem są lampiony i świece.'),
  Fact('Adwent trwa cztery tygodnie i symbolizowany jest czterema świecami: pokoju, wiary, miłości i nadziei.'),
  Fact('Początkowo Adwent trwał 40 dni. Dopiero od VI wieku Rzymianie przyjęli zwyczaj trwania 4 tygodni.'),
  Fact('We Włoszech starym zwyczajem zakończenia Adwentu jest muzykowanie przy kapliczkach na dudach i piffero.'),
  Fact('Czwarta niedziela Adwentu jest jednym z dwóch momentów w roku, gdy księża przywdziewają różową szatę - symbol radości.'),
  Fact('W "Adwencie" w niektórych parafiach zwyczajowo po domach krąży figura Maryi Panny, przekazywana codziennie podczas rorat.'),
  Fact('W kulturze protestanckiej podczas Adwentu w rodzinach wspólnie czytane jest Pismo Święte.'),

  Fact('"Pod wieczór życia będziemy sądzeni z miłości" - św. Jana od Krzyża, czytania na czas Adwentu.')
];

const List<Fact> ecoFacts = [

  // Populacja

  Fact(
      '10 mld osób w 2060 roku - taki będzie szczyt światowej populacji. Liczba ta w 2100 roku spadnie do 8.8 mld osób.',
      source: 'Wolfgang Lutz et al., eds., "Demographic and Human Capital Scenarios for the 21st Century: 2018 Assessment for 201 Countries", European Commission Joint Research Centre, 2018, p. 8; UN Department of Economic and Social Affairs, World Population Prospects 2019: Highlights (New York: United Nations, 2019), p. 1.'
  ),

  // Zamożność

  Fact(
    'W ciągu ostatnich 200 lat zarobki wzrósły na świecie ponad 12 razy.',
    source: 'Angus Maddison Project Database 2010 and 2018.',
    meaning: [
      'Środki i zasoby dostępne statystycznemu człowiekowi są dwunastokrotnie większe niż były w na początku XIX wieku.',
      'Stan na 2018 rok.'
    ]
  ),

  Fact(
      'W ciągu ostatnich 200 lat gospodarka światowa urosła ponad 100-krotnie.',
      source: 'Angus Maddison Project Database 2010 and 2018; World Bank, “Global Gross Domestic Product, Purchasing Power Parity” chart.'
  ),

  Fact(
    'Średnia cena 50 najpotrzebniejszych produktów względem średniej pensji spadła od 1980 roku o 70%.',
    source: 'Gale L. Pooley and Marian L. Tupy, "The Simon Abundance Index: A New Way to Measure Availability of Resources", Cato Policy Analysis no. 857, December 4, 2018.',
    meaning: [
      'Zasoby świata maleją, a populacja w od 1980 roku niemal dwukrotnie wzrosła. Pomimo tego ceny produktów są coraz niższe - oznacza to, że statystycznie każdy urodzony człowiek zwiększa efektywność wykrzystania zasobów Ziemii szybciej, niż ich używa.',
      'Wraz z rozwojem świata ilość pracy i środków potrzebnych do wytwarzania rosnącej liczby potrzebnych produktów maleje.',
      'Stan na 2018 rok.'
    ]
  ),

  Fact(
    'Nierówności ekonomiczne między państwami spadły od 1952 roku o ponad 30%.',
    source: 'Branko Milanovic, personal communication with the author (Marian L. Tupy), July 12, 2019.',
    meaning: [
      'Najbiedniejsze kraje świata rozwijają się w proporcjonalnie szybciej od rozwiniętych poprzez uczestnictwo w światowym handlu.',
      'Stan na 2018 rok.'
    ]
  ),

  Fact(
    'Liczba osób mieszkających w slumsach spadła od 1990 roku o 15%.',
    source: 'Branko Milanovic, personal communication with the author (Marian L. Tupy), July 12, 2019.',
    meaning: [
      'Stan na 2014 rok.'
    ]
  ),

  // Głód i skrajne ubóstwo

  Fact(
    'Od 1990 roku średnia kaloryczność posiłków w Afryce Subsaharyjskiej wzrosła o 35%.',
    source: 'FAOSTAT, Food Balance Sheets website, UN Food and Agriculture Organization, January 27, 2020.',
    meaning: [
      'Średnia ilość kilokalorii spożywanych dziennie w krajach Afryki Subsaharyjskiej wzrosła w ciągu 25 lat z 1800 kcal do 2400 kcal.'
      'Stan na 2015 rok.'
    ]
  ),

  Fact(
    'Liczba osób niedożywionych spadła czterokrotnie od 1969 roku.',
    source: 'For 1969–2005 data, see Food and Agriculture Organization of the United Nations (FAO), "Global Hunger Declining but Still Unacceptably High", Economic and Social Development Department, September 2010, p. 1, figure 2; and for 2005–2016 data, see FAO, “Hunger and Food Insecurity.”'
  ),

  Fact(
    '175 000 osób każdego dnia - tylu ludzi jest nieprzerwanie wyciąganych ze skrajnego ubóstwa codziennie przez ostatnie 30 lat.',
    source: 'World Bank, "Poverty Headcount Ratio" chart; François Bourguignon and Christian Morrisson, "Inequality among World Citizens: 1820–1992," American Economic Review 92, no. 4 (2002): 727–744.'
  ),

  // Tereny zielone

  Fact(
    'Ponad 2 240 000 km kwadratowych - o tyle zwiększła się powierzchnia terenów leśnych na świecie od 1982 roku.',
    source: 'Xiao-Peng Song et al., "Global Land Change from 1982 to 2016", Nature 560, no. 1 (2018): 639.',
    meaning: [
      'Drzew na świecie przybywa! W ciągu 30 lat pojawiło ich ponad siedmiokrotnie więcej niż wynosi powierzchnia Polski!',
      'Stan na 2016 rok.'
    ]
  ),

  Fact(
    'Terenów zielonych na Ziemi od 2000 roku przybyło o 5%.',
    source: 'Wolfgang Lutz et al., eds., "Demographic and Human Capital Scenarios for the 21st Century: 2018 Assessment for 201 Countries", European Commission Joint Research Centre, 2018, p. 8; UN Department of Economic and Social Affairs, World Population Prospects 2019: Highlights (New York: United Nations, 2019), p. 1.',
    meaning: [
      'Terenów zielonych, w ciągu 20 lat przybyło, podobnie jak powierzchni zielonych na roślinach (np. liści).',
      'Stan na 2020 rok.'
    ]
  ),

  Fact(
    'Powierzchnia chronionych oceanów jest dziś ponad dziesięciokrotnie większa niż w 2000 roku.',
    source: 'www.iucn.org/news/protected-areas/201709/global-shift-marine-protected-area-analysis-and-reporting',
    meaning: [
      'Obszary chronione są w różnym zakresie, najczęściej nie można po nich pływać ani prowadzić na ich terenie połowu ryb.',
      'Stan na 2017 rok.'
    ]
  ),

  Fact(
    'Efektywność upraw rolnych wzrosła trzykrtonie od 1961 roku.',
    source: 'World Bank, "Cereal Yield" chart.',
    meaning: [
      'Technologia upraw rolnych, w tym nawozów oraz modyfikacje plonów prowadzą do szybszego wzrostu efektywności upraw niż przybywa na świecie ludzi.',
      'Stan na 2016 rok.'
    ]
  ),

  // Śmiertelność z przyczyn katastrof naturalnych.

  Fact(
    'Śmiertelność z powodu katastrof naturalnych (powodzi, trzęsień ziemi, huraganów, emidemii, susz, etc.) spadła w ostatnich 100 latach o 99%.',
    source: 'Wolfgang Lutz et al., eds., "Demographic and Human Capital Scenarios for the 21st Century: 2018 Assessment for 201 Countries", European Commission Joint Research Centre, 2018, p. 8; UN Department of Economic and Social Affairs, World Population Prospects 2019: Highlights (New York: United Nations, 2019), p. 1.',
    meaning: [
      'Dzięki rosnącej zamożności społeczeństw, rozwojowi technologii i budowie wysokiej jakości domostw katastrowy naturalne coraz rzadziej powodują poważne konsekwencje.',
      'Największa zmiana zaszła w społeczeństwach najuboższych. Życie na Ziemi jest najbezpieczniejsze w historii świata!',
      'Stan na 2018 rok.',
    ]
  ),

  // Analfabetyzm

  Fact(
    'Analfabetyzm zmalał ośmiokrotnie od 1900 roku.',
    source: 'World Bank, "Literacy Rate, Adult Total" chart.',
  ),

  // Zdrowie

  Fact(
    'Śmiertelność z przyczyn nienaturalnych spadła od 1960 roku o ponad 40%.',
    source: 'World Bank, "Death Rate, Crude" chart.',
    meaning: [
      'Stan na 2017 rok.'
    ]
  ),

  Fact(
    'Liczba nałogowych palaczy tytoniu spadła od 1980 roku o ponad 25%.',
    source: 'Max Roser and Hannah Ritchie, “Cancer,” Our World in Data, April 2018 update.',
    meaning: [
      'Liczba osób uzależnionych od papierosów maleje, co wpływa pozytywnie na długość życia i zdrowie.',
      'Stan na 2015 rok.'
    ]
  ),

  Fact(
    'Czas spędzony na pracy w krajach rozwiniętych spadł od 1950 roku o ponad 20%.',
    source: 'Authors’ calculation based on data from the Conference Board, Total Economy Database—Key Findings, April 2019.',
    meaning: [
      'Statystyczny człowiek zarabia więcej niż kilka dekad temu pracując statystycznie jeden dzień w tygodniu krócej.',
      'Stan na 2019 rok.'
    ]
  ),

  // Woda pitna

  Fact(
    'Liczba osób bez dostępu do wody pitnej spadła od 1990 roku o 60%.',
    source: 'United Nations Statistics Division, Department of Economic and Social Affairs, "Millennium Development Goals Indicators."',
    meaning: [
      'Osobami najszybciej zyskującymi dostęp do wody pitnej są osoby z krajów najuboższych oraz społeczności przeprowadzające się do miast.',
      'Stan na 2015 rok.'
    ]
  ),
];