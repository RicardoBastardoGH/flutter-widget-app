import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';
  
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {


  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton( onPressed: () {},  child: const Text('Elevated') ),
            ElevatedButton( onPressed: null,  child: const Text('Elevated Disabled') ),
            ElevatedButton.icon( onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined), label: const Text('Elevated Icon') ),
            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, label: const Text('Filled Icon'), icon: const Icon(Icons.accessibility_new)),
            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),
            OutlinedButton.icon(onPressed: (){}, label: const Text('Outlined Icon'), icon: const Icon(Icons.access_alarm_outlined)),
            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(onPressed: (){}, label: const Text('Text Icon'), icon: const Icon(Icons.access_alarm_outlined)),
            
            
            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_rounded), 
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
          
          ],
        ),
      ),
    );
  }
}