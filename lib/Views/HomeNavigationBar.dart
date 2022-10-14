import 'package:flutter/material.dart';
import 'package:flutter_assignment/Models/MyColors.dart';
import 'package:flutter_assignment/Views/Chat/ChatWidget.dart';
import 'package:flutter_assignment/Views/Feed/HomePage.dart';
import 'package:flutter_assignment/Views/Library/LibraryWidget.dart';
import 'package:flutter_assignment/Views/Services/ServicesWidget.dart';

class HomeNavigationBarWidget extends StatefulWidget {
  final int index;
  HomeNavigationBarWidget({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeNavigationBarState();
  }
}

class _HomeNavigationBarState extends State<HomeNavigationBarWidget> {
  @override
  void initState() {
    _currentIndex = widget.index;

    super.initState();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> _onWillPop() {
    return _currentIndex == 0
        ? showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you really want to exit HealthNest?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text('Yes'),
                ),
              ],
            ),
          )
        : Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => HomeNavigationBarWidget(index: 0)),
            (Route<dynamic> route) => false);
  }

  int _currentIndex;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_currentIndex) {
      case 0:
        child = MyHomePageWidget();
        break;
      case 1:
        child = LibraryWidget();
        break;
      case 2:
        break;
      case 3:
        child = ChatWidget();
        break;
      case 4:
        child = ServicesWidget();
        break;
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Stack(children: <Widget>[
        IndexedStack(
          sizing: StackFit.loose,
          index: _currentIndex,
          children: [
            MyHomePageWidget(),
            LibraryWidget(),
            Container(),
            ChatWidget(),
            ServicesWidget(),
          ],
          alignment: Alignment.topRight,
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: ClipRRect(
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: MyColors.white,
                  selectedItemColor: MyColors.themeColor,
                  unselectedItemColor: MyColors.lightGrey,
                  selectedFontSize: 12,
                  unselectedFontSize: 10,
                  onTap: (value) {
                    setState(() => _currentIndex = value);
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: 'Feed',
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Image.asset(
                          "assets/feed.png",
                          color: _currentIndex == 0
                              ? MyColors.themeColor
                              : MyColors.lightGrey,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Library',
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Image.asset(
                          "assets/library.png",
                          color: _currentIndex == 1
                              ? MyColors.themeColor
                              : MyColors.lightGrey,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: '',
                      icon: InkWell(
                        onTap: () {
                          onAddClick(context);
                        },
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: MyColors.themeColor,
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.add,
                              color: MyColors.white,
                              size: 28,
                            )),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Messages',
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Image.asset(
                          "assets/messages.png",
                          color: _currentIndex == 3
                              ? MyColors.themeColor
                              : MyColors.lightGrey,
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: 'Services',
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Image.asset(
                          "assets/services.png",
                          color: _currentIndex == 4
                              ? MyColors.themeColor
                              : MyColors.lightGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ]),
    );
  }

  onAddClick(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context, // Also default
        builder: (context) => Container(
              height: 380,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width - 32,
                    decoration: BoxDecoration(
                        color: MyColors.white,
                        borderRadius: new BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Image.asset("assets/Icons(2).png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Create a post",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .apply(
                                                  fontWeightDelta: 0,
                                                  color: MyColors.themeColor,
                                                  fontSizeFactor: 0.7)),
                                      Text("Share your thoughts with community",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .apply(
                                                  fontWeightDelta: 0,
                                                  color: MyColors.lightGrey,
                                                  fontSizeFactor: 0.55)),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Image.asset("assets/arrow-right.png"),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Image.asset("assets/Icons(3).png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Ask a question",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .apply(
                                                  fontWeightDelta: 0,
                                                  color: MyColors.themeColor,
                                                  fontSizeFactor: 0.7)),
                                      Text("Any doubts? As the community",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .apply(
                                                  fontWeightDelta: 0,
                                                  color: MyColors.lightGrey,
                                                  fontSizeFactor: 0.55)),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Image.asset("assets/arrow-right.png"),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Image.asset("assets/Icons(4).png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Start a Poll",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .apply(
                                                  fontWeightDelta: 0,
                                                  color: MyColors.themeColor,
                                                  fontSizeFactor: 0.7)),
                                      Text("Need the option of the many?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .apply(
                                                  fontWeightDelta: 0,
                                                  color: MyColors.lightGrey,
                                                  fontSizeFactor: 0.55)),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Image.asset("assets/arrow-right.png"),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Image.asset("assets/Icons(5).png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Organise an Event",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .apply(
                                                  fontWeightDelta: 0,
                                                  color: MyColors.themeColor,
                                                  fontSizeFactor: 0.7)),
                                      Text("Start a meet with people",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .apply(
                                                  fontWeightDelta: 0,
                                                  color: MyColors.lightGrey,
                                                  fontSizeFactor: 0.55)),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Image.asset("assets/arrow-right.png"),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(Icons.close_rounded,
                          color: MyColors.lightGrey, size: 24),
                    ),
                  )
                ],
              ),
            ));
  }
}
