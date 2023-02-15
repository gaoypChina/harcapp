import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/chwyty/transposition_part.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/instrument_type.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/chord.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'all_chords_widget.dart';
import 'common.dart';

class ChwytyFragment extends StatefulWidget {

  const ChwytyFragment({super.key});

  @override
  State createState() => ChwytyFragmentState();

}

class ChwytyFragmentState extends State<ChwytyFragment> with ModuleStatsMixin {

  @override
  String get moduleId => ModuleStatsMixin.chwyty;

  late KeyboardVisibilityController keyboardVisibilityController;

  @override
  void initState() {

    keyboardVisibilityController = KeyboardVisibilityController();

    keyboardVisibilityController.onChange.listen((bool visible){
      if(mounted) setState((){/*KeyboardVisibility.isVisible*/});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) => FretboardProvider(),
      builder: (context, child) => DefaultTabController(
          length: 2,
          child: BottomNavScaffold(
              appBar: AppBar(
                backgroundColor: background_(context),
                elevation: 0,
                title: const Text('Chwyty'),
                centerTitle: true,
                actions: <Widget>[

                  SimpleButton(
                    padding: EdgeInsets.only(left: AppCard.defPadding.left, right: AppCard.defPadding.right),
                    child: Row(children: <Widget>[
                      const Icon(MdiIcons.guitarPickOutline,),
                      const SizedBox(width: Dimen.defMarg),
                      SizedBox(
                        width: 52,
                        child: Consumer<FretboardProvider>(
                          builder: (context, prov, child) => AnimatedChildSlider(
                            index: prov.type==InstrumentType.GUITAR?0:(prov.type==InstrumentType.UKULELE?1:2),
                            children: [
                              Text('Gitara', style: AppTextStyle(color: iconEnab_(context), fontWeight: weight.halfBold)),
                              Text('Ukulele', style: AppTextStyle(color: iconEnab_(context), fontWeight: weight.halfBold)),
                              Text('Mando-lina', style: AppTextStyle(color: iconEnab_(context), fontWeight: weight.halfBold)),
                            ],
                          ),
                        ),
                      )
                    ],),
                    onTap: () => Provider.of<FretboardProvider>(context, listen: false).changeGuitType(),
                  ),
                ],
                bottom: TabBar(
                  physics: const BouncingScrollPhysics(),
                  tabs: const [
                    Tab(text: 'Tonacja'),
                    Tab(text: 'Chwyty'),
                  ],
                  indicator: AppTabBarIncdicator(context: context),
                ),
              ),
              body: Column(
                children: [

                  const Expanded(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      children: [

                        TranspositionPart(),
                        AllChordsWidget(),
                      ],
                    ),
                  ),

                  if(!keyboardVisibilityController.isVisible)
                    Consumer<FretboardProvider>(
                        builder: (context, prov, child) => AnimatedChildSlider(
                          direction: Axis.horizontal,
                          index: prov.type==InstrumentType.GUITAR?0:(prov.type==InstrumentType.UKULELE?1:2),
                          children: [
                            Fretboard.from(
                                height: 144,
                                stringCount: 6,
                                chord: prov.guitChord,
                                onTap: () => prov.nextChordVariant()
                            ),

                            Fretboard.from(
                                height: 144,
                                stringCount: 4,
                                chord: prov.ukulChord
                            ),

                            Fretboard.from(
                                height: 144,
                                stringCount: 4,
                                chord: prov.mandChord
                            )
                          ],
                        )
                    ),

                ],
              )
          )
      ),
    );
  }

}

class FretboardProvider extends ChangeNotifier{

  InstrumentType _type;
  InstrumentType get type => _type;

  void changeGuitType(){
    _type = nextInstrumentType(_type);
    notifyListeners();
  }

  List<GChord> _guitChords;
  List<GChord> get guitChords => _guitChords;

  int chordDispIdx;

  GChord? get guitChord =>
      _guitChords.isEmpty?
      GChord.empty:
      _guitChords[chordDispIdx];

  set guitChord(GChord? value){
    _guitChords = value == null?[]:GChord.chordDrawableMap[value.name]!;
    notifyListeners();
  }

  void nextChordVariant(){
    chordDispIdx = guitChords.isEmpty?0:(chordDispIdx + 1)%guitChords.length;
    notifyListeners();
  }

  UChord? _ukulChord;
  UChord? get ukulChord => _ukulChord;
  set ukulChord(UChord? value){
    _ukulChord = value;
    notifyListeners();
  }

  MChord? _mandChord;
  MChord? get mandChord => _mandChord;
  set mandChord(MChord? value){
    _mandChord = value;
    notifyListeners();
  }

  FretboardProvider():
    _type = InstrumentType.GUITAR,
    _guitChords = [],
    chordDispIdx = 0,

    _ukulChord = UChord.empty,
    _mandChord = MChord.empty;

}