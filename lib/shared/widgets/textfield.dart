import 'package:delivery_app/shared/extensions/string_extensions.dart';
import 'package:delivery_app/shared/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldType { basic, email, password, number, search, text }

int _passwordLength = 6;

class CustomTextField extends StatefulWidget {
  final EdgeInsetsGeometry? paddingBody;
  final double? cornerRadius;
  final Color? bordersideColor;
  final TextFieldType? textFieldType;
  final String? text;
  final String? labelText;
  final int? maxLength;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTapOutside;
  final FocusNode? focusNode;
  final bool? enabled;
  final bool? autoFocus;
  const CustomTextField(
      {super.key,
      this.paddingBody,
      this.cornerRadius,
      this.bordersideColor,
      this.textFieldType,
      this.text,
      this.controller,
      this.validator,
      this.onFieldSubmitted,
      this.onTapOutside,
      this.focusNode,
      this.enabled,
      this.labelText,
      this.maxLength,
      this.autoFocus});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final double iconSize = 30;
  final double suffixiconSize = 25;
  bool _showText = true;
  bool _isValid = true;
  String? _errorMessage;

  @override
  void initState() {
    if (widget.autoFocus ?? false) {
      _selectAllExistingText();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus ?? false,
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      controller: widget.controller,
      obscureText: obscureText(),
      keyboardType: keyboardType(),
      validator: widget.validator,
      onChanged: (value) {
        checkValidation(value);
      },
      inputFormatters: [inputformatter()],
      onTapOutside: (event) {
        if (widget.focusNode != null) {
          widget.focusNode?.requestFocus();
        } else {
          FocusScope.of(context).unfocus();
        }
        widget.onTapOutside?.call();
      },
      maxLength: lengthInput(),
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(14),
          labelText: widget.labelText ?? labelText(),
          errorText:
              !_isValid && widget.validator != null ? _errorMessage : null,
          hintText: widget.text ?? 'Input ${labelText() ?? "Form"}',
          counterText: '',
          icon: iconTextfield(),
          suffixIcon: suffixiconTextfield()),
    ).marginOnly(right: 10);
  }

  _selectAllExistingText() {
    if (widget.controller != null) {
      widget.controller?.selection = TextSelection(
          baseOffset: 0, extentOffset: (widget.controller?.text.length ?? 0));
    }
  }

  bool obscureText() {
    if (widget.textFieldType == TextFieldType.password) return _showText;
    return false;
  }

  TextInputType? keyboardType() {
    switch (widget.textFieldType) {
      case TextFieldType.basic:
        return null;
      case TextFieldType.email:
        return TextInputType.emailAddress;
      case TextFieldType.password:
        return TextInputType.visiblePassword;
      case TextFieldType.number:
        return TextInputType.number;
      default:
        return null;
    }
  }

  String? labelText() {
    switch (widget.textFieldType) {
      case TextFieldType.basic:
        return null;
      case TextFieldType.email:
        return "Email";
      case TextFieldType.password:
        return "Password";
      default:
        return "Form";
    }
  }

  void checkValidation(String textFieldValue) {
    switch (widget.textFieldType) {
      case TextFieldType.password:
      case TextFieldType.basic:
        String? errorMessage = emptyValidator(textFieldValue);
        _isValid = errorMessage == null ? true : false;
        if (!_isValid) _errorMessage = errorMessage;
        setState(() {});
        break;
      case TextFieldType.email:
        String? errorMessage = emailValidator(textFieldValue);
        _isValid = errorMessage == null ? true : false;
        _errorMessage = errorMessage;
        setState(() {});
        break;
      case TextFieldType.number:
        break;
      default:
    }
  }

  TextInputFormatter inputformatter() {
    TextInputFormatter type;
    switch (widget.textFieldType) {
      case TextFieldType.basic:
        type = FilteringTextInputFormatter.allow(RegExp('[^,\\s]*'));
        break;
      case TextFieldType.number:
        type = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
        break;
      case TextFieldType.password:
        type = FilteringTextInputFormatter.allow(RegExp('[^,\\s]*'));
        break;
      case TextFieldType.text:
        type =
            FilteringTextInputFormatter.deny(RegExp(r'[/\\<>~/|{}^&*$|%#?]'));
        break;
      default:
        type = FilteringTextInputFormatter.allow(RegExp('[^,\\s]*'));
        break;
    }
    return type;
  }

  Widget? iconTextfield() {
    switch (widget.textFieldType) {
      case TextFieldType.basic:
        return null;
      case TextFieldType.email:
        return Icon(Icons.email_outlined, size: iconSize);
      case TextFieldType.password:
        return Icon(Icons.password, size: iconSize);
      default:
        return null;
    }
  }

  Widget? suffixiconTextfield() {
    switch (widget.textFieldType) {
      case TextFieldType.password:
        return InkWell(
            onTap: () {
              _showText = !_showText;
              setState(() {});
            },
            child: Icon(_showText ? Icons.visibility_off : Icons.visibility,
                size: suffixiconSize));
      default:
        return null;
    }
  }

  int lengthInput() {
    if (widget.maxLength != null) return widget.maxLength!;
    switch (widget.textFieldType) {
      case TextFieldType.basic:
        return 50;
      case TextFieldType.email:
        return 50;
      case TextFieldType.password:
        return 12;
      case TextFieldType.number:
        return 15;
      default:
        return 50;
    }
  }
}

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please fill your email';
  }

  if (!value.isValidEmail) return "Email is not valid";
  return null;
}

String? emptyValidator(String? value) {
  if (value?.isEmptyForm ?? true) {
    return 'Please fill this form';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmptyForm) {
    return 'Please enter your password';
  }
  if (value.length < _passwordLength) {
    return 'Password must be at least $_passwordLength characters';
  }
  return null;
}
