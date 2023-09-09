import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/org/org.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/account/account_common/druzyna_input_field.dart';
import 'package:harcapp/account/account_common/hufiec_input_field.dart';
import 'package:harcapp/account/account_common/rank_harc_input_field.dart';
import 'package:harcapp/account/account_common/rank_instr_input_field.dart';
import 'package:harcapp/account/account_start/input_field_controller.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp/values/rank_harc.dart';
import 'package:harcapp/values/rank_instr.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../account/account_common/org_input_field.dart';

class AccountHeaderWidget extends StatelessWidget{

  final String name;
  final Org? org;
  final String? hufiec;
  final String? druzyna;
  final RankHarc? rankHarc;
  final RankInstr? rankInstr;

  final Color? thumbnailColor;
  final Color? thumbnailBorderColor;
  final Color? backgroundColor;
  final bool verified;
  final bool showDetails;
  final bool showEmptyDetails;
  final bool showDetailsButton;
  final Color? detailsBorderColor;
  final bool shadow;
  final Widget? leading;
  final Widget? trailing;
  final dynamic heroTag;

  const AccountHeaderWidget(
      this.name,
      this.org,
      this.hufiec,
      this.druzyna,
      this.rankHarc,
      this.rankInstr,
      { this.thumbnailColor,
        this.thumbnailBorderColor,
        this.backgroundColor,
        required this.verified,
        this.showDetails = false,
        this.showEmptyDetails = false,
        this.showDetailsButton = true,
        this.detailsBorderColor,
        this.shadow = false,
        this.leading,
        this.trailing,
        this.heroTag,
        super.key
      });

  static AccountHeaderWidget fromUserData(
      UserData userData,
      { Color? thumbnailColor,
        Color? thumbnailBorderColor,
        Color? backgroundColor,
        bool showDetails = false,
        bool showEmptyDetails = false,
        bool showDetailsButton = true,
        Color? detailsBorderColor,
        bool shadow = false,
        Widget? leading,
        Widget? trailing,
        dynamic heroTag,
      }) => AccountHeaderWidget(
        userData.name,
        userData.org,
        userData.hufiec,
        userData.druzyna,
        userData.rankHarc,
        userData.rankInstr,

        thumbnailColor: thumbnailColor,
        thumbnailBorderColor: thumbnailBorderColor,
        backgroundColor: backgroundColor,
        verified: userData.verified,
        showDetails: showDetails,
        showEmptyDetails: showEmptyDetails,
        showDetailsButton: showDetailsButton,
        detailsBorderColor: detailsBorderColor,
        shadow: shadow,
        leading: leading,
        trailing: trailing,
        heroTag: heroTag,
      );

  @override
  Widget build(BuildContext context){

    dynamic _heroTag;

    if(showDetailsButton && heroTag == null)
      _heroTag = const Uuid().v4();
    else
      _heroTag = heroTag;

    Widget header = Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            if(showDetailsButton && !shadow)
              const SizedBox(width: Dimen.ICON_FOOTPRINT),

            Expanded(
              child: Center(
                child: AccountThumbnailWidget(
                    name: name,
                    verified: verified,
                    shadow: shadow,
                    size: 84,
                    elevated: false,
                    color: thumbnailColor,
                    borderColor: thumbnailBorderColor,
                    backgroundColor: backgroundColor,
                    onTap: null
                ),
              ),
            ),

            if(showDetailsButton && !shadow)
              IconButton(
                  icon: Icon(MdiIcons.dotsHorizontal),
                  padding: EdgeInsets.zero,
                  onPressed: () => openDialog(
                      context: context,
                      builder: (context) => Center(
                        child: Padding(
                            padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                            child: Material(
                                clipBehavior: Clip.none,
                                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                                color: backgroundColor??background_(context),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    const SizedBox(height: Dimen.SIDE_MARG),

                                    AccountHeaderWidget(
                                        name,
                                        org,
                                        hufiec,
                                        druzyna,
                                        rankHarc,
                                        rankInstr,
                                        thumbnailColor: thumbnailColor,
                                        thumbnailBorderColor: thumbnailBorderColor,
                                        backgroundColor: backgroundColor,
                                        verified: verified,
                                        showDetails: true,
                                        showDetailsButton: false,
                                        detailsBorderColor: detailsBorderColor,
                                        shadow: shadow,
                                        heroTag: _heroTag,
                                    ),

                                    const SizedBox(height: Dimen.SIDE_MARG),

                                    SimpleButton.from(
                                        context: context,
                                        icon: MdiIcons.arrowLeft,
                                        margin: EdgeInsets.zero,
                                        radius: 0,
                                        text: 'Wróć',
                                        onTap: () => Navigator.pop(context)
                                    )

                                  ],
                                )
                            )
                        ),
                      )
                  )
              )

          ],
        ),

        const SizedBox(height: 12),

        IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: Dimen.ICON_FOOTPRINT),
              if(leading != null) leading!,
              Expanded(
                child: Text(name, style: AppTextStyle(fontSize: 24.0, fontWeight: weight.bold)),
              ),
              if(trailing != null) trailing!,
            ],
          ),
        ),

      ],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        if(_heroTag == null)
          header
        else
          Hero(
            tag: _heroTag,
            child: header,
          ),

        if(showDetails && (org != null || hufiec != null || druzyna != null || rankHarc != null || rankInstr != null))
          Padding(
              padding: const EdgeInsets.only(
                top: Dimen.SIDE_MARG,
                left: Dimen.SIDE_MARG,
                right: Dimen.SIDE_MARG,
              ),
              child: BorderMaterial(
                borderColor: detailsBorderColor,
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(Dimen.SIDE_MARG - BorderMaterial.defBorderWidth),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      if(org != null || showEmptyDetails)
                        OrgInputField(
                        org,
                        enabled: false,
                        dimTextOnDisabled: false,
                      ),

                      if(org != null || showEmptyDetails)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(hufiec != null || showEmptyDetails)
                        HufiecInputField(
                        enabled: false,
                        dimTextOnDisabled: false,
                        controller: InputFieldController(text: hufiec),
                      ),

                      if(hufiec != null || showEmptyDetails)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(druzyna != null || showEmptyDetails)
                        DruzynaInputField(
                        enabled: false,
                        dimTextOnDisabled: false,
                        controller: InputFieldController(text: druzyna),
                      ),

                      if(druzyna != null || showEmptyDetails)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(rankHarc != null || showEmptyDetails)
                        RankHarcInputField(
                          rankHarc,
                          enabled: false,
                          dimTextOnDisabled: false,
                        ),

                      if(rankHarc != null || showEmptyDetails)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(rankInstr != null || showEmptyDetails)
                        RankInstrInputField(
                        rankInstr,
                        enabled: false,
                        dimTextOnDisabled: false,
                      ),

                    ],
                  ),
                ),
              )
          )

      ],
    );

  }

}