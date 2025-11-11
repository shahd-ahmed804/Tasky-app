import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tasky_app/auth/view/login_screen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});
  static const String routeName = "OnbordingScreen";

  @override
  State<OnbordingScreen> createState() => _OnbordingState();
}

class _OnbordingState extends State<OnbordingScreen> {
  List<OnbordingData> onbordingList = dataOnbording();
  int index = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 260,
              child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  itemCount: onbordingList.length,
                  itemBuilder: (context, index) {
                    return CustomAnimatedWidget(
                        delay: index,
                        index: index,
                        child: Image.asset(onbordingList[index].image));
                  }),
            ),
            SizedBox(height: 35),
            SmoothPageIndicator(
              controller: controller,
              count: onbordingList.length,
              effect: ExpandingDotsEffect(
                spacing: 10,
                radius: 10,
                dotWidth: 15,
                dotHeight: 5,
                dotColor: Color(0xffAFAFAF),
                activeDotColor: Color(0xff5F33E1),
              ),
            ),
            SizedBox(height: 50),
            CustomAnimatedWidget(
              delay: (index + 1) * 100,
              index: index,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      onbordingList[index].title,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff24252C)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      onbordingList[index].description,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6E6A7C)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                  onPressed: () {
                    if (index < onbordingList.length - 1) {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    } else {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    }
                  },
                  color: Color(0xff5F33E1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    index < onbordingList.length - 1 ? "Next" : "Get Started",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffFFFFFF)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnbordingData {
  final String title;
  final String description;
  final String image;

  OnbordingData(
      {required this.title, required this.description, required this.image});
}

List<OnbordingData> dataOnbording() {
  return [
    OnbordingData(
        title: ' Manage your tasks',
        description:
            'You can easily manage all of your daily tasks in DoMe for free ',
        image: 'assets/images/Onbording_1.png'),
    OnbordingData(
        title: 'Create daily routine',
        description:
            'In Tasky  you can create your personalized routine to stay productive',
        image: 'assets/images/Onbording_2.png'),
    OnbordingData(
        title: 'Orgonaize your tasks',
        description:
            'You can organize your daily tasks by adding your tasks into separate categories',
        image: 'assets/images/Onbording_3.png'),
  ];
}

class CustomAnimatedWidget extends StatelessWidget {
  const CustomAnimatedWidget(
      {super.key,
      required this.index,
      required this.delay,
      required this.child});
  final int index;
  final int delay;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      return FadeInDown(delay: Duration(milliseconds: delay), child: child);
    }
    return FadeInUp(delay: Duration(milliseconds: delay), child: child);
  }
}
