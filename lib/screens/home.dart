import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_4/screens/login.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              signout(context);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text('Person $index'),
            subtitle: Text('Message $index'),
            leading: index.isEven ? CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/1653839709176.jfif'),
            ) : Container(
              padding: EdgeInsets.only(left: 13),
              child: Image.asset('assets/images/1653839709176.jfif'),
            )
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider(thickness: 2,);
        },
        itemCount: 50,
      ),
    );
  }

    signout(BuildContext ctx) async{

      final _sharedPrefes = await SharedPreferences.getInstance();
      await _sharedPrefes.clear();

    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(ctx).pop(); // dismiss dialog
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () {
         Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => ScreenLogin(),
        ),
        (route) => false);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Sign out?"),
      content: Text(
          "Are you sure, Do you want to continue?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: ctx,
      builder: (BuildContext context) {
        return alert;
      },
    );
   
  }
}
