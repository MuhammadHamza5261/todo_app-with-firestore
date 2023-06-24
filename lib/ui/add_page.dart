
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/ui/edit_page.dart';

import '../bloc/add_data_bloc/add_screen_bloc.dart';
import '../bloc/add_data_bloc/add_screen_event.dart';
import '../bloc/add_data_bloc/add_screen_state.dart';
import '../services/firebase_crud.dart';
import 'list_page.dart';

class AddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPage();
  }
}

class _AddPage extends State<AddPage> {

  late double width;
  late double height;
  final _employee_position = TextEditingController();
  final _employee_contact = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    // final nameField = TextFormField(
    //     controller: _employee_name,
    //     autofocus: false,
    //     validator: (value) {
    //       if (value == null || value.trim().isEmpty) {
    //         return 'This field is required';
    //       }
    //     },
    //     decoration: InputDecoration(
    //         contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //         hintText: "Name",
    //         border:
    //             OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final positionField = TextFormField(
        controller: _employee_position,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Task",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));
    final contactField = TextFormField(
        controller: _employee_contact,
        autofocus: false,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'This field is required';
          }
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Description",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

    final viewListbutton = TextButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => ListPage(),
            ),
            (route) => false, //if you want to disable back feature set to false
          );
        },
        child: const Text('View List of Employee'));

    Widget saveButton(AddScreenState state) {
      return Material(

        child: SizedBox(
          width: width * 0.9,
          height: height * 0.06,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                )
            ),
            onPressed: () async {
              BlocProvider.of<AddScreenBloc>(context).add(
                AddScreenEvent(
                  contact: _employee_contact.text,
                  position: _employee_position.text,
                ),
              );
               if (_formKey.currentState!.validate()) {

               }
            },
            child: state is AddInProgressState
                ? const CircularProgressIndicator(color: Colors.white,)
                : Text('Save', style: TextStyle(fontSize: 20),),
          ),
        ),

      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('To do List'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<AddScreenBloc,AddScreenState>(
                builder: (context,state){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/todo.png',width: 300,),
                      // nameField,
                      const SizedBox(height: 45.0),
                      positionField,
                      const SizedBox(height: 35.0),
                      contactField,
                      viewListbutton,
                      const SizedBox(height: 45.0),
                      saveButton(state),
                      const SizedBox(height: 15.0),
                    ],
                  );
                },
                listener: (context,state){
                    if(state is AddDataIsLoadedState){
                     Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  ListPage()),
              );
              }
                    else if(state is AddFailure){

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
              )
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset('assets/images/todo.png',width: 300,),
              //     // nameField,
              //     const SizedBox(height: 45.0),
              //     positionField,
              //     const SizedBox(height: 35.0),
              //     contactField,
              //     viewListbutton,
              //     const SizedBox(height: 45.0),
              //     SaveButon,
              //     const SizedBox(height: 15.0),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
