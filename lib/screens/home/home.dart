import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:monsoomer/models/monster.dart';
import 'package:monsoomer/models/user_info_model.dart';
import 'package:monsoomer/services/auth_service.dart';
import 'package:monsoomer/services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'monster_list.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Monster>>.value(
      value: DatabaseService(uid: Provider.of<UserInfoModel?>(context)!.uid).monsters,
      initialData: [],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              label: Text('Logout'),
              icon: Icon(Icons.person),
              onPressed: ()async{
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: MonsterList(),
      ),
    );
  }
}
