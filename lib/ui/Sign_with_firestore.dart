import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/main.dart';
import 'package:flutter/material.dart';

import 'package:todo_list_app/ui/list_screen.dart';

import '../bloc/to_bloc.dart';
import '../bloc/to_event.dart';
import '../bloc/to_state.dart';
import '../first_screen.dart';
import '../practise_Screen.dart';
class ToDoScreen1 extends StatelessWidget {
  const ToDoScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent.shade100,
      body: const ToDoScreenSTF(),
    );
  }
}
class ToDoScreenSTF extends StatefulWidget {
  const ToDoScreenSTF({Key? key}) : super(key: key);

  @override
  State<ToDoScreenSTF> createState() => _ToDoScreenSTFState();
}

class _ToDoScreenSTFState extends State<ToDoScreenSTF> {
  late double width;
  late double height;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: BlocConsumer<ToDoBloc,ToDoState>(
        builder: (context,state){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // margin: const EdgeInsets.only(right: 440),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back,size: 30.0,),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FirstScreen()));
                  },
                ),
              ),
              SizedBox(
                height: height*0.05,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text('MyTask.ID',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 33.0,
                ),),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: const Text('Sign up',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
          Container(
            child: Image.asset('assets/images/ff.png'),
          ),
          Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text(
                    "FireBase Signup Form",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          30.0), // Set the border radius
                      // Set the background color
                    ),
                    child: TextFormField(
                      controller: emailController,
                      style: const TextStyle(
                        color: Colors.pink,
                      ),
                      // controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // return 'Please enter your email';
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 17.0, top: 10.0,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.purple, width: 1.2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black, width: 1.2),
                          ),
                          hintText: 'Email',
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.purple,

                          )
                      ),
                    ),
                  ),
                 const SizedBox(
                   height: 20,
                 ),

                  Container(
                    width: width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0), // Set the border radius
                      // Set the background color
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.pink,
                      ),
                      // controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          // return 'Please enter your email';
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 17.0, top: 10.0,),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.purpleAccent, width: 1.2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black, width: 1.2),
                          ),
                          hintText: 'password',
                          labelText: 'password',
                          labelStyle: TextStyle(
                            color: Colors.purple,
                          )
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20.0,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width *0.9,
                    height: MediaQuery.of(context).size.height *0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        primary:  Colors.purple,
                      ),

                      onPressed: () async {

                        if (_formKey.currentState!.validate()) {

                          BlocProvider.of<ToDoBloc>(context).add(
                            ToDoEvent(
                                email: emailController.text,
                                password: passwordController.text,
                            ),
                          );
                        }
                      },

                      child:  state is ToDoInProgressState ?
                     const  CircularProgressIndicator(color: Colors.white):
                      const Text("Sign-up",
                        style: TextStyle(
                        fontSize: 22.0,
                      ),),
                    ),
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
                MaterialPageRoute(builder: (context) => const  PractiseScreen()),
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
            ) ;
          }



        }

      ),








    );
  }
}

