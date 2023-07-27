import 'package:flutter/material.dart';

class RadioBox extends StatefulWidget {
  final Function(String? value) callback;
  const RadioBox({super.key, required this.callback});

  @override
  State<RadioBox> createState() => _RadioBoxState();
}

class _RadioBoxState extends State<RadioBox> {
  String genderList = 'male';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Gender'),
          Radio<String>(
            value: 'male',
            groupValue: genderList,
            onChanged: (value) {
              setState(() {
                genderList = value!;
                widget.callback(value);
              });
            },
          ),
          const Text('Male'),
          Radio(
              value: 'female',
              groupValue: genderList,
              onChanged: (value) {
                setState(() {
                  genderList = value!;
                  widget.callback(value);
                });
              }),
          const Text('Female'),
          Radio(
              value: 'other',
              groupValue: genderList,
              onChanged: (value) {
                setState(() {
                  genderList = value!;
                  widget.callback(value);
                });
              }),
          const Text('Other'),
        ],
      ),
    );
  }
}
