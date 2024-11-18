import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final double? height;
  final double? width;
  final String text;
  var onPressed;
  final Color color;
  final bool isLoading; // Added isLoading property
  CustomButton({
    this.height,
    this.width,
    required this.onPressed,
    required this.text,
    required this.color,
    this.isLoading = false,
    // Set default value to false
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}


class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    //media Query
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: widget.width ?? width * 0.7, // Use provided width or default to 70% of the screen width
      height: widget.height ?? height * 0.065,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          disabledBackgroundColor: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: widget.isLoading ? null : widget.onPressed,
        child: widget.isLoading
            ? const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        )
            : Text(
          widget.text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}


