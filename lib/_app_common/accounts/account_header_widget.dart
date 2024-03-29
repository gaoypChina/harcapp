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
  final Color? thumbnailMarkerColor;
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
        this.thumbnailMarkerColor,
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
        Color? thumbnailMarkerColor,
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
        thumbnailMarkerColor: thumbnailMarkerColor,
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

    dynamic heroTag;

    if(showDetailsButton && this.heroTag == null)
      heroTag = const Uuid().v4();
    else
      heroTag = this.heroTag;

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
                  markerColor: thumbnailMarkerColor,
                  backgroundColor: backgroundColor,
                  tapable: false
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
                                clipBehavior: Clip.hardEdge,
                                borderRadius: BorderRadius.circular(AppCard.bigRadius),
                                color: backgroundColor??background_(context),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [

                                    Padding(
                                      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
                                      child: AccountHeaderWidget(
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
                                        detailsBorderColor: detailsBorderColor??thumbnailBorderColor,
                                        shadow: shadow,
                                        heroTag: heroTag,
                                      ),
                                    ),

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
          child: Material(
            color: Colors.transparent,
            clipBehavior: Clip.none,
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
        ),

      ],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        if(heroTag == null)
          header
        else
          Hero(
            tag: heroTag,
            child: header,
          ),

        if(showDetails && (org != null || (hufiec != null && hufiec!.isNotEmpty) || (druzyna != null && druzyna!.isNotEmpty) || rankHarc != null || rankInstr != null))
          Padding(
              padding: const EdgeInsets.only(
                top: Dimen.SIDE_MARG,
              ),
              child: BorderMaterial(
                borderColor: detailsBorderColor,
                color: backgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: Dimen.SIDE_MARG - BorderMaterial.defBorderWidth),
                  child: Builder(
                    builder: (context) {

                      List<Widget> children = [];
                      if(org != null || showEmptyDetails) {
                        children.add(OrgInputField(
                          org,
                          enabled: false,
                          dimTextOnDisabled: false,
                        ));
                        children.add(const SizedBox(height: Dimen.SIDE_MARG));
                      }

                      if((hufiec != null && hufiec!.isNotEmpty) || showEmptyDetails) {
                        children.add(HufiecInputField(
                          enabled: false,
                          dimTextOnDisabled: false,
                          controller: InputFieldController(text: hufiec),
                        ));
                        children.add(const SizedBox(height: Dimen.SIDE_MARG));
                      }

                      if((druzyna != null && druzyna!.isNotEmpty) || showEmptyDetails) {
                        children.add(DruzynaInputField(
                          enabled: false,
                          dimTextOnDisabled: false,
                          controller: InputFieldController(text: druzyna),
                        ));
                        children.add(const SizedBox(height: Dimen.SIDE_MARG));
                      }

                      if(rankHarc != null || showEmptyDetails){
                        children.add(RankHarcInputField(
                          rankHarc,
                          enabled: false,
                          dimTextOnDisabled: false,
                        ));
                        children.add(const SizedBox(height: Dimen.SIDE_MARG));
                      }

                      if(rankInstr != null || showEmptyDetails) {
                        children.add(RankInstrInputField(
                          rankInstr,
                          enabled: false,
                          dimTextOnDisabled: false,
                        ));
                        children.add(const SizedBox(height: Dimen.SIDE_MARG));
                      }

                      if(children.isNotEmpty)
                        children.removeLast();

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: children
                      );
                    }
                  ),
                ),
              )
          )

      ],
    );

  }

}