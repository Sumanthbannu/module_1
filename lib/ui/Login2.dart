import 'package:college_project/home/screens/home_screen.dart';
import 'package:college_project/ui/signup_page.dart';
import 'package:flutter/material.dart';

class sign_in extends StatelessWidget {
  const sign_in({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white60,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignupScreen()),
            );},
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.white60,
          title: Center(child: Text('login')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Login',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45, fontSize: 16.0, fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter email",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          fillColor: Colors.grey[300],
                          filled: true,
                        ),
                        onChanged: (String value) {},
                        validator: (value) {
                          return value!.isEmpty ? 'please enter email' : null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                          fillColor: Colors.grey[300],
                          filled: true,
                        ),
                        onChanged: (String value) {},
                        validator: (value) {
                          return value!.isEmpty ? 'please enter password' : null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: MaterialButton(
                        onPressed: () { Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );},
                        child: Text("Login"),
                        color: Colors.black,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}