
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/slownik/writing_rules_page.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'data.dart';
import 'lang.dart';

class SlownikFragment extends StatefulWidget {

  const SlownikFragment({super.key});

  @override
  State createState() => SlownikFragmentState();

}

class SlownikFragmentState extends State<SlownikFragment> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.slownik;

  static const double _iconSize = 30;

  late Lang lang1;
  late Lang lang2;

  final GlobalKey keyPDF = GlobalKey();

  TextEditingController? controller;

  late List<TransData> _items;

  late KeyboardVisibilityController keyboardVisibilityController;

  @override
  void initState() {
    super.initState();

    lang1 = Lang.pol;
    lang2 = Lang.eng;
    controller = TextEditingController();
    _items = sortFilterItems(allWordsData);

    keyboardVisibilityController = KeyboardVisibilityController();
    keyboardVisibilityController.onChange.listen((bool visible){
      if(mounted) setState((){/*KeyboardVisibility.isVisible*/});
    });
  }

  @override
  Widget build(BuildContext context) {

    Lang? _lang1 = lang1;
    Lang? _lang2 = lang2;

    if(lang1 == lang2 && lang2 == Lang.pol)
      _lang2 = Lang.mug;

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            title: const Text('Słownik harcerski'),
            centerTitle: true,
            pinned: true,
            floating: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.spellcheck),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WritingRulesPage())),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, SearchField.height),
              child: SearchField(
                hint: 'Wpisz słowo:',
                controller: controller,
                background: background_(context),
                onChanged: (text) => setState(() => _items = getItems()),
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
            sliver: SliverList(
              delegate: SliverChildSeparatedBuilderDelegate((BuildContext context, int index) {

                TransLangData langData1 = _items[index].get(_lang1)!;
                TransLangData langData2 = _items[index].get(_lang2)!;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Dimen.ICON_MARG),
                      child: Icon(
                        _items[index].icon,
                        size: _iconSize,
                        color: accent_(context),
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: Dimen.ICON_MARG + (_iconSize - WordWidget.textSize)/2),

                          Align(
                              alignment: Alignment.centerLeft,
                              child: WordWidget(langData1.word, weight.bold)
                          ),
                          const SizedBox(height: Dimen.ICON_MARG),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(MdiIcons.circleSmall, size: Dimen.TEXT_SIZE_BIG),
                              const SizedBox(width: Dimen.defMarg),
                              Expanded(child: WordWidget(langData2.word, weight.halfBold)),
                            ],
                          ),

                          Column(
                            children: langData2.alt.map((word) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(MdiIcons.circleSmall, size: Dimen.TEXT_SIZE_BIG),
                                const SizedBox(width: Dimen.defMarg),
                                Expanded(child: WordWidget(word, weight.halfBold)),
                              ],
                            )).toList(),
                          )

                        ],
                      ),
                    )
                  ],
                );
              },
                count: _items.length,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.SIDE_MARG),
              ),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => chooseLangs(),
          icon: const Icon(MdiIcons.translate),
          label: Text('${langAbbr[lang1]} - ${langAbbr[lang2]}', style: AppTextStyle(fontWeight: weight.halfBold))
      )
    );

  }

  List<TransData> sortFilterItems(List<TransData> items){

    List<TransData> _items = List.of(items);
    _items.removeWhere((element) => element.get(lang1) == null || element.get(lang2) == null);

    _items.sort((TransData a, TransData b){
      String strA = a.get(lang1)!.word.word.toLowerCase()
          .replaceAll('(', '')
          .replaceAll(')', '');

      String strB = b.get(lang1)!.word.word.toLowerCase()
          .replaceAll('(', '')
          .replaceAll(')', '');

      return strA.compareTo(strB);
    });

    return _items;
  }

  List<TransData> getItems(){

    List<TransData> allItems = sortFilterItems(allWordsData);
    if(controller!.text.isEmpty) return allItems;

    List<TransData> resultItems = [];
    for(TransData item in allItems)
      if(remPolChars(remSpecChars(item.get(lang1)!.word.word)).contains(remPolChars(remSpecChars(controller!.text))) ||
          remPolChars(remSpecChars(item.get(lang2)!.word.word)).contains(remPolChars(remSpecChars(controller!.text))))
        resultItems.add(item);

    return resultItems;
  }

  void chooseLangs(){
    showScrollBottomSheet(context: context, builder: (BuildContext context) {
      return BottomSheetDef(
        textColor: textEnab_(context),
        builder: (context) => LangsPicker(
            lang1,
            lang2,
            onChanged: (Lang langFrom, Lang langTo){
              setState(() {
                lang1 = langFrom;
                lang2 = langTo;
              });
              _items = getItems();
            }
        ),
      );
    });
  }

}

class WordWidget extends StatelessWidget{

  static const double textSize = Dimen.TEXT_SIZE_BIG;

  final TransWordData word;
  final weight w;
  const WordWidget(this.word, this.w, {super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: textSize),
            children: <TextSpan>[
              if(word.prefix != null)
                TextSpan(text: '${word.prefix} ', style: AppTextStyle(fontWeight: w, color: hintEnab_(context))),
              TextSpan(text: word.word, style: AppTextStyle(fontWeight: w, color: textEnab_(context))),
              if(word.suff != null)
                TextSpan(text: ' ${word.suff}', style: AppTextStyle(fontWeight: w, color: hintEnab_(context))),

              if(word.explain != null)
                TextSpan(text: ' (${word.explain})', style: AppTextStyle(fontWeight: w, color: hintEnab_(context))),
            ],
          ),
        ),

        if(word.example != null)
          Text('np. ${word.example}', style: AppTextStyle(color: hintEnab_(context), fontSize: textSize)),

        if(word.literalTrans != null)
          Text('dosł.: ${word.literalTrans}', style: AppTextStyle(color: hintEnab_(context), fontSize: textSize))

      ],
    );
  }

}

class LangButton extends StatelessWidget{

  final Lang lang;
  final bool selected;
  final void Function()? onTap;
  const LangButton(this.lang, this.selected, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {

    return SimpleButton(
        padding: const EdgeInsets.all(Dimen.ICON_MARG),
        onTap: onTap,
        child: Text(
            langName[lang]!,
            style: AppTextStyle(
              color: selected?accent_(context):hintEnab_(context),
              fontSize: Dimen.TEXT_SIZE_BIG,
              fontWeight: selected?weight.bold:weight.halfBold
            )
        )
    );
  }

}

class LangsPicker extends StatefulWidget{

  final Lang initLangFrom;
  final Lang initLangTo;

  final void Function(Lang langFrom, Lang langTo)? onChanged;

  const LangsPicker(this.initLangFrom, this.initLangTo, {this.onChanged, super.key});

  @override
  State<StatefulWidget> createState() => LangsPickerState();

}

class LangsPickerState extends State<LangsPicker>{

  late Lang langFrom;
  late Lang langTo;

  void onChanged() => widget.onChanged?.call(langFrom, langTo);

  @override
  void initState() {
    langFrom = widget.initLangFrom;
    langTo = widget.initLangTo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Expanded(
          child: Column(
            children: <Widget>[
              LangButton(Lang.pol, langFrom == Lang.pol, onTap: (){setState(() => langFrom = Lang.pol); onChanged();}),
              LangButton(Lang.eng, langFrom == Lang.eng, onTap: (){setState(() => langFrom = Lang.eng); onChanged();}),
              LangButton(Lang.ger, langFrom == Lang.ger, onTap: (){setState(() => langFrom = Lang.ger); onChanged();}),
              LangButton(Lang.esp, langFrom == Lang.esp, onTap: (){setState(() => langFrom = Lang.esp); onChanged();}),
              LangButton(Lang.ita, langFrom == Lang.ita, onTap: (){setState(() => langFrom = Lang.ita); onChanged();}),
              LangButton(Lang.cze, langFrom == Lang.cze, onTap: (){setState(() => langFrom = Lang.cze); onChanged();}),
              LangButton(Lang.nor, langFrom == Lang.nor, onTap: (){setState(() => langFrom = Lang.nor); onChanged();}),
              LangButton(Lang.ned, langFrom == Lang.ned, onTap: (){setState(() => langFrom = Lang.ned); onChanged();}),
            ],
          ),
        ),

        IconButton(
            icon: const Icon(MdiIcons.swapHorizontal),
            onPressed: (){
              setState(() {
                Lang? langTmp = langFrom;
                langFrom = langTo;
                langTo = langTmp;
              });
              onChanged();
            }
        ),

        Expanded(
          child: Column(
            children: <Widget>[
              LangButton(Lang.pol, langTo == Lang.pol, onTap: (){setState(() => langTo = Lang.pol); onChanged();}),
              LangButton(Lang.eng, langTo == Lang.eng, onTap: (){setState(() => langTo = Lang.eng); onChanged();}),
              LangButton(Lang.ger, langTo == Lang.ger, onTap: (){setState(() => langTo = Lang.ger); onChanged();}),
              LangButton(Lang.esp, langTo == Lang.esp, onTap: (){setState(() => langTo = Lang.esp); onChanged();}),
              LangButton(Lang.ita, langTo == Lang.ita, onTap: (){setState(() => langTo = Lang.ita); onChanged();}),
              LangButton(Lang.cze, langTo == Lang.cze, onTap: (){setState(() => langTo = Lang.cze); onChanged();}),
              LangButton(Lang.nor, langTo == Lang.nor, onTap: (){setState(() => langTo = Lang.nor); onChanged();}),
              LangButton(Lang.ned, langTo == Lang.ned, onTap: (){setState(() => langTo = Lang.ned); onChanged();}),
            ],
          ),
        )

      ],
    );
  }

}