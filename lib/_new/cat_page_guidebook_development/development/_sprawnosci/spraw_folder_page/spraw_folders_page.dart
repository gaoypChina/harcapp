import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_search_page.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/folder_widget/add_folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/add_folder_widget.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_edit_page.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tab_indicator.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_widget_small.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_grid_view.dart';
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

  static const int unbuttonedPagesBefore = 3;
  static const int unbuttonedPagesAfter = 1;

  List<BaseSprawFolder> get folders => BaseSprawFolder.allFolders;

  late TabController tabController;
  ValueNotifier<double>? notifier;

  void initTabViewStuff(){
    tabController = TabController(
        length: folders.length + 1, // +1 for new folder tab.
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

    for(BaseSprawFolder folder in folders){

      tabs.add(FolderTab(
        iconKey: folder.iconKey,
        colorsKey: folder.colorsKey,
        folderName: folder.name,
        countText: 'Liczba sprawności: ${folder.count}',
      ));

      children.add(SprawGridView(
          title: folder.name,
          mode: SprawWidgetSmall.MODE_SAVED,
          sprawUniqNames: folder.sprawUIDs,
          emptyWidget: EmptyMessage(
            showHowToAddMessage: folder is OwnSprawFolder,
          ),
          icon: folder.icon,
          sprawCardBackgroundColor: background_(context),
          onSprawLongPress: (spraw) => showAlertDialog(
              context,
              title: 'Ostrożnie...',
              leading: Padding(
                padding: const EdgeInsets.only(right: alertDialogMarginVal),
                child: SprawWidgetSmall(
                    spraw,
                    SprawWidgetSmall.MODE_SAVED,
                    clickable: false,
                ),
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
          ),
          onInvalidSprawLongPress: (sprawUniqName){
            folder.remove(sprawUniqName);
            setState(() {});
          },

      ));
    }

    tabs.add(const AddFolderTab());
    children.add(AddFolderWidget(
        text: 'Stwórz nowy folder ze sprawnościami!',
        onSave: (String name, String iconKey, String colorsKey) async {
          OwnSprawFolder folder = await OwnSprawFolder.create();
          folder.name = name;
          folder.iconKey = iconKey;
          folder.colorsKey = colorsKey;

          setState(() => initTabViewStuff());
          post(() => tabController.animateTo(folders.indexOf(folder)));
        }
    ));

    return BottomNavScaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            pinned: true,
            title: AppBarTitleWidget(notifier: notifier!),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(MdiIcons.magnify),
                onPressed: () => pushPage(
                    context,
                    builder: (context) => FolderSearchPage<BaseSprawFolder>(
                      allFolders: BaseSprawFolder.allFolders,
                      onSelected: (folder){
                        int index = folders.indexOf(folder);
                        tabController.animateTo(index);
                        Navigator.pop(context);
                      },
                    )
                ),
              )
            ],
            bottom: TabBar(
              splashBorderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppCard.bigRadius),
                  topRight: Radius.circular(AppCard.bigRadius)
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
        onSaved: (String name, String iconKey, String colorsKey) => setState((){
          (folders[tabController.index] as OwnSprawFolder).name = name;
          (folders[tabController.index] as OwnSprawFolder).iconKey = iconKey;
          (folders[tabController.index] as OwnSprawFolder).colorsKey = colorsKey;
        }),
        onDeleted: (folder){
          showAppToast(context, text: 'Usunięto folder <b>${folder.name}</b>');
          setState(() => initTabViewStuff());
        },
      ),
    );

  }

}

class AppBarTitleWidget extends StatelessWidget{

  final ValueNotifier notifier;

  const AppBarTitleWidget({required this.notifier, super.key});

  double get transProgress => max(min((notifier.value - SprawFoldersPageState.unbuttonedPagesBefore + 1), 1), 0);

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 120,
    child: AnimatedBuilder(
        animation: notifier,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, kToolbarHeight * transProgress),
          child: Column(
            children: [

              SizedBox(
                  height: kToolbarHeight,
                  child: Center(
                    child: Opacity(
                      opacity: 1 - max(0, sin(pi*transProgress)),
                      child: Text(
                        'Moje foldery',
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_APPBAR
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(
                  height: kToolbarHeight,
                  child: Center(
                    child: Opacity(
                      opacity: max(0, cos(pi*transProgress)),
                      child: Text(
                        'Foldery',
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_APPBAR
                        ),
                      ),
                    ),
                  )
              ),
              const SizedBox(height: kToolbarHeight)
            ],
          ),
        )
    ),
  );

}

class _EditFloatingButton extends StatelessWidget{

  final List<BaseSprawFolder> folders;
  final ValueNotifier notifier;
  final void Function(String, String, String)? onSaved;
  final void Function(BaseSprawFolder)? onDeleted;

  const _EditFloatingButton({required this.folders, required this.notifier, this.onSaved, this.onDeleted});

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
      animation: notifier,
      builder: (context, child){

        int realPage = (.5 + notifier.value).toInt();
        int truncPage = min(.5 + notifier.value, folders.length - 1).toInt();

        bool isInvisible = realPage < SprawFoldersPageState.unbuttonedPagesBefore || realPage > folders.length - SprawFoldersPageState.unbuttonedPagesAfter;

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
                BaseSprawFolder folder = folders[truncPage];
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

  final bool showHowToAddMessage;

  const EmptyMessage({this.showHowToAddMessage = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Text(
          'W tym folderze pusto!',
          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold),
        ),

        if(showHowToAddMessage)
          const SizedBox(height: 2*Dimen.SIDE_MARG),

        if(showHowToAddMessage)
          const AppText(
            'Aby dodać sprawności do folderu, <b>wybierz sprawność</b> i <b>przytrzymaj</b> przycisk:',
            size: Dimen.TEXT_SIZE_BIG,
            textAlign: TextAlign.center,
          ),

        if(showHowToAddMessage)
          const SizedBox(height: Dimen.SIDE_MARG),

        if(showHowToAddMessage)
          const Icon(MdiIcons.bookmarkOutline, size: 32.0)
      ],
    ),
  );



}