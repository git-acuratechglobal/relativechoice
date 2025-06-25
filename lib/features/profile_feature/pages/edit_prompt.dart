import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPrompt extends ConsumerStatefulWidget {
  final Function(String) onSave;
  final String prompt;
  const EditPrompt({super.key, required this.onSave,required this.prompt});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditPromptState();
}

class _EditPromptState extends ConsumerState<EditPrompt> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.prompt);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          24.verticalSpace,
          Center(
            child: Text(
              'Prompt',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          24.verticalSpace,
          Container(
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(width: 1, color: Color(0xFFDFDFDF)),
                ),
                color: Color(0xFFFFFFFF),
                shadows: [
                  BoxShadow(
                    color: Color.fromARGB(255, 239, 237, 237),
                    blurRadius: 14,
                    //  offset: Offset(0, 20),
                    spreadRadius: 4,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                controller: _controller,
                maxLength: 250,
                maxLines: 15,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText:
                     "Enter something here...",
                    hintStyle: TextStyle(
                      color:  Color(0xFF777777),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                    ),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none),
                onTapOutside: (val){
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
          ),
          24.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 40.w - 40.w) / 2,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(56.h),
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFF777777),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ),
              10.horizontalSpace,
              SizedBox(
                width: (MediaQuery.of(context).size.width - 40.w - 40.w) / 2,
                child: ElevatedButton(
                  onPressed: () {
                    widget.onSave(_controller.text);
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
