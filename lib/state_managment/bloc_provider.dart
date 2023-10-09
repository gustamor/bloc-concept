import 'package:bloc_concept/state_managment/cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BlocProvider<T extends Cubit> extends StatelessWidget {
  const BlocProvider({super.key, required this.create, required this.child});

  final Widget child;
  final T Function(BuildContext) create;

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      create: create,
      child: child,
      startListening: (inheritContext,cubit){
        final subscription = cubit.stream.listen(
            (_) {
                  inheritContext.markNeedsNotifyDependents();
            }
        );
        return subscription.cancel;
      },
      dispose: (_, cubit) => cubit.dispose()
    );
  }
}
