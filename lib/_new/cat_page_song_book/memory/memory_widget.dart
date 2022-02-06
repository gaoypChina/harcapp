
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../song_management/memory.dart';

class MemoryWidget extends StatefulWidget {

  static const String MEMORY_DATE_TAG = 'MEMORY_DATE_TAG';
  static const String MEMORY_PLACE_TAG = 'MEMORY_PLACE_TAG';
  static const String MEMORY_DESC_TAG = 'MEMORY_DESC_TAG';

  final Memory memory;
  final fontIndex;
  final bool showShare;
  final Function onTap;
  final Function onLongPress;
  final bool withHero;

  const MemoryWidget(this.memory, {this.fontIndex, this.showShare=true, this.onTap, this.onLongPress, this.withHero=true});

  @override
  State<StatefulWidget> createState() => MemoryWidgetState();

}

class MemoryWidgetState extends State<MemoryWidget> {

  Memory get memory => widget.memory;
  int get fontIndex => widget.fontIndex;

  @override
  Widget build(BuildContext context) {

    Widget textDate = Text(
        dateToString(memory.date),
        style: TextStyle(
            color: iconEnab_(context),
            fontFamily: '${Memory.fontName}${fontIndex??memory.fontIndex}',
            fontSize: Dimen.TEXT_SIZE_BIG*Memory.FONT_SIZE_RATIO_MAP[fontIndex??memory.fontIndex]
        )
    );

    Widget textPlace = Text(
        '${memory.place}${memory.desc.isNotEmpty?',':''}',
        style: TextStyle(
            color: iconEnab_(context),
            fontFamily: '${Memory.fontName}${fontIndex??memory.fontIndex}',
            fontSize: Dimen.TEXT_SIZE_BIG*Memory.FONT_SIZE_RATIO_MAP[fontIndex??memory.fontIndex]
        )
    );

    Widget textDesc = Text(
        memory.desc,
        style: TextStyle(
            color: iconEnab_(context),
            fontFamily: '${Memory.fontName}${fontIndex??memory.fontIndex}',
            fontSize: Dimen.TEXT_SIZE_BIG*Memory.FONT_SIZE_RATIO_MAP[fontIndex??memory.fontIndex]
        ),
        textAlign: TextAlign.end
    );

    return SimpleButton(
      radius: AppCard.BIG_RADIUS,
      padding: EdgeInsets.all(Dimen.ICON_MARG),
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Icon(MdiIcons.shareOutline, color: (memory.published&&widget.showShare)?hintEnab_(context):Colors.transparent,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[

                    widget.withHero?
                    Hero(
                        tag: MemoryWidget.MEMORY_DATE_TAG,
                        child: Material(
                          color: Colors.transparent,
                          child: textDate,
                        )
                    ):textDate,

                    if(memory.place.isNotEmpty)
                      widget.withHero?Hero(
                          tag: MemoryWidget.MEMORY_PLACE_TAG,
                          child: Material(
                            color: Colors.transparent,
                            child: textPlace,
                          )
                      ):textPlace,

                    if(memory.desc.isNotEmpty)
                      SizedBox(height: 10.0),

                    if(memory.desc.isNotEmpty)
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child:
                          widget.withHero?Hero(
                              tag: MemoryWidget.MEMORY_DESC_TAG,
                              child: Material(
                                color: Colors.transparent,
                                child: textDesc,
                              )
                          ):textDesc
                      ),

                  ],
                ),
              ),

            ],
          )
      ),
    );
  }

}