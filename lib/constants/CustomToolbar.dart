import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomToolbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: SvgPicture.asset("assets/avtar.svg"),
      actions: [
        SvgPicture.asset("assets/sos.svg"),
        SvgPicture.asset("assets/notification.svg"),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
