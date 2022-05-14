import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../values/quote.dart';

class QuoteWidget extends StatefulWidget{

  final Quote? quote;
  final List<Quote>? quotes;

  const QuoteWidget({this.quote, this.quotes, Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => QuoteWidgetState();

}

class QuoteWidgetState extends State<QuoteWidget>{

  static const double textSize = 18.0;
  static const double iconSize = 64.0;

  Quote? cytat;
  late bool _showAuthor;

  Animation<Offset>? offsetQ;

  List<Quote>? get cytaty => widget.quotes;

  startAnimation() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() => _showAuthor = true);
  }

  @override
  void initState() {

    _showAuthor = false;

    if(widget.quote == null)
      cytat = cytaty![Random().nextInt(cytaty!.length)];
    else
      cytat = widget.quote;

    startAnimation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[

      const Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          MdiIcons.formatQuoteClose,
          size: 64.0,
          color: Colors.white,
        ),
      ),

      const SizedBox(height: 18.0),

      Text(
          cytat!.cytat,
          style: const TextStyle(
              fontFamily: 'Merriweather',
              fontSize: textSize,
              color: Colors.white,
              height: 1.3
          )
      ),

      const SizedBox(height: 32),
      AnimatedOpacity(
        opacity: _showAuthor?1.0:0.0,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Text(
            cytat!.autor==quoteAuthorNieznany?'':'~ ${cytat!.autor}',
            style: const TextStyle(
                fontFamily: 'Merriweather',
                color: Colors.white54,
                fontSize: textSize+2,
                fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.end,
          ),
        ), duration: const Duration(seconds: 2),
      ),
    ],
  );

}