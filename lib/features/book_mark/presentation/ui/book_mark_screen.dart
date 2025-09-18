import 'package:bookia/features/book_mark/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/book_mark/presentation/ui/widgets/cart_wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/presentation/cubit/home_cubit.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context), // ✅ أرجع للخلف
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text("Wishlist"),
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        buildWhen: (prev, current) {
          return current is WishlistSuccess ||
              current is WishlistLoading ||
              current is WishlistError;
        },
        builder: (context, state) {
          if (state is WishlistLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WishlistSuccess) {
            if (state.items.isEmpty) {
              return Center(child: Text("Your wishlist is empty 💔"));
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: ListView.separated(
                itemCount: state.items.length,
                itemBuilder: (context, i) {
                  return CartWishlist(
                    wishlistItem: state.items[i],
                    onPressed: () {
                      context.read<HomeCubit>().addToCard(
                        state.items[i].id ?? 0,
                      );
                    },
                    onTap: () {
                      context
                          .read<WishlistCubit>()
                          .removeFavorite(state.items[i].id ?? 0);
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
              ),
            );
          } else if (state is WishlistError) {
            return Center(
              child: Text("Something went wrong, try again."),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}

