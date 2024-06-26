import 'package:api_quize_fluttar/Model/QZModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Repository/home_repositry.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class HomeController extends ChangeNotifier {
  List<QuizModel>? quizModel;

  Map<int, String> selectedOptions = {};

  //var selectedAnswerResult = "";

  getAPiData(BuildContext context) async {
    var response = await HomeRepositry.hitApi();
    final data = quizModelFromJson(response);
    quizModel = data;
    notifyListeners();
  }

 /* void calculateResults() {
    correctAnswers = 0;
    wrongAnswers = 0;

    for (int i = 0; i < _quizModel!.length; i++) {
      if (selectedOptions.containsKey(i) &&
          selectedOptions[i] == _quizModel![i].correctAnswer.toString()) {
        correctAnswers++;
      } else if (selectedOptions.containsKey(i)) {
        wrongAnswers++;
      }
    }
    }*/


}

final homeProvider = ChangeNotifierProvider((ref) => HomeController());
