import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:harcapp/_common_widgets/bottom_nav_scaffold.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/api/forum.dart';
import 'package:harcapp/_new/cat_page_home/community/forum/model/forum.dart';
import 'package:harcapp/values/consts.dart';

import 'forum_page.dart';

class ForumLoaderPage extends StatefulWidget{

  final ForumBasicData forum;
  const ForumLoaderPage({required this.forum, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ForumLoaderPageState();

}

class ForumLoaderPageState extends State<ForumLoaderPage>{

  Forum? loadedForum;

  @override
  void initState() {

    String forumKey = widget.forum.key;

    ApiForum.get(
      forumKey: forumKey,
      community: widget.forum.community,
      onSuccess: (forum){
        if(!mounted) return;

        pushReplacePage(
          context,
          builder: (context) => ForumPage(forum)
        );

      },
      onServerMaybeWakingUp: () {
        if(!mounted) return true;
        showServerWakingUpToast(context);
        Navigator.pop(context);
        return true;
      },
      onForceLoggedOut: (){
        if(!mounted) return true;
        showAppToast(context, text: forceLoggedOutMessage);
        Navigator.pop(context);
        return true;
      },
      onError: (_){
        if(!mounted) return;
        showAppToast(context, text: simpleErrorMessage);
        Navigator.pop(context);
      }
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BottomNavScaffold(
    appBar: AppBar(
      title: Text(widget.forum.name),
      centerTitle: true,
      elevation: 0,
    ),
    body: const Center(
      child: EmptyMessageWidget(
        icon: Forum.icon,
        text: 'Ładowanie forum...',
      ),
    ),
  );

}