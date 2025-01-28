
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Calculadora'),
        ),
        body: Calculadora(),
      ),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String _output = "0";  // Exibe o valor no visor
  String _input = "";    // Expressão que o usuário está digitando

  // Função chamada quando um botão é pressionado
  void _buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "0"; // Limpar o visor
        _input = "";
      } else if (value == "=") {
        _output = _calculateResult(_input); // Avaliar a expressão
      } else {
        if (_output == "0") {
          _output = value; // Substituir 0 no visor pelo número pressionado
        } else {
          _output += value; // Adicionar o número ao visor
        }
        _input += value; // Armazenar a expressão
      }
    });
  }

  // Função para calcular o resultado da expressão
  String _calculateResult(String expression) {
    try {
      expression = expression.replaceAll('x', '*'); // Multiplicação
      expression = expression.replaceAll('÷', '/'); // Divisão

      final result = _evaluateExpression(expression);
      return result.toString();
    } catch (e) {
      return "Erro"; // Caso algo dê errado
    }
  }

  // Função simplificada para avaliar expressões
  double _evaluateExpression(String expression) {
    // Aqui você pode integrar uma biblioteca para avaliação de expressões,
    // mas por enquanto, o código fará um parsing simples.
    return double.parse(expression);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Menos padding para o layout
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Visor da calculadora
          Container(
            padding: EdgeInsets.all(16), // Ajuste de padding
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              _output,
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,  // Ajuste o tamanho do texto para o visor
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16), // Espaço entre visor e botões
          // Grid de botões
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1.0, // Proporção dos botões
                crossAxisSpacing: 6, // Espaço entre os botões horizontalmente
                mainAxisSpacing: 6,  // Espaço entre os botões verticalmente
              ),
              itemBuilder: (context, index) {
                List<String> buttons = [
                  "7", "8", "9", "÷",
                  "4", "5", "6", "x",
                  "1", "2", "3", "-",
                  "0", ".", "C", "+",
                  "="
                ];
                return _buildButton(buttons[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Função para construir cada botão
  Widget _buildButton(String value) {
    return ElevatedButton(
      onPressed: () => _buttonPressed(value),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey, // Cor do botão
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Botões quadrados
        ),
        padding: EdgeInsets.all(12),  // Tamanho dos botões
        minimumSize: Size(70, 70),  // Botões grandes o suficiente
      ),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 24,  // Tamanho da fonte para o texto dos botões
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
