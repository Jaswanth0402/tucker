import 'package:flutter/material.dart';
import 'package:tucker/Widget/drawer/aboutWidget.dart';
import 'package:tucker/Widget/drawer/bluetoothWidget.dart';
import 'package:tucker/Widget/component/drawWidget.dart';
import 'package:tucker/Widget/drawer/profilePage.dart';
import 'package:tucker/Widget/drawer/qrWidget.dart';
import 'package:tucker/core/constants/strings.dart';
import 'package:tucker/core/model/sideBar.dart';
import '../component/loadingWidget.dart';

class MainDashboard extends StatefulWidget {
  const MainDashboard({super.key});

  @override
  State<MainDashboard> createState() => _MainDashboardState();
}

class _MainDashboardState extends State<MainDashboard> {
late SidebarItem currentitem;
 late String title;
@override
  void initState() {
    super.initState();
  currentitem = SidebarItems.about  ;
 
  }
  @override
  Widget build(BuildContext context) {
     setState(() {
    title =Strings.about;
  });
    return  SafeArea(
      child: Scaffold(
      appBar: AppBar(
        
                // leading: Builder(
                //   builder: (BuildContext context) {
                //     return IconButton(
                //       icon: const Icon(
                //         Icons.menu,
                //         color: darkBlack,
                //       ),
                //       onPressed: () {
                //         Scaffold.of(context).openDrawer();
                //       },
                //       tooltip: MaterialLocalizations.of(context)
                //           .openAppDrawerTooltip,
                //     );
                //   },
                // ),
              title: currentitem ==SidebarItems.about?const Text(Strings.about):Text(currentitem ==SidebarItems.qrscan?Strings.qrscan:currentitem==SidebarItems.history?Strings.history:currentitem==SidebarItems.live?"BlueTooth Connection":Strings.profile)),
      drawer: DrawWidget(currentitem: SidebarItems.about , onSelectedItems: (item){
        setState(() {
          currentitem = item ;
        });
            Navigator.pop(context);
      }),
      body: getScreen(currentitem),
    ));
  }
  Widget getScreen(currentitem) {
    switch (currentitem) {
      case SidebarItems.qrscan:
        return QrscanWidget();
      case SidebarItems.history:
        return const LoadingWidget();
      case SidebarItems.wallet:
        return const LoadingWidget();
      case SidebarItems.profile:
        return const ProfilePage();
      case SidebarItems.live:
        return BluetoothScanner();
      case SidebarItems.about:
        return AboutWidget(); 
      default:
        return const LoadingWidget();
    }
  }
}