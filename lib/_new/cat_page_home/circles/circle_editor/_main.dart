import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/api/circle.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_editor/providers.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/circle.dart';
import 'cover_image_part.dart';
import 'general_part.dart';

class CircleEditorPage extends StatefulWidget{

  final Circle initCircle;

  final void Function(Circle circle) onSaved;
  final void Function() onError;

  const CircleEditorPage({this.initCircle, this.onSaved, this.onError, Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CircleEditorPageState();

}

class CircleEditorPageState extends State<CircleEditorPage>{

  Circle get initCircle => widget.initCircle;

  void Function(Circle circle) get onSaved => widget.onSaved;
  void Function() get onError => widget.onError;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: DefaultTabController(
      length: 3,
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
              bottom: const TabBar(
                physics: BouncingScrollPhysics(),
                tabs: [
                  Tab(text: 'Informacje'),
                  Tab(text: 'Zdjęcie w tle'),
                  Tab(text: 'Strefa zagrożenia'),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(MdiIcons.check),
                  onPressed: () async {

                    if(Provider.of<NameProvider>(context, listen: false).nameController.text.isEmpty){
                      showAppToast(context, text: 'Nazwa kręgu nie może być pusta');
                      return;
                    }

                    if(initCircle == null)
                      await ApiCircle.create(
                        name: Provider.of<NameProvider>(context, listen: false).nameController.text,
                        description: Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text,
                        coverImageUrl: Provider.of<CoverImageProvider>(context, listen: false).coverImage.code,
                        colorsKey: Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey,
                        onSuccess: onSaved,
                        onError: onError
                      );
                    else
                      await ApiCircle.update(
                        key: initCircle.key,
                        name: Provider.of<NameProvider>(context, listen: false).nameController.text,
                        description: Provider.of<DescriptionProvider>(context, listen: false).descriptionController.text,
                        coverImageUrl: Provider.of<CoverImageProvider>(context, listen: false).coverImage.code,
                        colorsKey: Provider.of<ColorsKeyProvider>(context, listen: false).colorsKey,
                        onSuccess: onSaved,
                        onError: onError
                      );

                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              GeneralPart(),
              CoverImagePart(),
            ],
          ),

        ),
      ),
    )
  );


}