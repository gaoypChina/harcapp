
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/chord.dart';
import 'package:harcapp_core/comm_widgets/chord_draw_bar.dart';
import 'package:harcapp_core/comm_widgets/chord_shifter.dart';
import 'package:harcapp_core/comm_widgets/instrument_type.dart';
import 'package:harcapp_core/comm_widgets/text_field_chords.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '_main.dart';

class TranspositionPart extends StatefulWidget{

  final bool? typeGuitar;

  const TranspositionPart({this.typeGuitar});

  @override
  State<StatefulWidget> createState() => TranspositionPartState();

}

class TranspositionPartState extends State<TranspositionPart> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  late String chords;
  int? shift;

  bool get noText => chords.replaceAll('\n', '').isEmpty;

  @override
  void initState() {
    chords = '';
    shift = 2;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [

        Expanded(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [

                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(2*AppCard.normMargVal),
                      child: TextFieldChords(
                        textStyle: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                        maxLines: null, // needed to wrap text, else it's one line.
                        onChanged: (String text) => setState(() => chords = text),
                        decoration: InputDecoration(
                            hintText: 'Chwyty:',
                            hintStyle: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold),
                            border: InputBorder.none,
                            isDense: true
                          //contentPadding: const EdgeInsets.symmetric(vertical: -24.0),
                        ),
                      )
                  ),
                ),

                Expanded(
                  child: AppCard(
                      radius: AppCard.bigRadius,
                      elevation: AppCard.bigElevation,
                      margin: AppCard.normMargin,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SelectableText(
                                noText?'Po transpozycji:':ChordShifter(chords, shift!).getText(true),
                                style: AppTextStyle(
                                  color: noText?hintEnab_(context):textEnab_(context),
                                  fontSize: Dimen.TEXT_SIZE_BIG,
                                  fontWeight: weight.halfBold,
                                ),
                              ),
                            ),
                          ),

                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  icon: const Icon(MdiIcons.chevronDoubleDown),
                                  onPressed: () => setState(() => shift = ChordShifter.shiftToneDown(shift!)),
                                ),
                                Text(shift.toString(), style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
                                IconButton(
                                  icon: const Icon(MdiIcons.chevronDoubleUp),
                                  onPressed: () => setState(() => shift = ChordShifter.shiftToneUp(shift!)),
                                )
                              ]
                          ),

                        ],
                      )
                  ),
                ),

              ]
          ),
        ),

        Consumer<FretboardProvider>(
          builder: (context, prov, child) => ChordDrawBar(
            ChordShifter(chords, shift!).getText(true),
            initType: prov.type,
            changeTypeOnTap: false,
            elevation: 0,
            background: Colors.transparent,
            showLabel: false,
            onTap: (chord, type){
              if(type == InstrumentType.GUITAR)
                prov.guitChord = chord as GChord;
              else if(type == InstrumentType.UKULELE)
                prov.ukulChord = chord as UChord?;
              else if(type == InstrumentType.MANDOLIN)
                prov.mandChord = chord as MChord?;

            },
            key: ValueKey(Tuple2(prov.type, shift)),
          ),
        )

      ],
    );
  }

}