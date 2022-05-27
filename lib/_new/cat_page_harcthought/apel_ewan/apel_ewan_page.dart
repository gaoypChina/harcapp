import 'dart:math';

import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
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
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

  List<ApelEwanOwnFolder> get ownFolders{
    List<String> folderNames = ApelEwanOwnFolder.allFolderIds;

    List<ApelEwanOwnFolder> _folders = [];
    for(String folderName in folderNames)
      _folders.add(ApelEwanOwnFolder.from(folderName));

    return _folders;
  }

  late List<ApelEwanOwnFolder> _folders;

  late TabController tabController;
  ValueNotifier<double>? notifier;

  List<ApelEwan> get allApelEwans => widget.allApelEwans;
  
  late List<ApelEwan> searchedApelEwans;

  void initTabViewStuff(){
    _folders = ownFolders;
    tabController = TabController(
        length: _folders.length + 3, // +1 for new folder tab.
        vsync: this,
        initialIndex: notifier?.value.toInt()??0
    );
    notifier = ValueNotifier<double>(tabController.index.toDouble());
    tabController.animation!.addListener(() => notifier!.value = tabController.animation!.value);
  }

  @override
  void initState() {
    searchedApelEwans = [];
    searchedApelEwans.addAll(allApelEwans);

    initTabViewStuff();

    super.initState();
  }

  @override
  Widget build(BuildContext context){

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

    for(ApelEwanOwnFolder folder in _folders){

      tabs.add(FolderTab(
        iconKey: folder.iconKey,
        colorsKey: folder.colorsKey,
        folderName: folder.name,
        countText: 'Liczba apeli: ${folder.generalApelEwans.length + folder.notedApelEwans.length}',
      ));

      children.add(ApelEwanGridView(folder: folder));
    }

    tabs.add(const AddFolderTab());
    children.add(AddFolderWidget(
      text: 'Stwórz <b>nowy folder</b>\ni zaplanuj <b>cykl apeli</b>!',
      onSave: (String name, String iconKey, String colorsKey){
        ApelEwanOwnFolder folder = ApelEwanOwnFolder.create();
        folder.name = name;
        folder.iconKey = iconKey;
        folder.colorsKey = colorsKey;

        setState(() => initTabViewStuff());
        post(() => tabController.animateTo(_folders.indexOf(folder)));
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
            folders:
            List.filled(_EditFloatingButton.unbuttonedPagesBefore, null).cast<ApelEwanOwnFolder?>()
                + ownFolders,

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
              folders: List.filled(_EditFloatingButton.unbuttonedPagesBefore, null).cast<ApelEwanFolder?>() + ownFolders,
              notifier: notifier!
          )
        ],
      )
    );
  }

}

class _EditFloatingButton extends StatelessWidget{

  static const int unbuttonedPagesBefore = 2;
  static const int unbuttonedPagesAfter = 1;

  final List<ApelEwanOwnFolder?> folders;
  final ValueNotifier notifier;
  final void Function(String, String, String)? onSaved;
  final void Function(ApelEwanOwnFolder)? onDeleted;

  const _EditFloatingButton({required this.folders, required this.notifier, this.onSaved, this.onDeleted});

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: notifier,
      builder: (context, child){

        int realPage = (.5 + notifier.value).toInt();
        int truncPage = min(.5 + notifier.value, folders.length - 1).toInt();

        bool isInvisible = realPage < unbuttonedPagesBefore || realPage > folders.length - unbuttonedPagesAfter;

        return Transform.translate(
          offset: Offset(0, Dimen.FLOATING_BUTTON_MARG*(1-cos(2*pi*notifier.value))),
          child: Opacity(

            opacity:
            isInvisible?
            0:
            max(0, cos(2*pi*notifier.value)),

            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: folders[truncPage]?.colorData.avgColor,
              onPressed: isInvisible?null: (){
                ApelEwanOwnFolder? folder = folders[truncPage];
                if(folder == null) return;
                pushPage(
                    context,
                    builder: (context) => FolderEditPage(
                      initName: folder.name,
                      initIconKey: folder.iconKey,
                      initColorsKey: folder.colorsKey,
                      onSave: onSaved,
                      onDeleteTap: (){
                        folder.delete();
                        onDeleted?.call(folder);
                      },
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

  final List<ApelEwanFolder?> folders;
  final ValueNotifier notifier;

  const _PrintFloatingButton({required this.folders, required this.notifier});

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: notifier,
      builder: (context, child){

        int realPage = (.5 + notifier.value).toInt();
        int truncPage = min(.5 + notifier.value, folders.length - 1).toInt();

        bool isInvisible = realPage < unbuttonedPagesBefore || realPage > folders.length - unbuttonedPagesAfter;

        return Transform.translate(
          offset: Offset(0, 2*Dimen.FLOATING_BUTTON_MARG*(1-cos(2*pi*notifier.value))),
          child: Opacity(

            opacity:
            isInvisible?
            0:
            max(0, cos(2*pi*notifier.value)),

            child: FloatingActionButton(
              backgroundColor: folders[truncPage]?.colorData.avgColor,
              onPressed: isInvisible?null: (){

              },
              child: const Icon(MdiIcons.printer),
            ),
          ),
        );
      }
  );

}
