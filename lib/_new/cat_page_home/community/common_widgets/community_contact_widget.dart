import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_home/community/model/community.dart';
import 'package:harcapp/values/consts.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class CommunityContactWidget extends StatelessWidget{

  final CommunityContactData data;

  const CommunityContactWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) => Column(
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
        SizedBox(
          height: Dimen.ICON_FOOTPRINT,
          child: ContactItemWidget(
            MdiIcons.cardTextOutline,
            data.other!,
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

  const ContactItemWidget(
      this.icon,
      this.text,
      { this.trailingIcon,
        this.onTrailingTap,
        super.key
      });

  @override
  Widget build(BuildContext context) => Row(
    children: [

      const SizedBox(width: Dimen.ICON_MARG),
      Icon(icon, color: textEnab_(context)),
      const SizedBox(width: Dimen.ICON_MARG),
      Expanded(
        child: SelectableText(
          text,
          style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_BIG,
              fontWeight: weight.halfBold,
              color: textEnab_(context)
          ),
          maxLines: 1,
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