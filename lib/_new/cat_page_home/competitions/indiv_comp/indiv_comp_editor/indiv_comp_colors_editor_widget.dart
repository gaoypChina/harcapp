import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/color_selector_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_details.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:provider/provider.dart';

class IndivCompColorsEditorWidget extends StatefulWidget{

  final IndivCompDetails initComp;

  const IndivCompColorsEditorWidget({this.initComp});

  @override
  State<StatefulWidget> createState() => _IndivCompColorsEditorWidgetState();

}

class _IndivCompColorsEditorWidgetState extends State<IndivCompColorsEditorWidget> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) => CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

        SliverList(delegate: SliverChildListDelegate([

          TitleShortcutRowWidget(title: 'Kolor współzawodnictwa', titleColor: hintEnab_(context)),

          ColorSelectorWidget(
            initColorKey: Provider.of<ColorKeyProvider>(context, listen: false).colorsKey,
            onSelected: (iconKey) => Provider.of<ColorKeyProvider>(context, listen: false).colorsKey = iconKey,
          ),
        ]))

      ]
  );

  @override
  bool get wantKeepAlive => true;

}
