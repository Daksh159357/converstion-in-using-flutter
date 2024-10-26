import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Conversion App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ConversionHomePage(),
    );
  }
}

class ConversionHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Conversion App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildConversionButton(
                    context,
                    'Decimal to Binary',
                    (input) => _convertDecimalToBinary(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Decimal to Octal',
                    (input) => _convertDecimalToOctal(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Decimal to Hex',
                    (input) => _convertDecimalToHexadecimal(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Binary to Decimal',
                    (input) => _convertBinaryToDecimal(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Binary to Octal',
                    (input) => _convertBinaryToOctal(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Binary to Hex',
                    (input) => _convertBinaryToHexadecimal(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Octal to Decimal',
                    (input) => _convertOctalToDecimal(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Octal to Binary',
                    (input) => _convertOctalToBinary(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Octal to Hex',
                    (input) => _convertOctalToHexadecimal(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Hex to Decimal',
                    (input) => _convertHexadecimalToDecimal(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Hex to Binary',
                    (input) => _convertHexadecimalToBinary(input),
                    Colors.cyanAccent,
                  ),
                  _buildConversionButton(
                    context,
                    'Hex to Octal',
                    (input) => _convertHexadecimalToOctal(input),
                    Colors.cyanAccent,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConversionButton(
    BuildContext context,
    String title,
    Function(String) conversionFunction,
    Color color,
  ) {
    return Container(
      height: 60, // Fixed height for the buttons
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Set button color
          padding: EdgeInsets.symmetric(horizontal: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () async {
          String? inputValue = await _showInputDialog(context, title);
          if (inputValue != null && inputValue.isNotEmpty) {
            var result = conversionFunction(inputValue);
            _showResultDialog(context, title, result);
          }
        },
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12), // Smaller font size
        ),
      ),
    );
  }

  Future<String?> _showInputDialog(BuildContext context, String title) {
    TextEditingController controller = TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter number"),
            keyboardType: TextInputType.text, // Allows alphanumeric input
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: Text('Convert'),
            ),
          ],
        );
      },
    );
  }

  void _showResultDialog(BuildContext context, String title, String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Result of $title'),
          content: Text(result),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Conversion Logic Functions
  String _convertDecimalToBinary(String input) {
    int? decimalValue = int.tryParse(input);
    if (decimalValue != null) {
      return decimalValue.toRadixString(2);
    }
    return 'Invalid input';
  }

  String _convertDecimalToOctal(String input) {
    int? decimalValue = int.tryParse(input);
    if (decimalValue != null) {
      return decimalValue.toRadixString(8);
    }
    return 'Invalid input';
  }

  String _convertDecimalToHexadecimal(String input) {
    int? decimalValue = int.tryParse(input);
    if (decimalValue != null) {
      return decimalValue.toRadixString(16).toUpperCase();
    }
    return 'Invalid input';
  }

  String _convertBinaryToDecimal(String input) {
    int? decimalValue = int.tryParse(input, radix: 2);
    if (decimalValue != null) {
      return decimalValue.toString();
    }
    return 'Invalid input';
  }

  String _convertBinaryToOctal(String input) {
    int? decimalValue = int.tryParse(input, radix: 2);
    if (decimalValue != null) {
      return decimalValue.toRadixString(8);
    }
    return 'Invalid input';
  }

  String _convertBinaryToHexadecimal(String input) {
    int? decimalValue = int.tryParse(input, radix: 2);
    if (decimalValue != null) {
      return decimalValue.toRadixString(16).toUpperCase();
    }
    return 'Invalid input';
  }

  String _convertOctalToDecimal(String input) {
    int? decimalValue = int.tryParse(input, radix: 8);
    if (decimalValue != null) {
      return decimalValue.toString();
    }
    return 'Invalid input';
  }

  String _convertOctalToBinary(String input) {
    int? decimalValue = int.tryParse(input, radix: 8);
    if (decimalValue != null) {
      return decimalValue.toRadixString(2);
    }
    return 'Invalid input';
  }

  String _convertOctalToHexadecimal(String input) {
    int? decimalValue = int.tryParse(input, radix: 8);
    if (decimalValue != null) {
      return decimalValue.toRadixString(16).toUpperCase();
    }
    return 'Invalid input';
  }

  String _convertHexadecimalToDecimal(String input) {
    int? decimalValue = int.tryParse(input, radix: 16);
    if (decimalValue != null) {
      return decimalValue.toString();
    }
    return 'Invalid input';
  }

  String _convertHexadecimalToBinary(String input) {
    int? decimalValue = int.tryParse(input, radix: 16);
    if (decimalValue != null) {
      return decimalValue.toRadixString(2);
    }
    return 'Invalid input';
  }

  String _convertHexadecimalToOctal(String input) {
    int? decimalValue = int.tryParse(input, radix: 16);
    if (decimalValue != null) {
      return decimalValue.toRadixString(8);
    }
    return 'Invalid input';
  }
}