import 'package:flutter/material.dart';

Duration pageTransDuration = MaterialPageRoute<Scaffold>(
    builder: (context) => Container()
).transitionDuration;

Future<void> popPage(BuildContext context) async {
  Navigator.pop(context);
  await Future.delayed(pageTransDuration);
}

Future pushPage(BuildContext context, {required Widget Function(BuildContext) builder}) => Navigator.push(
    context,
    MaterialPageRoute(builder: builder)
);

Future pushReplacePage(BuildContext context, {required Widget Function(BuildContext) builder}) {
  ScaffoldState? state;
  try{
    state = Scaffold.of(context);
  } catch(e) {}
  if(state != null && state.isDrawerOpen){
    state.closeDrawer();
    return pushPage(context, builder: builder);
  }else
    return Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: builder)
    );
}

