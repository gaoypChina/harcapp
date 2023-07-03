import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/common_widgets/community_header_widget.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../_common_classes/common_contact_data.dart';

class CommonContactWidget extends StatelessWidget{

  final CommonContactData data;
  final bool otherMultiline;

  const CommonContactWidget(this.data, {this.otherMultiline = false, super.key});

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [

      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ContactItemWidget(
              MdiIcons.emailOutline,
              data.email[index],
              trailingIcon: MdiIcons.chevronRight,
              onTrailingTap: () => launchUrl(Uri(
                scheme: 'mailto',
                path: data.email[index],
              ))
          ),
          itemCount: data.email.length,
          shrinkWrap: true
      ),

      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ContactItemWidget(
            MdiIcons.phoneOutline,
            data.phone[index],
            trailingIcon: MdiIcons.chevronRight,
            onTrailingTap: () => launchUrl(Uri(
              scheme: 'sms',
              path: data.phone[index],
            )),
          ),
          itemCount: data.phone.length,
          shrinkWrap: true
      ),

      ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => ContactItemWidget(
            MdiIcons.web,
            data.website[index],
            trailingIcon: MdiIcons.chevronRight,
            onTrailingTap: () => launchURL(data.website[index]),
          ),
          itemCount: data.website.length,
          shrinkWrap: true
      ),

      if(data.other != null)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimen.ICON_MARG),
          child: ContactItemWidget(
            MdiIcons.cardTextOutline,
            data.other!,
            multiline: otherMultiline,
          ),
        ),

    ],
  );

}

class ContactItemWidget extends StatelessWidget{

  final IconData icon;
  final String text;
  final IconData? trailingIcon;
  final void Function()? onTrailingTap;
  final bool multiline;

  const ContactItemWidget(
      this.icon,
      this.text,
      { this.trailingIcon,
        this.onTrailingTap,
        this.multiline = false,
        super.key
      });

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      const SizedBox(width: Dimen.ICON_MARG),
      Icon(icon, color: textEnab_(context)),
      const SizedBox(width: Dimen.ICON_MARG),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
              top: (Dimen.ICON_SIZE - Dimen.TEXT_SIZE_BIG)/2
          ),
          child: SelectableText(
            text,
            style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
                fontWeight: weight.halfBold,
                color: textEnab_(context)
            ),
            maxLines: multiline?null:1,
          ),
        ),
      ),

      if(trailingIcon != null)
        SimpleButton.from(
            context: context,
            radius: communityRadius,
            icon: trailingIcon!,
            onTap: onTrailingTap,
            margin: EdgeInsets.zero
        )

    ],
  );

}

Future<void> openCommonContact(
    BuildContext context,
    CommonContactData contactData,
    { String? title,
      bool showHeader = false,
      CommunityBasicData? community,
      bool otherMultiline = false,
}){

  assert(showHeader == false || (showHeader && community != null));

  // Don't use openDialog. It will reset the theme in the context.
  return showDialog(
      context: context,
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(Dimen.SIDE_MARG),
          child: Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(AppCard.bigRadius),
              color: background_(context),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  AppBar(
                    title: Text(title??'Kontakt'),
                    centerTitle: true,
                    elevation: 0,
                  ),

                  if(showHeader)
                    CommunityHeaderWidget(
                        community!.iconKey,
                        community.key,
                        community.name,
                        community.category,

                        thumbnailHeroTag: false
                    ),

                  Padding(
                    padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                    child: CommonContactWidget(contactData, otherMultiline: otherMultiline),
                  ),

                ],
              )
          ),
        ),
      )
  );

}