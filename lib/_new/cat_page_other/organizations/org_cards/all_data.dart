import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_cards/fse_org_card_widget.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_cards/rrp_org_card_widget.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_cards/zhp_org_card_widget.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_cards/zhr_org_card_widget.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_pages/fse_org_page.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_pages/rrp_org_page.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_pages/zhp_org_page.dart';
import 'package:harcapp/_new/cat_page_other/organizations/org_pages/zhr_org_page.dart';

List<Widget> orgCardWidgets = [
  FSEOrgCardWidget(
    onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => FSEOrgPage())),
  ),

  ZHROrgCardWidget(
    onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ZHROrgPage())),
  ),

  ZHPOrgCardWidget(
    onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => ZHPOrgPage())),
  ),

  RRPOrgCardWidget(
    onTap: (context) => Navigator.push(context, MaterialPageRoute(builder: (context) => RRPOrgPage())),
  )
];