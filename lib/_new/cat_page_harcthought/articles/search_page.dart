
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/title_widget/article_card_widget_small.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/article_widget.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core_tags/tag_layout.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'article_core.dart';
import 'article_searcher.dart';
import 'title_widget/article_tag_widget.dart';
import 'title_widget/article_card_widget.dart';

class ArticleSearchPage extends StatefulWidget{

  final List<Article> allArticles;

  const ArticleSearchPage(this.allArticles);

  @override
  State createState() => ArticleSearchPageState();

}

class ArticleSearchPageState extends State<ArticleSearchPage>{

  List<Article> get allArticles => widget.allArticles;

  //List<ArticleCore> searchedArticles;

  TextEditingController textController;

  ArticleSearchOptions options;
  ArticleSearcher searcher;

  CurrentItemsProvider currentItemsProvider;
  SearchParamsProvider searchParamsProvider;

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
        => currentItemsProvider.currArticles = articles);
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
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                backgroundColor: background_(context),
                title: Text('Szukaj artykułów'),
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

              SliverList(delegate: SliverChildListDelegate([SizedBox(height: 3.0)])),

              Consumer<CurrentItemsProvider>(
                  builder: (context, prov, child){

                    if(prov.currArticles == null)
                      return SliverFillRemaining(child: Center(child: CircularProgressIndicator()));
                    else if(prov.currArticles.isEmpty)
                      return SliverFillRemaining(child: Center(child: _NoArticlesWidget()));
                    else
                      return SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: ArticleCardWidgetSmall.aspectRatio,
                        ),
                        delegate: SliverChildBuilderDelegate((BuildContext context, int index) =>
                            ArticleCardWidgetSmall(
                              prov.currArticles[index],
                              onTap: (context, article, background, articleSeenProv){
                                Navigator.pop(context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ArticleWidget(
                                          article,
                                          cover: background,
                                          articleNotifProv: articleSeenProv,
                                        )
                                    )
                                );
                              },
                              key: ValueKey(prov.currArticles[index]),
                            ),
                            childCount: prov.currArticles.length
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

Future<void> _showOptionsBottomSheet(BuildContext context, ArticleSearchOptions options, ArticleSearcher searcher, TextEditingController controller, {void Function() onChanged}) => showScrollBottomSheet(
    context: context,
    builder: (context) => BottomSheetOptions(options, searcher, onChanged: () async{
      await searcher.init(Article.all, options);
      searcher.run(controller.text);
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
        SizedBox(height: 10,),
        Text('Brak artykułów o zadanych kryteriach.', style: AppTextStyle(fontWeight: weight.halfBold), textAlign: TextAlign.center,)
      ],
    );
  }

}

class _SearchTextFieldCard extends StatelessWidget{

  final void Function(String) onChanged;
  final void Function() onCleared;

  final ArticleSearcher searcher;
  final ArticleSearchOptions searchOptions;
  DateTime get fromDate => searchOptions.fromDate;
  DateTime get toDate => searchOptions.toDate;

  final TextEditingController textController;

  const _SearchTextFieldCard(
      { @required this.searcher,
        @required this.searchOptions,
        @required this.textController,
        this.onChanged,
        this.onCleared,
      });

  @override
  Widget build(BuildContext context) {
    return SearchField(
      hint: 'Tytuł, autor, wykonawca, słowa:',

      controller: textController,
      onChanged: (String text) async {
        if(text == '#') {
          hideKeyboard(context);
          await _showOptionsBottomSheet(context, searchOptions, searcher, textController);
          textController.clear();
        } else {
          searcher.run(text);
          if(onChanged != null) onChanged(text);
        }
      },

      leading: AnimatedChildSlider(
        index: searchOptions.isEmpty?0:1,
        children: [
          SearchField.defLeadWidget(context),
          IconButton(
            icon: Icon(MdiIcons.close, color: iconEnab_(context)),
            onPressed: () async{

              textController.clear();
              searchOptions.clear();
              if(onCleared!=null) onCleared();
              if(onChanged != null) onChanged('');

              await searcher.run('');

            },
          )
        ],
      ),
      trailing: IconButton(
          icon: Icon(MdiIcons.cogOutline, color: iconEnab_(context)),
          onPressed: () async {

            hideKeyboard(context);
            await _showOptionsBottomSheet(context, searchOptions, searcher, textController,
                onChanged: () => onChanged==null?null:onChanged(textController.text));

            await searcher.run(textController.text);

          }),
      bottom:
      (searchOptions.isEmpty)?
      null:
      SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: Dimen.DEF_MARG, right: Dimen.DEF_MARG, bottom: Dimen.DEF_MARG),
          child: Container(
            height: 2*Dimen.DEF_MARG + Dimen.TEXT_SIZE_NORMAL + 3,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: Dimen.DEF_MARG),
                  if(fromDate != null || toDate != null)
                  Text(
                    '${fromDate==null?'...':dateToString(fromDate, shortMonth: true, yearAbbr: '')} - ${toDate==null?'...':dateToString(toDate, shortMonth: true, yearAbbr: 'A.D.')}',
                    style: AppTextStyle(fontWeight: weight.halfBold),
                  ),
                  SizedBox(width: Dimen.DEF_MARG/2),
                  Row(
                    children: searchOptions.checkedTags.map((t) => Tag(
                      t,
                      inCard: false,
                      fontSize: Dimen.TEXT_SIZE_SMALL,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.only(left: Dimen.DEF_MARG, right: Dimen.DEF_MARG),
                      elevate: false,
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
  final void Function() onChanged;

  const BottomSheetOptions(this.searchOptions, this.searcher, {this.onChanged});

  @override
  State<StatefulWidget> createState() => BottomSheetOptionsState();
}

class BottomSheetOptionsState extends State<BottomSheetOptions>{

  ArticleSearchOptions get searchOptions => widget.searchOptions;
  ArticleSearcher get searcher => widget.searcher;
  void Function() get onChanged => widget.onChanged;

  DateTime get fromDate => widget.searchOptions.fromDate;
  set fromDate(DateTime value) => widget.searchOptions.fromDate = value;

  DateTime get toDate => widget.searchOptions.toDate;
  set toDate(DateTime value) => widget.searchOptions.toDate = value;

  List<String> get checkedTags => searchOptions.checkedTags;
  set checkedTags(List<String> value) => searchOptions.checkedTags = value;


  @override
  Widget build(BuildContext context) {

    DateTime startDate = DateTime(2016, 1, 1);

    return BottomSheetDef(
      childMargin: EdgeInsets.all(Dimen.DEF_MARG/2),
      title: 'Opcje wyszukiwania',
      builder: (context) =>
          Column(
            children: <Widget>[

              Row(

                children: [
                  Expanded(
                    child: SimpleButton(
                        radius: AppCard.BIG_RADIUS,
                        padding: EdgeInsets.all(Dimen.ICON_MARG),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.calendarArrowRight, color: iconDisab_(context)),
                            SizedBox(width: Dimen.ICON_MARG),
                            AppText('Od: <b>${fromDate==null?'zawsze':dateToString(fromDate, shortMonth: true, yearAbbr: 'A.D.')}</b>')
                          ],
                        ),
                        onTap: () async{
                          fromDate = await showDatePicker(
                              context: context,
                              initialDate: toDate??startDate,
                              firstDate: startDate,
                              lastDate: toDate??DateTime.now()
                          );
                          if(onChanged != null) onChanged();
                          setState(() {});
                        }
                    ),
                  ),
                  Expanded(
                    child: SimpleButton(
                        radius: AppCard.BIG_RADIUS,
                        padding: EdgeInsets.all(Dimen.ICON_MARG),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(MdiIcons.calendarArrowLeft, color: iconDisab_(context)),
                            SizedBox(width: Dimen.ICON_MARG),
                            AppText('Do: <b>${toDate==null?'zawsze':dateToString(toDate, shortMonth: true,  yearAbbr: 'A.D.')}</b>')
                          ],
                        ),
                        onTap: () async{
                          toDate = await showDatePicker(
                            context: context,
                            initialDate: toDate??DateTime.now(),
                            firstDate: fromDate??startDate,
                            lastDate: DateTime.now()
                          );
                          if(onChanged != null) onChanged();
                          setState(() {});
                        }
                    ),
                  )
                ],
              ),

              SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

              TagLayout.customWrap(
                allTags: ArticleTagWidget.TAGS,
                onTagTap: (String tag, bool checked){
                  checked = !checked;
                  if(checked) checkedTags.remove(tag);
                  else checkedTags.add(tag);
                  setState((){});
                  if(onChanged != null) onChanged();
                },
                checkedTags: checkedTags,
                tagBuilder: (context, tag, checked) => SimpleButton(
                  radius: AppCard.BIG_RADIUS,
                  padding: EdgeInsets.all(Dimen.ICON_MARG),
                    child: Text(
                      tag,
                      style: AppTextStyle(
                          fontSize: Dimen.TEXT_SIZE_BIG,
                          color: checked?ArticleTagWidget.colors[tag].item1:hintEnab_(context),
                          fontWeight: weight.bold,
                        shadow: checked
                      ),
                    ),
                    onTap: (){
                      setState(() => checked?checkedTags.remove(tag):checkedTags.add(tag));
                      if(onChanged != null) onChanged();
                    }
                )
              ),

              SizedBox(height: Dimen.BOTTOM_SHEET_MARG),

            ],
          ),
    );
  }

}

class CurrentItemsProvider extends ChangeNotifier{

  List<Article> _currArticles;
  List<Article> get currArticles => _currArticles;
  set currArticles(List<Article> value){
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

  ArticleSearchOptions _searchOptions;
  TextEditingController _controller;

  ArticleSearchOptions get options => _searchOptions;
  TextEditingController get textController => _controller;

  SearchParamsProvider({ArticleSearchOptions searchOptions, String initPhrase=''}){
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