import 'package:sangjishik/controller/models/enums.dart';
import 'package:sangjishik/core_packages.dart';

Future<void> showLoginPopup<T>(BuildContext context) async {
  return showDialog(context: context, builder: (context) => LoginPopup());
}

class LoginPopup extends StatefulWidget {
  const LoginPopup({super.key});

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  FormMode _formMode = FormMode.LOGIN;

  FormMode get formMode => _formMode;

  set formMode(FormMode formMode) => setState(() => _formMode = formMode);

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _verificationController;

  bool obscurePassword = true;

  void _obscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void _backToPreviousForm() {
    if (formMode == FormMode.PASSWORD) formMode = FormMode.LOGIN;
  }

  void _toggleLoginForms() {
    if (formMode == FormMode.LOGIN) {
      formMode = FormMode.SIGNUP;
    } else {
      formMode = FormMode.LOGIN;
    }
  }

  void submitForm() async {
    print('Hi!');
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
          CustomTextField(
            controller: _emailController,
            label: 'Email',
            autoFocus: true,
            autofillHints: const [AutofillHints.email],
            onChanged: (_) => setState(() {}),
          ),
          VSpace.sm,
          CustomTextField(
            controller: _passwordController,
            label: 'Password',
            autofillHints: const [AutofillHints.password],
            obscureText: obscurePassword,
            onPressed: _obscurePassword,
            onChanged: (_) => setState(() {}),
          ),
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
          formMode == FormMode.LOGIN ? VSpace.xxs : VSpace.lg,
          CustomPrimaryButton(
            text: formMode.button,
            onPressed: () => submitForm(),
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
