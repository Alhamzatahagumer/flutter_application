import 'package:flutter/material.dart';
import 'package:flutter_application_1/cashHelper/sharedPref.dart';
import 'package:flutter_application_1/screen/signin.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Widget> onboardingPages = [
    OnboardingPage(
      imagePath: 'assets/shirt1.png',
      title: 'Discover new and trendy products',
      description: 'Discover latest fashion trends and styles with curated collections.',
    ),
    OnboardingPage(
      imagePath: 'assets/shirt2.png',
      title: 'Shop from various categories',
      description: 'Find what you love from a wide range of product categories.',
    ),
    OnboardingPage(
      imagePath: 'assets/shirt3.png',
      title: 'Enjoy a seamless shopping experience',
      description: 'Get your products delivered to your door with ease.',
    ),
  ];
  void onSubmit(){
    cashHelper.saveData(key:'onBoarding',value:true).then((value){
       Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => SignInScreen()),
  (Route<dynamic> route) => false,
);
    });
   

  }

  void nextPage() {
    if (currentIndex < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
       onSubmit();
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: onboardingPages.length,
              itemBuilder: (context, index) {
                return onboardingPages[index];
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onboardingPages.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 3),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index ? Colors.black : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: nextPage,
            child: Text(currentIndex == onboardingPages.length - 1 ? 'Get Started' : 'Next'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  OnboardingPage({required this.imagePath, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 300),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
