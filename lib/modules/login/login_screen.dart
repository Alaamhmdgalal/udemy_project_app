import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udemy_project/shared/components/components.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPasswordShown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  defaultTextField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Email can not be empty';
                        }
                      },
                      label: 'Email',
                      prefixIcon: Icons.email,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultTextField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Password can not be empty';
                        }
                      },
                      label: 'Password',
                      prefixIcon: Icons.lock,
                    suffixIcon: isPasswordShown? Icons.visibility : Icons.visibility_off,
                    isPassword: isPasswordShown,
                    suffixPressed: (){
                        setState((){
                          isPasswordShown = !isPasswordShown;
                        });
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      function: (){
                        if (formKey.currentState!.validate()){
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      },
                      text: 'Login',
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  defaultButton(
                    function: (){
                      if (formKey.currentState!.validate()){
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: 'Register',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(onPressed: (){

                      },
                          child: const Text(
                            'Register now',
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}