import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/floating_container.dart';
import 'package:harcapp/_common_widgets/search_field.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/_sprawnosci/spraw_grid_view.dart';
import 'package:harcapp_core/comm_classes/common.dart';

import 'models/spraw.dart';


class SprawGridPage extends StatefulWidget{

  final String title;
  final List<String> UIDs;
  final String mode;
  final IconData? icon;
  final Widget? emptyWidget;
  final List<Widget>? actions;

  const SprawGridPage({required this.title, required this.UIDs, required this.mode, required this.icon, this.emptyWidget, this.actions, super.key});

  @override
  State<StatefulWidget> createState() => SprawGridPageState();

}

class SprawGridPageState extends State<SprawGridPage>{

  String get title => widget.title;
  List<String> get UIDs => widget.UIDs;
  String get mode => widget.mode;
  IconData? get icon => widget.icon;
  List<Widget>? get actions => widget.actions;

  List<String>? selUIDs;

  @override
  void initState() {
    selUIDs = UIDs;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            backgroundColor: background_(context),
            floating: true,
            title: Text(title),
            centerTitle: true,
            actions: actions,
          ),

          FloatingContainer(
            builder: (context, _, __) => SearchField(
              hint: 'Szukaj sprawności',
              onChanged: (text){

                text = remPolChars(text);
                if(text.isEmpty){
                  setState(() => this.selUIDs = UIDs);
                  return;
                }

                List<String> selUIDs = [];

                for(String uid in UIDs){
                  Spraw spraw = Spraw.fromUID(uid)!;
                  if(remPolChars(spraw.title).contains(text))
                    selUIDs.add(uid);
                }

                setState(() => this.selUIDs = selUIDs);

              },
            ),
            height: SearchField.height,
            rebuild: true,
          ),

          SliverFillRemaining(
            hasScrollBody: false,
            child: SprawGridView(
              title: title,
              mode: mode,
              UIDs: selUIDs,
              icon: icon,
              emptyMessage: 'Pusto',
              showProgress: true,
            ),
          )

        ],
      )
  );

}