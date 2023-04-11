import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/extended_floating_button.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_classes/date_to_str.dart';

import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../song_management/memory.dart';
import 'memory_widget.dart';


Future<void> openMemoryEditor(BuildContext context, Song song, {Memory? initMemory}) =>
    pushPage(context, builder: (context) => MemoryEditorWidget(
      song,
      initMemory: initMemory,
      onBack: () => Navigator.pop(context),
      onSaved: () => Navigator.pop(context),
      onRemoved: () => Navigator.pop(context),
    ));

class MemoryEditorWidget extends StatefulWidget{

  final Song song;
  final Function? onSaved;
  final Function? onBack;
  final Function? onRemoved;
  final Memory? initMemory;

  const MemoryEditorWidget(this.song, {this.initMemory, this.onSaved, this.onBack, this.onRemoved, super.key});

  @override
  State<StatefulWidget> createState() => MemoryEditorWidgetState();

}

class MemoryEditorWidgetState extends State<MemoryEditorWidget> with TickerProviderStateMixin{

  static const Duration _animDuration = Duration(milliseconds: 300);
  static const Curve _animCurve = Curves.easeOutCubic;

  Song get song => widget.song;
  Memory? get initMemory => widget.initMemory;

  late PageController controller;
  late MemoryBuilder memoryBuilder;

  @override
  void initState() {
    controller = PageController();
    if(initMemory == null) memoryBuilder = MemoryBuilder.empty(song);
    else memoryBuilder = MemoryBuilder.from(initMemory!);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: Stack(
      children: [

        Positioned(
            bottom: -.15*MediaQuery.of(context).size.width,
            right: -.15*MediaQuery.of(context).size.width,
            child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-15 / 360),
                child: Icon(MdiIcons.imageOutline, color: backgroundIcon_(context), size: .8*MediaQuery.of(context).size.width)
            )
        ),

        NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              title: Text(widget.initMemory==null?'Dodaj wspomnienie':'Edytuj wspomnienie'),
              centerTitle: true,
              floating: true,
              pinned: true,
              leading: IconButton(
                icon: const Icon(MdiIcons.arrowLeft),
                onPressed: (){
                  if(controller.page == 0) Navigator.pop(context);
                  else controller.animateToPage(0, duration: _animDuration, curve: _animCurve);
                },
              ),
            ),
          ],
          body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [

                _PartOne(
                  song: song,
                  initMemory: initMemory,
                  memoryBuilder: memoryBuilder,
                  creatingNew: initMemory==null,
                  onNext: (memoryBuilder){
                    this.memoryBuilder = memoryBuilder;
                    hideKeyboard(context);
                    controller.animateToPage(1, duration: _animDuration, curve: _animCurve);
                  },
                  onRemoved: (){
                    song.removeMemory(initMemory!);
                    if(widget.onRemoved != null) widget.onRemoved!();
                  },
                ),

                _PartTwo(
                    song: song,
                    memoryBuilder: memoryBuilder,
                    onBack: () => controller.animateToPage(0, duration: _animDuration, curve: _animCurve),
                    onSaveTap: (MemoryBuilder memoryBuilder) async {

                      if(initMemory == null) {
                        Memory memory = Memory.create(
                          songLclId: song.lclId,
                          date: memoryBuilder.date!,
                          place: memoryBuilder.place,
                          desc: memoryBuilder.desc,
                          fontIndex: memoryBuilder.fontIndex,
                          published: memoryBuilder.published,
                        );
                        Memory.addToAll(memory);
                        song.addMemory(memory);
                      }
                      else
                        initMemory!.update(
                          songLclId: song.lclId,
                          date: memoryBuilder.date,
                          place: memoryBuilder.place,
                          desc: memoryBuilder.desc,
                          fontIndex: memoryBuilder.fontIndex,
                          published: memoryBuilder.published,
                        );

                      widget.onSaved!();
                    }
                )

              ],
            ),
        )

      ],
    ),
  );

}

class _PartOne extends StatefulWidget{

  
  final Song? song;
  final Memory? initMemory;
  final MemoryBuilder memoryBuilder;
  final bool creatingNew;

  final Function(MemoryBuilder memoryBuilder)? onNext;
  final void Function()? onRemoved;

  const _PartOne({required this.song, required this.initMemory, required this.memoryBuilder, required this.creatingNew, this.onNext, this.onRemoved});

  @override
  State<StatefulWidget> createState() => _PartOneState();

}

class _PartOneState extends State<_PartOne>{

  Song? get song => widget.song;
  Memory? get initMemory => widget.initMemory;
  MemoryBuilder get memoryBuilder => widget.memoryBuilder;
  bool get creatingNew => widget.creatingNew;

  late TextEditingController textPlaceController;
  late TextEditingController textDescController;

  late DateTime date;

  bool get blocked => textPlaceController.text.isEmpty && textDescController.text.isEmpty;

  @override
  void initState() {
    textPlaceController = TextEditingController(text: memoryBuilder.place);
    textPlaceController.addListener(() => memoryBuilder.place = textPlaceController.text);
    textDescController = TextEditingController(text: memoryBuilder.desc);
    textDescController.addListener(() => memoryBuilder.desc = textDescController.text);

    date = memoryBuilder.date??DateTime.now();

    super.initState();
  }

  @override
  void dispose() {
    textPlaceController.dispose();
    textDescController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Expanded(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(Dimen.ICON_MARG),
          children: [

            const SizedBox(height: 20.0),

            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            'Data:',
                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                color: hintEnab_(context),
                                fontWeight: weight.halfBold
                            )
                        )
                      ],
                    ),

                    const SizedBox(height: 6.0),

                    Hero(
                        tag: MemoryWidget.memoryDateHeroTagFrom(initMemory?.lclId),
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            dateToString(date, yearAbbr: 'A.D.'),
                            style: AppTextStyle(
                              //fontFamily: '${Memory.fontName}$pickedFont',
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                color: textEnab_(context)),
                          ),
                        )
                    )

                  ],
                ),
                onTap: () async {

                  DateTime? data = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1989),
                      lastDate: DateTime.now()
                  );

                  if(data != null)
                    setState(() => data = data);

                },
              ),
            ),

            const SizedBox(height: 30.0),

            Row(
              children: [
                Icon(MdiIcons.mapMarkerOutline, color: hintEnab_(context)),
                const SizedBox(width: Dimen.ICON_MARG),
                Text(
                    'Miejsce:',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        color: hintEnab_(context),
                        fontWeight: weight.halfBold
                    )
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.ICON_SIZE + Dimen.ICON_MARG),
              child: Hero(
                  tag: MemoryWidget.memoryPlaceHeroTagFrom(initMemory?.lclId),
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      controller: textPlaceController,
                      onChanged: (text) => setState((){}),
                      style: AppTextStyle(color: textEnab_(context)),
                      decoration: InputDecoration(
                          hintText: 'Np. Nowy Sącz',
                          hintStyle: AppTextStyle(color: hintEnab_(context)),
                          border: InputBorder.none
                      ),
                      maxLines: null,
                      maxLength: Memory.maxLenPlace,
                    ),
                  )
              ),
            ),

            const SizedBox(height: 20.0),

            Row(
              children: [
                Icon(MdiIcons.treeOutline, color: hintEnab_(context)),
                const SizedBox(width: Dimen.ICON_MARG),
                Text(
                    'Opis:',
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        color: hintEnab_(context),
                        fontWeight: weight.halfBold
                    )
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: Dimen.ICON_SIZE + Dimen.ICON_MARG),
              child: Hero(
                  tag: MemoryWidget.memoryDescHeroTagFrom(initMemory?.lclId),
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      controller: textDescController,
                      onChanged: (text) => setState((){}),
                      style: AppTextStyle(color: textEnab_(context)),
                      decoration: InputDecoration(
                          hintText: 'Np. III Nocny Bieg Mikołajkowy, piosenka Baśki!',
                          hintStyle: AppTextStyle(color: hintEnab_(context)),
                          border: InputBorder.none
                      ),
                      maxLines: null,
                      maxLength: Memory.maxLenDescription,
                    ),
                  )
              ),
            ),

          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(Dimen.ICON_MARG),
        child: Row(
          children: [

            if(!creatingNew)
              SimpleButton.from(icon: MdiIcons.trashCanOutline, text: 'Porzuć', textColor: Colors.red, onTap: widget.onRemoved),

            Expanded(child: Container()),

            SimpleButton.from(
                icon: MdiIcons.arrowRight,
                text: 'Dalej',
                textColor: blocked?iconDisab_(context):iconEnab_(context),
                onTap: blocked?null:() async =>
                  widget.onNext!(memoryBuilder),
                iconLeading: false
            ),

          ],
        ),
      )
    ],
  );

}

class _PartTwo extends StatefulWidget{

  final Song? song;
  final MemoryBuilder memoryBuilder;

  final void Function() onBack;
  final void Function(MemoryBuilder memoryBuilder)? onSaveTap;

  const _PartTwo({
    required this.song,
    required this.memoryBuilder,
    required this.onBack,
    required this.onSaveTap
  });

  @override
  State<StatefulWidget> createState() => _PartTwoState();

}

class _PartTwoState extends State<_PartTwo>{

  Song? get song => widget.song;
  MemoryBuilder get memoryBuilder => widget.memoryBuilder;

  DateTime? get date => memoryBuilder.date;
  String? get place => memoryBuilder.place;
  String? get description => memoryBuilder.desc;

  bool get published => memoryBuilder.published;
  int get fontIndex => memoryBuilder.fontIndex;
  set fontIndex(int value) => memoryBuilder.fontIndex = value;

  bool? processing;

  @override
  void initState() {
    processing = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 16,
        itemBuilder: (context, index) =>
            _FontWidget(
                index,
                fontIndex,
                description!.isEmpty?place:description,
                onTap: (fontIndex) => setState(() => this.fontIndex = fontIndex)
            ),
      ),

      Positioned(
        bottom: Dimen.FLOATING_BUTTON_MARG,
        right: Dimen.FLOATING_BUTTON_MARG,
        child: ExtendedFloatingButton(
          MdiIcons.check,
          'Zapisz',
          background: background_(context),
          backgroundEnd: cardEnab_(context),
          onTap: () => widget.onSaveTap?.call(memoryBuilder)
        ),
      ),
    ],
  );

}

class _FontWidget extends StatelessWidget{

  final int fontIndex;
  final int pickedFont;
  final String? text;
  final void Function(int fontIndex)? onTap;

  const _FontWidget(this.fontIndex, this.pickedFont, this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {

    bool selected = pickedFont == fontIndex;

    return ListTile(
      //tileColor: selected?cardEnab_(context):background_(context),
      leading: SizedBox(
          width: 32.0,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ' ${fontIndex + 1}',
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                  fontWeight: selected?weight.bold:weight.normal,
              ),
            ),
          ),
      ),
      title: Text(
        'Czcionka: $text',
        style: TextStyle(
          fontFamily: '${Memory.fontName}$fontIndex',
          fontSize: Dimen.TEXT_SIZE_BIG*Memory.fontSizeRatioMap[fontIndex]!,
          fontWeight: selected?FontWeight.bold:FontWeight.normal,
        ),
        maxLines: 1,
      ),
      subtitle: Text(
        Memory.fontNameMap[fontIndex]!,
        style: AppTextStyle(
          fontWeight: selected?weight.bold:weight.normal,
        ),
      ),
      onTap: (){
        hideKeyboard(context);
        onTap!(fontIndex);
      }
    );

  }

}
