
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/auto_size_text.dart';
import 'package:harcapp/_common_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/chord.dart';
import 'package:harcapp_core/dimen.dart';


class Fretboard extends StatelessWidget{

  final double height;
  final int stringCount;
  final Chord chord;

  final Function onTap;

  final int nearestDotPosition;

  const Fretboard(this.height, this.stringCount, this.onTap, this.chord, this.nearestDotPosition);

  static Fretboard from({@required double height, @required int stringCount, Function onTap, Chord chord}){
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
          Container(
            height: height/stringCount,
            width: double.infinity,
            child: Center(child: Container(
              child: Container(
                width: double.infinity,
                height: (i+1).toDouble(),
                color: Colors.amberAccent,
              ),
              decoration: ShadowDecoration(shadowColor: Colors.black26, offset: Offset(0, 4)),
            ),
          )),
          Row(
            children: <Widget>[
              Expanded(
                child: chord.strings[stringCount-i-1]==1?RoundContainer(height/stringCount, color: ColorPackOrange().accentColor, text: '${0+nearestDotPosition}',):Container(),
              ),
              Expanded(
                child: chord.strings[stringCount-i-1]==2?RoundContainer(height/stringCount, color: ColorPackOrange().accentColor, text: '${1+nearestDotPosition}'):Container(),
              ),
              Expanded(
                child: chord.strings[stringCount-i-1]==3?RoundContainer(height/stringCount, color: ColorPackOrange().accentColor, text: '${2+nearestDotPosition}'):Container(),
              ),
              Expanded(
                child: chord.strings[stringCount-i-1]==4?RoundContainer(height/stringCount, color: ColorPackOrange().accentColor, text: '${3+nearestDotPosition}'):Container(),
              )
            ],
          )
        ],),
      );
    }

    return AppCard(
      radius: AppCard.BIG_RADIUS,
        padding: EdgeInsets.all(Dimen.DEF_MARG/2),
        color: Colors.brown,
        onTap: onTap,
        elevation: AppCard.bigElevation,
        margin: EdgeInsets.only(
          left: AppCard.NORM_MARGIN_VAL,
          right: AppCard.NORM_MARGIN_VAL,
          bottom: AppCard.NORM_MARGIN_VAL,
        ),
        child: Stack(children: <Widget>[

          Container(
            height: height,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Align(
                      child: Container(
                        width: 6,
                        color: Colors.grey[400],
                      ),
                      alignment: Alignment.centerLeft,)
                ),
                Expanded(
                    child: Align(
                      child: Container(
                        width: 6,
                        color: Colors.grey[400],
                      ),
                      alignment: Alignment.centerLeft,)
                ),
                Expanded(
                    child: Align(
                      child: Container(
                        width: 6,
                        color: Colors.grey[400],
                      ),
                      alignment: Alignment.centerLeft,)
                ),
                Expanded(
                    child: Align(
                      child: Container(
                        width: 6,
                        color: Colors.grey[400],
                      ),
                      alignment: Alignment.centerLeft,)
                )
              ],
            ),
          ),

          Positioned(
            bottom: 2, right: 2,
            child: RotatedBox(
              child: AutoSizeText(
                chord.name,
                style: AppTextStyle(
                  fontSize: 64.0,
                  color: Colors.white70,
                  fontWeight: weight.bold
                ),
              ),
              quarterTurns: 3,
            ),
          ),



          Column(
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),

          Container(
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                chord.bar==1?Expanded(child: RoundContainer(height, width: height/stringCount, color: ColorPackOrange().accentColor, text: '${0+nearestDotPosition}'),):Expanded(child: Container()),
                chord.bar==2?Expanded(child: RoundContainer(height, width: height/stringCount, color: ColorPackOrange().accentColor, text: '${1+nearestDotPosition}'),):Expanded(child: Container()),
                chord.bar==3?Expanded(child: RoundContainer(height, width: height/stringCount, color: ColorPackOrange().accentColor, text: '${2+nearestDotPosition}'),):Expanded(child: Container()),
                chord.bar==4?Expanded(child: RoundContainer(height, width: height/stringCount, color: ColorPackOrange().accentColor, text: '${3+nearestDotPosition}'),):Expanded(child: Container()),
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
  final String text;
  const RoundContainer(this.height, {this.width: -1, this.color:Colors.black, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Container(
            width: width==-1?height:width,
            height: height,
            child: text==null?Container():Center(child: Text(text, style: AppTextStyle(color: Colors.white, fontWeight: weight.halfBold))),
            decoration: BoxDecoration(
                color: color,
                boxShadow: [ShadowDecoration.boxShadowDef(shadowColor: Colors.black26, offset: Offset(0, 4))],
                borderRadius: BorderRadius.all(Radius.circular(height/2))),
          ),
        )
    );
  }
}