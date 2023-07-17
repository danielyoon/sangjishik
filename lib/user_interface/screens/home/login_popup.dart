import 'package:sangjishik/core_packages.dart';

Future<void> showLoginDialog<T>(BuildContext context) async => showDialog(
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

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  String _errorText = '';

  String get errorText => _errorText;

  set errorText(String errorText) => setState(() => _errorText = errorText);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: $styles.colors.background,
      child: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
