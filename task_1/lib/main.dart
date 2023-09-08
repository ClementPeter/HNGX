import 'package:flutter/material.dart';
import 'package:task_1/webView_profile.dart';

void main() {
  runApp(const MyApp());
}

ColorScheme kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color(0xFF607E6C));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: kColorScheme.surface,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
      ),
      home: const MyHomePage(title: 'HNGX TASK 1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          const Center(
            child: Text(
              'slack profile photo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(
                color: kColorScheme.secondary,
                width: 5.0,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(
                scale: 1.5,
                image: AssetImage('assets/me.png'),
              ),
            ),
          ),
          const SizedBox(height: 50),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'slack display name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                'carlos_dev',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70),
            child: MaterialButton(
              padding: const EdgeInsets.all(20),
              shape: const OutlineInputBorder(),
              onPressed: () {
                // print("")
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const WebViewProfile();
                    },
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/github.png',
                    width: 24,
                  ),
                  const Text(
                    'Open GitHub',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
