import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  @override
  CounterState get initialState => Ready();

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is Reset) {
      yield Ready();
    } else if (event is Increment) {
      yield Running(count: state.count + event.increment);
    } else if (event is Decrement) {
      yield Running(count: state.count - 1);
    } else {
      throw "Error: unknown state";
    }
  }
}
