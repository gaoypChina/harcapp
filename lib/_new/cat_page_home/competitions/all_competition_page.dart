import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_home/competitions/competitions_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/indiv_comp_preview_grid.dart';
import 'package:harcapp/_new/cat_page_home/competitions/start_widgets/indiv_comp_prompt.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

import 'new_comp_type.dart';
import 'indiv_comp/indiv_comp_editor/_main.dart';
import 'indiv_comp/indiv_comp_page.dart';
import 'indiv_comp/indiv_comp_loader.dart';
import 'indiv_comp/indiv_comp_thumbnail_widget.dart';
import 'indiv_comp/models/indiv_comp.dart';

class CompetitionsPage extends StatefulWidget{

  const CompetitionsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CompetitionsPageState();

}

class CompetitionsPageState extends State<CompetitionsPage>{

  late RefreshController refreshController;

  late IndivCompLoaderListener _listener;

  @override
  void initState() {
    refreshController = RefreshController();

    _listener = IndivCompLoaderListener(
      onError: (message) async {
        refreshController.refreshCompleted();
        if(mounted) setState(() {});
      },
      onIndivCompsLoaded: (List<IndivComp> comps){
        Provider.of<IndivCompProvider>(context, listen: false).notify();
        Provider.of<IndivCompListProvider>(context, listen: false).notify();

        refreshController.refreshCompleted();
        if(mounted) setState(() {});
      },
    );

    indivCompLoader.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    indivCompLoader.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SmartRefresher(
      enablePullDown: true,
      physics: const BouncingScrollPhysics(),
      header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: accent_(context)),
      controller: refreshController,
      onRefresh: () async {

        if(!await isNetworkAvailable()){
          showAppToast(context, text: 'Brak dostępu do Internetu');
          refreshController.refreshCompleted();
          return;
        }

        indivCompLoader.run();
      },
      child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              title: Text('Współzawodnictwa'),
              centerTitle: true,
              floating: true,
            ),
            SliverList(delegate: SliverChildListDelegate([
              CompetitionsWidget(competitionWidgetBuilder: (_) => _CompListWidget())
            ]))
          ]
      ));
}

class _CompListWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _CompListWidgetState();

}

class _CompListWidgetState extends State<_CompListWidget>{

  String? searchPhrase;
  List<IndivComp>? searchedComps;

  @override
  void initState() {
    searchedComps = IndivComp.all;

    super.initState();
  }

  void selectIndivComps(String text){

    if(text.isEmpty) {
      searchedComps = IndivComp.all;
      return;
    }

    List<IndivComp> comps = [];
    for(IndivComp comp in IndivComp.all!)
      if(remPolChars(comp.name).contains(remPolChars(text)))
        comps.add(comp);

    searchedComps = comps;
  }

  @override
  Widget build(BuildContext context) => Consumer<IndivCompListProvider>(
      builder: (context, prov, child) {

        List<Widget> widgets = [];

        if(IndivComp.all == null)
          return const IndivCompPrompt(
            text: 'Coś poszło nie tak',
            icon: MdiIcons.closeOutline,
            child: IndivCompPreviewGrid(),
          );

        else {

          if (IndivComp.all!.length > 3)
            widgets.add(SearchField(
                hint: 'Szukaj współzawodnictw:',
                onChanged: (text) => setState(() => selectIndivComps(text))
            ));

          for (int i = 0; i < searchedComps!.length; i++) {
            widgets.add(
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                  child: IndivCompTile(
                    searchedComps![i],
                    showPinned: true,
                  ),
                )
            );

            widgets.add(const SizedBox(height: Dimen.ICON_MARG));
          }
          if (IndivComp.all!.isEmpty)
            widgets.add(const IndivCompPrompt(child: IndivCompPreviewGrid()));
          else {
            widgets.add(Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(width: 2*Dimen.SIDE_MARG + IndivCompThumbnailWidget.defSize, child: Center(
                child: Icon(MdiIcons.dotsHorizontal, color: hintEnab_(context)),
              )),
            ));
            widgets.add(const SizedBox(height: Dimen.ICON_MARG));
          }

          widgets.add(const Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: NewIndivCompButton(),
          ));
        }

        return Column(children: widgets);

      }
  );

}

class NewIndivCompButton extends StatelessWidget{

  const NewIndivCompButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.BIG_RADIUS,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Row(
        children: [

          SizedBox(
            width: IndivCompThumbnailWidget.defSize,
            height: IndivCompThumbnailWidget.defSize,
            child: GradientWidget(
                radius: IndivCompThumbnailWidget.defSize*IndivCompThumbnailWidget.outerRadiusSizeFactor,
                colorStart: hintEnab_(context),
                colorEnd: textEnab_(context)!,
                child: Padding(
                  padding: const EdgeInsets.all(IndivCompThumbnailWidget.defSize*IndivCompThumbnailWidget.borderSizeFactor),
                  child: Material(
                      borderRadius: BorderRadius.circular(IndivCompThumbnailWidget.defSize*IndivCompThumbnailWidget.innerRadiusSizeFactor,),
                      color: background_(context),
                      child: GradientIcon(
                        MdiIcons.plus,
                        size: IndivCompThumbnailWidget.defSize * IndivCompThumbnailWidget.iconSizeFactor,
                        colorStart: hintEnab_(context),
                        colorEnd: textEnab_(context),
                      )
                  ),
                )
            ),
          ),

          const SizedBox(width: Dimen.SIDE_MARG),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text('Nowe',
                  style: AppTextStyle(
                      fontSize: IndivCompTile.textSizePkt,
                      color: hintEnab_(context),
                      fontWeight: weight.bold)),

              Text('współzawodnictwo',
                  style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR,
                      color: hintEnab_(context),
                      fontWeight: weight.bold))

            ],
          )

        ],
      ),
      onTap: () async {
        NewCompType? type = await pickCompType(context);
        if (type == null) return;

        List<String> exampleNames = [
          'Dolina muminków',
          'Drużyna pierścienia',
          'Ekipa krecika',
          'Kapitol szlachty',
          'Księga dżungli',
          'Kto pierwszy ten lepszy',
          'Liga nieprzeciętnych',
          'Rybki z ferajny',
          'Śmietanka towarzystwa',
          'Załoga G',
          'Zwierzogród',
        ];

        if(type == NewCompType.join)
          return;
        else
          pushPage(
            context,
            builder: (context) =>
                IndivCompEditorPage(
                  initTitle: type == NewCompType.empty ? null : exampleNames[Random().nextInt(
                      exampleNames.length)],
                  initTasks: type == NewCompType.empty ? null : List.of(
                      IndivComp.previewTasks),
                  initAwards: type == NewCompType.empty ? null : List.of(
                      IndivComp.previewAwards),

                  onSaved: (comp) async {
                    IndivComp.addToAll(context, comp);
                    Navigator.pop(context);
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => IndivCompPage(IndivComp.all!.last)));
                  },
                ),
          );
      }
  );

}