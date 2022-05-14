import 'package:torch_light/torch_light.dart';
import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp/_common_classes/common.dart';
import 'package:harcapp/_common_classes/regex_input_formatter.dart';
import 'package:harcapp/_common_classes/sha_pref.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const letterUnknown = '?';

const String MORSE_DOT = '•';
const String MORSE_LINE = '—';
const String MORSE_BREAK = '/';

Map<String, String> lettersMap = {
  'A':'• — /',
  'B':'— • • • /',
  'C':'— • — • /',
  'D':'— • • /',
  'E':'• /',
  'F':'• • — • /',
  'G':'— — • /',
  'H':'• • • • /',
  'I':'• • /',
  'J':'• — — — /',
  'K':'— • — /',
  'L':'• — • • /',
  'M':'— — /',
  'N':'— • /',
  'O':'— — — /',
  'P':'• — — • /',
  'R':'• — • /',
  'S':'• • • /',
  'T':'— /',
  'U':'• • — /',
  'V':'• • • — /',
  'W':'• — — /',
  'X':'— • • — /',
  'Y':'— • — — /',
  'Z':'— — • • /',
  '1':'• — — — — /',
  '2':'• • — — — /',
  '3':'• • • — — /',
  '4':'• • • • — /',
  '5':'• • • • • /',
  '6':'— • • • • /',
  '7':'— — • • • /',
  '8':'— — — • • /',
  '9':'— — — — • /',
  '0':'— — — — — /',
  ' ':'/',
  '.':'/ /',
  '?':'? /'
};

late Map<String, String> reverseLettersMap;

class ChildMorseCommonValues{

  late String input;
  ChildMorseCommonValues(){
    input = '';
  }

}

class ChildMorse extends StatefulWidget{

  final ChildMorseCommonValues? commonVals;

  const ChildMorse(this.commonVals, {Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => ChildMorseState();

}

class ChildMorseState extends State<ChildMorse> with AutomaticKeepAliveClientMixin<ChildMorse>{

  @override
  bool get wantKeepAlive => true;

  String get _input => widget.commonVals!.input;
  set _input(String value) => widget.commonVals!.input = value;

  late String _additionalMorseLetter;

  TextEditingController? controller;

  @override
  void initState() {
    _input = '';
    _additionalMorseLetter = '';
    reverseLettersMap = {};
    for(String key in lettersMap.keys)
      reverseLettersMap[lettersMap[key]!.replaceAll(' ', '')] = key;

    controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: AppCard(
            radius: AppCard.BIG_RADIUS,
            elevation: AppCard.bigElevation,
            margin: const EdgeInsets.all(Dimen.DEF_MARG),
            child: TextField(
              controller: controller,
              textCapitalization: TextCapitalization.characters,
              inputFormatters: [
                UpperCaseTextFormatter(),
                RegExInputFormatter.withRegex(r'[AaĄąBbCcĆćDdEeĘęFfGgHhIiJjKkLlŁłMmNnŃńOoÓóPpRrSsŚśTtUuVvWwXxYyZzŹźŻż .]*'),
                RegExInputFormatter.withRegex(r'^(?! ).*'), // no ' ' at beginning
                RegExInputFormatter.withRegex(r'^(?!\.).*'), // no ' ' at beginning
                RegExInputFormatter.withRegex(r'^((?!\. ).)*$'),  // no '. '
                RegExInputFormatter.withRegex(r'^((?! \.).)*$'),  // no ' .'
                RegExInputFormatter.withRegex(r'^((?!  ).)*$'),  // no '  '
                RegExInputFormatter.withRegex(r'^((?!\.\.).)*$'),  // no '..'
              ],
              onChanged: (text) => setState(() => _input = text),
              decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Wpisz wiadomość',
                  hintStyle: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG),
                  border: InputBorder.none
              ),
              style: AppTextStyle(
                fontSize: Dimen.TEXT_SIZE_BIG,
              ),
            ),
          ),
        ),
        const SizedBox(height: Dimen.SIDE_MARG),
        Expanded(
          child: Padding(
            padding: AppCard.defPadding,
            child: SelectableText(generateOutput(_input!, additionalMorseLetter: _additionalMorseLetter), style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG)),
          ),
        ),
        AppCard(
          radius: AppCard.BIG_RADIUS,
          elevation: AppCard.bigElevation,
          margin: const EdgeInsets.all(Dimen.DEF_MARG),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: SimpleButton(
                    onTap: () => setState((){
                      hideKeyboard(context);
                      _additionalMorseLetter += MORSE_LINE;
                    }),
                    child: const Icon(MdiIcons.minus)
                ),
              ),
              Expanded(
                flex: 1,
                child: SimpleButton(
                    onTap: () => setState((){
                      hideKeyboard(context);

                      String latinLetter = decodeAdditionalMorse(_additionalMorseLetter);
                      _input += latinLetter;
                      controller!.text += latinLetter;
                      _additionalMorseLetter = '';
                    }),
                    child: const Icon(MdiIcons.slashForward)
                ),
              ),
              Expanded(
                flex: 2,
                child: SimpleButton(
                    onTap: () => setState((){
                      hideKeyboard(context);
                      _additionalMorseLetter += MORSE_DOT;
                    }),
                    child: const Icon(MdiIcons.circleMedium)
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  static String generateOutput(String input, {String? additionalMorseLetter}){
    input = remPolChars(input).toUpperCase();
    String output = '';
    for(int i=0; i<input.length; i++){
      String letter = input.substring(i, i+1);
      output += lettersMap[letter]! + ' ';
    }
    if(additionalMorseLetter!=null)
      output += additionalMorseLetter;
    else if(output.isNotEmpty)
      output = output.substring(0, output.length-1);

    return output;
  }

  static String decodeAdditionalMorse(String additionalMorseLetter){
    additionalMorseLetter += '/';
    additionalMorseLetter = additionalMorseLetter.replaceAll(' ', '');
    String? latinLetter = reverseLettersMap[additionalMorseLetter];

    if(latinLetter == null)
      latinLetter = letterUnknown;
    return latinLetter;
  }

}

class MorseFlash extends StatefulWidget{

  final ChildMorseCommonValues? commonVals;

  const MorseFlash(this.commonVals);

  @override
  State<StatefulWidget> createState() => MorseFlashState();

}

class MorseFlashState extends State<MorseFlash>{

  bool _hasFlashlight = false;

  late String code;
  int? signIdx;


  // false = off
  // true = morse
  // null = call
  bool? signalising;

  double get speed => shaPref!.getDouble(ShaPref.SHA_PREF_SZYFR_MORSE_SIGNAL_SPEED, 0.6);
  set speed(double value) => shaPref!.setDouble(ShaPref.SHA_PREF_SZYFR_MORSE_SIGNAL_SPEED, value);

  @override
  void initState() {
    initFlashlight();
    code = ChildMorseState.generateOutput(widget.commonVals!.input!);
    signalising = false;
    super.initState();
  }

  initFlashlight() async {
    bool hasFlash = await TorchLight.isTorchAvailable();
    print("Device has flash ? $hasFlash");
    setState(() => _hasFlashlight = hasFlash);
  }

  signalise()async{
    setState(() => signalising = true);
    for(int i=0; i<code.length; i++){
      if(mounted && signalising==true) setState(() => signIdx = i);
      else return;

      if(code[i] == MORSE_BREAK){
        await Future.delayed(Duration(milliseconds: (1700*(1.5 - speed)).round()));
        continue;
      }else if(code[i] == MORSE_DOT){
        if(signalising != true) return;
        await TorchLight.enableTorch();
        await Future.delayed(Duration(milliseconds: (200*(1.5 - speed)).round()));
        await TorchLight.disableTorch();
        await Future.delayed(Duration(milliseconds: (400*(1.5 - speed)).round()));
      }
      else if(code[i] == MORSE_LINE){
        if(signalising != true) return;
        await TorchLight.enableTorch();
        await Future.delayed(Duration(milliseconds: (1000*(1.5 - speed)).round()));
        await TorchLight.disableTorch();
        await Future.delayed(Duration(milliseconds: (400*(1.5 - speed)).round()));
      }

    }
    setState((){
      signalising = false;
      signIdx = null;
    });
  }

  call()async{
    while(signalising == null){
      await TorchLight.enableTorch();
      await Future.delayed(Duration(milliseconds: (400*(1.5 - speed)).round()));
      await TorchLight.disableTorch();
      await Future.delayed(Duration(milliseconds: (1700*(1.5 - speed)).round()));
    }
  }

  @override
  void dispose() {
    signalising = false;
    TorchLight.disableTorch();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

        if(_hasFlashlight == null)
          const AppCard(
            radius: AppCard.BIG_RADIUS,
            padding: const EdgeInsets.all(Dimen.ICON_MARG),
            margin: AppCard.normMargin,
            child: const EmptyMessageWidget(
              text: 'Ładowanie...',
              icon: MdiIcons.loading,
            ),
          )
        else if(!_hasFlashlight)
          const AppCard(
            radius: AppCard.BIG_RADIUS,
            padding: EdgeInsets.all(Dimen.ICON_MARG),
            margin: AppCard.normMargin,
            child: const EmptyMessageWidget(
              text: 'Brak latartki!',
              icon: MdiIcons.flashlightOff,
            ),
          )
        else
          AppCard(
            radius: AppCard.BIG_RADIUS,
            margin: AppCard.normMargin,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2*Dimen.DEF_MARG),
                  child: signIdx==null?
                  Text(code, style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, fontWeight: weight.halfBold, color: signalising==null?hintEnab_(context):textEnab_(context)),)
                      :
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: code.substring(0, signIdx),
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: hintEnab_(context), fontWeight: weight.halfBold),
                        ),
                        TextSpan(
                          text: code[signIdx!],
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG, color: textEnab_(context), fontWeight: weight.halfBold),
                        ),
                        TextSpan(
                          text: code.substring(signIdx!+1),
                          style: AppTextStyle(fontSize: Dimen.TEXT_SIZE_BIG,  color: hintEnab_(context), fontWeight: weight.halfBold),
                        )
                      ],
                    ),
                    softWrap: true,
                  ),

                ),

                Slider(
                  value: speed,
                  divisions: 5,
                  activeColor: accent_(context),
                  inactiveColor: hintEnab_(context),
                  onChanged: (value) => setState(() => speed = value),
                  label: 'Szybkość nadawania',
                ),

                Row(
                  children: [
                    Expanded(child: AppCard(
                        elevation: signalising==null?0:AppCard.bigElevation,
                        padding: EdgeInsets.zero,
                        onTap: signalising==null?null:()async{

                          if(signalising!){
                            setState((){
                              signalising = false;
                              signIdx = null;
                            });
                            await TorchLight.disableTorch();
                          }else
                            signalise();

                        },
                        child: AnimatedChildSlider(
                          index: signalising==null?0:(signalising!?1:0),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(Dimen.ICON_MARG),
                              child: Text('SYGNALIZUJ',
                                  style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_BIG,
                                      fontWeight: weight.halfBold,
                                      color: signalising==null?hintEnab_(context):textEnab_(context)
                                  ),
                                  textAlign: TextAlign.center
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(Dimen.ICON_MARG),
                              child: Text('PRZERWIJ',
                                  style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_BIG,
                                      fontWeight: weight.halfBold
                                  ),
                                  textAlign: TextAlign.center
                              ),
                            ),
                          ],
                        )
                    )),
                    AppCard(
                      elevation: signalising!=true?AppCard.bigElevation:0,
                      onTap: signalising == true?null:(){
                        setState(() {
                          if(signalising == null) {
                            signalising = false;
                            TorchLight.disableTorch();
                          }else{
                            signalising = null;
                            call();
                          }
                        });
                      },
                      padding: EdgeInsets.zero,
                      child: AnimatedChildSlider(
                        index: signalising == null?1:0,
                        direction: Axis.horizontal,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(Dimen.ICON_MARG),
                              child: Container(
                                child: Text('WYWOŁUJ',
                                    style: AppTextStyle(
                                        fontSize: Dimen.TEXT_SIZE_BIG,
                                        fontWeight: weight.halfBold,
                                        color: signalising==true?hintEnab_(context):textEnab_(context)
                                    ),
                                    textAlign: TextAlign.center
                                ),
                                width: 82,
                              )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(Dimen.ICON_MARG),
                            child: Container(
                              width: 82,
                              child: Text('PRZERWIJ',
                                  style: AppTextStyle(
                                      fontSize: Dimen.TEXT_SIZE_BIG,
                                      fontWeight: weight.halfBold
                                  ),
                                  textAlign: TextAlign.center
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

      ],
    );
  }
}