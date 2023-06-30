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
      text: 'Papier toaletory niby też ma dwie strony'
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

    WDecheData(text: 'Sympatia żadko jest wzajemna, ale antypatia - prawie zawsze.'),

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

    WDecheData(text: 'Jeśli pójdę spać o 4:00, to jest późno, czy wcześnie?'),

    WDecheData(text: 'Wizyty zawsze sprawiają przyjemność, jeśli nie przyjściem, to wyjściem'),

    WDecheData(
      text: 'Nie ma powrotu do jaskiń - jest nas za dużo...',
      imageName: 'cave',
      imageSize: 42.0,
    ),

    WDecheData(
      text: 'Miej serce i nie patrz w telewizor',
      imageName: 'heart',
      imageSize: 42.0
    ),

    WDecheData(text: 'Ty wiesz swoje\n'
        'On wie swoje\n'
        'Ja znam prawdę'),

    WDecheData(text: '"Jestem wstawiony" ~ Ząb'),

    WDecheData(text: 'Żadna praca nie hańbi - ale każda męczy'),

    WDecheData(text: 'Jak nie możesz dojść do siebie, przyjdź do mnie.'),

    WDecheData(text: 'Tylko Ewa mogła być pewna, że Adam nie pokocha innej'),

    WDecheData(text: 'Za autobusem i chłopakiem nie trzeba gonić - będzie następny!'),

    WDecheData(text: 'Są ludzie niezastąpieni, tylko nie każdy ich zna'),

    WDecheData(text: 'Uwierz mi: nie ufaj nikomu.'),

    WDecheData(text: 'Ludzie, myślenie nie boli...'),

    WDecheData(text: 'xD'),

  ];

  final String text;
  final String? imageName;
  final double imageSize;

  const WDecheData({
    required this.text,
    this.imageName,
    this.imageSize = 36.0
  });

}
