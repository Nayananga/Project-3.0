// import 'package:flutter/material.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title : 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(
//         ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _CircleProgressState createState() => new _CircleProgressState();
// }

// // class _CircleProgressState extends State<MyHomePage> with SingleTickerProviderStateMixin{
// //     AnimationController progressController ;
// //     Animation<double> animation;

// //     void initState(){
// //       super.initState();
// //       progressController = AnimationController(vsync:this, duration: Duration(milliseconds: 1000));
// //       animation = Tween<double>(begin: 0,end :80).animate(progressController)..addListener((){
// //         setState((){

// //         });
// //       });
// //     }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueAccent,
//         //centerTitle: true,
//         leading: Icon(Icons.playlist_add_check),
//         title: new Text(
//           'Complaint',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//            fontFamily: "Herriweather-Black",
//             fontWeight: FontWeight.bold,
//              ),
//         ),
//         ),
        
//       body: Container(
//           child: SafeArea(
//             top:false,
//             bottom: false,
//             child: Container(
//                 child:SingleChildScrollView(
//                   padding:EdgeInsets.all(15.0),
                  
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                      children: <Widget>[
                    
//                      SizedBox(height: 5.0,),

//                       Center(
//                         child: Container(
//                        // margin: EdgeInsets.all(10.0),
//                         height:200.0,
//                         width:300.0,
//                         decoration:BoxDecoration(
//                           color: Colors.white,
//                           border:Border(
//                             top:BorderSide(color: Colors.indigo, width: 3.0),
//                             right:BorderSide(color: Colors.indigo, width: 3.0),
//                             left:BorderSide(color: Colors.indigo, width: 3.0),
//                             bottom:BorderSide(color: Colors.indigo, width: 3.0),),

//                             borderRadius: BorderRadius.all(Radius.circular(20.0),
//                           ),
//                            ),

              
//                            child: Icon(Icons.photo_camera,
//                            size:150.0,
//                            color:Colors.grey.shade500,
//                            ),
//                         ),
//                         ),

//                SizedBox(
//                  height: 30.0,
//                ),
               
//                     TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color:Colors.indigo,
//                             width:1.5,
//                             style: BorderStyle.solid,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                         ),
//                          focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                             color:Colors.indigo,
//                             width:1.5,
//                             style: BorderStyle.solid,
//                           ),
//                           borderRadius: BorderRadius.all( Radius.circular(15.0)),
//                         ),
//                          prefixIcon: Icon(
//                           Icons.my_location,
//                           color:Colors.black,
//                         ),

//                         labelText: "Location",
//                         helperText: "Your location",
                        
//                         labelStyle: TextStyle(
//                         color: Colors.indigo,
//                         fontFamily: "Merriweather-Black",
//                         fontWeight: FontWeight.bold,
//                          ),

//                         helperStyle: TextStyle(
//                         color: Colors.indigo,
//                         fontFamily: "Merriweather-Black",
//                         fontWeight: FontWeight.bold,
//                       ),
//                       ),
//                       maxLines:1,
//                       ),
              

//                 SizedBox(
//                  height: 30.0,
//                ),

//                TextFormField(
//                       keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                             color:Colors.indigo,
//                             width:1.5,
//                             style: BorderStyle.solid,
//                           ),
//                           borderRadius: BorderRadius.all(Radius.circular(15.0)),
//                         ),
//                          focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(
//                             color:Colors.indigo,
//                             width:1.5,
//                             style: BorderStyle.solid,
//                           ),
//                           borderRadius: BorderRadius.all( Radius.circular(15.0)),
//                         ),
//                          prefixIcon: Icon(
//                           Icons.message,
//                           color:Colors.black,
//                         ),

//                         labelText: "Description",
//                         helperText: "Enter your complaint",
                        
//                         labelStyle: TextStyle(
//                         color: Colors.indigo,
//                         fontFamily: "Merriweather-Black",
//                         fontWeight: FontWeight.bold,
//                          ),

//                         helperStyle: TextStyle(
//                         color: Colors.indigo,
//                         fontFamily: "Merriweather-Black",
//                         fontWeight: FontWeight.bold,
//                       ),
//                       ),
//                       maxLines:1,
//                       ),
              
//                        Padding(
//                        padding: const EdgeInsets.all(30.0),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[

//                            FlatButton(
//                              color:Colors.blueAccent,
//                              shape:StadiumBorder(),
//                              onPressed: (){},
//                              child: Text("Done",
//                                 style: TextStyle(
//                                fontSize: 20.0,
//                                color: Colors.white,
//                              ),),
//                            ),
//                          ],

//                        ),
//                      ),
                 
//                      ],
//         ),
//           ),
//         ),
//           )
//       )
//     );
//   }
// }