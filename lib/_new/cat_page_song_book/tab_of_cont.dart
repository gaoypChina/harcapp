import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_new/cat_page_song_book/tab_of_cont_controller.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_song_book/own_song_page/add_song_bottom_sheet.dart';
import 'package:harcapp/_new/cat_page_song_book/song_searcher.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core_song_widget/song_rate.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'song_management/album.dart';
import 'song_management/song.dart';

class TabOfCont extends StatefulWidget{

  final bool appBar;
  final List<Widget>? appBarActions;
  final Widget? floatingButton;
  final Color? background;
  final Color? accentColor;
  final Widget? titleLeading;
  final Widget? titleTrailing;
  final Widget Function(Song, GlobalKey)? itemLeadingBuilder;
  final Widget Function(Song, GlobalKey)? itemTrailingBuilder;
  final Function(Song, int)? onItemTap;
  final TabOfContController? controller;

  final ScrollController? scrollController;

  final double? paddingBottom;

  final Function(String)? onChanged;

  final Function(List<Song> songs, bool Function() stillValid)? onSearchComplete;
  final PageStorageKey? pageStorageKey;
  final bool showAddSongSuggestion;
  final void Function(Song song)? onNewSongAdded;

  const TabOfCont(
      { this.appBar=true,
        this.appBarActions,
        this.floatingButton,
        this.background,
        this.accentColor,
        this.titleLeading,
        this.titleTrailing,
        this.itemLeadingBuilder,
        this.itemTrailingBuilder,
        this.onItemTap,
        this.controller,
        this.scrollController,
        this.paddingBottom=0,
        this.onChanged,
        this.onSearchComplete,
        this.pageStorageKey,
        this.showAddSongSuggestion=true,
        this.onNewSongAdded,
        super.key
      });

  @override
  State createState() => TabOfContState();

}

class TabOfContState extends State<TabOfCont>{

  final PageStorageBucket pageStorageBucket = PageStorageBucket();

  static const double tagBarHeight = 2*Dimen.defMarg + Dimen.TEXT_SIZE_NORMAL + 3;

  late SongSearcher searcher;
  List<Song> get allSongs => controller.allSongs;

  TabOfContController? _controller;
  TabOfContController get controller => widget.controller??_controller!;

  late TextEditingController textController;

  double? topPadding;

  ScrollController? _scrollController;

  Widget? get titleLeading => widget.titleLeading;
  Widget? get titleTrailing => widget.titleTrailing;
  Widget Function(Song, GlobalKey)? get itemLeadingBuilder => widget.itemLeadingBuilder;
  Widget Function(Song, GlobalKey)? get itemTrailingBuilder => widget.itemTrailingBuilder;
  Function(Song, int)? get onItemTap => widget.onItemTap;

  ScrollController? get scrollController => widget.scrollController??_scrollController;

  double? get paddingBottom => widget.paddingBottom;

  Function(List<Song> songs, bool Function() stillValid)? get onSearchComplete => widget.onSearchComplete;

  SongSearchOptions get searchOptions => controller.searchOptions;

  void initSearcher() async {
    await searcher.init(allSongs, searchOptions);
    await searcher.run(controller.phrase);
  }

  @override
  void initState() {

    if(widget.controller == null)
      _controller = TabOfContController(Album.current.songs);

    textController = TextEditingController(text: controller.phrase);
    textController.addListener(() => controller.phrase = controller.phrase);

    searcher = SongSearcher((List<Song> songs, bool Function() stillValid) {
      if(!mounted) return;
      onSearchComplete?.call(songs, stillValid);
      controller.currSongs = songs;
      setState(() {});
    });

    searcher.addOnStartListener((phrase) {
      if(!mounted) return;
      widget.onChanged?.call(phrase);
    });

    post(initSearcher);

    topPadding = 0;

    super.initState();

  }

  @override
  void dispose() {
    searcher.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(controller.currSongs == null)
      return Center(child: SpinKitChasingDots(size: 2*Dimen.ICON_SIZE, color: widget.accentColor??Album.current.avgColor));
    else
      return AppScaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            if(widget.appBar)
              SliverAppBar(
                backgroundColor: background_(context),
                title: const Text('Spis treści'),
                centerTitle: true,
                elevation: 0,
                floating: true,
                actions: widget.appBarActions,
              ),

            FloatingContainer.child(
                child: _SearchTextFieldCard(
                    searcher: searcher,
                    tabOfContController: controller,
                    textController: textController,
                    onCleared: () => setState(() {})
                ),
                height: SearchField.height + (controller.searchOptions.isEmpty?0:35.0),
                rebuild: true
            ),

            SliverList(
              delegate: SliverChildListDelegate([const SizedBox(height: 10.0)]),
            ),

            if(controller.currSongs!.isEmpty)
              SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: _NoSongWidget(widget.showAddSongSuggestion, widget.onNewSongAdded))
              )
            else
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index){
                    GlobalKey globalKey = GlobalKey();
                    return Padding(
                        padding: const EdgeInsets.only(bottom: Dimen.defMarg),
                        child: SongTile(
                          controller.currSongs![index],
                          key: globalKey,
                          onTap: onItemTap==null?null:(song) => onItemTap!(song, index),
                          leading: itemLeadingBuilder?.call(controller.currSongs![index], globalKey),
                          trailing: itemTrailingBuilder?.call(controller.currSongs![index], globalKey),
                        )
                    );

                  },
                      childCount: controller.currSongs!.length
                  )),

            SliverList(
              delegate: SliverChildListDelegate([SizedBox(height: widget.paddingBottom)]),
            )

          ],
        ),
        floatingActionButton: widget.floatingButton,
      );
  }

  void setTopPadding(double value) => setState(() => topPadding = value);

}

class _NoSongWidget extends StatelessWidget{

  final bool showAddSongSuggestion;
  final void Function(Song song)? onNewSongAdded;

  const _NoSongWidget(this.showAddSongSuggestion, this.onNewSongAdded);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        EmptyMessageWidget(
          text: 'Brak piosenek\no zadanych kryteriach${Album.current.isOmega?'':' w $albumie_'}.',
          icon: MdiIcons.bookSearchOutline,
        ),

        if(showAddSongSuggestion)
          Column(
            children: [

              const SizedBox(height: 64),

              SimpleButton.from(
                  context: context,
                  icon: MdiIcons.plusCircleOutline,
                  text: 'Chcesz dodać oficjalną piosenkę?',
                  onTap: () => _showAddSongBottomSheet(context, onNewSongAdded)
              ),
            ],
          )

      ],
    );
  }

}

class _SearchTextFieldCard extends StatelessWidget{

  final SongSearcher? searcher;
  final TabOfContController tabOfContController;
  final TextEditingController textController;

  final void Function()? onCleared;

  const _SearchTextFieldCard(
      { required this.searcher,
        required this.tabOfContController,
        required this.textController,
        this.onCleared,
        Key? key
      }):super(key: key);


  @override
  Widget build(BuildContext context) => SearchField(
    hint: 'Tytuł, autor, wykonawca, słowa:',

    controller: textController,
    margin: SearchField.normMargin,
    background: background_(context),

    onChanged: (text) async {

      tabOfContController.phrase = text;

      if(text == '#') {
        // HAS TO IN POST - ITS A WORKAROUND FOR A BUG. OTHERWISE THE onChanged METHOD IS CALLED TWICE AFTER ENTERING "#".
        post(() => textController.text = '');
        showOptionsBottomSheet(context);
      }else
        searcher!.run(text);

    },

    leading: AnimatedChildSlider(
      index: tabOfContController.searchOptions.isEmpty && textController.text.isEmpty?0:1,
      children: [
        SearchField.defLeadWidget(context),
        IconButton(
          icon: Icon(MdiIcons.close, color: iconEnab_(context)),
          onPressed: () async{

            textController.clear();
            tabOfContController.phrase = '';
            tabOfContController.searchOptions.clear();
            await searcher!.init(searcher!.allItems, tabOfContController.searchOptions);
            await searcher!.run('');

            onCleared?.call();
            onSearchOptionChanged(tabOfContController.searchOptions);

          },
        )
      ],
    ),
    trailing: IconButton(
        icon: Icon(MdiIcons.cogOutline, color: iconEnab_(context)),
        onPressed: () async {

          hideKeyboard(context);
          await showOptionsBottomSheet(context);//, onChanged: () => setState((){}));

          await searcher!.run(textController.text);

        }),
    bottom:
    tabOfContController.searchOptions.isEmpty?
    null:
    SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(bottom: 6, left: 6, right: 6),
        child: SizedBox(
          height: 2*Dimen.defMarg + Dimen.TEXT_SIZE_NORMAL + 3,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: tabOfContController.searchOptions.checkedRates.map((rate) => Padding(
                    padding: const EdgeInsets.only(left: Dimen.defMarg, right: Dimen.defMarg),
                    child: RateIcon.build(context, rate, size: 20.0),
                  )).toList(),
                ),
                const SizedBox(width: Dimen.defMarg/2),
                Row(
                  children: tabOfContController.searchOptions.checkedTags.map((t) => Tag(
                    t,
                    inCard: false,
                    fontSize: Dimen.TEXT_SIZE_SMALL,
                    padding: EdgeInsets.zero,
                    margin: const EdgeInsets.only(left: Dimen.defMarg, right: Dimen.defMarg),
                    elevate: false,
                  )).toList(),
                )
              ]
          ),
        )
    ),

  );

  onSearchOptionChanged(SongSearchOptions? searchOptions){
    tabOfContController.onSearchOptionsChanged?.call(searchOptions);
  }

  Future<void> showOptionsBottomSheet(BuildContext context, {void Function()? onChanged}) => showScrollBottomSheet(
      context: context,
      builder: (_) => BottomSheetOptions(
          tabOfContController.searchOptions,
          searcher,
          onChanged: ()async{
            await searcher!.init(searcher!.allItems, tabOfContController.searchOptions);
            await searcher!.run(textController.text);
            onChanged?.call();
          }
      )
  );

}


class SongTile extends StatelessWidget{

  final Song song;
  final Widget? leading;
  final Widget? trailing;
  final Function(Song)? onTap;

  const SongTile(this.song, {this.leading, this.trailing, this.onTap, super.key});

  @override
  Widget build(BuildContext context) => ListTile(
      contentPadding: const EdgeInsets.only(left: 10.0, top: 2.0, bottom: 2.0),
      onTap: onTap == null?null:() => onTap!(song),
      leading: leading,
      trailing: trailing,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          if(!song.isOfficial)
            Icon(MdiIcons.pencil, size: Dimen.TEXT_SIZE_NORMAL, color: hintEnab_(context)),

          if(!song.isOfficial)
            const SizedBox(width: Dimen.defMarg),

          Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    Text(
                      '${song.title} ',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle(
                          fontWeight: weight.halfBold,
                          color: textEnab_(context),
                          fontSize: Dimen.TEXT_SIZE_NORMAL
                      ),
                    ),

                    if(song.performers.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(song.performersStr,
                            style: AppTextStyle(
                                fontWeight: weight.halfBold,
                                fontSize: Dimen.TEXT_SIZE_TINY,
                                color: hintEnab_(context)
                            ),
                            maxLines: 1
                        ),
                      )

                  ],
                ),
              )
          )

        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Text(
          song.tagsAsString,
          style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_TINY,
            fontWeight: weight.halfBold,
            color: hintEnab_(context)
          ),
          maxLines: 1
        ),
      )
  );
}

class BottomSheetOptions extends StatefulWidget{

  final SongSearchOptions? searchOptions;
  final SongSearcher? searcher;
  final void Function()? onChanged;

  const BottomSheetOptions(this.searchOptions, this.searcher, {this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() => BottomSheetOptionsState();
}

class BottomSheetOptionsState extends State<BottomSheetOptions>{

  SongSearchOptions? get searchOptions => widget.searchOptions;
  SongSearcher? get searcher => widget.searcher;
  void Function()? get onChanged => widget.onChanged;

  bool? checkRateDislike;
  bool? checkRateLike1;
  bool? checkRateLike2;

  bool? checkRateLike3;
  bool? checkRateLikeBookmarked;

  @override
  void initState() {

    checkRateDislike = true;
    checkRateLike1 = true;
    checkRateLike2 = true;
    checkRateLike3 = true;
    checkRateLikeBookmarked = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomSheetDef(
    childMargin: const EdgeInsets.all(Dimen.defMarg/2),
    title: 'Opcje wyszukiwania',
    builder: (context) =>
        Column(
          children: <Widget>[

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            Row(
              children: <Widget>[
                Expanded(child: RateCheckButton(SongRate.TEXT_DISLIKE, SongRate.RATE_DISLIKE, searchOptions, onTap: (_, __) => onChanged!())),
                Expanded(child: RateCheckButton(SongRate.TEXT_LIKE_1, SongRate.RATE_LIKE_1, searchOptions, onTap: (_, __) => onChanged!())),
                Expanded(child: RateCheckButton(SongRate.TEXT_LIKE_2, SongRate.RATE_LIKE_2, searchOptions, onTap: (_, __) => onChanged!())),
                Expanded(child: RateCheckButton(SongRate.TEXT_LIKE_3, SongRate.RATE_LIKE_3, searchOptions, onTap: (_, __) => onChanged!())),
                Expanded(child: RateCheckButton(SongRate.TEXT_BOOKMARK, SongRate.RATE_BOOKMARK, searchOptions, onTap: (_, __) => onChanged!())),
              ],
            ),

            const SizedBox(height: 2*Dimen.BOTTOM_SHEET_MARG),

            TagLayout.wrap(
              allTags: Tag.ALL_TAG_NAMES,
              onTagTap: (String tag, bool checked){
                if(checked) searchOptions!.checkedTags.remove(tag);
                else searchOptions!.checkedTags.add(tag);
                setState((){});
                onChanged?.call();
              },
              checkedTags: searchOptions!.checkedTags,
            ),

            const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

          ],
        ),
  );

}

class RateCheckButton extends StatefulWidget{

  final String text;
  final int rate;
  final SongSearchOptions? searchOptions;
  final void Function(int rate, bool selected)? onTap;

  const RateCheckButton(
      this.text,
      this.rate,
      this.searchOptions,
      {this.onTap,
       Key? key
      }): super(
        key: key
      );

  @override
  State<StatefulWidget> createState() => RateCheckButtonState();

}

class RateCheckButtonState extends State<RateCheckButton>{

  String get text => widget.text;
  int get rate => widget.rate;
  SongSearchOptions? get searchOptions => widget.searchOptions;
  void Function(int rate, bool selected)? get onTap => widget.onTap;

  @override
  Widget build(BuildContext context) => RateButton(
      text,
      RateIcon.build(context, rate),
      rate, searchOptions!.checkedRates.contains(rate),
      onTap: (rate, selected){
        setState(() => selected?searchOptions!.checkedRates.remove(rate):searchOptions!.checkedRates.add(rate));
        if(onTap != null) onTap!(rate, selected);
        //parentState.notify();
      },
      glow: false
  );

}

// class CurrentItemsProvider extends ChangeNotifier{
//
//   List<Song>? _currSongs;
//   List<Song>? get currSongs => _currSongs;
//
//   bool? _searcherRunning;
//   bool? get searcherRunning => _searcherRunning;
//   set searcherRunning(bool? value){
//     _searcherRunning = value;
//     notifyListeners();
//   }
//
//   CurrentItemsProvider(){
//     _searcherRunning = true;
//   }
//
//   void set(List<Song> currSongs, {bool? searcherRunning}){
//     _currSongs = currSongs;
//     if(searcherRunning != null)
//       _searcherRunning=searcherRunning;
//     notifyListeners();
//   }
//
//   void clear(){
//     _currSongs = null;
//     notifyListeners();
//   }
//
//   void notify() => notifyListeners();
// }

// class SearchParamsProvider extends ChangeNotifier {
//
//   static SearchParamsProvider of(BuildContext context) => Provider.of<SearchParamsProvider>(context, listen: false);
//   static void notify_(BuildContext context) => of(context).notify();
//
//   TextEditingController? _controller;
//
//   TextEditingController? get textController => _controller;
//
//   SearchParamsProvider({String initPhrase=''}){
//     _controller = TextEditingController(text: initPhrase);
//   }
//
//   clear(){
//     _controller!.clear();
//     notifyListeners();
//   }
//
//   set phrase(String value){
//     _controller!.text = value;
//     notifyListeners();
//   }
//
//   @override
//   void dispose() {
//     _controller!.dispose();
//     super.dispose();
//   }
//
//   void notify() => notifyListeners();
//
// }

void _showAddSongBottomSheet(BuildContext context, void Function(Song song)? onNewSongAdded) => showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetDef(
      title: 'Jak dodać oficjalną piosenkę?',
      builder: (BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          const AppText(
              'Na swój użytek piosenkę do harcappki dodać może każdy.'
                  '\n'
                  '\nA co jeśli chcesz, by Twoja piosenka pojawiła się w oficjalnym spisie treści dostępnym <b>dla wszystkich</b>?'
                  '\n',
              size: Dimen.TEXT_SIZE_BIG
          ),

          Text('Przygotowanie piosenki jest banalne!', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold)),
          Text('Wystarczy skorzystać z jednego z dwóch narzędzi:', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),

          const SizedBox(height: 20.0),

          SimpleButton(
              padding: const EdgeInsets.all(Dimen.ICON_MARG),
              radius: AppCard.bigRadius,
              onTap: null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MdiIcons.laptop, color: hintEnab_(context)),
                  const SizedBox(width: Dimen.ICON_MARG),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: Dimen.ICON_SIZE,
                          child: Center(child: Text('Z komputera:', style: AppTextStyle(
                              fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)
                          )))
                      ),
                      SizedBox(
                          height: Dimen.ICON_SIZE,
                          child: Center(child: Text('harcapp.web.app/', style: AppTextStyle(
                              fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG
                          )))
                      ),
                    ],
                  ),

                  Expanded(child: Container()),

                  const IconButton(icon: Icon(MdiIcons.web), onPressed: null)
                ],
              )
          ),
          const SizedBox(height: Dimen.ICON_MARG),

          SimpleButton(
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            radius: AppCard.bigRadius,
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(MdiIcons.cellphone, color: hintEnab_(context)),
                  const SizedBox(width: Dimen.ICON_MARG),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: Dimen.ICON_SIZE,
                          child: Center(child: Text('Z telefonu:', style: AppTextStyle(
                              fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)
                          )))
                      ),
                      SizedBox(
                          height: Dimen.ICON_SIZE,
                          child: Center(child: Text('Moduł dodawania piosenek', style: AppTextStyle(
                              fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG
                          )))
                      ),
                    ],
                  ),

                  Expanded(child: Container()),

                  const Padding(
                    padding: EdgeInsets.all(Dimen.ICON_MARG),
                    child: Icon(MdiIcons.musicNotePlus)
                  )
                ]
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.pop(context);
              openOwnSongPage(context, onSaved: (song, editType){
                if(onNewSongAdded != null) onNewSongAdded(song);
              });
            },
          ),

          const SizedBox(height: 40.0),
          Text('Zostań songowym bohaterem! c:', style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold, color: Colors.amber
          ), textAlign: TextAlign.center),
          const SizedBox(height: 20.0),

        ],
      ),
    )
);