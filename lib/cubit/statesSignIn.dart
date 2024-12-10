import 'package:flutter_application_1/models/loginModel.dart';

abstract class SignInScreenState{}

class initialScrrenState extends SignInScreenState{}
class loadingScrrenState extends SignInScreenState{}
class sucessScrrenState extends SignInScreenState{

  final Login loginModel;
  sucessScrrenState(this.loginModel);
}
class errorScrrenState extends SignInScreenState{
  final String error;

  errorScrrenState(this.error, String string);
}

class visibilityoutlinedState extends SignInScreenState{}
