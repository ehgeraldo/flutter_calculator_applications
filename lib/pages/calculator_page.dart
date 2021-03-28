import 'package:flutter/material.dart';
import 'package:calculator_flutter/controllers/calculator_controller.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String number;
  final _controller = CalculatorController();
  String show = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDisplayOperation(text: show),
          _buildDisplay(text: _controller.result),
          Divider(color: Colors.white),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Calculadora', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          icon: Icon(
            Icons.share,
            color: Colors.deepOrange,
          ),
          onPressed: () => share(),
        )
      ],
    );
  }

  Widget _buildDisplayOperation({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.white, fontSize: 35, fontFamily: 'Calculator'),
        ),
      ),
    );
  }

  Widget _buildDisplay({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(
              color: Colors.white, fontSize: 52, fontFamily: 'Calculator'),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    return Container(
      color: Colors.blue,
      height: 400,
      child: Column(
        children: [
          _buildKeyboardLine1(),
          _buildKeyboardLine2(),
          _buildKeyboardLine3(),
          _buildKeyboardLine4(),
          _buildKeyboardLine5()
        ],
      ),
    );
  }

  Widget _buildKeyboardLine1() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: 'AC', color: Colors.deepOrange),
          _buildButton(label: 'DEL', color: Colors.deepOrange),
          _buildButton(label: '%', color: Colors.deepOrange),
          _buildButton(label: '/', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine2() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '7'),
          _buildButton(label: '8'),
          _buildButton(label: '9'),
          _buildButton(label: 'x', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine3() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '4'),
          _buildButton(label: '5'),
          _buildButton(label: '6'),
          _buildButton(label: '-', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine4() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '1'),
          _buildButton(label: '2'),
          _buildButton(label: '3'),
          _buildButton(label: '+', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine5() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '0', flex: 2),
          _buildButton(label: ','),
          _buildButton(label: '=', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildButton(
      {String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 24,
              color: color,
            ),
          ),
          color: Colors.black,
          onPressed: () {
            setState(() {
              _calculatorLogic(label);
              _shower(label);
            });
          }),
    );
  }

  void share() {
    Share.share('checkout my projects on github: https://github.com/ehgeraldo');
  }

  _shower(String label) {
    final lenght = show.length;
    if (label == 'AC') {
      show = '';
    } else if (label == 'DEL') {
      if (lenght > 1) {
        show = show.substring(0, lenght - 1);
      }
    } else if (label == '=') {
      show += label + _controller.result;
    } else {
      show += label;
    }
  }

  _calculatorLogic(String label) {
    _controller.applyCommand(label);
  }
}
