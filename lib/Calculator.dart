import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // ✅ added import

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _input = "";

  void _onButtonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "0";
        _input = "";
      } else if (value == "=") {
        try {
          final result = _evaluateExpression(_input);
          _output = result;
        } catch (e) {
          _output = "Error";
        }
      } else {
        _input += value;
        _output = _input;
      }
    });
  }

  String _evaluateExpression(String expression) {
    try {
      // Replace symbols for proper parsing
      String exp = expression.replaceAll('×', '*').replaceAll('÷', '/');

      // Use math_expressions package to evaluate safely
      Parser p = Parser();
      Expression parsedExp = p.parse(exp);
      ContextModel cm = ContextModel();
      double eval = parsedExp.evaluate(EvaluationType.REAL, cm);

      // Return clean number (remove trailing .0 if whole)
      if (eval % 1 == 0) {
        return eval.toInt().toString();
      } else {
        return eval.toStringAsFixed(2);
      }
    } catch (e) {
      return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    final buttons = [
      "7", "8", "9", "÷",
      "4", "5", "6", "×",
      "1", "2", "3", "-",
      "C", "0", "=", "+"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fructoso Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          Expanded(
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                final btn = buttons[index];
                final isOperator = ["÷", "×", "-", "+", "="].contains(btn);
                final isClear = btn == "C";

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isClear
                          ? Colors.redAccent
                          : isOperator
                              ? Colors.deepPurple
                              : Colors.grey[800],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () => _onButtonPressed(btn),
                    child: Text(
                      btn,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
