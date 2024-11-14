import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Intl Package Example'),
        ),
        body: Center(
          child: DateAndCurrencyExample(),
        ),
      ),
    );
  }
}

class DateAndCurrencyExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    double amount = 1234.56;

    String formattedDate = DateFormat.yMMMd('en_US').format(now);
    String formattedTime = DateFormat.jm('en_US').format(now);
    String formattedAmount = NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Date: $formattedDate'),
        Text('Time: $formattedTime'),
        Text('Amount: $formattedAmount'),
      ],
    );
  }
}
