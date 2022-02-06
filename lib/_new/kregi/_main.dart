import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';

class KregiPage extends StatefulWidget {

  const KregiPage();

  @override
  State<StatefulWidget> createState() => KregiPageState();

}

class KregiPageState extends State<KregiPage>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      endDrawer: Drawer(

      ),
      appBar: AppBar(
        title: Text('Ciągle kręgi...'),
      ),
      body: Center(child: Text('Kręgi lol')),
    );

  }

}