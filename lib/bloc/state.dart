import 'package:gmailclone/model/mail_model.dart';

class AccountDetail{

}

class InitialAccount extends AccountDetail{

  List<MailModel> account;

  InitialAccount({required this.account});
}

class AccountSelected extends AccountDetail{

  List<MailModel> account;
  int numOfItems;

  AccountSelected({
    required this.account,
    required this.numOfItems
  });
}

class NoAccountSelected extends AccountDetail{
  List<MailModel> account;

  NoAccountSelected({
    required this.account
  });
}

class AccountChanged extends AccountDetail{

  List<MailModel> account;

  AccountChanged({
    required this.account
  });
}

class AccountLoading extends AccountDetail{

}

class StarredAccount extends AccountDetail{
  List<MailModel> starredAccount;

  StarredAccount({required this.starredAccount});
}