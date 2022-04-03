import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/_new/cat_page_home/competitions/loading_widget.dart';
import 'package:harcapp/_new/api/indiv_comp.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';

class IndivCompDangerEditorWidget extends StatefulWidget{

  final IndivComp comp;
  final void Function() onRemoved;

  const IndivCompDangerEditorWidget(this.comp, {this.onRemoved});

  @override
  State<StatefulWidget> createState() => _IndivCompDangerEditorWidgetState();

}

class _IndivCompDangerEditorWidgetState extends State<IndivCompDangerEditorWidget> with AutomaticKeepAliveClientMixin{

  IndivComp get comp => widget.comp;

  @override
  Widget build(BuildContext context) => CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

        SliverPadding(
          padding: const EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            TitleShortcutRowWidget(
                title: 'Strefa zagrożenia!',
                titleColor: hintEnab_(context),
            ),

            LeaveButton(comp),

            ListTile(
              leading: const Icon(MdiIcons.bomb),
              title: Text(
                'Rozwiąż współzawodnictwo',
                style: AppTextStyle(),
              ),
              onTap: () => showAlertDialog(
                  context,
                  title: 'Zastanów się dobrze...',
                  content: 'Współzawodnictwo <b>przestanie istnieć</b>.\n\nNie będzie już powrotu.\n\nNa pewno chcesz je <b>rozwiazać</b>?',
                  actionBuilder: (_) => [

                    AlertDialogButton(text: 'Jednak nie', onTap: () => Navigator.pop(context)),

                    AlertDialogButton(
                        text: 'Tak',
                        onTap: () async {

                          Navigator.pop(context);

                          showLoadingWidget(context, comp.colors.avgColor, 'Zwijanie współzawodnictwa...');

                          await ApiIndivComp.delete(
                              compKey: comp.key,
                              onSuccess: ()async{
                                IndivComp.removeFromAll(context, comp);
                                showAppToast(context, text: 'Poszło z dymem!');
                                Navigator.pop(context);
                              },
                              onError: () => showAppToast(context, text: 'Coś poszło nie tak...')
                          );
                          Navigator.pop(context);

                          widget.onRemoved?.call();
                        }
                    )
                  ]
              ),
            ),

          ]))
        ),

      ]
  );

  @override
  bool get wantKeepAlive => true;

}
