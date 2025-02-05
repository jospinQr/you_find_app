import 'package:flutter/material.dart';

class Customertextfield extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final Function(String) onTextChanged;
  final bool? isObscure;
  final Function? onSufficIconClick;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  const Customertextfield(
      {super.key,
      required this.label,
      this.prefixIcon,
      this.sufixIcon,
      required this.onTextChanged,
      this.isObscure = false,
      this.onSufficIconClick,
      this.textInputAction = TextInputAction.done,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        TextFormField(
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: isObscure!,
          onChanged: onTextChanged,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                : null,
            suffixIcon: sufixIcon != null
                ? InkWell(
                    child: Icon(
                      sufixIcon,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    onTap: () {
                      onSufficIconClick!();
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface, width: 2.4),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 2.4),
            ),
          ),
          cursorColor: Theme.of(context).colorScheme.onSurface,
          textInputAction: textInputAction,
        ),
      ],
    );
  }
}
