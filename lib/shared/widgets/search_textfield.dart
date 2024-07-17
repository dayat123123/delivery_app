import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/misc/style_helpers.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final EdgeInsetsGeometry? paddingBody;
  final double? cornerRadius;
  final Color? bordersideColor;
  final String? text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTapOutside;
  final FocusNode? focusNode;
  final bool? enabled;
  final String? hintText;
  final bool autofocus;
  final double? height;
  final double? iconSize;
  const SearchTextField(
      {super.key,
      this.paddingBody,
      this.cornerRadius,
      this.bordersideColor,
      this.text,
      this.controller,
      this.validator,
      this.onFieldSubmitted,
      this.onTapOutside,
      this.focusNode,
      this.enabled,
      this.hintText,
      this.autofocus = false,
      this.height,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 1,
        borderRadius: StyleHelpers.borderRadiusGeometry,
        color: Colors.transparent,
        shadowColor: context.themeColors.appContainerShadow,
        child: TextFormField(
            autofocus: autofocus,
            enabled: enabled,
            focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            controller: controller,
            validator: validator,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
              onTapOutside?.call();
            },
            decoration: InputDecoration(
                constraints: BoxConstraints.tightFor(height: height ?? 45),
                hintText: hintText ?? 'Search Something',
                prefixIcon: Icon(Icons.search, size: iconSize ?? 25),
                contentPadding: const EdgeInsets.all(18),
                counterText: '')));
  }
}
