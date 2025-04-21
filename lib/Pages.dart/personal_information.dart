import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/sign_up_steps/sign_up_steps.dart';
import 'package:relative_choice/auth_feature/params/sign_up_params.dart';
import 'package:relative_choice/auth_feature/providers/authprovider.dart';
import 'package:relative_choice/core/validator/validator.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

class Personal_Information extends ConsumerStatefulWidget {
  const Personal_Information({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Personal_InformationState();
}

class _Personal_InformationState extends ConsumerState<Personal_Information> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  String getFormattedDate() {
    String day = dayController.text.trim();
    String month = monthController.text.trim();
    String year = yearController.text.trim();

    if (day.isEmpty || month.isEmpty || year.isEmpty) {
      return "Invalid Date";
    }

    return "$day-$month-$year";
  }

 Future<void> selectDateAndSetControllers({
  required BuildContext context,
  required TextEditingController dayController,
  required TextEditingController monthController,
  required TextEditingController yearController,
}) async {
  final DateTime? picked = await showDatePicker(
    
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
    confirmText: 'Ok',
  );
  if (picked != null) {
    dayController.text = picked.day.toString().padLeft(2, '0');
    monthController.text = picked.month.toString().padLeft(2, '0');
    yearController.text = picked.year.toString();
  }
}

void _handleDateTap() {
  selectDateAndSetControllers(
    context: context,
    dayController: dayController,
    monthController: monthController,
    yearController: yearController,
  );
}

final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final validator = ref.watch(validatorsProvider);
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: _key,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          16.verticalSpace,
          CustomText(
              text: 'Personal Information',
              text2: 'Please add your personal information below'),
          24.verticalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            height: 206.h,
            //  width: 327.w,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 14,
                    offset: Offset(0, 8),
                    spreadRadius: 0,
                  )
                ]),
            child: Text.rich(TextSpan(
              children: [
                TextSpan(
                  text: 'Please Note : ',
                  style: TextStyle(
                    color: Color(0xFF57C05C),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text:
                      ' For the safety of the community and everyone within it, including you, we require your real first and last name during account creation. This information will remain private and will not be visible on your profile. Instead, you’ll choose a username that will be displayed publicly. If your circumstances change—such as marriage, divorce, or a name change—you can update your real name later in your account settings.',
                  style: TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 12.h,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )),
          ),
          32.verticalSpace,
          CoustomText(
              text: 'First Name',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
              )),
          8.verticalSpace,
          CustomTextField(
            label: "Please enter your first name ",
            keyboardType: TextInputType.text,
            controller: firstnameController,
            validator: validator.validationFirstName,
          
          ),
          8.verticalSpace,
          CoustomText(
              text: "Your real first name is required for safety.",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF777777),
                  fontStyle: FontStyle.italic)),
          24.verticalSpace,
          CoustomText(
              text: 'Last Name',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          8.verticalSpace,
          CustomTextField(
            validator: validator.validationFirstName,
            label: "Please enter your last name ",
            keyboardType: TextInputType.text,
            controller: lastnameController,
             onSaved: (newValue) {
              ref
                  .read(signUpParamsDataProvider.notifier)
                  .update((p) => p!.copyWith(lastname: newValue));
                  print(newValue);
            },
          ),
          8.verticalSpace,
          CoustomText(
              text: "Your real last name is required for safety.",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF777777),
                  fontStyle: FontStyle.italic)),
          24.verticalSpace,
          CoustomText(
            
              text: 'Username',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          8.verticalSpace,
          CustomTextField(
            validator: validator.validationFirstName,
            label: "Please enter your username ",
            keyboardType: TextInputType.text,
            controller: usernameController,
             onSaved: (newValue) {
              ref
                  .read(signUpParamsDataProvider.notifier)
                  .update((p) => p!.copyWith(username: newValue));
            },
          ),
          8.verticalSpace,
          CoustomText(
              text:
                  "Choose a username for your profile. This will be visible to others instead of your real name. Usernames must be rated G—no profanity, hate speech, or sexualized language allowed.",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF777777),
                  fontStyle: FontStyle.italic)),
          24.verticalSpace,
          CoustomText(
              text: 'Zip Code',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          8.verticalSpace,
          CustomTextField(
            validator: validator.validationFirstName,
            label: "Please enter your zip code ",
            keyboardType: TextInputType.phone,
            controller: addressController,
             onSaved: (newValue) {
              ref
                  .read(signUpParamsDataProvider.notifier)
                  .update((p) => p!.copyWith(address: newValue));
            },
          ),
          8.verticalSpace,
          CoustomText(
              text: "This helps us match you based on location.",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF777777),
                  fontStyle: FontStyle.italic)),
          24.verticalSpace,
          CoustomText(
              text: 'Birth Date',
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
          Padding(
          padding: EdgeInsets.only(right: 24),
          child: Row(
            children: [
        8.verticalSpace,
        SizedBox(
          height: 56,
          width: 74,
          child: CustomTextField(
            validator: validator.validationFirstName,
            label: 'Day',
            keyboardType: TextInputType.phone,
            controller: dayController,
            readOnly: true,
            onTap: _handleDateTap
            
          ),
        ),
        15.horizontalSpace,
        Expanded(
          child: SizedBox(
            height: 56,
            width: 109,
            child: CustomTextField(
              label: 'Month',
              keyboardType: TextInputType.phone,
              controller: monthController,
              readOnly: true,
              onTap: _handleDateTap
            ),
          ),
        ),
        15.horizontalSpace,
        Expanded(
          child: SizedBox(
            height: 56,
            width: 114,
            child: CustomTextField(
              label: 'Year',
              keyboardType: TextInputType.phone,
              controller: yearController,
              readOnly: true,
              onTap: _handleDateTap,
                onSaved: (newValue) {
              ref
                  .read(signUpParamsDataProvider.notifier)
                  .update((p) => p!.copyWith(dateOfBirth: newValue));
            },
            ),
          ),
        )
            ],
          ),
        ),
        
          8.verticalSpace,
          CoustomText(
              text:
                  "Your date of birth is private and invisible to the public. For security, it cannot be changed later.",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF777777),
                  fontStyle: FontStyle.italic)),
          32.verticalSpace,
          CommonText(),
          32.verticalSpace,
          ElevatedButton(
              onPressed: () {
                ref.read(authNotifierProvider.notifier).register();
                ref.read(progressBarValueProvider.notifier).state++;
                ref.read(pageControllerProvider.notifier).state.nextPage(
                    duration: Duration(microseconds: 500),
                    curve: Curves.bounceIn);
              },
              child: Text(
                "Next",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )),
          32.verticalSpace
        ]),
      ),
    );
  }
}
