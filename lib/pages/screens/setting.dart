import 'package:flutter/material.dart';
import 'package:tracking_app/pages/screens/setting_account.dart';
import 'package:tracking_app/pages/screens/setting_device.dart';
import 'package:tracking_app/pages/screens/setting_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tracking_app/blocs/authentication/authentication_bloc.dart';

class SettingScreen extends StatefulWidget {
  final Color primaryColor;

  const SettingScreen({Key key, this.primaryColor}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String name_user = "Hoang Vu Trong Thuy";
  String email = "thuy.hoang_bkuer17@hcmut.edu.vn";

  Container buildContent(
    IconData icon,
    String label,
    bool isEnd,
    bool isButton,
    Color color,
    Widget widget,
  ) {
    return Container(
      color: Colors.white,
      height: 48,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(
                left: 17,
                right: 13,
                top: 13,
                bottom: 13,
              ),
              child: Icon(
                icon,
                color: color,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: 48,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: isEnd
                    ? null
                    : Border(
                        bottom: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Text(
                        label,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: isButton
                        ? IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey,
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => widget),
                            ),
                          )
                        : null,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Icon(
                        Icons.location_on,
                        color: widget.primaryColor,
                        size: 36,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Tracking Lover",
                        style: TextStyle(
                          color: widget.primaryColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.help),
                      color: widget.primaryColor,
                      iconSize: 36,
                      onPressed: () => null,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 66,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "C??I ?????T",
                style: TextStyle(fontSize: 34, fontFamily: "Roboto"),
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 7),
              height: 80,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Icon(
                        Icons.person,
                        color: widget.primaryColor,
                        size: 48,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.all(2),
                                child: Text(
                                  name_user,
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              )),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              child: Text(
                                email,
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingAccount(),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 7, bottom: 7),
              child: Column(
                children: <Widget>[
                  buildContent(Icons.my_location, "Thi???t b???", false, true,
                      widget.primaryColor, SettingDevice()),
                  buildContent(Icons.lock, "Ch??nh s??ch ri??ng t??", false, true,
                      widget.primaryColor, SettingAccount()),
                  buildContent(
                    Icons.info_outline,
                    "Th??ng tin v??? Tracking Lover",
                    true,
                    true,
                    widget.primaryColor,
                    SettingInfo(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 7, bottom: 7),
              child: Column(
                children: <Widget>[
                  buildContent(Icons.group, "Chuy???n t??i kho???n", false, true,
                      widget.primaryColor, null),
                  Container(
                    color: Colors.white,
                    height: 48,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 17,
                              right: 13,
                              top: 13,
                              bottom: 13,
                            ),
                            child: Icon(
                              Icons.exit_to_app,
                              color: Colors.pink
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      "????ng xu???t",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () => BlocProvider.of<AuthenticationBloc>(context).add(LogOut()),
                                    ),
                                  )
                                ]
                              )
                            ),
                          ),
                        ]
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      );
  }
}
