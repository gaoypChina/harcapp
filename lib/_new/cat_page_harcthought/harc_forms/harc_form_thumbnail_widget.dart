import 'package:flutter/material.dart';
import 'package:harcapp/_common_classes/app_navigator.dart';
import 'package:harcapp/_common_widgets/gradient_icon.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';

import 'harc_form.dart';
import 'harc_form_widget.dart';

class FormThumbnailTagsWidget extends StatelessWidget{

  final HarcForm form;
  const FormThumbnailTagsWidget(this.form);

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];

    for(HarcFormTag tag in form.tags){
      children.add(Row(
        children: [

          Icon(tag.icon, size: Dimen.TEXT_SIZE_BIG + 2, color: hintEnab_(context)),

          SizedBox(width: Dimen.ICON_MARG),

          Text(
            tag.text,
            style: AppTextStyle(
              fontSize: Dimen.TEXT_SIZE_NORMAL,
              color: hintEnab_(context),
              fontWeight: weight.halfBold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

        ],
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );

  }

}

class FormThumbnailWidget extends StatelessWidget{

  final HarcForm form;

  const FormThumbnailWidget(this.form);

  @override
  Widget build(BuildContext context) => AspectRatio(
    aspectRatio: 2,
    child: Hero(
        tag: form,
        child: GradientWidget(
            colorStart: form.colorStart.withOpacity(.25),
            colorEnd: form.colorEnd.withOpacity(.25),
            radius: AppCard.bigRadius,
            child: InkWell(
                onTap: () => pushPage(context, builder: (context) => HarcFormWidget(form)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      GradientIcon(
                        form.icon,
                        colorStart: form.colorStart,
                        colorEnd: form.colorEnd,
                        size: 64.0,
                      ),

                      const SizedBox(width: Dimen.ICON_MARG),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              form.title,
                              style: AppTextStyle(
                                fontSize: Dimen.TEXT_SIZE_BIG,
                                color: iconEnab_(context),
                                fontWeight: weight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: Dimen.ICON_MARG),

                            FormThumbnailTagsWidget(form),

                            Expanded(child: Container()),

                            Builder(builder: (context){

                              List<Widget> children = [];
                              for(HarcFormMeto meto in form.meto)
                                children.add(Text(
                                  meto.text,
                                  style: AppTextStyle(
                                    fontWeight: weight.bold,
                                    color: meto.color,
                                    shadow: true
                                  ),
                                ));

                              return Row(mainAxisAlignment: MainAxisAlignment.end, children: children);

                            })

                          ],
                        ),
                      ),

                    ],
                  ),
                )
            )
        )

    ),
  );

}