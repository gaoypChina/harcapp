import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_cards/fse_org_card_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_cards/rrp_org_card_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_cards/zhp_org_card_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_cards/zhr_org_card_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_pages/fse_org_widget.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_pages/rrp_org_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_pages/zhp_org_page.dart';
import 'package:harcapp/_new/cat_page_guidebook_development/guidebook/organizations/org_pages/zhr_org_page.dart';

List<Widget> orgCardWidgets = [
  FSEOrgCardWidget(
    onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => const FSEOrgWidget())),
  ),

  ZHROrgCardWidget(
    onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => const ZHROrgPage())),
  ),

  ZHPOrgCardWidget(
    onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => const ZHPOrgPage())),
  ),

  RRPOrgCardWidget(
    onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => const RRPOrgPage())),
  )
];