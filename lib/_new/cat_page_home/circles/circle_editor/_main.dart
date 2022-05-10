import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/app_tab_bar_indicator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/loading_widget.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_editor/providers.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../circle_page.dart';
import '../circle_palette_generator.dart';
import '../model/circle.dart';
import 'cover_image_part.dart';
import 'danger_part.dart';
import 'general_part.dart';

class CircleEditorPage extends StatefulWidget{

  final Circle initCircle;
  final PaletteGenerator palette;

  final void Function(Circle circle) onSaved;
  final void Function() onDeleted;
  final void Function() onLeft;
  final void Function() onError;

  const CircleEditorPage({
    this.initCircle,
    this.palette,
    this.onSaved,
    this.onDeleted,
    this.onLeft,
    this.onError,
    Key key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => CircleEditorPageState();

}

class CircleEditorPageState extends State<CircleEditorPage>{

  Circle get initCircle => widget.initCircle;
  PaletteGenerator get palette => _palette??widget.palette;

  PaletteGenerator _palette;

  void Function(Circle circle) get onSaved => widget.onSaved;
  void Function() get onDeleted => widget.onDeleted;
  void Function() get onLeft => widget.onLeft;
  void Function() get onError => widget.onError;

  void calcLocalBackgronudColor() async {
    _palette = await getPaletteGenerator(
        initCircle.coverImage.local,
        initCircle.coverImage.firstFileName
    );
    setState(() {});
  }

  @override
  void initState() {
    if(initCircle != null && initCircle.colorsKey == 'auto' && palette == null)
      calcLocalBackgronudColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      backgroundColor: CirclePage.backgroundColor(context, palette),
      body: DefaultTabController(
        length: initCircle == null?2:3,
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
                title: Text(widget.initCircle==null?'Nowy krąg':'Edytuj krąg'),
                centerTitle: true,
                floating: true,
                pinned: true,
                backgroundColor: CirclePage.backgroundColor(context, palette),
                bottom: TabBar(
                  physics: const BouncingScrollPhysics(),
                  tabs: [
                    const Tab(text: 'Informacje'),
                    const Tab(text: 'Zdjęcie w tle'),
                    if(initCircle != null)
                      const Tab(text: 'Strefa zagrożenia'),
                  ],
                  indicator: AppTabBarIncdicator(
                      color: CirclePage.strongColor(context, palette)
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
                          CirclePage.strongColor(context, palette),
                          initCircle == null? 'Zawiązywanie kręgu...': 'Uaktualnianie...'
                      );

                      if(initCircle == null)
                        await ApiCircle.create(
                            name: Provider.of<NameProvider>(context, listen: false).nameController.text,
                            description: Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text,
                            coverImageUrl: Provider.of<CoverImageProvider>(context, listen: false).coverImage.code,
                            colorsKey: Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey,
                            onSuccess: (circle){
                              popPage(context); // Close loading widget.
                              popPage(context);
                              onSaved?.call(circle);
                            },
                            onError: onError
                        );
                      else
                        await ApiCircle.update(
                            key: initCircle.key,
                            name: Provider.of<NameProvider>(context, listen: false).nameController.text,
                            description: Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text,
                            coverImageUrl: Provider.of<CoverImageProvider>(context, listen: false).coverImage.code,
                            colorsKey: Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey,
                            onSuccess: (circle){
                              popPage(context); // Close loading widget.
                              popPage(context);
                              onSaved?.call(circle);
                            },
                            onError: onError
                        );

                    },
                  )
                ],
              ),
            ],
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                GeneralPart(palette: palette),
                const CoverImagePart(),
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