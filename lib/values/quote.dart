enum Difficulty{
  easy,
  hard
}

class Quote{
  final String autor;
  final String cytat;
  final Difficulty difficulty;

  const Quote(this.autor, this.cytat, {this.difficulty = Difficulty.easy});
}


const String quoteAuthorSlowacki = 'Juliusz Słowacki';
const String quoteAuthorKaminski = 'Aleksander Kamiński';
const String quoteAuthorMalkowski = 'Andrzej Małkowski';
const String quoteAuthorMalkowska = 'Olga Małkowska';
const String quoteAuthorMirowski = 'hm. Stefan Mirowski';
const String quoteAuthorBadenPowell = 'sir Robert Baden Powell';
const String quoteAuthorJanPawelII = 'Jan Paweł II';
const String quoteAuthorPerykles = 'Perykles';
const String quoteAuthorKazimierzLutoslawski = 'ks. Kazimierz Lutosławski';
const String quoteAuthorGenJozefHaller = 'gen. Józef Haller';
const String quoteAuthorHenrykGlass = 'hm. Henryk Glass';
const String quoteAuthorOlaveBadenPowell = 'Lady Olave Baden-Powell';
const String quoteAuthorWiktorFranz = 'Wiktor Franz';
const String quoteAuthorTuwim = 'Julian Tuwim';
const String quoteAuthorTischner = 'ks. Józef Tischner';
const String quoteAuthorArystoteles = 'Arystoteles';
const String quoteAuthorNieznany = 'Nieznany';
const String quoteAuthorSwBazyliWielki = 'św. Bazyli Wielki';
const String quoteAuthorMaciejChanaka = 'o. Maciej Chanaka OP';
const String quoteAuthorBenShapiro = 'Benjamin A. Shapiro';
const String quoteAuthorGeorgeOrwell = 'George Orwell';
const String quoteAuthorJonathanHaidt = 'Jonathan Haidt';
const String quoteAuthorMikolajRej = 'Mikołaj Rej';
const String quoteAuthorFrankHerbert = 'Frank Herbert';
const String quoteAuthorSorenKierkegaard = 'Søren Kierkegaard';
const String quoteAuthorDenisPreger = 'Denis Preger';
const String quoteAuthorAbpFidelus = 'ks. abp Bronisław Fidelus';
const String quoteAuthorSwTomaszZAkwinu = 'św. Tomasz z Akwinu';
const String quoteAuthorJaroslavPelikan = 'Jaroslav Pelikan';
const String quoteAuthorWolter = 'François-Marie Arouet Voltaire';
const String quoteAuthorJerzyDobrowolski = 'Jerzy Dobrowolski';
const String quoteAuthorAdamSzustak = 'o. Adam Szustak OP';
const String quoteAuthorMackiewicz = 'Józef Mackiewicz';
const String quoteAuthorSzimonPeres = 'Szimon Peres';

const Quote tischnerZmartwychwstwanie = Quote(quoteAuthorTischner, 'Od czasu, gdy Chrystus zwyciężył śmierć, żaden optymizm nie jest w Kościele przesadą.');

const List<Quote> CYTATY_REGULAR = [
  Quote(quoteAuthorSlowacki, 'A kiedy trzeba, na śmierć idą po kolei, jak kamienie przez Boga rzucane na szaniec(…)'),

  Quote(quoteAuthorKaminski, '(…) samotność, częsta towarzyszka wewnętrznej siły człowieka – przyciąga i zniewala otoczenie.'),
  Quote(quoteAuthorKaminski, 'Umiejętność znoszenia niepowodzeń jest wielką i ważną umiejętnością. Oczywiście jeśli towarzyszy jej zdolność i chęć do wyciągania nauki z porażek.'),
  Quote(quoteAuthorKaminski, 'Jeśli harcerstwo chce nadal żyć i pełnić swoją funkcję, to musi samo zdobyć się na próbę odszukania własnego oblicza w dzisiejszym polskim życiu.'),
  Quote(quoteAuthorKaminski, 'Nie w tym jest wart człowiek, co przemyślał i co przeżył, ale co zrobił dobrego na świecie.'),
  Quote(quoteAuthorKaminski, 'Wychowanie nie poparte miłością do wychowanka jest bez wartości.'),
  Quote(quoteAuthorKaminski, 'Być wychowawcą - znaczy: dawać, służyć, pomagać, inspirować.'),
  Quote(quoteAuthorKaminski, 'Być zwyciężonym i nie ulec - to zwycięstwo.'),
  Quote(quoteAuthorKaminski, 'Harce to radosna gra na łonie natury, gdzie mężczyźni z duszą chłopców idą razem z chłopcami na poszukiwanie przygody. Przyniosą stamtąd zdrowie i szczęście, zręczność, zaradność.'),
  Quote(quoteAuthorKaminski, 'Harcerstwo jest organizacją młodzieży, a nie organizacją dla młodzieży.'),

  Quote(quoteAuthorMalkowski, 'Jeśli wymagam stosowania Prawa od dziewięcioletniego smyka, to o ileż bardziej muszę tego wymagać od siebie.'),
  Quote(quoteAuthorMalkowski, 'Ukochanie i odczucie idei bardziej ją wcieli w życie niż najokrutniejsze regulaminy.'),

  Quote(quoteAuthorMalkowska, 'Otóż to - bezczynność jest największym wrogiem zdrowia moralnego i fizycznego.'),

  Quote(quoteAuthorMirowski, 'Prawdziwy autorytet tworzy tylko osobisty przykład, prawdziwość czynów, odpowiedzialność, porządek i konsekwencja.'),
  Quote(quoteAuthorMirowski, 'My też jesteśmy „kamieniami rzuconymi na szaniec”. Mamy te same ideały! Nie musimy pięknie umierać. Ale czy umiemy pięknie żyć?'),
  Quote(quoteAuthorMirowski, 'Najtrudniej być porządnym człowiekiem, gdy nikt nie widzi.'),
  Quote(quoteAuthorMirowski, 'Nie medale, nie premie, nie dyplomy, tylko – a może aż – spokojne sumienie, źródło wewnętrznego zadowolenia, szczęścia. Ku temu zmierza harcerskie, obywatelskie wychowanie.'),
  Quote(quoteAuthorMirowski, 'Istotę życia skautowego stanowi pełne tężyzny życie w terenie.'),
  Quote(quoteAuthorMirowski, 'Jest złudzeniem, że harcerstwo może być apolityczne. Tylko trzeba wyróżnić: czy harcerstwo ma służyć polskiej racji stanu, czy też partykularnym interesom partii politycznych.'),

  Quote(quoteAuthorBadenPowell, '(…) a wtedy możecie uczynić to co jest głównym obowiązkiem skauta, mianowicie pomóc tym, co się znajdują w potrzebie, wszelkim sposobem jaki jest w waszej mocy.'),
  Quote(quoteAuthorBadenPowell,'Być dobrym to jest coś, ale postępować dobrze to znacznie więcej.'),
  Quote(quoteAuthorBadenPowell,'Chcemy nauczyć naszych chłopców nie tylko jak żyć, ale jak cieszyć się życiem.'),
  Quote(quoteAuthorBadenPowell,'Chłopcy robią wszystko to, co robi drużynowy. Drużynowy odbija się w swoich chłopcach jak w lustrze.'),
  Quote(quoteAuthorBadenPowell,'Czuwajcie – to znaczy postępujcie tak, by móc szczęśliwie żyć.'),
  Quote(quoteAuthorBadenPowell,'Gdybym dziś mógł wybierać miejsce, które chciałbym zajmować w ruchu, to chciałbym być zastępowym.'),
  Quote(quoteAuthorBadenPowell,'Jeden jest tylko sprawdzian, który może przekonać skautmistrza, że w pracy osiągnął powodzenie, mianowicie, jeżeli chłopcy, których wychował staną się dobrymi obywatelami.'),
  Quote(quoteAuthorBadenPowell,'Jeżeli chłopiec idzie ulicą uśmiechnięty – to już coś znaczy. Niejeden przechodzień rozpogodzi się na ten widok.'),
  Quote(quoteAuthorBadenPowell,'Jeśli drużynowy obdarzy prawdziwą odpowiedzialnością zastępowego, (…) uczyni więcej dla ukształtowania charakteru tego chłopca, niż nie wiem ile godzin lekcji w szkole.'),
  Quote(quoteAuthorBadenPowell,'Jeżeli zatem chcecie aby wasi chłopcy osiągnęli szczęście w życiu, musicie wdrożyć im zasadę – czynienia dobrze bliźnim.'),
  Quote(quoteAuthorBadenPowell,'Każdy osioł potrafi być dobrym skautem podczas pogody.'),
  Quote(quoteAuthorBadenPowell,'Kto się nie śmieje, jest chory.'),
  Quote(quoteAuthorBadenPowell,'Najlepsze wyniki osiągają te drużyny, gdzie najbardziej zaufano zastępowym. Tu leży tajemnica powodzenia wychowania skautowego.'),
  Quote(quoteAuthorBadenPowell,'Najlepszy sposób osiągnięcia szczęścia – to rozsiewanie go wokół siebie.'),
  Quote(quoteAuthorBadenPowell,'Najważniejszy cel skautingu – wychowywać; pamiętajcie, nie nauczać lecz wychowywać, to jest nakłaniać chłopca, by sam dla siebie, z własnej ochoty uczył się tego, co będzie mu potrzebne dla rozwoju wewnętrznego.'),
  Quote(quoteAuthorBadenPowell,'Nie bierz życia zbyt serio – ale czyń zawsze najlepszy użytek z tego, co posiadasz.'),
  Quote(quoteAuthorBadenPowell,'Nie błądzi tylko ten, kto nic nie robi.'),
  Quote(quoteAuthorBadenPowell,'Nie chodzi o to, byśmy osiągnęli nasze najwyższe ideały, lecz o to, aby były one naprawdę wysokie.'),
  Quote(quoteAuthorBadenPowell,'Nie jesteśmy klubem, ani szkółką niedzielną, ale szkołą – puszczaństwa.'),
  Quote(quoteAuthorBadenPowell,'Nie spodziewajcie się, że życie wasze będzie usłane różami; nie byłoby zresztą zabawne gdyby tak było.'),
  Quote(quoteAuthorBadenPowell,'Dopóki nie jesteś martwy nie mów, żeś nieboszczyk.'),
  Quote(quoteAuthorBadenPowell,'Oto klucz do szczęścia; nie brać rzeczy zbyt tragicznie, robić co możecie najlepszego w danej chwili, życie uważać za grę, a świat za boisko.'),
  Quote(quoteAuthorBadenPowell,'Patrz szeroko. I nawet kiedy wydaje ci się, że patrzysz szeroko – ciągle patrz jeszcze szerzej.'),
  Quote(quoteAuthorBadenPowell,'Pamiętajcie, że chłopiec chce od razu po wstawieniu do drużyny ruszyć na harce: nie zamrażajcie jego zapału wykładami bez końca.'),
  Quote(quoteAuthorBadenPowell,'Pamiętajcie też, że po zakończeniu obozu winniście pozostawić po sobie te dwie rzeczy:\n1. nic,\n2. podziękowanie dla właściciela gruntu.'),
  Quote(quoteAuthorBadenPowell,'Porą, w której skaut musi być najbardziej czynny jest wczesny poranek.'),
  Quote(quoteAuthorBadenPowell,'Posłannictwem moim jest rozprzestrzenianie przyjaźni i braterstwa na całym świecie.'),
  Quote(quoteAuthorBadenPowell,'Skauting jest grą dla chłopców, pod przewodnictwem chłopców.'),
  Quote(quoteAuthorBadenPowell,'Skauting przynosi korzyści tak temu co daje, jak i biorącemu.'),
  Quote(quoteAuthorBadenPowell,'Skaut jest czynny robiąc dobrze, a nie bierny będąc dobrym.'),
  Quote(quoteAuthorBadenPowell,'Skaut musi umieć znaleźć drogę równie łatwo w nocy jak w dzień.'),
  Quote(quoteAuthorBadenPowell,'Skaut nawet sznurówki zawiązuje porządnie.'),
  Quote(quoteAuthorBadenPowell,'Skaut zawsze na coś się przyda.'),
  Quote(quoteAuthorBadenPowell,'Starajcie się zostawić ten świat choć trochę lepszym, niż go zastaliście.'),
  Quote(quoteAuthorBadenPowell,'Śmiejcie się, ile tylko możecie: to dobrze robi.'),
  Quote(quoteAuthorBadenPowell,'Trudności są solą życia – bez nich życie byłoby gorzkie i mdłe.'),
  Quote(quoteAuthorBadenPowell,'Tyle do zrobienia, a tak mało czasu.'),
  Quote(quoteAuthorBadenPowell,'W każdym kraju cel wychowania skautowego jest identyczny. Jest nim mianowicie umiejętność służby dla innych.'),
  Quote(quoteAuthorBadenPowell,'Wychowanie nasze nie jest militarystyczne ani w celach, ani w środkach.'),
  Quote(quoteAuthorBadenPowell,'Wychowanie skautowe winno, o ile możności, odbywać się w formie praktycznych zajęć, gier i zabaw.'),
  Quote(quoteAuthorBadenPowell,'Wytrzymałość to zespół dzielności, cierpliwości i siły.'),
  Quote(quoteAuthorBadenPowell,'Zadaniem nauczyciela czy skautmistrza jest jedynie zachęcanie i wskazywanie właściwego kierunku.'),
  Quote(quoteAuthorBadenPowell,'Zarówno dla skauta jak i dla żołnierza dyscyplina i posłuszeństwo są równie ważne jak dzielność.'),
  Quote(quoteAuthorBadenPowell,'Zaufanie powinno być podstawą moralnego wychowania.'),
  Quote(quoteAuthorBadenPowell,'Zawsze patrzcie na pozytywną stronę rzeczy zamiast na tę ciemną.'),
  Quote(quoteAuthorBadenPowell,'Życie bez przygód byłoby strasznie głupie.'),
  Quote(quoteAuthorBadenPowell,'Celem naszym jest chrześcijańskie postępowanie w życiu i czynach codziennych, a nie jedynie teologiczne praktyki.'),
  Quote(quoteAuthorBadenPowell,'Jeżeli nasz skauting miałby być bez Boga, lepiej żeby go nie było.'),
  Quote(quoteAuthorBadenPowell,'Miłość jest boską cząstką, która zamieszkuje w każdym z nas i jest właściwie naszą duszą.'),
  Quote(quoteAuthorBadenPowell,'Religia może być tylko przeżyta, a nie nauczana.'),
  Quote(quoteAuthorBadenPowell,'Skauting jest środkiem, dzięki któremu najgorszy łobuz może się wznieść do wysokiego poziomu.'),
  Quote(quoteAuthorBadenPowell,'Nie można nazwać wychowanym nikogo, kto nie jest gotów i nie pragnie zrobić swej cząstki pracy dla świata i nie ma po temu wykształconej zdolności.'),
  Quote(quoteAuthorBadenPowell,'Obóz jest podstawową rzeczą w prowadzeniu drużyny. Ale obóz musi być pełen pracowitości, a nie szkołą bezcelowego leniuchowania.'),

  Quote(quoteAuthorJanPawelII, 'Wczoraj do ciebie nie należy. Jutro niepewne. Tylko dziś jest twoje.'),
  Quote(quoteAuthorJanPawelII, 'Przyszłość zaczyna się dzisiaj, nie jutro.'),
  Quote(quoteAuthorJanPawelII, 'Czujesz się osamotniony. Postaraj się odwiedzić kogoś, kto jest jeszcze bardziej samotny.'),
  Quote(quoteAuthorJanPawelII, 'Człowiek jest wielki nie przez to, co posiada, lecz przez to, kim jest.\nNie przez to, co ma, lecz przez to, czym dzieli się z innymi.'),
  Quote(quoteAuthorJanPawelII, 'Wymagajcie od siebie choćby inni od was nie wymagali.'),
  Quote(quoteAuthorJanPawelII, 'Nie bój się. Wypłyń na głębię!'),
  Quote(quoteAuthorJanPawelII, 'Nie chciejcie ojczyzny, która was nic nie kosztuje.'),
  Quote(quoteAuthorJanPawelII, 'Dłonie są krajobrazem serca.'),
  Quote(quoteAuthorJanPawelII, 'Bogatym nie jest ten kto posiada, lecz ten kto daje.'),
  Quote(quoteAuthorJanPawelII, 'Człowiek nie może być tylko wychowywany. Musi wychowywać samego siebie, być dla siebie wychowawcą.'),
  Quote(quoteAuthorJanPawelII, 'Nie potrafi przebaczać innym, kto sam nie zaznał przebaczenia.'),
  Quote(quoteAuthorJanPawelII, 'Nie daj się zwyciężyć złu, ale zło dobrem zwyciężaj.'),
  Quote(quoteAuthorJanPawelII, 'Miłość, która jest gotowa nawet oddać życie, nie zginie.'),
  Quote(quoteAuthorJanPawelII, 'Nie żyje się, nie kocha się, nie umiera się - na próbę.'),
  Quote(quoteAuthorJanPawelII, 'Miłości bez Krzyża nie znajdziecie, a Krzyża bez Miłości nie uniesiecie.'),
  Quote(quoteAuthorJanPawelII, 'Pamięć o przeszłości oznacza zaangażowanie w przyszłość.'),
  Quote(quoteAuthorJanPawelII, 'Jeśli chcesz znaleźć źródło, musisz iść do góry, pod prąd. Przedzieraj się, szukaj, nie ustępuj.'),

  Quote(quoteAuthorPerykles, 'Wolność należy do tych, którzy mają odwagę jej bronić.'),

  Quote(quoteAuthorKazimierzLutoslawski, 'Harcerstwo to nie jest coś, co się umie, ale to jest coś, czym się jest.'),

  Quote(quoteAuthorGenJozefHaller, 'Harcerz wie, że trzeba zawsze wytrwać i przetrwać, by nareszcie zwyciężyć.'),

  Quote(quoteAuthorHenrykGlass, 'Liche charaktery polegną w ogniu wydarzeń, a silne hartują się jak stal i nie dają się złamać.'),

  Quote(quoteAuthorOlaveBadenPowell, 'W świecie pełnym niepewności i niepokoju nasz ruch błyszczy jak złoty łańcuch na ciemnym tle.'),

  Quote(quoteAuthorWiktorFranz, 'Z praw harcerskich robimy dekalog, a to jest tylko kodeks, którego przestrzeganie daje nam prawo do nazwy harcerza.'),

  Quote(quoteAuthorTuwim, 'Błogosławieni ci, którzy nie mając nic do powiedzenia, nie oblekają tego faktu w słowa.'),

  Quote(quoteAuthorTischner, 'Niewątpliwie religia nadaje sens cierpieniu. Ale nie cierpiętnictwu.'),
  Quote(quoteAuthorTischner, 'Nie postrzegam wiary jako stanu raz na zawsze zamrożonego, lecz widzę ją jako ogromną rzekę miotaną konfliktami i napięciami, która raz się burzy, raz płynie spokojnie.'),
  Quote(quoteAuthorTischner, 'Pobożność jest niezwykle ważna, ale rozumu nie zastąpi.'),
  Quote(quoteAuthorTischner, 'Trzeba szczególnej odwagi, by być spowiednikiem na tym świecie.'),
  Quote(quoteAuthorTischner, 'Człowiek jest nieustannym stawaniem się.'),
  Quote(quoteAuthorTischner, 'Powiedz mi, człowieku, jaką prawdę w sobie nosisz, a powiem ci nie tylko kim jesteś, ale czy w ogóle jesteś.'),
  Quote(quoteAuthorTischner, 'Nadzieja musi zawsze być na miarę próby. Im większa próba, tym mocniejsza nadzieja.'),
  Quote(quoteAuthorTischner, 'Ewangelia mówi: ty, człowieku, jesteś zrodzony z miłości. A jedyną sprawą, jaką w życiu masz, to nauczyć się mądrej miłości.'),
  Quote(quoteAuthorTischner, 'Przestrzenią człowiekowi najbliższą jest dom. Wszystkie drogi człowieka przez świat mierzą się odległością od domu.'),
  Quote(quoteAuthorTischner, 'Zanim cię zbawią (…) musisz być sobą, bo jeśli będziesz kimś innym, to akurat zbawią tego innego, a nie ciebie.'),
  Quote(quoteAuthorTischner, 'W religii, aby być posłusznym, trzeba najpierw być wolnym.'),
  Quote(quoteAuthorTischner, 'Społeczeństwo, któremu trudno się wyzbyć wad narodowych, buduje kolejne kaplice.'),
  Quote(quoteAuthorTischner, 'Są rzeczy, które przerastają możliwości ludzkiego rozumu. Jest światło, które oślepia. Tak jest z Bogiem.'),
  Quote(quoteAuthorTischner, 'Religia to odkrywanie więzi już istniejących, choć nie uświadamianych.'),
  Quote(quoteAuthorTischner, 'Nie żyjemy dla siebie i nie umieramy dla siebie.'),
  Quote(quoteAuthorTischner, 'Nie jest wolny człowiek, który nie potrafi przyznać się do winy.'),
  Quote(quoteAuthorTischner, 'Mowa ziemi jest podobna do mowy miłości – ziemia także przemawia w ciszy.'),
  Quote(quoteAuthorTischner, 'Miłość sama w sobie jest nie do pojęcia, ale dzięki miłości możemy pojąć wszystko.'),
  Quote(quoteAuthorTischner, 'Kto nie ma Sprawy, dla której żyje, bardzo boi się umrzeć.'),
  tischnerZmartwychwstwanie,

  Quote(quoteAuthorArystoteles, 'Prawdziwa wiedza to znajomość przyczyn.'),
  Quote(quoteAuthorArystoteles, 'Kara jest także rodzajem lekarstwa.'),
  Quote(quoteAuthorArystoteles, 'Tolerancja i apatia to ostatnie cnoty umierającego społeczeństwa.'),

  Quote(quoteAuthorNieznany, 'Prawda nie leży pośrodku. Prawda leży tam, gdzie leży.'),
  Quote(quoteAuthorNieznany, 'Do wychowania dziecka potrzeba całej wioski.'),
  //Quote(cytaty_autor_nieznany, 'Wieloetniczość w społeczeństwie jest możliwa tylko w przypadku jedności kulturowej.'),

  Quote(quoteAuthorSwBazyliWielki, 'Modlitwa to nie tylko słowa.'),

  Quote(quoteAuthorMaciejChanaka, 'Nie ma ludzi wierzących i niewierzących. Są modlący się i niemodlący.'),

  Quote(quoteAuthorBenShapiro, 'Nie ma czegoś takiego jak "twoja prawda". Jest tylko prawda i twoja opinia.'),

  Quote(quoteAuthorGeorgeOrwell, 'Jeśli wolność słowa w ogóle coś oznacza, to: prawo do mówienia ludziom tego, czego nie chcą słyszeć.'),
  Quote(quoteAuthorGeorgeOrwell, 'W braku jakichkolwiek zewnętrznych punktów odniesienia nawet zarysy własnego życia tracą ostrość.'),
  Quote(quoteAuthorGeorgeOrwell, 'Niechlujność języka ułatwia posiadanie głupich myśli.'),
  Quote(quoteAuthorGeorgeOrwell, 'Piękno jest pozbawione sensu, dopóki człowiek się nim nie dzieli.'),
  Quote(quoteAuthorGeorgeOrwell, 'Każde pokolenie wyobraża sobie, że jest inteligentniejsze niż poprzednie i mądrzejsze niż to, które nadchodzi po nim.'),

  Quote(quoteAuthorJonathanHaidt, 'Jeśli masz wysokie IQ to jesteś naprawdę dobry w wynajdywaniu argumentów na poparcie swojego poczucia, że masz rację.'),

  Quote(quoteAuthorMikolajRej, 'A niechaj narodowie wżdy postronni znają, iż Polacy nie gęsi, iż swój język mają.'),

  Quote(quoteAuthorFrankHerbert, 'Strach zabija duszę. Strach to mała śmierć, a wielkie unicestwienie.'),
  Quote(quoteAuthorFrankHerbert, 'Umysł rozkazuje ciału i ono jest posłuszne. Umysł rozkazuje sobie samemu i natrafia na opór.', difficulty: Difficulty.hard),
  Quote(quoteAuthorFrankHerbert, 'Skłonni jesteśmy upodabniać się do najgorszego z naszych przeciwników.', difficulty: Difficulty.hard),
  Quote(quoteAuthorFrankHerbert, 'Szukaj swobody, a staniesz się niewolnikiem swoich pragnień. Szukaj dyscypliny, a znajdziesz wolność.'),
  Quote(quoteAuthorFrankHerbert, 'Kiedy nie lubisz tego, co robisz, rób to lepiej.'),
  Quote(quoteAuthorFrankHerbert, 'Bogactwo to narzędzie wolności, ale pogoń za nim to droga do niewolnictwa.'),
  Quote(quoteAuthorFrankHerbert, 'Nie potrzebujesz słów. Swoim życiem przemawiasz wprost do zmysłów.'),

  Quote(quoteAuthorSorenKierkegaard, 'Życie nie jest problemem do rozwiązania, ale rzeczywistością, której należy doświadczyć.'),

  Quote(quoteAuthorDenisPreger, 'Sekularyzm dla władzy państwa jest zbawienny. I śmiertelny w każdym innym przypadku.'),

  Quote(quoteAuthorAbpFidelus, 'Mam, bo daję.'),

  Quote(quoteAuthorSwTomaszZAkwinu, 'Wiara: akt rozumu nakłonionego wolą, pociągniętego przez łaskę.', difficulty: Difficulty.hard),
  Quote(quoteAuthorSwTomaszZAkwinu, 'Sprawiedliwie nie oznacza po równo.'),

  Quote(quoteAuthorJaroslavPelikan, 'Tradycja jest żyjącą wiarą umarłych. Tradycjonalizm jest martwą wiarą żywych.'),

  Quote(quoteAuthorWolter, 'Nie zgadzam się z tym co mówisz, ale oddam życie, abyś miał prawo to powiedzieć.'),

  Quote(quoteAuthorJerzyDobrowolski, 'Nie ma nic gorszego niż człowiek wykształcony ponad własną inteligencję.'),

  Quote(quoteAuthorAdamSzustak, 'Nikt nie ma indywidualnej drogi do Boga.\nBóg jest trójcą.\nCzyli wspólnotą.\nNie bez powodu.'),

  Quote(quoteAuthorMackiewicz, 'Tylko prawda jest ciekawa.'),

  Quote(quoteAuthorSzimonPeres, 'Optymiści i pesymiści umierają tak samo.\n\nTylko żyją inaczej.')

];

// "Konserwatyści to postępowcy, którzy jadą zgodnie z ograniczeniem prędkości." - Michael Malice









const String cytaty_autor_pilecki = 'Rotmistrz Witold Pilecki';
const String cytaty_autor_okulicki = 'gen. Leopold Okulicki';
const String cytaty_autor_baczynski = 'Krzysztof Kamil Baczyński';
const String cytaty_autor_jankowski = 'Jan Stanisław Jankowski';
const String cytaty_autor_mickiewicz = 'Adam Mickwiecz';
const String cytaty_autor_napieralski = 'Stefan Napierski';
const String cytaty_autor_stanislaw_dobrowolski = 'Stanisław Dobrowolski';

const List<Quote> CYTATY_POWST_WARSZ = [
  Quote(cytaty_autor_pilecki, 'Starałem się tak żyć, abym w godzinie śmierci mógł się raczej cieszyć, niż lękać.'),
  Quote(cytaty_autor_pilecki, 'Za sprawę mojej Ojczyzny w potrzebie, krwi własnej ani życia nie szczędzić.'),
  Quote(cytaty_autor_pilecki, 'Znalazłem w sobie radość wynikającą ze świadomości, że chcę walczyć.'),

  Quote(cytaty_autor_okulicki, 'Dobrą i piękna mieliśmy Polskę, ale to dopiero dziś umiemy docenić.'),

  Quote(cytaty_autor_baczynski, 'Umrzeć przyjdzie, gdy się kochało wielkie sprawy głupią miłością.'),
  Quote(cytaty_autor_baczynski, 'Zanim padłeś, jeszcze ziemię przeżegnałeś ręką. Czy to była kula, synku, czy to serce pękło?'),

  Quote(quoteAuthorSlowacki, 'A kiedy trzeba, na śmierć idą po kolei, jak kamienie przez Boga rzucane na szaniec(…)'),

  Quote(cytaty_autor_baczynski, 'Chcieliśmy być wolni i wolność sobie zawdzięczać.'),

  Quote(cytaty_autor_mickiewicz, 'Jeśli zapomnę o Nich – ty Boże na niebie zapomnij o mnie.'),

  Quote(cytaty_autor_napieralski, 'Ojczyzna: to jest tam, gdzie by się chciało umrzeć.'),

  Quote(cytaty_autor_stanislaw_dobrowolski, 'Poległym chwała, wolność żywym.'),
];