
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/chord.dart';
import 'package:harcapp_core/dimen.dart';


class Fretboard extends StatelessWidget{

  static const fingerColor = Color.fromARGB(255, 40, 184, 166);

  final double height;
  final int stringCount;
  final Chord chord;

  final Function? onTap;

  final int nearestDotPosition;

  const Fretboard(this.height, this.stringCount, this.onTap, this.chord, this.nearestDotPosition, {super.key});

  static Fretboard from({required double height, required int stringCount, Function? onTap, Chord? chord}){
    int nearestDotPosition = 0;

    if(chord!=null) {
      nearestDotPosition = chord.nearestDotPosition;
      chord = chord.shiftToFirstDot();
    }

    return Fretboard(height, stringCount, onTap, chord??const EmptyChord(), nearestDotPosition);
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(int i=0; i<stringCount; i++){
      children.add(
        Stack(children: <Widget>[
          SizedBox(
            height: height/stringCount,
            width: double.infinity,
            child: Center(child: Container(
              decoration: ShadowDecoration(shadowColor: Colors.black26, offset: const Offset(0, 4)),
              child: Container(
                width: double.infinity,
                height: (i+1).toDouble(),
                color: Colors.amberAccent,
              ),
            ),
          )),
          Row(
            children: <Widget>[
              Expanded(
                child: chord.strings[stringCount-i-1]==1?RoundContainer(height/stringCount, color: fingerColor, text: '${0+nearestDotPosition}',):Container(),
              ),
              Expanded(
                child: chord.strings[stringCount-i-1]==2?RoundContainer(height/stringCount, color: fingerColor, text: '${1+nearestDotPosition}'):Container(),
              ),
              Expanded(
                child: chord.strings[stringCount-i-1]==3?RoundContainer(height/stringCount, color: fingerColor, text: '${2+nearestDotPosition}'):Container(),
              ),
              Expanded(
                child: chord.strings[stringCount-i-1]==4?RoundContainer(height/stringCount, color: fingerColor, text: '${3+nearestDotPosition}'):Container(),
              )
            ],
          )
        ],),
      );
    }

    return AppCard(
      radius: AppCard.bigRadius,
        padding: EdgeInsets.all(Dimen.defMarg/2),
        color: Colors.brown,
        onTap: onTap as void Function()?,
        elevation: AppCard.bigElevation,
        margin: const EdgeInsets.only(
          left: AppCard.normMargVal,
          right: AppCard.normMargVal,
          bottom: AppCard.normMargVal,
        ),
        child: Stack(children: <Widget>[

          SizedBox(
            height: height,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 6,
                        color: Colors.grey[400],
                      ),)
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 6,
                        color: Colors.grey[400],
                      ),)
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 6,
                        color: Colors.grey[400],
                      ),)
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 6,
                        color: Colors.grey[400],
                      ),)
                )
              ],
            ),
          ),

          Positioned(
            bottom: 2, right: 2,
            child: RotatedBox(
              quarterTurns: 3,
              child: AutoSizeText(
                chord.name,
                style: AppTextStyle(
                  fontSize: 64.0,
                  color: Colors.white70,
                  fontWeight: weight.bold
                ),
              ),
            ),
          ),



          Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),

          SizedBox(
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                chord.bar==1?Expanded(child: RoundContainer(height, width: height/stringCount, color: fingerColor, text: '${0+nearestDotPosition}'),):Expanded(child: Container()),
                chord.bar==2?Expanded(child: RoundContainer(height, width: height/stringCount, color: fingerColor, text: '${1+nearestDotPosition}'),):Expanded(child: Container()),
                chord.bar==3?Expanded(child: RoundContainer(height, width: height/stringCount, color: fingerColor, text: '${2+nearestDotPosition}'),):Expanded(child: Container()),
                chord.bar==4?Expanded(child: RoundContainer(height, width: height/stringCount, color: fingerColor, text: '${3+nearestDotPosition}'),):Expanded(child: Container()),
              ],
            ),
          )
        ])
    );
  }
}

class RoundContainer extends StatelessWidget{

  final double height;
  final double width;
  final Color color;
  final String? text;
  const RoundContainer(
      this.height,
      { this.width = -1,
        this.color = Colors.black,
        this.text,
        super.key
      });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: width==-1?height:width,
          height: height,
          decoration: BoxDecoration(
              color: color,
              boxShadow: [ShadowDecoration.boxShadowDef(shadowColor: Colors.black26, offset: const Offset(0, 4))],
              borderRadius: BorderRadius.circular(height/2)),
          child: text==null?Container():Center(child: Text(text!, style: AppTextStyle(color: Colors.white, fontWeight: weight.halfBold))),
        )
    );
  }
}