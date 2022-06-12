import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_widgets/app_text.dart';
import 'package:harcapp/_common_widgets/bottom_sheet.dart';
import 'package:harcapp/values/colors.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/title_show_row_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';

import '../../details/app_settings.dart';

class ChildMetodyki extends StatelessWidget{

  const ChildMetodyki({super.key});

  @override
  Widget build(BuildContext context) {

    Widget cardMetoZ = MetoButton(
      name: 'Zuchy',
      imagePath: 'assets/images/meto/meto_z.webp',
      age: '7-9 lat',
      leader: 'wódz',
      method: 'Zabawa w kogoś lub coś',
      color: AppColors.meto_z,
      onTap: () => showScrollBottomSheet(
        context: context,
        builder: (context) => BottomSheetMeto(
          color: AppSettings.isDark?cardEnab_(context):AppColors.meto_z,
          textColor: textEnab_(context),
          title: 'Zuchy',
          zalozenia: 'Charakterystyczną formą aktywności zuchów jest zabawa w kogoś lub w coś – realizowana zespołowo przez zdobywanie sprawności oraz podczas zbiórek gromady. Animatorem zabawy jest wódz zuchowy – drużynowy.',
          rola: 'Drużynowy jest wodzem w zabawie, inspiruje ją, koordynuje jej przebieg, ale też aktywnie w niej uczestniczy. Drużynowy dba o rozwój przybocznych i wychowuje następcę.',
          formy: '• Zabawa tematyczna\n• Zwiad zuchowy\n• Gawęda\n• Piosenka\n• Pląs\n• Zuchowe zwyczaje\n• Obrzędy i tajemnice\n• Majsterka\n• Zuchowy teatr\n• Pożyteczne prace\n• Gry i ćwiczenia',
          instrumenty: '• Gwiazdki zuchowe\n• Sprawności indywidualne\n• Sprawności zespołowe',
        ),

      ),
    );

    Widget cardMetoH = MetoButton(
      name: 'Harcerze',
      imagePath: 'assets/images/meto/meto_h.webp',
      age: '10-12 lat',
      leader: 'przywódca',
      method: 'Gra',
      color: AppColors.meto_h,
      onTap: () => showScrollBottomSheet(
        context: context,
        builder: (context) => BottomSheetMeto(
          color: AppSettings.isDark?cardEnab_(context):AppColors.meto_h,
          textColor: textEnab_(context),
          title: 'Harcerze',
          zalozenia: 'Charakterystyczną formą aktywności w tej grupie metodycznej jest gra - przyswajanie technik harcerskich, nabywanie wiedzy i umiejętności, oraz towarzyszące temu współzawodnictwo.',
          rola: 'Drużynowy jest przywódcą i autorytetem. Inicjuje przedsięwzięcia realizowane w drużynie. Kieruje zastępem zastępowych. Drużynowy dba o rozwój przybocznych i wychowuje następcę.',
          formy: '• Gra terenowa\n• Biwak\n• Rajd\n• Zwiad\n• Ognisko\n• Zbiórka tematyczna\n• Bieg harcerski\n• Obóz\n• Manewry\n• Capstrzyk\n• Musztra',
          instrumenty: '• Próba harcerki/harcerza\n• Stopnie harcerskie\n• Sprawności (*, **)\n• Zadania zespołowe',
        ),
      ),
    );

    Widget cardMetoHS = MetoButton(
      name: 'Harcerze starsi',
      imagePath: 'assets/images/meto/meto_hs.webp',
      age: '13-15 lat',
      leader: 'przewodnik',
      method: 'Poszukiwanie',
      color: AppColors.meto_hs,
      onTap: () => showScrollBottomSheet(
        context: context,
        builder: (context) => BottomSheetMeto(
          color: AppSettings.isDark?cardEnab_(context):AppColors.meto_hs,
          textColor: AppSettings.isDark?textEnab_(context):Colors.white,
          title: 'Harcerze starsi',
          zalozenia: 'Charakterystyczną formą aktywności harcerek starszych i harcerzy starszych jest poszukiwanie, polegające na przewartościowywaniu dotychczasowego sposobu patrzenia na świat i autorytety. O programie i działaniach drużyny decyduje rada drużyny.',
          rola: 'Drużynowy jest przewodnikiem w poszukiwaniach, W istotny sposób wpływa na program drużyny i jej organizację. Świadomie część decyzji powierza radzie drużyny. Drużynowy dba o rozwój przybocznych i wychowuje następcę.',
          formy: '• Wycieczka\n• Zwiad\n• Formy dyskusyjne\n• Zbiórka tematyczna\n• Zajęcia specjalnościowe\n• Obóz letni\n• Obóz tematyczny\n• Obóz zagraniczny',
          instrumenty: '• Próba harcerki/harcerza\n• Stopnie harcerskie\n• Sprawności (**, ***)\n• Projekt',
        ),
      ),
    );

    Widget cardMetoW = MetoButton(
      name: 'Wędrownicy',
      imagePath: 'assets/images/meto/meto_w.webp',
      age: '16-21 lat',
      leader: 'lider',
      method: 'Wyczyn',
      color: AppColors.meto_w,
      onTap: () => showScrollBottomSheet(
        context: context,
        builder: (context) => BottomSheetMeto(
          color: AppSettings.isDark?cardEnab_(context):AppColors.meto_w,
          textColor: Colors.white,
          title: 'Wędrownicy',
          zalozenia: 'Charakterystyczną formą aktywności wędrowniczek i wędrowników  jest służba realizowana wewnątrz organizacji i poza nią. Zadania realizowane indywidualnie lub zespołowo mają charakter wyczynu. W działalności wędrowniczej ważne miejsce zajmują specjalności i specjalizacje, pozwalające na rozwijanie indywidualnych zainteresowań. O programie pracy drużyny i podejmowanych zadaniach decyduje cała drużyna.',
          rola: 'Drużynowy jest liderem i koordynatorem działań wszystkich członków drużyny.  Motywuje ich do działania i wspiera w samorozwoju. Drużynowy jest pierwszym wśród równych. Zasadą jest wybieralność drużynowego przez drużynę. Pozycja drużynowego zależy od jego autorytetu jako lidera grupy oraz zaufania, jakim został obdarzony przez członków drużyny. Formalnie jego miejsce w zespole określa konstytucja drużyny.',
          formy: '• Wędrówka\n• Kuźnica\n• Sesja popularnonaukowa\n• Sejmik\n• Sąd nad sprawą\n• Warsztaty, kursy\n• Gry strategiczne\n• Ogniobranie\n• Obóz',
          instrumenty: '• Próba wędrownicza\n• Stopnie harcerskie\n• Sprawności, uprawnienia, odznaki itp.\n• Znaki służb\n• Stopnie instruktorskie',
        ),
      ),
    );

    return MediaQuery.of(context).orientation == Orientation.portrait?
    ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(Dimen.SIDE_MARG),
      children: <Widget>[
        cardMetoZ,
        const SizedBox(height: Dimen.SIDE_MARG),
        cardMetoH,
        const SizedBox(height: Dimen.SIDE_MARG),
        cardMetoHS,
        const SizedBox(height: Dimen.SIDE_MARG),
        cardMetoW,
      ],):
    Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: cardMetoZ
              ),
              Expanded(
                flex: 1,
                child: cardMetoH,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: cardMetoHS
              ),
              Expanded(
                  flex: 1,
                  child: cardMetoW
              ),
            ],
          )
        ]
    );

  }
}

class BottomSheetMeto extends BottomSheetDef{
  BottomSheetMeto({
    required Color? color,
    required String title,
    required String zalozenia,
    required String rola,
    required String formy,
    required String instrumenty,
    Color? textColor
  }) : super(
      title: title,
      color: color,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Założenia ogólne:', style: AppTextStyle(color: textColor??textEnab_(context), fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.DEF_MARG),
          Text(zalozenia, style: AppTextStyle(color: textColor??textEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG)),

          const SizedBox(height: 2*Dimen.ICON_MARG),
          Text('Rola drużynowego:', style: AppTextStyle(color: textColor??textEnab_(context), fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.DEF_MARG),
          Text(rola, style: AppTextStyle(color: textColor??textEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG)),

          const SizedBox(height: 2*Dimen.ICON_MARG),
          Text('Formy pracy:', style: AppTextStyle(color: textColor??textEnab_(context), fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.DEF_MARG),
          Text(formy, style: AppTextStyle(color: textColor??textEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG)),

          const SizedBox(height: 2*Dimen.ICON_MARG),
          Text('Instrumenty metodyczne:', style: AppTextStyle(color: textColor??textEnab_(context), fontWeight: weight.halfBold, fontSize: Dimen.TEXT_SIZE_BIG)),
          const SizedBox(height: Dimen.DEF_MARG),
          Text(instrumenty, style: AppTextStyle(color: textColor??textEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG))
        ],
      ),
      textColor: textColor
  );

}

class MetoButton extends StatelessWidget{

  final String name;
  final String imagePath;
  final String age;
  final String leader;
  final String method;
  final Color color;

  final void Function() onTap;

  const MetoButton({
    required this.name,
    required this.imagePath,
    required this.age,
    required this.leader,
    required this.method,
    required this.color,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        TitleShortcutRowWidget(
          title: name,
          textAlign: TextAlign.start,
          onOpen: onTap,
        ),

        Row(
          children: <Widget>[

            Expanded(
                flex: 2,
                child: AppCard(
                    padding: EdgeInsets.zero,
                    color: color,
                    radius: AppCard.BIG_RADIUS,
                    child: Image.asset(imagePath)
                )
            ),

            const SizedBox(width: Dimen.SIDE_MARG),

            Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Row(
                      children: [
                        //Icon(MdiIcons.cake, color: hintEnab_(context)),
                        //SizedBox(width: Dimen.ICON_MARG),
                        AppText('Wiek: <b>$age</b>', size: Dimen.TEXT_SIZE_BIG),
                      ],
                    ),
                    const SizedBox(height: Dimen.ICON_MARG),
                    Row(
                      children: [
                        //Icon(MdiIcons.accountStarOutline, color: hintEnab_(context)),
                        //SizedBox(width: Dimen.ICON_MARG),
                        AppText('Drużynowy: <b>$leader</b>', size: Dimen.TEXT_SIZE_BIG),
                      ],
                    ),
                    const SizedBox(height: Dimen.ICON_MARG),
                    Row(
                      children: [
                        //Icon(MdiIcons.toolboxOutline, color: hintEnab_(context)),
                        //SizedBox(width: Dimen.ICON_MARG),
                        AppText('Forma: <b>$method</b>', size: Dimen.TEXT_SIZE_BIG,),
                      ],
                    )

                  ],
                )
            ),


          ],
        ),

      ],
    );
  }

}