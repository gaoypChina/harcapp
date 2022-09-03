import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/community.dart';
import 'package:harcapp/_new/cat_page_home/community/community_editor/providers.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:optional/optional_internal.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../community/model/community.dart';
import 'danger_part.dart';
import 'general_part.dart';

class CommunityEditorPage extends StatefulWidget{

  final Community? initCommunity;

  final void Function(Community community)? onSaved;
  final void Function()? onForceLoggedOut;
  final void Function()? onDeleted;
  final void Function()? onError;

  const CommunityEditorPage({
    this.initCommunity,
    this.onSaved,
    this.onForceLoggedOut,
    this.onDeleted,
    this.onError,
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CommunityEditorPageState();

}

class CommunityEditorPageState extends State<CommunityEditorPage>{

  Community? get initCommunity => widget.initCommunity;

  void Function(Community circle)? get onSaved => widget.onSaved;
  void Function()? get onForceLoggedOut => widget.onForceLoggedOut;
  void Function()? get onDeleted => widget.onDeleted;
  void Function()? get onError => widget.onError;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      body: DefaultTabController(
        length: initCommunity == null?1:2,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => NameProvider(community: initCommunity)),
            ChangeNotifierProvider(create: (context) => IconKeyProvider(community: initCommunity)),
          ],
          builder: (context, child) => NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                title: Text(initCommunity==null?'Nowe środowisko':'Edytuj środowisko'),
                centerTitle: true,
                floating: true,
                pinned: true,
                bottom: initCommunity==null?null:TabBar(
                  physics: const BouncingScrollPhysics(),
                  tabs: [
                    const Tab(text: 'Informacje'),
                    if(initCommunity != null)
                      const Tab(text: 'Strefa zagrożenia'),
                  ],
                  indicator: AppTabBarIncdicator(context: context),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(MdiIcons.check),
                    onPressed: () async {

                      if(Provider.of<NameProvider>(context, listen: false).nameController.text.trim().isEmpty){
                        showAppToast(context, text: 'Nazwa kręgu nie może być pusta');
                        return;
                      }

                      showLoadingWidget(
                          context,
                          accent_(context),
                          initCommunity == null? 'Zawiązywanie środowiska...': 'Uaktualnianie...'
                      );

                      if(initCommunity == null)
                        await ApiCommunity.create(
                            name: Provider.of<NameProvider>(context, listen: false).nameController.text,
                            iconKey: Provider.of<IconKeyProvider>(context, listen: false).iconKey,
                            onSuccess: (circle) async {
                              await popPage(context); // Close loading widget.
                              await popPage(context);
                              onSaved?.call(circle);
                            },
                            onForceLoggedOut: () async {
                              if(!mounted) return true;
                              showAppToast(context, text: forceLoggedOutMessage);
                              await popPage(context); // Close loading widget.
                              onForceLoggedOut?.call();
                              return true;
                            },
                            onServerMaybeWakingUp: () {
                              if(mounted) showServerWakingUpToast(context);
                              return true;
                            },
                            onError: onError
                        );
                      else{

                        String name = Provider.of<NameProvider>(context, listen: false).nameController.text;
                        String iconKey = Provider.of<IconKeyProvider>(context, listen: false).iconKey;

                        await ApiCommunity.update(
                            circleKey: initCommunity!.key,

                            name:
                            initCommunity!.name == name?
                            const Optional.empty():
                            Optional.of(name),

                            iconKey:
                            initCommunity!.iconKey == iconKey?
                            const Optional.empty():
                            Optional.of(iconKey),

                            onSuccess: (community) async {
                              await popPage(context); // Close loading widget.
                              await popPage(context);
                              onSaved?.call(community);
                            },
                            onForceLoggedOut: () async {
                              if(!mounted) return true;
                              showAppToast(context, text: forceLoggedOutMessage);
                              await popPage(context); // Close loading widget.
                              onForceLoggedOut?.call();
                              return true;
                            },
                            onServerMaybeWakingUp: () {
                              if(mounted) showServerWakingUpToast(context);
                              return true;
                            },
                            onError: onError
                        );
                      }

                    },
                  )
                ],
              ),
            ],
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                GeneralPart(initCommunity),

                if(initCommunity != null)
                  DangerPart(
                    initCommunity,
                    onDeleted: (){
                      Navigator.pop(context);
                      onDeleted?.call();
                    },
                  ),
              ],
            ),

          ),
        ),
      )
  );


}