import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class Increment extends CounterEvent {
  final increment;

  const Increment({this.increment = 1});
}

class Decrement extends CounterEvent {}

class Reset extends CounterEvent {}
