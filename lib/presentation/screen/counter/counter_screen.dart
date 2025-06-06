import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {

  static const String routeName = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final clickCounter = ref.watch( counterProvider );
    final isDarkMode = ref.watch( isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(
            icon: isDarkMode
              ? const Icon ( Icons.dark_mode_outlined)
              : const Icon ( Icons.light_mode_outlined),
            // icon: Icon ( Icons.light_mode_outlined),
            // icon: Icon ( Icons.dark_mode_outlined),
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }, 
            )
        ],
        ),
      body: Center(
        child: Text('Valor: $clickCounter', style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}