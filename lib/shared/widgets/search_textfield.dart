import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:delivery_app/shared/widgets/spacer.dart';
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
  final String? hintText;
  final bool autofocus;
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
      this.autofocus = false});

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
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(SpacerHelper.borderRadius),
      color: Colors.transparent,
      shadowColor: context.themeColors.appContainerShadow,
      child: TextFormField(
          autofocus: widget.autofocus,
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
              hintText: widget.hintText ?? 'Search Something',
              prefixIcon: const Icon(Icons.search, size: 25),
              contentPadding: const EdgeInsets.all(18),
              counterText: '')),
    );
  }
}
