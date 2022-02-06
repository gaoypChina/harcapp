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
          padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            TitleShortcutRowWidget(
                title: 'Strefa zagrożenia!',
                titleColor: hintEnab_(context),
            ),

            LeaveButton(comp),

            SimpleButton(
                radius: AppCard.BIG_RADIUS,
                padding: EdgeInsets.all(Dimen.SIDE_MARG),
                color: backgroundIcon_(context),
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

                child: SizedBox(
                  height: 100,
                  child: Stack(
                    children: [

                      Positioned(
                        top: 0,
                        right: 0,
                        child: Icon(
                          MdiIcons.nuke,
                          size: 60,
                          color: backgroundIcon_(context),
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          'Rozwiąż\nwspółzawodnictwo',
                          style: AppTextStyle(
                              fontSize: Dimen.TEXT_SIZE_APPBAR,
                              fontWeight: weight.bold,
                              color: iconEnab_(context)
                          ),
                        ),
                      )
                    ],
                  ),
                )
            ),

          ]))
        ),

      ]
  );

  @override
  bool get wantKeepAlive => true;

}
