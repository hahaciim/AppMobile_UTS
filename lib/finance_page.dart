import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:intl/intl.dart'; // Import intl package for currency formatting

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  _FinancePageState createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  final TextEditingController _incomeController = TextEditingController();
  final TextEditingController _expenseController = TextEditingController();
  double _balance = 0.0;

  String _calculatorInput = '';
  String _calculatorResult = '';

  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'id_ID', // Indonesian locale
    symbol: 'Rp',    // Rupiah symbol
  );

  // Update balance based on income and expenses
  void _updateBalance() {
    final income = double.tryParse(_incomeController.text) ?? 0.0;
    final expense = double.tryParse(_expenseController.text) ?? 0.0;
    setState(() {
      _balance = income - expense;
    });
  }

  // Add input to the calculator
  void _updateCalculator(String input) {
    setState(() {
      _calculatorInput += input;
    });
  }

  // Evaluate the calculator expression
  void _calculateResult() {
    try {
      Parser parser = Parser();
      Expression expression = parser.parse(_calculatorInput.replaceAll('%', '/100'));
      ContextModel contextModel = ContextModel();
      double eval = expression.evaluate(EvaluationType.REAL, contextModel);
      setState(() {
        _calculatorResult = eval.toString();
      });
    } catch (e) {
      setState(() {
        _calculatorResult = 'Error';
      });
    }
  }

  // Clear the calculator input and result
  void _clearCalculator() {
    setState(() {
      _calculatorInput = '';
      _calculatorResult = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Event Budget',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),

              // Income Input
              TextField(
                controller: _incomeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Income',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _updateBalance(),
              ),
              const SizedBox(height: 16.0),

              // Expense Input
              TextField(
                controller: _expenseController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Expenses',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => _updateBalance(),
              ),
              const SizedBox(height: 16.0),

              // Balance Display with Rupiah formatting
              Text(
                'Total Balance: ${_currencyFormat.format(_balance)}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 32.0),

              // Calculator Section
              const Text(
                'Calculator',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),

              // Calculator Display
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _calculatorInput,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      _calculatorResult,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Calculator Buttons in a grid-like structure
              GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(4.0),
                childAspectRatio: 1, // Make buttons square to prevent overlap
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildCalculatorButton('('),
                  _buildCalculatorButton(')'),
                  _buildCalculatorButton('%'),
                  _buildCalculatorButton('AC', isClear: true),
                  _buildCalculatorButton('7'),
                  _buildCalculatorButton('8'),
                  _buildCalculatorButton('9'),
                  _buildCalculatorButton('/'),
                  _buildCalculatorButton('4'),
                  _buildCalculatorButton('5'),
                  _buildCalculatorButton('6'),
                  _buildCalculatorButton('*'),
                  _buildCalculatorButton('1'),
                  _buildCalculatorButton('2'),
                  _buildCalculatorButton('3'),
                  _buildCalculatorButton('-'),
                  _buildCalculatorButton('0'),
                  _buildCalculatorButton('.'),
                  _buildCalculatorButton('=', isEquals: true),
                  _buildCalculatorButton('+'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create calculator buttons
  Widget _buildCalculatorButton(String value, {bool isClear = false, bool isEquals = false}) {
    return ElevatedButton(
      onPressed: () {
        if (isClear) {
          _clearCalculator();
        } else if (isEquals) {
          _calculateResult();
        } else {
          _updateCalculator(value);
        }
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14.0),
        backgroundColor: Colors.blue, // Set button background to blue
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white, // Set text color to white
        ),
      ),
    );
  }
}
