import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Atividades'),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomCheckbox(
                value: _isChecked1,
                date: "16/08/2024",
                fontColor: Colors.blue,
                showIcon: false,
                canceled: false,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked1 = newValue!;
                  });
                },
                label: 'Estudar para prova de matemática',
              ),
              CustomCheckbox(
                value: _isChecked2,
                date: "14/08/2024",
                fontColor: Colors.black,
                showIcon: false,
                canceled: false,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked2 = newValue!;
                  });
                },
                label: 'Campeonato de futebol',
              ),
              CustomCheckbox(
                value: _isChecked3,
                fontColor: Colors.blue,
                date: "23/08/2024",
                showIcon: true,
                canceled: false,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked3 = newValue!;
                  });
                },
                label: 'Jogo da NFL',
              ),
              CustomCheckbox(
                value: _isChecked4,
                fontColor: Colors.green,
                date: "25/08/2024",
                showIcon: false,
                canceled: true,
                onChanged: (bool? newValue) {
                  setState(() {
                    _isChecked4 = newValue!;
                  });
                },
                label: 'Festa da Joana',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final String date;
  final Color activeColor;
  final bool showIcon;
  final bool canceled;
  final Color fontColor;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.label,
    required this.date,
    required this.canceled,
    required this.showIcon,
    required this.fontColor,
    this.activeColor = const Color.fromARGB(255, 71, 105, 31),
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: fontColor,
        ),
        styleText(label, fontColor, 26, canceled),
        Row(
          children: [
            styleText(date, Colors.black, 22, canceled),
            if (showIcon)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.watch,
                  color: fontColor,
                ),
              ),
          ],
        ),
      ],
    );
  }

  Text styleText(String text, Color fontColor, double size, bool canceled) =>
      Text(
        text,
        style: TextStyle(
            fontFamily: 'Quicksand',
            color: fontColor,
            fontSize: size,
            decoration:
                canceled ? TextDecoration.lineThrough : TextDecoration.none),
      );
}
