import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 201, 188),
      body: SafeArea(child: Column(
        children: [
          Container(
            height: 200,
            color: const Color.fromARGB(255, 0, 201, 188),

          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration
                (
                  color: Color.fromARGB(255, 255, 255, 255),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                ),
                child:Form(
                  child: ListView
                  (
                    children: 
                    [
                      Padding(
                        padding: const EdgeInsets.only(top: 80,left: 25,right: 25,bottom: 20),
                        child: Container
                        (
                          decoration:BoxDecoration
                          (
                            borderRadius: BorderRadius.circular(20),
                            color:const Color.fromARGB(255, 246, 246, 246),                        
                          ),
                          
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(top:40,left: 22,right: 20,),
                            child: TextFormField
                            (
                              validator: (value) 
                              {
                                if(value==null|| value.isEmpty)
                                {
                                  return 'Enter a username';
                                }
                                else{
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(hintText:'Username',border: InputBorder.none,),
                              // controller: _username,                   
                            ),
                          ),
                        ),
                      ),
                      Padding
                      (
                        padding: const EdgeInsets.only(top: 20,left: 25,right: 25),
                        child: Container
                        (
                          decoration:BoxDecoration
                          (
                            borderRadius: BorderRadius.circular(20),
                            color:const Color.fromARGB(255, 246, 246, 246),                        
                          ),
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(top:8,left: 22,right: 20),
                            child: TextFormField
                            (
                              obscureText: true,
                              decoration: const InputDecoration(hintText:'Password',border: InputBorder.none,),
                              // controller:_password,
                              validator: (value) 
                              {
                                if(value==null|| value.isEmpty)
                                {
                                  return 'Enter a password';
                                }
                                else{
                                  return null;
                                }
                              },                    
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10,left: 270),
                        child: Text('Forgot Password?'),
                      ),
                       Padding
                      (
                        padding: const EdgeInsets.only(top: 50,left: 25,right: 25),
                        child: Container
                        (
                          decoration:BoxDecoration
                          (
                            borderRadius: BorderRadius.circular(500),
                            color:const Color.fromARGB(255, 246, 246, 246),                        
                          ),
                          height: 60,
                          child: ElevatedButton
                                    (
                                      onPressed: ()
                                      { 
                                        // if(_formKey.currentState !.validate())
                                        // {
                                        //   checkLogin(context);
                                        // }
                                        },
                                      style:ElevatedButton.styleFrom
                                      (
                                        backgroundColor: const Color.fromARGB(255, 41, 50, 83),
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),)
                                      ), child:const Text('Login',style: TextStyle(fontSize: 18),)
                                      
                                    ),
                        ),
                      ),
                      // if(!_isDataMateched){
                      //  SnackBar(content: Text(" Username & Password doesn't match ", style: TextStyle(color: Colors.red)),
                      //  duration: Duration(seconds: 2),
                      //  )
                      // }
                        //  Visibility
                        // (
                        //   visible: ! _isDataMateched,
                        //   child: Text(" Username & Password doesn't match ", style: TextStyle(color: Colors.red)),
                        // ),
                      
                    ],
                  )
                ),
            
            ),
          )
        ],
      )),
    );
  }
}