import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const String routeName = 'progress_screen';
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: _ProgresView(),
    );
  }
}

class _ProgresView extends StatelessWidget {
  const _ProgresView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 30),
          Text('CircularProgressIndicator'),
          SizedBox(height: 10),
          CircularProgressIndicator( strokeWidth: 2, backgroundColor: Colors.black26 ),
          
          SizedBox(height: 20),
          Text('Indicator de progreso controlado'),
          SizedBox(height: 10),
          _ControlledProgressIndicator(),
          SizedBox(height: 20),

        ],
      ),
    );
  }
}


class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) { return (value * 2);} ).takeWhile((value) => value <= 100),
      builder: (context, snapshot) {
        final progress = (snapshot.data ?? 0) / 100;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(value: progress, strokeWidth: 2, backgroundColor: Colors.black26),
              const SizedBox(width: 20),
              Expanded(child: LinearProgressIndicator(value: progress)),
            ],
          ),
        );
      },
      // child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       CircularProgressIndicator( value: 0.5, strokeWidth: 2, backgroundColor: Colors.black26 ),
      //       const SizedBox(width: 20),
      //       Expanded(child: LinearProgressIndicator( value: 0.5,))
      //     ],
      //   ),
      // ),
    );
  }
}
