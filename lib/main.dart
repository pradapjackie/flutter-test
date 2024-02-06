import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  String _currentDate = "";
  String _currentTime = "";
  Color _themeColor = Colors.deepPurple; // Initial theme color
  String _firstName = "";
  String _lastName = "";
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _showDate() {
    final now = DateTime.now();
    final formattedDate = "${now.year}-${now.month}-${now.day}";
    setState(() {
      _currentDate = formattedDate;
    });
    _showSnackBar("Date: $_currentDate");
  }

  void _showTime() {
    final now = DateTime.now();
    final formattedTime = "${now.hour}:${now.minute}:${now.second}";
    setState(() {
      _currentTime = formattedTime;
    });
    _showSnackBar("Time: $_currentTime");
  }

  void _changeThemeColor() {
    setState(() {
      _themeColor = _generateRandomColor();
    });
  }

  Color _generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _generateRandomNames() {
    final random = Random();
    final firstNames = ['Alice', 'Bob', 'Charlie', 'David', 'Emma'];
    final lastNames = ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown'];

    final randomFirstName = firstNames[random.nextInt(firstNames.length)];
    final randomLastName = lastNames[random.nextInt(lastNames.length)];

    setState(() {
      _firstName = randomFirstName;
      _lastName = randomLastName;
    });
  }

  void _showAnimation() {
    _animationController.reset();
    _animationController.forward();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _themeColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: _currentDate),
              decoration: InputDecoration(labelText: 'Current Date'),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: _currentTime),
              decoration: InputDecoration(labelText: 'Current Time'),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: _firstName),
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              readOnly: true,
              controller: TextEditingController(text: _lastName),
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animation.value,
                  child: Icon(
                    Icons.star,
                    size: 50.0,
                    color: Colors.yellow,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _showDate,
            tooltip: 'Show Date',
            child: const Icon(Icons.calendar_today),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _showTime,
            tooltip: 'Show Time',
            child: const Icon(Icons.access_time),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _changeThemeColor,
            tooltip: 'Change Theme Color',
            child: const Icon(Icons.color_lens),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _generateRandomNames,
            tooltip: 'Generate Names',
            child: const Icon(Icons.person),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _showAnimation,
    tooltip: 'Show Animation',
            child: const Icon(Icons.animation),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
