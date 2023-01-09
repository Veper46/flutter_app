import 'package:flutter/material.dart';
import 'package:triviapp/screens/easylevel.dart';
import 'package:triviapp/screens/home_screen.dart';
import 'package:triviapp/widget/difficult.dart';

class Home extends StatefulWidget {
  const Home();

  @override
  HomeState createState() => HomeState();
}

int questionNrDone = 9; //10

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Trivia application")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: const TextStyle(fontSize: 18.5),
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  const Text(
                    "Select the level of difficulty: \n",
                    style: TextStyle(fontSize: 18.5),
                  ),
                  //Easy
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) => EasyLevel(),
                              ),
                              (route) => false);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        child: const Text(
                          "Easy",
                          style: TextStyle(fontSize: 18.5),
                        ),
                      ),
                    ),
                  ),
                  //Medium
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) => HomeScreen(),
                              ),
                              (route) => false);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                        ),
                        child: const Text(
                          "Medium",
                          style: TextStyle(fontSize: 18.5),
                        ),
                      ),
                    ),
                  ),
                  //Hard
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                builder: (BuildContext context) =>
                                    DifficultLevel(),
                              ),
                              (route) => false);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red[900]),
                        ),
                        child: const Text(
                          "Difficult",
                          style: TextStyle(fontSize: 18.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
