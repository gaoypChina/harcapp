import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_harcthought/harc_forms/harc_form.dart';
import 'package:harcapp/_new/cat_page_harcthought/harc_forms/harc_form_thumbnail_widget.dart';
import 'package:harcapp_core/dimen.dart';

import '../_main.dart';

class HarcFormsPage extends StatefulWidget{

  final List<HarcForm> allHarcForms;

  const HarcFormsPage(this.allHarcForms, {super.key});
  
  @override
  State<StatefulWidget> createState() => HarcFormsPageState();

}

class HarcFormsPageState extends State<HarcFormsPage>{

  List<HarcForm> get allHarcForms => widget.allHarcForms;
  
  late List<HarcForm> searchedForms;

  @override
  void initState() {
    searchedForms = [];
    searchedForms.addAll(allHarcForms);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [

        const SliverAppBar(
          title: Text('Formy harcerskie'),
          centerTitle: true,
          floating: true,
          elevation: 0,
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
              (context, index) => SizedBox(
                height: FormsScrollView.height,
                child: FormThumbnailWidget(searchedForms[index]),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
              count: searchedForms.length,
          ))
        ),

      ],
    ),
  );

}