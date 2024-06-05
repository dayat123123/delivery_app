import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
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
      this.enabled});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final double iconSize = 30;
  final double suffixiconSize = 25;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      controller: widget.controller,
      validator: widget.validator,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
        widget.onTapOutside?.call();
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search Food',
          prefixIcon: Icon(Icons.search, size: 25),
          contentPadding: const EdgeInsets.all(18),
          counterText: ''),
    );
  }
}
