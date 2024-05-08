import 'package:flutter/material.dart';
import 'package:tucker/core/model/sideBar.dart';
import 'package:tucker/core/utils/colors.dart';

import '../../core/constants/strings.dart';

class SidebarItems {
  static const qrscan = SidebarItem(Icons.home_max_outlined, Strings.qrscan);
  static const profile =
      SidebarItem(Icons.dashboard_customize_outlined, Strings.profile);
  static const wallet = SidebarItem(Icons.payment_outlined, Strings.wallet);
  static const history = SidebarItem(Icons.message_outlined, Strings.history);
  static const live =
      SidebarItem(Icons.money_outlined, Strings.live);
  static const about =
      SidebarItem(Icons.settings_accessibility_outlined, Strings.about);
  static const logout = SidebarItem(Icons.report_off_outlined, Strings.logout);

  static const all = <SidebarItem>[
    qrscan,
    profile,
    wallet,
    history,
    live,
    about,
    logout
  ];
}
class DrawWidget extends StatelessWidget {
   final SidebarItem currentitem;
  final ValueChanged<SidebarItem> onSelectedItems;
   const DrawWidget(
      {super.key, required this.currentitem, required this.onSelectedItems});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Drawer(
      backgroundColor: white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Image(image: AssetImage('assets/images/TUCKER LOGO-1.png'),fit: BoxFit.contain,)
              ],
            ) ),
            ...SidebarItems.all.map(ListTileWidget)
          ],
        ),
      ),
     ),
    );
  }

   Widget ListTileWidget(SidebarItem item) {
    return ListTile(
        selected: currentitem == item,
        leading: Icon(
          item.icons,
          color: darkBlack,
        ),
        title: Text(
          item.title,
          style: const TextStyle(color: darkBlack),
        ),
        onTap: () => onSelectedItems(item));
  }
}

