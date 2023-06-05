import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/sliver_child_builder_separated_delegate.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_classes/storage.dart';
import 'package:harcapp/_new/cat_page_harcthought/konspekty/konspekt.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'package:harcapp/_new/module_statistics_registrator.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:open_file/open_file.dart';

class KonspektWidget extends StatefulWidget{

  final Konspekt konspekt;

  const KonspektWidget(this.konspekt, {super.key});

  @override
  State<StatefulWidget> createState() => KonspektWidgetState();

}

class KonspektWidgetState extends State<KonspektWidget> with ModuleStatsMixin{

  @override
  String get moduleId => ModuleStatsMixin.myslHarcFormy;

  Konspekt get konspekt => widget.konspekt;

  late bool showAppBarTitle;

  late ValueNotifier<double> headerNotifier;
  late ScrollController controller;

  @override
  void initState() {
    showAppBarTitle = false;
    controller = ScrollController();

    controller.addListener((){
      bool shouldBeVisible = controller.offset > (MediaQuery.of(context).size.width*600/1000);

      if(showAppBarTitle && !shouldBeVisible)
        setState(() => showAppBarTitle = shouldBeVisible);
      else if(!showAppBarTitle && shouldBeVisible)
        setState(() => showAppBarTitle = shouldBeVisible);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    body: CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [

        SliverAppBar(
          pinned: true,
          stretch: true,
          centerTitle: true,
          backgroundColor: background_(context),
          expandedHeight: MediaQuery.of(context).size.width*600/1000,
          flexibleSpace: FlexibleSpaceBar(
            title: AnimatedOpacity(
                opacity: showAppBarTitle?1:0,
                duration: const Duration(milliseconds: 300),
                child: Text(konspekt.title, style: AppTextStyle(color: iconEnab_(context))),
            ),
            background: GestureDetector(
              onTap: () => showAppToast(context, text: 'Źródło: <b>${konspekt.coverAuthor}</b>'),
              child: Hero(
                tag: konspekt.coverPath,
                child: Image(
                  image: AssetImage(konspekt.coverPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground
            ],
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            const SizedBox(height: Dimen.SIDE_MARG),

            TitleShortcutRowWidget(title: konspekt.title),

            const SizedBox(height: Dimen.SIDE_MARG),

            const TitleShortcutRowWidget(title: 'Cele', textAlign: TextAlign.left),

          ])),
        ),

        SliverPadding(
          padding: const EdgeInsets.only(
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            bottom: Dimen.SIDE_MARG,
          ),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
                  (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(MdiIcons.circleMedium, size: Dimen.TEXT_SIZE_BIG),
                      const SizedBox(width: Dimen.defMarg),
                      Expanded(child: AppText(konspekt.aims[index], size: Dimen.TEXT_SIZE_BIG))
                    ],
                  ),
              separatorBuilder: (context, index) => const SizedBox(height: Dimen.defMarg),
              count: konspekt.aims.length
          )),
        ),

        SliverPadding(
          padding: const EdgeInsets.only(
            left: Dimen.SIDE_MARG,
            right: Dimen.SIDE_MARG,
            bottom: Dimen.SIDE_MARG,
          ),
          sliver: SliverList(delegate: SliverChildListDelegate([

            const TitleShortcutRowWidget(title: 'Wstęp', textAlign: TextAlign.left),

            AppText(
              konspekt.intro,
              size: Dimen.TEXT_SIZE_BIG,
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            const TitleShortcutRowWidget(title: 'Opis', textAlign: TextAlign.left),

            AppText(
              konspekt.description,
              size: Dimen.TEXT_SIZE_BIG,
            ),

            const SizedBox(height: Dimen.SIDE_MARG),

            const TitleShortcutRowWidget(title: 'Załączniki', textAlign: TextAlign.left),

          ])),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildSeparatedBuilderDelegate(
            (context, index) => AttachmentWidget(konspekt.attachments[index]),
            separatorBuilder: (context, index) => const SizedBox(height: Dimen.defMarg),
            count: konspekt.attachments.length
          )),
        ),

        SliverPadding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          sliver: SliverList(delegate: SliverChildListDelegate([

            if(konspekt.author != null)
              const TitleShortcutRowWidget(title: 'Autor', textAlign: TextAlign.left),

            if(konspekt.author != null)
              PersonCard(konspekt.author)

          ])),
        ),

      ],
    ),
  );

}

class AttachmentWidget extends StatelessWidget{

  final KonspektAttachment attachment;

  const AttachmentWidget(this.attachment, {super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
    color: cardEnab_(context),
    borderRadius: BorderRadius.circular(AppCard.bigRadius),
    child: Padding(
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      child: Row(
        children: [

          Expanded(child: Text(
              attachment.name,
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold,
              )
          )),

          const Icon(Icons.link),

        ],
      ),
    ),
    onTap: () async {
      if(attachment.url != null) launchURL(attachment.url!);
      else if(attachment.asset != null){
        OpenResult result = await openAsset(attachment.asset!);
        if(result.type != ResultType.done) showAppToast(context, text: 'Nie udało się otworzyć pliku');
        logger.i(result.message);
      }

    }
  );

}