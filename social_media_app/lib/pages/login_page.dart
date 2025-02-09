import 'package:flutter/material.dart';
import 'package:social_media_app/components/my_button.dart';
import 'package:social_media_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //text controllers
 final TextEditingController emailController = TextEditingController();
 final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //Logo
            Icon(
              Icons.person_2,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary ,
            ),
              const SizedBox(height: 25),

              //App Name
              Text(
                "S C R E E N I Q" ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 50),

              //Email Textfeild
              MyTextfield(hintText: "Enter Your User Name 0r Email",
                  obscureText: false,
                  controller: emailController,
              ),

              //password textfeild
              MyTextfield(hintText: "Password",
                obscureText: true,
                controller: passwordController,
              ),

              //forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forget Password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary
                    )),
                ],
              ),
              const SizedBox(height: 25),

              //sign in button
              MyButton(text: "Login",
                  onTap: (){},),

              //Dont have an account? Register Here
            ]
          ),
        ),
      ),
      appBar: AppBar(
    //title: Text("Login page"),
      ),
    );
  }
}
