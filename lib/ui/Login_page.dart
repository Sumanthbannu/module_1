import 'package:college_project/ui/Login2.dart';
import 'package:college_project/ui/signup_page.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignupScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white60,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: navigateToNextScreen,
              child: const Text(
                'Skip',
                style: TextStyle(
                    color: Colors.black45, fontSize: 16.0, fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 350,
                      child: Image.network('https://th.bing.com/th/id/OIP.S4p0wnnIk_4bZkw45Vx0ZQHaE8?rs=1&pid=ImgDetMain'),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'WELCOME!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: navigateToNextScreen,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.black, // Text color
                      ),
                      child: Text('NEXT!', style: TextStyle(
                          color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400)),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

