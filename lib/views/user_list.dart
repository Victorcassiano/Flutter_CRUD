import 'package:flutter/material.dart';
import 'package:flutter_crud/Widgets/Users_tile.dart';
import 'package:flutter_crud/provider/user.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users user = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.Cadastro);
            },
          ),
          Text('   ')
        ],
      ),
      body: ListView.builder(
        itemCount: user.count,
        itemBuilder: (ctx, i) => UserTile(user.byIndex(i)),
      ),
    );
  }
}
