import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/article_page.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'article_card/article_card_widget_small.dart';
import 'article_card/tag_widget.dart';
import 'article.dart';
import 'article_searcher.dart';

class ArticleSearchPage extends StatefulWidget{

  final List<Article> allArticles;

  const ArticleSearchPage(this.allArticles, {super.key});

  @override
  State createState() => ArticleSearchPageState();

}

class ArticleSearchPageState extends State<ArticleSearchPage>{

  List<Article> get allArticles => widget.allArticles;

  //List<ArticleCore> searchedArticles;

  late TextEditingController textController;

  late ArticleSearchOptions options;
  late ArticleSearcher searcher;

  CurrentItemsProvider? currentItemsProvider;
  SearchParamsProvider? searchParamsProvider;

  void initSearcher() async{
    textController = TextEditingController();
    await searcher.init(allArticles, options);
    searcher.run('');
  }

  @override
  void initState() {
    options = ArticleSearchOptions();
    searcher = ArticleSearcher();
    searcher.addOnCompleteListener(
            (List<Article> articles, bool Function() stillValid)
        => currentItemsProvider!.currArticles = articles);
    initSearcher();
    super.initState();
  }

  @override
  void dispose() {
    searcher.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context){
            currentItemsProvider = CurrentItemsProvider();
            return currentItemsProvider;
          }),
          ChangeNotifierProvider(create: (context){
            searchParamsProvider = SearchParamsProvider();
            return searchParamsProvider;
          }),
        ],
        builder: (context, child) => BottomNavScaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: background_(context),
                title: const Text('Szukaj artykułów'),
                centerTitle: true,
                elevation: 0,
                floating: true,
              ),

              Consumer<SearchParamsProvider>(
                  builder: (context, prov, child) => FloatingContainer.child(
                    height: SearchField.height + (prov.options.isEmpty?0:35.0),
                    child: _SearchTextFieldCard(
                      searcher: searcher,
                      searchOptions: prov.options,
                      textController: prov.textController,
                      onChanged: (text){
                        prov.notify();
                      },
                    ),
                  )
              ),

              SliverList(delegate: SliverChildListDelegate([const SizedBox(height: 3.0)])),

              Consumer<CurrentItemsProvider>(
                  builder: (context, prov, child){

                    if(prov.currArticles == null)
                      return const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(child: CircularProgressIndicator())
                      );
                    else if(prov.currArticles!.isEmpty)
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(child: _NoArticlesWidget())
                      );
                    else
                      return SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: ArticleCardWidgetSmall.aspectRatio,
                        ),
                        delegate: SliverChildBuilderDelegate((BuildContext context, int index) =>
                            ArticleCardWidgetSmall(
                              prov.currArticles![index],
                              onTap: (context, article, background){
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ArticlePage(
                                          article,
                                          cover: background,
                                        )
                                    )
                                );
                              },
                              key: ValueKey(prov.currArticles![index]),
                            ),
                            childCount: prov.currArticles!.length
                        ),
                      );
                  }
              ),


            ],
          ),
        ),
    );

  }

  void notify() => setState((){});

}

Future<void> _showOptionsBottomSheet(BuildContext context, ArticleSearchOptions options, ArticleSearcher searcher, TextEditingController? controller, {void Function()? onChanged}) => showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetOptions(options, searcher, onChanged: () async{
      await searcher.init(Article.all??[], options);
      searcher.run(controller!.text);
      if(onChanged != null) onChanged();
    })
);

class _NoArticlesWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(MdiIcons.notebookRemoveOutline, color: textEnab_(context)),
        const SizedBox(height: 10),
        Text('Brak artykułów o zadanych kryteriach', style: AppTextStyle(fontWeight: weight.halfBold), textAlign: TextAlign.center,)
      ],
    );
  }

}

class _SearchTextFieldCard extends StatelessWidget{

  final void Function(String)? onChanged;
  final void Function()? onCleared;

  final ArticleSearcher searcher;
  final ArticleSearchOptions searchOptions;
  DateTime? get fromDate => searchOptions.fromDate;
  DateTime? get toDate => searchOptions.toDate;

  final TextEditingController? textController;

  const _SearchTextFieldCard(
      { required this.searcher,
        required this.searchOptions,
        required this.textController,
        this.onChanged,
        this.onCleared,
      });

  @override
  Widget build(BuildContext context) {
    return SearchField(
      hint: 'Tytuł, autor, słowa',

      controller: textController,
      onChanged: (String text) async {
        if(text == '#') {
          hideKeyboard(context);
          await _showOptionsBottomSheet(context, searchOptions, searcher, textController);
          textController!.clear();
        } else {
          searcher.run(text);
          if(onChanged != null) onChanged!(text);
        }
      },

      canClearText: () => searchOptions.isNotEmpty,
      onTextCleared: () async {
        searchOptions.clear();
        onCleared?.call();
        onChanged?.call('');

        await searcher.run('');
      },
      // leading: AnimatedChildSlider(
      //   index: searchOptions.isEmpty?0:1,
      //   children: [
      //     SearchField.defLeadWidget(context),
      //     IconButton(
      //       icon: Icon(MdiIcons.close, color: iconEnab_(context)),
      //       onPressed: () async{
      //
      //         textController!.clear();
      //         searchOptions.clear();
      //         if(onCleared!=null) onCleared!();
      //         if(onChanged != null) onChanged!('');
      //
      //         await searcher.run('');
      //
      //       },
      //     )
      //   ],
      // ),
      trailing: IconButton(
          icon: Icon(MdiIcons.cogOutline, color: iconEnab_(context)),
          onPressed: () async {

            hideKeyboard(context);
            await _showOptionsBottomSheet(context, searchOptions, searcher, textController,
                onChanged: () => onChanged==null?null:onChanged!(textController!.text));

            await searcher.run(textController!.text);

          }),
      bottom:
      (searchOptions.isEmpty)?
      null:
      SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: Dimen.defMarg, right: Dimen.defMarg, bottom: Dimen.defMarg),
          child: SizedBox(
            height: 2*Dimen.defMarg + Dimen.TEXT_SIZE_NORMAL + 3,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: Dimen.defMarg),
                  if(fromDate != null || toDate != null)
                  Text(
                    '${fromDate==null?'...':dateToString(fromDate!, shortMonth: true, yearAbbr: '')} - ${toDate==null?'...':dateToString(toDate!, shortMonth: true, yearAbbr: 'A.D.')}',
                    style: AppTextStyle(fontWeight: weight.halfBold),
                  ),
                  const SizedBox(width: Dimen.defMarg/2),
                  Row(
                    children: searchOptions.checkedTags.map((t) => Tag(
                      t,
                      fontSize: Dimen.TEXT_SIZE_SMALL,
                      padding: EdgeInsets.zero,
                      elevation: AppCard.defElevation,
                    )).toList(),
                  )
                ]
            ),
          )
      ),

    );
  }
}


class BottomSheetOptions extends StatefulWidget{

  final ArticleSearchOptions searchOptions;
  final ArticleSearcher searcher;
  final void Function()? onChanged;

  const BottomSheetOptions(
      this.searchOptions,
      this.searcher,
      { this.onChanged,
        super.key
      });

  @override
  State<StatefulWidget> createState() => BottomSheetOptionsState();
}

class BottomSheetOptionsState extends State<BottomSheetOptions>{

  ArticleSearchOptions get searchOptions => widget.searchOptions;
  ArticleSearcher get searcher => widget.searcher;
  void Function()? get onChanged => widget.onChanged;

  DateTime? get fromDate => widget.searchOptions.fromDate;
  set fromDate(DateTime? value) => widget.searchOptions.fromDate = value;

  DateTime? get toDate => widget.searchOptions.toDate;
  set toDate(DateTime? value) => widget.searchOptions.toDate = value;

  List<String> get checkedTags => searchOptions.checkedTags;
  set checkedTags(List<String> value) => searchOptions.checkedTags = value;


  @override
  Widget build(BuildContext context) {

    DateTime startDate = DateTime(2016, 1, 1);

    return BottomSheetDef(
      childMargin: const EdgeInsets.all(Dimen.defMarg/2),
      title: 'Opcje wyszukiwania',
      builder: (context) =>
          Column(
            children: <Widget>[

              Row(

                children: [
                  Expanded(
                    child: SimpleButton(
                        radius: AppCard.bigRadius,
                        padding: const EdgeInsets.all(Dimen.ICON_MARG),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.calendarArrowRight, color: iconDisab_(context)),
                            const SizedBox(width: Dimen.ICON_MARG),
                            AppText('Od: <b>${fromDate==null?'zawsze':dateToString(fromDate!, shortMonth: true, yearAbbr: 'A.D.')}</b>')
                          ],
                        ),
                        onTap: () async{
                          fromDate = await showDatePicker(
                              context: context,
                              initialDate: toDate??startDate,
                              firstDate: startDate,
                              lastDate: toDate??DateTime.now()
                          );
                          if(onChanged != null) onChanged!();
                          setState(() {});
                        }
                    ),
                  ),
                  Expanded(
                    child: SimpleButton(
                        radius: AppCard.bigRadius,
                        padding: const EdgeInsets.all(Dimen.ICON_MARG),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.calendarArrowLeft, color: iconDisab_(context)),
                            const SizedBox(width: Dimen.ICON_MARG),
                            AppText('Do: <b>${toDate==null?'zawsze':dateToString(toDate!, shortMonth: true,  yearAbbr: 'A.D.')}</b>')
                          ],
                        ),
                        onTap: () async{
                          toDate = await showDatePicker(
                            context: context,
                            initialDate: toDate??DateTime.now(),
                            firstDate: fromDate??startDate,
                            lastDate: DateTime.now()
                          );
                          if(onChanged != null) onChanged!();
                          setState(() {});
                        }
                    ),
                  )
                ],
              ),

              const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

              TagLayout.customWrap(
                allTags: TagWidget.TAGS,
                onTagTap: (String tag, bool checked){
                  checked = !checked;
                  if(checked) checkedTags.remove(tag);
                  else checkedTags.add(tag);
                  setState((){});
                  if(onChanged != null) onChanged!();
                },
                checkedTags: checkedTags,
                tagBuilder: (context, tag, checked) => SimpleButton(
                  radius: AppCard.bigRadius,
                  padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    child: Text(
                      tag,
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: checked?TagWidget.colors[tag]!.item1:hintEnab_(context),
                          fontWeight: weight.bold,
                        shadow: checked
                      ),
                    ),
                    onTap: (){
                      setState(() => checked?checkedTags.remove(tag):checkedTags.add(tag));
                      if(onChanged != null) onChanged!();
                    }
                )
              ),

              const SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ],
          ),
    );
  }

}

class CurrentItemsProvider extends ChangeNotifier{

  List<Article>? _currArticles;
  List<Article>? get currArticles => _currArticles;
  set currArticles(List<Article>? value){
    _currArticles = value;
    notifyListeners();
  }

  void clear(){
    _currArticles = null;
    notifyListeners();
  }

  void notify() => notifyListeners();
}

class SearchParamsProvider extends ChangeNotifier {

  late ArticleSearchOptions _searchOptions;
  late TextEditingController _controller;

  ArticleSearchOptions get options => _searchOptions;
  TextEditingController get textController => _controller;

  SearchParamsProvider({ArticleSearchOptions? searchOptions, String initPhrase=''}){
    _searchOptions = searchOptions??ArticleSearchOptions();
    _controller = TextEditingController(text: initPhrase);
  }

  clear(){
    _searchOptions.clear();
    _controller.clear();
    notifyListeners();
  }

  set phrase(String value){
    _controller.text = value;
    notifyListeners();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void notify() => notifyListeners();

}