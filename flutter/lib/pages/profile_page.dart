import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ProfilePage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          backgroundColor: new Color(0xffde5cbc),
        title: new Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(
           fontFamily: "Herriweather-Black",
            fontWeight: FontWeight.bold,
             ),
        ),
        ),
      body: SafeArea(
        top:false,
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
              color: new Color(0xff622F74),
              gradient: LinearGradient(
                colors: [new Color(0xff6094e8), new Color(0xffde5cbc)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              )),
          child: Form(
            child:SingleChildScrollView(
              padding:EdgeInsets.all(15.0),
              
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  Center(child: 
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    height:100.0,
                    width:100.0,
                    decoration:BoxDecoration(
                      color: Colors.white,
                      border:Border(
                        top:BorderSide(color: Colors.indigo, width: 3.0),
                        right:BorderSide(color: Colors.indigo, width: 3.0),
                        left:BorderSide(color: Colors.indigo, width: 3.0),
                        bottom:BorderSide(color: Colors.indigo, width: 3.0),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0),
                      
                      ),
                       ),

                       child: Icon(Icons.person,
                       size:80.0,
                       color:Colors.grey.shade500,
                       ),
                    ),
                    ),
                    ////////
                    const SizedBox(height: 20.0),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                         focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                            ),
                        ),
                         prefixIcon: Icon(
                          Icons.email,
                          color:Colors.black,
                        ),

                        labelText: "Email Address",
                        helperText: "your email address",
                        
                        labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                         ),

                        helperStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      maxLines:1,
                      ),

                ///////
                const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                         focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                            ),
                        ),
                        prefixIcon: Icon(
                          Icons.contacts,
                          color:Colors.black,
                        ),

                        labelText: "Name",
                        helperText: "your name/nick name",
                        
                        labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                         ),

                        helperStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      maxLines:1,
                      ),

                      ////////
                    const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                         focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                            ),
                        ),
                         prefixIcon: Icon(
                          Icons.contacts,
                          color:Colors.black,
                        ),
                        suffixText: "v",
                         suffixStyle: TextStyle(
                          color:Colors.black,
                          fontSize: 25.0,
                        ),


                        labelText: "NIC",
                        helperText: "your NIC number",
                        
                        labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                         ),

                        helperStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      maxLines:1,
                      ),

                      ///////////
                      const SizedBox(height: 20.0),
                      TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                         focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                            ),
                        ),
                         prefixIcon: Icon(
                          Icons.contacts,
                          color:Colors.black,
                        ),

                        labelText: "Gender",
                        helperText: "your gender( male / female)",
                        
                        labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                         ),

                        helperStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      maxLines:1,
                      ),
                      ////////////
                      const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                         focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                            color:Colors.indigo,
                            width:1.5,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                            ),
                        ),
                         prefixIcon: Icon(
                          Icons.call,
                          color:Colors.black,
                        ),
                        prefixText: "+94",
                        prefixStyle: TextStyle(
                          color:Colors.black,
                          fontSize: 16,
                        ),

                        labelText: "TP number",
                        helperText: "your phone number",
                        
                        labelStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                         ),

                        helperStyle: TextStyle(
                        color: Colors.indigo,
                        fontFamily: "Merriweather-Black",
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      maxLines:1,
                      ),

                    const SizedBox(
                      height: 20.0,
                    ),
                   // Icon(Icons.save),
                   
                     Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[

                            ButtonTheme(
                                minWidth: 150.0,
                                height: 50.0,
                                child: RaisedButton(
                                  shape: StadiumBorder(),
                                  color: Colors.purpleAccent,
                                  child: const Text(
                                    'Save',
                                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                                  ),
                                  onPressed: (){},
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
        );
  }

}
