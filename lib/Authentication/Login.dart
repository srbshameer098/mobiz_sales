import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Ui/Home.dart';
import '../Bloc/Login_bloc/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Repositiry/Model_Class/Login_Model.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late Loginmodel response;


  void addIntToSF(String storeId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('storeId', storeId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 840,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 440,
                        decoration: BoxDecoration(
                          color: Color(0xff2a55ef),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(250),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 150,
                  child: Text(
                    'Mobiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 190,
                  child: Text(
                    'Sales',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 35,
                    ),
                  ),
                ),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state is LoginSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login Successful')),
                      );
                      // Navigate to Home screen on successful login
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()
                        ),
                      );
                      response = BlocProvider.of<LoginBloc>(context).loginModel;
                    } else if (state is LoginFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login Failed')),
                      );
                    }
                  },
                  child: Positioned(
                    left: 50,
                    top: 320,
                    child: Container(
                      width: 320,
                      height: 510,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'Log in',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              'Please sign in with your details',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(width: 2, color: Colors.grey),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 270,
                                      child: TextField(
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: 'Username',
                                          prefixIcon: Icon(Icons.person, color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                border: Border.all(width: 2, color: Colors.grey),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 270,
                                      child: TextField(
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: 'Password',
                                          prefixIcon: Icon(Icons.lock, color: Colors.black),
                                        ),
                                        obscureText: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 80),
                            GestureDetector(
                              onTap: () {
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginButtonPressed(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                                print( response.user!.storeId);
                                // String userid =  response.user!.storeId.toString();

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xff2a55ef),
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(width: 0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 108, vertical: 20),
                                  child: Text(
                                    'Log in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 850, // Adjust this value to your needs
                  left: 50,
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginLoading) {
                        return CircularProgressIndicator();
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
