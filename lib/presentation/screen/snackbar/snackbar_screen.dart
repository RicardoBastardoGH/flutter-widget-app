import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {

  static const String routeName = 'snackbar_screen';
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Hola desde un snackbar'),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Proident id qui non velit labore. Occaecat nisi non eiusmod aliqua cillum voluptate exercitation est non irure proident veniam aliqua. Mollit nostrud excepteur occaecat sunt voluptate do sunt incididunt anim aliquip pariatur ullamco nisi in. Deserunt adipisicing ex quis ex laborum officia amet elit aliqua ad ullamco. Consectetur in adipisicing deserunt dolore reprehenderit elit irure consequat nostrud et fugiat eu aliquip.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton (
            child:Text('Aceptar') , 
            onPressed: () {
              Navigator.of(context).pop();
              // showCustomSnackbar(context);
            },
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Quis aliqua eu laboris aliquip enim pariatur incididunt voluptate id dolore magna do. Enim ea incididunt nisi ipsum occaecat. Et id sunt aliquip sunt ad dolor ad officia sint irure anim esse incididunt. Nostrud sit aute ullamco dolore nulla. Nulla fugiat cupidatat consectetur in velit. Ipsum tempor ad voluptate et consectetur nostrud consectetur amet.'),
                  ]);
              }, 
              child: const Text('Licencias Usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar Dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: Icon(Icons.remove_red_eye_rounded),
        onPressed: (){ showCustomSnackbar(context); }, 
      ),
    );
  }
}
