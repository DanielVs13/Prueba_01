import 'package:flutter/material.dart';
import 'package:prueba_01/main.dart';
import 'package:prueba_01/screens/ejercicio01.dart';

void main() {
  runApp(ejercicio02());
}

class ejercicio02 extends StatelessWidget {
  const ejercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 02"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                "https://cdn.pixabay.com/photo/2019/09/18/21/31/sea-4487710_1280.jpg"),
            fit: BoxFit.cover)),
    child: Column(
      children: <Widget>[Solicitar(context), Boton(context), Boton1(context)],
    ),
  );
}

final TextEditingController _altura = TextEditingController();

Widget Solicitar(context) {
  return Column(
    children: [
      TextField(
        controller: _altura,
        decoration: InputDecoration(
          hintText: "Altura: ",
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).canvasColor),
          ),
        ),
      )
    ],
  );
}

double calcular() {
  double altura = double.tryParse(_altura.text) ?? 0.0;
  double densidad = 1025;
  double gravedad = 9.8;
  double presion = densidad * gravedad * altura;
  return presion;
}

void alerta(context) {
  showDialog(
      context: context,
      builder: (context) {
        return (AlertDialog(
          title: Text("La respuesta es: ${calcular()}"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Aceptar"))
          ],
        ));
      });
}

Widget Boton(context) {
  return (FilledButton(
      onPressed: () {
        alerta(context);
      },
      child: Text("Calcular"),));
}

Widget Boton1(context) {
  return (FilledButton(
      onPressed: () {
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ejercicio01()));
      },
      child: Text("Ir ejercicio 01"),));
}
