import 'package:flutter/material.dart';
import 'package:flutter_crud/provider/user.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/cadastro.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Users(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: UserList(),
        routes: {
          AppRoutes.Home: (_) => UserList(),
          AppRoutes.Cadastro: (_) => Cadastro()
        },
      ),
    );
  }
}
