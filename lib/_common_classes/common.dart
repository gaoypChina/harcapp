import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_new/app_bottom_navigator.dart';
import 'package:harcapp/_new/cat_page_harcthought/articles/providers.dart';
import 'package:harcapp/_new/cat_page_guide_book/providers.dart';
import 'package:harcapp/_new/cat_page_song_book/providers.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_new/cat_page_song_book/song_management/album.dart';
import 'package:harcapp/sync/synchronizer_engine.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack_provider.dart';
import 'package:harcapp_core/comm_classes/primitive_wrapper.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../_new/details/app_settings.dart';

const Duration pageJumpDuration = Duration(milliseconds: 200);
const Curve pageJumpCurve = Curves.easeOutQuint;

const int MAX_INT = 9223372036854775807;

class PrimitiveWrapperListenable<T> {

  late List<Function(T)> _listeners;

  T _value;
  PrimitiveWrapperListenable(this._value){
      _listeners = [];
  }

  T get(){return _value;}
  set(T value){
    _value = value;
      for(Function listener in _listeners)
        listener(value);
  }

  addListener(Function listener){
      _listeners.add(listener as dynamic Function(T));
  }
}



class ShadowDecoration extends BoxDecoration{

  static BoxShadow boxShadowDef({Color shadowColor = Colors.black26, Offset offset = const Offset(0.0, 3)}){
    return BoxShadow(
      color: shadowColor,
      blurRadius: 3.0,
      offset: offset
    );
  }

  ShadowDecoration({Color? backgroundColor, Color shadowColor = Colors.black26, Offset offset = const Offset(0.0, 3)}):super(
    color: backgroundColor,
    boxShadow: [boxShadowDef(shadowColor: shadowColor, offset: offset)],
  );
}

void bottomSheet(BuildContext context, Widget bottomSheet){
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(6.0))),
    builder: (BuildContext context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: bottomSheet
    )
  );
}

launchURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}

const double alertDialogMarginVal = 24.0;

class AlertDialogButton extends StatelessWidget{

  final String text;
  final Color? textColor;
  final bool enabled;
  final void Function() onTap;

  const AlertDialogButton({required this.text, this.textColor, this.enabled = true, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) => SimpleButton(
      radius: AppCard.BIG_RADIUS,
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      onTap: enabled?onTap:null,
      child: Text(text, style: AppTextStyle(fontWeight: weight.halfBold, color: textColor??(enabled?textEnab_(context):textDisab_(context)), fontSize: Dimen.TEXT_SIZE_BIG))
  );

}

Future<void> showAlertDialog(
    BuildContext context,
    { String? title,
      required String content,
      Widget? leading,
      List<Widget> Function(BuildContext context)? actionBuilder,
      bool dismissible = true,
    }) => openDialog(
      context: context,
      dismissible: dismissible,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title!, style: AppTextStyle(fontWeight: weight.halfBold)),
        content: Row(
          children: [
            if(leading != null) leading,
            Expanded(child: AppText(content, size: Dimen.TEXT_SIZE_BIG))
          ],
        ),
        actions: actionBuilder==null?null:actionBuilder(context),
        actionsPadding: const EdgeInsets.only(bottom: Dimen.ICON_MARG, right: Dimen.ICON_MARG),
        backgroundColor: cardEnab_(context),
        contentTextStyle: TextStyle(color: textEnab_(context)),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(AppCard.ALERT_DIALOG_RADIUS))),
      ),
    );

Future hideKeyboard(BuildContext context) async {
  FocusScopeNode focusScope = FocusScope.of(context);
  await SystemChannels.textInput.invokeMethod('TextInput.hide');
  focusScope.unfocus();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) => TextEditingValue(
    text: newValue.text.toUpperCase(),
    selection: newValue.selection,
  );
}


class NestedPageViewPhysics extends ScrollPhysics{

  final PrimitiveWrapper<PageController> _pageController;
  PageController controller() => _pageController.get();

  const NestedPageViewPhysics(this._pageController, {super.parent});

  @override
  NestedPageViewPhysics applyTo(ScrollPhysics? ancestor) =>
      NestedPageViewPhysics(_pageController, parent: buildParent(ancestor));

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {

    // underscroll
    if (value < position.pixels && position.pixels <= position.minScrollExtent){
      if(0 >= controller().position.pixels)
        return value - position.minScrollExtent;

      controller().jumpTo(controller().position.pixels + (value - position.pixels));

      return value - position.minScrollExtent;
    }

    // overscroll
    if (position.maxScrollExtent <= position.pixels && position.pixels < value) {
      if(controller().position.maxScrollExtent <= controller().position.pixels)
        return value - position.maxScrollExtent;

      controller().jumpTo(controller().position.pixels + (value - position.pixels));

      return value - position.maxScrollExtent;
    }

    // hit top edge
    if (value < position.minScrollExtent && position.minScrollExtent < position.pixels) {
      return value - position.minScrollExtent;
    }

    if (position.pixels < position.maxScrollExtent && position.maxScrollExtent < value) { // hit bottom edge
      return value - position.maxScrollExtent;
    }

    return 0.0;
  }
}

class DialogRoute extends PageRoute{

  Widget Function(BuildContext context) builder;
  bool dismissible;

  DialogRoute({required this.builder, this.dismissible = true});

  @override
  Color get barrierColor => AppColors.dialog_dim;

  @override
  String? get barrierLabel => null;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => dismissible;

  @override
  Curve get barrierCurve => Curves.easeInOut;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => SafeArea(
      top: !AppSettings.fullscreen,
      child: builder(context)
  );

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child
  ) => FadeTransition(
    opacity: animation,
    child: child,
  );

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 230);

}

Future<void> openDialog({
  required BuildContext context,
  required Widget Function(BuildContext context) builder,
  bool dismissible = true
}) => Navigator.push(
    context,
    DialogRoute(
      builder: builder,
      dismissible: dismissible,
    )
);

Future<void> factoryResetLocal(BuildContext context) async {

  AlbumProvider albumProvider = AlbumProvider.of(context);

  SprawSavedListProv sprawSavedListProv = SprawSavedListProv.of(context);
  SprawInProgressListProv sprawInProgressListProv = SprawInProgressListProv.of(context);
  SprawCompletedListProv sprawCompletedListProv = SprawCompletedListProv.of(context);

  RankProv rankProv = RankProv.of(context);

  BookmarkedArticlesProvider bookmarkedArticlesProvider = BookmarkedArticlesProvider.of(context);
  LikedArticlesProvider likedArticlesProvider = LikedArticlesProvider.of(context);
  AppBottomNavigatorProvider appBottomNavigatorProvider = AppBottomNavigatorProvider.of(context);
  ColorPackProvider colorPackProvider = ColorPackProvider.of(context);

  await synchronizer.reloadSyncables();

  ShaPref.clear();
  for(FileSystemEntity file in (await getApplicationDocumentsDirectory()).listSync())
    file.deleteSync(recursive: true);

  albumProvider.current = Album.omega;

  sprawSavedListProv.notify();
  sprawInProgressListProv.notify();
  sprawCompletedListProv.notify();

  rankProv.notify();

  bookmarkedArticlesProvider.clear();
  likedArticlesProvider.clear();

  appBottomNavigatorProvider.selectedIndex = AppBottomNavigatorProvider.initIndex;
  colorPackProvider.notify();

}

class PolishLettersComparator {
  final Map<String, int> map = {
    "0": -9,
    "1": -8,
    "2": -7,
    "3": -6,
    "4": -5,
    "5": -4,
    "6": -3,
    "7": -2,
    "8": -1,
    "9": 0,
    "A": 1,
    "a": 2,
    "Ą": 3,
    "ą": 4,
    "B": 5,
    "b": 6,
    "C": 7,
    "c": 8,
    "Ć": 9,
    "ć": 10,
    "D": 11,
    "d": 12,
    "E": 13,
    "e": 14,
    "Ę": 15,
    "ę": 16,
    "F": 17,
    "f": 18,
    "G": 19,
    "g": 20,
    "H": 21,
    "h": 22,
    "I": 23,
    "i": 24,
    "J": 25,
    "j": 26,
    "K": 27,
    "k": 28,
    "L": 29,
    "l": 30,
    "Ł": 31,
    "ł": 32,
    "M": 33,
    "m": 34,
    "N": 35,
    "n": 36,
    "Ń": 37,
    "ń": 38,
    "O": 39,
    "o": 40,
    "Ó": 41,
    "ó": 42,
    "P": 43,
    "p": 44,
    "R": 45,
    "r": 46,
    "S": 47,
    "s": 48,
    "Ś": 49,
    "ś": 50,
    "T": 51,
    "t": 52,
    "U": 53,
    "u": 54,
    "V": 55,
    "v": 56,
    "W": 57,
    "w": 58,
    "X": 59,
    "x": 60,
    "Y": 61,
    "y": 62,
    "Z": 63,
    "z": 64,
    "Ż": 65,
    "ż": 66,
    "Ź": 67,
    "ź": 68,
  };
  late int charAint;
  late int charBint;
  int compare(String a, String b) {
    int min = a.length;
    if (b.length < a.length) min = b.length;
    for (int i = 0; i < min; ++i) {
      String charA = a[i];
      String charB = b[i];
      charAint = map[charA]??(map.length + 1);
      charBint = map[charB]??(map.length + 1);

      if (charAint > charBint)
        return 1;
      else if (charAint < charBint) return -1;
    }
    if (a.length < b.length)
      return -1;
    else if (a.length > b.length) return 1;
    return 0;
  }
}