import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'add_okrzyk_page.dart';
import 'common.dart';
import 'okrzyk.dart';

OkrzykWidgetState? currPlayingSoundCard;

class OkrzykWidget extends StatefulWidget{

  final Okrzyk okrzyk;
  final bool editable;
  final double elevation;

  const OkrzykWidget(this.okrzyk, {super.key, this.editable = true, this.elevation = 1.0});

  @override
  State<StatefulWidget> createState() => OkrzykWidgetState();

}

class OkrzykWidgetState extends State<OkrzykWidget>{

  int? currentlyPlayingIndex;
  late bool isMusic;

  @override
  void dispose() {
    Sound.releaseAll();
    super.dispose();
  }

  @override
  void initState() {
    currentlyPlayingIndex = -1;
    isMusic = false;
    for(SoundElement element in widget.okrzyk.soundElements)
      if(element.tone != 0){
        isMusic = true;
        break;
      }

    super.initState();
  }

  play() async {
    if(!isMusic) showAppToast(context, text: 'Okrzyk nie ma melodii.');

    setState(() => currentlyPlayingIndex = 0);
    if(currPlayingSoundCard != null) await currPlayingSoundCard!.stop();
    currPlayingSoundCard = this;

    for(int i=0; i<widget.okrzyk.soundElements.length; i++) {
      if(currentlyPlayingIndex == -1) return;
      setState(() => currentlyPlayingIndex = i);
      await widget.okrzyk.soundElements[i].play();
    }

    setState(() => currentlyPlayingIndex = -1);
    currPlayingSoundCard = null;
  }

  stop() async {
    widget.okrzyk.soundElements[currentlyPlayingIndex!].stop();
    setState(() => currentlyPlayingIndex = -1);
    currPlayingSoundCard = null;
  }

  @override
  Widget build(BuildContext context) {

    List<TextSpan> text = [];
    for(int i=0; i<widget.okrzyk.soundElements.length; i++) {
      SoundElement element = widget.okrzyk.soundElements[i];
      text.add(TextSpan(
          text: element.text,
          style: AppTextStyle(
              color: textEnab_(context),
              fontWeight: currentlyPlayingIndex==i?weight.halfBold:weight.normal,
              height: 1.2
          )
      ));
      text.add(TextSpan(
          text: element.separator,
          style: AppTextStyle(height: 1.2)
      ));
    }

    return AppCard(
      radius: AppCard.bigRadius,
      elevation: AppCard.bigElevation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          TitleShortcutRowWidget(
            icon: isMusic?MdiIcons.musicNote:MdiIcons.musicNoteOff,
            iconColor: iconDisab_(context),
            title: widget.okrzyk.title,
            textAlign: TextAlign.start,
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: Dimen.SIDE_MARG,
              left: Dimen.ICON_FOOTPRINT,
              bottom: Dimen.SIDE_MARG
            ),
            child: RichText(
              text: TextSpan(
                  children: text,
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                  )
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if(widget.editable)
                IconButton(
                  icon: Icon(MdiIcons.pencilOutline, color: iconEnab_(context)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddOkrzykPage(
                      okrzyk: widget.okrzyk,
                    )));
                  },
                ),

              if(!widget.okrzyk.official)
                IconButton(
                  icon: Icon(MdiIcons.shareOutline, color: iconEnab_(context)),
                  onPressed: (){

                    openDialog(
                        context: context,
                        builder: (context) => Center(
                            child: Dismissible(
                              key: UniqueKey(),
                              onDismissed: (dir) => Navigator.pop(context),
                              child: AppCard(
                                padding: const EdgeInsets.all(0),
                                elevation: AppCard.bigElevation,

                                child: QrImageView(
                                  data: widget.okrzyk.encode(),
                                  version: QrVersions.auto,
                                ),
                              ),
                            )
                        )
                    );

                  },
                ),

              IconButton(
                  icon: Icon(currentlyPlayingIndex!=-1?MdiIcons.pause:MdiIcons.playOutline),
                  onPressed: () async {
                    if(currentlyPlayingIndex==-1)
                      await play();
                    else
                      await stop();

                  }
              )
            ],
          ),

        ],
      ),
    );
  }

}