import 'package:flutter/material.dart';
import 'package:prueba_01/main.dart';

void main() {
  runApp(ejercicio01());
}

class ejercicio01 extends StatelessWidget {
  const ejercicio01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        title: Text("Ejercicio 01"),
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
                "https://cdn.pixabay.com/photo/2017/03/07/12/04/motion-2123771_960_720.jpg"),
            fit: BoxFit.cover)),
    child: (Column(
      children: <Widget>[Solicitar(context), Boton(context)],
    )),
  );
}

final TextEditingController _velocidadInicial = TextEditingController();
final TextEditingController _velocidadFinal = TextEditingController();

Widget Solicitar(context) {
  return Column(
    children: [
      TextField(
        controller: _velocidadInicial,
        decoration: InputDecoration(hintText: "Velicidad Inicial: ",
        border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).canvasColor),
          ),),
      ),
      Column(
        children: [
          TextField(
            controller: _velocidadFinal,
            decoration: InputDecoration(hintText: "Velocidad Final: ",
            border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).canvasColor),
          ),),
          )
        ],
      ),
    ],
  );
}

double calcular() {
  double valocidadIn = double.tryParse(_velocidadInicial.text) ?? 0.0;
  double velocidadFi = double.tryParse(_velocidadFinal.text) ?? 0.0;
  double aceleracionMe = 10.0;
  double tiempo = (velocidadFi - valocidadIn) / aceleracionMe;
  return tiempo;
}

void alerta(context) {
  double tiempoMin = 10;
  double tiempo = calcular();
  showDialog(
      context: context,
      builder: (context) {
        String aprueba;
        if (tiempo < tiempoMin) {
          aprueba = "El vehículo no aprueba";
        } else {
          aprueba = "El vehículo aprueba";
        }
        return (AlertDialog(
          title: const Text("RESPUESTA"),
          content: Text("La respuesta es: ${calcular()}\n" + (aprueba)),
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
      child: Text("Calcular")));
}
