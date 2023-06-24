import 'dart:ui';
import 'package:flutter/cupertino.dart';
// import 'package:share_plus/share_plus.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

///stf
class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);
  @override
  State<MyList> createState() => _mylistState();
}
class _mylistState extends State<MyList> {
  ///show save button when field is fill
  final emailcontroller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailcontroller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _isButtonEnabled = emailcontroller.text.isNotEmpty;
    });
  }

  void _onButtonPressed() {
    // Do something
    print('Button pressed');
  }

  ///for active button
  bool isButtonActive = true;
  bool _obscureText = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;
  ///check box wala text


  String datatochange ="Delete";
  ///ya function check box ma use ho raha text ko update karna k lie
  void changedata(){
    setState(() {
      datatochange ="1 item Selected";
    });
  }


  String datatochange1 ="Share";
  ///ya function check box ma use ho raha text ko update karna k lie
  void changedata1(){
    setState(() {
      datatochange1 ="1Selected";
    });
  }


  String datatochange2 ="Edit";
  ///ya function check box ma use ho raha text ko update karna k lie
  void changedata2(){
    setState(() {
      datatochange2 ="1Selected";
    });
  }

  ///apply visibility
  bool _isVisible = true;
  bool _isVisible2 = false;
  bool _isVisible3 = true;
  bool _isVisible4 = false;
  bool _isVisible5 = true;
  bool _isVisible6 = false;
  bool _isVisible7 = false;
  bool _isVisible8 = false;
  bool _isVisible9 = true;
  bool _isVisible10 = false;
  bool _isVisible11 = false;
  bool _isVisible12 = false;
  bool _isVisible13 = false;
  bool _isVisible14 = false;
  bool _isVisible15 = true;
  bool _isVisible16 = false;
  bool _isVisible17 = false;
  bool _isVisible18 = true;
  bool _isVisible19 = false;
  bool _isVisible20 = false;
  bool _isVisible21 = false;





  bool _switchValue = false;
  bool _switchValue2 = true;
  bool? isChecked = false;



  ///control navbar into 2nd navbar
  Widget appBarTitle = const Text("My app bar title");


  final _textcontroller = TextEditingController();


  bool _validate = false;


  String UserPost = "";
  String UserPost1 = "";




  String deletepost = "";



  ///popup menu 1
  void _showPopupMenu3() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100,300,170,150),
      items: [
        PopupMenuItem(
          child: Container(
            height:  MediaQuery.of(context).size.height*0.27,
            width:  MediaQuery.of(context).size.width*0.85,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                      Container(
                        margin: const EdgeInsets.only(left: 10.0,),
                        child:const Icon(
                          Icons.close,
                          color: Colors.purple,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.0,),
                  child: const Center(child: Text("New Lists",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(20,20,20,1),
                    ),
                  )),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5.0,top: 7.0,),
                  child: const Center(child: Text("Enter new list name",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(100,100,100,1),
                    ),
                  )),
                ),
                ///input field
                Container(
                  width: width*0.93,
                  height: height*0.07,
                  margin: const EdgeInsets.only(top: 17.0,),
                  child: TextFormField(
                    controller: _textcontroller,
                    keyboardType: TextInputType.text,
                    maxLength: 10,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    cursorColor: Colors.grey,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 5.0,left: 15.0,),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.purple, width: 1.2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1), width: 1.2),
                      ),
                      hintText: 'List Name',
                    ),
                  ),


                ),
                ///btn
                const SizedBox(
                  height: 14.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.93,
                  height:  MediaQuery.of(context).size.height*0.042,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed:() {
                      Navigator.pop(context);
                      UserPost = _textcontroller.text;
                      setState((){

                        _textcontroller.text.isEmpty ? _validate = false : _validate = true;

                        if(_isVisible=false){}
                        else if(_isVisible2=true){}
                      });
                    },
                    child: const Text('Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      elevation: 8.0,
    );

  }
  ///pop up menu 2
  void _showPopupMenu4() async {
    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(180,80,600,500),
      items: [
        ///1st item
        PopupMenuItem(
          child: TextButton(
            onPressed: (){
              setState(() {
                if(_isVisible11=true){}
                if(_isVisible3=false){}
                if(_isVisible12=true){}
                if(_isVisible8=false){}
                if(_isVisible4=false){}
                if(_isVisible9=false){}
                if(_isVisible5=false){}
                Navigator.pop(context);
              });
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Container(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(_isVisible11=true){}
                        if(_isVisible3=false){}
                        if(_isVisible12=true){}
                        if(_isVisible4=false){}
                        if(_isVisible8=false){}
                        if(_isVisible9=false){}
                        if(_isVisible5=false){}
                        Navigator.pop(context);
                      });
                    },
                    child: const Icon(
                      Icons.edit,
                      color:Color.fromRGBO(52,107,33,1),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.0,),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(_isVisible11=true){}
                        if(_isVisible3=false){}
                        if(_isVisible12=true){}
                        if(_isVisible8=false){}
                        if(_isVisible4=false){}
                        if(_isVisible9=false){}
                        if(_isVisible5=false){}
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Edit',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color:Color.fromRGBO(0,0,0,0.87),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ///2nd item
        PopupMenuItem(
          child: InkWell(
            onTap: (){
              setState(() {
                if(_isVisible3=false){}
                if(_isVisible9=false){}
                if(_isVisible4=true){}
                if(_isVisible8=false){}
                if(_isVisible12=false){}
                if(_isVisible5=false){}
                Navigator.pop(context);
              });
              // if(_isVisible5=false){}
            },
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                InkWell(
                  onTap: (){
                    setState(() {
                      if(_isVisible3=false){}
                      if(_isVisible9=false){}
                      if(_isVisible4=true){}
                      if(_isVisible8=false){}
                      if(_isVisible12=false){}
                      if(_isVisible5=false){}
                      Navigator.pop(context);
                    });
                    // if(_isVisible5=false){}
                  },
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 8.0,),
                        child: const Icon(
                          Icons.delete_outline,
                          color:Color.fromRGBO(52,107,33,1),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.0,),
                        child: InkWell(
                          onTap:(){
                            setState(() {
                              if(_isVisible3=false){}
                              if(_isVisible9=false){}
                              if(_isVisible5=false){}
                              if(_isVisible4=true){}
                              if(_isVisible8=false){}
                              if(_isVisible12=false){}
                              Navigator.pop(context);
                            });
                            // if(_isVisible5=false){}
                          },
                          child: Text('Delete',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color:Color.fromRGBO(0,0,0,0.87),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        PopupMenuItem(
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Container(
                child: const Icon(
                  Icons.qr_code_scanner_rounded,
                  color:Color.fromRGBO(52,107,33,1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0,),
                child: Text('Scan QR Code',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color:Color.fromRGBO(0,0,0,0.87),
                  ),
                ),
              ),
            ],
          ),
        ),



      ],

      elevation: 8.0,
    );

  }
  ///bottom navbar
  int _currentIndex = 0;


  late double width;
  late double height;

  static get actions => false;

  /// for checkbox
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    final tabs =[
      ///List Screen
      Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          ///List card
          Visibility(
            visible: _isVisible2,
            child: InkWell(
              onTap: (){
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => listlabel()));
              },
              child: SizedBox(
                // margin: EdgeInsets.only(left: 15.0,right: 15.0,),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.096,
                child: InkWell(
                  onDoubleTap: changedata1,
                  onTap: (){
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => listlabel()));
                  },
                  child: Card(
                    elevation: 3.0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: InkWell(
                                onTap: (){
                                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => listlabel()));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ///check boxxxxxx
                                    Visibility(
                                      visible: _isVisible4,
                                      child: Container(
                                        child: Visibility(
                                          child: InkWell(
                                            onLongPress: changedata,
                                            child: Checkbox(
                                              side: const BorderSide(color: Colors.green),
                                              value: isChecked,
                                              activeColor: Colors.green,
                                              onChanged: (newBool){
                                                setState(() {
                                                  isChecked = newBool;
                                                  if(_isVisible6=true){}
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ///checkbox 2
                                    Visibility(
                                      visible: _isVisible8,
                                      child: Container(
                                        child: Visibility(
                                          child: InkWell(
                                            onLongPress: changedata1,
                                            child: Checkbox(
                                              side: BorderSide(color: Colors.green),
                                              value: isChecked,
                                              activeColor: Colors.green,
                                              onChanged: (newBool){
                                                setState(() {
                                                  isChecked = newBool;
                                                  if(_isVisible10=true){}
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ///Visibility 3
                                    Visibility(
                                      visible: _isVisible12,
                                      child: Container(
                                        margin: EdgeInsets.only(),
                                        child: Visibility(
                                          child: InkWell(
                                            onDoubleTap: changedata2,
                                            child: Checkbox(
                                              side: BorderSide(color: Colors.green),
                                              value: isChecked,
                                              activeColor: Colors.green,
                                              onChanged: (newBool){
                                                setState(() {
                                                  isChecked = newBool;
                                                  if(_isVisible13=true){}
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),





                                    Container(
                                      margin: EdgeInsets.only(top: 10.0,left: 15.0,),
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          UserPost,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Container(
                              // width: MediaQuery.of(context).size.width*0.5,
                              margin: EdgeInsets.only(right: 15.0,top: 13.0,),
                              child: Text('PKR 0.00',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5.0,),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 17.0,),
                                child: Text('items: 0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
            ),
          ),
        SizedBox(
          height: height*0.7,
        ),
          Visibility(
            visible: _isVisible9,
            child: Container(
              margin: EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      _showPopupMenu3();
                    },
                    child: Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
          ///Delete button

          Visibility(
            visible: _isVisible6,
            child: Container(
              margin: EdgeInsets.only(top: 150.0),
              width: width*0.93,
              height: height*0.05,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(0,173,25,1),
                  ),
                  onPressed:(){},
                  child: Text('Delete')
              ),
            ),
          ),
          ///Share Button
          Visibility(
            visible: _isVisible10,
            child: Container(
              margin: EdgeInsets.only(top: 140.0,),
              width: width*0.93,
              height: height*0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0,173,25,1),
                ),
                onPressed:() async {
                  ///ya kam phone ki gallery ma sa image kasa pick karni ha islie kia ha
                  // final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                  // if(image == null)return;
                  // await Share.shareFiles([image.path]);
                  // Share.share("https://play.google.com/store/apps/details?id=com.instructivetech.testapp");
                },
                child: Text('Share'),
              ),
            ),
          ),
          ///Edit Button
          Visibility(
            visible: _isVisible13,
            child: Container(
              margin: EdgeInsets.only(top: 130.0),
              width: width*0.93,
              height: height*0.05,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed:() async {
                    ///ya kam phone  ki gallery ma sa image kasa pick karni ha islie kia ha
                    // final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                    // if(image == null)return;
                    // await Share.shareFiles([image.path]);
                    // Share.share("https://play.google.com/store/apps/details?id=com.instructivetech.testapp");
                    _showPopupMenu3();

                  },
                  child: Text('Edit')
              ),
            ),
          ),
        ],
      ),
      ///Notifications screen
      Container(
        child: Column(
          children: [
            ///1st card
            Container(
              margin: EdgeInsets.only(top: 20.0,),
              width: width*0.93,
              height: height*0.13,
              child: Card(
                elevation: 5.0,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0,),
                      child: Image.asset('Assests/Images/Avatar.png'),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right:70.0,top: 27.0,),
                          child: Text('Name',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(20,20,20,1),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15.0,top: 3.5,),
                          child: Row(
                            children: [
                              Container(
                                child: Text('Requested to add an',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(100,100,100,1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 5.0,top: 2.0,),
                          child: Row(
                            children: [
                              Container(
                                child: Text('item to list name',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(100,100,100,1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50.0,),
                      child: Icon(Icons.cancel_outlined, color: Color.fromRGBO(52,107,33,1),size: 29.0,),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10.0,top: 32.0,),
                          child: Icon(Icons.check_circle_rounded,
                            color: Color.fromRGBO(52,107,33,1),
                            size: 29.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4.0,),

                          child: Text('5 min',
                            style: TextStyle(
                              color: Color.fromRGBO(100,100,100,1),

                            ),
                          ),
                        ),

                      ],

                    ),

                  ],
                ),
              ),
            ),
            ///2nd card
            Container(
              width: width*0.93,
              height: height*0.11,
              child: Card(
                elevation: 5.0,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0,top: 10.0,),
                      child: Image.asset('Assests/Images/Avatar.png'),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right:180.0,top: 27.0,),
                          child: Text('Name',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(20,20,20,1),
                            ),
                          ),
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 15.0,top: 3.5,),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15.0,),
                                child: Text('Added an item to list name',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(100,100,100,1),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 40.0,),
                                child: Text('5 min',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(100,100,100,1),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
            ///3rd card
            SizedBox(
              width: width*0.93,
              height: height*0.11,
              child: Card(
                elevation: 5.0,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 10.0,top: 10.0,),
                      child: Image.asset('Assests/Images/Avatar.png'),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right:180.0,top: 27.0,),
                          child: const Text('Name',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(20,20,20,1),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 15.0,),
                              child: const Text('Added an item to list name',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(100,100,100,1),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 40.0,),
                              child: const Text('5 min',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(100,100,100,1),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ///Settings Screen
      Container(
        child: Column(
          children: [
            ///1st Visibility of setting
            Visibility(
              visible: _isVisible15,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,top: 20.0,),
                            child: CircleAvatar(
                              // backgroundColor: Colors.black,
                              radius: 40,
                              child: CircleAvatar(
                                radius: 110,
                                backgroundImage: AssetImage('Assests/Images/Ellipse (1).png'),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 17.0,top: 6.0,),
                                child: Text('Bagja Alfatih',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(20,20,20,1)
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 20.0,top: 7.0,),
                                      child: Text('example@email.com',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(100,100,100,1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ),
                    ///profile settings
                    TextButton(
                      onPressed: (){
                        setState(() {
                          if(_isVisible15=false){}
                          if(_isVisible16=true){}
                        });
                        // Navigator.of(context).push(MaterialPageRoute(builder: (context) => profile_settings()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0,),
                        // width: width*0.93,
                        // height: height*0.08,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10.0,),
                              child: Icon(Icons.person_pin,color: Color.fromRGBO(52,107,33,1),size: 33.0,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.0,),
                              child: Text('Profile settings',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(72,72,72,1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///line
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///changed password
                    TextButton(
                      onPressed: (){
                        setState(() {
                          if(_isVisible15=false){}
                          if(_isVisible17=true){}
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0,),

                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 16.0,),
                              child: Icon(Icons.lock,color: Color.fromRGBO(52,107,33,1),size: 25.0,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.0,),
                              child: Text('Changed password',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(72,72,72,1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///line
                    Container(
                      margin: EdgeInsets.only(top:2.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///notification settings
                    TextButton(
                      onPressed: (){
                        setState(() {
                          if(_isVisible15=false){}
                          if(_isVisible19=true){}
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 2.0,),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 17.0,),
                              child: Icon(Icons.notifications,color: Color.fromRGBO(52,107,33,1),size: 26.0,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.0,),
                              child: Text('Notification settings',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(72,72,72,1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///line
                    Container(
                      margin: EdgeInsets.only(top:2.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///location settings
                    TextButton(
                      onPressed: (){
                        setState(() {
                          if(_isVisible15=false){}
                          if(_isVisible20=true){}
                        });

                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 2.0,),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 18.0,),
                              child: Icon(Icons.location_on,color: Color.fromRGBO(52,107,33,1),size: 26.0,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.0,),
                              child: Text('Location settings',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(72,72,72,1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///line
                    Container(
                      margin: EdgeInsets.only(top:2.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///Language settings
                    TextButton(
                      onPressed: (){
                        setState(() {
                          if(_isVisible15=false){}
                          if(_isVisible21=true){}
                        });

                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 5.0,),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 18.0,),
                              child: Icon(Icons.language_outlined,color: Color.fromRGBO(52,107,33,1),size: 26.0,),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15.0,),
                              child: Text('Language settings',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(72,72,72,1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ///line
                    Container(
                      margin: EdgeInsets.only(top:2.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///share app
                    Container(
                      margin: EdgeInsets.only(top: 15.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 23.0,),
                            child: Icon(Icons.share,color: Color.fromRGBO(52,107,33,1),size: 26.0,),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0,),
                            child: Text('Share app',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,72,72,1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///line
                    Container(
                      margin: EdgeInsets.only(top:10.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///Rate us
                    Container(
                      margin: EdgeInsets.only(top: 15.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 23.0,),
                            child: Icon(Icons.thumb_up,color: Color.fromRGBO(52,107,33,1),size: 26.0,),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0,),
                            child: Text('Rate us',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,72,72,1),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///line
                    Container(
                      margin: EdgeInsets.only(top:10.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///logout
                    Container(
                      margin: EdgeInsets.only(top: 15.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 23.0,),
                            child: Icon(Icons.logout,color: Color.fromRGBO(52,107,33,1),size: 26.0,),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15.0,),
                            child: Text('Logout',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,72,72,1),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///line
                    Container(
                      margin: EdgeInsets.only(top:10.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            ///2nd visibility of settings
            Visibility(
              visible: _isVisible16,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20.0,),
                            child:   CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: Image.asset('Assests/Images/Ellipse (2).png'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 80.0,top: 105.0,),
                            child: Image.asset('Assests/Images/Add (1).png'),
                          ),
                        ],
                      ),
                    ),
                    ///input field
                    InkWell(
                      onTap: (){
                        setState(() {
                          if(_isVisible18=true){}
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 17.0,),
                        width: width*0.93,
                        height: height*0.055,
                        child: TextFormField(
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor:  Color.fromRGBO(100,100,100,1),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 1.2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1), width: 1.2),
                            ),
                            hintText: 'Bagja Alfaith',
                          ),
                        ),
                        // validator: (password) {
                        //   if (isPasswordValid(password)) return null;
                        //   else
                        //     return 'Enter a valid password';
                        // },
                      ),
                    ),
                    ///email field
                    TextButton(
                      onPressed: (){
                        setState(() {
                          if(_isVisible18=true){}
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 17.0,),
                        width: width*0.93,
                        height: height*0.055,
                        child: InkWell(
                          onTap: (){
                            if(_isVisible18=true){}
                          },
                          child: TextFormField(
                            controller: emailcontroller,
                            // autovalidateMode: AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green, width: 1.2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1), width: 1.2),
                              ),
                              hintText: 'example@email.com',
                            ),
                          ),
                        ),
                        // validator: (password) {
                        //   if (isPasswordValid(password)) return null;
                        //   else
                        //     return 'Enter a valid password';
                        // },
                      ),
                    ),
                    ///Save Button
                    Visibility(
                      visible: _isVisible18,
                      child: Container(
                        margin: EdgeInsets.only(top: 320.0,),
                        width: width*0.92,
                        height: height*0.055,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(0,173,25,1),
                          ),
                          onPressed:  _isButtonEnabled ? _onButtonPressed : null,

                          child: Text('Save',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,

                            ),
                          ),
                        ),

                      ),
                    ),

                  ],
                ),
              ),
            ),
            ///3rd Visibility of setting
            Visibility(
              visible: _isVisible17,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 17.0,),
                      width: width*0.93,
                      height: height*0.055,
                      child: TextFormField(
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: _obscureText,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10.0,left: 10.0,),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 1.2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1), width: 1.2),
                            ),
                            hintText: 'Current Password',
                            suffixIcon:  GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: new Icon(
                                _obscureText ?
                                Icons.visibility_off: Icons.visibility,
                                color: Color.fromRGBO(100,100,100,1),
                                size: 20,
                              ),
                            )
                        ),
                        // validator: MultiValidator(
                        //     [
                        //       RequiredValidator(
                        //           errorText: 'Please enter email')
                        //     ]
                        //
                        // ),


                      ),
                      // validator: (password) {
                      //   if (isPasswordValid(password)) return null;
                      //   else
                      //     return 'Enter a valid password';
                      // },

                    ),
                    Container(
                      margin: EdgeInsets.only(top: 17.0,),
                      width: width*0.93,
                      height: height*0.055,
                      child: TextFormField(
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: _obscureText2,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 10.0,left: 10.0,),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 1.2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1), width: 1.2),
                            ),
                            hintText: 'New Password',
                            suffixIcon:  GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText2 = !_obscureText2;
                                });
                              },
                              child: new Icon(
                                _obscureText2 ?
                                Icons.visibility_off: Icons.visibility,
                                color: Color.fromRGBO(100,100,100,1),
                                size: 20,
                              ),
                            )
                        ),
                        // validator: MultiValidator(
                        //     [
                        //       RequiredValidator(
                        //           errorText: 'Please enter email')
                        //     ]
                        //
                        // ),


                      ),
                      // validator: (password) {
                      //   if (isPasswordValid(password)) return null;
                      //   else
                      //     return 'Enter a valid password';
                      // },

                    ),
                    ///ya confirm password ma error wala kam kia hua ha
                    Container(
                      margin: EdgeInsets.only(top: 17.0,),
                      width: width*0.93,
                      height: height*0.055,
                      child: TextFormField(
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: _obscureText3,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.red,
                            ),

                            contentPadding: EdgeInsets.only(top: 10.0,left: 10.0,),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green, width: 1.2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(100,100,100,1), width: 1.2),
                            ),
                            hintText: 'Confirm Password',
                            suffixIcon:  GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText3 = !_obscureText3;
                                });
                              },
                              child: new Icon(
                                _obscureText3 ?
                                Icons.visibility_off: Icons.visibility,
                                color: Color.fromRGBO(100,100,100,1),
                                size: 20,
                              ),
                            )
                        ),
                        validator: (value){
                          if(value == null || value ==''){
                            return "enter name";
                          }
                        },


                      ),
                      // validator: (password) {
                      //   if (isPasswordValid(password)) return null;
                      //   else
                      //     return 'Enter a valid password';
                      // },

                    ),
                  ],
                ),
              ),
            ),
            ///4th Visibility
            Visibility(
              visible: _isVisible19,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('List Request Notifications',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(20,20,20,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Switch(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: _switchValue,
                              onChanged: (value){
                                setState(() {
                                  _switchValue=value;
                                });
                              },

                            ),
                          ),
                        ],
                      ),

                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(100,100,100,0.6),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('List Changes Notifications',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(20,20,20,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Switch(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: _switchValue2,
                              onChanged: (value){
                                setState(() {
                                  _switchValue2=value;
                                });
                              },

                            ),
                          ),
                        ],
                      ),

                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(100,100,100,0.6),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ///5th visibility
            Visibility(
              visible: _isVisible20,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15.0,),
                            child: Text('Location',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(20,20,20,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Switch(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: _switchValue2,
                              onChanged: (value){
                                setState(() {
                                  _switchValue2=value;
                                });
                              },

                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Colors.grey,
                              height: 1,
                              thickness: 0.3,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ///6th Visibility
            Visibility(
              visible: _isVisible21,
              child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 21.0,
                    ),
                    ///english
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('English',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,100,100,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0,),
                            child: Radio(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: 1,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },

                            ),
                          ),

                        ],
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(33,33,33,0.08),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///Urdu
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('Urdu',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,100,100,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0,),
                            child: Radio(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: 2,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },

                            ),
                          ),

                        ],
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(33,33,33,0.08),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///Roman
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('Roman',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,100,100,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0,),
                            child: Radio(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: 3,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },

                            ),
                          ),

                        ],
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(33,33,33,0.08),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///Chinese
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('Chinese',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,100,100,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0,),
                            child: Radio(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: 4,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },

                            ),
                          ),

                        ],
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(33,33,33,0.08),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///Hindi
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('Hindi',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,100,100,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0,),
                            child: Radio(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: 5,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },

                            ),
                          ),

                        ],
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(33,33,33,0.08),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///French
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('French',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,100,100,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0,),
                            child: Radio(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: 6,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },

                            ),
                          ),

                        ],
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(33,33,33,0.08),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///Spenish
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('Spanish',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,100,100,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0,),
                            child: Radio(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: 7,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },

                            ),
                          ),

                        ],
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(33,33,33,0.08),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ///Arabic
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            child: Text('Arabic',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(72,100,100,1),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10.0,),
                            child: Radio(
                              activeColor: Color.fromRGBO(52,107,33,1),
                              value: 8,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value!;
                                });
                              },

                            ),
                          ),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:1.0,),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.0,),
                            width: width*0.9,
                            child: Divider(
                              color: Color.fromRGBO(33,33,33,0.08),
                              height: 1,
                              thickness: 0,
                              indent: 0,
                              endIndent: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),







          ],
        ),
      ),
    ];
    ///popup menu phla yaha call hoti ha but humna uper menu ma kam kia ha to islie function ko bhi uper call kara gan

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body:
        Column(
          children: [
            ///1st appbar
            Visibility(
              visible: _isVisible3,
              child: AppBar(
                backgroundColor: Colors.purple,
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const
                    Text('My Lists',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255,255,255,1),
                      ),
                    ),
                    SizedBox(
                      width: width*0.55,
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () async{
                          setState(() {
                            if(_isVisible7=true){}
                          });
                          if(_isVisible3=false){}
                          else if(_isVisible8=true){}

                          if(_isVisible9=false){}
                          if(_isVisible5=false){}


                        },
                        icon: Icon(Icons.share),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 8.0,),
                      child: IconButton(
                        onPressed: (){
                          _showPopupMenu4();
                        },
                        icon: Icon(Icons.more_vert_sharp,size: 25.0,),
                      ),
                    ),

                  ],
                ),
                automaticallyImplyLeading: false,
              ),
            ),
            ///2nd appbar
            Visibility(
              visible: _isVisible4,
              child: AppBar(
                backgroundColor: Colors.purple,
                automaticallyImplyLeading: false,
                title: Row(
                  children: [
                    Container(
                      child: InkWell(
                          onTap: (){

                            setState(() {
                              if(_isVisible4=false){}
                              if(_isVisible6=false){}
                              if(_isVisible5=true){}
                              if(_isVisible3=true){}
                              if(_isVisible9=true){}
                            });

                          },
                          child: Icon(Icons.close,color: Color.fromRGBO(255,255,255,1),)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 50.0,),
                      child: Text(datatochange,style: TextStyle(
                        color: Color.fromRGBO(255,255,255,1),
                      ),),
                    ),


                  ],
                ),
              ),
            ),
            ///3rd appbar
            Visibility(
              visible: _isVisible7,
              child: Container(
                child: AppBar(
                  backgroundColor: Colors.purple,
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      Container(
                        child: InkWell(
                            onTap: (){
                              setState(() {
                                if(_isVisible7=false){}
                                if(_isVisible10=false){}
                                if(_isVisible14=false){}
                                if(_isVisible8=false){}
                                if(_isVisible12=false){}
                                if(_isVisible9=true){}
                                if(_isVisible5=true){}
                                if(_isVisible3=true){}

                              });


                            },
                            child: const Icon(Icons.close)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50.0,),
                        child: Text(datatochange1),
                      ),


                    ],
                  ),
                ),
              ),
            ),
            ///4th app bar
            Visibility(
              visible: _isVisible11,
              child: Container(
                child: AppBar(
                  backgroundColor: Colors.purple,
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      Container(
                        child: InkWell(
                            onTap: (){
                              setState(() {
                                if(_isVisible19=true){}
                                if(_isVisible11=false){}
                                if(_isVisible3=true){}
                                if(_isVisible5=true){}
                                if(_isVisible4=false){}
                                if(_isVisible8=false){}
                                if(_isVisible12=false){}
                                if(_isVisible9=true){}
                                if(_isVisible13=false){}
                              });
                            },
                            child: Icon(Icons.close)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50.0,),
                        child: Text(datatochange2),
                      ),


                    ],
                  ),
                ),
              ),
            ),








            ///Bottom navbar
            Container(
                child: tabs[_currentIndex]),
          ],
        ),
        // bottomNavigationBar: Visibility(
        //   visible: _isVisible5,
        //   child: Container(
        //     child: BottomNavigationBar(
        //       currentIndex: _currentIndex,
        //       type: BottomNavigationBarType.fixed,
        //       fixedColor: Colors.green,
        //       items: const <BottomNavigationBarItem>[
        //         BottomNavigationBarItem(
        //           // activeIcon: Image.asset("Assets/Images/list.png",width: 15,color: Colors.white,),
        //           icon: ImageIcon(AssetImage('Assests/Images/list.png',)),
        //           label: 'My Lists',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Icon(Icons.notifications),
        //           label: 'Notifications',
        //         ),
        //         BottomNavigationBarItem(
        //           icon: Icon(Icons.settings),
        //           label: 'Settings',
        //         ),
        //       ],
        //       onTap: (index){
        //         setState(() {
        //
        //
        //         });
        //         setState(() {
        //           _currentIndex = index;
        //         });
        //
        //       },
        //     ),
        //   ),
        // ),




















      ),
    );
  }
}
///stf
///https://www.youtube.com/watch?v=Em4wVQY7Kj8

// https://stackoverflow.com/questions/61328474/flutter-uncheck-checkbox-if-other-checkbox-is-checked