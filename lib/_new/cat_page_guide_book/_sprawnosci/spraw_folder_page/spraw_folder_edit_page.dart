import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/color_selector_widget.dart';
import 'package:harcapp/_app_common/icon_selector_widget.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import './spraw_folder_icon.dart';

class SprawFolderEditPage extends StatefulWidget{

  static const int maxNameLenght = 52;

  final SprawFolder initFolder;
  final void Function(String name, String selColorKey, String selIconKey) onSave;
  final void Function(SprawFolder) onDeleteTap;

  const SprawFolderEditPage({this.initFolder, this.onSave, this.onDeleteTap});

  @override
  State<StatefulWidget> createState() => SprawFolderEditPageState();

}

class SprawFolderEditPageState extends State<SprawFolderEditPage>{

  SprawFolder get initFolder => widget.initFolder;
  void Function(String name, String selColorKey, String selIconKey) get onSave => widget.onSave;
  void Function(SprawFolder) get onDeleteTap => widget.onDeleteTap;

  String selIconKey;

  TextEditingController controller;
  FocusNode focusNode;

  @override
  void initState() {
    selIconKey = initFolder?.iconKey??CommonIconData.randomKey;

    controller = TextEditingController(text: initFolder?.name??'');
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) => _ColorProvider(initFolder?.colorKey??CommonColorData.randomKey),
      builder: (context, child) => BottomNavScaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Nazwa folderu...',
                  hintStyle: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_APPBAR),
                  border: InputBorder.none,
                  counter: Container()
              ),
              textCapitalization: TextCapitalization.sentences,
              //maxLength: SprawFolderEditPage.maxNameLenght,
              focusNode: focusNode,
              controller: controller,
              style: AppTextStyle(color: textEnab_(context), fontSize: Dimen.TEXT_SIZE_APPBAR),
              textAlign: TextAlign.center,
            ),
          ),
          actions: [
            IconButton(
                onPressed: (){
                  if(initFolder == null && SprawFolder.exists(controller.text)){
                    showAppToast(context, text: 'Folder o podanej nazwie już istnieje');
                    return;
                  }

                  if(controller.text.isEmpty){
                    showAppToast(context, text: 'Weź, nazwij jakoś ten folder');
                    focusNode.requestFocus();
                    return;
                  }

                  onSave?.call(controller.text, Provider.of<_ColorProvider>(context, listen: false).selColorKey, selIconKey);
                  Navigator.pop(context);
                },
                icon: Icon(MdiIcons.check)
            )
          ],
        ),
        body: Column(
          children: [

            SizedBox(height: Dimen.SIDE_MARG),

            SimpleButton.from(
              context: context,
              icon: MdiIcons.paletteOutline,
              text: 'Zmień kolor',
              onTap: () => openColorPicker(context),
            ),

            SimpleButton.from(
              context: context,
              icon: CommonIconData.ALL[selIconKey],
              text: 'Zmień ikonę',
              onTap: openIconPicker,
            ),

            SizedBox(height: Dimen.SIDE_MARG),

            Expanded(child: Center(
              child: Consumer<_ColorProvider>(
                builder: (context, prov, child) => SprawFolderWidget(
                  selIconKey,
                  prov.selColorKey,
                  size: 224.0,
                ),
              ),
            )),

            if(initFolder != null)
              SimpleButton.from(
              textColor: Colors.red,
              icon: MdiIcons.close,
              text: 'Usuń folder',
              textSize: Dimen.TEXT_SIZE_APPBAR,
              onTap: () => showAlertDialog(
                context,
                title: 'Hola, spokojnie!',
                content: 'Czy na pewno chcesz usunąć folder ze sprawnościami?',
                actionBuilder: (context) => [

                  AlertDialogButton(
                      text: 'Nie',
                      onTap: () => Navigator.pop(context)
                  ),

                  AlertDialogButton(
                      text: 'Tak',
                      onTap: (){
                        onDeleteTap?.call(initFolder);
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                  )

                ]
              )
            )
          ],
        ),
      ),
    );
  }

  void openColorPicker(BuildContext context) => openDialog(
    context: context,
    builder: (_) => Center(
      child: AppCard(
          padding: EdgeInsets.zero,
          radius: AppCard.BIG_RADIUS,
          margin: EdgeInsets.all(Dimen.SIDE_MARG),
          color: background_(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(title: Text('Wybierz kolor'), centerTitle: true, elevation: 0,),
              ColorSelectorWidget(
                initColorKey: Provider.of<_ColorProvider>(context, listen: false).selColorKey,
                onSelected: (iconKey) => Provider.of<_ColorProvider>(context, listen: false).selColorKey = iconKey,
              )
            ],
          )
      ),
    ),
  );

  void openIconPicker() => openDialog(
    context: context,
    builder: (context) => Center(
      child: AppCard(
          margin: EdgeInsets.all(Dimen.SIDE_MARG),
          padding: EdgeInsets.zero,
          radius: AppCard.BIG_RADIUS,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(title: Text('Wybierz ikonę'), centerTitle: true, floating: true,),

                SliverList(delegate: SliverChildListDelegate([
                  IconSelectorWidget(
                    initIconKey: selIconKey,
                    onSelected: (iconKey) => setState(() => selIconKey = iconKey),
                  ),
                ]))
              ],
              physics: BouncingScrollPhysics(),
            ),
          )
      ),
    ),
  );

}

class _ColorProvider extends ChangeNotifier{

  String _selColorKey;

  _ColorProvider(this._selColorKey);

  String get selColorKey => _selColorKey;
  set selColorKey(String value){
    _selColorKey = value;
    notifyListeners();
  }

  Color get colorStart => CommonColorData.ALL[_selColorKey].colorStart;
  Color get colorEnd => CommonColorData.ALL[_selColorKey].colorEnd;
  Color get avgColor => CommonColorData.ALL[_selColorKey].avgColor;

}