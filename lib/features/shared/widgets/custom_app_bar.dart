import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    super.key,
    this.bottomWidget,
    this.backgroundColor,
    this.trailing,
    this.centerTitle = false,
  });
  final String title;
  final PreferredSizeWidget? bottomWidget;
  final Color? backgroundColor;
  final Widget? trailing;
  final bool? centerTitle;

  @override
  Widget build(BuildContext context) {
    final hasDrawer = Scaffold.of(context).hasDrawer;
    final canPop = Navigator.of(context).canPop();
    return AppBar(
      title: Text(title, style: textExtraBold3XContent24.copyWith(color: primary.shade200,fontSize: 25)),
      actions: [trailing ?? const SizedBox.shrink()],
      surfaceTintColor: Colors.transparent,
      elevation: bottomWidget != null ? 1 : null,
      backgroundColor: backgroundColor ?? Colors.white,
      leading: leadingIcon(context, hasDrawer: hasDrawer, canPop: canPop),
      bottom: bottomWidget,
      centerTitle: centerTitle,
      // leadingWidth: context.screenWidth * 0.1,
      // titleSpacing: 10,
    );
  }

  Widget? leadingIcon(
      BuildContext context, {
        required bool hasDrawer,
        required bool canPop,
      }) {
    if (canPop) {
      return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(
          Icons.arrow_back_ios
        ),
      );
    }
    return null;
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(bottomWidget != null ? 100 : kToolbarHeight);
}
