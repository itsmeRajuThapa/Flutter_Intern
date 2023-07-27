// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class DatePicker extends StatefulWidget {
//   final String cont;

//   const DatePicker({super.key, required this.cont});
  
//   @override
//   State<DatePicker> createState() => _DatePickerState();
// }

// class _DatePickerState extends State<DatePicker> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//         controller: cont,
//         decoration: const InputDecoration(
//             border: OutlineInputBorder(),
//             icon: Icon(Icons.calendar_today),
//             labelText: "Enter Date",
//             labelStyle: TextStyle(color: Colors.red)),
//         readOnly: true,
//         onTap: () async {
//           //when click we have to show the datepicker
//           DateTime? pickedDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(
//                 2000), 
//             lastDate: DateTime(2101),
//           );
//           if (pickedDate != null) {
//             print(
//                 pickedDate); 
//             String formattedDate = DateFormat('yyyy-MM-dd').format(
//                 pickedDate); 
//             print(
//                 formattedDate); 
//             setState(() {
//               controller.text =
//                   formattedDate;
//             });
//           } else {
//             print("Date is not selected");
//           }
//         });
//   }
// }
