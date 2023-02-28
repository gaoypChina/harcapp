import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder.dart';
import 'package:harcapp/_common_widgets/folder_widget/folder_tile.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

class FolderSearchPage<T extends Folder> extends StatefulWidget{

  final List<T> allFolders;
  final void Function(T)? onSelected;

  const FolderSearchPage({required this.allFolders, this.onSelected, super.key});

  @override
  State<StatefulWidget> createState() => FolderSearchPageState<T>();

}

class FolderSearchPageState<T extends Folder> extends State<FolderSearchPage<T>>{

  List<T> get allFolders => widget.allFolders;

  late List<T> searchedFolders;

  @override
  void initState() {
    searchedFolders = allFolders;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Przeglądaj foldery'),
          centerTitle: true,
        ),

        FloatingContainer.child(
            child: SearchField(
              hint: 'Szukaj folderu:',
              onChanged: (text){

                if(text.isEmpty) {
                  setState(() => searchedFolders = allFolders);
                  return;
                }

                text = remSpecChars(remPolChars(text));

                List<T> result = [];
                for(T folder in allFolders)
                  if(remSpecChars(remPolChars(folder.name)).contains(text))
                    result.add(folder);

                setState(() => searchedFolders = result);

              },
            ),
            height: SearchField.height
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => SimpleButton(
                clipBehavior: Clip.none,
                radius: AppCard.bigRadius,
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimen.SIDE_MARG,
                  vertical: Dimen.defMarg
                ),
                child: FolderTile(searchedFolders[index]),
                onTap: () => widget.onSelected?.call(searchedFolders[index])
              ),
              childCount: searchedFolders.length
            ),
          ),
        )

      ],
    ),
  );

}