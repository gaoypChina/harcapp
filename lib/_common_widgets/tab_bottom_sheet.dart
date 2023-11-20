import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';

showTabBottomSheet({required BuildContext context, required WidgetBuilder builder, Color color = Colors.white, Widget Function(BuildContext, BottomSheetState)? sideBuilder}) {

  PrimitiveWrapper<bool> exceedsHeight = PrimitiveWrapper(true);
  BottomSheet bottomSheet = BottomSheet(builder: builder, exceedsHeight: exceedsHeight, color: color, sideBuilder: sideBuilder,);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => bottomSheet,
  );

}

class BottomSheet extends StatefulWidget{

  WidgetBuilder builder;
  late BottomSheetState _state;
  PrimitiveWrapper<bool> exceedsHeight;
  Color color;
  Widget Function(BuildContext, BottomSheetState)? sideBuilder;

  void setExceedsHeight(bool exceedsHeight){
    this.exceedsHeight.set(exceedsHeight);
    _state.notify();
  }

  BottomSheet({super.key, required this.builder, required this.exceedsHeight, this.color = Colors.white, this.sideBuilder});

  @override
  State<StatefulWidget> createState() {
    _state = BottomSheetState();
    return _state;
  }
}

class BottomSheetState extends State<BottomSheet>{

  void notify() => setState((){});

  late WidgetBuilder builder;
  Widget Function(BuildContext, BottomSheetState)? sideBuilder;

  @override
  void initState() {
    builder = widget.builder;
    sideBuilder = widget.sideBuilder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6.0),
            topRight: Radius.circular(6.0))),
        child: DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) =>
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if(sideBuilder != null) sideBuilder!(context, this),
                Expanded(child: SingleChildScrollView(controller: scrollController, child: builder(context)))
              ],
            ),
        )
    );
  }
}