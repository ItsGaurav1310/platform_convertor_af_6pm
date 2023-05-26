import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/platform_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: const Text("Platform Convertor"),
          leading: const Icon(CupertinoIcons.home),
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
                actions: [
                  CupertinoContextMenuAction(
                    onPressed: () {},
                    trailingIcon: CupertinoIcons.share,
                    isDefaultAction: true,
                    child: const Text("Share"),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {},
                    isDestructiveAction: true,
                    trailingIcon: CupertinoIcons.delete,
                    child: const Text("Delete"),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {},
                    trailingIcon: CupertinoIcons.lock,
                    child: const Text("Hide"),
                  )
                ],
                child: const FlutterLogo(),
              ),
            ),
            const CupertinoActivityIndicator(
              radius: 50,
              color: CupertinoColors.destructiveRed,
              animating: true,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.day}/"
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.month}/"
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.year}",
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 50,
            ),
            CupertinoButton(
                color: CupertinoColors.activeOrange,
                child: const Text("Pick a Date"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: const Text(
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
                                child: const Text("Go to settings")),
                            CupertinoActionSheetAction(
                                onPressed: () {},
                                child: const Text("Share on Email")),
                            CupertinoActionSheetAction(
                                onPressed: () {},
                                child: const Text("Go to home Screen")),
                            CupertinoActionSheetAction(
                                isDestructiveAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Exit")),
                          ],
                        );
                      });
                }),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.hour}:"
              "${Provider.of<PlatformProvider>(context, listen: true).initialDate.minute}",
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
                color: CupertinoColors.activeOrange,
                child: const Text("Pick A Time"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: const Text(
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
                                child: const Text("Go to settings")),
                            CupertinoActionSheetAction(
                                onPressed: () {},
                                child: const Text("Share on Email")),
                            CupertinoActionSheetAction(
                                onPressed: () {},
                                child: const Text("Go to home Screen")),
                            CupertinoActionSheetAction(
                                isDestructiveAction: true,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Exit")),
                          ],
                        );
                      });
                }),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
                child: const Text("Show Alert"),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text("Alert!....."),
                      content: const Text("You Have to Verify Your Identity"),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text("Verify"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        CupertinoDialogAction(
                          onPressed: () {},
                          isDestructiveAction: true,
                          child: const Text("Cancel"),
                        )
                      ],
                    ),
                  );
                }),
            CupertinoSlidingSegmentedControl(
                thumbColor: CupertinoColors.destructiveRed,
                groupValue: Provider.of<PlatformProvider>(context).selected,
                children: const {
                  0: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text("Home"),
                    ),
                  ),
                  1: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text("Settings"),
                    ),
                  ),
                  2: Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text("Clock"),
                    ),
                  ),
                },
                onValueChanged: (val) {
                  Provider.of<PlatformProvider>(context, listen: false)
                      .selectedPage(val!);
                }),

            // CircularProgressIndicator.adaptive(),
            // Material(child: Switch.adaptive(value: true, onChanged: (val) {})),
            // Material(child: Slider.adaptive(value: 0, onChanged: (val) {}))
          ],
        ),
      ),
    );
  }
}
