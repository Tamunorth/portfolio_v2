import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextBoxField extends StatefulWidget {
  final String? label;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType keyBoardType;
  final bool hasBottomPadding;
  final String? Function(String?)? validator;
  final bool isEnabled;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool isPasswordField;
  final void Function(String)? onSubmit;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final void Function(String)? onValueChnaged;

  const TextBoxField({
    Key? key,
    this.label,
    this.isEnabled = true,
    // this.isTextObscured = false,
    required this.controller,
    this.hintText,
    this.keyBoardType = TextInputType.text,
    this.hasBottomPadding = false,
    this.validator,
    this.isPasswordField = false,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onSubmit,
    this.onTap,
    this.onValueChnaged,
  }) : super(key: key);

  @override
  State<TextBoxField> createState() => _TextBoxFieldState();
}

class _TextBoxFieldState extends State<TextBoxField> {
  bool onChanged = false;
  bool showPasswordText = false;
  bool showIcon = false;
  bool isTextObscured = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      margin: widget.hasBottomPadding
          ? EdgeInsets.only(top: 0, bottom: 16.h)
          : EdgeInsets.only(top: 0, bottom: 0),
      // decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     border: Border.all(color: Pallets.grey75)),
      // padding: widget.label == null
      //     ? EdgeInsets.only(top: 5, bottom: 5)
      //     : EdgeInsets.only(top: 10, bottom: 5),
      child: TextFormField(
        onChanged: widget.onValueChnaged,
        enabled: widget.isEnabled,
        validator: widget.validator,
        onFieldSubmitted: widget.onSubmit,
        onTap: widget.onTap,
        focusNode: widget.focusNode,
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        obscureText: widget.isPasswordField && isTextObscured,
        obscuringCharacter: '*',
        // cursorColor: Pallets.primary,
        cursorWidth: 1.5,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 0,
          ),
          errorMaxLines: 1,
          label: widget.label != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(widget.label ?? ''),
                )
              : null,
          hintText: widget.hintText,
          // constraints: BoxConstraints(maxHeight: 40, minHeight: 40),
          prefixIcon: widget.prefixIcon,
          suffix: widget.isPasswordField
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      isTextObscured = !isTextObscured;
                      // widget.errorText = null;
                    });
                  },
                  child: Icon(
                    isTextObscured
                        ? CupertinoIcons.eye_slash
                        : Icons.remove_red_eye_outlined,
                    size: 24.0,
                    // color: Pallets.primary,
                  ),
                )
              : widget.suffixIcon ?? widget.suffixIcon,
          hintStyle: const TextStyle(
            // color: Pallets.grey50,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
          // errorStyle: TextStyle(fontSize: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              // color: Pallets.grey75,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderSide: BorderSide.none,
          // ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              // color: Pallets.red,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),

          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              // color: Pallets.grey75,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              // color: Pallets.grey75,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          // disabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide.none,
          // ),
        ),
      ),
    );
  }
}
