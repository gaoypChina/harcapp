import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

import '../../_common_widgets/app_text.dart';
import '../../values/colors.dart';
import '../../values/fact.dart';
import 'quote_widget.dart';
import 'layouts.dart';

class FactWidget extends StatefulWidget{

  final List<Fact> allFacts;
  final IconData? icon;
  final String? Function(Fact?)? subtext;

  const FactWidget(this.allFacts, {this.icon, this.subtext, Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => FactWidgetState();

}

class FactWidgetState extends State<FactWidget>{

  List<Fact> get allFacts => widget.allFacts;
  IconData? get icon => widget.icon;
  String? Function(Fact?)? get subtext => widget.subtext;

  Fact? fact;

  @override
  void initState() {
    fact = allFacts[Random().nextInt(allFacts.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    String? subtext = this.subtext!(fact);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: QuoteWidgetState.iconSize,
            height: QuoteWidgetState.iconSize,
            child: Center(
              child: Icon(
                icon??MdiIcons.lightbulb,
                size: 38.0,
                color: Colors.white,
              ),
            ),
          ),
        ),

        const SizedBox(height: 18.0),

        Row(
          children: [
            const Expanded(
              child: Text(
                'Czy wiesz, że...',
                style: TextStyle(
                    fontFamily: 'Merriweather',
                    color: Colors.white,
                    fontSize: QuoteWidgetState.textSize+6,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            if(fact!.source != null || fact!.meaning != null)
              IconButton(
                  icon: const Icon(MdiIcons.bookArrowUpOutline, color: Colors.white54),
                  onPressed: () => showScrollBottomSheet(
                    context: context,
                    builder: (context) => BottomSheetDef(
                        color: AppColors.start_background_default,
                        colorEnd: Colors.teal,
                        childMargin: const EdgeInsets.all(32),
                        builder: (context) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if(fact!.meaning != null)
                              Text(
                                  'Co to oznacza?',
                                  style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_APPBAR,
                                      fontWeight: weight.bold,
                                      color: Colors.white54
                                  )
                              ),
                            if(fact!.meaning != null)
                              const SizedBox(height: Dimen.DEF_MARG),
                            if(fact!.meaning != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: fact!.meaning!.map((meaning) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: Dimen.DEF_MARG),
                                  child: Text(meaning, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: Colors.white54)),
                                )).toList(),
                              ),
                            if(fact!.meaning != null)
                              const SizedBox(height: 32),

                            Text(
                                'Źródło',
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                                    fontWeight: weight.bold,
                                    color: Colors.white54
                                )
                            ),
                            const SizedBox(height: 2*Dimen.DEF_MARG),
                            SelectableText(
                                fact!.source!,
                                style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_SMALL,
                                    color: Colors.white54
                                )
                            )
                          ],
                        )
                    ),
                  )
              )
          ],
        ),

        const SizedBox(height: 18.0),

        Text(
            fact!.text,
            style: AppTextStyle(
                fontSize: QuoteWidgetState.textSize, color: Colors.white, height: 1.3
            )
        ),

        if(subtext != null)
          const SizedBox(height: 2*Dimen.DEF_MARG),
        if(subtext != null)
          AppText(
            subtext,
            size: QuoteWidgetState.textSize,
            color: Colors.white54,
            height: 1.3,
          ),

        const SizedBox(height: Dimen.DEF_MARG),

      ],
    );

  }

}