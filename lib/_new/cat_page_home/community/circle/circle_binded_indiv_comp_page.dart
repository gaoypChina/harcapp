import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/comp_role.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../cat_page_harcthought/apel_ewan/providers.dart';
import '../common/community_cover_colors.dart';
import '../../competitions/indiv_comp/indiv_comp_basic_data_tile.dart';
import 'model/circle.dart';

class CircleBindedIndivCompPage extends StatefulWidget{

  final Circle circle;
  final PaletteGenerator? palette;
  const CircleBindedIndivCompPage(this.circle, this.palette, {super.key});

  @override
  State<StatefulWidget> createState() => CircleBindedIndivCompPageState();

}

class CircleBindedIndivCompPageState extends State<CircleBindedIndivCompPage>{

  Circle get circle => widget.circle;
  PaletteGenerator? get palette => widget.palette;

  List<IndivComp> get bindableIndivComps{

    List<IndivComp> result = [];

    for(IndivComp comp in IndivComp.all!){
      if(comp.myProfile!.role != CompRole.ADMIN)
        continue;

      bool binded = circle.bindedIndivComps.indexWhere((compBasicData) => comp.key == compBasicData.key) != -1;
      if(binded)
        continue;

      result.add(comp);
    }

    return result;
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
    appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
    body: Consumer<BindedIndivCompsProvider>(builder: (context, prov, child) => CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: const Text('Współzawodnictwa'),
            centerTitle: true,
            backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
          ),

          SliverList(delegate: SliverChildListDelegate([

            const Padding(
              padding: EdgeInsets.only(left: Dimen.SIDE_MARG - TitleShortcutRowWidget.textStartPadding),
              child: TitleShortcutRowWidget(title: 'Powiązane', textAlign: TextAlign.start),
            ),

          ])),

          SliverPadding(
            padding: const EdgeInsets.only(
              left: Dimen.SIDE_MARG,
              right: Dimen.SIDE_MARG - Dimen.ICON_MARG
            ),
            sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate((context, index){

                  String indivCompKey = circle.bindedIndivComps[index].key;
                  if(IndivComp.allMap![indivCompKey] == null)
                    return IndivCompBasicDataTile(
                      circle.bindedIndivComps[index],
                      bottomText: 'Nie jesteś uczestnikiem',
                      bottomTextColor: CommunityCoverColors.strongColor(context, palette),
                      onTap: (_) => showAppToast(context, text: 'Aby dołączyć, odezwij się do administratora współzawodnictwa'),
                      trailing: IconButton(
                        icon: const Icon(MdiIcons.close),
                        onPressed: () async {

                          CircleProvider circleProv = Provider.of<CircleProvider>(context, listen: false);
                          CircleListProvider circleListProv = Provider.of<CircleListProvider>(context, listen: false);

                          IndivCompProvider indivCompProv = Provider.of<IndivCompProvider>(context, listen: false);
                          IndivCompListProvider indivCompListProv = Provider.of<IndivCompListProvider>(context, listen: false);

                          BindedIndivCompsProvider bindedIndivCompsProv = Provider.of<BindedIndivCompsProvider>(context, listen: false);

                          showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Chwileczkę...');

                          await ApiCircle.deleteIndivCompBind(
                              circleKey: circle.key,
                              indivCompKey: indivCompKey,
                              onSuccess: (){
                                circle.bindedIndivComps.removeWhere((indivCompBasicData) => indivCompBasicData.key == indivCompKey);
                                circleProv.notify();
                                circleListProv.notify();
                                indivCompProv.notify();
                                indivCompListProv.notify();

                                bindedIndivCompsProv.notify();
                              },
                              onServerMaybeWakingUp: () {
                                if(mounted) showServerWakingUpToast(context);
                                return true;
                              },
                              onError: () async {
                                if(mounted) showAppToast(context, text: simpleErrorMessage);
                                await popPage(context); // Close loading widget.
                              }
                          );

                          await popPage(context); // Close loading widget.

                        },
                      ),
                    );

                  return IndivCompTile(
                    IndivComp.allMap![indivCompKey]!,
                    participBorderColor: CommunityCoverColors.cardColor(context, palette),
                    participBackgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                    subTitle: Row(
                      children: [
                        Icon(MdiIcons.googleCircles, color: hintEnab_(context)),
                        const SizedBox(width: Dimen.ICON_MARG),
                        Text(
                            IndivComp.allMap![indivCompKey]!.bindedCircle!.name,
                            style: AppTextStyle(
                                fontWeight: weight.halfBold,
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                color: hintEnab_(context)
                            )
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(MdiIcons.close),
                      onPressed: () async {

                        IndivComp comp = IndivComp.allMap![indivCompKey]!;

                        CircleProvider circleProv = Provider.of<CircleProvider>(context, listen: false);
                        CircleListProvider circleListProv = Provider.of<CircleListProvider>(context, listen: false);

                        IndivCompProvider indivCompProv = Provider.of<IndivCompProvider>(context, listen: false);
                        IndivCompListProvider indivCompListProv = Provider.of<IndivCompListProvider>(context, listen: false);

                        BindedIndivCompsProvider bindedIndivCompsProv = Provider.of<BindedIndivCompsProvider>(context, listen: false);

                        showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Chwileczkę...');

                        await ApiCircle.deleteIndivCompBind(
                          circleKey: circle.key,
                          indivCompKey: comp.key,
                          onSuccess: (){
                            comp.bindedCircle = null;
                            circle.bindedIndivComps.removeWhere((indivCompBasicData) => indivCompBasicData.key == comp.key);
                            circleProv.notify();
                            circleListProv.notify();
                            indivCompProv.notify();
                            indivCompListProv.notify();
                            bindedIndivCompsProv.notify();
                          },
                          onServerMaybeWakingUp: () {
                            if(mounted) showServerWakingUpToast(context);
                            return true;
                          },
                          onError: () async {
                            if(mounted) showAppToast(context, text: simpleErrorMessage);
                            await popPage(context); // Close loading widget.
                          }
                        );

                        await popPage(context); // Close loading widget.

                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                count: circle.bindedIndivComps.length

            )),
          ),

          SliverList(delegate: SliverChildListDelegate([

            const SizedBox(height: Dimen.SIDE_MARG),

            const Padding(
              padding: EdgeInsets.only(left: Dimen.SIDE_MARG - TitleShortcutRowWidget.textStartPadding),
              child: TitleShortcutRowWidget(title: 'Inne', textAlign: TextAlign.start),
            ),

          ])),

          SliverPadding(
            padding: const EdgeInsets.only(
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG - Dimen.ICON_MARG
            ),
            sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate((context, index){

                  return IndivCompTile(
                    bindableIndivComps[index],
                    participBorderColor: CommunityCoverColors.cardColor(context, palette),
                    participBackgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                    subTitle:
                    bindableIndivComps[index].bindedCircle == null?
                    Text(
                      'Nie powiązane z niczym',
                      style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        color: hintEnab_(context)
                      )
                    ):
                    Row(
                      children: [
                        Icon(MdiIcons.googleCircles, color: hintEnab_(context)),
                        const SizedBox(width: Dimen.ICON_MARG),
                        Text(
                            bindableIndivComps[index].bindedCircle!.name,
                            style: AppTextStyle(
                              fontWeight: weight.halfBold,
                              fontSize: Dimen.TEXT_SIZE_BIG,
                              color: hintEnab_(context)
                            )
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(MdiIcons.check),
                      onPressed: () async{

                        IndivComp comp = bindableIndivComps[index];

                        CircleProvider circleProv = Provider.of<CircleProvider>(context, listen: false);
                        CircleListProvider circleListProv = Provider.of<CircleListProvider>(context, listen: false);

                        IndivCompProvider indivCompProv = Provider.of<IndivCompProvider>(context, listen: false);
                        IndivCompListProvider indivCompListProv = Provider.of<IndivCompListProvider>(context, listen: false);

                        BindedIndivCompsProvider bindedIndivCompsProv = Provider.of<BindedIndivCompsProvider>(context, listen: false);

                        showLoadingWidget(context, CommunityCoverColors.strongColor(context, palette), 'Chwileczkę...');

                        await ApiCircle.bindIndivComp(
                            circleKey: circle.key,
                            indivCompKey: comp.key,
                            onSuccess: (){
                              String? oldCircleKey = comp.bindedCircle?.key;
                              // Bind this circle to this comp
                              comp.bindedCircle = CircleBasicData.fromCircle(circle);

                              // If circle was binded before, remove comp binding from old circle
                              if(oldCircleKey != null && Circle.allMap!.containsKey(oldCircleKey)){
                                Circle oldCircle = Circle.allMap![oldCircleKey]!;
                                oldCircle.bindedIndivComps.removeWhere((indivCompBasicData) => indivCompBasicData.key == comp.key);
                              }

                              circle.bindedIndivComps.removeWhere((indivCompBasicData) => indivCompBasicData.key == comp.key);
                              circle.bindedIndivComps.add(IndivCompBasicData.fromIndivComp(comp));

                              circleProv.notify();
                              circleListProv.notify();
                              indivCompProv.notify();
                              indivCompListProv.notify();
                              bindedIndivCompsProv.notify();
                            },
                            onServerMaybeWakingUp: () {
                              if(mounted) showServerWakingUpToast(context);
                              return true;
                            },
                            onError: () async {
                              if(mounted) showAppToast(context, text: simpleErrorMessage);
                            }
                        );

                        await popPage(context); // Close loading widget.

                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                count: bindableIndivComps.length

            )),
          ),

          SliverList(delegate: SliverChildListDelegate([

            const SizedBox(height: 2*Dimen.SIDE_MARG),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
              child: Text(
                'Aby móc powiązać współzawodnictwo z kręgiem, musisz być administratorem ich obu.',
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

          ])),


        ]
    ))
  );


}