import 'package:flutter/material.dart';
import 'package:harcapp/_app_common/common_color_data.dart';
import 'package:harcapp/_new/cat_page_home/competitions/indiv_comp/models/indiv_comp_profile.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_toast.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tuple/tuple.dart';

import '../../../../../_common_widgets/gradient_icon.dart';
import '../../../../details/app_settings.dart';
import '../models/show_rank_data.dart';

void _showPopularity(BuildContext context, IndivCompProfile profile, bool showPercent, int? activeParticipCnt){

  String text;

  if(profile.rank == null){
    showAppToast(context, text: 'Nie bierzesz udziału we współzawodnictwie', duration: const Duration(seconds: 8));
    return;
  }
  
  if(profile.rank!.rangeData != null) {

    double rangeTop = profile.rank?.rangeData?.rangeTop??0;
    double rangeBottom = profile.rank?.rangeData?.rangeBottom??0;

    if(showPercent)
      text = 'Między <b>${(rangeTop * 100).toInt()}%</b>, a <b>${(rangeBottom * 100).toInt()}%</b> uczestników ma wyższą pozycję w rankingu od Ciebie';
    else
      text = 'Twoje miejsce w rankingu jest między <b>${(rangeTop * activeParticipCnt!).toInt()}</b>, a <b>${(rangeBottom * activeParticipCnt).toInt()}</b>';

    showAppToast(context, text: text, duration: const Duration(seconds: 8));
    return;
  }else
    text = 'Jesteś na <b>${profile.rank?.specificData?.showRank} miejscu</b> w rankingu uczestników';

  text += '\n\n';

  // Rank popularity.
  String pointsWord;
  if(profile.points == 1)
    pointsWord = '${profile.points} punkt';
  else if(profile.points! >= 2 && profile.points! <= 4)
    pointsWord = '${profile.points} punkty';
  else
    pointsWord = '${profile.points} punktów';

  int rankPop = (profile.rank?.specificData?.popularity??0) - 1;
  if(rankPop == 0)
    text += 'Tylko Ty masz $pointsWord';
  else if(rankPop == 1)
    text += 'Jeszcze 1 osoba ma $pointsWord';
  else if(rankPop >= 2 && rankPop <= 4)
    text += 'Jeszcze $rankPop osoby mają $pointsWord';
  else
    text += 'Jeszcze $rankPop osób ma $pointsWord';

  showAppToast(context, text: text, duration: const Duration(seconds: 8));

}

class IndivCompRankTopIcon extends StatelessWidget{

  final int rank;
  final Color colorStart;
  final Color colorEnd;
  final double size;

  const IndivCompRankTopIcon(
      { this.size = 56,
        required this.rank,
        required this.colorStart,
        required this.colorEnd,
        super.key
      });

  Color get borderColor => (AppSettings.isDark?Colors.white:Colors.black).withOpacity(.04);

  @override
  Widget build(BuildContext context) => Stack(
    children: [

      GradientIcon(
        MdiIcons.trophyVariant,
        colorStart: colorStart,
        colorEnd: colorEnd,
        size: size,
      ),

      Icon(
        MdiIcons.trophyVariantOutline,
        color: borderColor,
        size: size,
      ),

      SizedBox(
          height: .8*size,
          width: size,
          child: Center(
            child: Text(
              '$rank',
              style: AppTextStyle(
                  color: background_(context),
                  fontSize: size/2.8,
                  fontWeight: weight.halfBold
              ),
            ),
          )
      )

    ],
  );

}

class IndivCompRankFirstIcon extends StatelessWidget{

  final double size;
  const IndivCompRankFirstIcon({this.size = 56, super.key});

  @override
  Widget build(BuildContext context) => IndivCompRankTopIcon(
    rank: 1,
    colorStart: Colors.yellow[200]!,
    colorEnd: Colors.amber[700]!,
    size: size,
  );

}

class IndivCompRankSecondIcon extends StatelessWidget{

  final double size;
  const IndivCompRankSecondIcon({this.size = 56, super.key});

  @override
  Widget build(BuildContext context) => IndivCompRankTopIcon(
    rank: 2,
    colorStart: Colors.white,
    colorEnd: Colors.blueGrey,
    size: size,
  );

}

class IndivCompRankThirdIcon extends StatelessWidget{

  final double size;
  const IndivCompRankThirdIcon({this.size = 56, super.key});

  @override
  Widget build(BuildContext context) => IndivCompRankTopIcon(
    rank: 3,
    colorStart: Colors.orange,
    colorEnd: Colors.brown[900]!,
    size: size,
  );

}


class IndivCompRankOtherIcon extends StatelessWidget{

  /*
  To show a RankOtherIcon without a number, set arg. profile = null
  */

  //final IndivCompProfile profile;
  //final int? showRank;
  //final Tuple2<double, double>? showRankRange;

  final ShowRankData rank;

  final int? activeParticipCnt;
  final bool? showPercent;

  final CommonColorData? colors;
  final double size;
  const IndivCompRankOtherIcon({
    //required this.showRank,
    //required this.showRankRange,
    required this.rank,
    required this.activeParticipCnt,
    this.showPercent = false,

    required this.colors,
    this.size = 56,
    super.key});

  Color get borderColor => (AppSettings.isDark?Colors.white:Colors.black).withOpacity(.08);

  double get scaledSize => .9*size;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: size,
    height: size,
    child: Center(
      child: Stack(
        children: [

          Positioned(
            left: 0,
            right: 0,
            bottom: -.085*size,
            child: Center(
              child: GradientIcon(
                MdiIcons.bookmark,
                colorStart: colors!.colorEnd,
                colorEnd: colors!.colorStart,
                size: .6*scaledSize,
              )
            )
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: -.085*size,
            child: Center(
              child: Icon(
                MdiIcons.bookmark,
                color: borderColor,
                size: .6*scaledSize,
              )
            )
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: -.085*size,
            child: Icon(
              MdiIcons.bookmarkOutline,
              color: borderColor,
              size: .6*scaledSize,
            ),
          ),

          SizedBox(
            height: size,
            child: Stack(
              children: [

                if(rank.specificData == null && rank.rangeData != null && showPercent!)
                  Positioned(
                    bottom: -.02*size,
                    right: -.02*size,
                    child: Text('%', style: AppTextStyle(
                      fontSize: .3*size,
                      fontWeight: weight.bold,
                      color: colors!.moreVisible
                    )),
                  ),

                Center(
                  child: GradientIcon(
                    MdiIcons.octagram,
                    colorStart: colors!.colorStart,
                    colorEnd: colors!.colorEnd,
                    size: scaledSize,
                  ),
                ),

                Center(
                  child: Icon(
                    MdiIcons.octagramOutline,
                    color: borderColor,
                    size: scaledSize,
                  ),
                ),

                if(rank.specificData != null)
                  Positioned.fill(
                      child: Center(
                        child: Text(
                          '${rank.specificData?.showRank==-1?'∞':rank.specificData?.showRank}',
                          style: AppTextStyle(
                              color: background_(context),
                              fontSize: size/2.8,
                              fontWeight: weight.halfBold
                          ),
                        ),
                      )
                  )
                else if(rank.rangeData != null)
                  Positioned.fill(
                      child: Center(
                        child: _RangeAnimatorWidget(
                            Tuple2(rank.rangeData?.rangeTop??0, rank.rangeData?.rangeBottom??0),
                            activeParticipCnt,
                            showPercent,
                            size
                        ),
                      )
                  )

              ],
            ),
          )

        ],
      ),
    ),
  );

}

class _RangeAnimatorWidget extends StatefulWidget{

  final Tuple2<double, double>? range;
  final int? activeParticipCnt;
  final bool? showPercent;
  final double size;

  const _RangeAnimatorWidget(this.range, this.activeParticipCnt, this.showPercent, this.size);

  @override
  State<StatefulWidget> createState() => _RangeAnimatorWidgetState();

}

class _RangeAnimatorWidgetState extends State<_RangeAnimatorWidget>{

  static const Duration _animDuration = Duration(milliseconds: 700);
  static const Curve _animCurve = Curves.easeOutQuint;

  Tuple2<double, double>? get range => widget.range;
  int? get activeParticipCnt => widget.activeParticipCnt;
  bool? get showPercent => widget.showPercent;
  double get size => widget.size;

  PageController? controller;
  late String page1Text;
  late String page2Text;

  void run() async{
    while(true){
      await Future.delayed(const Duration(milliseconds: 2200));
      if(!mounted) return;
      controller!.animateToPage(
          controller!.page==0?2:0,
          duration: _animDuration,
          curve: _animCurve
      );
    }
  }

  @override
  void initState() {

    page1Text =
    showPercent!?
    '${(range!.item1*100).toInt()}':
    '${(range!.item1*activeParticipCnt!).toInt()}';

    page2Text =
    showPercent!?
    '${(range!.item2*100).toInt()}':
    '${(range!.item2*activeParticipCnt!).toInt()}';

    controller = PageController();
    run();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    height: .3*size,
    width: .6*size,
    child: PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Center(
          child: Text(
            page1Text,
            style: AppTextStyle(
                fontSize: size/3.1,
                fontWeight: weight.halfBold,
                color: background_(context)
            ),
          ),
        ),
        Center(
          child: Text(
            '–',
            style: AppTextStyle(
                fontSize: size/3.1,
                fontWeight: weight.bold,
                color: background_(context)
            ),
          ),
        ),
        Center(
          child: Text(
            page2Text,
            style: AppTextStyle(
                fontSize: size/3.1,
                fontWeight: weight.halfBold,
                color: background_(context)
            ),
          ),
        ),
      ],
    ),
  );

}

class IndivCompRankIcon extends StatelessWidget{

  static const double defSize = 56;

  final IndivCompProfile profile;
  final int? activeParticipCnt;
  final bool showPercent;
  final CommonColorData? colors;
  final double size;
  final bool showPopularityOnTap;
  const IndivCompRankIcon(
      this.profile,
      { required this.activeParticipCnt,
        this.showPercent = false,
        required this.colors,
        this.size = defSize,
        this.showPopularityOnTap = false,
        super.key
      });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: showPopularityOnTap?() => _showPopularity(context, profile, showPercent, activeParticipCnt):null,
    child: Builder(
      builder: (context){
        if(profile.rank?.specificData?.showRank == 1)
          return IndivCompRankFirstIcon(size: size);
        else if(profile.rank?.specificData?.showRank == 2)
          return IndivCompRankSecondIcon(size: size);
        else if(profile.rank?.specificData?.showRank == 3)
          return IndivCompRankThirdIcon(size: size);
        else if(profile.rank != null)
          return IndivCompRankOtherIcon(
            rank: profile.rank!,
            activeParticipCnt: activeParticipCnt,
            showPercent: showPercent,
            colors: colors,
            size: size
          );
        else
          return Container();
      },
    ),
  );

}

class IndivCompRankIconTemplate extends StatelessWidget{

  final int rank;
  final CommonColorData? colors;
  final double size;
  const IndivCompRankIconTemplate(
      this.rank,
      { required this.colors,
        this.size = 56,
        super.key
      });

  @override
  Widget build(BuildContext context) {
    if(rank == 1)
      return IndivCompRankFirstIcon(size: size);
    else if(rank == 2)
      return IndivCompRankSecondIcon(size: size);
    else if(rank == 3)
      return IndivCompRankThirdIcon(size: size);
    else
      return IndivCompRankOtherIcon(
        rank: ShowRankData.fromShowRank(rank),
        activeParticipCnt: null,
        showPercent: null,
        colors: colors,
        size: size
      );
  }

}