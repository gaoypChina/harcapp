import 'package:flutter/material.dart';
import 'package:harcapp/logger.dart';
import 'package:harcapp/values/people.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core_song/song_core.dart';
import 'package:harcapp_core_song_widget/add_pers_resolver.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'song_management/song.dart';

class AddPersEmailResolver extends AddPersResolver{

  static String? name(AddPerson data){
    if(data.emailRef != null && allPeopleByEmailMap.containsKey(data.emailRef))
      return allPeopleByEmailMap[data.emailRef]!.name;
    else if(data.name != null && data.name!.isNotEmpty)
      return AddPersSimpleResolver.name(data);

    return null;
  }

  final double textSize;
  final Color? textColor;
  final bool showSongCount;
  final void Function()? onSongCountTap;

  const AddPersEmailResolver({this.textSize = Dimen.TEXT_SIZE_NORMAL, this.textColor, this.showSongCount = true, this.onSongCountTap});

  @override
  Widget build(BuildContext context, AddPerson data){
    
    if(data.emailRef != null && allPeopleByEmailMap.containsKey(data.emailRef)) {

      if(!showSongCount)
        return PersonCard(
            allPeopleByEmailMap[data.emailRef],
            textSize: textSize,
            textColor: textColor ?? hintEnab_(context)
        );

      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Expanded(
              child: PersonCard(
                  allPeopleByEmailMap[data.emailRef],
                  textSize: textSize,
                  textColor: textColor ?? hintEnab_(context)
              ),
            ),

            GestureDetector(
              onTap: onSongCountTap,
              child: Container( // This is needed for some reason to make the gesture control pick up event outside the Text and Icon widgets.
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      '${Song.addPersRankingByEmail[data.emailRef]!.length}',
                      style: AppTextStyle(
                          fontSize: textSize,
                          fontWeight: weight.halfBold,
                          color: textColor ?? hintEnab_(context)
                      ),
                    ),
                    const SizedBox(width: Dimen.defMarg),
                    Icon(MdiIcons.music, size: textSize, color: textColor ?? hintEnab_(context)),
                    const SizedBox(width: 2*Dimen.defMarg),

                  ],
                ),
              )
            ),

          ],
        ));
    }else if(data.name != null && data.name!.isNotEmpty)
      return AddPersSimpleResolver(textSize: textSize, textColor: textColor).build(context, data);

    logger.e('All null addPers found. Use null instead.');
    return Container();

  }

}