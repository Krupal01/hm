import 'package:flutter/material.dart';
import 'package:hotel_management/widgets/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final TextInputType? keyBoardType;
  final bool? obscureText;

  const CustomTextField(
      {Key? key,
      this.hintText,
      this.labelText,
      this.textEditingController,
      this.validator,
      this.keyBoardType,
      this.obscureText})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscure = false;
  @override
  void initState() {
    // TODO: implement initState
    obscure = widget.obscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: widget.textEditingController,
      keyboardType: widget.keyBoardType,
      obscureText: obscure,
      style: blackTextStyles['18N'],
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(bottom: 5, top: 5, right: 10, left: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: widget.labelText,
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: widget.hintText,
        fillColor: Colors.white70,
        errorStyle: errorText,
        suffixIcon: widget.obscureText ?? false
            ? IconButton(
                icon: obscure
                    ? Icon(
                        Icons.visibility_off,
                        color: theme.primaryColor,
                      )
                    : Icon(
                        Icons.visibility,
                        color: theme.primaryColor,
                      ),
                onPressed: () => setState(() {
                  obscure = !obscure;
                }),
              )
            : null,
      ),
      validator: widget.validator,
    );
  }
}
