import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_strefa_ducha/settings_page.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShowInitMessageWidget extends StatefulWidget{

  const ShowInitMessageWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShowInitMessageWidgetState();
}

class ShowInitMessageWidgetState extends State<ShowInitMessageWidget>{

  PrimitiveWrapper<bool> value;

  @override
  void initState() {
    value = PrimitiveWrapper(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
      child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Material(
            clipBehavior: Clip.antiAlias,
            color: background_(context),
            borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListView(
                    padding: const EdgeInsets.all(2*Dimen.ICON_MARG),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [

                      const AppText(
                        '<b>Strzała!</b>'
                            '\n\nTo miejsce służy wzmacnianiu Twojego ducha przez <b>refleksję</b>.'
                            '\n\nPo przeczytaniu grafiki poświęć chwilę, by się nad nią zastanowić:'
                            '\n\n<b>minutę</b>, <b>dzień</b>, a może cały <b>tydzień</b>.'
                            '\n\nBez tego te grafiki będą tylko zwykłymi obrazkami.'
                            '\n\n',
                        size: Dimen.TEXT_SIZE_BIG,
                      ),

                      Row(
                        children: [
                          const Icon(MdiIcons.heartOutline),
                          const SizedBox(width: 2*Dimen.DEF_MARG,),
                          Expanded(child: Text('Aby dodać grafikę do ulubionych, dwukrotnie ją naciśnij.', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
                        ],),
                      Text('', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
                      Row(
                        children: [
                          const Icon(MdiIcons.pinOutline),
                          const SizedBox(width: 2*Dimen.DEF_MARG,),
                          Expanded(child: Text('Aby zachować grafikę na później, przytrzymaj ją i wybierz pineskę.', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)))
                        ],),
                      Text('\n\nCzuwaj!', textAlign: TextAlign.center, style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
                    ],
                  ),

                  SwitchListTile(
                    onChanged: (bool value) => setState(() => this.value.set(value)),
                    value: value.get(),
                    title: Text(
                        'Pokazuj przy otwarciu modułu.',
                        style: AppTextStyle(
                            fontWeight: weight.halfBold,
                            color: value.get()?textEnab_(context):hintEnab_(context)
                        )
                    ),
                  ),

                  SimpleButton(
                      radius: 0,
                      margin: EdgeInsets.zero,
                      onTap: (){
                        Settings.showInitMessage = value.get();
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(Dimen.ICON_MARG),
                      child: const Icon(MdiIcons.check)
                  )
                ],),
          )
      )
  );

}