import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_base_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_song_book/_main.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/memory.dart';
import 'package:harcapp/_new/cat_page_song_book/memory/memory_editor_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/own_song.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';
import 'package:harcapp/_new/cat_page_song_book/song_widget_parts/christmas_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/memory/memory_list_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/song_widget_parts/powstanie_warszawskie_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/song_widget_parts/qr_widget.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core_own_song/song_raw.dart';
import 'package:harcapp_core_song_widget/providers.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';
import 'package:harcapp_core_song_widget/song_widget_template.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../main_page_new.dart';
import 'album/album_chooser.dart';
import 'bottom_sheet_report.dart';
import 'bottom_sheet_words.dart';
import 'common.dart';
import 'common_youtube.dart';
import 'copy_page.dart';
import 'own_song_page/init_widget.dart';
import 'own_song_page/own_song_page.dart';
import 'song_management/song.dart';
import 'tab_of_cont_page.dart';

class SongWidget extends StatelessWidget{

  static Future<void> sendSong(Song song)async{
    final Email email = Email(
      body: 'Dzięki za chęć dzielenia się swoimi piosenkami!'
          '\n\nPamiętaj, by podać swoje:'
          '\n\t- imię (np. Janek),'
          '\n\t- nazwisko (np. Nowak),'
          '\n\t- stopień harcerski (np. ćwik),'
          '\n\t- stopień instruktorski (np. przewodnik),'
          '\n\t- drużynę (np. 14 Krakowska Drużyna Harcerska "Wilki" im. Szarych Szeregów),'
          '\n\t- hufiec (np. Hufiec ZHP Kraków-Podgórze)'
          '\n\t- organizację harcerską (np. ZHP).'
          '\nJeżeli piosenka zostanie zatwierdzona, każdy zobaczy, że została dodana przez Ciebie.'
          '\n'
          '\n\n\n'
          '\n!!! NIE EDYTUJ PONIŻSZEGO TEKSTU !!!'
          '\n' + await song.code + '\n!!! NIE EDYTUJ POWYŻSZEGO TEKSTU !!!',
      subject: 'Piosenka własna',
      recipients: ['harcapp@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: null,
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  static Future<void> shareSong(BuildContext context, Song song) async{
    String data = await song.toQRData();
    await showScrollBottomSheet(
        context: context,
        builder: (context) => QRWidget(data),
    );
  }

  final CatPageSongBookState parent;
  final Song song;
  final int index;
  final void Function(ScrollNotification, double, double) onScroll;
  final void Function() onTextSizeChanged;
  final ScrollPhysics physics;
  final ScrollController controller;

  SongWidget(
      this.parent,
      this.song,
      this.index,
      {this.onScroll,
        this.onTextSizeChanged,
        this.physics,
        this.controller
      }):super(key: ValueKey(song));

  @override
  Widget build(BuildContext context) => SongWidgetTemplate<Song>(
    song,
    SongBookBaseSetting(),
    physics: physics,
    scrollController: controller,
    pageNotifier: parent?.notifier,
    index: index,

    topScreenPadding: 0,

    initInstrumentType: SongBookSettings.drawChordsType,

    onScroll: onScroll, //(scrollInfo) => determineFloatingButtonOpacity(context, scrollInfo),

    onTitleTap: () async {
      String wordsCode = await readStringFromAssets('assets/song_words/${song.fileName}');
      await showScrollBottomSheet(
          context: context,
          builder: (BuildContext context) => BottomSheetDef(
            title: 'Trudne słowa',
            textColor: textEnab_(context),
            childMargin: EdgeInsets.zero,
            builder: (context) => BottomSheetWords(wordsCode, song.text, song.fileName),
          )
      );
    },

    onAuthorTap: (String author) async {
      SongSearchOptions oldSearchOptions = TabOfContPage.searchOptions;
      TabOfContPage.searchOptions = SongSearchOptions();
      await parent.openTabOfCont(initPhrase: author, forgetScrollPosition: true);
      TabOfContPage.searchOptions = oldSearchOptions;
    },

    onComposerTap: (composer) async {
      SongSearchOptions oldSearchOptions = TabOfContPage.searchOptions;
      TabOfContPage.searchOptions = SongSearchOptions();
      await parent.openTabOfCont(initPhrase: composer, forgetScrollPosition: true);
      TabOfContPage.searchOptions = oldSearchOptions;
    },

    onPerformerTap: (performer) async {
      SongSearchOptions oldSearchOptions = TabOfContPage.searchOptions;
      TabOfContPage.searchOptions = SongSearchOptions();
      await parent.openTabOfCont(initPhrase: performer, forgetScrollPosition: true);
      TabOfContPage.searchOptions = oldSearchOptions;
    },

    onTagTap: (String tag) async{
      SongSearchOptions oldSearchOptions = TabOfContPage.searchOptions;
      TabOfContPage.searchOptions = SongSearchOptions(checkedTags: [tag]);
      await parent.openTabOfCont(forgetScrollPosition: true);
      TabOfContPage.searchOptions = oldSearchOptions;
    },

    onYTLinkTap: (position) async {
      if(!await isNetworkAvailable()) {
        showAppToast(context, text: 'Brak połączenia z Internetem.');
        return;
      }

      if(Platform.isAndroid && (await DeviceInfoPlugin().androidInfo).version.sdkInt < 20)
        launchURL(song.youtubeLink);

      double statusBarHeight = Provider.of<MainProvider>(context, listen: false).statusBarHeight;

      await playYoutubeSong(
          parent.context,
          parent.pageController,
          song,
          position - statusBarHeight
      );
    },

    onYTLinkLongPress: ()async{
      await Clipboard.setData(ClipboardData(text: song.youtubeLink));
      showAppToast(context, text: 'Skopiowano link.');
    },

    onMinusTap: (BuildContext context, bool changedSize){
      String tag = 'minus';
      if(!changedSize && !isSnackBarActive(tag: tag))
        showAppToast(context, text: 'Osiągnięto limit');
      else
        onTextSizeChanged?.call();
    },

    onPlusTap: (BuildContext context, bool changedSize){
      String tag = 'plus';
      if(!changedSize && !isSnackBarActive(tag: tag)){
        if(SongBookSettings.showChords && song.hasChords)
          AppScaffold.showMessage(
              context,
              'Aby powiększyć tekst, schowaj chwyty.',
              tag: tag,
              buttonText: 'Schowaj',
              onButtonPressed: (_){
                ShowChordsProvider prov = Provider.of<ShowChordsProvider>(context, listen: false);
                prov.showChords = false;

                TextSizeProvider textSizeProv = Provider.of<TextSizeProvider>(context, listen: false);
                textSizeProv.recalculate(
                    MediaQuery.of(context).size.width,
                    song,
                    fontSize: max(TextSizeProvider.defFontSize, textSizeProv.value)
                );
                onTextSizeChanged?.call();

                Scaffold.of(context).hideCurrentSnackBar();
              }
          );
        else
          showAppToast(context, text: 'Osiągnięto limit');
      }else
        onTextSizeChanged?.call();
    },

    onAlbumsTap: () async => await showScrollBottomSheet(
      context: context,
      builder: (context) => BottomSheetDef(
        title: 'Dodaj do $albumu_',
        textColor: textEnab_(context),
        builder: (context) => AlbumChooser(song),
      ),
    ),

    onRateTap: (double position) => openDialog(
        context: context,
        builder: (context){

          double statusBarHeight = Provider.of<MainProvider>(context, listen: false).statusBarHeight;

          return Stack(
            children: <Widget>[
              Positioned(
                child: RateCard<Song>(
                    song,
                    onTap: (rate, selected){
                      song.setRate(selected?SongRate.RATE_NULL:rate);
                      parent.notify();
                      Navigator.pop(context);
                    }
                ),
                top: position - statusBarHeight,
                bottom: 0,
                left: 0,
                right: 0,
              ),
            ],
          );
        }
    ),

    onDeleteTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć'),

    onDeleteLongPress: () async {
      if(song.deleteSongFile()){
        showAppToast(context, text: 'Usunięto piosenkę');

        OwnSong.removeOwn(song);
        parent.notify();
        CatPageSongBookState.lastPage = parent.pageController.page.toInt();
        for(Album album in Album.allOwn)
          album.removeSong(song);
      }else
        showAppToast(context, text: 'Błąd. Nie usunięto piosenki');
    },

    onReportTap: () => showScrollBottomSheet(
        context: context,
        builder: (BuildContext context) => BottomSheetDef(
          title: 'Zgłoszenie',
          textColor: textEnab_(context),
          builder: (context) => BottomSheetReport(song),
        )
    ),

    onEditTap: (prov) async{
      Map map = await getSongMap(song.fileName);
      SongRaw songRaw = SongRaw.fromMap(song.fileName, map);

      openOwnSongPage(
          context,
          song: songRaw,
          onSaved: (Song song, EditType editType) async {

            if(editType == EditType.EDIT_OWN)
              prov.value = prov.calculate(MediaQuery.of(context).size.width, song);

            parent.notify();
            int index = Album.current.songs.indexOf(song);
            parent.pageController.jumpToPage(index);
          }
      );

    },

    onSendSongTap: () => sendSong(song),

    onShareTap: () => shareSong(context, song),

    onCopyTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CopyPage(
            song,
            onCopied: () => showAppToast(context, text: 'Skopiowano.')
        ))
    ),

    onChordsTypeChanged: (type){
      ChordsDrawTypeProvider prov = Provider.of<ChordsDrawTypeProvider>(context, listen: false);
      prov.chordsDrawType = type;
      SongBookSettings.drawChordsType = type;
    },

    onChordsTap: (prov){
      song.shiftChordsUp();
      prov.recalculate(MediaQuery.of(context).size.width, song);
    },

    onChordsLongPress: (prov){
      song.shiftChordsDown();
      prov.recalculate(MediaQuery.of(context).size.width, song);
    },

    header: (BuildContext context, ScrollController controller) => Column(
      children: [

        if(appMode == AppMode.appModeChristmas)
          ChristmasCard<Song>(
            onChristmasCardTap: ()async{
              SongSearchOptions oldSearchOptions = TabOfContPage.searchOptions;
              TabOfContPage.searchOptions = SongSearchOptions(checkedTags: [Tag.TAG_KOLEDY]);
              await parent.openTabOfCont();
              TabOfContPage.searchOptions = oldSearchOptions;
            },
          ),

        if(appMode == AppMode.appModePowstWarsz)
          PowstWarszCard<Song>(
            onPowstanieCardTap: ()async{
              SongSearchOptions oldSearchOptions = TabOfContPage.searchOptions;
              TabOfContPage.searchOptions = SongSearchOptions(checkedTags: [Tag.TAG_POWSTANCZE]);
              await parent.openTabOfCont();
              TabOfContPage.searchOptions = oldSearchOptions;
            },
          ),

      ],
    ),

    footer: (BuildContext context, ScrollController controller) => MemoryListWidget(
        song,
        controller,

        onEditMemoryTap: () => showAppToast(context, text: 'Przytrzymaj dłużej.'),

        onEditMemoryLongPress: (Memory memory) async{
          await openMemoryEditor(context, song, initMemory: memory);
          parent.notify();
          post(() async => await this.controller.animateTo(
              this.controller.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOutQuart
          ));
        },

        onNewMemoryTap: (Song song) async{
          await openMemoryEditor(context, song);
          parent.notify();
          post(() async => await this.controller.animateTo(
              this.controller.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOutQuart
          ));
        }
    ),
    accentColor: Album.current.avgColor,
  );
}
