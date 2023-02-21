import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/counter_model.dart';
import '../provider/all_providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            String title = ref.watch(titleProvider);
            return Text(title);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MyTextWidget(),
            MyCounterTextWidget(),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: const [
          Padding(
            padding: EdgeInsets.all(40.0),
            child: MyFloatingActionButtonWidget2(),
          ),
          SizedBox(
            width: 195.0,
          ),
          MyFloatingActionButtonWidget(),
        ],
      ),
    );
  }
}

class MyTextWidget extends ConsumerWidget {
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('text work');
    return Text(ref.watch(textProvider));
  }
}

class MyCounterTextWidget extends ConsumerWidget {
  const MyCounterTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('counterText work');
    CounterModel number = ref.watch(counterNotifierProvider);
    return Text(number.count.toString());
  }
}

class MyFloatingActionButtonWidget extends ConsumerWidget {
  const MyFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Plus work');
    return FloatingActionButton(
      onPressed: () {
        ref.read(counterNotifierProvider.notifier).plusCount();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyFloatingActionButtonWidget2 extends ConsumerWidget {
  const MyFloatingActionButtonWidget2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('Minus work');
    return FloatingActionButton(
      onPressed: () {
        ref.read(counterNotifierProvider.notifier).minusCount();
      },
      tooltip: 'Decrement',
      child: const Icon(Icons.remove),
    );
  }
}
