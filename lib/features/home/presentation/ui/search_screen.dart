import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/widget/search_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rxdart/rxdart.dart';

import '../../../book_details/presentation/ui/book_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchRx = PublishSubject<String>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchRx.debounceTime(Duration(seconds: 1)).listen((v){
      context.read<HomeCubit>().booksSearch(v);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_ios_new),
        ),
        title: TextFormField(
          onChanged: (v) {
            _searchRx.add(v);
          },
          autofocus: true,
          cursorColor: AppColor.mainColor,
          decoration: InputDecoration(

            hintText: "Search",
            enabledBorder: UnderlineInputBorder(),
            border: UnderlineInputBorder(),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (prev, current) {
          return current is SearchLoadingState ||
              current is SearchSuccessState ||
              current is SearchErrorState;
        },
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchSuccessState) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.only(top: 20.h),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => SearchCart(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<HomeCubit>(),
                                  child: BookDetailsScreen(
                                    products: state.book[index],
                                    onPressed: () {
                                      context.read<HomeCubit>().addToCard(
                                        state.book[index].id ?? 0,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                          products: state.book[index],
                          onPressed: () {
                            context.read<HomeCubit>().addToCard(
                              state.book[index].id ?? 0,
                            );
                          },
                        ),
                        childCount: state.book.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 3.3.w / 4.5.h,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
