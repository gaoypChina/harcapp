import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/color_selector_widget.dart';
import 'package:harcapp/_app_common/icon_selector_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class IndivCompColorsEditorWidget extends StatefulWidget{

  const IndivCompColorsEditorWidget({super.key});

  @override
  State<StatefulWidget> createState() => _IndivCompColorsEditorWidgetState();

}

class _IndivCompColorsEditorWidgetState extends State<IndivCompColorsEditorWidget> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context){
    super.build(context);
    return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

          SliverList(delegate: SliverChildListDelegate([

            const SettingsPartHeader('Kolor współzawodnictwa'),

            ColorSelectorWidget(
              initColorKey: Provider.of<ColorKeyProvider>(context, listen: false).colorsKey,
              onSelected: (iconKey) => Provider.of<ColorKeyProvider>(context, listen: false).colorsKey = iconKey,
            ),

            const SettingsPartHeader('Ikona współzawodnictwa'),

            IconSelectorWidget(
              initIconKey: Provider.of<IconKeyProvider>(context, listen: false).iconKey,
              onSelected: (iconKey) => Provider.of<IconKeyProvider>(context, listen: false).iconKey = iconKey,
            ),

          ]))

        ]
    );
  }

  @override
  bool get wantKeepAlive => true;

}
