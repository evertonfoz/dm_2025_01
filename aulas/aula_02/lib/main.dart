import 'package:flutter/material.dart';

void main() {
  runApp(Aula02App());
}

class Aula02App extends StatefulWidget {
  const Aula02App({super.key});

  @override
  State<Aula02App> createState() => _Aula02AppState();
}

class _Aula02AppState extends State<Aula02App> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Aula 02')),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text('Menu'),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  // Ação ao clicar em Home
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  // Ação ao clicar em Settings
                },
              ),
            ],
          ),
        ),

        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Você tocou", style: TextStyle(fontSize: 24)),
              Text(
                "$_counter",
                style: TextStyle(fontSize: 48, color: Colors.red),
              ),
              Text("vez no FAB", style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
            // print(_counter);
          },
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
