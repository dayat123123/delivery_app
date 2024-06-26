import 'package:delivery_app/shared/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  final BoxConstraints? constraints;
  final void Function(Object?)? onSelected;
  final Widget child;
  final List<PopupMenuItemCustom> popupmenuitem;
  final bool? enabled;
  const CustomDropDownButton(
      {super.key,
      this.constraints,
      this.onSelected,
      required this.child,
      this.enabled,
      required this.popupmenuitem});
  @override
  Widget build(BuildContext context) {
    final themeColors = context.themeColors;
    return Theme(
        data: context.theme.copyWith(splashColor: Colors.transparent),
        child: PopupMenuButton(
            tooltip: '',
            popUpAnimationStyle:
                AnimationStyle(duration: const Duration(milliseconds: 350)),
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            enabled: enabled ?? true,
            onSelected: onSelected,
            elevation: 0,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: themeColors.border),
                borderRadius: BorderRadius.circular(10)),
            color: themeColors.appContainerBackground,
            constraints: constraints ??
                const BoxConstraints.tightFor(height: 150, width: 150),
            child: child,
            itemBuilder: (context) => _generateList()));
  }

  List<PopupMenuItem> _generateList() {
    return popupmenuitem.map((item) {
      return PopupMenuItem(
        value: item.value,
        onTap: item.onTap,
        child: item.widget,
      );
    }).toList();
  }
}

class PopupMenuItemCustom {
  final Widget widget;
  final dynamic value;
  final void Function()? onTap;
  PopupMenuItemCustom({required this.widget, this.value, this.onTap});
}
