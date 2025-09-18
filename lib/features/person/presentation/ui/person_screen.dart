import 'package:bookia/core/cubit/core_cubit.dart';
import 'package:bookia/core/services/local/shared_prefs_helper.dart';
import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/features/person/presentation/cubit/person_cubit.dart';
import 'package:bookia/features/person/presentation/ui/widgets/cards.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text("Profile", style: Theme.of(context).textTheme.titleMedium),
        actions: [
          GestureDetector(
            onTap: () {
              SharedPrefsHelper.remove('token');
              if (context.mounted) {
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/welcome', (v) => false);
              }
            },
            child: Icon(Icons.logout),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body:  Padding(
              padding: EdgeInsets.only(top: 16.h, right: 28.w, left: 28.w),
              child: Column(
                children: [
                  BlocBuilder<PersonCubit, PersonState>(
                    buildWhen: (prev,current)=>current is PersonLoading||current is PersonError|| current is PersonSuccess,
  builder: (context, state) {
    if (state is PersonLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is PersonSuccess){
    return Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(1000.r),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 100.h,
                          width: 100.w,
                          scale: 1,
                          imageUrl: state.profileModel.data?.image ?? "",
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                      SizedBox(width: 13.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.profileModel.data?.name ?? "",
                            style: Theme.of(context).textTheme.displaySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            state.profileModel.data?.email ?? "",
                            style: Theme.of(context).textTheme.titleSmall
                                ?.copyWith(color: Color(0xff808080)),
                          ),
                        ],
                      ),
                    ],
                  );}
    return SizedBox();
  },
),
                  SizedBox(height: 35.h),

                  ToggleSwitch(
                    minWidth: 90.0,
                    initialLabelIndex: context.read<CoreCubit>().isDark?0:1,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['Dark', 'Light'],
                    icons: [Icons.dark_mode, Icons.light_mode],
                    activeBgColors: [[Colors.blue],[Colors.pink]],
                    onToggle: (index) {
                      print('switched to: $index');
                      context.read<CoreCubit>().toggleMode(index!);
                    },
                  ),


                ],
              )),
            );
          }
          
  }

