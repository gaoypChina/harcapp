import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_editor/providers.dart';
import 'package:harcapp/_new/cat_page_home/community/common/community_cover_colors.dart';
import 'package:harcapp/values/consts.dart';
import 'package:optional/optional_internal.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../community/model/community.dart';
import '../model/circle.dart';
import 'danger_part.dart';
import 'general_part.dart';

class CircleEditorPage extends StatefulWidget{

  final Community community;
  final PaletteGenerator? palette;

  final void Function(Circle circle)? onSaved;
  final void Function()? onDeleted;
  final void Function()? onLeft;
  final void Function()? onError;

  const CircleEditorPage({
    required this.community,
    this.palette,
    this.onSaved,
    this.onDeleted,
    this.onLeft,
    this.onError,
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CircleEditorPageState();

}

class CircleEditorPageState extends State<CircleEditorPage>{

  Community get community => widget.community;
  Circle? get initCircle => community.circle;
  PaletteGenerator? get palette => _palette??widget.palette;

  PaletteGenerator? _palette;

  void Function(Circle circle)? get onSaved => widget.onSaved;
  void Function()? get onDeleted => widget.onDeleted;
  void Function()? get onLeft => widget.onLeft;
  void Function()? get onError => widget.onError;

  void calcLocalBackgronudColor() async {
    _palette = await getPaletteGenerator(
        initCircle!.coverImage.local,
        initCircle!.coverImage.firstFileName
    );
    setState(() {});
  }

  @override
  void initState() {
    if(initCircle != null && initCircle!.colorsKey == 'auto' && palette == null)
      calcLocalBackgronudColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
      appBottomNavColor: CommunityCoverColors.backgroundColor(context, palette),
      body: DefaultTabController(
        length: initCircle == null?1:2,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => NameProvider(circle: initCircle)),
            ChangeNotifierProvider(create: (context) => DescriptionProvider(circle: initCircle)),
            ChangeNotifierProvider(create: (context) => CoverImageProvider(circle: initCircle)),
            ChangeNotifierProvider(create: (context) => ColorsKeyProvider(circle: initCircle))
          ],
          builder: (context, child) => NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                title: Text(initCircle==null?'Nowy krąg':'Edytuj krąg'),
                centerTitle: true,
                floating: true,
                pinned: true,
                backgroundColor: CommunityCoverColors.backgroundColor(context, palette),
                bottom: initCircle==null?null:TabBar(
                  physics: const BouncingScrollPhysics(),
                  tabs: [
                    const Tab(text: 'Informacje'),
                    if(initCircle != null)
                      const Tab(text: 'Strefa zagrożenia'),
                  ],
                  indicator: AppTabBarIncdicator(
                      color: CommunityCoverColors.strongColor(context, palette)
                  ),
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
                          CommunityCoverColors.strongColor(context, palette),
                          initCircle == null? 'Zawiązywanie kręgu...': 'Uaktualnianie...'
                      );

                      if(initCircle == null)
                        await ApiCircle.create(
                            name: Provider.of<NameProvider>(context, listen: false).nameController.text,
                            description: Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text,
                            coverImageUrl: Provider.of<CoverImageProvider>(context, listen: false).coverImage!.code,
                            colorsKey: Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey,
                            community: community,
                            onSuccess: (circle) async {
                              await popPage(context); // Close loading widget.
                              await popPage(context);
                              onSaved?.call(circle);
                            },
                            onServerMaybeWakingUp: () {
                              if(mounted) showAppToast(context, text: serverWakingUpMessage);
                              return true;
                            },
                            onError: onError
                        );
                      else{

                        String name = Provider.of<NameProvider>(context, listen: false).nameController.text;
                        String? description = Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text;
                        if(description.isEmpty) description = null;
                        String? coverImageCode = Provider.of<CoverImageProvider>(context, listen: false).coverImage!.code;
                        String? colorsKey = Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey;

                        await ApiCircle.update(
                            circleKey: initCircle!.key,
                            community: community,

                            name:
                            initCircle!.name == name?
                            const Optional.empty():
                            Optional.of(name),

                            description:
                            initCircle!.description == description?
                            const Optional.empty():
                            Optional.ofNullable(description),

                            coverImageUrl:
                            initCircle!.coverImage.code == coverImageCode?
                            const Optional.empty():
                            Optional.ofNullable(coverImageCode),

                            colorsKey:
                            initCircle!.colorsKey == colorsKey?
                            const Optional.empty():
                            Optional.ofNullable(colorsKey),

                            onSuccess: (circle) async {
                              await popPage(context); // Close loading widget.
                              await popPage(context);
                              onSaved?.call(circle);
                            },
                            onServerMaybeWakingUp: () {
                              if(mounted) showAppToast(context, text: serverWakingUpMessage);
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
                GeneralPart(palette: palette),

                if(initCircle != null)
                  DangerPart(
                    initCircle,
                    onDeleted: (){
                      Navigator.pop(context);
                      onDeleted?.call();
                    },
                    onLeft: (){
                      Navigator.pop(context);
                      onLeft?.call();
                    },
                  ),
              ],
            ),

          ),
        ),
      )
  );


}