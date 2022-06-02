import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import 'common.dart';

class DescUlamkowy extends StatelessWidget{

  static const double FRACTION_MARGIN = 2;

  @override
  Widget build(BuildContext context) {

    AutoSizeGroup group = AutoSizeGroup();

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      children: <Widget>[

        DescOnlyWidget(),

        const SizedBox(height: Dimen.SIDE_MARG),

        Row(
          children: <Widget>[
            Expanded(child: Column(
              children: <Widget>[
                AutoSizeText('A B C D E', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 2, color: textEnab_(context)),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('1', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            )),
            const SizedBox(width: 2*Dimen.DEF_MARG),
            Expanded(child: Column(
              children: <Widget>[
                AutoSizeText('F G H I J', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 2, color: textEnab_(context)),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('2', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            )),
            const SizedBox(width: 2*Dimen.DEF_MARG),
            Expanded(child: Column(
              children: <Widget>[
                AutoSizeText('K L M N O', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 2, color: textEnab_(context)),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('3', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            )),
            const SizedBox(width: 2*Dimen.DEF_MARG),
            Expanded(child: Column(
              children: <Widget>[
                AutoSizeText('P R S T U', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 2, color: textEnab_(context)),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('4', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            )),
            const SizedBox(width: 2*Dimen.DEF_MARG),
            Expanded(child: Column(
              children: <Widget>[
                AutoSizeText('W Y Z', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 2, color: textEnab_(context)),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('5', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            ))
          ],
        ),

        const AppText(
          '\nSzyfr ułamkowy występuje w wielu formach. Najpopularniejsze spośród nich to formy \"grup po cztery\", \"grup po pięć\", oraz \"grup po sześć\". W celu wyjaśnienia istoty szyfru przyjęta zostanie forma <b>"grup po pięć"</b>.'
              '\n\nAby zaszyfrować literę, należy odnaleźć ją w kluczu i zastąpić ułamkiem według schematu:'
              '\n\n - licznik zastąpiony zostaje wartością <b>pozycji</b> litery w swoim \"ułamku\",'
              '\n - mianownik przepisujemy posługując się <b>numerem grupy</b>.'
              '\n\nZaszyfrowane słowo <b>H A R C E R Z</b> to:\n',
          size: Dimen.TEXT_SIZE_BIG,
        ),

        Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                AutoSizeText('3', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 1, width: 16, color: AppColors.text_def_enab),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('2', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            ),
            const SizedBox(width: Dimen.DEF_MARG),
            Column(
              children: <Widget>[
                AutoSizeText('1', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 1, width: 16, color: AppColors.text_def_enab),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('1', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            ),
            const SizedBox(width: Dimen.DEF_MARG),
            Column(
              children: <Widget>[
                AutoSizeText('2', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 1, width: 16, color: AppColors.text_def_enab),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('4', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            ),
            const SizedBox(width: Dimen.DEF_MARG),
            Column(
              children: <Widget>[
                AutoSizeText('3', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 1, width: 16, color: AppColors.text_def_enab),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('1', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            ),
            const SizedBox(width: Dimen.DEF_MARG),
            Column(
              children: <Widget>[
                AutoSizeText('5', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 1, width: 16, color: AppColors.text_def_enab),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('1', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            ),
            const SizedBox(width: Dimen.DEF_MARG),
            Column(
              children: <Widget>[
                AutoSizeText('2', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 1, width: 16, color: AppColors.text_def_enab),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('4', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            ),
            const SizedBox(width: Dimen.DEF_MARG),
            Column(
              children: <Widget>[
                AutoSizeText('3', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group, maxLines: 1,),
                const SizedBox(height: FRACTION_MARGIN),
                Container(height: 1, width: 16, color: AppColors.text_def_enab),
                const SizedBox(height: FRACTION_MARGIN),
                AutoSizeText('5', style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold), group: group),
              ],
            )
          ],
        )

      ],
    );

  }

}