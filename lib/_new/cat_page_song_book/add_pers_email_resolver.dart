import 'package:flutter/material.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_song/song_core.dart';
import 'package:harcapp_core_song_widget/add_pers_resolver.dart';

class AddPersEmailResolver extends AddPersResolver{

  final double? textSize;
  final Color? textColor;

  const AddPersEmailResolver({this.textSize, this.textColor});

  @override
  Widget build(BuildContext context, AddPerson data){
    if(data.emailRef != null && allPeopleMap.containsKey(data.emailRef)) {
      return PersonCard(
          allPeopleMap[data.emailRef],
          textSize: textSize ?? Dimen.TEXT_SIZE_NORMAL,
          textColor: textColor ?? hintEnab_(context)
      );
    }else if(data.name != null || data.name!.isEmpty)
      return AddPersSimpleResolver(textSize: textSize, textColor: textColor).build(context, data);

    logger.e('All null addPers found. Use null instead.');
    return Container();
  }

}