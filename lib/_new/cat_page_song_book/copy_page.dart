import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core_song/song_core.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CopyPage<T extends SongCore> extends StatefulWidget{

  final T song;
  final Function onCopied;

  const CopyPage(this.song, {this.onCopied, Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() => CopyPageState<T>();

}

class CopyPageState<T extends SongCore> extends State<CopyPage> with TickerProviderStateMixin{

  T get song => widget.song;
  Function get onCopied => widget.onCopied;

  TabController tabController;
  List<String> content;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);

    String header = song.title +
        '\nAutor słów: ' + song.authorsStr +
        '\nWykonawca: ' + song.performersStr +
        '\nKompozytor:' + song.composersStr + '\n';

    List<String> words = song.text.split('\n');
    List<String> chords = song.chords.split('\n');

    String content1 = header + '\n' + song.text;

    String content2 = header + '\n';
    for(int i=0; i<max(words.length, chords.length); i++){
      content2 += (
          (i>chords.length || chords[i].isEmpty?'':('[' + chords[i] + ']'))
              + '\n' + (i>words.length?'':words[i]) + '\n'
      );
    }

    if(content2.isNotEmpty) content2 = content2.substring(0, content2.length-1);

    String content3 = header + '\n';
    for(int i=0; i<max(words.length, chords.length); i++){
      content3 += (
          (i>words.length?'':words[i]) + ' ' +
              (i>chords.length || chords[i].isEmpty?'':('[' + chords[i] + ']')) + '\n'
      );
    }

    if(content3.isNotEmpty) content3 = content3.substring(0, content3.length-1);

    content = [];
    content.add(content1);
    content.add(content2);
    content.add(content3);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              title: const Text('Kopiuj piosenkę'),
              centerTitle: true,
              floating: true,
              pinned: true,
              bottom: TabBar(
                isScrollable: true,
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                tabs: const [
                  Tab(text: 'Tylko słowa'),
                  Tab(text: 'Chwyty nad słowami'),
                  Tab(text: 'Chwyty przy słowach'),
                ],
              ),
            )
          ],
          body: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: [

              _ChildWidget(content[0]),
              _ChildWidget(content[1]),
              _ChildWidget(content[2])
            ]
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: (){
            Clipboard.setData(ClipboardData(text: content[tabController.index]));
            if(onCopied!=null) onCopied();
            Navigator.pop(context);
          },
          child: AppCard(
            margin: AppCard.normMargin,
            elevation: AppCard.bigElevation,
            radius: AppCard.BIG_RADIUS,
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(MdiIcons.contentCopy),
                  const SizedBox(width: Dimen.ICON_MARG),
                  Text('Kopiuj', style: AppTextStyle(fontWeight: weight.halfBold, color: iconEnab_(context)))
                ]
            ),
          )
        )
    );

  }

}

class _ChildWidget extends StatelessWidget{

  final String text;

  const _ChildWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        top: Dimen.ICON_MARG,
        left: Dimen.ICON_MARG,
        right: Dimen.ICON_MARG
      ),
      child: SelectableText(text, style: AppTextStyle(color: textEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG)),
    );
  }

}