import 'package:flutter/material.dart';

class Customertextbutton extends StatelessWidget {
  final String text;
  final VoidCallback onClic;
  final IconData? leadingIcon;
  final IconData? trailingIcon;

  const Customertextbutton(
      {super.key,
      required this.text,
      required this.onClic,
      this.leadingIcon,
      this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClic,
      child: Row(
        children: [
          leadingIcon != null
              ? Icon(
                  leadingIcon,
                  color: Theme.of(context).colorScheme.onSurface,
                )
              : const SizedBox(),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          trailingIcon != null
              ? Icon(
                  trailingIcon,
                  color: Theme.of(context).colorScheme.onSurface,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
