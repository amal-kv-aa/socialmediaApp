import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/screens/desktop/provider/provider.dart';
import 'package:social_media/screens/desktop/view/desktop.dart';
import 'package:social_media/utils/responsive/responsive_design/responsivestyle.dart';

class ManagePlatform {
 static void set({required BuildContext context,required Widget mobscreen,bool? size , Widget? firstScreen,Widget? secondsScreen}){
   context.read<DesktopProvider>().searchshowUpdate(size?? true);
                        context
                            .read<DesktopProvider>()
                            .updateWidgetFirst( firstScreen??const AccountDesktop());
                        context
                            .read<DesktopProvider>()
                            .updateWidgetSeconde(secondsScreen!);
     ResponsiveStyle.isMobile(context)
                            ? Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>  mobscreen))
                            : Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => const DesktopView()));
                               
  }
}