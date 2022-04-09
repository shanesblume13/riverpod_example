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

// Subclassing a ConsumerStatefulWidget gives us access to both the Provider
// and a local state.

// Extend ConsumerStatefulWidget
class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// Extend ConsumerState
// Here we can read the provider in the initState, and also
// watch the provider state in the build method.
class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    final value = ref.read(helloWorldProvider);
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(helloWorldProvider);

    return MaterialApp(
      title: 'Riverpod Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: Text(
            value,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
