import 'package:flutter/services.dart';
import 'package:sangjishik/core_packages.dart';

import 'package:sangjishik/business_logic/utils/string_utils.dart';

class StyledTextField extends StatefulWidget {
  final String label;
  final String? text;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final int numLines;
  final int? maxLength;
  final void Function(String value)? onChanged;
  final void Function(String value)? onSubmit;
  final String? hintText;
  final bool? enabled;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final List<String>? autofillHints;
  final bool autoFocus;
  final TextInputFormatter? textInputFormatter;
  final TextInputAction? textInputAction;

  const StyledTextField({
    Key? key,
    this.label = '',
    this.text,
    this.style,
    this.labelStyle,
    this.numLines = 1,
    this.maxLength,
    this.onChanged,
    this.onSubmit,
    this.hintText,
    this.enabled = true,
    this.focusNode,
    this.controller,
    this.autofillHints,
    this.autoFocus = false,
    this.textInputType = TextInputType.text,
    this.textInputFormatter,
    this.textInputAction,
  }) : super(key: key);

  @override
  State<StyledTextField> createState() => _StyledTextFieldState();
}

class _StyledTextFieldState extends State<StyledTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (StringUtils.isNotEmpty(widget.label)) ...[
          Text(widget.label, style: widget.labelStyle),
          VSpace.xs,
        ],
        TextFormField(
          controller: widget.controller,
          autofillHints: widget.autofillHints,
          textCapitalization: TextCapitalization.sentences,
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.maxLength),
            if (widget.textInputFormatter != null) widget.textInputFormatter!,
          ],
          cursorColor: $styles.colors.primary,
          keyboardType: widget.textInputType,
          onFieldSubmitted: widget.onSubmit,
          onChanged: widget.onChanged,
          initialValue: widget.text,
          enabled: widget.enabled,
          style: widget.style,
          focusNode: widget.focusNode,
          autofocus: widget.autoFocus,
          minLines: widget.numLines,
          maxLines: widget.numLines,
          decoration: InputDecoration(
            hintText: widget.hintText ?? '',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.grey, width: 1, style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide:
                  BorderSide(color: $styles.colors.primary, width: 1, style: BorderStyle.solid),
            ),
            contentPadding: EdgeInsets.only(
              left: $styles.insets.xs,
              right: $styles.insets.xs,
              top: $styles.insets.sm,
              bottom: $styles.insets.sm,
            ),
            isDense: true,
          ),
          textInputAction: widget.textInputAction,
        ),
      ],
    );
  }
}
