import 'package:flutter_riverpod/flutter_riverpod.dart';

// A StateNotifierProvider is used to PROVIDE the STATE of the NOTIFIER
// This value is typed as an int, and uses the TapsStateNotifieer subclass.
final tapsNotifierProvider = StateNotifierProvider<TapsStateNotifier, int>(
    (ref) => TapsStateNotifier(0));

// This class extends the StateNotifier class to provide a value, including a default,
// to consumer widgets through the StateNotifierProvider above.
// Increment and Decrement methods are provided to change the value and can be called
// from the consumers to tranform  the state.
class TapsStateNotifier extends StateNotifier<int> {
  TapsStateNotifier(int initial) : super(initial);

  void incrementTaps() {
    state++;
  }

  void decrementTaps() {
    state--;
  }
}

// This structure allows us to create logic that modifies the state in a subclass of
// StateNotifier. By using the class in the StateNotifieerProvider, consumer widgets 
// only need to read/wastch/referene the provider to get and modify the state.
