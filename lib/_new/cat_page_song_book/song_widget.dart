import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_new/cat_page_song_book/add_pers_email_resolver.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_base_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/settings/song_book_settings.dart';
import 'package:harcapp/_new/cat_page_song_book/song_audio_player_widget.dart';
import 'package:harcapp/_new/cat_page_song_book/song_contributors_page.dart';
import 'package:harcapp/values/hufce.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
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
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_own_song/song_raw.dart';
import 'package:harcapp_core_song_widget/providers.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';
import 'package:harcapp_core_song_widget/song_widget_template.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../_common_widgets/person_data_getter.dart';
import '../../main.dart';
import 'album/album_chooser.dart';
import 'album/album_name.dart';
import 'bottom_sheet_report.dart';
import 'bottom_sheet_words.dart';
import 'common_youtube.dart';
import 'copy_page.dart';
import 'own_song_page/add_song_bottom_sheet.dart';
import 'own_song_page/_main.dart';
import 'song_management/song.dart';
import 'tab_of_cont_page.dart';

class SongWidget extends StatelessWidget{

  static Future<void> sendSong(BuildContext context, Song song, {required Person? person})async{

    bool hasName = person?.name != null;
    bool hasDruzyna = person?.druzyna != null;
    bool hasHufiec = person?.hufiec != null;
    bool hasStopI = person?.stopI != null;
    bool hasStopH = person?.stopH != null;
    bool hasOrg = person?.org != null;

    String nameSimple = song.generateFileName(withPerformer: true);

    String dir = (await getTemporaryDirectory()).path;
    File tempSongFile = File('$dir/song_$nameSimple.hrcpsng');
    tempSongFile.createSync(recursive: true);

    String fileContent = '{"official":{"o!_$nameSimple":{"song":${await song.code},"index":0}},"conf":{}}';

    tempSongFile.writeAsStringSync(fileContent);

    String newPersonCode = """const Person NEW_PERSON = Person(
        ${hasName?"name: '${person?.name}',":""}
        ${hasDruzyna?"druzyna: '${person?.druzyna}',":""}
        ${hasHufiec?"hufiec: '${person?.hufiec}',":""}
        ${hasStopI?"stopI: '${person?.stopI}',":""}
        ${hasStopH?"stopH: StopHarc.${stopHarcToString[person?.stopH]},":""}
        ${hasOrg?"org: ${person?.org},":""}
        email: []
      );""".replaceAll('\n\n', '\n');

    final Email email = Email(
      body: trimLeadingWhitespace("""
      Dzięki za chęć dzielenia się swoimi piosenkami!
      (!) Nie edytuj poniższego tekstu.
      
      - - - - - - - - -
      
      Osoba dodająca:
      
      $newPersonCode
      
      - - - - - - - - -
      
      Kod piosenki:
      
      ${await song.code}
      """),
      subject: 'Piosenka własna',
      recipients: ['harcapp@gmail.com'],
      cc: [],
      bcc: [],
      attachmentPaths: [tempSongFile.path],
      isHTML: false,
    );
    try {
      await FlutterEmailSender.send(email);
    } on PlatformException{
      showAppToast(context, text: 'Nie znaleziono aplikacji do wiadomości email.');
    }
  }

  static Future<void> shareSong(BuildContext context, Song song) async{
    String data = await song.toQRData();
    await showScrollBottomSheet(
        context: context,
        builder: (context) => QRWidget(data),
    );
  }

  final CatPageSongBookState? parent;

  final Song song;
  final SongController controller;
  final int index;
  final void Function(ScrollNotification, double?, double?)? onScroll;
  final void Function()? onTextSizeChanged;
  final void Function(int, bool)? onRateChanged;
  final void Function(Song song)? onNewSongOpened;
  final void Function(double contentTop)? onTitleTap;
  final ScrollPhysics? physics;
  final ScrollController scrollController;

  SongWidget(
      this.parent,
      this.controller,
      this.song,
      this.index,
      { this.onScroll,
        this.onTextSizeChanged,
        this.onRateChanged,
        this.onNewSongOpened,
        this.onTitleTap,
        this.physics,
        required this.scrollController
      }):super(key: ValueKey(song));

  @override
  Widget build(BuildContext context) => SongWidgetTemplate<Song, AddPersEmailResolver>(
    song,
    SongBookBaseSetting(),
    controller: controller,
    physics: physics,
    scrollController: scrollController,
    pageNotifier: parent?.notifier,
    index: index,

    topScreenPadding: 0,

    initInstrumentType: SongBookSettings.drawChordsType,

    onScroll: onScroll, //(scrollInfo) => determineFloatingButtonOpacity(context, scrollInfo),

    onTitleTap: onTitleTap,

    onAuthorTap: (String author) =>
        parent!.openTabOfCont(initPhrase: author, forgetScrollPosition: true, oneTimeSearchOptions: SongSearchOptions()),

    onComposerTap: (composer) =>
        parent!.openTabOfCont(initPhrase: composer, forgetScrollPosition: true, oneTimeSearchOptions: SongSearchOptions()),

    onPerformerTap: (performer) =>
        parent!.openTabOfCont(initPhrase: performer, forgetScrollPosition: true, oneTimeSearchOptions: SongSearchOptions()),

    onTagTap: (String tag) =>
        parent!.openTabOfCont(forgetScrollPosition: true, oneTimeSearchOptions: SongSearchOptions(checkedTags: [tag])),

    showSongExplanationButton: song.hasExplanation,
    onSongExplanationTap: () async {
      String? wordsCode = await readStringFromAssets('assets/songs/song_words/${song.lclId}');
      await showScrollBottomSheet(
          context: context,
          builder: (BuildContext context) => BottomSheetDef(
            title: 'Trudne słowa',
            textColor: textEnab_(context),
            childMargin: EdgeInsets.zero,
            builder: (context) => BottomSheetWords(wordsCode, song.text, song.lclId),
          )
      );
    },

    onYTLinkTap: (position) async {

      if(!await isNetworkAvailable()) {
        showAppToast(context, text: 'Brak połączenia z Internetem.');
        return;
      }

      if(Platform.isAndroid && (await DeviceInfoPlugin().androidInfo).version.sdkInt! < 20 && song.youtubeLink != null)
        launchURL(song.youtubeLink!);

      double statusBarHeight = App.statusBarHeight;

      await playYoutubeSong(
          parent!.context,
          parent!.pageController,
          song,
          position - statusBarHeight
      );
    },

    onYTLinkLongPress: () async {
      showAppToast(context, text: 'Skopiowano link.');
      await Clipboard.setData(ClipboardData(text: song.youtubeLink));
    },

    onMinusTap: (BuildContext context, bool changedSize){
      if(!changedSize)
        showAppToast(context, text: 'Osiągnięto limit');
      else
        onTextSizeChanged?.call();
    },

    onPlusTap: (BuildContext context, bool changedSize){
      if(!changedSize){
        if(SongBookSettings.showChords && song.hasChords)
          showAppToast(
              context,
              text: 'Schowaj chwyty, by powiększyć.',
              buttonText: 'Schowaj',
              onButtonPressed: (){
                ShowChordsProvider prov = Provider.of<ShowChordsProvider>(context, listen: false);
                prov.showChords = false;

                TextSizeProvider textSizeProv = Provider.of<TextSizeProvider>(context, listen: false);
                textSizeProv.recalculate(
                    MediaQuery.of(context).size.width,
                    song,
                    fontSize: max(TextSizeProvider.defFontSize, textSizeProv.value),
                    chordsVisible: false
                );
                onTextSizeChanged?.call();
                showAppToast(context, text: 'Chwyty możesz przywrócić w ustawieniach');
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
        builder: (context) => Stack(
          children: <Widget>[
            Positioned(
              top: position - App.statusBarHeight,
              bottom: 0,
              left: 0,
              right: 0,
              child: RateCard<Song>(
                  song,
                  onTap: (rate, selected){
                    song.setRate(selected?SongRate.RATE_NULL:rate);
                    parent!.notify();
                    onRateChanged?.call(rate, selected);
                    Navigator.pop(context);
                  }
              ),
            ),
          ],
        )
    ),

    onDeleteTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć'),

    onDeleteLongPress: () async {
      if(song.delete()){
        showAppToast(context, text: 'Usunięto piosenkę');

        OwnSong.removeFromAll(song as OwnSong);
        parent!.notify();
        await BaseAlbum.setLastPageForAlbum(BaseAlbum.current, parent!.pageController.page!.toInt());
        for(OwnAlbum album in OwnAlbum.all)
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
      Map? map = jsonDecode(await song.code);
      if(map == null){
        showAppToast(context, text: 'Coś jest nie tak z piosenką');
        return;
      }
      SongRaw songRaw = SongRaw.fromRespMap(song.lclId, map);

      openOwnSongPage(
          context,
          song: songRaw,
          onSaved: (Song song, EditType editType) async {

            if(editType == EditType.editOwn)
              prov.value = prov.calculate(
                MediaQuery.of(context).size.width,
                song,
                chordsVisible: ShowChordsProvider.of(context).showChords
              );

            parent!.notify();
            int index = BaseAlbum.current.songs.indexOf(song);
            parent!.pageController.jumpToPage(index);
          }
      );

    },

    onSendSongTap: () async {
      Person? person = await getMyPersonData(context);
      sendSong(context, song, person: person);
    },

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
      prov.recalculate(
          MediaQuery.of(context).size.width,
          song,
          chordsVisible: ShowChordsProvider.of(context).showChords
      );
    },

    onChordsLongPress: (prov){
      song.shiftChordsDown();
      prov.recalculate(
          MediaQuery.of(context).size.width,
          song,
          chordsVisible: ShowChordsProvider.of(context).showChords
      );
    },

    header: (BuildContext context, ScrollController? controller) => Column(
      children: [

        if(appMode == AppMode.appModeChristmas)
          ChristmasCard<Song>(
            onChristmasCardTap: ()async{
              SongSearchOptions oldSearchOptions = TabOfContPage.searchOptions;
              TabOfContPage.searchOptions = SongSearchOptions(checkedTags: [Tag.TAG_KOLEDY]);
              await parent!.openTabOfCont();
              TabOfContPage.searchOptions = oldSearchOptions;
            },
          ),

        if(appMode == AppMode.appModePowstWarsz)
          PowstWarszCard<Song>(
            onPowstanieCardTap: ()async{
              SongSearchOptions oldSearchOptions = TabOfContPage.searchOptions;
              TabOfContPage.searchOptions = SongSearchOptions(checkedTags: [Tag.TAG_POWSTANCZE]);
              await parent!.openTabOfCont();
              TabOfContPage.searchOptions = oldSearchOptions;
            },
          ),

      ],
    ),

    titleCardFooter: (BuildContext context, ScrollController? controller) =>
    song.audios.isEmpty?
    Container():
    SongAudioPlayerWidget(
      song,
      padding: const EdgeInsets.symmetric(horizontal: Dimen.defMarg),
    ),

    contentFooter: (BuildContext context, ScrollController? controller) => MemoryListWidget(
        song,
        controller,

        onEditMemoryTap: () => showAppToast(context, text: 'Przytrzymaj dłużej.'),

        onEditMemoryLongPress: (Memory memory) async {
          await openMemoryEditor(context, song, initMemory: memory);
          parent!.notify();
          post(() async => await scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOutQuart
          ));
        },

        onNewMemoryTap: (Song song) async{
          await openMemoryEditor(context, song);
          parent!.notify();
          post(() async => await scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOutQuart
          ));
        }
    ),

    footer: (BuildContext context, ScrollController? controller) => const SizedBox(
      height: Dimen.FLOATING_BUTTON_SIZE + 2*Dimen.FLOATING_BUTTON_MARG
    ),

    accentColor: BaseAlbum.current.avgColor,

    addPersResolver: AddPersEmailResolver(
      textColor: textEnab_(context),
      onSongCountTap: () => pushPage(context, builder: (context) => SongContributorsPage(
        onSongTap: (song){
          Navigator.pop(context);
          onNewSongOpened?.call(song);
        },
      ))
    ),
  );
}

/*
Padding(
      padding: const EdgeInsets.only(
        bottom: Dimen.FLOATING_BUTTON_SIZE + 2*Dimen.FLOATING_BUTTON_MARG
      ),
      child: ,
    )
 */