abstract class Shopstate {}

class shopInitialState extends Shopstate{}
class shopBottomNavigator extends Shopstate{}

class shopLoadingState extends Shopstate{}
class shopSucessState extends Shopstate{}
class shopErrorState extends Shopstate{
  final String? error;

  shopErrorState({this.error});
  
}