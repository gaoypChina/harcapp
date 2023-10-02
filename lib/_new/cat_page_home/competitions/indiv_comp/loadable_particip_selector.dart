import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/paging_loadable_page/paging_loadable_base_widget.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/common/particip_tile.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/indiv_comp_participants_loader.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_particip.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/providers/indiv_comp_particips_provider.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'models/indiv_comp.dart';


class LoadableParticipantSelector extends StatefulWidget{

  final IndivComp comp;
  final bool inactiveSelectable;
  final void Function(IndivCompParticip)? onParticipSelected;

  const LoadableParticipantSelector(this.comp, {this.inactiveSelectable = false, required this.onParticipSelected, super.key});

  @override
  State<StatefulWidget> createState() => LoadableParticipantSelectorState();

}

class LoadableParticipantSelectorState extends State<LoadableParticipantSelector>{

  IndivComp get comp => widget.comp;
  bool get inactiveSelectable => widget.inactiveSelectable;
  void Function(IndivCompParticip)? get onParticipSelected => widget.onParticipSelected;

  late IndivCompParticipantsLoaderListener participsLoaderListener;

  late RefreshController controller;

  @override
  void initState() {

    IndivCompProvider compProv = IndivCompProvider.of(context);
    IndivCompListProvider compListProv = IndivCompListProvider.of(context);
    IndivCompParticipsProvider compParticipsProv = IndivCompParticipsProvider.of(context);

    participsLoaderListener = IndivCompParticipantsLoaderListener(
        onNoInternet: (){
          if(!mounted) return;
          showAppToast(context, text: noInternetMessage);
        },
        onParticipantsLoaded: (participsPage, reloaded){
          IndivComp.callProvidersWithParticips(compProv, compListProv, compParticipsProv);
          if(mounted) setState((){});
        },
        onForceLoggedOut: (){
          if(!mounted) return true;
          showAppToast(context, text: forceLoggedOutMessage);
          setState(() {});
          return true;
        },
        onServerMaybeWakingUp: (){
          if(!mounted) return true;
          showServerWakingUpToast(context);
          return true;
        },
        onError: (_){
          if(!mounted) return;
          showAppToast(context, text: simpleErrorMessage);
        },
        onEnd: (_, __, ___){
          if(!mounted) return;
          controller.loadComplete();
          controller.refreshCompleted();
          post(() => mounted?setState(() {}):null);
        }
    );

    comp.addParticipLoaderListener(participsLoaderListener);

    controller = RefreshController(
      initialRefresh: comp.loadedParticips.length == 1 && comp.participCount > 1 && !comp.isParticipsLoading(),
    );
    post((){
      // `initialRefreshStatus` and `initialLoadStatus` in RefreshController don't work.
      if(!mounted) return;
      if(comp.loadedParticips.length == 1 && comp.isParticipsLoading())
        controller.headerMode!.value = RefreshStatus.refreshing;
      if(comp.loadedParticips.length > 1 && comp.isParticipsLoading())
        controller.footerMode!.value = LoadStatus.loading;
    });
    super.initState();
  }

  @override
  void dispose() {
    comp.removeParticipLoaderListener(participsLoaderListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PagingLoadableBaseWidget(
      loadingIndicatorColor: AppColors.zhpTropColor,

      totalItemsCount: comp.participCount,
      loadedItemsCount: comp.loadedParticips.length,
      callReload: () async {
        await comp.reloadParticipsPage(awaitFinish: true);
        return comp.loadedParticips.length;
      },
      callLoadMore: () async {
        await comp.reloadParticipsPage(awaitFinish: true);
        return comp.loadedParticips.length;
      },
      controller: controller,

    sliversBuilder: (context, isLoading, innerScrollViewKey) => [

      const SliverAppBar(
        floating: true,
        title: Text('Wybierz uczestnika'),
        centerTitle: true,
      ),

      Container(
          key: innerScrollViewKey,
          child: SliverList(delegate: SliverChildBuilderDelegate(
              (context, index) => ParticipTile(
                particip: comp.loadedParticips[index],
                onTap: comp.loadedParticips[index].profile.active || inactiveSelectable?
                () => onParticipSelected?.call(comp.loadedParticips[index]):
                null,
                subtitle: comp.loadedParticips[index].profile.active?
                null:
                Text('Obserwator', style: AppTextStyle(color: hintEnab_(context))),
              ),
              childCount: comp.loadedParticips.length
          ))
      )

    ],

  );

}

Future<IndivCompParticip?> selectParticip({
  required BuildContext context,
  required IndivComp comp,
  bool inactiveSelectable = false,
}) async {

  IndivCompParticip? selected;

  await openDialog(
  context: context,
  builder: (context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(Dimen.defMarg),
      child: Material(
        clipBehavior: Clip.hardEdge,
        color: background_(context),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: LoadableParticipantSelector(
            comp,
            inactiveSelectable: inactiveSelectable,
            onParticipSelected: (particip){
              selected = particip;
              Navigator.pop(context);
            }
        ),
      ),
    ),
  )
  );

  return selected;

}