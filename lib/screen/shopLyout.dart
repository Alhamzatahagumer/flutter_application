import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/shopCubit.dart';
import 'package:flutter_application_1/cubit/shopState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Shoplyout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Shopcubit, Shopstate>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = Shopcubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
             
            ),
            title: Text(
              "ClickMart",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),
          body: cubit.buttomNavigator[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: cubit.changeBottomNavigator,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.request_page),
                label: "My Order",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_box_rounded),
                label: "Profile",
              ),
            ],
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
          ),
        );
      },
    );
  }
}
