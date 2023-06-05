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

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'harc_form.dart';

class HarcFormWidget extends StatefulWidget{

  final HarcForm form;

  const HarcFormWidget(this.form, {super.key});

  @override
  State<StatefulWidget> createState() => HarcFormWidgetState();

}

class HarcFormWidgetState extends State<HarcFormWidget> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.myslHarcFormy;

  HarcForm get form => widget.form;

  String? text;

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
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          title: Text(form.title),
          centerTitle: true,
          stretch: true,
          actions: [

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimen.ICON_MARG),
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
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            _TagWrapWidget(form),

            const SizedBox(height: 2*Dimen.SIDE_MARG),

            if(text != null)
              Text(
                text!,
                style: AppTextStyle(
                  fontSize: Dimen.TEXT_SIZE_BIG,
                ),
                textAlign: TextAlign.justify,
              ),

            const SizedBox(height: 2*Dimen.SIDE_MARG),

            MetoGridWidget(form),

            const SizedBox(height: Dimen.SIDE_MARG),


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
      const SizedBox(width: Dimen.ICON_MARG),

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
        children.add(const SizedBox(width: Dimen.ICON_MARG));
    }
    
    return Wrap(spacing: Dimen.defMarg, runSpacing: Dimen.defMarg, children: children);
    
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
              borderRadius: BorderRadius.circular(AppCard.defRadius)
          ),
          child: Row(
            children: [

              Image.asset(
                'assets/images/meto/$iconFilename.webp',
                width: 42,
                height: 42,
              ),

              const SizedBox(width: Dimen.ICON_MARG),

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

                      const SizedBox(height: 3.0),

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
                padding: const EdgeInsets.all(Dimen.defMarg),
                child: Container(
                    decoration: BoxDecoration(
                        color: background_(context),
                        borderRadius: BorderRadius.circular(AppCard.defRadius)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Dimen.defMarg),
                      child: enabled?
                      const Icon(MdiIcons.check):
                      const Icon(MdiIcons.close),
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
  const MetoGridWidget(this.form, {super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [

      Row(
        children: [

          Expanded(child: _MetoTile('meto_z', 'Zuch', '7-9 lat', AppColors.metoZhpZ, form.meto.contains(metoZ))),
          const SizedBox(width: Dimen.ICON_MARG),
          Expanded(child: _MetoTile('meto_h', 'Harc', '10-12 lat', AppColors.metoZhpH, form.meto.contains(metoH))),

        ],
      ),

      const SizedBox(height: Dimen.ICON_MARG),

      Row(
        children: [

          Expanded(child: _MetoTile('meto_hs', 'HS', '13-15 lat', AppColors.metoZhpHS, form.meto.contains(metoHS))),
          const SizedBox(width: Dimen.ICON_MARG),
          Expanded(child: _MetoTile('meto_w', 'Wędro', '16-21 lat', AppColors.metoZhpW, form.meto.contains(metoW))),

        ],
      ),

    ],
  );

}