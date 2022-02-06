
import 'package:flutter/material.dart';

const String auth_macrovector = 'Źródło: <b>Macrovector (freepik.com)</b>';
const String auth_katemangostar = 'Źródło: <b>Katemangostar (freepik.com)</b>';
const String auth_rawpixel = 'Źródło: <b>Rawpixel (freepik.com)</b>';
const String auth_bearfotos = 'Źródło: <b>Rawpixel (bearfotos)</b>';
const String auth_zelimir_borzan = 'Źródło: <b>Zelimir Borzan, University of Zagreb, Bugwood.org</b>';
const String auth_wikipedia = 'Źródło: <b>wikiepdia.org</b>';
const String auth_opencaching_pl = 'Źródło: <b>opencaching.pl</b>';
const String auth_unsplash = 'Źródło: <b>unsplash.com</b>';
const String auth_vtinvasives = 'Źródło: <b>vtinvasives.org</b>';

const double MAX_PARAM_VAL = 4;

class Graphics{
  final String path;
  final String author;

  const Graphics(this.path, this.author);
}

class ItemData{

  final List<Graphics> graphics;
  final Graphics background;
  final String name;
  final String description;
  final List<String> tags;
  final int cieplo;
  final int zar;
  final int plomien;
  final int czas;
  final String desc_source;
  final Graphics background_kora;

  bool get hasParams => cieplo!=null && zar!=null && plomien!=null && czas!=null;

  ItemData(this.graphics, this.background, this.name, this.description, this.tags, {@required this.cieplo, @required this.zar, @required this.plomien, @required this.czas, this.desc_source: 'drzewapolski.pl', this.background_kora});
}

List<ItemData> items = [

  ItemData(
      [
        Graphics('brzoza_rawpixel', auth_rawpixel),
      ],
      Graphics('brzoza', null),
      'Brzoza',
      'Wysokość brzozy brodawkowatej dochodzi do 25 m, przy średnicach do ok. 60 cm; często także w postaci karłowatej. Pień do wysokości ok. 12-15 m wolny od gałęzi, cylindryczny, niekiedy zniekształcony przy odziomku; na niekorzystnych siedliskach także skrzywiony. Kora mlecznobiała, dająca się oddzierać cienkimi poprzecznymi pasmami, wiekiem pstra, spękana w dolnej części pnia, gruba i czarnawa. Młode pędy pokryte brodawkami. Liście skrętoległe, pojedyncze, podwójnie ząbkowane, jajowato zakończone lub trójkątne. Długość liścia do 7 cm, szerokość ok. 3 cm, kolor zielony - na jesieni żółty. Kwiatostany w postaci długich kotek. Nasiona to orzeszki ok. 3mm, dookoła błoniasto oskrzydlone.',
      ['Czarno-biała kora'],
      cieplo: 3, zar: 1, plomien: 4, czas: 1,
      background_kora: Graphics('brzoza', auth_unsplash + ' @worldsbetweenlines')
  ),

  ItemData(
      [
        Graphics('buk_rawpixel', auth_rawpixel),
        //Graphics('buk_1_macrovector', auth_macrovector)
      ],
      Graphics('buk', null),
      'Buk',
      'Buk zwyczajny to drzewo wysokości do 40 metrów. Pień prosty a u starszych gatunków z grubymi żebrami. Kora cienka, jasnoszara. Liście owalne lub eliptyczne, skrętoległe długości 10-15 cm. Początkowo intensywnie zielone potem delikatnie matowo zielone. Owoce to tzw. bukiew - zdrewniała torebka, po dojrzeniu otwiera się 4 klapami uwalniając jeden lub dwa trójkanciaste orzeszki koloru brązowawego.',
      ['Szara kora', 'Cienka kora', 'Owalne liście'],
      cieplo: 3, zar: 3, plomien: 1, czas: 2,
      background_kora: Graphics('buk', auth_vtinvasives)
    //background_kora: Graphics('buk', auth_unsplash + ' @grynykha')
  ),

  ItemData(
      [
        Graphics('cis_wikipedia', auth_wikipedia),
        //Graphics('buk_1_macrovector', auth_macrovector)
      ],
      Graphics('cis', 'tygodniksanocki.pl'),
      'Cis',
      'Cis pospolity to drzewo do 15 metrów wysokości. Rośnie bardzo wolno a w Polsce z powodu ostrych warunków klimatycznych spotykane często w formie krzewu. Pączki drobne, kuliste, przylegające do pędu, okryte kilkoma łuskami. Igły zwężone w ostry wierzchołek, ciemnozielone do 3 cm długości i 2 mm szerokości. Igły ułożone płasko w 2 szeregach. Brunatne nasiona otoczone czerwoną osnówką kształtem przypominające beczkę lub dzwonek.',
      ['Pod ochroną', 'Igły 3 cm', 'Drzewo iglaste'],
      cieplo: null, zar: null, plomien: null, czas: null,
  ),

  ItemData(
      [
        Graphics('dab_opencaching_pl', auth_opencaching_pl),
        //Graphics('dab_1_macrovector', auth_macrovector),
        //Graphics('dab_3_macrovector', auth_macrovector)
      ],
      Graphics('dab', ''),
      'Dąb',
      'Kora jest cienka, jasnoszara do żółtawej, z wiekiem łuskowata, płytko spękana. Owoce są osadzone na bardzo krótkich szypułkach.',
      ['Kora cienka'],
      cieplo: 4, zar: 4, plomien: 1, czas: 3),

  ItemData(
      [
        Graphics('dab_blotny', null)
      ],
      Graphics('dab_blotny', auth_bearfotos),
      'Dąb błotny',
      'Drzewo do 25 m wysokości. Kora szara, gładka, z wiekiem płytko spękana. Liście błyszcząco-zielone do 12 cm z 5-7 wąskimi klapami o głębokich wrębach. Klapy ostro ząbkowane na szczycie. Owoce drobne, półkuliste do 2 cm, w 1/3 otoczone miseczką, rosną na krótkich szypułkach.',
      [],
      cieplo: null, zar: null, plomien: null, czas: null),

  ItemData(
      [
        Graphics('glog_rawpixel', auth_rawpixel)
      ],
      Graphics('glog', null),
      'Głóg',
      'Głóg to małe drzewo do 6 metrów wysokości o szerokiej, kulistej koronie. Pień najczęściej rozgałęzia się przy ziemi. Liście małe, ciemnozielone, lśniące, powcinane. Od spodu liście jaśniejsze. Gałązki charakteryzują się ostrymi, krótkimi cierniami. Kwiaty bardzo efektowne, od różowych po czerwonawe, tworzą charakterystyczne małe "różyczki" (do 2 cm średnicy). Owoce małe, ok. 1 cm szerokości, w postaci czerwonawych, lekko spłaszczonych kulek. ',
      ['Małe liście', 'Kulista korona', 'Ciernie', 'Czerwone owoce'],
      cieplo: 3, zar: 1, plomien: 2, czas: 2),

  ItemData(
      [
        Graphics('grab_rawpixel', auth_rawpixel)
      ],
      Graphics('grab', null),
      'Grab',
      'Grab pospolity osiąga wysokość do ok. 25 m i średnicę do 100 cm, posiada wysoką, gęstą koronę. Drzewo kończy swój wzrost w wieku 120-150 lat. Pień prosty o falistej powierzchni do wys. 10 m bez gałęzi, przeważnie nieregularny. Kora na gałęziach jednorocznych oliwkowo-brunatna, 2-3-letnich brunatno-czerwona, od ok. 6 roku szara i gładka. Liście skrętoległe, pojedyncze, podwójnie piłkowane z 1 cm ogonkiem. U nasady sercowate, długości do 10 cm, ciemnozielone, na nerwach lekko owłosione. Na jesieni jasnożółte. Kotki kwiatowe pojawiają się wraz z liśćmi. Owocostany długości kilku centymetrów. Owocem jest orzeszek w trójklapowej okrywie służącej jako organ lotny.',
      ['Pień prosty', 'Owoc trójklapowy okrzeszek'],
      cieplo: 3, zar: 4, plomien: 0, czas: 2),

  ItemData(
      [
        Graphics('grusza_rawpixel', auth_rawpixel),
      ],
      Graphics('grusza', null),
      'Grusza',
      'Grusza to drzewo do 20 m wysokości. Korona piramidalna a u starszych drzew kopulasta. Korowina szaroczarna z wiekiem spękana i złuszczająca się w postaci w miarę regularnych prostokątów. Liście ułożone skrętolegle, małe do 4 cm, owalne, z początku delikatnie owłosione jasnozielone, następnie nagie i zielone. Kwiaty w baldachokształtnych gronach, płatki białe w liczbie 5 sztuk. Owoc barwy zielonej, żółtej lub czerwonej gruszkowatego kształtu na długim ogonku. Owoce odmian sadowniczych są dużo większe od pozostałych. W środku owoc zawiera kilka płaskich nasion (pestek).',
      ['Kora spękana'],
      cieplo: null, zar: null, plomien: null, czas: null,
      background_kora: Graphics('grusza', '')
  ),

  ItemData(
      [
        Graphics('jarzebina_rawpixel', auth_rawpixel),
        Graphics('jarzebina_wikipedia', auth_wikipedia),

        //Graphics('jarzebina_1_macrovector', auth_macrovector),
        //Graphics('jarzebina_2_macrovector', auth_macrovector),
        //Graphics('jarzebina_o1_macrovector', auth_macrovector)
      ],
      Graphics('jarzebina', null),
      'Jarzębina',
      'Jarząb pospolity jest drzewem wysokości do 7-9 metrów. Kolorowe owoce mają kształt kulek i są zebrane w kępy rosnące na całym drzewie bardzo obficie. Są jednym z głównych pokarmów wielu ptaków. Wiszą na drzewie bardzo długo, bo od lata, aż do końca zimy. Liście są lekko podłużne, a jesienią zyskują czerwono – brązowej barwy. Gałęzie układają się luźno, a w okresie kwitnienia pojawiają się na nich kwiaty o białym kolorze i zapachu migdałowym.',
      ['Owoce niejadalne', 'Owoce drobne', 'Owoce czerwone'],
      cieplo: null, zar: null, plomien: null, czas: null,
      desc_source: 'swiatkwiatow.pl'
  ),

  ItemData(
      [
        Graphics('jesion_insectimages', auth_zelimir_borzan)
      ],
      Graphics('jesion', null),
      'Jesion',
      'Drzewo osiąga wysokość do 40 metrów. Zimą na gałęziach znajdują się czarne pąki ustawione nakrzyżlegle. Pień prosty, pokryty szarą matową korą, początkowo gładką a później porysowaną falistymi rysami. Liście naprzeciwległe, złożone, nieparzystopierzaste o ogonkach do 15 cm długości, składają się z 7-13 lancetowatych listków krótkoogonkowych, zaostrzonych o brzegach piłkowanych do 10 cm. Listek szczytowy ma dłuższy ogonek. Z wierzchu świeżozielone, od spodu jaśniejsze, na głównych nerwach lekko owłosione. W czasie rozwoju czerwonawobrązowe a na jesieni żółtawozielone. Bardzo często jednak liście na jesieni spadają z drzewa jeszcze zielone. Kwiaty pojawiają się przed rozwojem liści, zebrane w niepozorne wiechy. Owoc to długie nasienie i otoczka znajdujące się w długim lancetowatym, zaostrzonym jasnobrązowym skrzydle.',
      ['Kora matowa', 'Kora szara'],
      cieplo: null, zar: 4, plomien: null, czas: 2),

  ItemData(
      [
        Graphics('jodla_rawpixel', auth_rawpixel),
        //Graphics('jodla_1_macrovector', auth_macrovector),
        //Graphics('jodla_2_macrovector', auth_macrovector)
      ],
      Graphics('jodla', null),
      'Jodła',
      'Wysokość do 40 metrów, pień prosty pokryty szaro-biało-brązową korowiną. Drobne jajowate pączki nie są pokryte żywicą. Cienkie ciemnozielone, błyszczące igły do 3 cm, na szczycie wycięte. Szyszki prosto wzniesione do 20 cm o wąsko cylindrycznym kształcie. Młode szyszki - zielone, dojrzałe - brunatne. Jodły najłatwiej odróżnić od innych drzew iglastych po szyszkach, które skierowane są pionowo do góry. Zanim dojrzeją, często przybierają piękną zielona lub fioletową barwę. Dojrzałe nie spadają w całości na ziemię, lecz pod koniec lata rozsypują się na pojedyncze łuski, a na gałęziach pozostają tylko ich trzpienie. Jodły słyną tez z pięknych koron. Pomijając odmiany karłowate, większość tych drzew ma wyraźnie stożkowaty pokrój i piętrowy układ gałęzi.',
      ['Drzewo iglaste', 'Igły 3 cm', 'Szyszki ku górze', 'Szyszki łuskowe'],
      cieplo: 2, zar: 2, plomien: 0, czas: 2),

  ItemData(
      [
        Graphics('kasztan_wikipedia', auth_wikipedia),
        //Graphics('kasztan_1_macrovector', auth_macrovector),
        //Graphics('kasztan_o2_macrovector', auth_macrovector),
        //Graphics('kasztan_o_macrovector', auth_macrovector),
        //Graphics('kasztan_o3_macrovector', auth_macrovector)
      ],
      Graphics('kasztanowiec', null),
      'Kasztan',
      'Kasztan jadalny to drzewo wysokości do 30 metrów. Kora ołowianoszara i gładka z biegiem lat staje się ciemnobrązowa z podłużnymi bruzdami. Liście długie, skrętoległe, pojedyncze, równomiernie piłkowane, zaostrzone. Długość ok. 10-30 cm, szerokość ok. 8 cm. Ciemnozielone, od spodu jasnozielone, po obu stronach nagie. Kotki długości do 35 cm. Owoce w postaci trójkomorowych, kolczastych (jeżowatych) torebek z jadalnymi owocami w ilości 1 do 3 sztuk. Ponieważ kasztan należy do rodziny bukowatych to owoce nazywamy orzechami. Są one spłaszczone, do 3 cm średnicy. Dojrzewają pod koniec października.',
      ['Kora gładka', 'Liście palczaste'],
      cieplo: 3, zar: 1, plomien: 0, czas: 1),

  ItemData(
      [
        Graphics('klon_jawor_invasive_137904', auth_zelimir_borzan),
      ],
      Graphics('klon_jawor', 'J. Kuczyńska'),
      'Klon jawor',
      'Klon jawor zwany powszechnie jaworem, to dość często spotykane drzewo naszych lasów. Jego pień w młodości pokryty jest szarobrązowową korą, która z wiekiem łuszczy się płatami i wyglądem swym przypomina platana, co ma odzwierciedlenie w łacińskiej nazwie pseudoplatanus. To gatunek drzewa, który lubi żyzne, świeże i wilgotne gleby. Dobrze znosi bardziej surowe warunki klimatyczne, stąd często występuje w górach, towarzysząc bukom i świerkom w reglu dolnym a niekiedy samodzielnie tworząc drzewostany.',
      [],
      cieplo: null, zar: null, plomien: null, czas: null),

  ItemData(
      [
        Graphics('klon_zwyczajny_wikipedia', auth_wikipedia),
      ],
      Graphics('klon_zwyczajny', null),
      'Klon zwyczajny',
      'Klon zwyczajny (pospolity) to drzewo do 30 m wysokości. Korona regularna i szeroka. Liście duże, długoogonkowe, 5 lub 7 klapowe z ostrymi ząbkami. Kolor żywo zielony na jesienie przebarwia się na żółto, czerwono i brązowawo. Kwiaty żółtawozielone umieszczone w baldachogronach. Skrzydlaki szeroko rozwarte do 5 cm długości.',
      ['Owoce skrzydlaki', 'Liście duże'],
      cieplo: 3, zar: 1, plomien: 0, czas: 1),

  ItemData(
      [
        Graphics('leszczyna_wikipedia', auth_wikipedia),
      ],
      Graphics('leszczyna', null),
      'Leszczyna',
      'Leszczyna to drzewo do 25 m wysokości, o prostym pniu i bardzo regularnej koronie. Bardzo wytrzymała na mrozy, suszę i zanieczyszczenia miejskie. Do bujnego rozwoju wymaga gleb raczej żyznych i gliniastych. Często spotykana w Pn. Zach. Polsce w parkach i ogrodach a nawet w miastach jako drzewo alejowe.',
      [],
      cieplo: null, zar: null, plomien: null, czas: null,
      background_kora: Graphics('leszczyna', '')
  ),

  ItemData(
      [
        Graphics('lipa_zelimir_borzan', auth_zelimir_borzan),
        //Graphics('buk_1_macrovector', auth_macrovector)
      ],
      Graphics('lipa', ''),
      'Lipa',
      'Lipa drobnolistna osiąga wielkość około 25-40 m. i średnicę do ponad 100 cm. Pień jest prosty do połowy wysokości wolny od gałęzi. Kora w młodości gładka, zielonkawoszara, z wiekiem płytko i podłużnie spękana, ciemnoszara do czarniawej. Liście małe 6-7 cm długości, skośne, sercowate z piłkowanym brzegiem. Pod spodem liści charakterystyczne rudawe włoski w kącikach nerwów. Kwiaty żółtawe w luźnych baldachach na długich szypułach. Owoce to małe, okrągłe i gładkie orzeszki, łatwo pękające pod naciskiem.',
      [],
      cieplo: null, zar: null, plomien: null, czas: null,
  ),

  ItemData(
      [
        Graphics('modrzew_weedimages', auth_zelimir_borzan),
        Graphics('modrzew_wikipedia', auth_wikipedia)
      ],
      Graphics('modrzew', null),
      'Modrzew',
      'Drzewo osiąga wysokość do 40 metrów. Pień prosty, korona luźna, stożkowata. Kora początkowo zielono-brązowa i gładka, później czerwonobrązowa lub szarobrązowa, głęboko spękana, złuszczająca się. Górne gałęzie rosną poziomo a dolne nieco zwisają. Igły długości 2-4 cm na długopędach ułożone skrętolegle a na krótkopędach rosną w wiązkach po 20-40 sztuk. Są krótko zaostrzone, miękkie i giętkie, trochę spłaszczone, świeżo-zielone. Jesienią lśniące, złotożółte. Kwiaty męskie na kilkuletnich krótkopędach jasnożółte. Żeńskie na starszych uiglonych krótkopędach, purpurowo-czerwone później zielonawe. Dojrzałe szyszki wzniesione, owalne, długości do 5 cm, grubości do 3 cm, ciemno lub bladobrązowe, utrzymują się na drzewie.',
      ['Kora luźna', 'Kora spękana', 'Drzewo iglaste', 'Igły 2-4 cm'],
      cieplo: null, zar: null, plomien: null, czas: null),

  ItemData(
      [
        Graphics('olcha_rawpixel', auth_rawpixel)
      ],
      Graphics('olcha', null),
      'Olcha',
      'Olcha czarna osiąga wysokość do 30 metrów, kora ciemnobrązowa, szorstka, pokryta siecią drobnych rys. Liście ułożone skrętolegle, odwrotnie jajowate lub okrągławe, pojedyncze, długoogonkowe. Brzeg liścia ząbkowany. 5-7 par nerwów. Kolor ciemnozielony. Kwitnienie na długo przed rozwojem liści. Kwiaty męskie w żółtawych kotkach. Kwiatostany żeńskie przekształcają się w owocostan - niewielką, owalną czarno-szarą szyszkę do 2 cm długości. ',
      ['Kora szorstka'],
      cieplo: null, zar: null, plomien: null, czas: 2),

  ItemData(
      [
        Graphics('orzech_forestryimages', auth_zelimir_borzan),
        //Graphics('orzech_1_macrovector', auth_macrovector),
        //Graphics('orzech_o1_macrovector', auth_macrovector)
      ],
      Graphics('orzech', null),
      'Orzech',
      'Orzech czarny to drzewo wysokości do 30 m, w swojej ojczyźnie nawet wyższe (do 50 m). Korona  szeroka, kulista. W początkowych latach po posadzeniu rośnie dość szybko. Pień pokryty jest czarną, głęboko bruzdowaną korowiną. Młode pędy miękko owłosione, zimą oliwkowozielone. Liście długości 30-60 cm, 15-23 listkowe. Listki podłużnie jajowate, długości 6-12 cm, u nasady zaokrąglone, z ostrym, dość długim wierzchołkiem, drobno piłkowane, gruczołowato owłosione, młode obustronnie a starsze tylko od spodu. Owoce kuliste, średnicy 3-5 cm, o szerokiej i silnie aromatycznej zewnętrznej, zielonej okrywie. Łupina orzecha zwana skorupą jest gruba bruzdowana, czarnobrązowa. Jądro niesmaczne. Orzechy dojrzewają we wrześniu - październiku i spadają z drzewa w zielonej bądź już brązowawej okrywie.',
      ['Kora wybruzdana', 'Owoce jadalne'],
      cieplo: 3, zar: 1, plomien: 0, czas: 1),

  ItemData(
      [
        Graphics('sosna_rawpixel', auth_rawpixel),
        //Graphics('sosna_1_macrovector', auth_macrovector),
        //Graphics('sosna_2_macrovector', auth_macrovector),
        //Graphics('sosna_katemangostar', auth_katemangostar)
      ],
      Graphics('sosna', null),
      'Sosna',
      'Sosna pospolita może osiągać wysokość do 45 metrów, ma prosty, równy pień zakończony parasolowatą lub stożkową koroną. Gałązki i górna część pnia pokryta jest czerwono-żółtą korą, łuszczącą się warstwami, natomiast dolna część pnia ma korę grubą, wielobocznie popękaną, wewnątrz czerwoną. Szpilki sinozielone, sztywne o długości 4 do 7 centymetrów, osadzone po dwie, wokół gałązek. Szyszki ma osadzone pojedynczo lub po dwie, trzy, stojące długości do 7 cm, niedojrzałe zielone, później brunatnieją i pękają uwalniając uskrzydlone nasiona.',
      ['Kora łuszcząca', 'Drzewo iglaste', 'Igły podwójne'],
      cieplo: 3, zar: 1, plomien: 0, czas: 1,
      background_kora: Graphics('sosna', '')
  ),

  ItemData(
      [
        Graphics('swierk_rawpixel', auth_rawpixel,)
      ],
      Graphics('swierk', null),
      'Świerk',
      'Świerk pospolity to drzewo wysokości do 50 metrów. Pień prosty, zachowany do wierzchołka. Kora czerwonobrązowa łuszcząca się drobnymi płatami. Gałęzie boczne w wyraźnych piętrach, odstające poziomo lub łukowo wygięte. Połyskujące, kłujące igły koloru ciemnozieonego. Igły długości 2 cm. Kwiaty męskie purpurowoczerwone a żeńskie karminowozielonkawe. Szyszki zwisające, cylindryczne, jasno brązowoszare do 15 cm długości i 4 cm średnicy, utrzymują się na drzewie całą zimę.',
      ['Kora łuszcząca', 'Drzewo iglaste', 'Igły 2 cm'],
      cieplo: 2, zar: 1, plomien: 4, czas: 1),

  ItemData(
      [
        Graphics('sliwa_rawpixel', auth_rawpixel,)
      ],
      Graphics('sliwa', 'naszekrzewy.pl'),
      'Śliwa',
      'Śliwa jest drzewem dorastającymi nawet do 10 metrów wysokości, choć istnieją także odmiany o wiele niższe, a wtedy nazywane są  krzewami. Należą do rodziny różowatych. Owoce śliw jada się zazwyczaj na surowo choć spektrum ich zastosowania jest znacznie szersze.',
      ['Owoce jadalne'],
      cieplo: null, zar: null, plomien: null, czas: null,
    background_kora: Graphics('sliwa', 'fajnyogrod.pl'),
  ),

  ItemData(
      [
        Graphics('truskawka_rawpixel', auth_rawpixel),
      ],
      Graphics('truskawka', null),
      'Truskawka',
      'Roślina ma pokrój krzaczasty, ciemnozielone liście, białe lub różowe kwiaty i czerwone owoce o smaku zależnym od odmiany ale zawsze przyjemnym. Wśród odmian truskawek rozróżnia się powtarzające i niepowtarzające owocowanie. Truskawki powtarzające są częściej polecane ze względu na długość owocowania: od czerwca do końca września a nawet dłużej.',
      ['Owoce jadalne'],
      cieplo: null, zar: null, plomien: null, czas: null,
      desc_source: 'ogrodnik-amator.pl'
  ),

  ItemData(
      [
        Graphics('wiaz_rawpixel', auth_rawpixel)
      ],
      Graphics('wiaz', null),
      'Wiąz',
      'Wiąz szypułkowy to drzewo o wysokości do 30 metrów. Liście eliptyczne, z charakterystyczną, asymetryczną podstawą blaszki. Ogonki krótkie. Kwiaty niepozorne, zebrane zwykle w pęczki, wiatropylne, zwisają na cienkich szypułkach. Owocem jest mały orzeszek otoczony błonkowatym skrzydełkiem zwisający na 2 cm szypułkach. Owoce zebrane są po kilka sztuk w pęku. Owoce zawierają w centralnej części orzeszki a po brzegach malutkie rzęski.',
      ['Liście eliptyczne'],
      cieplo: 4, zar: 3, plomien: 2, czas: 2),

  ItemData(
      [
        Graphics('wierzba_rawpixel', auth_rawpixel),
        //Graphics('wierzba_1_macrovector', auth_macrovector)
      ],
      Graphics('wierzba', null),
      'Wierzba',
      'Wierzba płacząca to drzewo o szerokiej, gęstej i regularnej koronie. Gałęzie długie, wiotkie i zwisające. Liście długie, wąsolancetowate na końcu zaostrzone, osadzone na krótkim ogonku. Kora szaro-brązowa. Kwiaty rosną równocześnie z liśćmi. Zebrane w kotki koloru żółtego bądź zielonego.',
      ['Liście długie', 'Gałęzie wiotkie'],
      cieplo: 4, zar: 3, plomien: 2, czas: 2),
  ItemData(
      [
        Graphics('wisnia_rawpixel', auth_rawpixel),
      ],
      Graphics('wisnia', null),
      'Wiśnia',
      'Drzewo do 30 metrów wysokości. Pień prosty pokryty łuszczącą się gładką korowiną koloru ciemno czerwonobrązowego. Liście podwójnie piłkowane, jajowate do 12 cm długości. Kwiaty białe, drobne, do 2,5 cm średnicy, zawieszone na długich szypułkach. Skupione po 3 do 6 w baldaszkach. Owoce kuliste koloru od żółtego, przez pomarańczowy do czerwonego i niemal czarno-brązowego, do 2-3 cm średnicy. Soczyste, smaczne, jadalne. Niektóre odmiany o smaku kwaśnym.',
      ['Kora gładka', 'Kora łuszcząca', 'Owoce jadalne', 'Kwiaty białe'],
      cieplo: null, zar: null, plomien: null, czas: null),
];