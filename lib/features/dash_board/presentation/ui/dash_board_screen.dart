import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/basket/presentation/cubit/basket_cubit.dart';
import 'package:bookia/features/basket/presentation/ui/basket_screen.dart';
import 'package:bookia/features/book_mark/presentation/ui/book_mark_screen.dart';
import 'package:bookia/features/home/presentation/ui/home_screen.dart';
import 'package:bookia/features/person/presentation/ui/person_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/cubit/home_cubit.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int index = 0;

  List<Widget> screens = [
    BlocProvider(
      create: (context) => HomeCubit(),
      child: HomeScreen(),
    ),
    BookMarkScreen(),
    BlocProvider(
      create: (context) =>
      BasketCubit()
        ..showCard(),
      child: BasketScreen(),
    ),
    PersonScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        backgroundColor: Colors.white,
        fixedColor: AppColor.mainColor,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
      ),
      body: screens[index],
    );
  }
}
