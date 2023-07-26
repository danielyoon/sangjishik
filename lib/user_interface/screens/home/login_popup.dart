import 'package:flutter/services.dart';
import 'package:sangjishik/business_logic/utils/loading_state_mixin.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/business_logic/utils/string_utils.dart';

void showLoginDialog<T>(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Login',
          style: $styles.text.h3,
          textAlign: TextAlign.center,
        ),
        content: LoginForm(),
      ),
    );

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginFormState extends State<LoginForm> with LoadingStateMixin {
  FormMode _formMode = FormMode.LOGIN;

  FormMode get formMode => _formMode;

  set formMode(FormMode formMode) => setState(() {
        _formMode = formMode;
      });

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  String _errorText = '';

  String get errorText => _errorText;

  set errorText(String errorText) => setState(() => _errorText = errorText);

  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool get enableSubmit {
    return true;
  }

  void _handleSubmitPressed() async {}

  void _obscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void _switchForms() {
    errorText = '';
    formMode == FormMode.LOGIN ? formMode = FormMode.SIGNUP : formMode = FormMode.LOGIN;
    _emailController.text = '';
    _passwordController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    String passwordBtn = obscurePassword ? 'Show' : 'Hide';
    String mainBtn = formMode == FormMode.LOGIN ? 'Submit' : 'Create';

    String bottomText = formMode == FormMode.LOGIN ? 'Not registered?' : 'Already registered?';
    String signUp = formMode == FormMode.LOGIN ? 'Sign Up' : 'Login';

    return SizedBox(
      width: 375,
      child: _buildLoginForm(mainBtn, bottomText, signUp),
    );
  }

  AutofillGroup _buildLoginForm(String mainBtn, String bottomText, String signUp) {
    return AutofillGroup(
      key: ValueKey(formMode),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledTextField(
                label: 'Email',
                style: $styles.text.body,
                labelStyle: $styles.text.bodyBold,
                onChanged: (_) => setState(() {}),
                controller: _emailController,
                autoFocus: true,
              ),
              VSpace.med,
              StyledPasswordTextField(
                label: 'Password',
                style: $styles.text.body,
                labelStyle: $styles.text.bodyBold,
                onChanged: (_) => setState(() {}),
                controller: _passwordController,
                obscureText: obscurePassword,
                onPressed: _obscurePassword,
              ),

              //TODO: Add form for verifying email

              if (_errorText.isNotEmpty) ...[
                VSpace.xs,
                Text(
                  errorText,
                  style: $styles.text.bodySmallBold.copyWith(color: Colors.red),
                ),
                VSpace.xs,
              ],
              VSpace.xs,

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  StyledTextButton(text: 'Forgot Password', onPressed: () => print('Forgot')),
                ],
              ),
              VSpace.med,

              isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: $styles.colors.primary),
                    )
                  : StyledElevatedButton(text: mainBtn, onPressed: () => print('LOGIN')),
              VSpace.med,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(bottomText, style: $styles.text.body),
                  HSpace.xs,
                  GestureDetector(
                      onTap: _switchForms,
                      child: Text(signUp,
                          style: $styles.text.bodyBold.copyWith(color: $styles.colors.primary))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StyledPasswordTextField extends StatefulWidget {
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
  final bool obscureText;
  final VoidCallback? onPressed;

  const StyledPasswordTextField(
      {Key? key,
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
      this.obscureText = false,
      this.onPressed})
      : super(key: key);

  @override
  State<StyledPasswordTextField> createState() => _StyledPasswordTextFieldState();
}

class _StyledPasswordTextFieldState extends State<StyledPasswordTextField> {
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
            suffixIcon: GestureDetector(
              onTap: widget.onPressed,
              child: Icon(
                widget.obscureText ? Icons.check : Icons.close,
                color: widget.obscureText ? Colors.green : Colors.red,
              ),
            ),
          ),
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText,
        ),
      ],
    );
  }
}
