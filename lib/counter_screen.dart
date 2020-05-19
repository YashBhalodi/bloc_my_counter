import 'package:blocmycounter/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLoC Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Counter",
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 16.0,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  state.count.toString(),
                  style: Theme.of(context).textTheme.display3,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Action(),
    );
  }
}

class Action extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        BlocBuilder<CounterBloc, CounterState>(
          condition: (previousState, currentState) => currentState != previousState,
          builder: (context, state) {
            if (state is Running) {
              return FloatingActionButton(
                heroTag: "refresh",
                child: Icon(Icons.refresh),
                onPressed: () {
                  context.bloc<CounterBloc>().add(Reset());
                },
              );
            } else {
              return Container(
                height: 0.0,
                width: 0.0,
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: FloatingActionButton(
            heroTag: "increase 10",
            child: Text("+10"),
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(Increment(increment: 10));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: FloatingActionButton(
            heroTag: "increase one",
            child: Icon(Icons.add),
            onPressed: () {
              context.bloc<CounterBloc>().add(Increment());
            },
          ),
        )
      ],
    );
  }
}
