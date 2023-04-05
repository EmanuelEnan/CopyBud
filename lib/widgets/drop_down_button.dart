// import 'package:flutter/material.dart';

// import '../utils/utils.dart';

// class DropDownButton extends StatefulWidget {
//   const DropDownButton({super.key});

//   @override
//   State<DropDownButton> createState() => _DropDownButtonState();
// }

// class _DropDownButtonState extends State<DropDownButton> {
//   String dropDown = 'regular';
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 10,
//         vertical: 10,
//       ),
//       margin: const EdgeInsets.all(
//         16,
//       ),
//       width: 200,
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton(
//           elevation: 2,
//           // focusColor: Colors.white,
//           style: const TextStyle(
//             color: Colors.blue,
//           ),
//           isExpanded: true,
//           hint: dropDown == 'regular'
//               ? const Padding(
//                   padding: EdgeInsets.only(left: 16),
//                   child: Text('Select a tone'),
//                 )
//               : Padding(
//                   padding: const EdgeInsets.only(left: 16),
//                   child: Text(dropDown),
//                 ),
//           items: options.map((String value) {
//             return DropdownMenuItem(
//               value: value,
//               child: Text(value),
//             );
//           }).toList(),
//           onChanged: (newValue) {
//             setState(() {
//               dropDown = newValue.toString();
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
