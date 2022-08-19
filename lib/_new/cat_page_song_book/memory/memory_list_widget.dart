
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/memory/memory_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp/_new/api/_api.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MemoryListWidget extends StatefulWidget{

  final Song song;
  final ScrollController? controller;

  final Function()? onEditMemoryTap;
  final Function(Memory memory)? onEditMemoryLongPress;
  final Function(Song song)? onNewMemoryTap;

  const MemoryListWidget(
      this.song,
      this.controller,
      {
        this.onEditMemoryTap,
        this.onEditMemoryLongPress,
        this.onNewMemoryTap,
        super.key
      });

  @override
  State<StatefulWidget> createState() => MemoryListWidgetState();

}

class MemoryListWidgetState extends State<MemoryListWidget>{

  Song get song => widget.song;
  ScrollController? get controller => widget.controller;

  void Function()? get onEditMemoryTap => widget.onEditMemoryTap;
  void Function(Memory memory)? get onEditMemoryLongPress => widget.onEditMemoryLongPress;
  void Function(Song song)? get onNewMemoryTap => widget.onNewMemoryTap;

  int? fontIndex;

  bool? hideMemories;

  @override
  void initState() {
    fontIndex = 1;
    hideMemories = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(Memory memory in song.memories) {
      children.add(
          Padding(
            padding: const EdgeInsets.all(Dimen.defMarg),
            child: MemoryWidget(
                memory,
                onTap: onEditMemoryTap,
                onLongPress: onEditMemoryLongPress == null ? null :
                    () => onEditMemoryLongPress!(memory)
            ),
          )
      );
      //children.add(const SizedBox(height: 6));
    }
    return Column(
      children: [

        Column(children: children),

        Stack(
          children: <Widget>[

            SimpleButton(
              radius: AppCard.bigRadius,
              margin: const EdgeInsets.all(Dimen.defMarg),
              onTap: () => onNewMemoryTap?.call(song),
              padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(MdiIcons.plus),
                  const SizedBox(width: Dimen.ICON_MARG),
                  Text(
                      'Wspomnienie',
                      style: AppTextStyle(
                        color: iconEnab_(context),
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        fontWeight: weight.halfBold
                      )
                  ),
                ],
              ),
            ),

            if(song.isOfficial && false)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child:
                IconButton(
                  icon: Icon(MdiIcons.dotsVertical, color: iconEnab_(context)),
                  onPressed: (){

                    showScrollBottomSheet(
                      context: context,
                      builder: (context) => BottomSheetDef(
                        title: 'Wspomnienia innych osób',
                        builder: (context) => FutureBuilder<List<Memory>>(
                          future: API.getPublishedMemories(song.fileName), // async work
                          builder: (BuildContext context, AsyncSnapshot<List<Memory>> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return Center(child: SpinKitThreeBounce(color: accent_(context), size: Dimen.ICON_SIZE));
                              default:
                                if (snapshot.hasError)
                                  return Text('Wystąpił błąd: ${snapshot.error}', style: AppTextStyle());
                                else {

                                  List<Memory> memories = snapshot.data!;
                                  memories.shuffle();

                                  return Column(
                                    children: memories.map<Widget>((memory) =>
                                        Column(
                                          children: <Widget>[

                                            MemoryWidget(
                                              memory,
                                              showShare: false,
                                            ),

                                            const SizedBox(height: 32),

                                          ],
                                        )
                                    ).toList(),
                                  );
                                }
                            }
                          },
                        ),
                      ),
                    );

                  },
                ),

              )
          ],
        )

      ],
    );

  }

}