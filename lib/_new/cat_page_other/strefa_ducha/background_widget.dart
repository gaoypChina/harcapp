
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:harcapp/_common_classes/blur.dart';
import 'package:harcapp/_new/cat_page_other/strefa_ducha/providers.dart';
import 'package:provider/provider.dart';

class Background extends StatelessWidget{

  final ValueNotifier notifier;
  const Background(this.notifier);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        Consumer<FadeImageProvider>(
          builder: (context, prov, child){

            return Stack(
              children: [

                /*
                Positioned.fill(
                  child: Image(
                    image: ImageLoader.emptyImage,
                    fit: BoxFit.cover,
                  ),
                ),
                 */

                if(prov.currImage!=null)
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: prov.currImage,
                      ),
                    ),
                  ),

                if(prov.prevImage!=null)
                  AnimatedBuilder(
                    animation: notifier,
                    builder: (context, child) => Opacity(
                      opacity: max(0, min(1, prov.currIdx - notifier.value)),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: prov.prevImage,
                          ),
                        ),
                      ),
                    ),
                  ),

                if(prov.nextImage!=null)
                  AnimatedBuilder(
                      animation: notifier,
                      builder: (context, child){

                        double opacity = max(0, min(1, notifier.value-prov.currIdx));
                        //print(opacity);

                        return Opacity(
                          opacity: opacity,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: prov.nextImage,
                              ),
                            ),
                          ),
                        );
                      }
                  ),
              ],
            );
          },
        ),

        Consumer<LockProvider>(
          builder: (context, prov, child) => Blur(
              sigma: 25,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(prov.locked?0.5:0.15),
              )
          ),
        ),

      ],
    );
  }
}