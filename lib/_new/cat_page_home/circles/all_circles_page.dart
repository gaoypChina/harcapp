import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_preview_grid.dart';
import 'package:harcapp/_new/cat_page_home/circles/start_widgets/circle_prompt.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/network.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../_main.dart';
import 'circle_editor/_main.dart';
import 'circle_loader.dart';
import 'circle_page.dart';
import 'circle_tile.dart';
import 'circles_widget.dart';
import 'model/circle.dart';
import 'new_circle_type.dart';

class AllCirclesPage extends StatefulWidget{

  final void Function(Circle)? onCircleTap;

  const AllCirclesPage({this.onCircleTap, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AllCirclesPageState();

}

class AllCirclesPageState extends State<AllCirclesPage>{

  void Function(Circle)? get onCircleTap => widget.onCircleTap;

  late RefreshController refreshController;

  late CircleLoaderListener _listener;

  @override
  void initState() {
    refreshController = RefreshController();

    _listener = CircleLoaderListener(
      onError: (message) async {
        refreshController.refreshCompleted();
        showAppToast(context, text: 'Coś poszło nie tak...');
        if(mounted) setState(() {});
      },
      onCirclesLoaded: (List<Circle> comps){
        Provider.of<CircleProvider>(context, listen: false).notify();
        Provider.of<CircleListProvider>(context, listen: false).notify();

        refreshController.refreshCompleted();
        if(mounted) setState(() {});
      },
    );

    circleLoader.addListener(_listener);

    super.initState();
  }

  @override
  void dispose() {
    refreshController.dispose();
    circleLoader.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SmartRefresher(
      enablePullDown: true,
      physics: const BouncingScrollPhysics(),
      header: MaterialClassicHeader(backgroundColor: cardEnab_(context), color: accent_(context)),
      controller: refreshController,
      onRefresh: () async {

        if(!await isNetworkAvailable()){
          showAppToast(context, text: 'Brak dostępu do Internetu');
          refreshController.refreshCompleted();
          return;
        }

        circleLoader.run();
      },
      child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              title: Text('Kręgi'),
              centerTitle: true,
              floating: true,
            ),
            SliverList(delegate: SliverChildListDelegate([
              CirclesWidget(circleWidgetBuilder: (_) => _CompListWidget(
                onCircleTap: onCircleTap,
              ))
            ]))
          ]
      ));
}

class _CompListWidget extends StatefulWidget{

  final void Function(Circle)? onCircleTap;

  const _CompListWidget({this.onCircleTap, Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _CompListWidgetState();

}

class _CompListWidgetState extends State<_CompListWidget>{

  void Function(Circle)? get onCircleTap => widget.onCircleTap;

  String? searchPhrase;
  List<Circle>? searchedCircles;

  @override
  void initState() {
    searchedCircles = Circle.all;

    super.initState();
  }

  void selectCircles(String text){

    if(text.isEmpty) {
      searchedCircles = Circle.all;
      return;
    }

    List<Circle> circles = [];
    for(Circle circle in Circle.all!)
      if(remPolChars(circle.name!).contains(remPolChars(text)))
        circles.add(circle);

    searchedCircles = circles;
  }

  @override
  Widget build(BuildContext context) => Consumer<CircleListProvider>(
      builder: (context, prov, child) {

        List<Widget> widgets = [];

        if(Circle.all == null)
          return const CirclePrompt(
            text: 'Coś poszło nie tak',
            icon: MdiIcons.closeOutline,
            child: CirclePreviewGrid(),
          );

        else {

          if (Circle.all!.length > 3)
            widgets.add(SearchField(
                hint: 'Szukaj kręgów:',
                onChanged: (text) => setState(() => selectCircles(text))
            ));

          for (int i = 0; i < searchedCircles!.length; i++) {
            widgets.add(
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
                  child: CircleTile(
                    searchedCircles![i],
                    onTap: () => onCircleTap?.call(searchedCircles![i])
                  ),
                )
            );

            widgets.add(const SizedBox(height: Dimen.ICON_MARG));
          }
          if (Circle.all!.isEmpty)
            widgets.add(const CirclePrompt(child: CirclePreviewGrid()));
          else {
            widgets.add(const SizedBox(height: Dimen.ICON_MARG));
          }

          widgets.add(const Padding(
            padding: EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
            child: NewCircleButton(),
          ));
        }

        return Column(children: widgets);

      }
  );

}

class NewCircleButton extends StatelessWidget{

  const NewCircleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.BIG_RADIUS,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Builder(
        builder: (context){

          double height = 100;

          return SizedBox(
              height: height,
              child: Stack(
                fit: StackFit.expand,
                children: [

                  Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
                    color: hintEnab_(context),
                  ),

                  Positioned(
                    top: Dimen.SIDE_MARG,
                    left: Dimen.SIDE_MARG,
                    child: Icon(
                      MdiIcons.plus,
                      size: height - 2*Dimen.SIDE_MARG,
                      color: background_(context),
                    ),
                  ),
                  
                  Positioned(
                    bottom: -1.6*height,
                    right: -.5*height,
                    height: 2.3*height,
                    width: 2.3*height,
                    child: Material(
                        borderRadius: BorderRadius.circular(2*height),
                        clipBehavior: Clip.hardEdge,
                        color: background_(context)
                    ),
                  ),

                  Positioned(
                      bottom: Dimen.SIDE_MARG,
                      right: Dimen.SIDE_MARG,
                      child: Text(
                          'Nowy krąg',
                          style: AppTextStyle(
                            fontSize: Dimen.TEXT_SIZE_APPBAR,
                            fontWeight: weight.bold,
                            color: hintEnab_(context)
                          )
                      ),
                  )

                ],
              )
          );

        },
      ),
      onTap: () async {
        NewCircleType? type = await pickNewCircleType(context);
        if (type == null) return;

        if(type == NewCircleType.join)
          return;
        else
          pushPage(
            context,
            builder: (context) =>
                CircleEditorPage(
                  onSaved: (comp) async {
                    Circle.addToAll(context, comp);
                    Navigator.pop(context);
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => CirclePage(Circle.all!.last)));
                  },
                ),
          );
      }
  );

}