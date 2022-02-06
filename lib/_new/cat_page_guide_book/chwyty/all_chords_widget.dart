import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/chord.dart';
import 'package:harcapp_core/comm_widgets/chord_draw_bar.dart';
import 'package:harcapp_core/comm_widgets/instrument_type.dart';
import 'package:provider/provider.dart';

import '_main.dart';

class AllChordsWidget extends StatefulWidget {

  const AllChordsWidget();

  @override
  State<StatefulWidget> createState() => AllChordsWidgetState();

}

class AllChordsWidgetState extends State<AllChordsWidget> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Consumer<FretboardProvider>(
      builder: (context, prov, child) =>
      prov.type == InstrumentType.GUITAR?
      AllGuitarChordsWidget(
        onTap: (chord) => prov.guitChord = chord
      ):(
      prov.type == InstrumentType.UKULELE?
      AllUkuleleChordsWidget(
          onTap: (chord) => prov.ukulChord = chord
      ):
      AllMandolinChordsWidget(
          onTap: (chord) => prov.mandChord = chord
      )
      )

    );

  }

}

class AllGuitarChordsWidget extends StatelessWidget{

  final void Function(GChord chord) onTap;

  const AllGuitarChordsWidget({this.onTap});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    children.addAll(chordSetToWidgets(context, GChord.C_set));
    children.addAll(chordSetToWidgets(context, GChord.Cis_set));
    children.addAll(chordSetToWidgets(context, GChord.D_set));
    children.addAll(chordSetToWidgets(context, GChord.Dis_set));
    children.addAll(chordSetToWidgets(context, GChord.E_set));
    children.addAll(chordSetToWidgets(context, GChord.F_set));
    children.addAll(chordSetToWidgets(context, GChord.Fis_set));
    children.addAll(chordSetToWidgets(context, GChord.G_set));
    children.addAll(chordSetToWidgets(context, GChord.Gis_set));
    children.addAll(chordSetToWidgets(context, GChord.A_set));
    children.addAll(chordSetToWidgets(context, GChord.B_set));
    children.addAll(chordSetToWidgets(context, GChord.H_set));

    return SingleChildScrollView(
        padding: AppCard.defPadding,
        physics: BouncingScrollPhysics(),
        child: Wrap(
            children: children,
            alignment: WrapAlignment.spaceAround,
        )
    );
    
  }

  List<Widget> chordSetToWidgets(BuildContext context, List<List<GChord>> chordSet){

    return chordSet.map((List<GChord> chords) => ChordWidget.fromGChord(
      chords[0],
      onTap: () => onTap==null?null:onTap(chords[0]),
      color: textEnab_(context),
    )).toList();

  }

}

class AllUkuleleChordsWidget extends StatelessWidget{

  final void Function(UChord chord) onTap;

  const AllUkuleleChordsWidget({this.onTap});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    children.add(chordSetToWidgets(context, UChord.C));
    children.add(chordSetToWidgets(context, UChord.c));
    children.add(chordSetToWidgets(context, UChord.Cis));
    children.add(chordSetToWidgets(context, UChord.cis));
    children.add(chordSetToWidgets(context, UChord.D));
    children.add(chordSetToWidgets(context, UChord.d));
    children.add(chordSetToWidgets(context, UChord.Dis));
    children.add(chordSetToWidgets(context, UChord.dis));
    children.add(chordSetToWidgets(context, UChord.E));
    children.add(chordSetToWidgets(context, UChord.e));
    children.add(chordSetToWidgets(context, UChord.F));
    children.add(chordSetToWidgets(context, UChord.f));
    children.add(chordSetToWidgets(context, UChord.Fis));
    children.add(chordSetToWidgets(context, UChord.fis));
    children.add(chordSetToWidgets(context, UChord.G));
    children.add(chordSetToWidgets(context, UChord.g));
    children.add(chordSetToWidgets(context, UChord.Gis));
    children.add(chordSetToWidgets(context, UChord.gis));
    children.add(chordSetToWidgets(context, UChord.A));
    children.add(chordSetToWidgets(context, UChord.a));
    children.add(chordSetToWidgets(context, UChord.B));
    children.add(chordSetToWidgets(context, UChord.b));
    children.add(chordSetToWidgets(context, UChord.H));
    children.add(chordSetToWidgets(context, UChord.h));

    return SingleChildScrollView(
        padding: AppCard.defPadding,
        physics: BouncingScrollPhysics(),
        child: Wrap(
          children: children,
          alignment: WrapAlignment.spaceAround,
        )
    );

  }

  Widget chordSetToWidgets(BuildContext context, UChord chord){

    return ChordWidget.fromUChord(
      chord,
      onTap: () => onTap==null?null:onTap(chord),
      color: textEnab_(context),
    );

  }

}

class AllMandolinChordsWidget extends StatelessWidget{

  final void Function(MChord chord) onTap;

  const AllMandolinChordsWidget({this.onTap});

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    children.add(chordSetToWidgets(context, MChord.C));
    children.add(chordSetToWidgets(context, MChord.C6));
    children.add(chordSetToWidgets(context, MChord.C7));

    children.add(chordSetToWidgets(context, MChord.c));
    children.add(chordSetToWidgets(context, MChord.c6));
    children.add(chordSetToWidgets(context, MChord.c7));

    children.add(chordSetToWidgets(context, MChord.Cis));
    children.add(chordSetToWidgets(context, MChord.Cis6));
    children.add(chordSetToWidgets(context, MChord.Cis7));

    children.add(chordSetToWidgets(context, MChord.cis));
    children.add(chordSetToWidgets(context, MChord.cis6));
    children.add(chordSetToWidgets(context, MChord.cis7));

    children.add(chordSetToWidgets(context, MChord.D));
    children.add(chordSetToWidgets(context, MChord.D6));
    children.add(chordSetToWidgets(context, MChord.D7));

    children.add(chordSetToWidgets(context, MChord.d));
    children.add(chordSetToWidgets(context, MChord.d6));
    children.add(chordSetToWidgets(context, MChord.d7));

    children.add(chordSetToWidgets(context, MChord.Dis));
    children.add(chordSetToWidgets(context, MChord.Dis6));
    children.add(chordSetToWidgets(context, MChord.Dis7));

    children.add(chordSetToWidgets(context, MChord.dis));
    children.add(chordSetToWidgets(context, MChord.dis6));
    children.add(chordSetToWidgets(context, MChord.dis7));

    children.add(chordSetToWidgets(context, MChord.E));
    children.add(chordSetToWidgets(context, MChord.E6));
    children.add(chordSetToWidgets(context, MChord.E7));

    children.add(chordSetToWidgets(context, MChord.e));
    children.add(chordSetToWidgets(context, MChord.e6));
    children.add(chordSetToWidgets(context, MChord.e7));

    children.add(chordSetToWidgets(context, MChord.F));
    children.add(chordSetToWidgets(context, MChord.F6));
    children.add(chordSetToWidgets(context, MChord.F7));

    children.add(chordSetToWidgets(context, MChord.f));
    children.add(chordSetToWidgets(context, MChord.f6));
    children.add(chordSetToWidgets(context, MChord.f7));

    children.add(chordSetToWidgets(context, MChord.Fis));
    children.add(chordSetToWidgets(context, MChord.Fis6));
    children.add(chordSetToWidgets(context, MChord.Fis7));

    children.add(chordSetToWidgets(context, MChord.fis));
    children.add(chordSetToWidgets(context, MChord.fis6));
    children.add(chordSetToWidgets(context, MChord.fis7));

    children.add(chordSetToWidgets(context, MChord.G));
    children.add(chordSetToWidgets(context, MChord.G6));
    children.add(chordSetToWidgets(context, MChord.G7));

    children.add(chordSetToWidgets(context, MChord.g));
    children.add(chordSetToWidgets(context, MChord.g6));
    children.add(chordSetToWidgets(context, MChord.g7));

    children.add(chordSetToWidgets(context, MChord.Gis));
    children.add(chordSetToWidgets(context, MChord.Gis6));
    children.add(chordSetToWidgets(context, MChord.Gis7));

    children.add(chordSetToWidgets(context, MChord.gis));
    children.add(chordSetToWidgets(context, MChord.gis6));
    children.add(chordSetToWidgets(context, MChord.gis7));

    children.add(chordSetToWidgets(context, MChord.A));
    children.add(chordSetToWidgets(context, MChord.A6));
    children.add(chordSetToWidgets(context, MChord.A7));

    children.add(chordSetToWidgets(context, MChord.a));
    children.add(chordSetToWidgets(context, MChord.a6));
    children.add(chordSetToWidgets(context, MChord.a7));

    children.add(chordSetToWidgets(context, MChord.B));
    children.add(chordSetToWidgets(context, MChord.B6));
    children.add(chordSetToWidgets(context, MChord.B7));

    children.add(chordSetToWidgets(context, MChord.b));
    children.add(chordSetToWidgets(context, MChord.b6));
    children.add(chordSetToWidgets(context, MChord.b7));

    children.add(chordSetToWidgets(context, MChord.H));
    children.add(chordSetToWidgets(context, MChord.H6));
    children.add(chordSetToWidgets(context, MChord.H7));

    children.add(chordSetToWidgets(context, MChord.h));
    children.add(chordSetToWidgets(context, MChord.h6));
    children.add(chordSetToWidgets(context, MChord.h7));

    return SingleChildScrollView(
        padding: AppCard.defPadding,
        physics: BouncingScrollPhysics(),
        child: Wrap(
          children: children,
          alignment: WrapAlignment.spaceAround,
        )
    );

  }

  Widget chordSetToWidgets(BuildContext context, MChord chord){

    return ChordWidget.fromMChord(
      chord,
      onTap: () => onTap==null?null:onTap(chord),
      color: textEnab_(context),
    );

  }

}

class UChordWidget extends StatelessWidget{

  final UChord chord;
  final void Function(bool typeGuitar, UChord chord) onTap;

  UChordWidget(this.chord, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return ChordWidget.fromUChord(
        chord,
        onTap: () => onTap==null?null:onTap(false, chord),
    );
  }

}

class GChordSetWidget extends StatelessWidget{

  final List<List<GChord>> chordSet;
  final void Function(bool typeGuitar, List<GChord> chords, int chordsDispIdx) onTap;

  GChordSetWidget(this.chordSet, {this.onTap});

  @override
  Widget build(BuildContext context) {

    return Wrap(
      alignment: WrapAlignment.spaceAround,
      runAlignment: WrapAlignment.spaceAround,
      children: chordSet.map(
              (List<GChord> chords) =>
              ChordWidget.fromGChord(
                chords[0],
                onTap: () => onTap==null?null:onTap(true, chords, 0),
                color: textEnab_(context),
              )
      ).toList(),
    );

  }

}