import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/update_data_bloc/update_data_bloc.dart';
import '../bloc/update_data_bloc/update_data_event.dart';
import '../bloc/update_data_bloc/update_data_state.dart';
import '../models/employee.dart';
import '../services/firebase_crud.dart';
import 'list_page.dart';

class EditPage extends StatefulWidget {
final Employee? employee;
 EditPage({this.employee});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditPage();
  }
}

class _EditPage extends State<EditPage> {

  late double width;
  late double height;
  final _employee_name = TextEditingController();
  final _employee_position = TextEditingController();
  final _employee_contact = TextEditingController();
  final _docid = TextEditingController();
  String? docUid;

   
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override
  void initState() {
    // TODO: implement initState
     docUid =  widget.employee!.uid.toString();
    _employee_name.text =  widget.employee!.employeename.toString();
    _employee_position.value = TextEditingValue(text: widget.employee!.position.toString());
    _employee_contact.value = TextEditingValue(text: widget.employee!.contactno.toString());
    
  }

  @override
  Widget build(BuildContext context) {

  width = MediaQuery.of(context).size.width;
  height = MediaQuery.of(context).size.height;


    // final DocIDField = TextField(
    //     controller: _docid,
    //     readOnly: true,
    //     autofocus: false,
    //     decoration: InputDecoration(
    //         contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    //         hintText: "Name",
    //         border:
    //             OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));

         

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
            hintText: "Position",
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
            hintText: "Contact Number",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))));


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

    Widget SaveButton(UpdateDataState state)
  {
    return  Material(

      child: SizedBox(
        width: width*0.9,
        height: height*0.055,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {


                BlocProvider.of<UpdateScreenBloc>(context).add(
                  UpdateScreenEvent(
                    position: _employee_position.text,
                    contactno: _employee_contact.text,
                    DocUid:  docUid!,

                  ),
                ) ;

                // var response = await FirebaseCrud.updateEmployee(
                //     // name: _employee_name.text,
                //     position: _employee_position.text,
                //     contactno: _employee_contact.text,
                //     docId: _docid.text,
                // );





                //   if (response.code != 200) {
                //     showDialog(
                //         context: context,
                //         builder: (context) {
                //           return AlertDialog(
                //             content: Text(response.message.toString()),
                //           );
                //         });
                //   } else {
                //     showDialog(
                //
                //         context: context,
                //         builder: (context) {
                //           return AlertDialog(
                //             content: Text(response.message.toString()),
                //           );
                //         });
                //   }
              }

            },
            child:  state is UpdateInProgressState?
            const CircularProgressIndicator(color: Colors.white,):
            Text('Update',style: TextStyle(fontSize: 20.0),)
        ),
      ),

    );
  }




    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Update Screen'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocConsumer<UpdateScreenBloc,UpdateDataState>(
                builder: (context,state){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/tick.png'),
                      // DocIDField,
                      const SizedBox(height: 25.0),
                      // nameField,
                      const SizedBox(height: 25.0),
                      positionField,
                      const SizedBox(height: 35.0),
                      contactField,
                      viewListbutton,
                      const SizedBox(height: 45.0),
                      SaveButton(state),
                      const SizedBox(height: 15.0),
                    ],
                  );

                },
                listener: (context,state){
                  if(state is UpdateDataIsLoadedState){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ListPage()),
                    );
                  }

                  else if(state is UpdateFailure){
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
              // child: Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Image.asset('assets/images/tick.png'),
              //     // DocIDField,
              //     const SizedBox(height: 25.0),
              //     // nameField,
              //     const SizedBox(height: 25.0),
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
