import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_selector.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SprawBookmarkWidget extends StatelessWidget{

  final Spraw spraw;
  final Color color;
  final void Function(bool saved) onSavedChaned;

  const SprawBookmarkWidget(this.spraw, {this.color, this.onSavedChaned});

  @override
  Widget build(BuildContext context) {

    return AppButton(
        icon: Icon(
          spraw.savedInOmega?
          MdiIcons.bookmark:
          MdiIcons.bookmarkOutline,
          color:
          color??
              (spraw.savedInOmega?
              iconEnab_(context):
              iconDisab_(context)),
        ),
        onLongPress: ()async{
          await openSprawFolderSelector(context, spraw.uniqName);
          onSavedChaned?.call(spraw.savedInOmega);
        },
        onTap: (){
          String uid = spraw.uniqName;

          SprawFolder omegaFolder = SprawFolder.omega;
          if(omegaFolder.sprawUIDs.contains(uid)) {
            omegaFolder.remove(uid);
            showAppToast(context, text: 'Usunięto z zapisanych');
          }else {
            omegaFolder.add(uid);
            showAppToast(context, text: 'Dodano do zapisanych');
          }
          onSavedChaned?.call(spraw.savedInOmega);
        }
    );

  }

}

class LevelWidget extends StatelessWidget{

  final Spraw spraw;
  final double size;
  const LevelWidget(this.spraw, {this.size: _STAR_SIZE});

  static const double _STAR_SIZE = 24.0;

  @override
  Widget build(BuildContext context) {

    if(spraw.level=='1')
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(MdiIcons.star, size: size, color: Colors.yellow)]
      );
    if(spraw.level=='2')
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(MdiIcons.star, size: size, color: Colors.amberAccent),
            Icon(MdiIcons.star, size: size, color: Colors.amberAccent),
          ]
      );
    if(spraw.level=='3')
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(MdiIcons.star, size: size, color: Colors.amber),
            Icon(MdiIcons.star, size: size, color: Colors.amber),
            Icon(MdiIcons.star, size: size, color: Colors.amber),
          ]
      );
    if(spraw.level=='4')
      return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(MdiIcons.star, size: size, color: Colors.orangeAccent),
            Icon(MdiIcons.star, size: size, color: Colors.orangeAccent),
            Icon(MdiIcons.star, size: size, color: Colors.orangeAccent),
            Icon(MdiIcons.star, size: size, color: Colors.orangeAccent),
          ]
      );

    return Row(
        mainAxisSize: MainAxisSize.min,
        children: [Icon(MdiIcons.heart, size: size, color: Colors.red)]
    );
  }

}
