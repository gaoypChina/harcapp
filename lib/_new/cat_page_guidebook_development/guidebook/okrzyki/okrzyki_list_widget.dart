import 'package:flutter/material.dart';
import 'package:harcapp_core/dimen.dart';

import '_main.dart';
import 'okrzyk.dart';
import 'okrzyk_widget.dart';

class OkrzykiListWidget extends StatefulWidget{

  final OkrzykiFragmentState parentState;
  final List<Okrzyk> okrzyki;

  const OkrzykiListWidget(this.parentState, this.okrzyki, {super.key});

  @override
  State<StatefulWidget> createState() => OkrzykiListWidgetState();
}

class OkrzykiListWidgetState extends State<OkrzykiListWidget> with AutomaticKeepAliveClientMixin<OkrzykiListWidget>{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
        padding: const EdgeInsets.all(Dimen.SIDE_MARG),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => OkrzykWidget(widget.okrzyki[index]),
        itemCount: widget.okrzyki.length,
        separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
    );
  }
}

