class WDecheData{

  static const List<String> allFontFamilies = [
    'Hand0',
    'Hand2',
    'Hand3',
    'Hand5',
    'Hand7',
    'Hand9',
    'Hand11',
    'Hand15'
  ];

  static const List<WDecheData> all = [

    WDecheData(text: 'Co Wy robicie z tą kulką, jak już wypijecie mozzarellę?'),

    WDecheData(text: 'Nie jestem pomidorową, żebyście mnie wszyscy lubili'),

    WDecheData(text: 'Na świecie są trzy rodzaje ludzi: ci co umieją liczyć i ci co nie umieją.'),

    WDecheData(text: 'Po czym rozpoznać, czy łabądź jest chłopem, czy babą?'
        '\n\nRzucasz chleba i jak zjadł, to łabądź, a jak zjadła to łabędzica.'),

    WDecheData(text: 'Najlepszy samochód dla dzika?'
        '\nFordzik.'),

    WDecheData(text: 'Zaskocz przeciwnika ucieczką!'),

    WDecheData(
      text: 'Lepiej mieć tasiemca, niż żadnego życia wewnętrznego...',
      imageName: 'snake',
      imageSize: 42.0,
    ),

    WDecheData(
        text: 'Nie krępuj się'
        '\nSzkoda sznurka',
        imageName: 'rope',
        imageSize: 42.0,
    ),

    WDecheData(
      text: 'Najgorszy zawód, to zawód miłosny',
    ),

    WDecheData(
      text: 'Papier toaletowy niby też ma dwie strony'
          '\nTylko co z tego',
      imageName: 'toilet_paper',
      imageSize: 54.0,
    ),

    WDecheData(
      text: 'Koniom i zakochanym inaczej pachnie siano',
      imageName: 'hay',
      imageSize: 80.0,
    ),

    WDecheData(
      text: 'Serce jest jak telefon - albo nieczynne, albo zajęte, albo źle łączy',
      imageName: 'phone',
      imageSize: 60.0,
    ),

    WDecheData(text: 'Sympatia rzadko jest wzajemna, ale antypatia - prawie zawsze.'),

    WDecheData(
        text: '"Przybyłem, zobaczyłem i oczom nie wierzę..."',
        imageName: 'eyes',
        imageSize: 42.0
    ),

    WDecheData(text: 'Oboźny jest jak nietoperz:'
        '\nNiedowidzi,'
        '\nNiedosłyszy,'
        '\nA wszystkiego się czepia!',
        imageName: 'bat',
        imageSize: 82.0
    ),

    WDecheData(text: 'Małe dzieci nie dają spać'
        '\nDuże nie dają żyć'),

    WDecheData(text: 'Chodzę spać o 4:00, to późno, czy wcześnie?'),

    WDecheData(text: 'Wizyty zawsze sprawiają przyjemność, jeśli nie przyjściem, to wyjściem'),

    WDecheData(text: 'Czy ktoś widział, gdzie się podział mój widelec?'),

    WDecheData(text: '"Rower jest wielce okej"'),

    WDecheData(text: '"Trzeba być ostrożnym czego się pragnie w młodości, bo dostanie się to na starość"'),

    WDecheData(
      text: 'Nie ma powrotu do jaskiń - jest nas za dużo...',
      imageName: 'cave',
      imageSize: 42.0,
    ),

    WDecheData(
      text: 'Miej serce i nie patrz w telewizor',
      imageName: 'heart',
      imageSize: 64.0
    ),

    WDecheData(text: 'Ty wiesz swoje\n'
        'On wie swoje\n'
        'Ja znam prawdę'),

    WDecheData(
      text: 'Nie wychodź z siebie\nMożesz nie wrócić'
    ),

    WDecheData(
      text: 'Warzywa to w gruncie rzeczy...',
      imageName: 'carrot',
      imageSize: 42.0,
    ),

    WDecheData(
      text: 'Czy klucz maturalny otwiera jakieś drzwi?',
    ),

    WDecheData(
      text: 'Kupiłem telefon od ornitologa i mi słowik zmienia sowa'
    ),

    WDecheData(
      text: 'Nie pytaj mnie o starą wędlinę w lodówce, to dość śliski temat'
    ),

    WDecheData(
      text: 'Czemu nie wymyślono jeszcze lekarstwa na anoreksję? Przecież to bułka z masłem'
    ),

    WDecheData(
      text: 'Nie rozmawiaj z obcymi'
          '\nBo jeszcze kogoś poznasz',
    ),

    WDecheData(text: '"Jestem wstawiony"\n~ Ząb'),

    WDecheData(text: 'Z prochu powstałeś...'
        '\nWięc wstań i się otrzep'),

    WDecheData(text: 'Trzeba być kimś, żeby być sobą'),

    WDecheData(text: 'Żadna praca nie hańbi - ale każda męczy'),

    WDecheData(text: 'Jak nie możesz dojść do siebie, przyjdź do mnie.'),

    WDecheData(text: 'Czy Darth Vader sikał?'),

    WDecheData(text: 'Tylko Ewa mogła być pewna, że Adam nie pokocha innej'),

    WDecheData(text: 'Za autobusem i chłopakiem nie trzeba gonić - będzie następny!'),

    WDecheData(text: 'Są ludzie niezastąpieni, tylko nie każdy ich zna'),

    WDecheData(text: 'Uwierz mi: nie ufaj nikomu.'),

    WDecheData(text: 'Ludzie, myślenie nie boli...'),

    WDecheData(text: 'To wszystko jest trochę śmieszne'),

    WDecheData(text: 'Pani mówi, że 40% z nas nie zda matematyki'
        '\nA przecież nas nawet tylu nie ma w klasie'),

    WDecheData(text: 'Tylko bogatych stać na kupowanie tanich rzeczy'),

    WDecheData(text: '"Panie, już cuchnie!"'
        '\n~ J 11, 39'),

    WDecheData(
      text: 'Uwaga!\nRozlana\nboża łaska',
      imageName: 'laska_boza',
      imageSize: 84.0,
      fontFamily: 'Hand15'
    ),

    WDecheData(text: 'xD'),

  ];

  final String text;
  final String? imageName;
  final double imageSize;
  final String? fontFamily;

  const WDecheData({
    required this.text,
    this.imageName,
    this.imageSize = 36.0,
    this.fontFamily,
  });

}
