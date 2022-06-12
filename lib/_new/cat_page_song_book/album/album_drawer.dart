import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/providers.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'album_page.dart';
import 'album_widget_small.dart';
import 'new_album/new_album_button.dart';
import 'new_album/new_album_page.dart';

class AlbumDrawer extends StatefulWidget{

  final void Function(Album album)? onSelected;
  final void Function(Album album)? onNewCreated;

  const AlbumDrawer({this.onSelected, this.onNewCreated, super.key});

  @override
  State createState() => AlbumDrawerState();

}

class AlbumDrawerState extends State<AlbumDrawer>{

  void Function(Album album)? get onSelected => widget.onSelected;
  void Function(Album album)? get onNewCreated => widget.onNewCreated;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [

                SliverList(delegate: SliverChildListDelegate([

                  const SizedBox(height: 6.0),

                  TitleShortcutRowWidget(
                    title: Albumy_,
                    textAlign: TextAlign.start,
                    titleColor: iconEnab_(context),
                    onOpen: (){
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

                  const SizedBox(height: 6.0),

                ])),

                Consumer<AlbumProvider>(
                  builder: (context, prov, child) => SliverPadding(
                    padding: const EdgeInsets.all(Dimen.ICON_MARG),
                    sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                          (context, index) => AlbumWidgetSmall(
                          prov.all[index],
                          iconColor: Theme.of(context).drawerTheme.backgroundColor,
                          onTap: () {
                            prov.current = prov.all[index];
                            onSelected?.call(prov.all[index]);
                            Navigator.pop(context);
                          },
                          onLongPress: prov.all[index].isOmega?null:() => pushPage(
                              context,
                              builder: (context) => NewAlbumPage(
                                initAlbum: prov.all[index],
                                onSaved: (album){

                                  AlbumProvider prov = Provider.of<AlbumProvider>(context, listen: false);
                                  if(prov.current.fileName == album.fileName)
                                    prov.current = album;

                                  Navigator.pop(context);
                                  setState(() {});
                                },
                              )
                          ),
                      ),
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: Dimen.ICON_MARG),
                      count: prov.all.length,
                    )),
                  ),
                ),

                SliverList(delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2*Dimen.ICON_MARG,
                      left: Dimen.ICON_MARG,
                      right: Dimen.ICON_MARG
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