enum FormMode { LOGIN, SIGNUP, VERIFY, PASSWORD, NEW }

enum LoginVerification { WRONG, NONEXISTENT, NETWORK, PASS }

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

  String get button {
    switch (this) {
      case FormMode.LOGIN:
        return 'SUBMIT';
      case FormMode.SIGNUP:
        return 'SIGN UP';
      case FormMode.VERIFY:
        return 'VERIFY';
      case FormMode.PASSWORD:
        return 'CONFIRM';
      case FormMode.NEW:
        return 'CONFIRM';
      default:
        return '';
    }
  }

  String get extra {
    switch (this) {
      case FormMode.LOGIN:
        return 'No account?';
      case FormMode.SIGNUP:
        return 'Have account?';
      case FormMode.VERIFY:
        return 'Resend code?';
      default:
        return '';
    }
  }

  String get extra2 {
    switch (this) {
      case FormMode.LOGIN:
        return 'Sign Up';
      case FormMode.SIGNUP:
        return 'Login';
      case FormMode.VERIFY:
        return 'Send Code';
      default:
        return '';
    }
  }
}
