import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_details.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class IndivCompModeEditorWidget extends StatefulWidget{

  static bool verifyHandleDateOrder(BuildContext context){
    ModeProvider prov = Provider.of<ModeProvider>(context, listen: false);

    bool isAllOk = prov.startDate.isBefore(prov.endDate);

    if(!isAllOk)
      showAppToast(
          context,
          text: '<b>Ostrożnie</b>! Współzawodnictwo <b>cofa się w czasie</b>.\nKończy się przed rozpoczęciem.',
          duration: Duration(seconds: 5)
      );

    return isAllOk;
  }

  final IndivCompDetails initComp;

  const IndivCompModeEditorWidget({this.initComp});

  @override
  State<StatefulWidget> createState() => _IndivCompModeEditorWidgetState();

}

class _IndivCompModeEditorWidgetState extends State<IndivCompModeEditorWidget> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) => CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

        SliverPadding(
          padding: EdgeInsets.only(left: Dimen.SIDE_MARG, right: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            TitleShortcutRowWidget(
                title: 'Czas trwania',
                titleColor: hintEnab_(context),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Consumer<ModeProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                      context: context,
                      margin: EdgeInsets.zero,
                      icon: MdiIcons.calendarStart,
                      text: dateToString(prov.startDate, shortMonth: true),
                      onTap: () async {
                        DateTime dateTime = await showDatePicker(
                            context: context,
                            initialDate: prov.startDate,
                            firstDate: DateTime(966),
                            lastDate: DateTime(3000)
                        );

                        if(dateTime == null) return;
                        prov.startDate = dateTime;
                        IndivCompModeEditorWidget.verifyHandleDateOrder(context);
                      }
                  )
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child:
              Consumer<ModeProvider>(
                  builder: (context, prov, child) => SimpleButton.from(
                      context: context,
                      margin: EdgeInsets.zero,
                      icon: MdiIcons.calendarEnd,
                      text: dateToString(prov.endDate, shortMonth: true),
                      onTap: () async {
                        DateTime dateTime = await showDatePicker(
                            context: context,
                            initialDate: prov.endDate,
                            firstDate: DateTime(966),
                            lastDate: DateTime(3000)
                        );

                        if(dateTime == null) return;
                        prov.endDate = dateTime;
                        IndivCompModeEditorWidget.verifyHandleDateOrder(context);
                      }
                  )
              ),
            ),

            SizedBox(height: 2*Dimen.SIDE_MARG),

            TitleShortcutRowWidget(
                title: 'Widok',
                titleColor: hintEnab_(context),
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: Dimen.DEF_MARG,
                  right: Dimen.DEF_MARG
              ),
              child: Consumer<ModeProvider>(
                  builder: (context, prov, child){

                    return Column(
                      children: [

                        SimpleButton(
                            onTap: () => prov.overviewMode = true,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.all(Dimen.SIDE_MARG),
                            radius: AppCard.BIG_RADIUS,
                            child: Row(
                              children: [
                                
                                Icon(
                                  MdiIcons.weatherPartlyCloudy,
                                  size: 48.0,
                                  color: prov.overviewMode?iconEnab_(context):iconDisab_(context),
                                ),

                                SizedBox(width: Dimen.SIDE_MARG),

                                Expanded(
                                  child: Text(
                                    'Uczestnicy najniżej w rangu widzą zakres swojej pozycji.',
                                    style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_BIG,
                                      color: prov.overviewMode?iconEnab_(context):iconDisab_(context),
                                    ),
                                  ),
                                )

                              ],
                            ),
                        ),


                        SimpleButton(
                            onTap: () => prov.overviewMode = false,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.all(Dimen.SIDE_MARG),
                            radius: AppCard.BIG_RADIUS,
                            child: Row(
                              children: [

                                Icon(
                                  MdiIcons.weatherSunny,
                                  size: 48.0,
                                  color: !prov.overviewMode?iconEnab_(context):iconDisab_(context),
                                ),

                                SizedBox(width: Dimen.SIDE_MARG),

                                Expanded(
                                  child: Text(
                                    'Każdy widzi swoją dokładną pozycję w rankingu.',
                                    style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_BIG,
                                      color: !prov.overviewMode?iconEnab_(context):iconDisab_(context),
                                    ),
                                  ),
                                )

                              ],
                            )
                        ),




                      ],
                    );
                  }
              ),
            )

          ]))
        ),
      ]
  );

  @override
  bool get wantKeepAlive => true;

}
