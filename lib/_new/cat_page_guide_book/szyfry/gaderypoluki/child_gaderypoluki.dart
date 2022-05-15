import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/szyfry/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'common.dart';
import 'key_field.dart';
import 'key_page.dart';
import 'keys.dart';

class ChildGaderypoluki extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => ChildGaderypolukiState();

}

class ChildGaderypolukiState extends State<ChildGaderypoluki> with AutomaticKeepAliveClientMixin<ChildGaderypoluki>{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {

    GaderypolukiProvider prov = Provider.of<GaderypolukiProvider>(context, listen: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          child: Hero(
              tag: 'KEY_FIELD',
              child: KeyField(
                  enabled: false,
                  trailing: IconButton(
                    icon: const Icon(MdiIcons.textBoxSearchOutline),
                    onPressed: showKeyPage,
                  )
              )
          ),
          onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => KeyPage(
                onKeyTap: (String key, isValid){
                  prov.key = key;
                },

                onKeyChanged: (String key, isValid){
                  prov.key = key;
                },
              ))
          ),
        ),
        Expanded(child: Padding(
          padding: AppCard.defPadding,
          child: TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            onChanged: (text){
              prov.input = text;
            },
            decoration: InputDecoration(
                isDense: true,
                hintText: 'Wpisz wiadomość',
                hintStyle: AppTextStyle(
                    color: hintEnab_(context),
                    fontSize: Dimen.TEXT_SIZE_BIG
                ),
                border: InputBorder.none
            ),
            style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context)),
          ),
        )),

        KeyboardVisibilityBuilder(
            builder: (context, isKeyboardVisible) {
              if(isKeyboardVisible)
                return Container();

              return Expanded(child: AppCard(
                  radius: AppCard.BIG_RADIUS,
                  elevation: AppCard.bigElevation,
                  padding: const EdgeInsets.only(top: Dimen.TEXT_FIELD_PADD, left: AppCard.DEF_PADDING_VAL, right: AppCard.DEF_PADDING_VAL, bottom: AppCard.DEF_PADDING_VAL),
                  margin: const EdgeInsets.all(Dimen.DEF_MARG),
                  child: Consumer<GaderypolukiProvider>(
                    builder: (context, prov, child){

                      if(prov.isValid)
                        return SelectableText(

                            prov.output!.isEmpty?
                            'Zaszyfrowana wiadomość':
                            prov.output!,

                            style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,

                                color:
                                prov.isValid&&prov.output!.isNotEmpty?
                                textEnab_(context):
                                hintEnab_(context)
                            )
                        );

                      return const EmptyMessageWidget(
                          text: 'Błąd w kluczu',
                          icon: MdiIcons.alertCircleOutline
                      );

                    },
                  )
              ));
            }
        )


      ],
    );
  }

  void showKeyPage(){

    GaderypolukiProvider prov = Provider.of<GaderypolukiProvider>(context, listen: false);

    if(prov.input!.isEmpty) showAppToast(context, text: 'Wpisz zaszyfrowaną wiadomość.');
    else
      showScrollBottomSheet(
        context: context,
        builder: (context) => BottomSheetDef(
          title: 'Porównaj klucze',
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: KEYS.map((item) => KeyCard(
                item,
                prov.input,
                onTap: (String key){
                  prov.key = key;
                  Navigator.pop(context);
                }
            )).toList(),
          ),
        ),
      );
  }

}

class KeyCard extends StatelessWidget{

  final String _key;
  final String? _input;
  final void Function(String key)? onTap;

  const KeyCard(this._key, this._input, {this.onTap, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
        radius: AppCard.BIG_RADIUS,
        onTap: () => onTap == null?null:onTap!(_key),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 1.5*Dimen.ICON_MARG),

            Row(
              children: [

                const SizedBox(width: Dimen.ICON_MARG),
                Icon(MdiIcons.keyOutline, color: hintEnab_(context)),
                const SizedBox(width: Dimen.ICON_MARG),

                Text(
                  splitStringIntoPairs(_key),
                  style: AppTextStyle(
                      fontSize: Dimen.TEXT_SIZE_BIG,
                      color: hintEnab_(context),
                      fontWeight: weight.halfBold
                  ),
                ),
              ],
            ),

            const SizedBox(height: Dimen.ICON_MARG),

            Row(
              children: [

                const SizedBox(width: Dimen.ICON_MARG),
                Icon(MdiIcons.textBoxOutline, color: hintEnab_(context)),
                const SizedBox(width: Dimen.ICON_MARG),

                Text(
                    GaderypolukiProvider.createOutput(_key, _input),
                    style: AppTextStyle(
                        fontSize: Dimen.TEXT_SIZE_BIG,
                        color: textEnab_(context)
                    )
                )
              ],
            ),

            const SizedBox(height: 1.5*Dimen.ICON_MARG),

          ],
        )
    );
  }
}
