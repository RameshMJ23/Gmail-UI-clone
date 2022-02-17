import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmailclone/bloc/cubit.dart';
import 'package:gmailclone/bloc/state.dart';
import 'package:gmailclone/data/account_1.dart';
import 'package:gmailclone/data/account_2.dart';
import 'package:gmailclone/data/account_3.dart';
import 'package:gmailclone/main_routes/mail_detail_route.dart';
import 'package:gmailclone/main_routes/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountCubit>(
        create: (context) => AccountCubit(
        account1: account1_mail_data,
        account2:account2_mail_data,
        account3: account3_mail_data
      ),
      child: MaterialApp(
        title: 'Gmail Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
      )
    );
  }
}

