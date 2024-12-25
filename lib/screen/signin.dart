import 'package:flutter/material.dart';
import 'package:flutter_application_1/cashHelper/sharedPref.dart';
import 'package:flutter_application_1/cubit/cubitSignin.dart';
import 'package:flutter_application_1/cubit/statesSignIn.dart';
import 'package:flutter_application_1/screen/shopLyout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';


class SignInScreen extends StatelessWidget {
  var formKey =GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInScreenCubit(),
      child: BlocConsumer<SignInScreenCubit, SignInScreenState>(
        listener: (context, state) {

          if (state is sucessScrrenState) {
            if(state.loginModel.status!){  
              print(state.loginModel.message);
              print(state.loginModel.status);
             
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Login Successful!')),
            );
             cashHelper.saveData(
                key: 'token',
                 value: state.loginModel.status
                 ).then((value){
                  Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (context) => Shoplyout()),

                  );
                 });
          } else if (state is errorScrrenState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  
                 TextField(

                  keyboardType: TextInputType.visiblePassword,

                    controller: _passwordController,
  obscureText: SignInScreenCubit.get(context).IsPasswordShowin,
  decoration: InputDecoration(
    labelText: "Password",
    border: OutlineInputBorder(),
    suffixIcon: IconButton(
      icon: Icon(SignInScreenCubit.get(context).suffix),
      onPressed: () {
        SignInScreenCubit.get(context).ChangePasswordvisibility();
      },
    ),
  ),
),
                  SizedBox(height: 16),
                  ConditionalBuilder(
                    condition: state is! loadingScrrenState,
                    builder: (context) => ElevatedButton(
                      onPressed: () {
                        SignInScreenCubit.get(context).UserLogin(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      },
                      child: Text("Sign In"),
                    ),
                    fallback: (context) => Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                    },
                    child: Text("Forgot password"),
                  ),
                  SizedBox(height: 16),
                  Text("Or Continue With"),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("Continue with Google"),
                    onPressed: () {
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    icon: Icon(Icons.apple),
                    label: Text("Continue with Apple"),
                    onPressed: () {
                    },
                  ),
                ],
              ),
            ),
            )
          );
        },
      ),
    );
  }
}
