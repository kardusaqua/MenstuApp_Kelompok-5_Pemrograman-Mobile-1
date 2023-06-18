import'package:flutter/material.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  InputTextFieldWidget(this.textEditingController, this.hintText);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(30.0),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              alignLabelWithHint: true,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.only(bottom: 15),
              fillColor: Colors.white54,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey),
              focusColor: Color(0xffff597d)),
          ),
        ),
      ),
    );
  }
}