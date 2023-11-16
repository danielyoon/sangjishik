import 'package:email_validator/email_validator.dart';
import 'package:sangjishik/controller/utils/loading_state_mixin.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/models/enums.dart';
import 'package:sangjishik/controller/utils/debouncer.dart';
import 'package:sangjishik/ui/screens/home/login_popup.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> with LoadingStateMixin {
  FormMode _formMode = FormMode.LOGIN;

  FormMode get formMode => _formMode;

  set formMode(FormMode formMode) => setState(() => _formMode = formMode);

  Debouncer debouncer = Debouncer(delay: Duration(milliseconds: 300));

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _verificationController;

  bool obscurePassword = true;

  String errorText = '';
  Widget errorIcon = Icon(Icons.error, color: Colors.redAccent);
  Color errorColor = Colors.redAccent;

  bool doubleCheck = false;

  void _obscurePassword() {
    setErrorProperties(text: '');
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void setErrorProperties({String? text, Widget? icon, Color? color}) {
    setState(() {
      if (text != null) errorText = text;
      if (icon != null) errorIcon = icon;
      if (color != null) errorColor = color;
    });
  }

  void _doubleCheckPassword() {
    setErrorProperties(
        text: 'Please make sure you double check your password by clicking the check icon!',
        icon: Icon(Icons.warning, color: Colors.yellowAccent),
        color: Colors.yellowAccent);
    setState(() => doubleCheck = !doubleCheck);
  }

  void _backToPreviousForm() {
    setErrorProperties(text: '');
    _emailController.clear();
    _passwordController.clear();
    _verificationController.clear();
    formMode = FormMode.LOGIN;
  }

  void _toggleLoginForms() {
    if (formMode == FormMode.LOGIN) {
      setErrorProperties(text: '');
      if (!obscurePassword) _obscurePassword();
      _emailController.clear();
      _passwordController.clear();
      formMode = FormMode.SIGNUP;
    } else {
      setErrorProperties(text: '');
      if (!obscurePassword) _obscurePassword();
      _emailController.clear();
      _passwordController.clear();
      formMode = FormMode.LOGIN;
    }
  }

  bool get enableSubmit {
    if (formMode == FormMode.LOGIN) {
      return EmailValidator.validate(_emailController.text) && _passwordController.text.length > 5;
    }

    if (formMode == FormMode.SIGNUP || formMode == FormMode.PASSWORD) {
      return EmailValidator.validate(_emailController.text);
    }

    if (formMode == FormMode.VERIFY) return _verificationController.text.isNotEmpty;
    if (formMode == FormMode.NEW) return _passwordController.text.length > 5;

    return false;
  }

  void submitForm() async {
    if (enableSubmit == false) return;
    setErrorProperties(text: '');
    LoginVerification success;

    debouncer.run(() async {
      if (formMode == FormMode.LOGIN) {
        success = await load(() async => login.loginWithEmail(_emailController.text, _passwordController.text));
        if (success == LoginVerification.PASS) appRouter.go('/');

        if (success == LoginVerification.WRONG || success == LoginVerification.NONEXISTENT) {
          setErrorProperties(
              text: 'Please double check your email or password!',
              icon: Icon(Icons.error, color: Colors.redAccent),
              color: Colors.redAccent);
        }

        if (success == LoginVerification.NETWORK) {
          setErrorProperties(
              text: 'Please check your internet connection.',
              icon: Icon(Icons.warning, color: Colors.yellowAccent),
              color: Colors.yellowAccent);
        }
      }

      if (formMode == FormMode.SIGNUP) {
        success = await load(() async => login.createAccount(_emailController.text));

        if (success == LoginVerification.PASS) {
          formMode = FormMode.VERIFY;
          return;
        } else {
          setErrorProperties(
              text: 'Double check your email address!',
              icon: Icon(Icons.error, color: Colors.redAccent),
              color: Colors.redAccent);
        }

        if (success == LoginVerification.NETWORK) {
          setErrorProperties(
              text: 'Please check your internet connection.',
              icon: Icon(Icons.warning, color: Colors.yellowAccent),
              color: Colors.yellowAccent);
        }
      }

      if (formMode == FormMode.PASSWORD) {
        success = await load(() async => login.forgotPassword(_emailController.text));

        if (success == LoginVerification.PASS) {
          formMode = FormMode.VERIFY;
          return;
        } else {
          setErrorProperties(
              text: 'Double check your email address!',
              icon: Icon(Icons.error, color: Colors.redAccent),
              color: Colors.redAccent);
        }

        if (success == LoginVerification.NETWORK) {
          setErrorProperties(
              text: 'Please check your internet connection.',
              icon: Icon(Icons.warning, color: Colors.yellowAccent),
              color: Colors.yellowAccent);
        }
      }

      if (formMode == FormMode.VERIFY) {
        success = await load(() async => login.verifyCode(_emailController.text, _verificationController.text));

        if (success == LoginVerification.PASS) {
          formMode = FormMode.NEW;
          return;
        } else {
          setErrorProperties(
              text: 'Wrong verification code!',
              icon: Icon(Icons.error, color: Colors.redAccent),
              color: Colors.redAccent);
        }

        if (success == LoginVerification.NETWORK) {
          setErrorProperties(
              text: 'Please check your internet connection.',
              icon: Icon(Icons.warning, color: Colors.yellowAccent),
              color: Colors.yellowAccent);
        }
      }

      if (formMode == FormMode.NEW) {
        if (obscurePassword && !doubleCheck || obscurePassword && doubleCheck) {
          _doubleCheckPassword();
          return;
        }
        success = await load(() async => login.createNewPassword(_emailController.text, _passwordController.text));

        if (success == LoginVerification.PASS) {
          appRouter.go('/');
        } else {
          setErrorProperties(
              text: 'Please check your internet connection.',
              icon: Icon(Icons.warning, color: Colors.yellowAccent),
              color: Colors.yellowAccent);
        }
      }
    });
  }

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

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Stack(
            children: [
              formMode != FormMode.LOGIN && formMode != FormMode.SIGNUP
                  ? Positioned(
                      left: 0,
                      top: -5,
                      child: CustomBackButton(
                        onPressed: () => _backToPreviousForm(),
                      ),
                    )
                  : Container(),
              Center(child: Text(formMode.title, style: kHeader)),
            ],
          ),
          Gap(kLarge),
          formMode == FormMode.LOGIN || formMode == FormMode.SIGNUP || formMode == FormMode.PASSWORD
              ? CustomTextField(
                  controller: _emailController,
                  label: 'Email',
                  autoFocus: true,
                  autofillHints: const [AutofillHints.email],
                  onChanged: (_) => setState(() {
                    setErrorProperties(text: '');
                  }),
                )
              : Container(),
          formMode == FormMode.LOGIN ? Gap(kSmall) : Container(),
          formMode != FormMode.VERIFY && formMode != FormMode.PASSWORD && formMode != FormMode.SIGNUP
              ? CustomTextField(
                  controller: _passwordController,
                  label: 'Password',
                  autofillHints: const [AutofillHints.password],
                  obscureText: obscurePassword,
                  onPressed: _obscurePassword,
                  onChanged: (_) => setState(() {
                    setErrorProperties(text: '');
                  }),
                )
              : Container(),
          formMode == FormMode.VERIFY
              ? CustomTextField(
                  controller: _verificationController,
                  label: 'Verification Code',
                  onChanged: (_) => setState(() {
                    setErrorProperties(text: '');
                  }),
                )
              : Container(),
          formMode == FormMode.LOGIN
              ? Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    text: 'FORGOT PASSWORD?',
                    style: kBodyText.copyWith(fontSize: kExtraExtraSmall + 2),
                    onPressed: () => formMode = FormMode.PASSWORD,
                  ),
                )
              : Container(),
          formMode == FormMode.LOGIN ? Gap(kExtraExtraSmall) : Gap(kMedium),
          if (errorText.isNotEmpty) ...[
            Container(
              width: width,
              padding: EdgeInsets.symmetric(horizontal: kExtraSmall, vertical: kExtraExtraSmall),
              decoration: BoxDecoration(
                  border: Border.all(color: errorColor), borderRadius: BorderRadius.circular(kExtraExtraSmall)),
              child: Row(
                children: [
                  errorIcon,
                  Gap(kExtraSmall),
                  Expanded(
                    child: Text(errorText, style: kCaption),
                  )
                ],
              ),
            ),
            Gap(kSmall),
          ],
          isLoading
              ? const CustomLoadingAnimation()
              : CustomPrimaryButton(
                  text: formMode.button,
                  onPressed: enableSubmit ? submitForm : null,
                ),
          Gap(kSmall),
          formMode != FormMode.NEW && formMode != FormMode.PASSWORD
              ? LoginToggle(formMode: formMode, onPressed: _toggleLoginForms)
              : Container(),
          Spacer(),
        ],
      ),
    );
  }
}
