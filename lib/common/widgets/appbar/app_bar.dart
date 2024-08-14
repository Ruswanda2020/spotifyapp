import 'package:flutter/material.dart';
import 'package:spotify_app/common/helper/is_dark_mode.dart';

class BesicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBack;
  const BesicAppBar({super.key, this.title, this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shadowColor: Colors.transparent,
      elevation: 0,
      title: title ?? const Text(""),
      backgroundColor: Colors.transparent,
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.03)
                      : Colors.black.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
