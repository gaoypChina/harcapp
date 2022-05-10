import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/circles/circle_page.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp/_new/cat_page_home/circles/model/announcement.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:palette_generator/palette_generator.dart';

import 'cover_image.dart';

class AnnouncementWidget extends StatelessWidget{

  final Announcement announcement;
  final PaletteGenerator paletteGenerator;
  final void Function() onUpdateTap;
  final void Function() onPinTap;

  const AnnouncementWidget(
      this.announcement,
      { this.paletteGenerator,
        this.onUpdateTap,
        this.onPinTap,
        Key key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
    color: CirclePage.cardColor(context, paletteGenerator),
    clipBehavior: Clip.antiAlias,
    borderRadius: BorderRadius.circular(AppCard.BIG_RADIUS),
    elevation: AppCard.bigElevation,
    child: Column(
      children: [

        if(announcement.coverImage != null)
          CoverImage(announcement.coverImage),

        Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Text(
                dateToString(announcement.postTime),
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context)),
              ),

              const SizedBox(height: Dimen.ICON_MARG),

              Text(
                announcement.title,
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_APPBAR, fontWeight: weight.halfBold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: Dimen.SIDE_MARG),

              Text(
                announcement.text,
                style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),

            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(width: Dimen.SIDE_MARG - Dimen.ICON_MARG, height: Dimen.ICON_FOOTPRINT),

            if(AccountData.key == announcement.author.key)
              IconButton(
                  icon: Icon(
                    MdiIcons.pinOutline,
                    color:
                    announcement.pinned?
                    iconEnab_(context):
                    iconDisab_(context),
                  ),
                  onPressed: onPinTap
              ),

            if(AccountData.key == announcement.author.key)
              IconButton(
                icon: const Icon(MdiIcons.pencilOutline),
                onPressed: onUpdateTap
              ),

            Expanded(child: Container()),

            Text(announcement.author.name, style: AppTextStyle()),
            const SizedBox(width: 10.0),
            AccountThumbnailWidget(name: announcement.author.name, size: 24.0, elevated: false),
            const SizedBox(width: Dimen.SIDE_MARG),
          ],
        ),

        const SizedBox(height: Dimen.SIDE_MARG - Dimen.ICON_MARG),
        
      ],
    ),
  );

}