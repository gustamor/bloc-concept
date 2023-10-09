import 'package:bloc_concept/pages/bloc/counter_bloc.dart';
import 'package:bloc_concept/pages/bloc/counter_events.dart';
import 'package:bloc_concept/state_managment/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context){
    return BlocProvider<CounterBloc>(
        create: (_)=> CounterBloc(0),
        child: Builder(builder: ( context) {
            final CounterBloc _bloc = context.watch();
            return Scaffold(
              body: Center(
                  child:Text(
                    '${_bloc.state}',
                    style: const TextStyle(fontSize: 25),
                  ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _bloc.add(Incremented(10));
                },
              ),
            );
          }
        ));
}
}