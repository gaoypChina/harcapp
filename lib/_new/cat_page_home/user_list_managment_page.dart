import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/account/account_thumbnail_widget.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';

class UserSet<T extends UserData>{

  final IconData icon;
  final String name;
  final List<T> users;

  const UserSet({required this.icon, required this.name, required this.users});

}

class UserListManagementPage<T extends UserData> extends StatelessWidget{

  final List<UserSet<T>> userSets;
  final Widget Function(BuildContext, T) userTileBuilder;

  final Color? backgroundColor;
  final Color? appBottomNavColor;
  final String appBarTitle;
  final Widget? appBarLeading;
  final List<Widget>? appBarActions;
  final Widget Function(BuildContext, UserSet<T>)? headerTrailing;
  final bool showIfEmpty;
  final Widget? bottom;
  final Widget? bottomNavigationBar;
  
  const UserListManagementPage({
    required this.userSets,
    required this.userTileBuilder,

    this.backgroundColor,
    this.appBottomNavColor,
    this.appBarTitle = 'Lista ludzi',
    this.appBarLeading,
    this.appBarActions,
    this.headerTrailing,
    this.showIfEmpty = false,
    this.bottom,

    this.bottomNavigationBar,

    super.key
  });

  @override
  Widget build(BuildContext context){

    List<Widget> userSetWidgets = [];
    
    for(UserSet<T> userSet in userSets)
      if(userSet.users.isNotEmpty || showIfEmpty)
        userSetWidgets.add(_Border(
          backgroundColor: backgroundColor,
          header: _ListHeader(
            icon: userSet.icon,
            title: userSet.name,
            trailing: headerTrailing?.call(context, userSet),
          ),
          body: Builder(
              builder: (context){

                List<Widget> children = [];

                for(T userData in userSet.users)
                  children.add(userTileBuilder(context, userData));

                return Column(mainAxisSize: MainAxisSize.min, children: children);

              },
            )
        ));

    return BottomNavScaffold(
      backgroundColor: backgroundColor,
      appBottomNavColor: appBottomNavColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [

          SliverAppBar(
            title: Text(appBarTitle),
            centerTitle: true,
            floating: true,
            backgroundColor: backgroundColor,
            leading: appBarLeading,
            actions: appBarActions,
          ),

          SliverList(delegate: SliverChildListDelegate(userSetWidgets)),

          SliverList(delegate: SliverChildListDelegate([

            if(bottom != null)
              bottom!,

          ])),

        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }



}

class _ListHeader extends StatelessWidget{

  final IconData icon;
  final String title;
  final Widget? trailing;

  const _ListHeader({
    required this.icon,
    required this.title,
    required this.trailing,
    super.key
  });

  @override
  Widget build(BuildContext context) => Row(
    children: [

      SizedBox(
        width: AccountThumbnailWidget.defSize + 2*Dimen.SIDE_MARG,
        child: Center(
          child: Icon(icon, color: hintEnab_(context)),
        ),
      ),

      Expanded(
          child: Text(
            title,
            style: AppTextStyle(
                fontWeight: weight.bold,
                fontSize: Dimen.TEXT_SIZE_BIG,
                color: hintEnab_(context)
            ),
          )
      ),

      if(trailing != null)
        trailing!

    ],
  );

}

class _Border extends StatelessWidget{

  final Widget header;
  final Widget body;
  final Color? backgroundColor;

  const _Border({
    required this.header,
    required this.body,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(Dimen.defMarg),
      child: Material(
        color: backgroundIcon_(context),
        borderRadius: BorderRadius.circular(AppCard.bigRadius),
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              borderRadius: BorderRadius.circular(AppCard.bigRadius-6),
              clipBehavior: Clip.hardEdge,
              color: backgroundColor??background_(context),
              child: Column(
                children: [
                  const SizedBox(height: Dimen.defMarg),
                  header,
                  const SizedBox(height: Dimen.defMarg),
                  body
                ],
              ),
            )
        ),
      )
  );

}