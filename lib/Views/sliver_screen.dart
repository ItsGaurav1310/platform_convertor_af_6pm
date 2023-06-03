import 'package:flutter/material.dart';

class Sliver_Page extends StatefulWidget {
  const Sliver_Page({Key? key}) : super(key: key);

  @override
  State<Sliver_Page> createState() => _Sliver_PageState();
}

class _Sliver_PageState extends State<Sliver_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            // pinned: true,

            // floating: true,
            // snap: true,
            // title: Text("Sliver AppBar"),
            // centerTitle: true,
            expandedHeight: 250,
            collapsedHeight: 100,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              stretchModes: [
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
                StretchMode.zoomBackground
              ],
              title: Text(
                "Hey Google",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              background: Image.network(
                "https://compote.slate.com/images/2f2fc6b0-96b7-4bf7-812a-dcaa8c6ce3d6.gif?width=1560",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                        height: 200,
                        color: Colors.primaries[index],
                        alignment: Alignment.center,
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                  childCount: 18),
              // delegate: SliverChildListDelegate([
              //   Container(
              //     height: 200,
              //     color: Colors.red,
              //   ),
              //   Container(
              //     height: 200,
              //     color: Colors.black,
              //   ),
              //   Container(
              //     height: 200,
              //     color: Colors.blue,
              //   ),
              //   Container(
              //     height: 200,
              //     color: Colors.green,
              //   ),
              //   Container(
              //     height: 200,
              //     color: Colors.teal,
              //   ),
              //   Container(
              //     height: 200,
              //     color: Colors.yellow,
              //   ),
              //   Container(
              //     height: 200,
              //     color: Colors.purple,
              //   ),
              // ]),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2))
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => Container(
          //       height: 200,
          //       color: Colors.primaries[index],
          //       alignment: Alignment.center,
          //       child: Text(
          //         "${index + 1}",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //     childCount: 18,
          //   ),
          // ),
          // SliverList(
          //   delegate: SliverChildListDelegate([
          //     Container(
          //       height: 200,
          //       color: Colors.red,
          //     ),
          //     Container(
          //       height: 200,
          //       color: Colors.black,
          //     ),
          //     Container(
          //       height: 200,
          //       color: Colors.blue,
          //     ),
          //     Container(
          //       height: 200,
          //       color: Colors.green,
          //     ),
          //     Container(
          //       height: 200,
          //       color: Colors.teal,
          //     ),
          //     Container(
          //       height: 200,
          //       color: Colors.yellow,
          //     ),
          //     Container(
          //       height: 200,
          //       color: Colors.purple,
          //     ),
          //   ]),
          //),
        ],
      ),
    );
  }
}
