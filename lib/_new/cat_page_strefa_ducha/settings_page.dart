import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'image_loader.dart';
import 'source.dart';

class SettingsPage extends StatefulWidget {

  final void Function()? sourceChanged;
  const SettingsPage({this.sourceChanged, super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();

}

class SettingsPageState extends State<SettingsPage> {

  static const Map<String, String> thumbnails = {
    'duchowe_banita_kwadrat': 'thumb_banita_kwadrat_122.webp',
    'duchowe_banita_ranna_depesza': 'thumb_banita_ranna_depesza_116.webp',
    'duchowe_banita_rozne': 'thumb_banita_rozne_31.webp',
    'duchowe_banita_w_skrocie': 'thumb_banita_w_skrocie_567.webp',
    'duchowe_deon_inne': 'thumb_deon_inne_1105.webp',
    'duchowe_deon_kwiatki': 'thumb_deon_kwiatki_69.webp',
    'duchowe_deon_notki_inne': 'thumb_deon_notki_inne_1.webp',
    'duchowe_deon_notki_kolor_na_deskach': 'thumb_deon_notki_kolor_na_deskach_244.webp',
    'duchowe_deon_notki_proste_sciana_biala': 'thumb_deon_notki_proste_sciana_biala_70.webp',
    'duchowe_deon_szary_kwadrat': 'thumb_deon_szary_kwadrat_12.webp',
    'duchowe_deon_w_kole': 'thumb_deon_w_kole_5.webp',
    'duchowe_loesje': 'thumb_loesje_73.webp',
    'duchowe_pustynia_serc_inne': 'thumb_pustynia_serc_inne_12.webp',
    'duchowe_theofeel_inne': 'thumb_theofeel_inne_12.webp'
  };

  void Function()? get sourceChanged => widget.sourceChanged;

  Map<String, int> savedLocally = {};
  Map<String, double> savedLocallySize = {};

  AppTextStyle get hintStyle => settingsHintStyle(context);
  AppTextStyle get textStyle => settingsTextStyle(context);

  void displayLocalCount() {

    Map<String, int> savedLocally = {};
    Map<String, double> savedLocallySize = {};

    for(Source source in Source.all!) {
      int count = (ImageLoader.getCachedItems(source)).length;
      savedLocally[source.uniqId] = count;
      double size = (ImageLoader.getSavedSourceSize(source))/(1024*1024);
      savedLocallySize[source.uniqId] = size;
    }
    this.savedLocally = savedLocally;
    this.savedLocallySize = savedLocallySize;
  }

  @override
  void initState() {
    displayLocalCount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          title: Text('Ustawienia'),
          centerTitle: true,
          floating: true,
        ),

        SliverList(delegate: SliverChildListDelegate([
          SwitchListTile(
            value: Settings.showInitMessage,
            title: Text('Pokazuj wiadomość powitalną', style: textStyle),
            onChanged: (bool value) => setState(() => Settings.showInitMessage = value),
          ),

          const SizedBox(height: Dimen.SETTINGS_MARG),

          SwitchListTile(
            value: Settings.saveLocally,
            title: Text('Zapisuj obejrzane grafiki', style: textStyle),
            subtitle: Text('Grafiki będą dostępne offline.', style: hintStyle),
            onChanged: (bool value) => setState(() => Settings.saveLocally = value),
          ),

          const SizedBox(height: Dimen.SETTINGS_MARG),

          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('Źródła grafik:', style: textStyle),
          )

        ])),

        SliverList(delegate: SliverChildBuilderDelegate(
                (context, index) => ItemWidget(
                this,
                Source.all![index],
                savedLocally[Source.all![index].uniqId],
                savedLocallySize[Source.all![index].uniqId],
                onTap: sourceChanged,
                onRemoved: () => setState((){}),
            ),
            childCount: Source.all!.length
        ))
      ],
    ),
  );
}

class ItemWidget extends StatefulWidget{

  final SettingsPageState parent;
  final Source source;
  final int? savedLocally;
  final double? savedLocallySize;
  final void Function()? onTap;
  final void Function()? onRemoved;

  const ItemWidget(this.parent, this.source, this.savedLocally, this.savedLocallySize, {this.onTap, this.onRemoved, super.key});

  @override
  State<StatefulWidget> createState() => ItemWidgetState();
}

class ItemWidgetState extends State<ItemWidget>{

  AppTextStyle get hintStyle => settingsHintStyle(context);
  AppTextStyle get textStyle => settingsTextStyle(context);
  
  SettingsPageState get parent => widget.parent;
  Source get source => widget.source;
  void Function()? get onTap => widget.onTap;
  void Function()? get onRemoved => widget.onRemoved;

  bool? downloading;
  late double progress;

  @override
  void initState() {
    downloading = false;
    progress = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Row(
    children: [

      SizedBox(
        height: 140,
        width: 120,
        child: AppCard(
          padding: EdgeInsets.zero,
          onTap: (){
            //ItemsProvider itemsProv = Provider.of<ItemsProvider>(context, listen: false);
            setState(() => source.display = !source.display);
            Source.aggrAllDisplayableItems();
            //itemsProv.reloadItems();
            onTap?.call();
          },
          radius: AppCard.bigRadius,
          margin: const EdgeInsets.all(Dimen.ICON_MARG),
          child: Stack(
            children: [

              Positioned.fill(
                child: Image.asset('assets/images/stref_duch/${SettingsPageState.thumbnails[source.uniqId]!}', fit: BoxFit.cover),
              ),

              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                color: source.display?Colors.transparent:Colors.black54,
                child: Center(
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: source.display?0:1,
                    child: Icon(MdiIcons.eyeOffOutline, color: Colors.white54, size: 48.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      Expanded(
        child: Column(
          children: [
            ListTile(
              title: Text(source.name!, style: textStyle.copyWith(color: source.display?textEnab_(context):hintEnab_(context))),
              subtitle: Text('Zapisane lokalnie: ${widget.savedLocally ?? '...'}/${source.items.length}\t\t(${widget.savedLocallySize==null?'...':widget.savedLocallySize!.toStringAsFixed(1)} MB)', style: hintStyle),
            ),
            Row(
              children: [

                if(widget.savedLocally == source.items.length)
                  Padding(padding: const EdgeInsets.all(Dimen.ICON_MARG), child: Icon(MdiIcons.check, color: accent_(context)))
                else
                  AnimatedCrossFade(
                    firstChild: IconButton(
                      icon: Icon(MdiIcons.trayArrowDown, color: accent_(context)),
                      onPressed: () => download()
                    ),
                    secondChild: Stack(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(Dimen.ICON_MARG),
                          child: CircularPercentIndicator(
                            radius: Dimen.ICON_SIZE,
                            lineWidth: 2.0,
                            percent: progress,
                            progressColor: accent_(context),
                          ),
                        ),

                        IconButton(
                            icon: Icon(MdiIcons.close, color: accent_(context), size: 16),
                            padding: const EdgeInsets.all(0),
                            onPressed: () => setState(() => downloading = false)
                        ),

                      ],
                    ),
                    crossFadeState: downloading!?CrossFadeState.showSecond:CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 100),
                  ),

                if(widget.savedLocally != null && widget.savedLocally != 0)
                  IconButton(icon: Icon(MdiIcons.trashCanOutline, color: accent_(context)), onPressed: (){
                    source.removeItemsSavedLocally();
                    parent.displayLocalCount();
                    onRemoved?.call();
                    showAppToast(context, text: 'Usunięto');
                    setState(() {});
                  }),

              ],
            )
          ],
        ),
      )

    ],
  );

  Future<void> download() async {
    setState(() => downloading = true);
    for(int i=0; i<source.items.length; i++){
      if(downloading == false) return;
      await ImageLoader.downloadImage(source.items[i], true);
      setState(() => progress = i/source.items.length);
      parent.displayLocalCount();
    }
  }

}

class Settings{

  static bool get showInitMessage => ShaPref.getBool(ShaPref.SHA_PREF_DUCHOWE_INIT_MESSAGE, true);
  static set showInitMessage(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_DUCHOWE_INIT_MESSAGE, value);

  static bool get saveLocally => ShaPref.getBool(ShaPref.SHA_PREF_DUCHOWE_SAVE_LOCALLY, true);
  static set saveLocally(bool value) => ShaPref.setBool(ShaPref.SHA_PREF_DUCHOWE_SAVE_LOCALLY, value);

}