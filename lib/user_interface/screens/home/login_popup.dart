import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:sangjishik/business_logic/utils/loading_state_mixin.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/business_logic/utils/string_utils.dart';

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

enum FormMode { LOGIN, SIGNUP, VERIFY, PASSWORD }

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
    bool emailAndPassAreValid =
        EmailValidator.validate(_emailController.text) && _passwordController.text.length >= 6;
    return emailAndPassAreValid;
  }

  void _handleSubmitPressed() async {
    if (enableSubmit == false) return;
    errorText = '';

    if (formMode == FormMode.SIGNUP) {
      await load(() async => await userService.sendVerificationEmail(_emailController.text));

      formMode = FormMode.VERIFY;
      return;
    }

    if (formMode == FormMode.VERIFY) {
      bool success = await load(() async =>
          await userService.createAccount(_emailController.text, _passwordController.text));

      if (!success) {
        errorText = 'Wrong verification code';
        return;
      }
    }

    bool success = await load(() async =>
        await userService.loginWithEmail(_emailController.text, _passwordController.text));

    if (!success) {
      errorText = 'Wrong email and password!';
      return;
    }
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
                        BackButton(),
                        HSpace.med,
                        Center(
                          child: Text(
                            verificationTitle,
                            style: $styles.text.h3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    VSpace.med,
                    StyledTextField(
                      label: formMode == FormMode.VERIFY ? 'Verification Code' : 'Forgotten Email',
                      style: $styles.text.body,
                      labelStyle: $styles.text.bodyBold,
                      onChanged: (_) => setState(() {}),
                      controller:
                          formMode == FormMode.VERIFY ? _verificationController : _emailController,
                      autoFocus: true,
                    ),
                    if (_errorText.isNotEmpty) ...[
                      VSpace.xs,
                      Text(
                        errorText,
                        style: $styles.text.bodySmallBold.copyWith(color: Colors.red),
                      ),
                      VSpace.xs,
                    ],
                    VSpace.xs,
                    VSpace.med,
                    isLoading
                        ? Center(
                            child: CircularProgressIndicator(color: $styles.colors.primary),
                          )
                        : StyledElevatedButton(
                            text: formMode == FormMode.VERIFY ? 'CREATE ACCOUNT' : 'RESET PASSWORD',
                            onPressed: enableSubmit ? _handleSubmitPressed : null),
                    VSpace.med,
                    if (formMode == FormMode.VERIFY) ...[
                      Row(
                        children: [
                          Text("Didn't receive email?", style: $styles.text.body),
                          HSpace.xs,
                          GestureDetector(
                              onTap: () =>
                                  userService.resendVerificationEmail(_emailController.text),
                              child: Text('Send Again',
                                  style: $styles.text.bodyBold
                                      .copyWith(color: $styles.colors.primary))),
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
                          'Login',
                          style: $styles.text.h3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      VSpace.med,
                      StyledTextField(
                        label: 'Email',
                        style: $styles.text.body,
                        labelStyle: $styles.text.bodyBold,
                        onChanged: (_) => setState(() {}),
                        autofillHints: const [AutofillHints.email],
                        controller: _emailController,
                        autoFocus: true,
                      ),
                      VSpace.med,
                      StyledPasswordTextField(
                        label: formMode == FormMode.LOGIN ? 'Password' : 'Would be password',
                        style: $styles.text.body,
                        labelStyle: $styles.text.bodyBold,
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
                          style: $styles.text.bodySmallBold.copyWith(color: Colors.red),
                        ),
                        VSpace.xs,
                      ],
                      VSpace.xs,
                      if (formMode == FormMode.LOGIN) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StyledTextButton(
                                text: 'Forgot Password', onPressed: () => _forgotPassword()),
                          ],
                        ),
                      ],
                      VSpace.med,
                      isLoading
                          ? Center(
                              child: CircularProgressIndicator(color: $styles.colors.primary),
                            )
                          : StyledElevatedButton(
                              text: mainBtn, onPressed: enableSubmit ? _handleSubmitPressed : null),
                      VSpace.med,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(bottomText, style: $styles.text.body),
                          HSpace.xs,
                          GestureDetector(
                              onTap: _switchForms,
                              child: Text(signUp,
                                  style: $styles.text.bodyBold
                                      .copyWith(color: $styles.colors.primary))),
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
