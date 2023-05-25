import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Globals.dart';
import 'Providers/platform_provider.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PageController pageController = PageController();
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: Text("Platform Convertor"),
        leading: Icon(Icons.home),
        actions: [
          Switch(
            value: Provider.of<PlatformProvider>(context, listen: true).isIos,
            onChanged: (val) {
              Provider.of<PlatformProvider>(context, listen: false)
                  .changePlatform(val);
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black26,
        selectedFontSize: 18,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.yellow,
        currentIndex: Provider.of<PlatformProvider>(context).selected,
        onTap: (val) {
          Provider.of<PlatformProvider>(
            context,
            listen: false,
          ).selectedPage(val);
          pageController.animateToPage(
            val,
            duration: Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range_outlined),
            label: "Date",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: "Time",
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     pageController.animateToPage(2,
      //         duration: Duration(milliseconds: 400), curve: Curves.easeIn);
      //   },
      //   child: Icon(Icons.arrow_right),
      // ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.greenAccent,
                          barrierColor: Colors.yellow.withOpacity(0.2),
                          elevation: 50,
                          isDismissible: false,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 200,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text("Go to Home"),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: Text("Go to Settings"),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Text("Modal Bottom Sheet")),
                ElevatedButton(
                    onPressed: () {
                      scaffoldkey.currentState!
                          .showBottomSheet((context) => Container(
                                height: 200,
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text("Go to Home"),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    ListTile(
                                      title: Text("Go to Settings"),
                                    )
                                  ],
                                ),
                              ));
                    },
                    child: Text("Bottom Sheet")),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${Provider.of<PlatformProvider>(context).initialDate.day}/"
                  "${Provider.of<PlatformProvider>(context).initialDate.month}/"
                  "${Provider.of<PlatformProvider>(context).initialDate.year}",
                  style: TextStyle(fontSize: 25),
                ),
                IconButton(
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate:
                          Provider.of<PlatformProvider>(context, listen: false)
                              .initialDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050),
                      cancelText: "Go Back",
                      confirmText: "Book Now",
                    );
                    Provider.of<PlatformProvider>(context, listen: false)
                        .pickDate(pickedDate!);
                  },
                  icon: Icon(
                    Icons.date_range_outlined,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "${Provider.of<PlatformProvider>(context).initialTime.hour}"
                    ":${Provider.of<PlatformProvider>(context).initialTime.minute}",
                    style: TextStyle(fontSize: 25)),
                IconButton(
                  onPressed: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime:
                          Provider.of<PlatformProvider>(context, listen: false)
                              .initialTime,
                      cancelText: "Go Back",
                      confirmText: "Pick a Time",
                    );
                    Provider.of<PlatformProvider>(context, listen: false)
                        .pickTime(pickedTime!);
                  },
                  icon: Icon(
                    Icons.watch,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // body: PageView.builder(
      //     // itemCount: 5,
      //     itemBuilder: (BuildContext context, i) {
      //   return Center(
      //     child: Text("Page ${i + 1} "),
      //   );
      // }),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       if (defaultTargetPlatform == TargetPlatform.android) ...[
      //         CircularProgressIndicator(),
      //         SizedBox(
      //           height: 50,
      //         ),
      //         Text("Android App"),
      //         SizedBox(
      //           height: 50,
      //         ),
      //
      //
      //
      //       ] else if (defaultTargetPlatform == TargetPlatform.windows) ...[
      //         CupertinoActivityIndicator(
      //           radius: 50,
      //           color: CupertinoColors.destructiveRed,
      //           animating: true,
      //         ),
      //         SizedBox(
      //           height: 50,
      //         ),
      //         Text("Hello Ios"),
      //         SizedBox(
      //           height: 50,
      //         ),
      //         CupertinoButton(
      //             color: CupertinoColors.activeOrange,
      //             child: Text("Cupertino Button"),
      //             onPressed: () {}),
      //         CupertinoNavigationBarBackButton(
      //           color: CupertinoColors.systemPurple,
      //           onPressed: () {},
      //         )
      //       ]
      //     ],
      //   ),
      // ),
    );
  }
}
