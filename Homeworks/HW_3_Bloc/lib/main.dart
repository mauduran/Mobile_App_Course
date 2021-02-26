import 'package:Guess_word/Bloc/bloc/game_bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Guess the Word'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GameBloc _bloc;
  _getNextQuestion(bool skip) {
    _bloc.add(NextQuestionEvent(skipQuestion: skip));
  }

  _endGame() {
    _bloc.add(EndGameEvent());
  }

  _restartGame() {
    _bloc.add(RestartGameEvent());
  }

  _startGame() {
    _bloc.add(StartGameEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) {
          _bloc = GameBloc();
          return _bloc;
        },
        child: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GameStartedState)
              return Container(
                width: MediaQuery.of(context).size.width,
                child: View(
                  title: state.palabra,
                  label: state.label,
                  count: state.count,
                  nextQuestion: _getNextQuestion,
                  endGame: _endGame,
                ),
              );
            else if (state is GameEndedState)
              return View(
                label: "You scored",
                title: state.count.toString(),
                restartGame: _restartGame,
              );
            return View(
              label: "Get ready to",
              title: "Guess the word!",
              startGame: _startGame,
            );
          },
        ),
      ),
    );
  }
}

class View extends StatelessWidget {
  final String label;
  final String title;
  final int count;
  final Function nextQuestion;
  final Function endGame;
  final Function restartGame;
  final Function startGame;

  const View({
    Key key,
    @required this.label,
    @required this.title,
    this.count,
    this.nextQuestion,
    this.endGame,
    this.restartGame,
    this.startGame,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          TextContent(
            label: label,
            value: title,
          ),
          if (restartGame == null) Spacer(),
          if (count != null) Text("$count"),
          if (restartGame == null)
            Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (count != null)
                    MaterialButton(
                      child: Text(
                        "Skip",
                      ),
                      onPressed: () {
                        nextQuestion(true);
                      },
                    ),
                  MaterialButton(
                    child: Text(
                      (count != null) ? "Got It" : "Play",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                    onPressed: () {
                      (count == null) ? startGame() : nextQuestion(false);
                    },
                  ),
                  if (count != null)
                    MaterialButton(
                      child: Text(
                        "End Game",
                      ),
                      onPressed: () {
                        endGame();
                      },
                    ),
                ],
              ),
            ),
          if (restartGame != null)
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: MaterialButton(
                child: Text(
                  "Play Again",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {
                  restartGame();
                },
              ),
            ),
          if (restartGame != null) Spacer(),
        ],
      ),
    );
  }
}

class TextContent extends StatelessWidget {
  final String label;
  final String value;

  const TextContent({
    Key key,
    @required this.label,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
