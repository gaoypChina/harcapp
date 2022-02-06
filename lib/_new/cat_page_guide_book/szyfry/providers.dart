
import 'package:flutter/widgets.dart';

class AppBarProvider extends ChangeNotifier{

  void notify() => notifyListeners();

}

class GaderypolukiProvider extends ChangeNotifier{

  static bool checkKeyValidity(String key){
    key = key.toLowerCase();
    for(int i=0; i< key.length; i++){
      String letter = key.substring(i, i+1);
      if(key.contains(letter, i+1))
        return false;
    }
    return true;
  }

  static String createOutput(String key, String input){

    Map<String, String> map = {};

    key = key.toLowerCase();
    for(int i=0; i<key.length; i+=2){
      if(i+2>key.length) break;
      String letter1 = key.substring(i, i+1);
      String letter2 = key.substring(i+1, i+2);
      map[letter1] = letter2;
      map[letter2] = letter1;
    }

    String output = '';

    for(int i=0; i<input.length; i++){
      String letter = input.substring(i, i+1);
      bool isUpperCase = letter == letter.toUpperCase();
      if(isUpperCase)
        output += map.containsKey(letter.toLowerCase())?map[letter.toLowerCase()].toUpperCase():letter;
      else
        output += map.containsKey(letter)?map[letter]:letter;
    }

    return output;
  }

  bool _isValid;
  bool get isValid => _isValid;

  TextEditingController _keyController = TextEditingController();
  TextEditingController get keyController => _keyController;
  String get key => _keyController.text;
  set key(String value){
    _keyController.text = value;
    _output = createOutput(key, _input);
    notifyListeners();
  }

  String _input;
  String get input => _input;
  set input(String value){
    _input = value;
    _output = createOutput(key, _input);

    notifyListeners();
  }

  String _output;
  String get output => _output;

  GaderypolukiProvider(){
    _isValid = true;
    _keyController = TextEditingController();
    _input = '';
    _output = '';
  }

  void notify() => notifyListeners();

}