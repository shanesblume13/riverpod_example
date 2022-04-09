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

// Subclassing a ConsumerWidget to access provider states without a StatefulWidget.
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloWorld = ref.watch(helloWorldProvider);

    return MaterialApp(
      title: 'Riverpod Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Text(helloWorld),
        ),
      ),
    );
  }
}
