//valuation and countdown code is integrated
import 'package:flutter/material.dart';
import 'package:countdown_flutter/countdown_flutter.dart';

void main() => runApp(MyApp());

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}

class CountdownWidget extends StatelessWidget {
  final int durationInSeconds; // The total duration in seconds
  final Function onTimerEnd; // A function to call when the timer ends

  CountdownWidget({
    required this.durationInSeconds,
    required this.onTimerEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Countdown(
      duration: Duration(seconds: durationInSeconds),
      builder: (BuildContext context, Duration remaining) {
        return Text(
          '${remaining.inMinutes}:${remaining.inSeconds % 60}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        );
      },
      onFinished: () {
        // Timer has finished; you can call your function here
        onTimerEnd();
      },
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
            CountdownWidget(
              durationInSeconds: 144 * 60 * 60, // 144 hours
              onTimerEnd: () {
                // Timer has ended; you can handle it here
                // For example, disable valuation or show a message
              },
            ),
            Text('NET COINS: $netCoins'),
            Text('GROSS COINS: $grossCoins'),
            ElevatedButton(
              onPressed: () {
                // Implement the LEAD + 100 logic here
                // This button allows users to add coins
                // and participate in valuation
              },
              child: Text('LEAD + 100'),
            ),
          ],
        ),
      ),
    );
  }
}
