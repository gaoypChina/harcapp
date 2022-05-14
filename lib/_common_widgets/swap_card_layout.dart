import 'dart:math';

import 'package:flutter/material.dart';

List<Size> _cardSizes = [];
List<Alignment> _cardAligns = [];

/// A Tinder-Like Widget.
class SwapCardLayout extends StatefulWidget {
  late CardBuilder _cardBuilder;
  late int _totalNum;
  late int _stackNum;
  late int _animDuration;
  double? _swipeEdge;
  bool? _allowVerticalMovement;
  CardSwipeCompleteCallback? swipeCompleteCallback;
  CardDragUpdateCallback? swipeUpdateCallback;
  CardController? cardController;

//  double _maxWidth;
//  double _minWidth;
//  double _maxHeight;
//  double _minHeight;

  @override
  _SwapCardLayoutState createState() => _SwapCardLayoutState();

  /// Constructor requires Card Widget Builder [cardBuilder] & your card count [totalNum]
  /// , option includes: stack orientation [orientation], number of card display in same time [stackNum]
  /// , [swipeEdge] is the edge to determine action(recover or swipe) when you release your swiping card
  /// it is the value of alignment, 0.0 means middle, so it need bigger than zero.
  /// , and size control params;
  SwapCardLayout(
      {required CardBuilder cardBuilder,
        required int totalNum,
        AmassOrientation orientation = AmassOrientation.BOTTOM,
        int stackNum = 3,
        int animDuration = 800,
        double swipeEdge = 3.0,
        required double maxWidth,
        required double maxHeight,
        required double minWidth,
        required double minHeight,
        bool allowVerticalMovement = true,
        this.cardController,
        this.swipeCompleteCallback,
        this.swipeUpdateCallback,
        Key? key}):super(key: key)
//        this._maxWidth = maxWidth,
//        this._minWidth = minWidth,
//        this._maxHeight = maxHeight,
//        this._minHeight = minHeight
  {

    this._cardBuilder = cardBuilder;
    this._totalNum = totalNum;
    assert(stackNum > 1);
    this._stackNum = stackNum;
    this._animDuration = animDuration;
    assert(swipeEdge > 0);
    this._swipeEdge = swipeEdge;
    assert(maxWidth > minWidth && maxHeight > minHeight);
    this._allowVerticalMovement = allowVerticalMovement;

    double widthGap = maxWidth - minWidth;
    double heightGap = maxHeight - minHeight;

    _cardAligns = [];
    _cardSizes = [];

    for (int i = 0; i < _stackNum; i++) {
      _cardSizes.add(Size(minWidth + (widthGap / _stackNum) * i,
          minHeight + (heightGap / _stackNum) * i));

      switch (orientation) {
        case AmassOrientation.BOTTOM:
          _cardAligns.add(
              Alignment(0.0, (0.5 / (_stackNum - 1)) * (stackNum - i)));
          break;
        case AmassOrientation.TOP:
          _cardAligns.add(
              Alignment(0.0, (-0.5 / (_stackNum - 1)) * (stackNum - i)));
          break;
        case AmassOrientation.LEFT:
          _cardAligns.add(
              Alignment((-0.5 / (_stackNum - 1)) * (stackNum - i), 0.0));
          break;
        case AmassOrientation.RIGHT:
          _cardAligns.add(
              Alignment((0.5 / (_stackNum - 1)) * (stackNum - i), 0.0));
          break;
      }
    }
  }
}

class _SwapCardLayoutState extends State<SwapCardLayout>
    with SingleTickerProviderStateMixin {
  Alignment? frontCardAlign;
  late AnimationController _animationController;
  late int _currentFront;
  static int? _trigger; // 0: no trigger; -1: trigger left; 1: trigger right

  double? get _swipeEdge => widget.cardController==null || widget.cardController!.swipable?widget._swipeEdge:double.infinity;

  Widget _buildCard(BuildContext context, int realIndex) {
    if (realIndex < 0) {
      return Container();
    }
    int index = realIndex - _currentFront;

    if (index == widget._stackNum - 1) {
      return Align(
        alignment: _animationController.status == AnimationStatus.forward
            ? frontCardAlign = CardAnimation.frontCardAlign(
            _animationController,
            frontCardAlign,
            _cardAligns[widget._stackNum - 1],
            _swipeEdge)
            .value
            : frontCardAlign!,
        child: Transform.rotate(
            angle: (pi / 180.0) *
                (_animationController.status == AnimationStatus.forward
                    ? CardAnimation.frontCardRota(
                    _animationController, frontCardAlign!.x)
                    .value
                    : frontCardAlign!.x),
            child: SizedBox.fromSize(
              size: _cardSizes[index],
              child: widget._cardBuilder(
                  context, widget._totalNum - realIndex - 1),
            )),
      );
    }

    return Align(
      alignment: _animationController.status == AnimationStatus.forward &&
          (frontCardAlign!.x > 3.0 || frontCardAlign!.x < -3.0)
          ? CardAnimation.backCardAlign(_animationController,
          _cardAligns[index], _cardAligns[index + 1])
          .value
          : _cardAligns[index],
      child: SizedBox.fromSize(
        size: _animationController.status == AnimationStatus.forward &&
            (frontCardAlign!.x > 3.0 || frontCardAlign!.x < -3.0)
            ? CardAnimation.backCardSize(_animationController,
            _cardSizes[index], _cardSizes[index + 1])
            .value
            : _cardSizes[index],
        child: widget._cardBuilder(context, widget._totalNum - realIndex - 1),
      ),
    );
  }

  List<Widget> _buildCards(BuildContext context) {
    List<Widget> cards = [];
    for (int i = _currentFront; i < _currentFront+ widget._stackNum; i++) {
      cards.add(_buildCard(context, i));
    }

    cards.add(SizedBox.expand(
      child: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            if (widget._allowVerticalMovement == true) {
              frontCardAlign = Alignment(
                  frontCardAlign!.x +
                      details.delta.dx * 20 / MediaQuery.of(context).size.width,
                  frontCardAlign!.y +
                      details.delta.dy *
                          30 /
                          MediaQuery.of(context).size.height);
            } else {
              frontCardAlign = Alignment(
                  frontCardAlign!.x +
                      details.delta.dx * 20 / MediaQuery.of(context).size.width,
                  0);

              if (widget.swipeUpdateCallback != null) {
                widget.swipeUpdateCallback!(details, frontCardAlign);
              }
            }

            if (widget.swipeUpdateCallback != null) {
              widget.swipeUpdateCallback!(details, frontCardAlign);
            }
          });
        },
        onPanEnd: (DragEndDetails details) {
          animateCards(0);
        },
      ),
    ));
    return cards;
  }

  animateCards(int trigger) {
    if (_animationController.isAnimating ||
        _currentFront+ widget._stackNum == 0) {
      return;
    }
    _trigger = trigger;
    _animationController.stop();
    _animationController.value = 0.0;
    _animationController.forward();
  }

  void triggerSwap(int trigger) {
    animateCards(trigger);
  }

  @override
  void initState() {
    super.initState();
    _currentFront = widget._totalNum - widget._stackNum;

    frontCardAlign = _cardAligns[_cardAligns.length - 1];
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget._animDuration));
    _animationController.addListener(() => setState(() {}));
    _animationController.addStatusListener((AnimationStatus status) {
      int index = widget._totalNum - widget._stackNum - _currentFront;

      if (status == AnimationStatus.completed) {
        if (frontCardAlign!.x < _swipeEdge! &&
            frontCardAlign!.x > -_swipeEdge!) {
          frontCardAlign = _cardAligns[widget._stackNum - 1];

          if (widget.swipeCompleteCallback != null) {
            widget.swipeCompleteCallback!(CardSwipeOrientation.RECOVER, index);
          }
        } else {
          if (widget.swipeCompleteCallback != null) {
            widget.swipeCompleteCallback!(
                frontCardAlign!.x < 0
                    ? CardSwipeOrientation.LEFT
                    : CardSwipeOrientation.RIGHT,
                index);

          }

          changeCardOrder();
        }


      }

    });
  }

  @override
  Widget build(BuildContext context) {
    widget.cardController?.addListener((trigger) => triggerSwap(trigger));

    return Stack(children: _buildCards(context));
  }

  changeCardOrder() {
    setState(() {
      _currentFront--;
      frontCardAlign = _cardAligns[widget._stackNum - 1];
    });
  }
}

typedef Widget CardBuilder(BuildContext context, int index);

enum CardSwipeOrientation { LEFT, RIGHT, RECOVER }

/// swipe card to [CardSwipeOrientation.LEFT] or [CardSwipeOrientation.RIGHT]
/// , [CardSwipeOrientation.RECOVER] means back to start.
typedef CardSwipeCompleteCallback = void Function(
    CardSwipeOrientation orientation, int index);

/// [DragUpdateDetails] of swiping card.
typedef CardDragUpdateCallback = void Function(
    DragUpdateDetails details, Alignment? align);

enum AmassOrientation { TOP, BOTTOM, LEFT, RIGHT }

class CardAnimation {
  static Animation<Alignment> frontCardAlign(AnimationController controller,
      Alignment? beginAlign, Alignment baseAlign, double? swipeEdge) {
    double endX, endY;

    if (_SwapCardLayoutState._trigger == 0) {
      endX = beginAlign!.x > 0
          ? (beginAlign.x > swipeEdge! ? beginAlign.x + 10.0 : baseAlign.x)
          : (beginAlign.x < -swipeEdge! ? beginAlign.x - 10.0 : baseAlign.x);
      endY = beginAlign.x > 3.0 || beginAlign.x < -swipeEdge
          ? beginAlign.y
          : baseAlign.y;
    } else if (_SwapCardLayoutState._trigger == -1) {
      endX = beginAlign!.x - swipeEdge!;
      endY = beginAlign.y + 0.5;
    } else {
      endX = beginAlign!.x + swipeEdge!;
      endY = beginAlign.y + 0.5;
    }
    return AlignmentTween(begin: beginAlign, end: Alignment(endX, endY))
        .animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<double> frontCardRota(
      AnimationController controller, double beginRot) {
    return Tween(begin: beginRot, end: 0.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<Size?> backCardSize(
      AnimationController controller, Size beginSize, Size endSize) {
    return SizeTween(begin: beginSize, end: endSize).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  static Animation<Alignment> backCardAlign(AnimationController controller,
      Alignment beginAlign, Alignment endAlign) {
    return AlignmentTween(begin: beginAlign, end: endAlign).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }
}

typedef TriggerListener = void Function(int trigger);

class CardController {
  TriggerListener? _listener;

  bool _swipable = true;
  bool get swipable => _swipable;
  set swipable(value) => _swipable = value;

  CardController({bool swipable:true}){_swipable = swipable;}

  void triggerLeft() {
    if (_listener != null) {
      _listener!(-1);
    }
  }

  void triggerRight() {
    if (_listener != null) {
      _listener!(1);
    }
  }

  void addListener(listener) {
    _listener = listener;
  }

  void removeListener() {
    _listener = null;
  }
}