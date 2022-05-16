
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../song_management/memory.dart';

class MemoryWidget extends StatefulWidget {

  static String memoryDateHeroTagFrom(String? memoryFileName) => 'MEMORY_DATE_TAG\$$memoryFileName';
  static String memoryPlaceHeroTagFrom(String? memoryFileName) => 'MEMORY_PLACE_TAG\$$memoryFileName';
  static String memoryDescHeroTagFrom(String? memoryFileName) => 'MEMORY_DESC_TAG\$$memoryFileName';

  final Memory memory;
  final int? fontIndex;
  final bool showShare;
  final Function? onTap;
  final Function? onLongPress;
  final bool withHero;

  const MemoryWidget(this.memory, {this.fontIndex, this.showShare=true, this.onTap, this.onLongPress, this.withHero=true, super.key});

  @override
  State<StatefulWidget> createState() => MemoryWidgetState();

}

class MemoryWidgetState extends State<MemoryWidget> {

  Memory get memory => widget.memory;
  int? get fontIndex => widget.fontIndex;

  @override
  Widget build(BuildContext context) {

    Widget textDate = Text(
        dateToString(memory.date!),
        style: TextStyle(
            color: iconEnab_(context),
            fontFamily: '${Memory.fontName}${fontIndex??memory.fontIndex}',
            fontSize: Dimen.TEXT_SIZE_BIG*Memory.fontSizeRatioMap[fontIndex??memory.fontIndex]!
        )
    );

    Widget textPlace = Text(
        '${memory.place}${memory.desc!.isNotEmpty?',':''}',
        style: TextStyle(
            color: iconEnab_(context),
            fontFamily: '${Memory.fontName}${fontIndex??memory.fontIndex}',
            fontSize: Dimen.TEXT_SIZE_BIG*Memory.fontSizeRatioMap[fontIndex??memory.fontIndex]!,
        ),
        textAlign: TextAlign.end,
    );

    Widget textDesc = Text(
        memory.desc!,
        style: TextStyle(
            color: iconEnab_(context),
            fontFamily: '${Memory.fontName}${fontIndex??memory.fontIndex}',
            fontSize: Dimen.TEXT_SIZE_BIG*Memory.fontSizeRatioMap[fontIndex??memory.fontIndex]!
        ),
        textAlign: TextAlign.end
    );

    return SimpleButton(
      radius: AppCard.BIG_RADIUS,
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      onTap: widget.onTap as void Function()?,
      onLongPress: widget.onLongPress as void Function()?,
      child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
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
                        tag: MemoryWidget.memoryDateHeroTagFrom(memory.fileName),
                        child: Material(
                          color: Colors.transparent,
                          child: textDate,
                        )
                    ):textDate,

                    if(memory.place!.isNotEmpty)
                      const SizedBox(height: 4.0),

                    if(memory.place!.isNotEmpty)
                      widget.withHero?Hero(
                          tag: MemoryWidget.memoryPlaceHeroTagFrom(memory.fileName),
                          child: Material(
                            color: Colors.transparent,
                            child: textPlace,
                          )
                      ):textPlace,

                    if(memory.desc!.isNotEmpty)
                      const SizedBox(height: 4.0),

                    if(memory.desc!.isNotEmpty)
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child:
                          widget.withHero?Hero(
                              tag: MemoryWidget.memoryDescHeroTagFrom(memory.fileName),
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