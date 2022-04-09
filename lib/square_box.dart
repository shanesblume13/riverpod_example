import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/tap_notifier.dart';

class SquareBox extends ConsumerWidget {
  const SquareBox({Key? key, required this.size}) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the StateNotifierProvider to get the value/state of the TapNotifier.
    final notifier = ref.watch(tapsNotifierProvider);

    return GestureDetector(
      // Read the StateNotifierProvider's notifier to increment the state value on tap
      onTap: () {
        ref.read(tapsNotifierProvider.notifier).incrementTaps();
      },
      // Read the StateNotifierProvider's notifier to decrement the state value on long press.
      onLongPress: () {
        ref.read(tapsNotifierProvider.notifier).decrementTaps();
      },
      child: Container(
        width: size,
        height: size,
        color: Colors.red,
        child: Center(
          // Use the watched value of the StateNotifierProvider to display the state value.
          child: Text('$notifier'),
        ),
      ),
    );
  }
}
