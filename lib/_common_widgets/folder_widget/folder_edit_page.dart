import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/color_selector_widget.dart';
import 'package:harcapp/_app_common/icon_selector_widget.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_app_common/common_icon_data.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'folder_widget.dart';

class FolderEditPage extends StatefulWidget{

  static const int maxNameLenght = 52;

  final String? initName;
  final String? initIconKey;
  final String? initColorsKey;
  final FutureOr<void> Function(String name, String selIconKey, String selColorKey)? onSave;
  final FutureOr<void> Function()? onDeleteTap;

  const FolderEditPage({
    this.initName,
    this.initIconKey,
    this.initColorsKey,
    this.onSave,
    this.onDeleteTap,
    super.key
  });

  @override
  State<StatefulWidget> createState() => FolderEditPageState();

}

class FolderEditPageState extends State<FolderEditPage>{

  String? get initName => widget.initName;
  String? get initIconKey => widget.initIconKey;
  String? get initColorsKey => widget.initColorsKey;

  FutureOr<void> Function(String name, String selIconKey, String selColorKey)? get onSave => widget.onSave;
  FutureOr<void> Function()? get onDeleteTap => widget.onDeleteTap;

  late String selIconKey;

  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    selIconKey = initIconKey??CommonIconData.randomKey;

    controller = TextEditingController(text: initName??'');
    focusNode = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (BuildContext context) => _ColorProvider(initColorsKey??CommonColorData.randomKey),
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
            focusNode: focusNode,
            controller: controller,
            style: AppTextStyle(color: textEnab_(context), fontSize: Dimen.TEXT_SIZE_APPBAR),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {

                if(controller.text.isEmpty){
                  showAppToast(context, text: 'Weź tam, nazwij jakoś ten folder');
                  focusNode.requestFocus();
                  return;
                }

                await onSave?.call(controller.text, selIconKey, Provider.of<_ColorProvider>(context, listen: false).selColorKey);
                Navigator.pop(context);
              },
              icon: const Icon(MdiIcons.check)
          )
        ],
      ),
      body: Column(
        children: [

          const SizedBox(height: Dimen.SIDE_MARG),

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

          const SizedBox(height: Dimen.SIDE_MARG),

          Expanded(child: Center(
            child: Consumer<_ColorProvider>(
              builder: (context, prov, child) => FolderWidget(
                selIconKey,
                prov.selColorKey,
                size: 224.0,
              ),
            ),
          )),

          if(initName != null)
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
                          onTap: () async {
                            await onDeleteTap?.call();
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

  void openColorPicker(BuildContext context) => openDialog(
    context: context,
    builder: (_) => Center(
      child: AppCard(
          padding: EdgeInsets.zero,
          radius: AppCard.bigRadius,
          margin: const EdgeInsets.all(Dimen.SIDE_MARG),
          color: background_(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(title: const Text('Wybierz kolor'), centerTitle: true, elevation: 0,),
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
          margin: const EdgeInsets.all(Dimen.SIDE_MARG),
          padding: EdgeInsets.zero,
          radius: AppCard.bigRadius,
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                const SliverAppBar(title: Text('Wybierz ikonę'), centerTitle: true, floating: true,),

                SliverList(delegate: SliverChildListDelegate([
                  IconSelectorWidget(
                    initIconKey: selIconKey,
                    onSelected: (iconKey) => setState(() => selIconKey = iconKey),
                  ),
                ]))
              ],
              physics: const BouncingScrollPhysics(),
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

  Color? get colorStart => CommonColorData.ALL[_selColorKey]?.colorStart;
  Color? get colorEnd => CommonColorData.ALL[_selColorKey]?.colorEnd;
  Color? get avgColor => CommonColorData.ALL[_selColorKey]?.avgColor;

}