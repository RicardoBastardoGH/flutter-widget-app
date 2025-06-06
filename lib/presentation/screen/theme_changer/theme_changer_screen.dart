import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const String routeName = '/theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final isDarkMode = ref.watch( themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
              icon: isDarkMode
                ? const Icon ( Icons.dark_mode_outlined)
                : const Icon ( Icons.light_mode_outlined),
              onPressed: (){
                // ref.read(isDarkModeProvider.notifier).update((state) => !state);
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              }, 
              )
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorList = ref.watch(colorListProvider);
    final int selectedColor = ref.watch( themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colorList.length,
      itemBuilder: (context, index) {
        final color = colorList[index];
        return RadioListTile(
          title: Text('Color ${index + 1}', style: TextStyle(color: color),),
          subtitle: Text(color.toARGB32().toString()),
          activeColor: color,
          value: selectedColor,
          groupValue: index ,
          onChanged: (value) {
            // ref.read(selectedColorProvider.notifier).update((state) => index);
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);

          },
        );
    });
  }
}