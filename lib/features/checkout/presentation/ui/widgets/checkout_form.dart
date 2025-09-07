import 'package:bookia/core/theme/app_color.dart';
import 'package:bookia/core/widgets/app_buttom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CheckoutForm extends StatefulWidget {
  const CheckoutForm({super.key});

  @override
  State<CheckoutForm> createState() => _CheckoutFormState();
}

class _CheckoutFormState extends State<CheckoutForm> {
  var maskFormatter = MaskTextInputFormatter(
    mask: '### ########',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final List<String> governorates = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Port Said',
    'Suez',
    'Damietta',
    'Dakahlia',
    'Sharkia',
    'Qalyubia',
    'Kafr El-Sheikh',
    'Gharbia',
    'Monufia',
    'Beheira',
    'Ismailia',
    'Fayoum',
    'Beni Suef',
    'Minya',
    'Asyut',
    'Sohag',
    'Qena',
    'Luxor',
    'Aswan',
    'Red Sea',
    'New Valley',
    'Matrouh',
    'North Sinai',
    'South Sinai',
  ];
  final keyCheck = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: keyCheck,
        child: Column(
          spacing: 20.h,
          children: [
            TextFormField(
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "please enter your name";
                } else {
                  return null;
                }
              },
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                labelText: "name",
                labelStyle: TextStyle(),
              ),
            ),
            TextFormField(
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "please enter your email";
                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(v)) {
                  return "Enter the email in a correct format.";
                } else {
                  return null;
                }
              },
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(
                labelText: "email",
                labelStyle: TextStyle(),
              ),
            ),
            DropdownButtonFormField<String>(
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "Please select the governorate";
                } else {
                  return null;
                }
              },
              menuMaxHeight: 300,
              isExpanded: false,
              dropdownColor: AppColor.mainColor,
              decoration: const InputDecoration(
                labelText: "Governorate",
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
              ),
              items: governorates
                  .map(
                    (gov) => DropdownMenuItem<String>(
                      value: gov,
                      child: Text(
                        gov,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Color(0xff626060),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (v) {},
            ),
            TextFormField(
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return "please enter your phone";
                } else if (v.length < 11) {
                  return "Please enter 11 numbers";
                } else {
                  return null;
                }
              },
              inputFormatters: [maskFormatter],
              keyboardType: TextInputType.phone,
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              decoration: InputDecoration(labelText: "phone"),
            ),
            AppButtom(
              onPressed: () {
                if (keyCheck.currentState?.validate() ?? false) {
                  Navigator.pushNamed(context, '/Congrats');
                }
              },
              title: "Confirm order",
              backGroundColor: AppColor.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
