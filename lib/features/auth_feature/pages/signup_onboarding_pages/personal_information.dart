import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/validator/validator.dart';
import '../../../../core/services/zipcode_service/zipcode_service.dart';
import '../../../../core/widgets/customWidgets.dart';
import '../../params/sign_up_params.dart';
import '../../providers/authprovider.dart';

class Personal_Information extends ConsumerStatefulWidget {
  const Personal_Information({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _Personal_InformationState();
}

class _Personal_InformationState extends ConsumerState<Personal_Information>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  DateTime? selectedDate;

  Future<void> selectDateAndSetControllers({
    required BuildContext context,
    required TextEditingController dayController,
    required TextEditingController monthController,
    required TextEditingController yearController,
  }) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1980, 8),
      lastDate: DateTime.now(),
      confirmText: 'Ok',
    );
    if (picked != null) {
      selectedDate = picked;
      dayController.text = picked.day.toString().padLeft(2, '0');
      monthController.text = picked.month.toString().padLeft(2, '0');
      yearController.text = picked.year.toString();
      final formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      ref
          .read(signUpParamsDataProvider.notifier)
          .update((p) => p!.copyWith(dateOfBirth: formattedDate));
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
    super.build(context);
    final validator = ref.watch(validatorsProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _key,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              onSaved: (newValue) {
                ref
                    .read(signUpParamsDataProvider.notifier)
                    .update((p) => p!.copyWith(firstname: newValue));
                print(newValue);
              },
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
              validator: validator.validationLastName,
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
              validator: validator.validationUserName,
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
            ZipCodeField(
              controller: addressController,
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
            FormField<String>(
              validator: (value) {
                if (dayController.text.isEmpty ||
                    monthController.text.isEmpty ||
                    yearController.text.isEmpty) {
                  return 'Please select your birth date';
                }
                return null;
              },
              builder: (FormFieldState<String> field) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoustomText(
                      text: 'Birth Date',
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w800),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: Row(
                        children: [
                          8.verticalSpace,
                          SizedBox(
                            height: 56,
                            width: 74,
                            child: CustomTextField(
                              label: 'Day',
                              keyboardType: TextInputType.phone,
                              controller: dayController,
                              readOnly: true,
                              onTap: () {
                                _handleDateTap();
                                field.didChange(
                                    'selected'); // update field state
                              },
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
                                onTap: () {
                                  _handleDateTap();
                                  field.didChange('selected');
                                },
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
                                onTap: () {
                                  _handleDateTap();
                                  field.didChange('selected');
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    if (field.hasError)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4),
                        child: Text(
                          field.errorText!,
                          style: TextStyle(
                            color: Colors.red.shade800,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                  ],
                );
              },
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
            PrimaryButton(
              isLoading: ref.watch(authNotifierProvider).isLoading,
              onClick: () async {
                if (_key.currentState!.validate()) {
                  _key.currentState!.save();

                  ref
                      .read(authNotifierProvider.notifier)
                      .updatePersonalInformation();
                }
              },
              title: "Next",
            ),
            32.verticalSpace
          ]),
        ),
      ),
    );
  }
}

class ZipCodeField extends ConsumerWidget {
  final TextEditingController controller;
  const ZipCodeField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final zipCodeState = ref.watch(zipCodeCheckerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoustomText(
            text: 'Zip Code',
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
        8.verticalSpace,
        CustomTextField(
          validator: (val) {
            if (val == null || val.isEmpty) {
              return "Zip Code field can't be empty";
            } else if (zipCodeState.hasError) {
              return "Invalid Zip Code";
            }
            return null;
          },
          label: "Please enter your zip code",
          keyboardType: TextInputType.number,
          controller: controller,
          onSaved: (newValue) {
            ref
                .read(signUpParamsDataProvider.notifier)
                .update((p) => p!.copyWith(address: newValue));
          },
          onChanged: (val) {
            ref
                .read(zipCodeCheckerProvider.notifier)
                .checkZipCode(zipCode: val);
          },
          // Show error status
          suffixIcon: zipCodeState.when(
            data: (isValid) {
              if (isValid == null) return null;
              if (isValid) {
                return const Icon(Icons.check_circle, color: Colors.green);
              } else {
                return const Icon(Icons.error, color: Colors.red);
              }
            },
            loading: () => const SizedBox(
              width: 10,
              height: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CircularProgressIndicator(
                    color: Colors.green, strokeWidth: 2),
              ),
            ),
            error: (_, __) => const Icon(Icons.error, color: Colors.red),
          ),
        ),
        // if (zipCodeState.hasError)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 4),
        //     child: Text(
        //       "Invalid Zip Code",
        //       style: TextStyle(color: Colors.red, fontSize: 12.sp),
        //     ),
        //   ),
        // if (zipCodeState.hasValue && zipCodeState.value == false)
        //   Padding(
        //     padding: const EdgeInsets.only(top: 4),
        //     child: Text(
        //       "Zip Code not found",
        //       style: TextStyle(color: Colors.red, fontSize: 12.sp),
        //     ),
        //   ),
      ],
    );
  }
}
