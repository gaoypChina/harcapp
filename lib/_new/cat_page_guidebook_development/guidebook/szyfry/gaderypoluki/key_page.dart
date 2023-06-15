import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/szyfry/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'common.dart';
import 'key_field.dart';
import 'keys.dart';

class KeyPage extends StatefulWidget{

  final Function(String key, bool isValid)? onKeyTap;
  final Function(String key, bool isValid)? onKeyChanged;

  const KeyPage({this.onKeyTap, this.onKeyChanged, super.key});

  @override
  State<StatefulWidget> createState() => KeyPageState();

}

class KeyPageState extends State<KeyPage>{

  Function(String key, bool isValid)? get onKeyTap => widget.onKeyTap;
  Function(String key, bool isValid)? get onKeyChanged => widget.onKeyChanged;

  FocusNode? focusNode;

  @override
  void initState() {
    focusNode = FocusNode();
    post(() => focusNode!.requestFocus());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavScaffold(
      body: Column(
        children: [
          Hero(
            tag: 'KEY_FIELD',
            child: KeyField(
              backButton: true,
              focusNode: focusNode,
              onChanged: (String key, bool isValid){
                Provider.of<GaderypolukiProvider>(context, listen: false).key = key;
                onKeyChanged?.call(key, isValid);
              },
              trailing: Consumer<GaderypolukiProvider>(
                builder: (context, prov, child){
                  if(!prov.isValid)
                    return IconButton(
                        icon: Icon(MdiIcons.alertCircleOutline),
                        onPressed: () => showAppToast(context, text: 'Znaki klucza nie mogą się powtarzać.')
                    );

                  return Container();
                },
              ),
            ),
          ),

          Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [

                  SliverList(
                    delegate: SliverChildListDelegate([

                      Consumer<GaderypolukiProvider>(
                          builder: (context, prov, child) =>
                          prov.input!.isEmpty?
                          Container():
                          SuggCard(
                            prov.isValid?prov.key:'Błąd w kluczu...',
                            onTap: (String key){
                              onKeyTap!(key, GaderypolukiProvider.checkKeyValidity(key));
                              Navigator.pop(context);
                            },
                          )
                      ),

                      TitleShortcutRowWidget(title: 'Popularne klucze', titleColor: hintEnab_(context)),
                    ]),
                  ),

                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) => SuggCard(
                            KEYS[index],
                            onTap: (String key){
                              onKeyTap!(key, GaderypolukiProvider.checkKeyValidity(key));
                              Navigator.pop(context);
                            },
                          ),
                          childCount: KEYS.length
                      )
                  ),

                ],
              )
          )
        ],
      ),
    );
  }

}

class SuggCard extends StatelessWidget{

  final String _key;
  final void Function(String key)? onTap;

  const SuggCard(this._key, {this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      radius: AppCard.bigRadius,
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      child: SizedBox(
        height: Dimen.ICON_SIZE,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            splitStringIntoPairs(_key.toUpperCase()),
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold,
                color: textEnab_(context)
            ),
          ),
        ),
      ),
      onTap: () => onTap!(_key),
    );
  }

}