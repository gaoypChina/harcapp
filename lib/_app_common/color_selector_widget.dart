import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';

import 'common_color_data.dart';

class ColorSelectorWidget extends StatefulWidget{

  final String initColorKey;
  final void Function(String colorKey) onSelected;
  
  const ColorSelectorWidget({this.initColorKey, this.onSelected, Key key}): super(key: key);
  
  @override
  State<StatefulWidget> createState() => ColorSelectorWidgetState();

}

class ColorSelectorWidgetState extends State<ColorSelectorWidget>{

  void Function(String iconKey) get onSelected => widget.onSelected;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => _Provider(widget.initColorKey??CommonColorData.DEF_COLORS_KEY),
        builder: (context, child) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            //TitleShortcutRowWidget(title: 'Kolor', textAlign: TextAlign.start),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ColorDataWidget('chocolate', onTap: onSelected),
                ColorDataWidget('raspberry', onTap: onSelected),
                ColorDataWidget('dawn', onTap: onSelected),
                ColorDataWidget('rosegold', onTap: onSelected),
                ColorDataWidget('gold', onTap: onSelected),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ColorDataWidget('mint', onTap: onSelected),
                ColorDataWidget('green', onTap: onSelected),
                ColorDataWidget('turquoise', onTap: onSelected),
                ColorDataWidget('deepblue', onTap: onSelected),
                ColorDataWidget('blueberry', onTap: onSelected),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ColorDataWidget('darkorange', onTap: onSelected),
                ColorDataWidget('darkgreen', onTap: onSelected),
                ColorDataWidget('darkblue', onTap: onSelected),
                ColorDataWidget('darkpurple', onTap: onSelected),
                ColorDataWidget('darkbrown', onTap: onSelected),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ColorDataWidget('blood', onTap: onSelected),
                ColorDataWidget('deepforest', onTap: onSelected),
                ColorDataWidget('navy', onTap: onSelected),
                ColorDataWidget('blackberry', onTap: onSelected),
                ColorDataWidget('blackwood', onTap: onSelected),
              ],
            ),
          ],
        ),

    );
  }

}

class ColorDataWidget extends StatelessWidget{

  final String colorsKey;
  final Function(String colorsKey) onTap;

  const ColorDataWidget(this.colorsKey, {this.onTap, Key key}): super(key: key);

  static const double BUTTON_SIZE = 60.0;
  static const double _BUTTON_SIZE_SMALL = 48.0;

  static const double _MARGIN = Dimen.FLOATING_BUTTON_MARG;

  @override
  Widget build(BuildContext context) {

    return Consumer<_Provider>(
        builder: (context, prov, child){

          bool selected = colorsKey == prov.selColorsKey;

          return Padding(
            padding: const EdgeInsets.only(bottom: _MARGIN),
            child: SizedBox(
              width: BUTTON_SIZE,
              height: BUTTON_SIZE,
              child: SimpleButton(
                  onTap: onTap == null?null:(){
                    Provider.of<_Provider>(context, listen: false).selColorsKey = colorsKey;
                    onTap?.call(colorsKey);
                  },
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  elevation: selected?6:0,
                  //color: Colors.white,
                  radius: 100,
                  child: Center(
                      child: GradientWidget(
                        shape: BoxShape.circle,
                        colorStart: CommonColorData.ALL[colorsKey].colorStart.withOpacity(selected?1:.5),
                        colorEnd: CommonColorData.ALL[colorsKey].colorEnd.withOpacity(selected?1:.5),
                        width: BUTTON_SIZE,//selected?_BUTTON_SIZE_SMALL:BUTTON_SIZE,
                        height: BUTTON_SIZE,//selected?_BUTTON_SIZE_SMALL:BUTTON_SIZE,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutQuart,
                      ))
              ),
            ),
          );
        }
    );

  }

}

class _Provider extends ChangeNotifier{

  String _selColorsKey;

  _Provider(this._selColorsKey);

  String get selColorsKey => _selColorsKey;
  set selColorsKey(String value){
    _selColorsKey = value;
    notifyListeners();
  }

  void notify() => notifyListeners();

}