import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/icon_selector_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_details.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:provider/provider.dart';

import 'common.dart';

class IndivCompIconEditorWidget extends StatefulWidget{

  final IndivCompDetails? initComp;

  const IndivCompIconEditorWidget({this.initComp});

  @override
  State<StatefulWidget> createState() => _IndivCompIconEditorWidgetState();

}

class _IndivCompIconEditorWidgetState extends State<IndivCompIconEditorWidget> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) => CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

        SliverList(delegate: SliverChildListDelegate([

          const SettingsPartHeader('Ikona współzawodnictwa'),

          Padding(
            padding: const EdgeInsets.only(left: settingsPartPaddingVal, right: settingsPartPaddingVal),
            child: IconSelectorWidget(
              initIconKey: Provider.of<IconKeyProvider>(context, listen: false).iconKey,
              onSelected: (iconKey) => Provider.of<IconKeyProvider>(context, listen: false).iconKey = iconKey,
            ),
          )

        ]))

      ]
  );

  @override
  bool get wantKeepAlive => true;

}
