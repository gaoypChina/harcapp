import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';

class BottomNavScaffold extends StatefulWidget{

  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? statusBarColor;

  const BottomNavScaffold({
    this.appBar,
    this.body,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.statusBarColor
  });

  @override
  State<StatefulWidget> createState() => BottomNavScaffoldState();

}

class BottomNavScaffoldState extends State<BottomNavScaffold>{

  @override
  void initState() {
    AppBottomNavigatorProvider.addOnSelectedListener(onNavSelected);
    super.initState();
  }

  @override
  void dispose() {
    AppBottomNavigatorProvider.removeOnSelectedListener(onNavSelected);
    super.dispose();
  }

  void onNavSelected(int page) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {

   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
   //     statusBarColor: widget.statusBarColor??widget.backgroundColor??background_(context)
   // ));

    return AppScaffold(
      appBar: widget.appBar,
      body: widget.body,
      backgroundColor: widget.backgroundColor,
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(widget.bottomNavigationBar != null)
            widget.bottomNavigationBar!,

          const AppBottomNavigator(),
        ],
      ),
    );
  }

}