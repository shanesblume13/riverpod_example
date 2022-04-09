import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Globally provided and managed state w/ initial value
final counterStateProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(
    // Wrapping the app with the ProviderScope to give children access to the state.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watching th StateProvider for changes and initial value
    final counter = ref.watch(counterStateProvider);

    return MaterialApp(
      title: 'Riverpod Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // This value will update as the provider state changes.
                '$counter',
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                // counterStateProvider is a State Provider, so we can read and modify it
                // to make global state changes.
                onPressed: () => ref.read(counterStateProvider.state).state++,
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
