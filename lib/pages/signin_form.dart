import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/blocs/login/_.dart';
import 'package:tracking_app/styles/index.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {},
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF226C58), Color(0xFF319B7F), Color(0xC0A13E56)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  // child: ShaderMask(
                  //   blendMode: BlendMode.srcIn,
                  //   shaderCallback: (Rect bounds) => LinearGradient(
                  //     tileMode: TileMode.clamp,
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //       Color(0xFF226C58),
                  //       Color(0xFF319B7F),
                  //       Color(0xC0A13E56),
                  //     ],
                  //     stops: [0, 0.21, 0.33]
                  //   ).createShader(bounds),
                  //   child: Icon(
                  //     Icons.pin_drop,
                  //     size: 128,
                  //     color: Colors.white,
                  //   ),
                  // ),
                ),
                Container(
                  height: 64,
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text(
                    "iTracking",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Styles.nearlyWhite.withAlpha(192),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Colors.white.withAlpha(80)),
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.transparent),
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Icon(
                                  Icons.email,
                                  color: Styles.nearlyWhite,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(right: 16),
                              border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Styles.nearlyWhite)),
                          style: TextStyle(color: Styles.nearlyWhite),
                          controller: _usernameController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: Colors.white.withAlpha(80)),
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.transparent),
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Icon(
                                  Icons.lock,
                                  color: Styles.nearlyWhite,
                                ),
                              ),
                              contentPadding: EdgeInsets.only(right: 16),
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Styles.nearlyWhite)),
                          style: TextStyle(color: Styles.nearlyWhite),
                          controller: _passwordController,
                          obscureText: true,
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Styles.nearlyWhite,
                              decoration: TextDecoration.underline),
                        ),
                        splashColor: Colors.transparent,
                        onPressed: () => null,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: state is LoginFailure ? Text(
                    "Your email or password is incorrect.",
                    style: TextStyle(
                      color: Colors.greenAccent
                    ),
                  ) : null,

                ),
                Container(
                  child: state is LoginLoading
                      ? CircularProgressIndicator()
                      : null,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: RaisedButton(
                            splashColor: Color(0x11226C58),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            color: Styles.nearlyWhite.withAlpha(192),
                            child: Text(
                              "Sign In",
                              style:
                              TextStyle(color: Color(0xFF226C58), fontSize: 18),
                            ),
                            onPressed: state is! LoginLoading ? _onLoginButtonPressed : null,
                          ),
                        ),
                      ),
                      Text(
                        "Do not have an account?",
                        style: TextStyle(color: Styles.nearlyWhite),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: OutlineButton(
                            splashColor: Styles.nearlyWhite.withAlpha(40),
                            borderSide: BorderSide(
                              color: Styles.nearlyWhite.withAlpha(192),
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                            child: Text(
                              "Sign Up",
                              style:
                              TextStyle(color: Styles.nearlyWhite, fontSize: 18),
                            ),
                            onPressed: () => null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}