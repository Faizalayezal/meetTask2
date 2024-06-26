import 'package:api_quize_fluttar/Model/QZModel.dart';
import 'package:api_quize_fluttar/ViewModel/Controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    //initstate me setState puru that pachhi call thay Future.delayed no use etle krvama aave
    Future.delayed(
      Duration.zero,
      () {
        ref.read(homeProvider).getAPiData(context);
      },
    );
    super.initState();
  }

  final controller = PageController(viewportFraction: 0.9, initialPage: 0);

  int? selectedAnswerIndex;
  int? questionIndex = 0;
  int score = 0;
  String isSelected = "";
  Map<int, String> selectedOptions = {};
  String rightanswer = "";
  int currentIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(homeProvider).quizModel;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
          body: provider?.isEmpty ?? true
              ? const Center(child: CircularProgressIndicator())
              : PageView.builder(
                  itemCount: provider?.length,
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    var data = provider?[index];
                    rightanswer = data?.correctAnswer ?? "";
                    return Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 30, right: 10, left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Questions ${index + 1} / ${provider?.length}",
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  data?.question ?? "",
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(height: 20),
                                if (provider?[index].answers?.answerA != null) selectedOpestion(index, 'answer_a', provider?[index].answers?.answerA, provider!),
                                const SizedBox(height: 20),
                                if (provider?[index].answers?.answerB != null) selectedOpestion(index, 'answer_b', provider?[index].answers?.answerB, provider!),
                                const SizedBox(height: 20),
                                if (provider?[index].answers?.answerC != null) selectedOpestion(index, 'answer_c', provider?[index].answers?.answerC, provider!),
                                const SizedBox(height: 20),
                                if (provider?[index].answers?.answerD != null) selectedOpestion(index, 'answer_d', provider?[index].answers?.answerD, provider!),
                                const SizedBox(height: 20),
                                provider?.length == currentIndex + 1
                                    ? ElevatedButton(
                                        onPressed: () {
                                          selectedOptions.forEach((key, value) {
                                            print("-------------answer---->${value}");
                                            print("-------------key---->${key}");
                                          });
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: const Text("Submit", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black)),
                                      )
                                    : const SizedBox.shrink()
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
    );
  }

  Widget selectedOpestion(int questionIndex, String optionKey, String? optionValue, List<QuizModel> provider) {
    Color borderColor = Colors.black;

    bool isSelected = (selectedOptions[questionIndex] == optionKey);

    if (isSelected) {
      borderColor = Colors.white;

      if (optionKey == rightanswer) {
        borderColor = Colors.green;
      } else {
        borderColor = Colors.red;
      }
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          if (!selectedOptions.containsKey(questionIndex)) {
            selectedOptions[questionIndex] = optionKey;

            if (optionKey == rightanswer) {
              print("Hurray $optionKey Was Right Answer");
            }
            if (currentIndex+1 < provider.length) {
              controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn
              );
            }
          }
        });
      },
      child: Container(
        width: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(optionValue ?? "", style: const TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
