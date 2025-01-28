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
          title: Text('calculadora'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Layout para telas pequenas
              return Column(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 100,
                    width: double.infinity,
                    child: Center(child: Text('cabeçalho')),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: calculadora,
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    height: 100,
                    width: double.infinity,
                    child: Center(child: Text('roda pé')),
                  ),
                ],
              );
            } else {
              // Layout para telas grandes
              return Row(
                children: [
                  Container(
                    color: Colors.blue,
                    width: 200,
                    child: Center(child: Text('cabeçalho')),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Center(child: Text('calculadora')),
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    width: 200,
                    child: Center(child: Text('roda pé')),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

