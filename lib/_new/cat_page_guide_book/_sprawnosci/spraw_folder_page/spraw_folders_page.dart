import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder_edit_page.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder_icon.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_grid_page.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_widget_small.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_grid_view.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';


class SprawFoldersPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => SprawFoldersPageState();

}

class SprawFoldersPageState extends State<SprawFoldersPage> with TickerProviderStateMixin{

  List<SprawFolder> get folders{
    List<String> folderNames = SprawFolder.allFolderIds;

    List<SprawFolder>_folders = [];
    for(String folderName in folderNames)
      _folders.add(SprawFolder.from(folderName));

    return _folders;
  }

  List<SprawFolder> _folders;

  TabController tabController;
  ValueNotifier<double> notifier;

  void initTabViewStuff(){
    _folders = folders;
    tabController = TabController(
        length: _folders.length,
        vsync: this,
        initialIndex: tabController==null?0:tabController.index
    );
    notifier = ValueNotifier<double>(tabController.index.toDouble());
    tabController.animation.addListener(() => notifier.value = tabController.animation.value);
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

  int get currFolderIndex => (.5 + notifier.value).toInt();

  @override
  Widget build(BuildContext context) {

    Widget addFolderButton = SimpleButton.from(
      context: context,
      icon: MdiIcons.plus,
      text: _folders.length==1?null:'Nowy',
      iconLeading: false,
      onTap: (){
        pushPage(context, builder: (context) => SprawFolderEditPage(
          onSave: (String name, String colorKey, String iconKey){
            SprawFolder folder = SprawFolder.create();
            folder.name = name;
            folder.colorKey = colorKey;
            folder.iconKey = iconKey;

            setState(() => initTabViewStuff());
            post(() => tabController.animateTo(_folders.indexOf(folder)));
          }
        ));
      },
    );

    List<Tab> tabs = [];
    List<Widget> children = [];

    for(SprawFolder folder in _folders){

      tabs.add(Tab(/*Lk_9_28b-36$text: '${folder.name} (${folder.spraws.length})'*/icon: Row(
        children: [
          SizedBox(width: 24.0,),
          SprawFolderIcon(folder.iconKey, folder.colorKey),
          //Icon(folder.icon, color: folder.colorData.avgColor),
          SizedBox(width: 32.0,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(folder.name, style: AppTextStyle(fontWeight: weight.halfBold)),
                Text('Liczba sprawności: ${folder.sprawUIDs.length}', style: AppTextStyle()),
              ]
          ),
          //SizedBox(width: 24.0,),
          //Text('${folder.sprawUIDs.length}', style: AppTextStyle(fontWeight: weight.bold)),
          SizedBox(width: 32.0,),
        ],
      )));

      children.add(SprawGridView(
          title: folder.name,
          mode: SprawWidgetSmall.MODE_SAVED,
          UIDs: folder.sprawUIDs,
          emptyWidget: EmptyMessage(),
          icon: folder.icon,
          sprawCardBackgroundColor: background_(context),
          onSprawLongPress: (spraw) => showAlertDialog(
              context,
              title: 'Ostrożnie...',
              leading: SprawWidgetSmall(
                  spraw,
                  SprawWidgetSmall.MODE_SAVED,
                  clickable: false,
                  margin: EdgeInsets.only(right: alertDialogMarginVal)
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

        /*
            openDialog(
          context: context,
          builder: (context) => Center(
            child:  _DeleteSprawDialog(
              spraw: spraw,
              folder: folder,
              mode: SprawWidgetSmall.MODE_SAVED,
            ),
          )
        )
          */
      ));
    }

    if(_folders.length == 1)
      return SprawGridPage(
          title: 'Zapisane sprawności',
          UIDs: SprawFolder.getSprawUIDs(SprawFolder.omegaFolderId),
          mode: SprawWidgetSmall.MODE_SAVED,
          icon: SprawFolder.omegaFolderIcon,
          actions: [addFolderButton],
      );

    return BottomNavScaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            pinned: true,
            title: Text('Moje foldery'),
            centerTitle: true,
            actions: [addFolderButton],
            bottom: TabBar(
              controller: tabController,
              isScrollable: true,
              physics: BouncingScrollPhysics(),
              tabs: tabs,
              /*[
                    Consumer<SprawSavedListProv>(
                      builder: (context, prov, child) =>
                          Tab(text: 'Zapisane ${Spraw.getSavedOnlyUIDList.length}'),
                    ),
                    Consumer<SprawInProgressListProv>(
                      builder: (context, prov, child) =>
                          Tab(text: 'Realizowane ${Spraw.getInProgressUIDList.length}'),
                    ),
                    Consumer<SprawCompletedListProv>(
                      builder: (context, prov, child) =>
                          Tab(text: 'Zdobyte ${Spraw.getCompletedUIDList.length}'),
                    ),
                  ]*/
              indicator: MaterialIndicator(
                  horizontalPadding: 12.0,
                  height: 48.0,
                  topRightRadius: AppCard.BIG_RADIUS,
                  topLeftRadius: AppCard.BIG_RADIUS,
                  color: cardEnab_(context)
              ),//AppTabBarIncdicator(context: context),
            ),
          ),
        ],
        body: Container(
          color: cardEnab_(context),
          child: TabBarView(
            controller: tabController,
            physics: BouncingScrollPhysics(),
            children: children,
            /*[

                Consumer<SprawSavedListProv>(
                  builder: (context, prov, child) => SprawGridView(
                    title: 'Zapisane sprawności',
                    mode: SprawWidgetSmall.MODE_SAVED,
                    UIDs: Spraw.getSavedOnlyUIDList,
                    emptyMessage: 'Nic',
                    icon: ItemWidget.ICON_SAVED,
                  ),
                ),

                Consumer<SprawInProgressListProv>(
                    builder: (context, prov, child) => SprawGridView(
                      title: 'Realizowane sprawności',
                      mode: SprawWidgetSmall.MODE_IN_PROGRESS,
                      UIDs: Spraw.getInProgressUIDList,
                      icon: ItemWidget.ICON_IN_PROGRESS,
                      emptyMessage: 'Pusto',
                      showProgress: true,
                    )
                ),

                Consumer<SprawCompletedListProv>(
                    builder: (context, prov, child) => SprawGridView(
                      title: 'Zdobyte sprawności',
                      mode: SprawWidgetSmall.MODE_COMPLETE,
                      UIDs: Spraw.getCompletedUIDList,
                      emptyMessage: 'Brak',
                      icon: ItemWidget.ICON_COMPLETED,
                    )
                )
              ], */
          ),
        ),
      ),
      floatingActionButton: _FloatingButton(
        folders: folders,
        notifier: notifier,
        mode: SprawWidgetSmall.MODE_SAVED,
        onSaved: (String name, String colorKey, String iconKey) => setState((){
          folders[tabController.index].name = name;
          folders[tabController.index].colorKey = colorKey;
          folders[tabController.index].iconKey = iconKey;
        }),
        onDeleted: (folder){
          showAppToast(context, text: 'Usunięto folder <b>${folder.name}</b>');
          setState(() => initTabViewStuff());
        },
      ),
      /*
      bottomNavigationBar:
      showAll?
      AppCard(
        margin: EdgeInsets.only(bottom: Dimen.DEF_MARG, left: Dimen.DEF_MARG, right: Dimen.DEF_MARG),
        elevation: AppCard.bigElevation,
        radius: AppCard.BIG_RADIUS,
        child: TitleShortcutRowWidget(
          title: 'Przeglądaj wszystkie',
          onOpen: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => SprawnosciPage(showProgress: !showAll))),
        ),
      ):null,
       */
    );

  }

}

class _FloatingButton extends StatelessWidget{

  final List<SprawFolder> folders;
  final String mode;
  final ValueNotifier notifier;
  final void Function(String, String, String) onSaved;
  final void Function(SprawFolder) onDeleted;

  const _FloatingButton({@required this.folders, @required this.mode, @required this.notifier, this.onSaved, this.onDeleted});

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
        animation: notifier,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, Dimen.FLOATING_BUTTON_MARG*(1-cos(2*pi*notifier.value))),
          child: Opacity(
            opacity: (.5 + notifier.value).toInt() == 0?0:max(0, cos(2*pi*notifier.value)),
            child: FloatingActionButton(
              backgroundColor: folders[(.5 + notifier.value).toInt()].colorData.avgColor,
              child: Icon(MdiIcons.pencil),
              onPressed: (.5 + notifier.value).toInt() == 0?null: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SprawFolderEditPage(
                        initFolder: folders[(.5 + notifier.value).toInt()],
                        onSave: onSaved,
                        onDeleteTap: (folder){
                          SprawFolder folder = folders[(.5 + notifier.value).toInt()];
                          folder.delete();
                          onDeleted?.call(folder);
                        },
                      )
                  )
              ),
            ),
          ),
        )
    );

  }



}

class EmptyMessage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimen.SIDE_MARG),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            'W tym folderze pusto!',
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.bold),
          ),

          SizedBox(height: 2*Dimen.SIDE_MARG),

          AppText(
            'Aby dodać sprawności do folderu, <b>wybierz sprawność</b> i <b>przytrzymaj</b> przycisk:',
            size: Dimen.TEXT_SIZE_BIG,
            textAlign: TextAlign.center,
          ),

          SizedBox(height: Dimen.SIDE_MARG),

          Icon(MdiIcons.bookmarkOutline, size: 32.0)
        ],
      ),
    );
  }



}