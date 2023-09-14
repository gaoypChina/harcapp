import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_new/cat_page_strefa_ducha/providers.dart';
import 'package:harcapp_core/comm_widgets/blur.dart';
import 'package:provider/provider.dart';

class Background extends StatelessWidget{

  final ValueNotifier notifier;
  const Background(this.notifier, {super.key});

  @override
  Widget build(BuildContext context) => Consumer<FadeImageProvider>(
    builder: (context, prov, child) => Stack(
      children: [

        if(prov.currImage!=null)
          BackgroundImage(prov.currImage),

        if(prov.prevImage!=null)
          AnimatedBuilder(
            animation: notifier,
            builder: (context, child) => Opacity(
              opacity: max(0, min(1, prov.currIdx - notifier.value as double)),
              child: BackgroundImage(prov.prevImage),
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
                  child: BackgroundImage(prov.nextImage),
                );
              }
          ),

        const BackgroundBlur(),

      ],
    )
  );
}

class BackgroundBlur extends StatelessWidget{

  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) => Consumer<LockProvider>(
    builder: (context, prov, child) => Blur(
        sigma: 25,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(prov.locked!?0.5:0.15),
        )
    ),
  );

}

class BackgroundImage extends StatelessWidget{

  final ImageProvider? image;

  const BackgroundImage(this.image, {super.key});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.fill,
        image: image!,
      ),
    ),
  );

}