import 'package:flutter/material.dart';
import 'menu.dart';

void main() {
  runApp(
    MaterialApp(
      home: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget daftar = Container(
      child: Column(
        children: [Text('KAFE'), Text('tss')],
      ),
    );

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/download.png'),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'KAFE',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Text("SMKN 2 BDG"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Menu(),
                    ),
                  );
                },
                child: Text('Menu',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 104, 98, 89)),
                    minimumSize: MaterialStateProperty.all(Size(250, 50))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
