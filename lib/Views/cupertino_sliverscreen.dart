import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cupertino_sliver_screen extends StatefulWidget {
  const Cupertino_sliver_screen({Key? key}) : super(key: key);

  @override
  State<Cupertino_sliver_screen> createState() =>
      _Cupertino_sliver_screenState();
}

class _Cupertino_sliver_screenState extends State<Cupertino_sliver_screen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        // scrollDirection: Axis.vertical,
        slivers: [
          CupertinoSliverNavigationBar(
            // middle: Text("Cupertino AppBar"),
            stretch: true,
            backgroundColor: CupertinoColors.extraLightBackgroundGray,
            trailing: Icon(CupertinoIcons.home),
            leading: Icon(CupertinoIcons.settings),
            largeTitle: Text("Ios Sliver AppBar"),
          ),
          SliverToBoxAdapter(
            child: CupertinoListSection(
              header: Text("Start List"),
              children: [
                CupertinoListTile(
                  title: Text("Button 1"),
                  leading: Icon(CupertinoIcons.home),
                  trailing: Text("Home"),
                  onTap: () {
                    print("Print thay che ");
                  },
                ),
                CupertinoListTile(
                  title: Text("Button 2"),
                  leading: Icon(CupertinoIcons.settings),
                  additionalInfo: Text("Go to Ghare"),
                ),
                CupertinoListTile(
                  title: Text("Button 3"),
                  leading: Icon(CupertinoIcons.phone),
                  trailing: Text("Phone"),
                ),
                CupertinoListTile(
                  title: Text("Button 4"),
                  leading: Icon(CupertinoIcons.delete),
                  trailing: Text("Delete"),
                ),
                CupertinoListTile(
                  title: Text("Button 5"),
                  leading: Icon(CupertinoIcons.share),
                  trailing: Text("Edit"),
                ),
              ],
              footer: Text("End List"),
            ),
          ),
          // SliverFillRemaining(
          //   // fillOverscroll: true,
          //   // hasScrollBody: true,
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: [
          //         Container(
          //           color: CupertinoColors.activeOrange,
          //           height: 200,
          //         ),
          //         Container(
          //           color: CupertinoColors.destructiveRed,
          //           height: 200,
          //         ),
          //         Container(
          //           color: CupertinoColors.activeBlue,
          //           height: 200,
          //         ),
          //         Container(
          //           color: CupertinoColors.activeGreen,
          //           height: 200,
          //         ),
          //         Container(
          //           color: CupertinoColors.activeBlue,
          //           height: 200,
          //         ),
          //         Container(
          //           color: CupertinoColors.activeGreen,
          //           height: 200,
          //         ),
          //         Container(
          //           color: CupertinoColors.activeBlue,
          //           height: 200,
          //         ),
          //         Container(
          //           color: CupertinoColors.activeGreen,
          //           height: 200,
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
