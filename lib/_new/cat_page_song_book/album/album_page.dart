import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_new/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/providers.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'album_name.dart';
import 'album_widget.dart';
import 'album_editor_page/_main.dart';

class AlbumPage extends StatefulWidget{

  final void Function(BaseAlbum album)? onAlbumSelected;
  final void Function(OwnAlbum album)? onNewCreated;
  const AlbumPage({this.onAlbumSelected, this.onNewCreated, super.key});

  @override
  State<AlbumPage> createState() => AlbumPageState();

}

class AlbumPageState extends State<AlbumPage>{

  void Function(BaseAlbum album)? get onAlbumSelected => widget.onAlbumSelected;
  void Function(OwnAlbum album)? get onNewCreated => widget.onNewCreated;

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      body: Consumer<AlbumProvider>(
        builder: (context, prov, child) => CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: background_(context),
              title: Text(Albumy_),
              centerTitle: true,
              floating: true,
              actions: [
                IconButton(
                    icon: Icon(MdiIcons.plus),
                    onPressed: () => pushPage(
                        context,
                        builder: (context) => AlbumEditorPage(
                          onSaved: (album){
                            AlbumProvider.of(context).current = album;
                            onNewCreated?.call(album as OwnAlbum);
                          },
                        )
                    )
                )
              ],
            ),

            SliverPadding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              sliver: SliverList(
                delegate: SliverChildSeparatedBuilderDelegate(
                      (context, index) => _AlbumItem(
                      prov.all[index],
                      onAlbumSelected: onAlbumSelected
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
                  count: prov.all.length,
                ),
              ),
            )

          ],
        ),
      )
  );

}

class _AlbumItem extends StatefulWidget{

  final BaseAlbum album;
  final void Function(BaseAlbum album)? onAlbumSelected;

  _AlbumItem(this.album, {this.onAlbumSelected}):super(key: ValueKey(album.lclId));

  @override
  State<StatefulWidget> createState() => _AlbumItemState();

}

class _AlbumItemState extends State<_AlbumItem>{

  BaseAlbum get album => widget.album;
  void Function(BaseAlbum album)? get onAlbumSelected => widget.onAlbumSelected;

  @override
  Widget build(BuildContext context) => AlbumWidget(
    album,
    onTap: (){
      AlbumProvider.of(context).current = album;
      FloatingButtonProvider.notify_(context);
      onAlbumSelected?.call(album);
      Navigator.pop(context);
    },
    // trailing: album.editable?
    // null:
    // Padding(
    //   padding: const EdgeInsets.only(right: Dimen.ICON_MARG),
    //   child: Icon(MdiIcons.lockOutline, size: AlbumWidget.iconSize, color: iconDisab_(context)),
    // ),
    bottom: SizedBox(
      height: Dimen.ICON_FOOTPRINT,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          const SizedBox(width: AlbumWidget.titlePaddingVal),

          Icon(
            MdiIcons.music,
          ),
          const SizedBox(width: Dimen.defMarg),
          Text(
              '${album.songs.length}',
              style: AppTextStyle(
                  fontSize: 16.0,
                  fontWeight: weight.halfBold,
                  color: iconEnab_(context)
              )
          ),

          Expanded(child: Container()),

          if(album is SelectableAlbum)
            SimpleButton.from(
                context: context,
                icon: MdiIcons.pencilOutline,
                onTap: () => pushPage(
                    context,
                    builder: (context) => AlbumEditorPage(
                      initAlbum: album as SelectableAlbum,
                      onSaved: (album){

                        AlbumProvider prov = Provider.of<AlbumProvider>(context, listen: false);
                        if(prov.current.lclId == album.lclId)
                          prov.current = album;

                        setState(() {});
                      },
                    )
                )
            ),

          if(album is OwnAlbum)
            SimpleButton.from(
              context: context,
              icon: MdiIcons.trashCanOutline,
              onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć $album_'),
              onLongPress: (){
                AlbumProvider prov = AlbumProvider.of(context);

                int lastPage = album.lastOpenIndex;
                album.deleteLastOpenIndex();

                (album as OwnAlbum).delete();
                int index = prov.allOwn!.indexOf((album as OwnAlbum));
                prov.removeFromAll((album as OwnAlbum));

                if(prov.current == album)
                  prov.current = OmegaAlbum();

                FloatingButtonProvider.notify_(context);

                AppScaffold.showMessage(
                    context,
                    'Usunięto',
                    buttonText: 'Cofnij',
                    onButtonPressed: () async {
                      (album as OwnAlbum).save();
                      prov.insertToAll(index, (album as OwnAlbum));
                      await BaseAlbum.setLastPageForAlbum(album, lastPage);
                    }
                );
              },
            ),

        ],
      ),
    ),

  );

}
