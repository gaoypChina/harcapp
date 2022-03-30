import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/accounts/user_data.dart';
import 'package:harcapp_core/comm_widgets/app_scaffold.dart';

class ShadowUserManagerPage extends StatefulWidget{

  const ShadowUserManagerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ShadowUserManagerPageState();

}

class ShadowUserManagerPageState extends State<ShadowUserManagerPage>{

  List<UserDataNick> shadowUsers;

  @override
  void initState() {
    shadowUsers = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      body: ,
    );

  }


}