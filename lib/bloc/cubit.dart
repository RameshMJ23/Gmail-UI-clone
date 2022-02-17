

import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gmailclone/bloc/state.dart';
import 'package:gmailclone/model/mail_model.dart';

class AccountCubit extends Cubit<AccountDetail>{

  List<MailModel> account1;
  List<MailModel> account2;
  List<MailModel> account3;

  AccountCubit({
    required this.account1,
    required this.account2,
    required this.account3,
  }):super(InitialAccount(account: account1));

  /*selected(){

    List<bool> selectedNumbers = [];
    account1.map((e){
      if(e.isSelected){
        selectedNumbers.add(e.isSelected);
      }
    });

    if(selectedNumbers.isEmpty){
      emit(NoAccountSelected(account: account1));
    }else{
      emit(AccountSelected(account: account1));
    }
  }
*/

  selected(){
    int i = 1;
    emit(AccountSelected(account: account1, numOfItems: i));
    i++;
  }

  notSelected(){
    emit(NoAccountSelected(account: account1));
  }

  changeAccount(){
    log("Account changeddd");
    emit(AccountLoading());
    emit(AccountChanged(account: account2));
  }

  starredAccount(){
    log("starred Account");
    List<MailModel> starredAccount = [];
    account1.map((e){
      if(e.starred) starredAccount.add(e);
    });
    emit(StarredAccount(starredAccount: starredAccount));
  }

  isSelected(MailModel mail){

  }

}