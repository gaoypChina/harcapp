import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';

class RadioButtonGroup<T> extends StatefulWidget{

  final List<T> buttonIDs;
  final List<String> buttonNames;
  final List<IconData>? buttonIcons;
  final T? initID;
  final Axis orientation;
  final Function(T id)? onChanged;

  const RadioButtonGroup({super.key, 
    required this.buttonIDs,
    required this.buttonNames,
    this.buttonIcons,
    this.initID,
    this.orientation = Axis.vertical,
    this.onChanged
  });

  @override
  State<StatefulWidget> createState() => _RadioButtonGroupState<T>();

}

class _RadioButtonGroupState<T> extends State<RadioButtonGroup<T?>>{

  T? currID;

  @override
  void initState() {
    currID = widget.initID;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> buttons = [];

    for(int i=0; i<widget.buttonIDs.length; i++){
      buttons.add(
          _RadioButton<T?>(
              key: ValueKey(widget.buttonIDs[i]),
              buttonID: widget.buttonIDs[i],
              buttonName: widget.buttonNames[i],
              icon: widget.buttonIcons==null?null:widget.buttonIcons![i],
              currID: currID,
              onTap: (T? id){
                setState(() => currID = id);
                if(widget.onChanged != null)
                  widget.onChanged!(id);
              }
          )
      );
    }

    if(widget.orientation == Axis.horizontal)
      return Row(children: buttons);
    else
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buttons
      );

  }

}

class _RadioButton<T> extends StatelessWidget{

  final T buttonID;
  final IconData? icon;
  final String buttonName;
  final T currID;
  final Function(T currID) onTap;

  const _RadioButton({
    required this.buttonID,
    this.icon,
    required this.buttonName,
    required this.currID,
    required this.onTap,
    Key? key,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isSelected = buttonID == currID;

    return SimpleButton(
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      radius: 100,
      onTap: () => onTap(buttonID),
      key: key,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          if(icon != null)
            Icon(icon, color: isSelected?accent_(context):textEnab_(context)),
          if(icon != null)
            const SizedBox(width: Dimen.ICON_MARG),

          Text(
            buttonName,
            style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_BIG,
              fontWeight: isSelected?weight.halfBold:weight.normal,
              color: isSelected?accent_(context):textEnab_(context),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}