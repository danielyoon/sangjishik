import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/models/enums.dart';
import 'package:sangjishik/controller/utils/loading_state_mixin.dart';
import 'package:sangjishik/controller/utils/string_utils.dart';

void showLoginDialog<T>(BuildContext context) async => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: LoginForm(),
      ),
    );

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with LoadingStateMixin {
  FormMode _formMode = FormMode.LOGIN;

  FormMode get formMode => _formMode;

  set formMode(FormMode formMode) => setState(() {
        _formMode = formMode;
      });

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _verificationController;

  String _errorText = '';

  String get errorText => _errorText;

  set errorText(String errorText) => setState(() => _errorText = errorText);

  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _verificationController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _verificationController.dispose();
    super.dispose();
  }

  bool get enableSubmit {
    bool emailAndPassAreValid = EmailValidator.validate(_emailController.text) && _passwordController.text.length >= 6;

    if (formMode == FormMode.VERIFY) {
      if (_verificationController.text.length > 2) return true;
      return false;
    }
    return emailAndPassAreValid;
  }

  void _handleSubmitPressed() async {
    // if (enableSubmit == false) return;
    // errorText = '';
    //
    // if (formMode == FormMode.SIGNUP) {
    //   await load(() async => await login.sendVerificationEmail(_emailController.text));
    //
    //   formMode = FormMode.VERIFY;
    //   return;
    // }
    //
    // if (formMode == FormMode.VERIFY) {
    //   bool success = await load(() async =>
    //       await login.createAccount(_emailController.text, _passwordController.text, _verificationController.text));
    //
    //   if (!success) {
    //     errorText = 'Wrong verification code';
    //     return;
    //   }
    // }
    //
    // if (formMode == FormMode.LOGIN) {
    //   bool success =
    //       await load(() async => await login.loginWithEmail(_emailController.text, _passwordController.text));
    //
    //   if (!success) {
    //     errorText = 'Wrong email and password!';
    //     return;
    //   }
    //
    //   if (mounted) {
    //     context.pop();
    //   }
    // }
    //
    // if (formMode == FormMode.PASSWORD) {
    //   bool success = await load(() async => await login.forgotPassword(_emailController.text));
    //
    //   if (!success) {
    //     errorText = "Email doesn't exist!";
    //     return;
    //   }
    //
    //   if (mounted) {
    //     context.pop();
    //   }
    // }
  }

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

  void _forgotPassword() {
    errorText = '';

    formMode = FormMode.PASSWORD;
    _emailController.text = '';
    _passwordController.text = '';
  }

  void _backButtonFunction() {
    if (formMode == FormMode.PASSWORD) {
      formMode = FormMode.LOGIN;
      _emailController.text = '';
    }

    if (formMode == FormMode.VERIFY) {
      formMode = FormMode.SIGNUP;
      _emailController.text = '';
      _passwordController.text = '';
      _verificationController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String mainBtn = formMode == FormMode.LOGIN ? 'SUBMIT' : 'CREATE';

    String bottomText = formMode == FormMode.LOGIN ? 'Not registered?' : 'Already registered?';
    String signUp = formMode == FormMode.LOGIN ? 'Sign Up' : 'Login';

    String verificationTitle = formMode == FormMode.VERIFY ? 'Verify Email' : 'Forgot Password?';

    return SizedBox(
      width: 375,
      child: formMode == FormMode.VERIFY || formMode == FormMode.PASSWORD
          ? Form(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        BackButton(
                          onPressed: () => _backButtonFunction(),
                        ),
                        HSpace.md,
                        Center(
                          child: Text(
                            verificationTitle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    VSpace.md,
                    StyledTextField(
                      label: formMode == FormMode.VERIFY ? 'Verification Code' : 'Forgotten Email',
                      onChanged: (_) => setState(() {}),
                      controller: formMode == FormMode.VERIFY ? _verificationController : _emailController,
                      autoFocus: true,
                    ),
                    if (_errorText.isNotEmpty) ...[
                      VSpace.xs,
                      Text(
                        errorText,
                      ),
                      VSpace.xs,
                    ],
                    VSpace.xs,
                    VSpace.md,
                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(color: kPrimary),
                          )
                        : StyledElevatedButton(
                            text: formMode == FormMode.VERIFY ? 'CREATE ACCOUNT' : 'RESET PASSWORD',
                            onPressed: enableSubmit ? _handleSubmitPressed : null),
                    VSpace.md,
                    if (formMode == FormMode.VERIFY) ...[
                      Row(
                        children: [
                          Text("Didn't receive email?"),
                          HSpace.xs,
                          GestureDetector(
                              // onTap: () => login.sendVerificationEmail(_emailController.text),
                              child: Text(
                            'Send Again',
                          )),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            )
          : AutofillGroup(
              key: ValueKey(formMode),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          formMode == FormMode.LOGIN ? 'Login' : 'Sign Up',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      VSpace.md,
                      StyledTextField(
                        label: 'Email',
                        onChanged: (_) => setState(() {}),
                        autofillHints: const [AutofillHints.email],
                        controller: _emailController,
                        autoFocus: true,
                      ),
                      VSpace.md,
                      StyledPasswordTextField(
                        label: formMode == FormMode.LOGIN ? 'Password' : 'Would be password',
                        onChanged: (_) => setState(() {}),
                        autofillHints: const [AutofillHints.password],
                        controller: _passwordController,
                        obscureText: obscurePassword,
                        onPressed: _obscurePassword,
                      ),
                      if (_errorText.isNotEmpty) ...[
                        VSpace.xs,
                        Text(
                          errorText,
                        ),
                        VSpace.xs,
                      ],
                      VSpace.xs,
                      if (formMode == FormMode.LOGIN) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StyledTextButton(text: 'Forgot Password', onPressed: () => _forgotPassword()),
                          ],
                        ),
                      ],
                      VSpace.md,
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator(color: kPrimary),
                            )
                          : StyledElevatedButton(text: mainBtn, onPressed: enableSubmit ? _handleSubmitPressed : null),
                      VSpace.md,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bottomText,
                          ),
                          HSpace.xs,
                          GestureDetector(onTap: _switchForms, child: Text(signUp)),
                        ],
                      ),
                    ],
                  ),
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
            ),
            contentPadding: EdgeInsets.only(),
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
