// import 'package:flutter/material.dart';
//
// class CustomInputFieldTwo extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final IconData prefixIcon;
//   final TextInputType keyboardType;
//   final bool obscureText;
//   final String? Function(String?)? validator;
//
//   const CustomInputFieldTwo({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.prefixIcon,
//     this.keyboardType = TextInputType.text,
//     this.obscureText = false,
//     this.validator,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       validator: validator,
//       style: TextStyle(
//         color: Colors.brown,
//       ),
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white60,
//         counterText: "",
//         prefixIcon: Padding(
//           padding: const EdgeInsets.only(left: 12.0, right: 8.0),
//           child: Container(
//             width: 1.0,
//             height: 1.0,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.green.shade100,
//             ),
//             child: Center(
//               child: Icon(
//                 prefixIcon,
//                 size: 15,
//                 color: Colors.black,
//               ),
//             ),
//           ),
//         ),
//         contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//         border: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.transparent, width: 1.0),
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey, width: 1.0),
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//         ),
//         hintText: hintText,
//         labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
//           fontWeight: FontWeight.w600,
//           color: Colors.black38,
//           letterSpacing: 1.0,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInputFieldTwo extends StatefulWidget {

  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool readOnly;
  final List<TextInputFormatter>? textInputFormatters;

  const CustomInputFieldTwo({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.readOnly = false,
    this.textInputFormatters,
  }) : super(key: key);

  @override
  _CustomInputFieldTwoState createState() => _CustomInputFieldTwoState();
}

class _CustomInputFieldTwoState extends State<CustomInputFieldTwo> {
  late bool _isObscure;

  @override
  void initState() {
    _isObscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: widget.textInputFormatters ?? [],
      readOnly: widget.readOnly,
      cursorColor: Colors.black54,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _isObscure,
      validator: widget.validator,
      style: const TextStyle(
        color: Colors.black54,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white60,
        counterText: "",
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 8.0),
          child: Container(
            width: 1.0,
            height: 1.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.shade100,
            ),
            child: Center(
              child: Icon(
                widget.prefixIcon,
                size: 15,
                color: Colors.black,
              ),
            ),
          ),
        ),
        contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        hintText: widget.hintText,
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        )
            : null,
        labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.black38,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}

