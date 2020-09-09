import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palindromo_app/controllers/PalindromoController.dart';
import 'package:palindromo_app/controllers/SettingsController.dart';
import 'package:palindromo_app/models/Palindromo.dart';

class HomePage extends StatelessWidget {
  final TextEditingController _wordController = TextEditingController(text: '');
  final _ctrl = Get.put(PalindromoController());
  final _ctrlSettings = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palíndromo'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_4),
            onPressed: () => _ctrlSettings.changeTheme(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 30),
              child: Text(
                'Palíndromos são palavras ou frases que podem ser lidas da esquerda para a direita ou vice-versa.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _wordController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 1,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Digite uma palavra aqui',
                    labelText: 'Digite uma palavra aqui'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 10),
              child: Obx(() => Text(
                    (_ctrl.isPalindromo && _wordController.text.isNotEmpty)
                        ? 'É um palíndromo'
                        : 'Não é um palíndromo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.w400),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 80, 16, 40),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50,
                child: FlatButton(
                  child: Text(
                    'VERIFICAR',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.deepPurple,
                  onPressed: () {
                    Palindromo _palindromo =
                        Palindromo(word: _wordController.text);
                    _ctrl.verifyPalindromo(_palindromo.word);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
