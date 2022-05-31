import 'dart:io';
import 'dart:math';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_text_pw.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/folder_widget/add_folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/add_folder_widget.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_edit_page.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab_indicator.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_folder.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/apel_ewan_persistant_folder.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/data.dart';
import 'package:harcapp/_new/cat_page_harcthought/apel_ewan/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'apel_ewan_grid_view.dart';
import 'apel_ewan_own_folder.dart';
import 'apel_ewan_thumbnail_widget.dart';

class ApelEwansPage extends StatefulWidget{

  final List<ApelEwan> allApelEwans;

  const ApelEwansPage(this.allApelEwans, {super.key});
  
  @override
  State<StatefulWidget> createState() => ApelEwansPageState();

}

class ApelEwansPageState extends State<ApelEwansPage> with TickerProviderStateMixin{

  late TabController tabController;
  ValueNotifier<double>? notifier;

  List<ApelEwan> get allApelEwans => widget.allApelEwans;
  
  late List<ApelEwan> searchedApelEwans;

  void initTabViewStuff(){
    tabController = TabController(
        length: ApelEwanOwnFolder.allOwnFolders.length + 3, // +1 for new folder tab.
        vsync: this,
        initialIndex: notifier?.value.toInt()??0
    );
    notifier = ValueNotifier<double>(tabController.index.toDouble());
    tabController.animation!.addListener(() => notifier!.value = tabController.animation!.value);
  }

  void onAllFoldersNotified(){
    initTabViewStuff();
  }

  @override
  void initState() {
    searchedApelEwans = [];
    searchedApelEwans.addAll(allApelEwans);

    ApelEwanAllFoldersProvider.addChangeListener(onAllFoldersNotified);

    initTabViewStuff();

    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    ApelEwanAllFoldersProvider.removeChangeListener(onAllFoldersNotified);
  }

  @override
  Widget build(BuildContext context) => Consumer<ApelEwanAllFoldersProvider>(
    builder: (context, prov, child){

      List<Widget> tabs = [];
      List<Widget> children = [];

      tabs.add(FolderTab(
          iconKey: 'bookCross',
          colorsKey: CommonColorData.DEF_COLORS_KEY,
          folderName: 'Wszystkie',
          countText: 'Liczba apeli: ${allApelEwans.length}'
      ));
      children.add(CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          FloatingContainer(
            builder: (context, __, _) => SearchField(
              background: backgroundIcon_(context),
              preBackground: background_(context),
              hint: 'Szukaj...',
              onChanged: (text){

                if(text.isEmpty)
                  setState(() => this.searchedApelEwans = allApelEwans);

                List<ApelEwan> searchedApelEwans = [];

                text = remPolChars(text);
                for(ApelEwan apelEwan in allApelEwans) {
                  if (remPolChars(apelEwan.siglum
                      .replaceAll(' ', '')
                      .replaceAll(',', '')
                      .replaceAll('-', '')
                  ).contains(text.replaceAll(' ', '')
                      .replaceAll(',', '')
                      .replaceAll('-', '')
                  )) {
                    searchedApelEwans.add(apelEwan);
                    continue;
                  }

                  for (String title in apelEwan.subgroupTitle.values)
                    if (remPolChars(title).contains(text)) {
                      searchedApelEwans.add(apelEwan);
                      break;
                    }
                }

                setState(() => this.searchedApelEwans = searchedApelEwans);

              },
            ),
            height: SearchField.height,
          ),

          SliverPadding(
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              crossAxisSpacing: Dimen.ICON_MARG,
              mainAxisSpacing: Dimen.ICON_MARG,
              childAspectRatio: 1,
              children: searchedApelEwans.map((apelEwans) => ApelEwanThumbnailWidget(
                apelEwans,
              )).toList(),
            ),
          ),
        ],
      ));

      tabs.add(FolderTab(
          iconKey: 'textBoxMultiple',
          colorsKey: CommonColorData.OMEGA_COLORS_KEY,
          folderName: 'Dekalog',
          countText: 'Liczba apeli: ${dekalogApelEwans.length}'
      ));
      children.add(ApelEwanGridView<ApelEwanPersistentFolder>(
          folder: dekalogFolder
      ));

      List<ApelEwanOwnFolder> ownFolders = ApelEwanOwnFolder.allOwnFolders;

      for(ApelEwanOwnFolder folder in ownFolders){

        tabs.add(Consumer<ApelEwanFolderProvider>(
            builder: (context, prov, child) => FolderTab(
              iconKey: folder.iconKey,
              colorsKey: folder.colorsKey,
              folderName: folder.name,
              countText: 'Liczba apeli: ${folder.count}',
            ))
        );

        children.add(Consumer<ApelEwanFolderProvider>(
            builder: (context, prov, child) => ApelEwanGridView(folder: folder)
        ));
      }

      tabs.add(const AddFolderTab());
      children.add(AddFolderWidget(
        text: 'Stwórz <b>nowy folder</b>\ni zaplanuj <b>cykl apeli</b>!',
        onSave: (String name, String iconKey, String colorsKey) async {
          ApelEwanAllFoldersProvider prov = Provider.of<ApelEwanAllFoldersProvider>(context, listen: false);
          ApelEwanOwnFolder folder = await ApelEwanOwnFolder.create(
            name: name,
            iconKey: iconKey,
            colorsKey: colorsKey,
          );
          ApelEwanOwnFolder.addOwnFolder(folder);
          prov.notify();

          setState(() => initTabViewStuff());
          post(() => tabController.animateTo(ApelEwanOwnFolder.allOwnFolders.indexOf(folder)));
        },
      ));

      return BottomNavScaffold(
          body: Container(
            color: backgroundIcon_(context),
            child: ExtendedNestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [

                SliverAppBar(
                  title: const Text('Apele ewangeliczne'),
                  centerTitle: true,
                  floating: true,
                  pinned: true,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    physics: const BouncingScrollPhysics(),
                    controller: tabController,
                    tabs: tabs,
                    isScrollable: true,
                    indicator: FolderTabIndicator(context),
                    splashBorderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppCard.BIG_RADIUS),
                        topRight: Radius.circular(AppCard.BIG_RADIUS)
                    ),
                  ),
                ),

              ],
              pinnedHeaderSliverHeightBuilder: () => const TabBar(tabs: []).preferredSize.height,
              body: TabBarView(
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                children: children,
              ),
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              _EditFloatingButton(
                pageFolders:
                <ApelEwanFolder?>[null] + [dekalogFolder] + ownFolders + <ApelEwanFolder?>[null],

                notifier: notifier!,
                onSaved: (String name, String iconKey, String colorsKey) => setState((){
                  ownFolders[tabController.index - _EditFloatingButton.unbuttonedPagesBefore].name = name;
                  ownFolders[tabController.index - _EditFloatingButton.unbuttonedPagesBefore].iconKey = iconKey;
                  ownFolders[tabController.index - _EditFloatingButton.unbuttonedPagesBefore].colorsKey = colorsKey;
                }),
                onDeleted: (folder){
                  showAppToast(context, text: 'Usunięto folder <b>${folder.name}</b>');
                  setState(() => initTabViewStuff());
                },
              ),

              const SizedBox(height: Dimen.FLOATING_BUTTON_MARG),

              _PrintFloatingButton(
                  pageFolders:
                  <ApelEwanFolder?>[null] + [dekalogFolder] + ownFolders + <ApelEwanFolder?>[null],

                  notifier: notifier!
              )
            ],
          )
      );

    },
  );

}

class _EditFloatingButton extends StatelessWidget{

  static const int unbuttonedPagesBefore = 2;
  static const int unbuttonedPagesAfter = 1;

  final List<ApelEwanFolder?> pageFolders;
  final ValueNotifier notifier;
  final void Function(String, String, String)? onSaved;
  final void Function(ApelEwanFolder)? onDeleted;

  const _EditFloatingButton({required this.pageFolders, required this.notifier, this.onSaved, this.onDeleted});

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: notifier,
      builder: (context, child){

        int realPage = (.5 + notifier.value).toInt();
        int truncPage = min(.5 + notifier.value, pageFolders.length - 1).toInt();

        bool isInvisible = realPage < unbuttonedPagesBefore || realPage > pageFolders.length - 1 - unbuttonedPagesAfter;

        return Transform.translate(
          offset: Offset(0, Dimen.FLOATING_BUTTON_MARG*(1-cos(2*pi*notifier.value))),
          child: Opacity(

            opacity:
            isInvisible?
            0:
            max(0, cos(2*pi*notifier.value)),

            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: pageFolders[truncPage]?.colorsData.avgColor,
              onPressed: isInvisible?null: (){
                ApelEwanFolder? folder = pageFolders[truncPage];
                if(folder == null) return;
                pushPage(
                    context,
                    builder: (context) => FolderEditPage(
                      initName: folder.name,
                      initIconKey: folder.iconKey,
                      initColorsKey: folder.colorsKey,
                      onSave: onSaved,
                      onDeleteTap: folder is ApelEwanOwnFolder?(){
                        folder.delete();
                        onDeleted?.call(folder);
                      }:null,
                    )
                );
              },
              child: const Icon(MdiIcons.pencil),
            ),
          ),
        );
      }
  );

}

class _PrintFloatingButton extends StatelessWidget{

  static const int unbuttonedPagesBefore = 1;
  static const int unbuttonedPagesAfter = 1;

  final List<ApelEwanFolder?> pageFolders;
  final ValueNotifier notifier;

  const _PrintFloatingButton({required this.pageFolders, required this.notifier});

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: notifier,
      builder: (context, child){

        int realPage = (.5 + notifier.value).toInt();
        int truncPage = min(.5 + notifier.value, pageFolders.length - 1).toInt();

        bool isInvisible = realPage < unbuttonedPagesBefore || realPage > pageFolders.length - 1 - unbuttonedPagesAfter;

        return Transform.translate(
          offset: Offset(0, 2*Dimen.FLOATING_BUTTON_MARG*(1-cos(2*pi*notifier.value))),
          child: Opacity(

            opacity:
            isInvisible?
            0:
            max(0, cos(2*pi*notifier.value)),

            child: FloatingActionButton(
              backgroundColor: pageFolders[truncPage]?.colorsData.avgColor,
              onPressed: isInvisible?null: () async {

                ApelEwanFolder? folder = pageFolders[truncPage];

                if(folder == null){
                  showAppToast(context, text: 'Coś tu pusto...');
                  return;
                }

                final pdf = pw.Document();
                final font = await PdfGoogleFonts.latoRegular();
                final fontItalic = await PdfGoogleFonts.latoItalic();
                final fontBold = await PdfGoogleFonts.latoBold();

                if(folder.apelEwans.isEmpty){
                  pdf.addPage(pw.Page(build: (context) => pw.Center(
                      child: pw.Text('Koleżko, przecież tu niczego nie ma!', style: pw.TextStyle(font: font))
                  )));

                  final output = await getTemporaryDirectory();

                  final file = File(join(output.path, 'Zbiór apeli ewangelicznych - ${folder.name}.pdf'));
                  file.writeAsBytesSync(await pdf.save());

                  OpenFile.open(file.path);

                }

                for(ApelEwan apelEwan in folder.apelEwans){

                  String title = apelEwan.subgroupTitle.values.first;

                  String text = await apelEwan.text??'Problem z ładowaniem tekstu z pliku ${apelEwan.textFileName}.';
                  text = text.replaceAll('\n', ' ');
                  text = text.replaceAll('  ', ' ');

                  String subgroupSuff = apelEwan.subgroupTitle.keys.first;

                  String questions = await apelEwan.question(subgroupSuff)??'-';
                  String? comment = await apelEwan.comment(subgroupSuff);

                  List<pw.Widget> children = [];
                  List<String> questionList = questions.split('\n');
                  for(int i=0; i<questionList.length; i++)
                    children.add(pw.Padding(
                      padding: const pw.EdgeInsets.symmetric(vertical: 3),
                      child: pw.Row(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.SizedBox(
                                width: 36,
                                child: pw.Text(
                                    '${i + 1}.',
                                    style: pw.TextStyle(font: font)
                                )
                            ),

                            pw.Expanded(
                                child: getPwRichText(questionList[i], font, fontItalic, fontBold),
                            )
                          ]
                      )
                    ));

                  pw.Widget questionsWidget = pw.Column(
                    children: children
                  );

                  pw.Page page = pw.Page(
                      pageFormat: PdfPageFormat.a4,
                      build: (pw.Context pwContext) {

                        return pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                            children: [

                              pw.Text(title, style: pw.TextStyle(font: font, fontSize: 22.0)),

                              pw.SizedBox(height: 6),

                              pw.Container(
                                width: double.infinity,
                                height: 1,
                                color: const PdfColor(0, 0, 0, .3)
                              ),

                              pw.SizedBox(height: 24.0),

                              getPwRichText(text, font, fontItalic, fontBold, textAlign: pw.TextAlign.justify, height: 1.2),

                              // pw.Text(text, style: pw.TextStyle(font: font), textAlign: pw.TextAlign.justify),

                              pw.SizedBox(height: 24.0),

                              pw.Text('Pytania', style: pw.TextStyle(font: font, fontSize: 18.0)),

                              pw.SizedBox(height: 24.0),

                              questionsWidget,

                              pw.SizedBox(height: 24.0),

                              if(comment != null)
                                pw.Text('Komentarze', style: pw.TextStyle(font: font, fontSize: 18.0)),

                              if(comment != null)
                                pw.SizedBox(height: 24.0),

                              if(comment != null)
                                pw.Text(comment, style: pw.TextStyle(font: font), textAlign: pw.TextAlign.justify),

                            ]);


                      });

                  pdf.addPage(page);

                }

                final output = await getTemporaryDirectory();

                final file = File(join(output.path, 'Zbiór apeli ewangelicznych - ${folder.name}.pdf'));
                file.writeAsBytesSync(await pdf.save());

                OpenFile.open(file.path);

              },
              child: const Icon(MdiIcons.printer),
            ),
          ),
        );
      }
  );

}
