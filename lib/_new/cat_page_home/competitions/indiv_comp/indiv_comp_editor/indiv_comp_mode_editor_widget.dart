import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/indiv_comp_rank_icon.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/rank_disp_type.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/show_rank_data.dart';
import 'common.dart';

class IndivCompModeEditorWidget extends StatefulWidget{

  static bool verifyHandleDateOrder(BuildContext context){
    ModeProvider prov = Provider.of<ModeProvider>(context, listen: false);

    bool isAllOk = prov.startDate!.isBefore(prov.endDate!);

    if(!isAllOk)
      showAppToast(
          context,
          text: '<b>Ostrożnie</b>! Współzawodnictwo <b>cofa się w czasie</b>.\nKończy się przed rozpoczęciem.',
          duration: const Duration(seconds: 5)
      );

    return isAllOk;
  }

  const IndivCompModeEditorWidget({super.key});

  @override
  State<StatefulWidget> createState() => _IndivCompModeEditorWidgetState();

}

class _IndivCompModeEditorWidgetState extends State<IndivCompModeEditorWidget> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) => CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

        SliverPadding(
          padding: EdgeInsets.zero, //.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            Consumer<ModeProvider>(
                builder: (context, prov, child) => ListTile(
                    leading: const Icon(MdiIcons.calendarBlankOutline),
                    title: Text('Czas rozpoczęcia', style: AppTextStyle()),
                    subtitle: Text(dateToString(prov.startDate!, shortMonth: true), style: AppTextStyle()),
                    onTap: () async {
                      DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: prov.startDate!,
                          firstDate: DateTime(966),
                          lastDate: DateTime(3000)
                      );

                      if(dateTime == null) return;
                      prov.startDate = dateTime;
                      IndivCompModeEditorWidget.verifyHandleDateOrder(context);
                    }
                )
            ),

            Consumer<ModeProvider>(
                builder: (context, prov, child) => ListTile(
                    leading: const Icon(MdiIcons.calendarOutline),
                    title: Text('Czas zakończenia', style: AppTextStyle()),
                    subtitle: Text(dateToString(prov.endDate!, shortMonth: true), style: AppTextStyle()),
                    onTap: () async {
                      DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: prov.endDate!,
                          firstDate: DateTime(966),
                          lastDate: DateTime(3000)
                      );

                      if(dateTime == null) return;
                      prov.endDate = dateTime;
                      IndivCompModeEditorWidget.verifyHandleDateOrder(context);
                    }
                )
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            const SettingsPartHeader('Widok rankingu'),

            Consumer<ModeProvider>(
                builder: (context, prov, child){

                  return Column(
                    children: [

                      ListTile(
                        isThreeLine: true,
                        onTap: () => prov.rankDispType = RankDispType.EXACT,
                          trailing: Opacity(
                            opacity: prov.rankDispType == RankDispType.EXACT?1:.5,
                            child: IndivCompRankOtherIcon(
                              rank: ShowRankData.fromShowRank(8),
                              activeParticipCnt: null,
                              colors: Provider.of<ColorKeyProvider>(context, listen: false).colors,
                              size: 48.0,
                            ),
                          ),
                          title: Text(
                            'Dokładny',
                            style: AppTextStyle(
                              fontWeight: weight.halfBold,
                              color: prov.rankDispType == RankDispType.EXACT?textEnab_(context): hintEnab_(context)
                            )
                          ),
                          subtitle: Text(
                            'Każdy uczestnik widzi swoją dokładną pozycję w rankingu.',
                            style: AppTextStyle(
                              color: prov.rankDispType == RankDispType.EXACT?textEnab_(context): hintEnab_(context)
                            ),
                          ),
                      ),

                      ListTile(
                        isThreeLine: true,
                        onTap: () => prov.rankDispType = RankDispType.RANGE,
                        trailing: Opacity(
                          opacity: prov.rankDispType == RankDispType.RANGE?1:.5,
                          child: IndivCompRankOtherIcon(
                            rank: ShowRankData.fromRankRange(.7, .9),
                            activeParticipCnt: 20,
                            showPercent: false,
                            colors: Provider.of<ColorKeyProvider>(context, listen: false).colors,
                            size: 48.0,
                          ),
                        ),
                        title: Text(
                            'Zakresowy',
                            style: AppTextStyle(
                                fontWeight: weight.halfBold,
                                color: prov.rankDispType == RankDispType.RANGE?textEnab_(context): hintEnab_(context)
                            )
                        ),
                        subtitle: Text(
                          'Uczestnicy nisko w rankingu widzą zakres swojej pozycji.',
                          style: AppTextStyle(
                              color: prov.rankDispType == RankDispType.RANGE?textEnab_(context): hintEnab_(context)
                          ),
                        ),
                      ),

                      ListTile(
                        isThreeLine: true,
                        onTap: () => prov.rankDispType = RankDispType.RANGE_PERC,
                        trailing: Opacity(
                          opacity: prov.rankDispType == RankDispType.RANGE_PERC?1:.5,
                          child: IndivCompRankOtherIcon(
                            rank: ShowRankData.fromRankRange(.7, .9),
                            activeParticipCnt: 20,
                            showPercent: true,
                            colors: Provider.of<ColorKeyProvider>(context, listen: false).colors,
                            size: 48.0,
                          ),
                        ),
                        title: Text(
                            'Zakresowy procentowy',
                            style: AppTextStyle(
                                fontWeight: weight.halfBold,
                                color: prov.rankDispType == RankDispType.RANGE_PERC?textEnab_(context): hintEnab_(context)
                            )
                        ),
                        subtitle: Text(
                          'Uczestnicy nisko w rankingu widzą zakres procent. swojej pozycji.',
                          style: AppTextStyle(
                              color: prov.rankDispType == RankDispType.RANGE_PERC?textEnab_(context): hintEnab_(context)
                          ),
                        ),
                      ),


                    ],
                  );
                }
            )

          ]))
        ),
      ]
  );

  @override
  bool get wantKeepAlive => true;

}
