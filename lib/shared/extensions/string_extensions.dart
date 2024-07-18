extension StringExtensions on String {
  bool get isValidEmail {
    if (isEmpty) return false;
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isEmptyForm {
    if (isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool get isValidName {
    if (isEmpty) return false;
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    if (isEmpty) return false;
    final passwordRegExp = RegExp(
        r'^(?=.*[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isValidPhone {
    if (isEmpty) return false;
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidImageUrl {
    if (isEmpty) return false;
    final uri = Uri.tryParse(this);
    if (uri == null || !(uri.isScheme('http') || uri.isScheme('https'))) {
      return false;
    }

    // final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    // final path = uri.path.toLowerCase();
    // final hasValidExtension =
    //     imageExtensions.any((ext) => path.endsWith('.$ext'));

    // if (!hasValidExtension) return false;

    final hostRegExp =
        RegExp(r"^([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$|^(\d{1,3}\.){3}\d{1,3}$");
    return hostRegExp.hasMatch(uri.host);
  }
}
