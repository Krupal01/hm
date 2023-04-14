import 'package:flutter/material.dart';
import 'package:hotel_management/widgets/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;

  const CustomButton({Key? key, this.onPress, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
      child: Text(
        text,
        style: whiteTextStyles['18N'],
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String text;

  const CustomTextButton({Key? key, this.onPress, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        text,
        style: primaryTextStyles['18N'],
      ),
    );
  }
}
