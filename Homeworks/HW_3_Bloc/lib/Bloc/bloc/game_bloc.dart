import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'game_event.dart';
part 'game_state.dart';

List<String> palabras = [
  "perro",
  "gato",
  "lobo",
  "maceta",
  "cerveza",
  "bocinas"
];

class GameBloc extends Bloc<GameEvent, GameState> {
  final List<String> _sugeridas = List<String>.from(palabras);
  final List<String> _palabrasOrden = List<String>.from(palabras);

  int count = 0;
  int index = 0;

  GameBloc() : super(GameInitialState());

  @override
  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is StartGameEvent) {
      _sugeridas.shuffle();
      _palabrasOrden.shuffle();
      count = 0;
      index = 0;
      yield GameStartedState(
        palabra: _sugeridas[index],
        label: "The word is...",
        count: count,
      );
    } else if (event is NextQuestionEvent) {
      if ((event.skipQuestion && _sugeridas[index] != _palabrasOrden[index]) ||
          (!event.skipQuestion && _sugeridas[index] == _palabrasOrden[index])) {
        count++;
      }
      index++;
      if (index >= _sugeridas.length) {
        yield GameEndedState(count: count);
      } else {
        yield GameStartedState(
            palabra: _sugeridas[index], count: count, label: "The word is ");
      }
    } else if (event is EndGameEvent) {
      yield GameEndedState(count: count);
    } else if (event is RestartGameEvent) {
      yield GameInitialState();
    }
  }
}
