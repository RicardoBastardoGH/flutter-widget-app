import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const String routeName = 'ui_controls_screen';

  const UiControlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bus, train, boat }

class _UiControlsViewState extends State<_UiControlsView> {
  bool _isDeveloper = true;
  Transportation _selectedTransportation = Transportation.car;
  bool wanstBreakfast = false;
  bool wanstLunch = false;
  bool wanstDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controles adicionales'),
          value: _isDeveloper,
          onChanged: (value) {
            setState(() {
              _isDeveloper = !_isDeveloper;
            });
          },
        ),

        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(_selectedTransportation.toString()),
          children: [
            RadioListTile(
              title: const Text('By Car'),
              value: Transportation.car,
              groupValue: _selectedTransportation,
              onChanged:
                  (value) => setState(
                    () => _selectedTransportation = Transportation.car,
                  ),
            ),
            RadioListTile(
              title: const Text('By Bus'),
              value: Transportation.bus,
              groupValue: _selectedTransportation,
              onChanged:
                  (value) => setState(
                    () => _selectedTransportation = Transportation.bus,
                  ),
            ),
            RadioListTile(
              title: const Text('By Train'),
              value: Transportation.train,
              groupValue: _selectedTransportation,
              onChanged:
                  (value) => setState(
                    () => _selectedTransportation = Transportation.train,
                  ),
            ),
            RadioListTile(
              title: const Text('By Boat'),
              value: Transportation.boat,
              groupValue: _selectedTransportation,
              onChanged:
                  (value) => setState(
                    () => _selectedTransportation = Transportation.boat,
                  ),
            ),
          ],
        ),
      
        CheckboxListTile(
          title: const Text('Desayuno?'),
          value: wanstBreakfast,
          onChanged: (value) {
            setState(() {
              wanstBreakfast = !wanstBreakfast;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wanstLunch,
          onChanged: (value) {
            setState(() {
              wanstLunch = !wanstLunch;
            });
          },
        ),
        CheckboxListTile(
          title: const Text('Desayuno?'),
          value: wanstDinner,
          onChanged: (value) {
            setState(() {
              wanstDinner = !wanstDinner;
            });
          },
        ),
      ],
    );
  }
}
