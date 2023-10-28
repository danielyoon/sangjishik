import 'package:email_validator/email_validator.dart';
import 'package:sangjishik/controller/models/enums.dart';
import 'package:sangjishik/controller/utils/loading_state_mixin.dart';
import 'package:sangjishik/core_packages.dart';

Future<void> showLoginPopup<T>(BuildContext context) async {
  return showDialog(context: context, builder: (context) => LoginPopup());
}

class LoginPopup extends StatefulWidget {
  const LoginPopup({super.key});

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> with LoadingStateMixin {
  FormMode _formMode = FormMode.LOGIN;

  FormMode get formMode => _formMode;

  set formMode(FormMode formMode) => setState(() => _formMode = formMode);

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
    if (formMode == FormMode.LOGIN || formMode == FormMode.SIGNUP) {
      return EmailValidator.validate(_emailController.text) && _passwordController.text.length > 5;
    }

    return false;
  }

  void submitForm() async {
    if (enableSubmit == false) return;
    setErrorProperties(text: '');
    bool success;

    if (formMode == FormMode.LOGIN) {
      //TODO: Finish test cases for login process
      LoginVerification loginSuccess =
          await load(() async => login.loginWithEmail(_emailController.text, _passwordController.text));
    }

    if (formMode == FormMode.SIGNUP) {
      if (obscurePassword && !doubleCheck || obscurePassword && doubleCheck) {
        _doubleCheckPassword();
        return;
      }
      success = await load(() => login.createAccount(_emailController.text, _passwordController.text));

      if (success) {
        formMode = FormMode.VERIFY;
      } else {
        setErrorProperties(
            text: 'Your email may already exist!',
            icon: Icon(Icons.error, color: Colors.redAccent),
            color: Colors.redAccent);
      }
    }

    if (formMode == FormMode.PASSWORD) {
      success = await load(() => login.forgotPassword(_emailController.text));

      if (success) formMode = FormMode.VERIFY;
    }

    if (formMode == FormMode.VERIFY) {
      success = await load(() => login.verifyCode(_verificationController.text));

      if (success && _passwordController.text.isNotEmpty) formMode = FormMode.NEW;
      if (success) appRouter.pop();
    }

    if (formMode == FormMode.NEW) {
      if (obscurePassword && !doubleCheck || obscurePassword && doubleCheck) {
        _doubleCheckPassword();
        return;
      }
      success = await load(() => login.createNewPassword(_passwordController.text));

      if (success) appRouter.pop();
    }
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
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: PopupTitle(formMode: formMode, onPressed: _backToPreviousForm),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
          formMode == FormMode.LOGIN || formMode == FormMode.SIGNUP ? VSpace.sm : Container(),
          formMode != FormMode.VERIFY && formMode != FormMode.PASSWORD
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
          formMode == FormMode.LOGIN ? VSpace.xxs : VSpace.md,
          if (errorText.isNotEmpty) ...[
            Container(
              width: 280,
              padding: EdgeInsets.symmetric(horizontal: kExtraSmall, vertical: kExtraExtraSmall),
              decoration: BoxDecoration(
                  border: Border.all(color: errorColor), borderRadius: BorderRadius.circular(kExtraExtraSmall)),
              child: Row(
                children: [
                  errorIcon,
                  HSpace.xs,
                  Expanded(
                    child: Text(errorText, style: kCaption),
                  )
                ],
              ),
            ),
            VSpace.sm,
          ],
          isLoading
              ? const CustomLoadingAnimation()
              : CustomPrimaryButton(
                  text: formMode.button,
                  onPressed: enableSubmit ? submitForm : null,
                ),
          VSpace.sm,
          formMode != FormMode.NEW && formMode != FormMode.PASSWORD
              ? LoginToggle(formMode: formMode, onPressed: _toggleLoginForms)
              : Container(),
        ],
      ),
    );
  }
}

class LoginToggle extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginToggle({
    super.key,
    required this.formMode,
    required this.onPressed,
  });

  final FormMode formMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          formMode.extra,
          style: kBodyText.copyWith(fontSize: kExtraSmall),
        ),
        HSpace.xs,
        CustomTextButton(
          onPressed: () => onPressed(),
          text: formMode.extra2,
          style: kCaption,
        ),
      ],
    );
  }
}

class PopupTitle extends StatelessWidget {
  final VoidCallback onPressed;

  const PopupTitle({
    super.key,
    required this.formMode,
    required this.onPressed,
  });

  final FormMode formMode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: kMedium),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  formMode.title,
                  style: kHeader,
                ),
              ),
            ],
          ),
        ),
        formMode != FormMode.LOGIN && formMode != FormMode.SIGNUP
            ? Positioned(
                left: 0,
                top: 19,
                child: CustomBackButton(
                  onPressed: () => onPressed(),
                ),
              )
            : Container(),
        Positioned(
          right: 0,
          top: 0,
          child: IconButton(
            onPressed: () => appRouter.pop(),
            icon: Icon(
              Icons.cancel,
              size: kSmall,
              color: Colors.redAccent,
            ),
            splashRadius: .1,
          ),
        ),
      ],
    );
  }
}
