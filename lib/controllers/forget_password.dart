
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _SignInController = TextEditingController();


  @override
  void dispose(){
    _SignInController.dispose();
    super.dispose();

  }
  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _SignInController.text.trim());
      showDialog(
        context: context,
        builder: (context){
          return const AlertDialog(
            content: Text('Password reset link send, Please check your email',style: TextStyle(fontFamily: 'Slabo',fontSize: 20),),
          );
        },
      );

    }on FirebaseAuthException catch (e){
      print(e);
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(
          title: Center(child: Text('Reset Password', style: TextStyle(fontFamily: 'AprilFatface', fontSize: 25,color: Colors.black38),)),
          backgroundColor: Colors.greenAccent[100],
          elevation: 0,
        ),
      //primaryFourthElementText
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(0),
              child: Image.asset('assets/images/reset.png'),
              height: 200,
            ),
            const SizedBox(height: 10,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Enter your email, and we will send you a password reset link",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontFamily: 'BebasNeue', color: Colors.grey),
              ),
            ),
            const SizedBox(height:10 ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _SignInController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.green),
                  ),
                  hintText: 'Email',
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(

              child: MaterialButton(
                elevation: 5,
                //minWidth: 20,
                onPressed: passwordReset,
                height: 50,
                child: Text('Reset Password' , style: TextStyle(fontFamily: 'Slabo',fontSize: 20,color: Colors.white),),
                color: Colors.green,

              ),
            ),

          ],
        )
    );
  }
}
