import 'package:flutter/material.dart';

Duration pageTransDuration = MaterialPageRoute<Scaffold>(
    builder: (context) => Container()
).transitionDuration;

Future<void> popPage(BuildContext context) async {
  Navigator.pop(context);
  await Future.delayed(pageTransDuration);
}

pushPage(BuildContext context, {required Widget Function(BuildContext) builder}) => Navigator.push(
    context,
    MaterialPageRoute(builder: builder)
);

pushReplacePage(BuildContext context, {required Widget Function(BuildContext) builder}){
  bool popped = false;
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: builder), (route){
        bool result = popped;
        popped = true;
        return result;
      }
  );
}