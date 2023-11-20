import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/scan_qr_code.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/regex_input_formatter.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text_field_hint.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/text_field_fit.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'common.dart';
import 'okrzyk.dart';
import 'okrzyk_widget.dart';

class AddOkrzykPage extends StatefulWidget {

  static const int TYPE_OGOLNE = 1;
  static const int TYPE_POSILKOWE = 2;

  Okrzyk? okrzyk;
  final void Function()? onSaved;

  AddOkrzykPage({this.okrzyk, this.onSaved, super.key});

  @override
  State<AddOkrzykPage> createState() => AddOkrzykPageState();

}

class AddOkrzykPageState extends State<AddOkrzykPage> {

  late bool scrollListView;

  int? okrzykType;

  final List<ItemCard> elements = [];

  late TextEditingController titleController;
  late ScrollController scrollController;

  @override
  void initState() {
    _initState();
    super.initState();
  }

  void _initState() {
    scrollListView = false;
    okrzykType = AddOkrzykPage.TYPE_OGOLNE;
    titleController = TextEditingController();
    scrollController = ScrollController();

    if(widget.okrzyk != null){
      titleController!.text = widget.okrzyk!.title;
      for(SoundElement element in widget.okrzyk!.soundElements)
        elements.add(ItemCard.from(
          this,
          initTon: element.tone.toString(),
          initTimeFract: element.timeFract.toString(),
          initWords: element.text,
          initSeparators: element.separator,
        ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(scrollListView) {
      post(() =>
          scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut));

      scrollListView = false;

    }

    return BottomNavScaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[

          IconButton(
              icon: Icon(MdiIcons.qrcodeScan),
              onPressed: ()async{

                if(await Permission.camera.request().isGranted){

                  //String code = "";
                  String? code = await scanQrCode();
                  if(code == null) return;

                  Okrzyk okrzyk;

                  try {okrzyk = Okrzyk.from(code);}
                  on Exception{
                    showAppToast(context, text: 'Coś tu nie gra...');
                    return;
                  }
                  setState(() {
                    widget.okrzyk = okrzyk;
                    _initState();
                  });

                }
              }
          ),

          SimpleButton.from(
            context: context,
            icon: MdiIcons.check,
            text: 'Zapisz',
            onTap: () async{
              String path = getOkrzykiFolderLocalPath;
              saveStringAsFileToFolder(path, Okrzyk(titleController.text, elements.map((element) => element.toSoundElement()).toList(), official: false).toString());
              Navigator.pop(context);

              if(widget.onSaved != null)
                widget.onSaved!();
              },
          ),
        ],
      ),

      body: ImplicitlyAnimatedReorderableList<ItemCard>(
        items: elements,
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        areItemsTheSame: (oldItem, newItem) => oldItem.hashCode == newItem.hashCode,
        onReorderFinished: (item, from, to, newItems) => setState(() => elements..clear()..addAll(newItems)),
        itemBuilder: (context, itemAnimation, item, index) => Reorderable(
            key: ValueKey(item.hashCode),
            builder: (context, dragAnimation, inDrag) {
              return item;
            }),
        header: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            children: [

              OkrzykWidget(
                  Okrzyk(
                      titleController.text,
                      elements.map((element) => element.toSoundElement()).toList()
                  ),
                  editable: false,
                  elevation: AppCard.bigElevation
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              AppTextFieldHint(
                hint: 'Tytuł:',
                controller: titleController,
                onAnyChanged: (text) => setState((){}),
                style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                  fontWeight: weight.halfBold,
                  color: textEnab_(context),
                ),
                hintStyle: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_NORMAL,
                  color: hintEnab_(context),
                ),
              ),

              AnimatedOpacity(
                opacity: elements.isEmpty?0:1,
                duration: const Duration(milliseconds: 300),
                child: TitleShortcutRowWidget(
                    title: 'Sylaby i tony',
                    iconColor: hintEnab_(context),
                    icon: MdiIcons.musicBoxOutline,
                ),
              )

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(MdiIcons.plus),
        onPressed: () => setState((){
          elements.add(ItemCard.from(this));
          scrollListView = true;
        }),
      ),
    );
  }
}

class ItemCard extends StatelessWidget{

  final AddOkrzykPageState parentState;

  final TextEditingController ctrlTon, ctrlTimeFract, ctrlWords, ctrlSeparators;

  const ItemCard(this.parentState, this.ctrlTon, this.ctrlTimeFract, this.ctrlWords, this.ctrlSeparators, {super.key});

  static ItemCard from(AddOkrzykPageState parentState, {String initTon = '25', String initTimeFract = '4', String initWords = '', String initSeparators = ''}){
    TextEditingController ctrlTon = TextEditingController(text: initTon);
    TextEditingController ctrlTimeFract = TextEditingController(text: initTimeFract);
    TextEditingController ctrlWords = TextEditingController(text: initWords);
    TextEditingController ctrlSeparators = TextEditingController(text: initSeparators);

    return ItemCard(parentState, ctrlTon, ctrlTimeFract, ctrlWords, ctrlSeparators);
  }

  SoundElement toSoundElement(){
    return SoundElement(
        int.parse(ctrlTon.text),
        int.parse(ctrlTimeFract.text),
        text: ctrlWords.text,
        separator: ctrlSeparators.text
    );
  }

  @override
  Widget build(BuildContext context) {

    Widget content = Row(
      children: <Widget>[
        Handle(child: Padding(
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Icon(MdiIcons.swapVertical, color: iconEnab_(context)),
        )),
        const SizedBox(width: Dimen.defMarg),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimen.defMarg/2),
              child: TextFieldFit(
                style: AppTextStyle(color: textEnab_(context), fontWeight: weight.halfBold),
                decoration: InputDecoration(
                  hintText: '...',
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  border: InputBorder.none,
                ),
                minWidth: 25,
                inputFormatters: [RegExInputFormatter.withRegex(r'50|([1-4]?[0-9]?)')],
                textAlign: TextAlign.center,
                controller: ctrlTon,
                keyboardType: TextInputType.number,
              ),
            ),
            Text('Ton', style: AppTextStyle(color: hintEnab_(context), fontWeight: weight.bold, fontSize: Dimen.TEXT_SIZE_TINY))
          ],
        ),

        const SizedBox(width: Dimen.ICON_MARG),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Dimen.defMarg/2),
              child: TextFieldFit(
                style: AppTextStyle(color: textEnab_(context), fontWeight: weight.halfBold),
                decoration: InputDecoration(
                  hintText: '...',
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  border: InputBorder.none,
                ),
                inputFormatters: [RegExInputFormatter.withRegex(r'[0-9]{0,2}')],
                minWidth: 25,
                textAlign: TextAlign.center,
                controller: ctrlTimeFract,
                keyboardType: TextInputType.number,
              ),
            ),
            Text('1/czas', style: AppTextStyle(color: hintEnab_(context), fontWeight: weight.bold, fontSize: Dimen.TEXT_SIZE_TINY))
          ],
        ),

        const SizedBox(width: Dimen.ICON_MARG),

        Expanded(child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Dimen.defMarg/2),
              child: TextField(
                decoration: InputDecoration(
                  hintText: '...',
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  border: InputBorder.none,
                ),
                style: AppTextStyle(color: textEnab_(context)),
                inputFormatters: [
                  RegExInputFormatter.withRegex(r'[AĄBCĆDEĘFGHIJKLŁMNŃOÓPRSŚTUWYZŹŻaąbcćdeęfghijklłmnńoóprsśtuwyzźż1234567890]*')
                ],
                textAlign: TextAlign.center,
                controller: ctrlWords,
              ),
            ),
            Text('Słowa', style: AppTextStyle(color: hintEnab_(context), fontWeight: weight.bold, fontSize: Dimen.TEXT_SIZE_TINY))
          ],
        )),

        const SizedBox(width: Dimen.ICON_MARG),

        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(Dimen.defMarg/2),
              child: TextFieldFit(
                style: AppTextStyle(),
                inputFormatters: [
                  RegExInputFormatter.withRegex(r'[ ,.!-?]*')
                ],
                decoration: InputDecoration(
                  hintText: '...',
                  hintStyle: AppTextStyle(color: hintEnab_(context)),
                  border: InputBorder.none,
                ),
                minWidth: 25,
                textAlign: TextAlign.center,
                controller: ctrlSeparators,
              ),
            ),
            Text('sep.', style: AppTextStyle(color: hintEnab_(context), fontWeight: weight.bold, fontSize: Dimen.TEXT_SIZE_TINY))
          ],
        ),

        const SizedBox(width: Dimen.ICON_MARG),

        IconButton(
          icon: Icon(MdiIcons.playOutline),
          padding: const EdgeInsets.only(
            left: Dimen.ICON_MARG,
            right: Dimen.ICON_MARG,
            top: Dimen.ICON_MARG,
            bottom: Dimen.ICON_MARG + Dimen.TEXT_SIZE_SMALL,
          ),
          onPressed: ()async{
            int ton = int.tryParse(ctrlTon.text)??0;

            int time = int.tryParse(ctrlTimeFract.text)??0;

            SoundElement element = SoundElement(ton, time);
            await element.play();
          },
        )
      ],
    );

    return content;
  }
}