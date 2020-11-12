import 'package:flutter/material.dart';
import 'package:health_ui/style.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'mood.dart';
import 'utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health App UI',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildTopStack(context),
            SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildNotificationCard(),
                  _buildNextAppointmentTitle(),
                  _buildNextAppointmentInfo(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.home,
              size: 30.0,
            ),
            label: '1',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.search,
              size: 30.0,
            ),
            label: '1',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              LineAwesomeIcons.gratipay,
              size: 30.0,
            ),
            label: '1',
          ),
        ],
        onTap: updateIndex,
      ),
    );
  }

  Stack _buildTopStack(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      overflow: Overflow.visible,
      children: [
        _buildBackgroundCover(),
        _buildGreetings(),
        _buildMoodsHolder(context)
      ],
    );
  }
}

_buildNotificationCard() {
  return Container(
    padding: EdgeInsets.all(12.0),
    decoration: BoxDecoration(
      color: lightColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: ListTile(
      leading: Icon(
        LineAwesomeIcons.calendar_check_o,
        color: Colors.white,
        size: 32.0,
      ),
      title: Text(
        'Your visit with \nDr Rajiv',
        style: notificationTitleStyle,
      ),
      trailing: OutlineButton(
        onPressed: () {},
        color: Colors.transparent,
        borderSide: BorderSide(
          color: Colors.white,
          width: 1.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            26.0,
          ),
        ),
        child: Text(
          'Review & Add Notes',
          style: notificationButtonStyle,
        ),
      ),
    ),
  );
}

_buildBackgroundCover() {
  return Container(
    height: 260.0,
    decoration: BoxDecoration(
      gradient: purpleGradient,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40.0),
        bottomRight: Radius.circular(40.0),
      ),
    ),
  );
}

_buildGreetings() {
  return Positioned(
    left: 20.0,
    bottom: 90.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hi Rishu', style: greetingStyle),
        SizedBox(height: 10.0),
        Text(
          'How are you feeling today',
          style: greetingSubtitleStyle,
        )
      ],
    ),
  );
}

_buildMoodsHolder(BuildContext context) {
  return Positioned(
    bottom: -45,
    child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(28.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5.5,
            blurRadius: 5.5,
          )
        ],
      ),
      child: MyMoods(),
    ),
  );
}

_buildNextAppointmentTitle() {
  return Container(
    margin: EdgeInsets.only(
      top: 20.0,
      bottom: 20.0,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your Next Appointment',
          style: nextAppointmentTitleStyle,
        ),
        Text(
          'See All',
          style: nextAppointmentSubtitleStyle,
        )
      ],
    ),
  );
}

_buildNextAppointmentInfo() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18.0),
      color: Colors.grey,
    ),
    child: Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(USER_IMAGE),
          radius: 36.0,
        )
      ],
    ),
  );
}
