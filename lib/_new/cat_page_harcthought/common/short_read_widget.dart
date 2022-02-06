import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_harcthought/common/short_read.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/dimen.dart';

import '../gawedy/gaweda.dart';

class ShortReadWidget extends StatefulWidget{

  final ShortRead shortRead;

  ShortReadWidget(this.shortRead);

  @override
  State<StatefulWidget> createState() => ShortReadWidgetState();

}

class ShortReadWidgetState extends State<ShortReadWidget>{

  ShortRead get shortRead => widget.shortRead;

  bool playing;

  String text;

  @override
  void initState() {
    playing = false;

    ()async{
      text = await readStringFromAssets('assets/gawedy/${shortRead.fileName}');
      setState((){});
    }();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            centerTitle: true,
            pinned: true,
            stretch: true,
            backgroundColor: background_(context),
            expandedHeight: MediaQuery.of(context).size.width*600/1000,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(shortRead.title, style: AppTextStyle(fontWeight: weight.halfBold, color: iconEnab_(context))),
              centerTitle: true,
              background: Stack(
                children: [

                  Positioned.fill(
                      child: Hero(
                        tag: shortRead,
                        child: Image(
                          image: AssetImage('assets/images/gawedy/${shortRead.graphicalResource.path}'),
                          fit: BoxFit.cover,
                        ),
                      )
                  ),

                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 72.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            background_(context),
                            background_(context).withOpacity(0.7),
                            background_(context).withOpacity(0)
                          ], // red to yellow
                          tileMode: TileMode.repeated, // repeats the gradient over the canvas
                        ),
                      ),
                    ),
                  )

                ],
              ),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground
              ],
            ),
          ),

          if(text != null)
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.all(Dimen.ICON_SIZE),
                  child: Text(
                    text,
                    style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ]),
            )

        ],
      ),
    );
  }

}