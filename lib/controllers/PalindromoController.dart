
import 'package:get/get.dart';

class PalindromoController extends GetxController {
  var _isPalindromo = false.obs;
  bool get isPalindromo => _isPalindromo.value;

  void verifyPalindromo(String word) {
    String newWord = '';
    for(int i = word.length - 1; i >= 0 ; i--) {
      newWord += word[i];
    }
    _isPalindromo.value = newWord.toLowerCase().compareTo(word.toLowerCase()) == 0;
  }

}