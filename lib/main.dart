import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Glocal State Provider
final helloWorldProvider = Provider<String>((ref) => 'Hello World');

void main() {
  runApp(
    // Wrapping the app with the ProviderScope to give children access to the state.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          // The Consumer widget is used to access the global provider state.
          // WidgetRef allows us to rad, watch, and listen to a provider.
          // This Consumer will be replaced by a ConsumerWidget.
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, _) {
              final helloWorld = ref.watch(helloWorldProvider);
              return Text(helloWorld);
            },
          ),
        ),
      ),
    );
  }
}
