import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:harcapp/_new/api/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_tile.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'open_trop_dialog.dart';
import 'trop_icon.dart';

class TropSharedPreviewTile extends StatefulWidget{

  final String tropKey;

  final double iconSize;
  // final Widget? trailing;
  final EdgeInsets padding;
  final bool withHero;

  const TropSharedPreviewTile({
    required this.tropKey,

    this.iconSize = TropIcon.tileSize,
    // this.trailing,
    this.padding = EdgeInsets.zero,
    this.withHero = true,
    super.key
  });

  @override
  State<StatefulWidget> createState() => TropSharedPreviewTileState();

}

class TropSharedPreviewTileState extends State<TropSharedPreviewTile>{

  Trop? trop;
  late bool loading;

  Future<void> loadTrop() async {
    setState(() => loading = true);
    await ApiTrop.getTrop(
        tropKey: widget.tropKey,
        onSuccess: (Trop trop){
          this.trop = trop;
          trop.saveShared();
        },
    );
    if(!mounted) return;
    setState(() => loading = false);
  }

  @override
  void initState() {
    trop = Trop.readSharedFromKey(widget.tropKey, log: false);
    loading = trop == null;
    if(trop == null) loadTrop();
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    if(loading)
      return SizedBox(
      height: TropIcon.tileSize + widget.padding.vertical,
      child: Row(
        children: [

          SpinKitChasingDots(
            color: iconEnab_(context),
            size: Dimen.ICON_MARG,
          ),

          const SizedBox(width: Dimen.ICON_MARG),

          Text(
            'Ładowanie tropu',
            style: AppTextStyle(),
          )

        ],
      ),
    );

    if(trop == null)
      return SizedBox(
        height: TropIcon.tileSize + widget.padding.vertical,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(width: Dimen.ICON_FOOTPRINT),

            Text(
              'Problem z ładowaniem tropu',
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold
              ),
            ),

            IconButton(
              icon: Icon(MdiIcons.refresh),
              onPressed: loadTrop,
            ),


          ],
        ),
      );

    return InkWell(
        onTap: () => loadOpenTropDialog(context, trop!.toPreviewData()),
        child: TropTile(
          name: trop!.name,
          category: trop!.category,
          zuchTropName: trop!.customIconTropName,
          completenessPercent: trop!.completenessPercent,
          iconSize: widget.iconSize,
          padding: widget.padding,
          withHero: widget.withHero,
        )
    );

  }

}