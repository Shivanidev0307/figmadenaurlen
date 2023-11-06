import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valuation App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CredentialsScreen()),
                );
              },
              child: Text('Enter Credentials'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ValuationScreen()),
                );
              },
              child: Text('Start Valuation'),
            ),
          ],
        ),
      ),
    );
  }
}

class CredentialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credentials'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Enter your credentials:'),
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add logic to send credentials to the server
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class ValuationScreen extends StatefulWidget {
  @override
  _ValuationScreenState createState() => _ValuationScreenState();
}

class _ValuationScreenState extends State<ValuationScreen> {
  int netCoins = 0;
  int grossCoins = 0;

  void _updateCoins(int value) {
    setState(() {
      netCoins += value;
      grossCoins += netCoins;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valuation Process'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('NET COINS: $netCoins'),
            Text('GROSS COINS: $grossCoins'),
            ElevatedButton(
              onPressed: () {
                _updateCoins(100); // Update coins when LEAD + 100 button is pressed
              },
              child: Text('LEAD + 100'),
            ),
          ],
        ),
      ),
    );
  }
}
