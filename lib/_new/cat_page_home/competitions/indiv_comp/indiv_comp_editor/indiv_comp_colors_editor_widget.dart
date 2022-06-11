import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/color_selector_widget.dart';
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
  Widget build(BuildContext context) => CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

        SliverList(delegate: SliverChildListDelegate([

          const SettingsPartHeader('Kolor współzawodnictwa'),

          Padding(
            padding: const EdgeInsets.only(left: settingsPartPaddingVal, right: settingsPartPaddingVal),
            child: ColorSelectorWidget(
              initColorKey: Provider.of<ColorKeyProvider>(context, listen: false).colorsKey,
              onSelected: (iconKey) => Provider.of<ColorKeyProvider>(context, listen: false).colorsKey = iconKey,
            ),
          )
        ]))

      ]
  );

  @override
  bool get wantKeepAlive => true;

}
