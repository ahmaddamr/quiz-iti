// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

import '../models/question_and_answers_model.dart';
import '../widgets/answer_text_widget.dart';
import '../widgets/custom_elevated_button.dart';
import 'congratulation_page.dart';

class QuizPage extends StatefulWidget {
  static const routeName = 'quizPage';

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<QuestionAndAnswersModel> questionsAndAnswers;
  int totalQuestions = 3;
  int index = 0;
  int result = 0;
  bool isClickable = true;
  String? selectedAnswer;
  String? correctAnswer;
  bool showCorrectAnswer = false;

  @override
  void initState() {
    List<String> correctAnswers = [
      'The godfather',
      "alpacino",
      "28",
    ];

    questionsAndAnswers = [
      QuestionAndAnswersModel(
        question: "What is the best movie in the world?",
        correctAnswer: '${correctAnswers[0]}',
        answers: [
          'the machinist',
          'scarface',
          '${correctAnswers[0]}',
          'harsh times',
        ],
      ),
      QuestionAndAnswersModel(
        correctAnswer: '${correctAnswers[1]}',
        answers: ['rebert denero', 'will smith', 'moahmed ramadan', '${correctAnswers[1]}'],
        question: "Who was the actor was the main character in godfather2?",
      ),
      QuestionAndAnswersModel(
        correctAnswer: '${correctAnswers[2]}',
        answers: [
          '20',
          '${correctAnswers[2]}',
          '30',
          '50',
        ],
        question: "How many governorates in egypt?",
      ),
      // QuestionAndAnswersModel(
      //   correctAnswer: '${correctAnswers[3]}',
      //   answers: [
      //     'Oswald CobblePot',
      //     'Jack',
      //     'Jason',
      //     '${correctAnswers[3]}',
      //   ],
      //   question: "Who is the true name of Two Face?",
      // ),
      // QuestionAndAnswersModel(
      //   correctAnswer: '${correctAnswers[4]}',
      //   answers: [
      //     '${correctAnswers[4]}',
      //     'Alfred',
      //     'Selina',
      //     'Penguin',
      //   ],
      //   question: "Who is Batman's famous enemy?",
      // ),
    ];

    super.initState();
  }

  void handleAnswerSelection(String answer) {
    if (isClickable) {
      setState(() {
        isClickable = false;
        selectedAnswer = answer;
        correctAnswer = questionsAndAnswers[index].correctAnswer;
        showCorrectAnswer = answer != correctAnswer;
        if (answer == correctAnswer) {
          result++;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            'QUIZ',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xff86948F),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(
                  'assets/images/Ellipse 1.png',
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 28),
                decoration: const BoxDecoration(
                  color: Color(0xffB8E893),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          '${index + 1} / $totalQuestions',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Text(
                      questionsAndAnswers[index].question,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: AnswerTextWidget(
                        text: questionsAndAnswers[index].answers[0],
                        correctAnswer: questionsAndAnswers[index].correctAnswer,
                        isSelected: questionsAndAnswers[index].answers[0] ==
                            selectedAnswer,
                        showCorrectAnswer: showCorrectAnswer,
                        isClickable: isClickable,
                        onTap: () => handleAnswerSelection(
                            questionsAndAnswers[index].answers[0]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: AnswerTextWidget(
                        text: questionsAndAnswers[index].answers[1],
                        correctAnswer: questionsAndAnswers[index].correctAnswer,
                        isSelected: questionsAndAnswers[index].answers[1] ==
                            selectedAnswer,
                        showCorrectAnswer: showCorrectAnswer,
                        isClickable: isClickable,
                        onTap: () => handleAnswerSelection(
                            questionsAndAnswers[index].answers[1]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: AnswerTextWidget(
                        text: questionsAndAnswers[index].answers[2],
                        correctAnswer: questionsAndAnswers[index].correctAnswer,
                        isSelected: questionsAndAnswers[index].answers[2] ==
                            selectedAnswer,
                        showCorrectAnswer: showCorrectAnswer,
                        isClickable: isClickable,
                        onTap: () => handleAnswerSelection(
                            questionsAndAnswers[index].answers[2]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      child: AnswerTextWidget(
                        text: questionsAndAnswers[index].answers[3],
                        correctAnswer: questionsAndAnswers[index].correctAnswer,
                        isSelected: questionsAndAnswers[index].answers[3] ==
                            selectedAnswer,
                        showCorrectAnswer: showCorrectAnswer,
                        isClickable: isClickable,
                        onTap: () => handleAnswerSelection(
                            questionsAndAnswers[index].answers[3]),
                      ),
                    ),
                    Center(
                      child: CustomElevatedButton(
                        textColor: Colors.white,
                        backgroundColor: const Color(0xff86948F),
                        text: 'NEXT',
                        onPressed: () {
                          if (selectedAnswer == null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                    "You can't proceed",
                                    style: TextStyle(fontSize: 27),
                                  ),
                                  content: const Text(
                                    "Please Select an Answer",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );
                          } else if (index < totalQuestions - 1) {
                            setState(() {
                              index++;
                              isClickable = true;
                              selectedAnswer = null;
                              showCorrectAnswer = false;
                            });
                          } else {
                            Navigator.pushNamed(
                              context,
                              CongratulationPage.routeName,
                              arguments: {
                                'name': name,
                                "result": result,
                                'totalAnswers': totalQuestions
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
