import 'package:flutter/material.dart';

class CustomerButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final IconData? iconData;
  final String? imageName;

  const CustomerButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.iconData,
      this.borderColor = Colors.blueAccent,
      this.backgroundColor = Colors.blueAccent,
      this.textColor = Colors.white,
      this.imageName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(6.0)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Center(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 12),
                  imageName != null
                      ? Image.asset(
                          imageName!,
                          height: 20,
                        )
                      : const SizedBox()
                ],
              ),
              const SizedBox(width: 12),
              iconData != null
                  ? Icon(
                      iconData,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  : const SizedBox(height: 0.0),
            ],
          )),
        ),
      ),
    );
  }
}
