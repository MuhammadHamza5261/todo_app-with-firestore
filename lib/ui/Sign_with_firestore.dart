

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/config/custom_button.dart';
import 'package:todo_list_app/config/custom_text_field.dart';
import 'package:todo_list_app/main.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/ui/add_page.dart';

import 'package:todo_list_app/ui/list_screen.dart';

import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../first_screen.dart';
import '../practise_Screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {



  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text('Registration',style: TextStyle(
          fontWeight: FontWeight.w400,
        ),),
        centerTitle: true,
      ),
      body: BlocConsumer<ToDoBloc,ToDoState>(
          builder: (context,state){
            return Column(

              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),



                Image.asset('assets/images/ff.png'),
                Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomInputFieldTwo(
                            controller: emailController,
                            hintText: 'Email',
                            prefixIcon: Icons.email,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomInputFieldTwo(
                            controller: passwordController,
                            hintText: 'Password',
                            prefixIcon: Icons.lock,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                              }
                            },
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),

                        CustomButton(
                            height: height*0.06,
                            width: width*0.9,
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<ToDoBloc>(context).add(
                                  ToDoEvent(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                              }
                            },
                            text: 'Sign Up',
                            color: Colors.purple.shade200,
                          isLoading: state is ToDoDataIsLoadedState,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
          listener: (context,state){
            if(state is ToDoDataIsLoadedState){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  AddPage()),
              );
            }
            else if(state is ToDoFailure){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    state.errorMessage,
                  ),
                ),
              );
            }



          }

      ),
    );
  }
}


