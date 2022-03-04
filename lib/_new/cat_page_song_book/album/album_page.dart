import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/providers.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_widgets/app_button.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../app_bottom_navigator.dart';
import 'album_widget.dart';
import 'new_album/new_album_page.dart';

class AlbumPage extends StatefulWidget{

  final void Function(Album album) onAlbumSelected;
  final void Function(Album album) onNewCreated;
  const AlbumPage({this.onAlbumSelected, this.onNewCreated, Key key}): super(key: key);

  @override
  State<AlbumPage> createState() => AlbumPageState();

}

class AlbumPageState extends State<AlbumPage>{

  void Function(Album album) get onAlbumSelected => widget.onAlbumSelected;
  void Function(Album album) get onNewCreated => widget.onNewCreated;

  @override
  void initState() {
    AppBottomNavigatorProvider.addOnSelectedListener(onNavSelected);
    super.initState();
  }

  @override
  void dispose() {
    AppBottomNavigatorProvider.removeOnSelectedListener(onNavSelected);
    super.dispose();
  }

  void onNavSelected(int page) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
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
                    icon: const Icon(MdiIcons.bookmarkPlusOutline),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewAlbumPage(
                              onSaved: (album){
                                Provider.of<AlbumProvider>(context, listen: false).current = album;
                                onNewCreated?.call(album);
                              },
                            )
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
      ),
      bottomNavigationBar: const AppBottomNavigator(),
    );
  }

}

class _AlbumItem extends StatefulWidget{

  final Album album;
  final void Function(Album album) onAlbumSelected;

  _AlbumItem(this.album, {this.onAlbumSelected}):super(key: ValueKey(album.fileName));

  @override
  State<StatefulWidget> createState() => _AlbumItemState();

}

class _AlbumItemState extends State<_AlbumItem>{

  Album get album => widget.album;
  void Function(Album album) get onAlbumSelected => widget.onAlbumSelected;

  @override
  Widget build(BuildContext context) {

    return AlbumWidget(
      album,
      onTap: (){
        Provider.of<AlbumProvider>(context, listen: false).current = album;
        Provider.of<FloatingButtonProvider>(context, listen: false).notify();
        onAlbumSelected?.call(album);
        Navigator.pop(context);
      },
      trailing: album.isOmega || album.isConfid()?
      Padding(
        padding: const EdgeInsets.only(right: Dimen.ICON_MARG),
        child: Icon(MdiIcons.lockOutline, size: AlbumWidget.ICON_SIZE, color: iconDisab_(context)),
      ):
      null,
      bottom: album.isOmega || album.isConfid()?const SizedBox(height: Dimen.ICON_FOOTPRINT):Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          IconButton(
            icon: Icon(MdiIcons.pencilOutline, color: iconEnab_(context)),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewAlbumPage(
                      initAlbum: album,
                      onSaved: (album){

                        AlbumProvider prov = Provider.of<AlbumProvider>(context, listen: false);
                        if(prov.current.fileName == album.fileName)
                          prov.current = album;

                        setState(() {});
                      },
                    )
                )
            ),
          ),

          AppButton(
            icon: Icon(MdiIcons.trashCanOutline, color: iconEnab_(context)),
            onTap: () => showAppToast(context, text: 'Przytrzymaj, by usunąć $album_.'),
            onLongPress: (){
              AlbumProvider prov = Provider.of<AlbumProvider>(context, listen: false);

              album.delete();
              int index = prov.allOwn.indexOf(album);
              prov.removeFromAll(album);

              if(prov.current == album)
                prov.current = Album.omega;

              Provider.of<FloatingButtonProvider>(context, listen: false).notify();

              AppScaffold.showMessage(
                  context,
                  'Usunięto.',
                  buttonText: 'Cofnij',
                  onButtonPressed: (context){
                    album.save();
                    prov.insertToAll(index, album);
                  }
              );
            },
          ),

        ],
      ),

    );
  }

}
