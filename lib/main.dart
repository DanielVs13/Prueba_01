import 'package:flutter/material.dart';
import 'package:prueba_01/screens/ejercicio01.dart';
import 'package:prueba_01/screens/ejercicio02.dart';

void main() {
  runApp(prueba());
}

class prueba extends StatelessWidget {
  const prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Inicio",
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
        title: const Text("Bienvenido"),
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
                "https://cdn.pixabay.com/photo/2018/09/03/23/56/sea-3652697_1280.jpg"),
            fit: BoxFit.cover)),
    child: Column(
      children: <Widget>[
        Text(
          "Daniel Antonio Arias Vivanco",
        ),
        Text("DanielVs13"),
        Boton(context)
      ],
    ),
  );
}

void alerta(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Container(
          child: AlertDialog(
            title: Text("Hola ¿Quieres ir a la siguiente ventana?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ejercicio02()));
                  },
                  child: Text("Si")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("No"))
            ],
          ),
        );
      });
}

Widget Boton(context) {
  return (FilledButton(
      onPressed: () {
        alerta(context);
      },
      child: Text("Boton")));
}
