import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_widgets/border_material.dart';
import 'package:harcapp/account/account.dart';
import 'package:harcapp/account/account_common/druzyna_input_field.dart';
import 'package:harcapp/account/account_common/hufiec_input_field.dart';
import 'package:harcapp/account/account_common/rank_harc_input_field.dart';
import 'package:harcapp/account/account_common/rank_instr_input_field.dart';
import 'package:harcapp/account/account_start/input_field_controller.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
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

            if(showDetailsButton)
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

            if(showDetailsButton)
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

        if(showDetails)
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

                      if(AccountData.org != null || showEmptyDetails)
                        OrgInputField(
                        AccountData.org,
                        enabled: false,
                        dimTextOnDisabled: false,
                      ),

                      if(AccountData.org != null || showEmptyDetails)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(AccountData.hufiec != null || showEmptyDetails)
                        HufiecInputField(
                        enabled: false,
                        dimTextOnDisabled: false,
                        controller: InputFieldController(text: AccountData.hufiec),
                      ),

                      if(AccountData.hufiec != null || showEmptyDetails)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(AccountData.druzyna != null || showEmptyDetails)
                        DruzynaInputField(
                        enabled: false,
                        dimTextOnDisabled: false,
                        controller: InputFieldController(text: AccountData.druzyna),
                      ),

                      if(AccountData.druzyna != null || showEmptyDetails)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(AccountData.rankHarc != null || showEmptyDetails)
                        RankHarcInputField(
                          AccountData.rankHarc,
                          enabled: false,
                          dimTextOnDisabled: false,
                        ),

                      if(AccountData.rankHarc != null || showEmptyDetails)
                        const SizedBox(height: Dimen.SIDE_MARG),

                      if(AccountData.rankInstr != null || showEmptyDetails)
                        RankInstrInputField(
                        AccountData.rankInstr,
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