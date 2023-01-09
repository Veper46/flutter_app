import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_model.dart';
import '../widget/question_widget.dart';
import '../widget/next_button.dart';
import '../widget/option_card.dart';
import '../widget/result_box.dart';

// create home screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _question = [
    Question(
        id: '1',
        option: {
          'Venezia': false,
          'Roma': true,
          'Monza': false,
          'Portogallo': false
        },
        title: 'Qual e la capitale dell Italia?'),
    Question(
        id: '2',
        option: {'Java': false, 'Phyton': true, 'C': false, 'PHP': false},
        title: 'Qual e il linguaggio piu usato al mondo?'),
    Question(
        id: '3',
        option: {'Falso': false, 'Vero': true},
        title: 'Gli utenti di internet nel 1982 erano circa 200 Vero o Falso?'),
    Question(
        id: '4',
        option: {'Falso': false, 'Vero': true},
        title: 'Lornitorinco depone le uova Vero o Falso?'),
    Question(
        id: '5',
        option: {'Falso': false, 'Vero': true},
        title:
            'Nel testo dellinno del Sudafrica ci sono parole di 5 lingue. Vero o Falso?'),
    Question(
        id: '6',
        option: {'3': false, '2': true, '7': false, '4': false},
        title: 'Quanti occhi anno gli umani?'),
    Question(
        id: '7',
        option: {'Falso': true, 'Vero': false},
        title:
            'La prima tavoletta di cioccolato e stata realizzata nel 1958 Vero o Falso?'),
    Question(
        id: '8',
        option: {'Falso': false, 'Vero': true},
        title: 'La città natale di Giuseppe Garibaldi è Nizza Vero o Falso?'),
    Question(
        id: '9',
        option: {'Falso': true, 'Vero': false},
        title:
            'Lantica citta di Cartagine corrisponde allattuale de Il Cairo in Egitto Vero o Falso?'),
    Question(
        id: '10',
        option: {'Rosso': false, 'Verde': true, 'Blu': false, 'Marrone': false},
        title: 'Di che colore e l erba?'),
  ];

  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool isSelect = false;

  void nextQuestion() {
    if (index == _question.length - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLenght: _question.length,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isSelect = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: const Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }
  }

  void checkAnswer(bool value) {
    if (isSelect) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        isSelect = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isSelect = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Score: $score',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              indexAction: index, // start at 0
              question: _question[index].title, // first question in the list
              totalQuestions: _question.length, // total lenght of question
            ),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for (int i = 0; i < _question[index].option.length; i++)
              GestureDetector(
                onTap: () =>
                    checkAnswer(_question[index].option.values.toList()[i]),
                child: OptionCard(
                  option: _question[index].option.keys.toList()[i],
                  color: isPressed
                      ? _question[index].option.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Next(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
