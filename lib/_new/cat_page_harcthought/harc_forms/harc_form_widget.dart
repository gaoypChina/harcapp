import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'harc_form.dart';

class HarcFormWidget extends StatefulWidget{

  final HarcForm form;

  HarcFormWidget(this.form);

  @override
  State<StatefulWidget> createState() => HarcFormWidgetState();

}

class HarcFormWidgetState extends State<HarcFormWidget>{

  HarcForm get form => widget.form;

  String text;

  void run() async {
    text = await readStringFromAssets('assets/forms/${form.filename}');
    setState((){});
  }

  @override
  void initState() {
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: Text(form.title),
          centerTitle: true,
          stretch: true,
          actions: [

            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimen.ICON_MARG),
                child: GradientIcon(
                  form.icon,
                  colorStart: form.colorStart,
                  colorEnd: form.colorEnd,
                  size: 32,
                ),
              )
            )

          ],
        ),

        SliverPadding(
          padding: EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            _TagWrapWidget(form),

            SizedBox(height: 2*Dimen.SIDE_MARG),

            if(text != null)
              Text(
                text,
                style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                ),
                textAlign: TextAlign.justify,
              ),

            SizedBox(height: 2*Dimen.SIDE_MARG),

            MetoGridWidget(form),

            SizedBox(height: Dimen.SIDE_MARG),


          ])),
        )
      ],
    ),
  );

}

class _TagWidget extends StatelessWidget{

  final HarcFormTag tag;

  const _TagWidget(this.tag);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [

      Icon(tag.icon),
      SizedBox(width: Dimen.ICON_MARG),

      Text(
        tag.text,
        style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_NORMAL),
        textAlign: TextAlign.center,
      ),
    ],
  );

}

class _TagWrapWidget extends StatelessWidget{
  
  final HarcForm form;
  
  const _TagWrapWidget(this.form);
  
  @override
  Widget build(BuildContext context){

    List<Widget> children = [];
    
    for(int i=0; i<form.tags.length; i++){
      children.add(_TagWidget(form.tags[i]));

      if(i<form.tags.length-1)
        children.add(SizedBox(width: Dimen.ICON_MARG));
    }
    
    return Wrap(children: children, spacing: Dimen.DEF_MARG, runSpacing: Dimen.DEF_MARG);
    
  }
  
}

class _MetoTile extends StatelessWidget{

  final String iconFilename;
  final String text;
  final String age;
  final Color color;
  final bool enabled;

  const _MetoTile(this.iconFilename, this.text, this.age, this.color, this.enabled);

  @override
  Widget build(BuildContext context) => Opacity(
      opacity: 1,
      child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(AppCard.DEF_RADIUS)
          ),
          child: Row(
            children: [

              Image.asset(
                'assets/images/meto/$iconFilename.webp',
                width: 42,
                height: 42,
              ),

              SizedBox(width: Dimen.ICON_MARG),

              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        text,
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_BIG,
                            fontWeight: weight.bold,
                            color: background_(context)
                        ),
                      ),

                      SizedBox(height: 3.0),

                      Text(
                        age,
                        style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_NORMAL,
                            fontWeight: weight.halfBold,
                            color: background_(context)
                        ),
                      )

                    ],
                  )
              ),

              Padding(
                padding: EdgeInsets.all(Dimen.DEF_MARG),
                child: Container(
                    decoration: BoxDecoration(
                        color: background_(context),
                        borderRadius: BorderRadius.circular(AppCard.DEF_RADIUS)
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(Dimen.DEF_MARG),
                      child: enabled?
                      Icon(MdiIcons.check):
                      Icon(MdiIcons.close),
                    )
                ),
              )
            ],
          ),
      )
  );

}

class MetoGridWidget extends StatelessWidget{

  final HarcForm form;
  const MetoGridWidget(this.form);

  @override
  Widget build(BuildContext context) => Column(
    children: [

      Row(
        children: [

          Expanded(child: _MetoTile('meto_z', 'Zuch', '7-9 lat', AppColors.meto_z, form.meto.contains(metoZ))),
          SizedBox(width: Dimen.ICON_MARG),
          Expanded(child: _MetoTile('meto_h', 'Harc', '10-12 lat', AppColors.meto_h, form.meto.contains(metoH))),

        ],
      ),

      SizedBox(height: Dimen.ICON_MARG),

      Row(
        children: [

          Expanded(child: _MetoTile('meto_hs', 'HS', '13-15 lat', AppColors.meto_hs, form.meto.contains(metoHS))),
          SizedBox(width: Dimen.ICON_MARG),
          Expanded(child: _MetoTile('meto_w', 'Wędro', '16-21 lat', AppColors.meto_w, form.meto.contains(metoW))),

        ],
      ),

    ],
  );

}