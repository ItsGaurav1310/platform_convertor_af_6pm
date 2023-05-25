import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/Providers/platform_provider.dart';
import 'package:provider/provider.dart';
import 'package:platform_convertor/material_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PlatformProvider()),
      ],
      child: Consumer<PlatformProvider>(
        builder: (context, value, _) => (value.isIos == false)
            ? MaterialApp(
                theme: ThemeData(useMaterial3: true),
                debugShowCheckedModeBanner: false,
                //
                home: Detail())
            : CupertinoApp(
                debugShowCheckedModeBanner: false,
                home: HomePage(),
              ),
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text("Platform Convertor"),
          leading: Icon(CupertinoIcons.home),
          trailing: CupertinoSwitch(
            value: Provider.of<PlatformProvider>(context, listen: true).isIos,
            onChanged: (val) {
              Provider.of<PlatformProvider>(context, listen: false)
                  .changePlatform(val);
            },
          )),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CupertinoContextMenu(
                child: FlutterLogo(),
                actions: [
                  CupertinoContextMenuAction(
                    child: Text("Share"),
                    onPressed: () {},
                    trailingIcon: CupertinoIcons.share,
                    isDefaultAction: true,
                  ),
                  CupertinoContextMenuAction(
                    child: Text("Delete"),
                    onPressed: () {},
                    isDestructiveAction: true,
                    trailingIcon: CupertinoIcons.delete,
                  ),
                  CupertinoContextMenuAction(
                    child: Text("Hide"),
                    onPressed: () {},
                    trailingIcon: CupertinoIcons.lock,
                  )
                ],
              ),
            ),
            CupertinoActivityIndicator(
              radius: 50,
              color: CupertinoColors.destructiveRed,
              animating: true,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.day}/"
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.month}/"
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.year}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 50,
            ),
            CupertinoButton(
                color: CupertinoColors.activeOrange,
                child: Text("Pick a Date"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: Text(
                            "Pick a Date From Here",
                            style: TextStyle(fontSize: 25),
                          ),
                          message: Container(
                            height: 200,
                            color: Colors.transparent,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (DateTime date) {
                                Provider.of<PlatformProvider>(context,
                                        listen: false)
                                    .pickDate(date);
                              },
                              initialDateTime: Provider.of<PlatformProvider>(
                                      context,
                                      listen: true)
                                  .initialDate,
                              mode: CupertinoDatePickerMode.date,
                            ),
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                                isDefaultAction: true,
                                onPressed: () {},
                                child: Text("Go to settings")),
                            CupertinoActionSheetAction(
                                onPressed: () {},
                                child: Text("Share on Email")),
                            CupertinoActionSheetAction(
                                onPressed: () {},
                                child: Text("Go to home Screen")),
                            CupertinoActionSheetAction(
                                isDestructiveAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Exit")),
                          ],
                        );
                      });
                }),
            SizedBox(
              height: 20,
            ),
            Text(
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.hour}:"
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.minute}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
                color: CupertinoColors.activeOrange,
                child: Text("Pick A Time"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: Text(
                            "Pick a Date From Here",
                            style: TextStyle(fontSize: 25),
                          ),
                          message: Container(
                            height: 200,
                            color: Colors.transparent,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (DateTime date) {
                                Provider.of<PlatformProvider>(context,
                                        listen: false)
                                    .pickDate(date);
                              },
                              initialDateTime: Provider.of<PlatformProvider>(
                                      context,
                                      listen: true)
                                  .initialDate,
                              mode: CupertinoDatePickerMode.time,
                              use24hFormat: true,
                            ),
                          ),
                          actions: [
                            CupertinoActionSheetAction(
                                isDefaultAction: true,
                                onPressed: () {},
                                child: Text("Go to settings")),
                            CupertinoActionSheetAction(
                                onPressed: () {},
                                child: Text("Share on Email")),
                            CupertinoActionSheetAction(
                                onPressed: () {},
                                child: Text("Go to home Screen")),
                            CupertinoActionSheetAction(
                                isDestructiveAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Exit")),
                          ],
                        );
                      });
                }),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
                child: Text("Show Alert"),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text("Alert!....."),
                      content: Text("You Have to Verify Your Identity"),
                      actions: [
                        CupertinoDialogAction(
                          child: Text("Verify"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text("Cancel"),
                          onPressed: () {},
                          isDestructiveAction: true,
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
