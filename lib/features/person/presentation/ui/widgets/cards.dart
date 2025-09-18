import 'package:bookia/features/basket/presentation/cubit/basket_cubit.dart';
import 'package:bookia/features/basket/presentation/ui/basket_screen.dart';
import 'package:bookia/features/person/presentation/cubit/person_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Card(
          color: Colors.white,
          child: ListTile(
              title: Text("change name"),
              trailing: IconButton( onPressed: () {
                context.read<PersonCubit>().changeName();
              },
              icon:  Icon(Icons.arrow_forward_ios))
          ),
        ),

      ],
    );
  }
}
