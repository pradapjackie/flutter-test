import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Things App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomThingsPage(),
    );
  }
}

class RandomThingsPage extends StatefulWidget {
  @override
  _RandomThingsPageState createState() => _RandomThingsPageState();
}

class _RandomThingsPageState extends State<RandomThingsPage> {
  final Random _random = Random();
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  List<String> countries = [
    'USA',
    'Canada',
    'India',
    'Brazil',
    'Australia',
    'France',
    'Japan',
    'Germany',
    'South Africa',
    'Mexico',
  ];

  String randomMonth = '';
  String randomCountry = '';
  String randomFancyNumber = '';
  String randomFullName = '';

  void generateRandomMonth() {
    final int randomIndex = _random.nextInt(months.length);
    setState(() {
      randomMonth = months[randomIndex];
    });
  }

  void generateRandomCountry() {
    final int randomIndex = _random.nextInt(countries.length);
    setState(() {
      randomCountry = countries[randomIndex];
    });
  }

  void generateRandomFancyNumber() {
    setState(() {
      randomFancyNumber = _generateRandomFancyNumber();
    });
  }

  String _generateRandomFancyNumber() {
    return (_random.nextInt(90000) + 10000).toString(); // Generates a random 5-digit number
  }

  void generateRandomFullName() {
    setState(() {
      randomFullName = _generateRandomFullName();
    });
  }

  String _generateRandomFullName() {
    final List<String> firstNames = ['John', 'Alice', 'Bob', 'Emma', 'David'];
    final List<String> lastNames = ['Smith', 'Johnson', 'Williams', 'Jones', 'Brown'];

    final String randomFirstName = firstNames[_random.nextInt(firstNames.length)];
    final String randomLastName = lastNames[_random.nextInt(lastNames.length)];

    return '$randomFirstName $randomLastName';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Things'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Random Month:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              randomMonth,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              'Random Country:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              randomCountry,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              'Random Fancy Number:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              randomFancyNumber,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Text(
              'Random Full Name:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              randomFullName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: generateRandomMonth,
            tooltip: 'Generate Random Month',
            child: Icon(Icons.calendar_today),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: generateRandomCountry,
            tooltip: 'Generate Random Country',
            child: Icon(Icons.public),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: generateRandomFancyNumber,
            tooltip: 'Generate Random Fancy Number',
            child: Icon(Icons.confirmation_number),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: generateRandomFullName,
            tooltip: 'Generate Random Full Name',
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
