import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/app_toast.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_file/open_file.dart';

import '../../../_common_classes/org/org_indicator.dart';
import 'data_dokumenty.dart';

class ChildDokumenty extends StatelessWidget {

  const ChildDokumenty({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Positioned.fill(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
                top: Dimen.SIDE_MARG,
                bottom: Dimen.ICON_FOOTPRINT + 3*Dimen.SIDE_MARG,
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG
            ),
            itemBuilder: (context, index) => DocCard(ALL_DATA_DOKUMENTY[index]),
            separatorBuilder: (context, index) => const SizedBox(height: Dimen.SIDE_MARG),
            itemCount: ALL_DATA_DOKUMENTY.length,
          ),
        ),

        Positioned(
            bottom: Dimen.SIDE_MARG,
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            child: AppCard(
                onTap: () => launchURL('https://dokumenty.zhp.pl'),
                radius: AppCard.BIG_RADIUS,
                elevation: AppCard.bigElevation,
                margin: EdgeInsets.zero,
                child: TitleShortcutRowWidget(
                  icon: MdiIcons.web,
                  iconColor: hintEnab_(context),
                  title: 'Więcej dokumentów ZHP',
                  onOpen: () => launchURL('https://dokumenty.zhp.pl'),
                )
            )
        )
      ],
    );
  }
}

class DocCard extends StatelessWidget{

  final DocumentData data;

  const DocCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleButton(
      radius: AppCard.BIG_RADIUS,
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      margin: EdgeInsets.zero,
      onTap: () async {
        OpenResult result = await openAsset(data.assetPath);
        if(result.type == ResultType.noAppToOpen) {
          showAppToast(context, text: 'Nie znaleziono aplikacji do otwarcia pliku');
          logger.d(result.message);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(data.titleShort, style: AppTextStyle(fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.DEF_MARG),
          Text(data.titleLong, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context))),
          const SizedBox(height: 2*Dimen.ICON_MARG),
          Row(
            children: [
              OrgIndicator(data.org),
              Expanded(child: Container()),
              Text(data.description, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.end),
            ],
          )

        ],),
    );
  }
}