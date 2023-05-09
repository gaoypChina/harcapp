import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/model/trop.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/development/tropy/trop_widget.dart';


class TropPage extends StatelessWidget{

  final Trop _trop;

  Trop get trop => _trop;

  const TropPage(
      this._trop,
      { super.key
      });

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: TropWidget(trop)
  );

}