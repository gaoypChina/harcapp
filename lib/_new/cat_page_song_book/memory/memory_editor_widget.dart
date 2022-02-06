import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/song.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../song_management/memory.dart';
import 'memory_widget.dart';


Future<void> openMemoryEditor(BuildContext context, Song song, {Memory initMemory}) =>
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => MemoryEditorWidget(
          song,
          initMemory: initMemory,
          onBack: () => Navigator.pop(context),
          onSaved: () => Navigator.pop(context),
          onRemoved: () => Navigator.pop(context),
        )
    ));

class MemoryEditorWidget extends StatefulWidget{

  final Song song;
  final Function onSaved;
  final Function onBack;
  final Function onRemoved;
  final Memory initMemory;

  const MemoryEditorWidget(this.song, {this.initMemory, this.onSaved, this.onBack, this.onRemoved});

  @override
  State<StatefulWidget> createState() => MemoryEditorWidgetState();

}

class MemoryEditorWidgetState extends State<MemoryEditorWidget> with TickerProviderStateMixin{

  static const Duration CHORD_WIDGET_GROW_DURATION = Duration(milliseconds: 300);

  Song get song => widget.song;
  Memory get initMemory => widget.initMemory;

  MemoryBuilder memoryBuilder;

  int index;

  @override
  void initState() {
    index = 0;
    if(initMemory == null) memoryBuilder = MemoryBuilder.empty(song);
    else memoryBuilder = MemoryBuilder.from(initMemory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      appBar: AppBar(
        title: Text(widget.initMemory==null?'Dodaj wspomnienie':'Edytuj wspomnienie'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [

          Positioned(
            bottom: -.15*MediaQuery.of(context).size.width,
            right: -.15*MediaQuery.of(context).size.width,
            child: RotationTransition(
                turns: AlwaysStoppedAnimation(-15 / 360),
                child: Icon(MdiIcons.imageOutline, color: backgroundIcon_(context), size: .8*MediaQuery.of(context).size.width)
            )
          ),

          AnimatedChildSlider(
            index: index,
            direction: Axis.horizontal,
            children: [

              _PartOne(
                song: song,
                memoryBuilder: memoryBuilder,
                creatingNew: initMemory==null,
                onNext: (memoryBuilder){
                  this.memoryBuilder = memoryBuilder;
                  hideKeyboard(context);
                  setState(() => index = 1);
                },
                onRemoved: (){
                  song.removeMemory(initMemory);
                  if(widget.onRemoved != null) widget.onRemoved();
                },
              ),

              _PartTwo(
                  song: song,
                  memoryBuilder: memoryBuilder,
                  onBack: () => setState(() => index = 0),
                  onSaveTap: (MemoryBuilder memoryBuilder)async{

                    if(initMemory == null) {
                      Memory memory = await Memory.create(
                        song.fileName,
                        memoryBuilder.date,
                        memoryBuilder.place,
                        memoryBuilder.desc,
                        memoryBuilder.fontIndex,
                        memoryBuilder.published,
                      );
                      Memory.addToAll(memory);
                      song.addMemory(memory);
                    }
                    else
                      initMemory.update(
                        songFileName: song.fileName,
                        date: memoryBuilder.date,
                        place: memoryBuilder.place,
                        desc: memoryBuilder.desc,
                        fontIndex: memoryBuilder.fontIndex,
                        published: memoryBuilder.published,
                      );

                    widget.onSaved();
                  }
              )

            ],
          ),

        ],
      ),
    );
  }

}

class _PartOne extends StatefulWidget{

  final Song song;
  final MemoryBuilder memoryBuilder;
  final bool creatingNew;

  final Function(MemoryBuilder memoryBuilder) onNext;
  final void Function() onRemoved;

  const _PartOne({@required this.song, @required this.memoryBuilder, @required this.creatingNew, this.onNext, this.onRemoved});

  @override
  State<StatefulWidget> createState() => _PartOneState();

}

class _PartOneState extends State<_PartOne>{

  Song get song => widget.song;
  MemoryBuilder get memoryBuilder => widget.memoryBuilder;
  bool get creatingNew => widget.creatingNew;

  TextEditingController textPlaceController;
  TextEditingController textDescController;

  DateTime data;

  bool get blocked => textPlaceController.text.isEmpty && textDescController.text.isEmpty;

  @override
  void initState() {
    textPlaceController = TextEditingController(text: memoryBuilder==null?'':memoryBuilder.place);
    textPlaceController.addListener(() => memoryBuilder.place = textPlaceController.text);
    textDescController = TextEditingController(text: memoryBuilder==null?'':memoryBuilder.desc);
    textDescController.addListener(() => memoryBuilder.desc = textDescController.text);

    data = memoryBuilder==null?DateTime.now():memoryBuilder.date;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(Dimen.ICON_MARG),
            children: [

              SizedBox(height: 20.0),

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

                      SizedBox(height: 6.0),

                      Hero(
                        tag: MemoryWidget.MEMORY_DATE_TAG,
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            dateToString(data, yearAbbr: 'A.D.'),
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

                    DateTime _data = await showDatePicker(
                        context: context,
                        initialDate: data,
                        firstDate: DateTime(1989),
                        lastDate: DateTime.now()
                    );

                    if(_data != null)
                      setState(() => this.data = _data);

                  },
                ),
              ),

              SizedBox(height: 30.0),

              Row(
                children: [
                  Icon(MdiIcons.mapMarkerOutline, color: hintEnab_(context)),
                  SizedBox(width: Dimen.ICON_MARG),
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
                padding: EdgeInsets.only(left: Dimen.ICON_SIZE + Dimen.ICON_MARG),
                child: Hero(
                  tag: MemoryWidget.MEMORY_PLACE_TAG,
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
                      maxLength: 80,
                    ),
                  )
                ),
              ),

              SizedBox(height: 20.0),

              Row(
                children: [
                  Icon(MdiIcons.treeOutline, color: hintEnab_(context)),
                  SizedBox(width: Dimen.ICON_MARG),
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
                padding: EdgeInsets.only(left: Dimen.ICON_SIZE + Dimen.ICON_MARG),
                child: Hero(
                  tag: MemoryWidget.MEMORY_DESC_TAG,
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
                      maxLength: 200,
                    ),
                  )
                ),
              ),

            ],
          ),
        ),

        Padding(
          padding: EdgeInsets.all(Dimen.ICON_MARG),
          child: Row(
            children: [

              if(!creatingNew)
                SimpleButton.from(icon: MdiIcons.trashCanOutline, text: 'Porzuć', textColor: Colors.red, onTap: widget.onRemoved),

              Expanded(child: Container()),

              SimpleButton.from(
                icon: MdiIcons.arrowRight,
                text: 'Dalej',
                textColor: blocked?iconDisab_(context):iconEnab_(context),
                onTap: blocked?null:() async {
                  widget.onNext(memoryBuilder);
                },
                iconLeading: false
              ),

            ],
          ),
        )

      ],
    );

  }

}

class _PartTwo extends StatefulWidget{

  final Song song;
  final MemoryBuilder memoryBuilder;

  final void Function() onBack;
  final void Function(MemoryBuilder memoryBuilder) onSaveTap;

  const _PartTwo({
    @required this.song,
    @required this.memoryBuilder,
    @required this.onBack,
    @required this.onSaveTap
  });

  @override
  State<StatefulWidget> createState() => _PartTwoState();

}

class _PartTwoState extends State<_PartTwo>{

  Song get song => widget.song;
  MemoryBuilder get memoryBuilder => widget.memoryBuilder;

  DateTime get date => memoryBuilder.date;
  String get place => memoryBuilder.place;
  String get description => memoryBuilder.desc;

  bool get published => memoryBuilder.published;
  int get fontIndex => memoryBuilder.fontIndex;
  set fontIndex(int value) => memoryBuilder.fontIndex = value;

  bool processing;

  @override
  void initState() {
    processing = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 16,
            itemBuilder: (context, index) =>
                _FontWidget(
                    index,
                    fontIndex,
                    description.isEmpty?place:description,
                    onTap: (fontIndex) => setState(() => this.fontIndex = fontIndex)
                ),
          ),
        ),

        Padding(
          padding: EdgeInsets.only(
              left: Dimen.ICON_MARG,
              right: Dimen.ICON_MARG,
              bottom: Dimen.ICON_MARG
          ),
          child: AppCard(
            elevation: AppCard.bigElevation,
            radius: AppCard.BIG_RADIUS,
            margin: EdgeInsets.zero,
            child: MemoryWidget(memoryBuilder.build(''), fontIndex: fontIndex),
          ),
        ),

        Padding(
          padding: EdgeInsets.all(Dimen.ICON_MARG),
          child: Row(
            children: [

              SimpleButton.from(context: context, icon: MdiIcons.arrowLeft, text: 'Treść', onTap: widget.onBack),

              Expanded(child: Container()),

              SimpleButton.from(
                context: context,
                  icon: MdiIcons.check,
                  text: 'Zapisz',
                  iconLeading: false,
                  onTap: () async {
                    if(widget.onSaveTap != null)
                      widget.onSaveTap(memoryBuilder);
                  },
              ),

            ],
          ),
        )

      ]
    );
  }

}

class _FontWidget extends StatelessWidget{

  final int fontIndex;
  final int pickedFont;
  final String text;
  final void Function(int fontIndex) onTap;

  const _FontWidget(this.fontIndex, this.pickedFont, this.text, {this.onTap});

  @override
  Widget build(BuildContext context) {

    bool selected = pickedFont == fontIndex;

    return ListTile(
      leading: SizedBox(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ' ${fontIndex + 1}',
              style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                  fontWeight: weight.bold,
                  color: selected?iconEnab_(context):hintEnab_(context),
              ),
            ),
          ),
        width: 32.0,
      ),
      title: Text(
        Memory.FONT_NAME_MAP[fontIndex],
        style: AppTextStyle(
            fontSize: Dimen.TEXT_SIZE_BIG,
            color: selected?iconEnab_(context):textEnab_(context),
            shadow: selected
        ),
      ),
      subtitle: Text(
        'Czcionka: ${text}',
        style: TextStyle(
          fontFamily: '${Memory.fontName}$fontIndex',
          fontSize: Dimen.TEXT_SIZE_BIG*Memory.FONT_SIZE_RATIO_MAP[fontIndex],
          color: selected?iconEnab_(context):textEnab_(context),
          shadows: selected?
          const [Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 3.0,
            color: Color.fromARGB(72, 0, 0, 0),
          )]:null
        ),
        maxLines: 1,
      ),
      onTap: (){
        hideKeyboard(context);
        onTap(fontIndex);
      }
    );

  }

}
