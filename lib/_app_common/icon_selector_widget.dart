import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common_icon_data.dart';

Future<String?> selectCommonIcon(BuildContext context, {String? initIconKey}) async {

  String? selected;

  await openDialog(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      child: Material(
        color: background_(context),
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: Column(
          children: [

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: IconSelectorWidget(
                  initIconKey: initIconKey,
                  onSelected: (value) => selected = value,
                ),
              ),
            ),

            Row(
              children: [
                Expanded(child: SimpleButton.from(
                  context: context,
                  margin: EdgeInsets.zero,
                  icon: MdiIcons.arrowLeft,
                  text: 'Wróć',
                  onTap: (){
                    selected = null;
                    Navigator.pop(context);
                  }
                )),
                Expanded(child: SimpleButton.from(
                  context: context,
                  margin: EdgeInsets.zero,
                  icon: MdiIcons.check,
                  iconLeading: false,
                  text: 'Wybierz',
                  onTap: (){
                    Navigator.pop(context);
                  }
                ))
              ],
            )

          ],
        )
      ),
    )
  );

  return selected;

}

class IconSelectorWidget extends StatefulWidget{

  final String? initIconKey;
  final void Function(String iconKey)? onSelected;
  
  const IconSelectorWidget({this.initIconKey, this.onSelected, super.key});
  
  @override
  State<StatefulWidget> createState() => IconSelectorWidgetState();

}

class _Title extends StatelessWidget{

  final String title;
  const _Title(this.title);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: Dimen.ICON_MARG, top: Dimen.ICON_MARG, bottom: Dimen.ICON_MARG),
      child: Text(title, style: AppTextStyle(fontWeight: weight.halfBold, color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG))
  );

}

class IconSelectorWidgetState extends State<IconSelectorWidget>{

  void Function(String iconKey)? get onSelected => widget.onSelected;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _Provider(widget.initIconKey??CommonIconData.defIconKey),
      builder: (context, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          const _Title('Książki'),
          _IconSetWidget(CommonIconData.books, onTap: onSelected),

          const _Title('Ogień'),
          _IconSetWidget(CommonIconData.fire, onTap: onSelected),

          const _Title('Pisanie'),
          _IconSetWidget(CommonIconData.writing, onTap: onSelected),

          const _Title('Dom'),
          _IconSetWidget(CommonIconData.home, onTap: onSelected),

          const _Title('Symbole'),
          _IconSetWidget(CommonIconData.symbols, onTap: onSelected),

          const _Title('Muzyka'),
          _IconSetWidget(CommonIconData.music, onTap: onSelected),

          const _Title('Rośliny'),
          _IconSetWidget(CommonIconData.plants, onTap: onSelected),

          const _Title('Zwierzęta'),
          _IconSetWidget(CommonIconData.animals, onTap: onSelected),

          const _Title('Sport'),
          _IconSetWidget(CommonIconData.sport, onTap: onSelected),

          const _Title('Jedzenie'),
          _IconSetWidget(CommonIconData.food, onTap: onSelected),

          const _Title('Maski'),
          _IconSetWidget(CommonIconData.masks, onTap: onSelected),

          const _Title('Morze'),
          _IconSetWidget(CommonIconData.sea, onTap: onSelected),

          const _Title('Narzędzia'),
          _IconSetWidget(CommonIconData.tools, onTap: onSelected),

          const _Title('Pojazdy'),
          _IconSetWidget(CommonIconData.cars, onTap: onSelected),

          const _Title('Pogoda'),
          _IconSetWidget(CommonIconData.weather, onTap: onSelected),

          const _Title('Inne'),
          _IconSetWidget(CommonIconData.other, onTap: onSelected),

        ],
      ),
    );
  }

}


class _IconSetWidget extends StatelessWidget{

  final Map<String, IconData> icons;

  final void Function(String)? onTap;

  const _IconSetWidget(this.icons, {this.onTap});

  @override
  Widget build(BuildContext context) => GridView.count(
      crossAxisCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      clipBehavior: Clip.none,
      children: icons.keys.map(
              (data) => _IconOption(
              data,
              onTap: (value){
                Provider.of<_Provider>(context, listen: false).selIconKey = value;
                onTap?.call(value);
              }
          )
      ).toList()
  );

}

class _IconOption extends StatelessWidget{

  final String iconKey;
  final Function(String mapKey)? onTap;

  const _IconOption(this.iconKey, {this.onTap});

  static const double _ICON_SIZE = 32.0;

  static const double _BUTTON_SIZE = 60.0;

  @override
  Widget build(BuildContext context) => Consumer<_Provider>(
      builder: (context, prov, child){

        bool selected = iconKey == prov.selIconKey;

        return Center(
          child: SizedBox(
            width: _BUTTON_SIZE,
            height: _BUTTON_SIZE,
            child: SimpleButton(
                onTap: (){
                  Provider.of<_Provider>(context, listen: false).selIconKey = iconKey;
                  onTap?.call(iconKey);
                },
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                elevation: selected?6:0,
                radius: 100,
                child: Center(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutQuart,
                      width: _BUTTON_SIZE,
                      height: _BUTTON_SIZE,
                      decoration: BoxDecoration(
                          color: background_(context),
                          shape: BoxShape.circle
                      ),
                      child: Icon(CommonIconData.get(iconKey), size: _ICON_SIZE, color: iconEnab_(context).withOpacity(selected?1:.4)),
                    )
                )
            ),
          ),
        );
      }
  );

}

class _Provider extends ChangeNotifier{

  String _selIconKey;

  _Provider(this._selIconKey);

  String get selIconKey => _selIconKey;
  set selIconKey(String value){
    _selIconKey = value;
    notifyListeners();
  }

  void notify() => notifyListeners();

}