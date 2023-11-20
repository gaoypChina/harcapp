import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/sliding_card.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:tuple/tuple.dart';

class ImageViewer extends StatelessWidget{

  final List<Tuple2<String, String>> imgSrc;
  final int initIndex;
  const ImageViewer(this.imgSrc, this.initIndex, {super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: () => Navigator.pop(context),
        child: SlidingPageView.builder(
          grow: true,
          physics: const BouncingScrollPhysics(),
          controller: PageController(initialPage: initIndex, viewportFraction: 0.8),
          itemCount: imgSrc.length,
          itemBuilder: (context, index){

            String imgPath = imgSrc[index].item1;
            String desc = imgSrc[index].item2;

            return Align(
              alignment: Alignment.center,
              child: Hero(
                tag: imgSrc[index],
                child: IntrinsicHeight(
                  child: AppCard(
                    //color: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: Dimen.ICON_MARG),
                      margin: const EdgeInsets.symmetric(vertical: Dimen.SIDE_MARG),
                      elevation: AppCard.bigElevation,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          const SizedBox(height: Dimen.SIDE_MARG),

                          Image.asset('assets/images/bio/$imgPath.webp', fit: BoxFit.fitWidth),

                          if(desc.isNotEmpty)
                            Expanded(child: SingleChildScrollView(
                              padding: const EdgeInsets.symmetric(vertical: Dimen.SIDE_MARG),
                              physics: const BouncingScrollPhysics(),
                              child: Text(
                                imgSrc[index].item2,
                                style: const TextStyle(fontFamily: 'Hand15'),
                              ),
                            ))
                          else
                            const SizedBox(height: Dimen.SIDE_MARG),

                        ],
                      )
                  ),
                ),
              ),
            );
          }
        )
    );
  }



}