import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/details/part_settings.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_new/cat_page_guide_book/las/search_page.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';
import 'data.dart';

class LasFragment extends StatefulWidget{

  @override
  State createState() => LasFragmentState();

}

class LasFragmentState extends State<LasFragment> with TickerProviderStateMixin{

  static int currentPage;
  static ValueNotifier<double> _notifier;

  TabController controller;

  @override
  void initState() {
    _notifier = ValueNotifier(0);

    controller = TabController(vsync: this, length: items.length);
    controller.animation.addListener(() => _notifier.value = controller.index + controller.offset);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
        body: DefaultTabController(
          length: items.length,
          child: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: background_(context),
                title: Text('Las'),
                centerTitle: true,
                floating: true,
                pinned: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(MdiIcons.magnify),
                    onPressed: (){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rippleRightDown,
                              child: SearchPage(
                                onItemTap: (index){
                                  controller.animateTo(index);
                                  Navigator.pop(context);
                                },
                              )
                          )
                      );
                    },
                  ),
                ],
                bottom: TabBar(
                  physics: BouncingScrollPhysics(),
                  controller: controller,
                  tabs: items.map((item) => Tab(text: item.name)).toList(),
                  isScrollable: true,
                ),
              ),
            ],

            body: TabBarView(
              physics: BouncingScrollPhysics(),
              controller: controller,
              children: items.map((item) => Item(
                items.indexOf(item),
                item,
                _notifier,
              )).toList(),

            ),

          ),
        )
    );

  }

}

class Item extends StatelessWidget{

  final int index;
  final ItemData data;
  final ValueNotifier<double> notifier;

  Item(this.index, this.data, this.notifier);

  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[

        SizedBox(height: Dimen.SIDE_MARG),

        Text(
          data.name,
          style: AppTextStyle(
              fontWeight: weight.bold,
              fontSize: 24.0,
          ), textAlign: TextAlign.center
        ),

        AppCard(
          onTap: data.background.author==null?null:() => showAppToast(context, text: data.background.author),
          radius: AppCard.BIG_RADIUS,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.all(Dimen.SIDE_MARG),
          elevation: AppCard.bigElevation,
          child: Container(
            height: CARD_HEIGHT,
            child: AnimatedBuilder(
              animation: notifier,
              builder: (context, child) =>
                  OverflowBox(
                      alignment: Alignment.center,
                      child: Transform.translate(
                          offset: Offset(MediaQuery.of(context).size.width*(notifier.value - index)/6, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/leaf_bg/${data.background.path}.webp'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                      )
                  ),
            ),
          ),
        ),

        if(data.background_kora!=null)
          AppCard(
            onTap: data.background_kora.author==null?null:() => showAppToast(context, text: data.background_kora.author),
            radius: AppCard.BIG_RADIUS,
            padding: EdgeInsets.zero,
              margin: EdgeInsets.only(
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG,
                bottom: Dimen.SIDE_MARG
              ),
              elevation: AppCard.bigElevation,
            child: Container(
              height: CARD_HEIGHT,
              child: AnimatedBuilder(
                animation: notifier,
                builder: (context, child) =>
                    OverflowBox(
                        maxWidth: MediaQuery.of(context).size.width*1.2,
                        alignment: Alignment.center,
                        child: Transform.translate(
                            offset: Offset(MediaQuery.of(context).size.width*(notifier.value - index)/6, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/leaf_kora/${data.background_kora.path}.webp'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                        )
                    ),
              ),
            )
          ),

        TagWidget(data),

        Padding(
          padding: EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              if(data.hasParams)
                TitleShortcutRowWidget(title: 'Właściwości drewna', textAlign: TextAlign.start, titleColor: hintEnab_(context)),

              if(data.hasParams)
                FirePropertyWidget(data),

              if(data.hasParams)
                SizedBox(height: Dimen.SIDE_MARG),

              TitleShortcutRowWidget(title: 'Opis', textAlign: TextAlign.start, titleColor: hintEnab_(context)),

              SizedBox(height: 10.0),
              Text(data.description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, height: 1.1), textAlign: TextAlign.justify,),
              SizedBox(height: Dimen.DEF_MARG),
              Text(data.desc_source!=null?'Źródło: ${data.desc_source}':'', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_TINY, color: AppColors.text_hint_enab), textAlign: TextAlign.end,),

              Container(
                height: 84 + 2*Dimen.DEF_MARG,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, idx) => SimpleButton(
                    onTap: () => openDialog(
                            context: context,
                            builder: (context) => AppCard(
                                padding: EdgeInsets.zero,
                                margin: AppCard.normMargin,
                                color: Settings.isDark?Color.fromARGB(255, 30, 30, 30):Colors.amber[50],
                                child: Column(
                                  children: [
                                    AppBar(
                                      backgroundColor: Colors.transparent,
                                      elevation: 0.0,
                                      title: Text(data.name),
                                      centerTitle: true,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: AppCard.defPadding,
                                        child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                              top: 0,
                                              bottom: 0,
                                              left: 0,
                                              right: 0,
                                              child: Hero(
                                                tag: data.graphics[idx].path,
                                                child: Image.asset('assets/images/leaf/${data.graphics[idx].path}.webp', fit: BoxFit.contain),
                                              ),
                                            ),

                                            Positioned(
                                              bottom: Dimen.DEF_MARG,
                                              right: Dimen.DEF_MARG,
                                              child: AppText(
                                                data.graphics[idx].author,
                                                size: Dimen.TEXT_SIZE_SMALL,
                                                color: hintEnab_(context),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            )
                        ),

                    child: Hero(
                      tag: data.graphics[idx].path,
                      child: Image.asset(
                          'assets/images/leaf/${data.graphics[idx].path}.webp',
                          fit: BoxFit.contain,
                          width: 84, height: 84,
                          filterQuality: FilterQuality.none
                      ),
                    )
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: data.graphics.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, idx) => SizedBox(width: 3*Dimen.DEF_MARG),
                ),
              ),

            ],
          ),
        )
      ],
    );

  }

}
