import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/features/auth_feature/providers/authprovider.dart';
import '../../../../core/widgets/customWidgets.dart';
import '../../../../core/widgets/faith_options.dart';

class Pets extends ConsumerStatefulWidget {
  const Pets({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetsState();
}

class _PetsState extends ConsumerState<Pets> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  final _fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 24, left: 24),
      child: Form(
        key: _fKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.verticalSpace,
            const CustomText(
                text: "Pets",
                text2: "Does Your Family Include Paws, Fins, or Feathers?"),
            32.verticalSpace,
            CoustomText(
                text: "🐶 Pet Types ",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                )),
            CoustomText(
                text: "Select all that apply! ",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w800,
                )),
            PetsOption(
              onChanged: (selectedPets) {
                ref
                    .read(authNotifierProvider.notifier)
                    .updatePetParam("pet_options", selectedPets);
              },
            ),
            25.verticalSpace,
            CoustomText(
                text: 'Additional Details',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800)),
            8.verticalSpace,
            TextFormField(
              cursorColor: Colors.black,
              maxLength: 150,
              maxLines: 5,
              decoration: InputDecoration(
                hintText:
                    "Feel free to tell us how many and what kind of pets you have!",
                hintStyle: TextStyle(
                  color: const Color(0xFF777777),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                fillColor: Colors.white,
              ),

              // validator: (val) {
              //   if (val == null || val.isEmpty) {
              //     return "Field required";
              //   }
              //   return null;
              // },
              onChanged: (val){
                ref
                    .read(authNotifierProvider.notifier)
                    .updatePetParam("additional_details", val);
              },
              onTapOutside: (val) {
                FocusScope.of(context).unfocus();
              },
            ),
            32.verticalSpace,
            const CommonText(),
            32.verticalSpace,
            PrimaryButton(
                isLoading: ref.watch(authNotifierProvider).isLoading,
                title: "Next",
                onClick: () {
                  if (_fKey.currentState!.validate()) {
                    _fKey.currentState!.save();
                    ref.read(authNotifierProvider.notifier).updatePetsDetails();
                  }
                }),
            32.verticalSpace
          ],
        ),
      ),
    );
  }
}
