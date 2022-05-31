import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/folder_widget/add_folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/add_folder_widget.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_edit_page.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab_indicator.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_widget_small.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_grid_view.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class SprawFoldersPage extends StatefulWidget{

  const SprawFoldersPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SprawFoldersPageState();

}

class SprawFoldersPageState extends State<SprawFoldersPage> with TickerProviderStateMixin{

  List<SprawFolder> get folders{
    List<String> folderNames = SprawFolder.allFolderIds;

    List<SprawFolder> _folders = [];
    for(String folderName in folderNames)
      _folders.add(SprawFolder.from(folderName));

    return _folders;
  }

  late List<SprawFolder> _folders;

  late TabController tabController;
  ValueNotifier<double>? notifier;

  void initTabViewStuff(){
    _folders = folders;
    tabController = TabController(
        length: _folders.length + 1, // +1 for new folder tab.
        vsync: this,
        initialIndex: notifier?.value.toInt()??0
    );
    notifier = ValueNotifier<double>(tabController.index.toDouble());
    tabController.animation!.addListener(() => notifier!.value = tabController.animation!.value);
  }

  @override
  void initState() {
    initTabViewStuff();

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  int get currFolderIndex => (.5 + notifier!.value).toInt();

  @override
  Widget build(BuildContext context) {

    List<Widget> tabs = [];
    List<Widget> children = [];

    for(SprawFolder folder in _folders){

      tabs.add(FolderTab(
        iconKey: folder.iconKey,
        colorsKey: folder.colorsKey,
        folderName: folder.name,
        countText: 'Liczba sprawności: ${folder.spraws.length}',
      ));

      children.add(SprawGridView(
          title: folder.name,
          mode: SprawWidgetSmall.MODE_SAVED,
          UIDs: folder.sprawUIDs,
          emptyWidget: const EmptyMessage(),
          icon: folder.icon,
          sprawCardBackgroundColor: background_(context),
          onSprawLongPress: (spraw) => showAlertDialog(
              context,
              title: 'Ostrożnie...',
              leading: SprawWidgetSmall(
                  spraw,
                  SprawWidgetSmall.MODE_SAVED,
                  clickable: false,
                  margin: const EdgeInsets.only(right: alertDialogMarginVal)
              ),
              content: 'Czy usunąć sprawność:\n<b>${spraw.title}</b>\n\nz folderu:\n<b>${folder.name}</b>?',
              actionBuilder: (context) => [

                AlertDialogButton(
                  text: 'Nie',
                  onTap: () => Navigator.pop(context)
                ),

                AlertDialogButton(
                    text: 'Tak',
                    onTap: (){
                      setState(() => folder.remove(spraw.uniqName));
                      Navigator.pop(context);
                    }
                ),

              ]
          )

      ));
    }

    tabs.add(const AddFolderTab());
    children.add(AddFolderWidget(
        text: 'Stwórz nowy folder ze sprawnościami!',
        onSave: (String name, String iconKey, String colorsKey) async {
          SprawFolder folder = await SprawFolder.create();
          folder.name = name;
          folder.iconKey = iconKey;
          folder.colorsKey = colorsKey;

          setState(() => initTabViewStuff());
          post(() => tabController.animateTo(_folders.indexOf(folder)));
        }
    ));

    return BottomNavScaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            pinned: true,
            title: const Text('Moje foldery'),
            centerTitle: true,
            //actions: [addFolderButton],
            bottom: TabBar(
              splashBorderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppCard.BIG_RADIUS),
                  topRight: Radius.circular(AppCard.BIG_RADIUS)
              ),
              controller: tabController,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              tabs: tabs,
              indicator: FolderTabIndicator(context),
            ),
          ),
        ],
        body: Container(
          color: backgroundIcon_(context),
          child: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: children,
          ),
        ),
      ),
      floatingActionButton: _EditFloatingButton(
        folders: folders,
        notifier: notifier!,
        mode: SprawWidgetSmall.MODE_SAVED,
        onSaved: (String name, String iconKey, String colorsKey) => setState((){
          folders[tabController.index].name = name;
          folders[tabController.index].iconKey = iconKey;
          folders[tabController.index].colorsKey = colorsKey;
        }),
        onDeleted: (folder){
          showAppToast(context, text: 'Usunięto folder <b>${folder.name}</b>');
          setState(() => initTabViewStuff());
        },
      ),
    );

  }

}

class _EditFloatingButton extends StatelessWidget{

  static const int unbuttonedPagesBefore = 1;
  static const int unbuttonedPagesAfter = 1;

  final List<SprawFolder> folders;
  final String mode;
  final ValueNotifier notifier;
  final void Function(String, String, String)? onSaved;
  final void Function(SprawFolder)? onDeleted;

  const _EditFloatingButton({required this.folders, required this.mode, required this.notifier, this.onSaved, this.onDeleted});

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
              backgroundColor: folders[truncPage].colorsData.avgColor,
              onPressed: isInvisible?null:(){
                SprawFolder folder = folders[truncPage];
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

class EmptyMessage extends StatelessWidget{

  const EmptyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Text(
          'W tym folderze pusto!',
          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold),
        ),

        const SizedBox(height: 2*Dimen.SIDE_MARG),

        const AppText(
          'Aby dodać sprawności do folderu, <b>wybierz sprawność</b> i <b>przytrzymaj</b> przycisk:',
          size: Dimen.TEXT_SIZE_BIG,
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: Dimen.SIDE_MARG),

        const Icon(MdiIcons.bookmarkOutline, size: 32.0)
      ],
    ),
  );



}