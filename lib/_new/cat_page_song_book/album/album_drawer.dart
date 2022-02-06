import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/providers.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/providers.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_widgets/app_button.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'album_page.dart';
import 'album_widget_small.dart';
import 'album_widget.dart';
import 'new_album/new_album_button.dart';
import 'new_album/new_album_page.dart';

class AlbumDrawer extends StatefulWidget{

  final void Function(Album album) onSelected;
  final void Function(Album album) onNewCreated;

  const AlbumDrawer({this.onSelected, this.onNewCreated});

  @override
  State createState() => AlbumDrawerState();

}

class AlbumDrawerState extends State<AlbumDrawer>{

  void Function(Album album) get onSelected => widget.onSelected;
  void Function(Album album) get onNewCreated => widget.onNewCreated;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Expanded(
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [

                SliverList(delegate: SliverChildListDelegate([

                  SizedBox(height: 6.0),

                  TitleShortcutRowWidget(
                    title: Albumy_,
                    textAlign: TextAlign.start,
                    titleColor: iconEnab_(context),
                    onOpen: (context){
                      Navigator.pop(context);
                      pushPage(
                          context,
                          builder: (context) => AlbumPage(
                              onAlbumSelected: onSelected,
                              onNewCreated: onNewCreated
                          )
                      );
                    }
                  ),

                  SizedBox(height: 6.0),

                ])),

                Consumer<AlbumProvider>(
                  builder: (context, prov, child) => SliverPadding(
                    padding: EdgeInsets.all(Dimen.ICON_MARG),
                    sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                          (context, index) => AlbumWidgetSmall(
                          prov.all[index],
                          iconColor: Theme.of(context).drawerTheme.backgroundColor,
                          onTap: () {
                            prov.current = prov.all[index];
                            onSelected.call(prov.all[index]);
                            Navigator.pop(context);
                          }
                      ),
                      separatorBuilder: (BuildContext , int ) => SizedBox(height: Dimen.ICON_MARG),
                      count: prov.all.length,
                    )),
                  ),
                ),

                SliverList(delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2*Dimen.ICON_MARG,
                      left: Dimen.DEF_MARG,
                      right: Dimen.DEF_MARG
                    ),
                    child: NewAlbumButton(onNewCreated: onNewCreated),
                  )
                ]))

              ],
            )
        ),

        
      ],
    );

  }

}

class AlbumItem extends StatefulWidget{

  final AlbumDrawerState page;
  final Album album;

  AlbumItem(this.page, this.album):super(key: ValueKey(album.fileName));

  @override
  State<StatefulWidget> createState() => AlbumItemState();

}

class AlbumItemState extends State<AlbumItem>{

  static const double SHIFT = 4;
  static const double ELEVATION = 4;

  AlbumDrawerState get page => widget.page;
  Album get album => widget.album;

  @override
  Widget build(BuildContext context) {

    return AlbumWidget(
      album,
      onTap: (){
        if(page.onSelected!=null) page.onSelected(album);
        Provider.of<AlbumProvider>(context, listen: false).current = album;
        Provider.of<FloatingButtonProvider>(context, listen: false).notify();
        Navigator.pop(context);
      },
      bottom: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[

          IconButton(
            icon: Icon(MdiIcons.pencilOutline, color: album.isOmega || album.isConfid()?iconDisab_(context):iconEnab_(context)),
            onPressed: album.isOmega || album.isConfid()?null:() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewAlbumPage(
                      initAlbum: album,
                      onSaved: (album){

                        AlbumProvider prov = Provider.of<AlbumProvider>(context, listen: false);
                        if(prov.current.fileName == album.fileName)
                          prov.current = album;
                        },
                    )
                )
            ),
          ),

          AppButton(
            icon: Icon(MdiIcons.trashCanOutline, color: album.isOmega || album.isConfid()?iconDisab_(context):iconEnab_(context)),
            onTap: album.isOmega || album.isConfid()?null:() => showAppToast(context, text: 'Przytrzymaj, by usunąć $album_'),
            onLongPress: album.isOmega || album.isConfid()?null:(){
              AlbumProvider prov = Provider.of<AlbumProvider>(context, listen: false);

              album.delete();
              int index = prov.allOwn.indexOf(album);
              prov.removeFromAll(album);

              if(prov.current == album)
                prov.current = Album.omega;

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
