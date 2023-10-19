import 'package:flutter/services.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/utils/string_utils.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final int numLines;
  final int? maxLength;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmit;
  final String? hintText;
  final bool enabled;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<String>? autofillHints;
  final bool autoFocus;
  final TextInputFormatter? textInputFormatter;
  final bool obscureText;
  final VoidCallback? onPressed;

  const CustomTextField({
    super.key,
    this.label = '',
    this.numLines = 1,
    this.maxLength,
    this.onChanged,
    this.onSubmit,
    this.hintText,
    this.enabled = true,
    this.focusNode,
    this.controller,
    this.textInputType = TextInputType.text,
    this.autofillHints,
    this.autoFocus = false,
    this.textInputFormatter,
    this.obscureText = false,
    this.onPressed,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (StringUtils.isNotEmpty(widget.label)) ...[
          Text(widget.label, style: kCaption),
          VSpace.xxs,
        ],
        TextFormField(
          controller: widget.controller,
          autofillHints: widget.autofillHints,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.maxLength),
            if (widget.textInputFormatter != null) widget.textInputFormatter!,
          ],
          keyboardType: widget.textInputType,
          onFieldSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          autofocus: widget.autoFocus,
          minLines: widget.numLines,
          maxLines: widget.numLines,
          cursorColor: Colors.black,
          obscureText: widget.obscureText,
          style: kBodyText,
          decoration: InputDecoration(
            hintText: widget.hintText ?? '',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kExtraExtraSmall),
              borderSide: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kExtraExtraSmall),
              borderSide: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kExtraExtraSmall),
              borderSide: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
            ),
            contentPadding: EdgeInsets.all(kExtraSmall + 2),
            isDense: true,
            suffixIcon: widget.obscureText || widget.label == 'Password'
                ? GestureDetector(
                    onTap: widget.onPressed,
                    child: Icon(
                      widget.obscureText ? Icons.check : Icons.close,
                      color: widget.obscureText ? Colors.green : Colors.red,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
