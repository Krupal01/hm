import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? isDrawerIcon;
  final VoidCallback? onLeadPress;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    this.title,
    this.isDrawerIcon,
    this.onLeadPress,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
      title: Text(
        title ?? "",
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20,
        ),
      ),
      leading: IconButton(
        onPressed: onLeadPress ?? () => Navigator.pop(context),
        icon: Icon(
          (isDrawerIcon ?? false)
              ? Icons.list_sharp
              : Icons.arrow_back_ios_sharp,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
