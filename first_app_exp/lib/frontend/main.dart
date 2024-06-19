import 'package:flutter/material.dart';

import 'second_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 35, 94, 124),
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String buttonName = 'Ajouter Suivi';
  String buttonName2 = 'Supprimer';
  String buttonName3 = 'Modifier';
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Z_CONFECTION'),
      ),
      body: Center(
        child: currentIndex == 0
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: Color.fromRGBO(158, 158, 158, 0.298),
                child: Row(
//fixed the buttons horizentalement
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(234, 255, 255, 255),
                      ),
                      onPressed: () {
//to navigate to the other page
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const SecondPage();
                          }),
                        );
                        setState(() {
                          buttonName = 'Ajouter suivi';
                        });
                      },
                      child: Text(buttonName),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonName2 = 'Supprimer';
                        });
                      },
                      child: Text(buttonName2),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonName3 = 'Modifier';
                        });
                      },
                      child: Text(buttonName3),
                    ),
                  ],
                ),
              )
            : Image.asset('images/logo.jpg'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'settings',
            icon: Icon(Icons.settings),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
