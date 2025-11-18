import 'package:tasky_app/auth/data/model/user_model.dart';

sealed class ResultFB<T>{}
class SuccessFB<T> extends ResultFB<T>{
  SuccessFB ({this.data});
 T? data;
}
class ErrorFB<T> extends ResultFB<T>{
  ErrorFB(this.messageError);
  String messageError;
}
/*
ResultFB<UserModel> getUser{
  return SuccessFB();
}

 */