import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/data/data_spraw_zhp_harc.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/open_spraw_dialog.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/spraw_tile_template_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models/rank_zhp_sim_2022.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_cat.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_group.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/models_common/rank_task.dart';
import 'package:harcapp/_new/cat_page_guide_book/_stopnie/rank_widgets/rank_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../../_sprawnosci/models/spraw.dart';
import '../../_sprawnosci/spraw_selector.dart';

const String _tab = '    ';


class Indicator extends StatelessWidget{

  final int index;
  final bool required;
  final String name;
  final double width;
  final double height;

  const Indicator({
    required this.index,
    required this.required,
    required this.name,

    required this.width,
    required this.height,

    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(2))
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            ' $index',
            style: AppTextStyle(
                color: iconEnab_(context).withOpacity(required?1:.5),
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold
            ),
          ),
        )
      ),
    );
  }

}


class SprawSelectedListWidget extends StatefulWidget{

  static const String customPrefix = 'custom@';
  static const String samplePrefix = 'sample@';

  final String rankId;
  final String code;
  final String name;
  final int count;
  final int? reqCount;
  final Color? backgroundColor;
  final Color? stopColor;
  final void Function(int, Spraw?, String?)? onNewSprawSelected;
  final void Function(int, bool)? onCheckChanged;
  final void Function()? onSprawStateChanged;
  final bool checkVisible;
  final bool checkable;

  const SprawSelectedListWidget(
      this.rankId,
      this.code,
      this.name,
      { required this.count,
        this.reqCount,
        this.backgroundColor,
        this.stopColor,
        this.onNewSprawSelected,
        this.onCheckChanged,
        this.onSprawStateChanged,
        required this.checkVisible,
        required this.checkable,
        super.key
      });

  @override
  State<StatefulWidget> createState() => SprawSelectedListWidgetState();

}

class SprawSelectedListWidgetState extends State<SprawSelectedListWidget>{

  static const double itemHeight = 72.0;
  static const double indicatorWidth = 24.0;

  String get rankId => widget.rankId;
  String get name => widget.name;
  String get code => widget.code;
  int get count => widget.count;
  int? get reqCount => widget.reqCount;
  Color? get backgroundColor => widget.backgroundColor;
  Color? get stopColor => widget.stopColor;
  void Function(int, Spraw?, String)? get onNewSprawSelected => widget.onNewSprawSelected;
  void Function(int, bool)? get onCheckChanged => widget.onCheckChanged;
  void Function()? get onSprawStateChanged => widget.onSprawStateChanged;
  bool get checkVisible => widget.checkVisible;
  bool get checkable => widget.checkable;

  late List<TextEditingController> controllers;
  
  @override
  void initState() {
    controllers = [];
    for(int i=0; i<count; i++) {

      String extText = RankZHPSim2022Templ.getExtText(rankId, code, i)??'';
      if(extText.contains(SprawSelectedListWidget.customPrefix))
        extText = extText.substring(SprawSelectedListWidget.customPrefix.length);

      controllers.add(TextEditingController(
        text: extText
      ));
    }
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    int _reqCount = reqCount ?? count;

    List<Widget> children = [];
    for (int i = 0; i < count; i++){

      String? extText = RankZHPSim2022Templ.getExtText(rankId, code, i);

      Spraw? spraw;
      if(extText == null)
        spraw = null;
      else if(extText.length > SprawSelectedListWidget.samplePrefix.length)
        spraw = Spraw.fromUID(extText.substring(SprawSelectedListWidget.samplePrefix.length));
      else if(!extText.startsWith(SprawSelectedListWidget.samplePrefix) && !extText.startsWith(SprawSelectedListWidget.customPrefix) && extText.isNotEmpty) {
        // This is a temporary solution.
        spraw = null;
        extText = SprawSelectedListWidget.customPrefix + extText;
        RankZHPSim2022Templ.setExtText(rankId, code, i, extText);
      }else
        spraw = null;

      Widget emptyButtons = SizedBox(
        height: itemHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Indicator(
              index: i+1,
              required: i<_reqCount,
              name: name,
              width: indicatorWidth,
              height: itemHeight,
            ),

            const SizedBox(width: Dimen.defMarg),

            Expanded(child: SimpleButton.from(
                context: context,
                icon: MdiIcons.dotsHorizontal,
                text: 'Wybierz',
                radius: AppCard.defRadius,
                margin: EdgeInsets.zero,
                onTap: () async {

                  String level1 = '';
                  String level2 = '';
                  switch(rankId){
                    case rankZhp1Id:
                      level1 = '1';
                      level2 = '2';
                      break;
                    case rankZhp2Id:
                      level1 = '1';
                      level2 = '2';
                      break;
                    case rankZhp3Id:
                      level1 = '2';
                      level2 = '3';
                      break;
                    case rankZhp4Id:
                      level1 = '2';
                      level2 = '3';
                      break;
                    case rankZhp5Id:
                      level1 = '3';
                      level2 = '4';
                      break;
                    case rankZhp6Id:
                      level1 = '3';
                      level2 = '4';
                      break;
                  }
                  
                  List<Spraw> spraws = sprawBookZHPHarcSim2022.allSpraws.where(
                    (spraw) => spraw.level == level1 || spraw.level == level2
                  ).toList();
                  
                  Spraw? selectedSpraw = await selectSpraw(
                    context, allSpraws: spraws,
                  );

                  if(selectedSpraw == null) return;

                  RankZHPSim2022Templ.setExtText(rankId, code, i, SprawSelectedListWidget.samplePrefix + selectedSpraw.uniqName);
                  setState(() {});
                }
            )),
            Expanded(child: SimpleButton.from(
                context: context,
                icon: MdiIcons.pencil,
                text: 'Notatka',
                radius: AppCard.defRadius,
                margin: EdgeInsets.zero,
                onTap: (){
                  RankZHPSim2022Templ.setExtText(rankId, code, i, SprawSelectedListWidget.customPrefix);
                  setState(() {});
                }
            )),
          ],
        ),
      );

      if (extText == null)
        children.add(emptyButtons);

      else if (extText.startsWith(SprawSelectedListWidget.customPrefix))
        children.add(
          SizedBox(
            height: itemHeight,
            child: Row(
              children: [

                Indicator(
                  index: i+1,
                  required: i<_reqCount,
                  name: name,
                  width: indicatorWidth,
                  height: itemHeight,
                ),

                const SizedBox(width: Dimen.ICON_MARG),

                Expanded(
                  child: AppTextFieldHint(
                    hint: 'Notatka',
                    hintTop: 'Notatka',
                    style: AppTextStyle(),
                    maxLines: null,
                    hintStyle: AppTextStyle(color: hintEnab_(context)),
                    textCapitalization: TextCapitalization.sentences,
                    textAlignVertical: TextAlignVertical.top,
                    controller: controllers[i],
                    onChanged: (_, text) =>
                        RankZHPSim2022Templ.setExtText(rankId, code, i, SprawSelectedListWidget.customPrefix + text),
                  ),
                ),
                if(checkVisible)
                  IgnorePointer(
                    ignoring: !checkable,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                      value: RankZHPSim2022Templ.getExtChecked(rankId, code, i),
                      onChanged: (value) {
                        RankZHPSim2022Templ.setExtChecked(rankId, code, i, value!);
                        setState(() {});
                        RankFloatingButtonProvider.notify_(context);
                        onCheckChanged?.call(i, value);
                      },
                      activeColor: stopColor,
                    ),
                  ),

                IconButton(
                  icon: const Icon(MdiIcons.close),
                  onPressed: () async {
                    String? oldExtText = RankZHPSim2022Templ.getExtText(rankId, code, i)??'';
                    await RankZHPSim2022Templ.removeExtText(rankId, code, i);
                    if(!mounted) return;
                    showAppToast(
                        context,
                        text: 'Usunięto ${name.toLowerCase()}',
                        buttonText: 'Cofnij',
                        onButtonPressed: (){
                          RankZHPSim2022Templ.setExtText(rankId, code, i, oldExtText);
                          setState(() {});
                        }
                    );
                    setState((){});
                  },
                )
              ],
            ),
          )
        );
      else if(extText.startsWith(SprawSelectedListWidget.samplePrefix) && spraw != null) {
        children.add(
          SizedBox(
              height: itemHeight,
              child: SprawTileTemplateWidget(
                spraw: spraw,
                onTap: () => openSprawDialog(
                  context,
                  spraw!,
                  onStateChanged: (){
                    onSprawStateChanged?.call();
                    setState((){});
                  },
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(right: Dimen.ICON_MARG),
                  child: Indicator(
                    index: i+1,
                    required: i<_reqCount,
                    name: name,
                    width: indicatorWidth,
                    height: itemHeight,
                  ),
                ),
                trailing: Row(
                  children: [

                    if(spraw.completed)
                      IgnorePointer(
                        child: Checkbox(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                          value: true,
                          onChanged: (value) {},
                          activeColor: hintEnab_(context),
                        ),
                      )
                    else
                      SprawTileProgressWidget(spraw: spraw),

                    IconButton(
                      icon: const Icon(MdiIcons.close),
                      onPressed: () async {
                        String? oldExtText = RankZHPSim2022Templ.getExtText(rankId, code, i)??'';
                        await RankZHPSim2022Templ.removeExtText(rankId, code, i);
                        if(!mounted) return;
                        showAppToast(
                            context,
                            text: 'Usunięto ${name.toLowerCase()}',
                            buttonText: 'Cofnij',
                            onButtonPressed: (){
                              RankZHPSim2022Templ.setExtText(rankId, code, i, oldExtText);
                              setState(() {});
                            }
                        );
                        setState((){});
                      },
                    ),
                  ],
                ),
              ),
          )
        );
      } else
        children.add(emptyButtons);

      if(i < count - 1)
        children.add(const SizedBox(height: Dimen.defMarg/3));
      
    }

    return Material(
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        color: backgroundColor??cardEnab_(context),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
        )
    );
  }

}

class SprawNamesWidget extends StatefulWidget{

  final String stopId;
  final String code;
  final String name;
  final int count;
  final int? reqCount;
  final Color? backgroundColor;
  final Color? stopColor;
  final void Function(bool?)? onCheckChanged;
  final bool checkVisible;
  final bool checkable;

  const SprawNamesWidget(
      this.stopId,
      this.code,
      this.name,
      {required this.count,
        this.reqCount,
        this.backgroundColor,
        this.stopColor,
        this.onCheckChanged,
        required this.checkVisible,
        required this.checkable,
        super.key
      });

  @override
  State<StatefulWidget> createState() => SprawNamesWidgetState();

}

class SprawNamesWidgetState extends State<SprawNamesWidget>{

  String get stopId => widget.stopId;
  String get name => widget.name;
  String get code => widget.code;
  int get count => widget.count;
  int? get reqCount => widget.reqCount;
  Color? get backgroundColor => widget.backgroundColor;
  Color? get stopColor => widget.stopColor;
  void Function(bool?)? get onCheckChanged => widget.onCheckChanged;
  bool get checkVisible => widget.checkVisible;
  bool get checkable => widget.checkable;

  @override
  Widget build(BuildContext context) {
    int _reqCount = reqCount??count;

    List<Widget> children = [];
    for(int i=0; i<count; i++)
      children.add(
          Row(
            children: [
              Expanded(
                child: AppTextFieldHint(
                  hint: '$name ${i + 1}: ${i<_reqCount?'*':''}',
                  hintTop: '$name ${i + 1} ${i<_reqCount?'*':''}',
                  style: AppTextStyle(),
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  controller: TextEditingController(text: RankZHPSim2022Templ.getExtText(stopId, code, i)),
                  onChanged: (_, text) => RankZHPSim2022Templ.setExtText(stopId, code, i, text),
                ),
              ),
              if(checkVisible)
                IgnorePointer(
                  ignoring: !checkable,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimen.ICON_SIZE)),
                    value: RankZHPSim2022Templ.getExtChecked(stopId, code, i),
                    onChanged: (value) async {
                      RankZHPSim2022Templ.setExtChecked(stopId, code, i, value!);
                      setState((){});
                      Provider.of<RankFloatingButtonProvider>(context, listen: false).notify();
                      onCheckChanged?.call(value);
                    },
                    activeColor: stopColor,
                  ),
                )
            ],
          )
      );

    return Material(
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        color: backgroundColor??cardEnab_(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG, vertical: Dimen.defMarg),
          child: Column(children: children),
        )
    );
  }

}

// To jest wciąż stara wersja.
RankZHPSim2022Data rankZhp0Data = RankZHPSim2022Data(
  titleMale: 'Próba harcerza',
  titleFemale: 'Próba harcerki',
  minWiek: '-',
  czasTrw: '3 - 6 miesięcy',
  version: 1,

  sprawCount: 0,
  tropCount: 0,
  wyzwCount: 0,

  org: Org.zhp,
  id: 'HARC_0_SIM_2022',
  idea: 'Stara się zasłużyć na miano harcerki lub harcerza. Chce poznać harcerstwo i dostosować się do jego wymagań, określonych w prawie i Przyrzeczeniu Harcerskim. Chce uczestniczyć w życiu zastępu (patrolu) i drużyny.',
  catData: [

    const RankCatData(
      groupData: [
        RankGroupData(
          taskData: [
            RankTaskData(text: 'Znam i rozumiem treść Przyrzeczenia Harcerskiego.'),
            RankTaskData(text: 'Znam i rozumiem Prawo Harcerskie.'),
            RankTaskData(text: 'Znam i rozumiem symbolikę krzyża harcerskiego, lilijki i koniczynki. Potrafię wyjaśnić, do czego zobowiązuje harcerskie pozdrowienie \"Czuwaj\".'),
            RankTaskData(text: 'Znam hymn harcerski i umiem go zaśpiewać.'),
            RankTaskData(text: 'Kompletuję swój mundur harcerski.'),
            RankTaskData(text: 'Systematycznie uczestniczę w zbiórkach zastępu i drużyny.'),
            RankTaskData(text: 'Wykonałem(-am) z zastępem (patrolem) przynajmniej jedno zadanie zespołowe (lub projekt).'),
            RankTaskData(text: 'Znam nazwę drużyny, imię i nazwisko zastępowego i drużynowego i wiem, jak się z nimi skontaktować.'),
          ]
        )
      ]
    )
  ]
);
RankZHPSim2022 rankZhp0 = rankZhp0Data.build();

const String rankZhp1Id = 'HARC_1_SIM_2022';
RankZHPSim2022Data rankZhp1Data = RankZHPSim2022Data(
  titleMale: 'Młodzik',
  titleFemale: 'Ochotniczka',
  minWiek: '10 - 12 lat',
  czasTrw: '6 - 12 miesięcy',
  version: 1,

  sprawCount: 4,
  tropCount: 3,
  wyzwCount: 3,
  wyzwCountReq: 1,

  org: Org.zhp,
  id: rankZhp1Id,
  idea: '$_tab Jest aktywny w działaniach klasy oraz grupy przyjaciół.'
      '\n$_tab Chętnie poznaje otaczający go świat, historię swojej rodziny oraz regionu. Rozwija swoje zainteresowania, czyta książki, poszerzając swoją wiedzę.'
      '\n$_tab Jest obowiązkowy - dotrzymuje danego słowa, wywiązuje się ze złożonych obietnic, mówi prawdę. Radzi sobie z realizacją swoich obowiązków, rozsądnie dysponuje swoim kieszonkowym.'
      '\n$_tab Wie, gdzie znaleźć odpowiedzi na nurtujące go pytania, wykorzystuje wrodzoną kreatywność do znajdywania innowacyjnych rozwiązań napotkanych problemów. Gdy sobie z czymś nie radzi, potrafi poprosić o pomoc.'
      '\n$_tab Dba o siebie – śpi odpowiednią liczbę godzin, zdrowo się odżywia, uprawia regularne ćwiczenia fizyczne.'
      '\n$_tab Wie, że ludzie swoimi decyzjami mają wpływ na naturę, stara się o nią dbać każdego dnia, wyrabia w sobie ekologiczne zachowania (np. segregacja odpadów, oszczędzanie wody i energii itd.).'
      '\n$_tab Najpierw myśli, potem mówi, nie życzy innym źle, nie obgaduje, nie używa wulgaryzmów.',
  catData: [

    const RankCatData(
      icon: RankData.iconCatStopZadania,
      groupData: [
        RankGroupData(
            title: 'Tożsamość harcerska',
            icon: RankData.iconTozsHarcerska,
            taskData: [
              RankTaskData(text: 'Noszę mundur zgodny z regulaminem obowiązującym w ZHP.'),
              RankTaskData(text: 'Poznałem najważniejsze tradycje i obrzę- dy swojej drużyny. Potrafię stanąć w postawie zasadniczej i swobodnej oraz ustawić się w szeregu. Wyka- załem się tą wiedzą i umiejętnościami uczestnicząc w obrzędach i apelu drużyny.'),
            ]
        ),
        RankGroupData(
          title: 'Obozownictwo',
          icon: RankData.iconObozow,
          taskData: [
            RankTaskData(text: 'Wziąłem udział w obozie lub biwaku pod namiotami. Poznałem zasady bezpieczeństwa i przestrzegałem ich. Po obozowisku nie zostawiłem żadnego śladu.'),
            RankTaskData(text: 'Wyznaczyłem strony świata za pomocą dwóch wybranych sposobów.'),
            RankTaskData(text: 'Znam i w różnych sytuacjach zastosowałem co najmniej pięć węzłów.'),
          ],
        ),
        RankGroupData(
          title: 'Ratownictwo',
          icon: RankData.iconPierwszaPomoc,
          taskData: [
            RankTaskData(text: 'W sytuacji rzeczywistej lub symulowanej podjąłem się prostych czynności ratujących zdrowie i udzieliłem pomocy w zdarzeniach, które mogą mieć miejsce w domu: opatrzyłem ranę, zabezpieczyłem oparzenie, zareagowałem właściwie w sytuacji omdlenia, zadbałem o bezpieczeństwo osoby nieprzytomnej.'),
            RankTaskData(text: 'Znam numery alarmowe, skorzystałem z nich w sytuacji rzeczywistej lub symulowanej.'),
          ],
        ),
        RankGroupData(
          title: 'Żywienie',
          icon: RankData.iconZywienie,
          taskData: [
            RankTaskData(text: 'Przygotowałem pod nadzorem rodzica śniadanie lub kolację dla domowników, w tym jedno wybrane danie na ciepło, np.: owsiankę, jajecznicę, parówki na gorąco.'),
          ],
        ),
        RankGroupData(
          title: 'Zdrowie',
          icon: RankData.iconZdrowie,
          taskData: [
            RankTaskData(text: 'Wziąłem udział w wycieczce pieszej, rowerowej lub kajakowej trwającej około 4-5 godzin. Samodzielnie spakowałem plecak uwzględniając zdrowe przekąski, wodę, okrycie na słońce i deszcz, krem z filtrem itd.'),
          ],
        ),
        RankGroupData(
          title: 'Świat cyfrowy',
          icon: RankData.iconSwiatCyfrowy,
          taskData: [
            RankTaskData(text: 'Zapoznałem się z zasadami BHP podczas pracy przy komputerze. Porównałem je z moimi przyzwyczajeniami i skorygowałem (w razie potrzeby) swoje nawyki.'),
          ],
        ),
        RankGroupData(
          title: 'Ekologia',
          icon: RankData.iconEkologia,
          taskData: [
            RankTaskData(text: 'Przez okres trwania próby raz w tygodniu podejmowałem przynajmniej półgodzinną aktywność na łonie przyrody (w parku, lesie, na łące itd.) stosując się do zasad właściwego zachowania w terenie (m.in. zostaw to, co znajdziesz w stanie nienaruszonym; zachowaj ciszę, niech natura ma głos; rozpalaj ogień tylko tam, gdzie jest to dozwolone).'),
          ],
        ),
        RankGroupData(
          title: 'Ekonomia',
          icon: RankData.iconEkonomia,
          taskData: [
            RankTaskData(text: 'Zaoszczędziłem pieniądze na wybrany przez siebie cel, np.: zakup produktu lub usługi, opłacenie składki członkowskiej.'),
            RankTaskData(text: 'Sporządziłem wraz z rodzicami listę potrzebnych produktów, porównałem ich ceny oraz odmiany w różnych sklepach. Podczas dokonywania zakupów nie przekroczyłem założonego budżetu.')
          ],
        ),
        RankGroupData(
          title: 'Zaradność życiowa',
          icon: RankData.iconZaradnosc,
          taskData: [
            RankTaskData(text: 'Utrzymuję porządek w swoim pokoju.'),
            RankTaskData(text: 'Mocno i estetycznie przyszyłem łatę lub naszywkę oraz guzik.')
          ]
        )
      ]
    )

  ]
);
RankZHPSim2022 rankZhp1 = rankZhp1Data.build();

const String rankZhp2Id = 'HARC_2_SIM_2022';
RankZHPSim2022Data rankZhp2Data = RankZHPSim2022Data(
  titleMale: 'Wywiadowca',
  titleFemale: 'Tropicielka',
  minWiek: '12 - 13 lat',
  czasTrw: '6 - 12 miesięcy',
  version: 1,

  sprawCount: 4,
  tropCount: 3,
  wyzwCount: 3,
  wyzwCountReq: 1,

  org: Org.zhp,
  id: rankZhp2Id,
  idea: '$_tab Aktywnie uczestniczy w działaniach klasy oraz grupy przyjaciół, proponuje swoje pomysły.'
      '\n$_tab Wywiadowca jest ciekawy otaczającego świata, interesuje się bieżącymi wydarzeniami, czyta książki, rozwija swoje zainteresowania.'
      '\n$_tab Ma swój wzór do naśladowania.'
      '\n$_tab Szanuje przyrodę i dba o nią poprzez ekologiczne zachowania (np. segregacja odpadów, oszczędzanie wody i energii itd.).'
      '\n$_tab Spełnia dobre uczynki, wraz z zastępem podejmuje pożyteczne działania na rzecz innych.'
      '\n$_tab W relacjach z innymi ludźmi kieruje się zasadą „nie czyń drugiemu, co tobie niemiłe”.'
      '\n$_tab Nie unika odpowiedzialności za własne postępowanie (w tym popełnione błędy, których skutki stara się naprawić). Wie, do kogo zwrócić się o pomoc oraz gdzie zdobyć potrzebną wiedzę, jeśli tego potrzebuje.'
      '\n$_tab Nie marnuje czasu, rozsądnie planuje swój dzień. Dba o siebie, m.in. ogranicza niezdrowe rzeczy, regularnie uprawia aktywność fizyczną. Wie, jakie zmiany zajdą w jego organizmie w okresie dojrzewania.',
  catData: [
    const RankCatData(
      icon: RankData.iconCatStopZadania,
      groupData: [
        RankGroupData(
          title: 'Tożsamość harcerska',
          icon: RankData.iconTozsHarcerska,
          taskData: [
            RankTaskData(text: 'Udokumentowałem w kronice drużyny (lub na stronie internetowej lub fanpage’u) jedno wydarzenie z jej życia.'),
          ],
        ),
        RankGroupData(
          title: 'Obozownictwo',
          icon: RankData.iconObozow,
          taskData: [
            RankTaskData(text: 'Zachowując zasady bezpieczeństwa, rozpaliłem ogień na łonie natury z użyciem wyłącznie naturalnych materiałów (nie dotyczy zapałek/zapalniczki); po zgaszeniu doprowadziłem miejsce do pierwotnego stanu. Uczestniczyłem w przygotowaniu złożonego posiłku na ognisku.'),
            RankTaskData(text: 'Wraz z zastępem rozstawiłem namiot i zbudowałem przydatne urządzenie obozowe (np. wyposażenie namiotu), przez cały obóz utrzymałem porządek w swoich rzeczach.'),
            RankTaskData(text: 'Pełniłem służbę wartowniczą na obozie lub biwaku.'),
          ],
        ),
        RankGroupData(
          title: 'Ratownictwo',
          icon: RankData.iconPierwszaPomoc,
          taskData: [
            RankTaskData(text: 'W sytuacji rzeczywistej lub symulowanej przy użyciu własnej apteczki prawidłowo postąpiłem przy krwotokach:'
                '\n\n• udzieliłempierwszejpomocywprzypadku krwotoku z nosa,'
                '\n• założyłem opatrunek uciskowy w przypadku krwotoku z rany.'),
            RankTaskData(text: 'Udzieliłem pierwszej pomocy w przypadku ukąszenia przez owady.'),
          ],
        ),
        RankGroupData(
          title: 'Ekologia',
          icon: RankData.iconEkologia,
          taskData: [
            RankTaskData(text: 'Korzystałem wyłącznie z wielorazowych naczyń i sztućców na biwakach, imprezach szkolnych i harcerskich przez minimum trzy miesiące.'),
            RankTaskData(text: 'Przez okres trwania próby opiekowałem się zwierzęciem lub rośliną.'),
          ],
        ),
        RankGroupData(
          title: 'Ekonomia',
          icon: RankData.iconEkonomia,
          taskData: [
            RankTaskData(text: 'Wykonałem jedno z poniższych zadań:'
                '\n\n• Wziąłem udział w akcji zarobkowej w formie: zbiórki publicznej, sprzedaży towarów lub usług, loterii, crowdfundingu itp.,'
                '\n• Przygotowałem materiały informacyjne (np. ulotkę, banner, reklamę w formie elektronicznej) dotyczące 1% dla OPP (organizacji pożytku publicznego), które zostały wykorzystane przez drużynę. Przed ich publikacją uzyskałem akceptację ich treści przez drużynowego.'),
          ],
        ),
        RankGroupData(
          title: 'Postawa obywatelska',
          icon: RankData.iconPostawaObyw,
          taskData: [
            RankTaskData(text: 'Znam obszar swojej gminy i jej siedzibę. Sprawnie posługuję się planem lub mapą swojej okolicy, na jej podstawie dotrę we wskazane miejsce.'),
            RankTaskData(text: 'Znam daty świąt narodowych, wiem, jakie wydarzenia te święta upamiętniają. Przygotuję z zastępem zbiórkę z okazji jednego z nich.'),
            RankTaskData(text: 'Potrafię wskazać na mapie krainy geograficzne Polski.'),
            RankTaskData(text: 'Wiem, kto jest protektorem ZHP.'),
            RankTaskData(text: 'Znam flagę Unii Europejskiej. Potrafię wymienić kilka państw, które należą do Unii Europejskiej.'),
          ],
        ),
        RankGroupData(
          title: 'Żywienie',
          icon: RankData.iconZywienie,
          taskData: [
            RankTaskData(text: 'Nauczyłem się przygotowywać ulubioną potrawę z rodzinnego przepisu.'),
          ],
        ),
        RankGroupData(
          title: 'Zdrowie',
          icon: RankData.iconZdrowie,
          taskData: [
            RankTaskData(text: 'Wziąłem udział w całodziennej wycieczce pieszej, rowerowej lub kajakowej. Dowiedziałem się jak i przygotowałem na niej obiad niewymagający gotowania.'),
            RankTaskData(text: 'Przez okres trwania próby ćwiczyłem wybrany sport lub dziedzinę sprawności fizycznej (np.: szybkość, skoczność, celność, utrzymywanie równowagi). Zapisałem wynik osiągany na początku (np. czas na 100 m) i poprawiłem go na koniec próby.')
          ],
        ),
        RankGroupData(
          title: 'Zaradność życiowa',
          icon: RankData.iconZaradnosc,
          taskData: [
            RankTaskData(text: 'Mam stały obowiązek domowy związany z obsługą urządzeń technicznych i wywiązuję się z niego.')
          ],
        ),
        RankGroupData(
          title: 'Świat cyfrowy',
          icon: RankData.iconSwiatCyfrowy,
          taskData: [
            RankTaskData(text: 'Zapoznałem się z netykietą, czyli zbiorem zasad zachowania się w Internecie. Stosuję je podczas codziennego użytkowania sieci.')
          ],
        ),

      ]
    )
  ]
);
RankZHPSim2022 rankZhp2 = rankZhp2Data.build();

const String rankZhp3Id = 'HARC_3_SIM_2022';
RankZHPSim2022Data rankZhp3Data = RankZHPSim2022Data(
  titleMale: 'Odkrywca',
  titleFemale: 'Pionierka',
  minWiek: '13 - 15 lat',
  czasTrw: '9 - 12 miesięcy',
  version: 1,

  sprawCount: 4,
  tropCount: 2,
  wyzwCount: 3,
  wyzwCountReq: 1,

  org: Org.zhp,
  id: rankZhp3Id,
  idea: '$_tab Nie myśli tylko o sobie, ale żyje także dla innych, dba o swoich przyjaciół i rodzinę. Rozumie, co znaczy słowo „braterstwo”, szuka tego, co łączy, nie tego co dzieli. Staje w obronie słabszych i pokrzywdzonych.'
      '\n$_tab Zna potrzeby i problemy najbliższego otoczenia, wciela w życie ideę służby, zmienia świat na lepsze. Podejmuje działania mające na celu ochronę przyrody.'
      '\n$_tab Szanuje czas swój i innych, potrafi realnie rozłożyć dane działanie w czasie. Umie świętować swoje osiągnięcia i realizację celów.'
      '\n$_tab Stale zdobywa nową wiedzę i przydatne umiejętności. Ma swoje hobby i potrafi je ciekawie zaprezentować w gronie zastępu lub drużyny. Posługuje się narzędziami, umie ich bezpiecznie używać.'
      '\n$_tab Rozumie zmiany zachodzące w organizmie związane z okresem dojrzewania. Nie korzysta z alkoholu, tytoniu ani środków odurzających.'
      '\n$_tab Odkrywca dba o hart ducha – poszukuje wartości, według których chce żyć oraz wzorców postępowania, które chce kultywować. Poddaje refleksji wartości i postawy wynikające z Prawa i Przyrzeczenia Harcerskiego, odnosi do nich swoje postępowanie. Najpierw myśli, potem mówi.',
  catData: [
    const RankCatData(
      icon: RankData.iconCatStopZadania,
      groupData: [
        RankGroupData(
          title: 'Tożsamość harcerska',
          icon: RankData.iconTozsHarcerska,
          taskData: [
            RankTaskData(text: 'Odwiedziłem jedno z miejsc związanych z ważnymi dla harcerstwa wydarzeniami.'),
            RankTaskData(text: 'Poznałem życiorysy ośmiu osób zasłużonych dla rozwoju ruchu harcerskiego. O dwóch spośród nich opowiedziałem podczas zbiórki zastępu lub drużyny.'),
          ],
        ),
        RankGroupData(
          title: 'Obozownictwo',
          icon: RankData.iconObozow,
          taskData: [
            RankTaskData(text: 'Wziąłem udział w kilkudniowym rajdzie lub wyprawie z nocowaniem na łonie przyrody, podczas którego minimalizowałem swój wpływ na środowisko (odpowiednio gospodarując wodą i odpadami, przygotowując nocleg, zabezpieczając ognisko).'),
            RankTaskData(text: 'Dbam o sprzęt drużyny lub szczepu. Brałem udział w jego konserwacji.'),
            RankTaskData(text: 'Samodzielnie wykonałem obrzędowy stos ogniskowy.')
          ],
        ),
        RankGroupData(
          title: 'Ratownictwo',
          icon: RankData.iconPierwszaPomoc,
          taskData: [
            RankTaskData(text: 'Przeprowadziłem resuscytację krążeniowo‐oddechową na fantomie osoby dorosłej.'),
            RankTaskData(text: 'W sytuacji rzeczywistej lub symulowanej rozpoznałem objawy udaru słonecznego i udzieliłem pierwszej pomocy poszkodowanemu.')
          ],
        ),
        RankGroupData(
          title: 'Zdrowie',
          icon: RankData.iconZdrowie,
          taskData: [
            RankTaskData(text: 'Przez dwa tygodnie nie korzystałem z telefonu na godzinę przed snem dokumentując to (np. w aplikacji Forest) oraz dowiedziałem się, dlaczego używanie telefonu przed snem jest niekorzystne dla zdrowia.'),
            RankTaskData(text: 'Przez okres trwania próby minimum raz w tygodniu uprawiałem swoją ulubioną aktywność fizyczną.')
          ],
        ),
        RankGroupData(
          title: 'Ekologia',
          icon: RankData.iconEkologia,
          taskData: [
            RankTaskData(text: 'Wziąłem udział w kilkudniowej wyprawie z nocowaniem na łonie przyrody. Nauczyłem się odpowiednio załatwić swoje potrzeby fizjologiczne będąc w terenie.'),
            RankTaskData(text: 'Wiem, co to jest rezerwat przyrody, park narodowy i park krajobrazowy. W czasie harcerskich wędrówek odwiedziłem jeden z parków narodowych lub krajobrazowych.')
          ],
        ),
        RankGroupData(
          title: 'Świat cyfrowy',
          icon: RankData.iconSwiatCyfrowy,
          taskData: [
            RankTaskData(text: 'Utworzyłem konto mailowe. Wykorzystuję podstawowe funkcje klienta pocztowego, m.in. ustawiłem podpis w mailu, przy wysyłaniu maili do wielu osób korzystam z opcji UDW.')
          ],
        ),
        RankGroupData(
          title: 'Ekonomia',
          icon: RankData.iconEkonomia,
          taskData: [
            RankTaskData(text: 'Wykorzystując więcej niż jeden sposób, pozyskałem środki finansowe na wybrany przez siebie cel.')
          ],
        ),
        RankGroupData(
          title: 'Zaradność życiowa',
          icon: RankData.iconZaradnosc,
          taskData: [
            RankTaskData(text: 'Zdobyłem nową umiejętność przydatną w gospodarstwie domowym. Rzetelnie wykonuję swoje obowiązki domowe.')
          ],
        ),
        RankGroupData(
          title: 'Żywienie',
          icon: RankData.iconZywienie,
          taskData: [
            RankTaskData(text: 'Przygotowałem potrawę tradycyjną dla wybranego regionu Polski (np. proziaki z Podkarpacia, babkę ziemniaczaną z Podlasia).')
          ],
        ),
      ]
    )
  ]
);
RankZHPSim2022 rankZhp3 = rankZhp3Data.build();

const String rankZhp4Id = 'HARC_4_SIM_2022';
RankZHPSim2022Data rankZhp4Data = RankZHPSim2022Data(
  titleMale: 'Ćwik',
  titleFemale: 'Samarytanka',
  minWiek: '14 - 16 lat',
  czasTrw: '9 - 12 miesięcy',
  version: 1,

  sprawCount: 4,
  tropCount: 2,
  wyzwCount: 3,
  wyzwCountReq: 1,

  org: Org.zhp,
  id: rankZhp4Id,
  idea: '$_tab Potrafi zidentyfikować potrzeby i problemy najbliższego otoczenia oraz szuka dla nich rozwiązania. Współpracuje z osobami o innych poglądach. Zgłębia problemy i stawia dociekliwe pytania, poszukuje informacji i rozwiązań.'
      '\n$_tab Poznaje miejsce człowieka w środowisku i konsekwencje jego decyzji, podejmuje działania, aby zmniejszyć swój negatywny wpływ na środowisko.'
      '\n$_tab Poszukuje nowych pasji i rozwija swoje zainteresowania. Podejmując decyzje, zastanawia się nad tym, jakie konsekwencje przyniosą – dla niego i innych.'
      '\n$_tab Bierze odpowiedzialność za popełnione błędy i wyciąga z nich naukę na przyszłość. Rozsądnie podejmuje się nowych zadań, kierując się właściwie wyznaczonymi priorytetami oraz rzetelną oceną możliwości. Konsekwentnie dąży do realizacji samodzielnie postawionych celów.'
      '\n$_tab Poważnie i odpowiedzialnie traktuje sprawy płci. Umie pracować w grupie, od etapu planowania do ewaluacji. Umiejętnie posługuje się osiągnięciami nowych technologii. Potrafi sobie poradzić zarówno w życiu codziennym, jak i w sytuacjach kryzysowych, w tym sytuacjach zagrożenia życia.'
      '\n$_tab Ćwik poznaje granice swoich możliwości w działaniu na podstawie swojej wiedzy, umiejętności i wrodzonych predyspozycji. Postępuje racjonalnie, zgodnie z potrzebami swojego ciała (odżywianie, higiena osobista, odpowiednia ilość snu, uprawianie sportu). Umie radzić sobie z kwestiami wynikającymi z procesu dojrzewania organizmu.'
      '\n$_tab Postępuje zgodnie z wyznawanymi przez siebie zasadami, nawet jeśli jest poddawany presji otoczenia czy okoliczności. Umie zachować się kulturalnie w sytuacjach konfliktowych. Nie doprowadza do tego, by cokolwiek wpłynęło na jego zdolność do podejmowania decyzji, nie korzysta z alkoholu, tytoniu ani środków odurzających.',
  catData: [
    const RankCatData(
      icon: RankData.iconCatStopZadania,
      groupData: [
        RankGroupData(
          title: 'Tożsamość harcerska',
          icon: RankData.iconTozsHarcerska,
          taskData: [
            RankTaskData(text: 'Przeczytałem przynajmniej jedną książkę, która pogłębiła moją wiedzę o dziejach ruchu harcerskiego lub skautowego. Zaprezentowałem innym (w zastępie, drużynie) wybrane zagadnienie i znaczącą postać.'),
            RankTaskData(text: 'Spotkałem członka władz mojego hufca. Dowiedziałem się jak oznacza się funkcje w hufcu, chorągwi i władzach naczelnych ZHP i jakie są zadania tych poziomów organizacji.'),
          ],
        ),
        RankGroupData(
          title: 'Obozownictwo',
          icon: RankData.iconObozow,
          taskData: [
            RankTaskData(text: 'Zapoznałem młodszych harcerzy z zasadami pracy z narzędziami pionierskimi. Pokierowałem zastępem przy budowie prostego urządzenia obozowego.'),
            RankTaskData(text: 'Podjąłem się funkcji oboźnego, kwatermistrza lub zaopatrzeniowca na wyjeździe drużyny.'),
          ],
        ),
        RankGroupData(
          title: 'Ratownictwo',
          icon: RankData.iconPierwszaPomoc,
          taskData: [
            RankTaskData(text: 'W sytuacji rzeczywistej lub symulowanej rozpoznałem objawy zawału serca i udaru. Udzieliłem pierwszej pomocy poszkodowanemu.'),
            RankTaskData(text: 'W sytuacji rzeczywistej lub symulowanej udzieliłem pierwszej pomocy w przypadku napadu duszności i zadławienia u osoby dorosłej.'),
            RankTaskData(text: 'Współprowadziłem zbiórkę na temat pierwszej pomocy dla innych harcerzy.')
          ],
        ),
        RankGroupData(
          title: 'Zdrowie',
          icon: RankData.iconZdrowie,
          taskData: [
            RankTaskData(text: 'Przez trzy miesiące spałem minimum po siedem godzin dziennie, dbając o to, aby przed snem się wyciszyć.'),
            RankTaskData(text: 'Przez okres trwania próby minimum raz w tygodniu uprawiałem swoją ulubioną aktywność fizyczną. Dobrałem do niej odpowiednią dietę w porozumieniu z rodzicami lub dietetykiem.'),
          ],
        ),

        RankGroupData(
          title: 'Zaradność życiowa',
          icon: RankData.iconZaradnosc,
          taskData: [
            RankTaskData(text: 'Wykonałem przedmiot użyteczny w działaniach drużyny lub szczepu.'),
          ],
        ),

        RankGroupData(
          title: 'Ekologia',
          icon: RankData.iconEkologia,
          taskData: [
            // TODO: Zmienić ten punkt na coś normalnego.
            /* RankTaskData(text: 'Dowiedziałem się czym jest globalne ocieplenie, jakie są jego przyczyny oraz prognozowane konsekwencje.'
                ' Poznałem pojęcie śladu węglowego, opowiedziałem o stosowanych we własnym życiu działaniach na rzecz jego zmniejszania (np.: dojeżdżanie do szkoły rowerem lub komunikacją miejską, stosowanie różnych sposobów oszczędzania energii).'
                ' W trakcie trwania próby wyrobiłem w sobie nowy nawyk zmniejszający emisję gazów cieplarnianych.'), */
            RankTaskData(text: 'Poznałem teorię "globalnego ocieplenia" i rozumiem jego złożoność. Zrozumiałem konsekwencje pochopnych propozycji rozwiązań.'
                '\n\nW trakcie trwania próby wyrobiłem w sobie nowy nawyk oszczędzania zasobów Ziemi.'),

            RankTaskData(text: 'Opowiem o jednej dziedzinie specjalizacji potrzebnej do próby rozwiązania problemu "globalnego ocieplenia".'
                '\n\nZapoznałem się z jedną historyczną prognozą zmian klimatu i jej trafnością. Podchodzę krytycznie do katastroficznych wizji przyszłości. Wiem czym jest tzw. “depresja klimatyczna”.'),

            RankTaskData(text: 'Dowiedziałem się, jaki wpływ na środowisko wywieram podczas wypraw, wycieczek, obozów, biwaków na łonie przyrody. Poznałem podstawowe techniki minimalizacji tego wpływu. Skompletowałem własny ekwipunek, posiadając przynajmniej jedną pomocną w tym rzecz (np.: sprzęt do hamakowania, wielorazowy worek na resztki/odpady, worki lub pojemniki zabezpieczające żywność przed dostępem dzikich zwierząt, sprzęt do gotowania, składana miska do mycia).'),
          ],
        ),

        RankGroupData(
          title: 'Świat cyfrowy',
          icon: RankData.iconSwiatCyfrowy,
          taskData: [
            RankTaskData(text: 'Wykonałem jedno z zadań:'
                '\n\n• Dokonałem edycji zdjęć (np. z wyjazdu drużyny) w programie do edycji grafiki rastrowej: naniesienie logo drużyny, wykadrowanie zdjęcia, korekcja błędów, zmiana jasności, kontrastu lub nasycenia kolorów. Moje harcerskie projekty są zgodnie z Katalogiem Identyfikacji Wizualnej ZHP.'
                '\n• Przygotowałem dokumenty z wykorzystaniem zaawansowanych funkcji edytora tekstu (np.: nagłówek i stopka, interlinia, zapis równania i symboli matematycznych, przypisy, kolumny, wstawianie komentarzy, opracowanie własnego stylu, korzystanie z tzw. twardych spacji i podziałów strony).'),
          ],
        ),

        RankGroupData(
          title: 'Ekonomia',
          icon: RankData.iconEkonomia,
          taskData: [
            RankTaskData(text: 'Wykonałem jedno z poniższych zadań:'
                '\n\n• Przygotowałem plan finansowy biwaku, rajdu, wycieczki lub innego przedsięwzięcia harcerskiego. Rozliczyłem go w ramach uzyskanej zaliczki jednocześnie weryfikując w ramach tego rozliczenia realizację zakładanego budżetu.'
                '\n\n• Zebrałem informacje o dostępnych dla młodzieży ofertach różnych banków i przeanalizowałem oferowane w ramach nich usługi i produkty. Na podstawie dokonanej analizy założyłem konto bankowe lub dokonałem oceny warunków banku, w którym posiadam rachunek, z innymi zebranymi ofertami.'),
          ],
        ),

        RankGroupData(
          title: 'Żywienie',
          icon: RankData.iconZywienie,
          taskData: [
            RankTaskData(text: 'Ugotowałem co najmniej po dwie różne zupy, drugie dania i desery (niekoniecznie jednego dnia) wykorzystując różne sposoby przygotowania, np.: pieczenie, smażenie, duszenie, gotowanie. Nakryłem do stołu z okazji uroczystego posiłku, korzystając z zastawy, sztućców, serwetek, wybranych elementów dekoracyjnych (np.: świece, kwiaty, obrus).'),
          ],
        ),
      ]
    )
  ]
);
RankZHPSim2022 rankZhp4 = rankZhp4Data.build();

const String rankZhp5Id = 'HARC_5_SIM_2022';
RankZHPSim2022Data rankZhp5Data = RankZHPSim2022Data(
  titleMale: 'Harcerz Orli',
  titleFemale: 'Harcerka Orla',
  minWiek: '16 - 19 lat',
  czasTrw: '12 – 18 miesięcy',
  version: 1,

  sprawCount: 1,
  tropCount: 1,
  wyzwCount: 3,
  wyzwCountReq: 1,

  org: Org.zhp,
  id: rankZhp5Id,
  idea: 'Harcerz Orli, czyli wyróżniający się spośród innych, wymagający od siebie więcej, nawet wtedy, kiedy inni od niego nie wymagają. Inspirując się symboliką płomieni wędrowniczej watry pracuje nad swoim ciałem, rozumem i duchem.',
  catData: [
    const RankCatData(
      title: 'Idea',
      icon: RankData.iconCatIdea,
      groupData: [
        RankGroupData(
          title: 'Harcerz Orli działa aktywnie w swoich wspólnotach',
          taskData: [
            RankTaskData(text: 'Podejmuje się służby i wolontariatu, angażuje się w działalność na rzecz społeczności lokalnej. Umiejętnie czerpie z polskiej historii i pielęgnuje polskie tradycje, ale nie żyje przeszłością, a z odwagą patrzy w przyszłość. Godnie reprezentuje Polskę, również, gdy jest za granicą. Rozumie, co oznacza bycie patriotą, świadomie reprezentuje postawę patriotyczną.'),
          ],
        ),
        RankGroupData(
          title: 'Harcerz Orli jest ciekawy świata',
          taskData: [
            RankTaskData(text: 'Chętnie uczy się nowych rzeczy i interesuje się otaczającym go światem. Zna miejsce człowieka w środowisku naturalnym i wyrabia w sobie nawyki związane z jego ochroną. Podchodzi z dystansem do uzyskiwanych informacji i weryfikuje ich źródła. Harcerz Orla rozumie, co oznacza słowo „braterstwo” i akceptuje prawo innych do własnych poglądów oraz decyzji, bez względu na to czy się z nimi zgadza. Wyrabia w sobie własne zdanie i poglądy na różne tematy bazując na pozyskanej wiedzy.'),
          ],
        ),
        RankGroupData(
          title: 'Harcerz Orli jest godny zaufania',
          taskData: [
            RankTaskData(text: 'Relacje międzyludzkie traktuje poważnie i odpowiedzialnie. Dba o więzi ze swoimi bliskimi i przyjaciółmi. Odnosi się z szacunkiem do swoich rodziców, opiekunów i przełożonych – ufa im i stara się zrozumieć ich decyzje. Umiejętnie godzi i równoważy obowiązki wynikające z pełnienia różnych ról społecznych. Rozumie potrzebę istnienia regulacji i przepisów, dlatego ich przestrzega.'),
          ],
        ),
        RankGroupData(
          title: 'Harcerz Orli jest zaradny',
          taskData: [
            RankTaskData(text: 'Rozsądnie gospodaruje swoim czasem i szanuje czas innych. Dba o rzeczy swoje i cudze, w tym także o dobra publiczne. Kiedy w sprawach życia codziennego napotka problem pozyskuje informacje tak długo, aż znajdzie jego rozwiązanie. Podchodzi do tych rozwiązań w sposób kreatywny, wykorzystując zarówno sprawdzone metody jak i osiągnięcia nowych technologii. Wytrwale dąży do rozwiązania problemu, nie poddaje się pomimo przeciwności.'),
          ],
        ),
        RankGroupData(
          title: 'Harcerz Orli dba o siebie',
          taskData: [
            RankTaskData(text: 'Stawia sobie wyzwania, ćwiczy silną wolę i nie zadowala się bylejakością. Zna swoje możliwości w działaniu pod względem wiedzy, umiejętności i wrodzonych predyspozycji, na tej podstawie podejmuje się zobowiązań, którym jest w stanie sprostać. Nie zaniedbuje żadnej z dziedzin życia, uwzględniając także potrzebę odpoczynku i dbania o kondycję fizyczną.'),
          ],
        ),
        RankGroupData(
          title: 'Harcerz Orli dba o hart ducha',
          taskData: [
            RankTaskData(text: 'Rozumie zasady zawarte w Prawie Harcerskim, kierując się nim buduje swoją hierarchię wartości. Harcerz Orli posiada przemyślany stosunek do wiary. Potrafi wyrazić swoje zdanie, nawet jeśli rozmówcy mają odmienne. Broni go używając rzeczowych argumentów. Harcerz Orli zachowuje umiarkowanie w każdym swoim działaniu, np. kontroluje czas spędzany przed ekranem. Nie korzysta z żadnych używek prawnie niedozwolonych w jego wieku ani żadnych nielegalnych środków odurzających (w tym dopalaczy) ponieważ wie, w jaki sposób niszczą jego organizm.'),
          ],
        ),
      ]
    ),
    const RankCatData(
      title: 'Zadania',
      icon: RankData.iconCatStopZadania,
        groupData: [
        RankGroupData(
          title: 'Tożsamość harcerska',
          icon: RankData.iconTozsHarcerska,
          taskData: [
            RankTaskData(text: 'Przekazałem młodszym członkom mojego środowiska harcerskiego wiedzę o jego tradycjach w ciekawej formie.'),
          ],
        ),
        RankGroupData(
          title: 'Obozownictwo',
          icon: RankData.iconObozow,
          taskData: [
            RankTaskData(text: 'Wziąłem udział w przygotowaniu obozu np.: planowaniu preliminarza, przygotowaniu sprzętu, organizacji transportu, zaplanowaniu zakupów żywieniowych. Poznałem zasady prowadzenia gospodarczej dokumentacji obozu i pod nadzorem kwatermistrza pomogłem ją prowadzić.'),
          ],
        ),
        RankGroupData(
          title: 'Ratownictwo',
          icon: RankData.iconPierwszaPomoc,
          taskData: [
            RankTaskData(text: 'Przeszedłem co najmniej 15‐godzinne szkolenie z zakresu pierwszej pomocy. Wykorzystałem zdobyte umiejętności do pełnienia służby na rzecz własnego środowiska lub na zewnątrz organizacji'),
          ],
        ),
        RankGroupData(
          title: 'Zdrowie',
          icon: RankData.iconZdrowie,
          taskData: [
            RankTaskData(text: 'Zaplanowałem i zorganizowałem długotrwały wysiłek fizyczny o charakterze wyczynu i dobrałem dostosowaną do niego dietę. W miarę możliwości uzyskałem dla swojego pomysłu akceptację profesjonalisty.'),
          ],
        ),
        RankGroupData(
          title: 'Ekologia',
          icon: RankData.iconEkologia,
          taskData: [
            RankTaskData(text: 'Poznałem podstawowe problemy związane z dostępem do wody pitnej (w tym jej niedoboru) na świecie i w Polsce. Poznałem różne sposoby pozyskania lub uzdatniania wody pitnej w terenie (destylacja, filtry osobiste, filtracja i uzdatnianie chemiczne itp.). Podczas wędrówki zastosowałem jeden z nich.'),
            RankTaskData(text: 'Znam i stosuję zasady ekologicznego obozowania. Wdrażam w nie młodszych od siebie harcerzy, pomagając im w ekologicznym obozowaniu lub biwakowaniu.')
          ],
        ),
        RankGroupData(
          title: 'Ekologia',
          icon: RankData.iconEkologia,
          taskData: [
            RankTaskData(text: 'Poznałem podstawowe problemy związane z dostępem do wody pitnej (w tym jej niedoboru) na świecie i w Polsce. Poznałem różne sposoby pozyskania lub uzdatniania wody pitnej w terenie (destylacja, filtry osobiste, filtracja i uzdatnianie chemiczne itp.). Podczas wędrówki zastosowałem jeden z nich.'),
          ],
        ),
        RankGroupData(
          title: 'Świat cyfrowy',
          icon: RankData.iconSwiatCyfrowy,
          taskData: [
            RankTaskData(text: 'Znam pojęcie hejtu i uczestniczyłem w projekcie lub kampanii, która miała wpływ na ograniczenie tego zjawiska w sieci.'),
          ],
        ),
        RankGroupData(
          title: 'Ekonomia',
          icon: RankData.iconEkonomia,
          taskData: [
            RankTaskData(text: 'Zidentyfikowałem swoje predyspozycje zawodowe korzystając z pomocy doradcy zawodowego lub wybranego kwestionariusza.'),
          ],
        ),
      ]
    )
  ]
);
RankZHPSim2022 rankZhp5 = rankZhp5Data.build();

const String rankZhp6Id = 'HARC_6_SIM_2022';
RankZHPSim2022Data rankZhp6Data = RankZHPSim2022Data(
  titleMale: 'H-rz Rzeczypospolitej',
  titleFemale: 'H-ka Rzeczypospolitej',
  minWiek: '18 - 21 lat',
  czasTrw: '12 – 24 miesiące',
  version: 1,

  sprawCount: 0,
  tropCount: 0,
  wyzwCount: 0,

  org: Org.zhp,
  id: rankZhp6Id,
  idea: 'Harcerz Rzeczypospolitej, czyli dojrzały człowiek i świadomy obywatel, ten, który dba o siebie i innych. Inspirując się symboliką wędrowniczej watry szuka swojego miejsca w społeczeństwie, wychodzi w świat i szuka miejsca, w którym może pomóc innym - podejmuje się służby, a także pracuje nad sobą - swoim duchem, ciałem oraz umysłem.',
  catData: [
    const RankCatData(
        title: 'Idea',
        icon: RankData.iconCatIdea,
        groupData: [
          RankGroupData(
            title: 'Harcerz Rzeczypospolitej działa aktywnie w swoich wspólnotach',
            taskData: [
              RankTaskData(text: 'Umie zidentyfikować potrzeby swojego otoczenia i podejmuje działania, aby je zaspokoić. Jest świadomym obywatelem. Harcerz Rzeczypospolitej buduje partnerskie relacje z rodziną i bliskimi będące wyrazem szacunku i zaufania do nich.',),
            ]
          ),
          RankGroupData(
            title: 'Harcerz Rzeczypospolitej jest ciekawy świata',
            taskData: [
              RankTaskData(text: 'Zna swoje korzenie i historię swojego państwa oraz swojej małej ojczyzny. Wie, kto przyczynił się do rozwoju Polski. Ma świadomość, że na rozwój kraju mają wpływ wszyscy obywatele, również innych narodowości czy wyznania innego niż dominujące. Reaguje na złe zachowania osób wokół siebie, sprzeciwia się przejawom dyskryminowaniu innych osób. Jest otwarty na świat i innych ludzi.'),
            ]
          ),
          RankGroupData(
              title: 'Harcerz Rzeczypospolitej jest godny zaufania',
              taskData: [
                RankTaskData(text: 'Nie unika odpowiedzialności za własne postępowanie, w tym popełnione błędy, których skutki stara się naprawić. Identyfikuje się z zasadami obowiązującymi w ZHP, w tym Prawem i Przyrzeczeniem Harcerskim. Harcerz Rzeczypospolitej zna zagrożenia dla środowiska i orientuje się w najważniejszych problemach z nimi związanych. Wie, jak może im przeciwdziałać, podejmuje działanie na rzecz ochrony przyrody i zachęca do tego innych. Odpowiedzialnie podchodzi do pełnionych ról społecznych, jak i tych, których ma się podjąć. Dba nie tylko o siebie, ale również o innych. W relacjach z bliskimi wyraża się otwarcie, nie udaje kogoś, kim nie jest. Utrzymuje z nimi stałe więzi.',),
              ]
          ),
          RankGroupData(
              title: 'Harcerz Rzeczypospolitej jest zaradny i gospodarny',
              taskData: [
                RankTaskData(text: 'Sam diagnozuje swoje problemy i szuka sposobów ich rozwiązania. Świadomie kreuje swoje życie oraz rozsądnie podejmuje się wyzwań i pól służby. Stawia sobie ambitne i możliwe do realizacji cele życiowe, a później konsekwentnie dąży do ich osiągnięcia. Kieruje się właściwie wyznaczonymi priorytetami oraz rzetelną oceną możliwości. Harcerz Rzeczypospolitej dąży do osiągania dochodów potrzebnych do zaspokojenia jego potrzeb życiowych. Jest przedsiębiorczy i racjonalnie wydatkuje zgromadzone przez siebie środki. Bazując na zgromadzonej wiedzy poszukuje i wdraża innowacyjne rozwiązania oraz pomysły w życie.',),
              ]
          ),
          RankGroupData(
              title: 'Harcerz Rzeczypospolitej dba o siebie',
              taskData: [
                RankTaskData(text: 'Stale poszerza swoje horyzonty, chętnie czerpiąc wiedzę z różnych źródeł (książek, reportaży i analiz, badań naukowych itp.). Rozwija swoje pasje i zainteresowania dążąc do mistrzostwa. Zdobyte doświadczenie i umiejętności przekuwa w certyfikaty przydatne w życiu zawodowym. Dba o swoje zdrowie (m.in. uprawia regularnie sport, poddaje się badaniom okresowym, zdrowo się odżywia).',),
              ]
          ),
          RankGroupData(
              title: 'Harcerz Rzeczypospolitej dba o hart ducha',
              taskData: [
                RankTaskData(text: 'Świadomie kształtuje swój światopogląd i wie z czego on wynika. Harcerz Rzeczypospolitej potrafi wyjaśnić swój stosunek do wiary. Jego myśli, słowa i czyny są spójne. Potrafi przemyśleć swoje zachowanie, wyciągnąć wnioski i jeśli jest taka potrzeba podjąć działania zmierzające do zmiany. Wyciąga wnioski zarówno ze swoich sukcesów, jak i porażek. Stara się zrozumieć poglądy innych osób, co oznacza, że nie wznosi murów, tylko buduje mosty. Potrafi wyrazić swoją opinię, gdy myśli inaczej niż przełożony, w swoim posłuszeństwie nie przekracza granicy przepisów prawa i norm moralnych. Harcerz Rzeczypospolitej ma świadomość, że abstynencja jest dobrym sposobem unikania nałogów. Harcerz Rzeczypospolitej rozumie konsekwencje i delikatną naturę kontaktów intymnych.',),
              ]
          ),
        ]),
    const RankCatData(
      title: 'Zadania',
      icon: RankData.iconCatStopZadania,
      groupData: [
        RankGroupData(
          title: 'Wyzwanie',
          taskData: [
            RankTaskData(
              text: 'Przynajmniej jedno wyzwanie wynikające z idei stopnia.',
            ),
          ],
        ),
        RankGroupData(
          title: 'Mistrzowskie zadanie rozwoju zawodowego',
          taskData: [
            RankTaskData(
              text: 'Przynajmniej jedno zadanie mistrzowskie, związane z wybranym przez Ciebie kierunkiem rozwoju zawodowego.',
            ),
          ],
        ),
        RankGroupData(
          title: 'Zadanie uzupełniające',
          taskData: [
            RankTaskData(
              text: 'Przynajmniej jedno zadanie uzupełniające, wynikające z idei stopnia.',
            ),
          ],
        ),
        RankGroupData(
          title: 'Slużba',
          taskData: [
            RankTaskData(
              text: 'Zadanie związane z zainicjowaniem i podjęciem na czas trwania próby służby w wybranym obszarze.'
                  '\nUpewnij się, czy wybrany przez Ciebie kierunek jest wynikiem analizy potrzeb otoczenia.',
            ),
          ],
        ),
      ]
    )
  ]
);
RankZHPSim2022 rankZhp6 = rankZhp6Data.build();
