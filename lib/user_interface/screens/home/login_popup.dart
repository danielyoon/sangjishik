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
      title: Stack(
        children: [
          Center(
            child: Text(
              formMode.title,
              style: kHeader,
            ),
          ),
          Positioned(
            right: -10,
            top: -10,
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
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: _emailController,
            label: 'Email',
            enabled: true,
            autoFocus: true,
            autofillHints: const [AutofillHints.email],
            onChanged: (_) => setState(() {}),
          ),
          VSpace.sm,
          CustomTextField(
            controller: _passwordController,
            label: 'Password',
            enabled: true,
            autofillHints: const [AutofillHints.password],
            obscureText: obscurePassword,
            onPressed: _obscurePassword,
            onChanged: (_) => setState(() {}),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomTextButton(
              text: 'FORGOT PASSWORD?',
              style: kBodyText.copyWith(fontSize: kExtraExtraSmall + 2),
              onPressed: () => print('PASSWORD!'),
            ),
          ),
          VSpace.xxs,
          CustomPrimaryButton(
            text: 'LOGIN',
            onPressed: () => print('HI!'),
          ),
          VSpace.sm,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No account?',
                style: kBodyText.copyWith(fontSize: kExtraSmall),
              ),
              HSpace.xs,
              CustomTextButton(
                onPressed: () => print('Something'),
                text: 'Sign Up',
                style: kCaption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

extension FormModeExtension on FormMode {
  String get title {
    switch (this) {
      case FormMode.LOGIN:
        return 'Login';
      case FormMode.SIGNUP:
        return 'Sign Up';
      case FormMode.VERIFY:
        return 'Verify Code';
      case FormMode.PASSWORD:
        return 'Forgot Password';
      case FormMode.NEW:
        return 'Create Password';
      default:
        return '';
    }
  }
}
