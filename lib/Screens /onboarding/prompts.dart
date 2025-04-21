import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/Screens%20/onboarding/edit_prompt.dart';
import 'package:relative_choice/homeScreen.dart/home.dart';
import 'package:relative_choice/navigationextension.dart';
import 'package:relative_choice/widgets/backicon.dart';
import 'package:relative_choice/widgets/customWidgets.dart';

class Prompts extends ConsumerStatefulWidget {
  const Prompts({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PromptsState();
}

class _PromptsState extends ConsumerState<Prompts> {
  final List<Map<String, String>> prompts = [
    {
      'text': 'Something I recently learned about myself is...',
      'text2':
          "For example: 'I’ve always wanted to celebrate a holiday by hostin...",
    },
    {
      'text': "At this point in my life, I've embraced my love for...",
    },
    {
      'text': "Where I feel a hundred percent comfortable is...",
    },
    {
      'text': "The last thing that made me laugh out loud was...",
    },
    {
      'text': "The most fun activity we’ve done together is...",
    },
    {
      'text': "The quirkiest thing about our relationship is...",
    },
    {
      'text': "The quirkiest thing about our relationship is...",
    },
    {
      'text': "The quirkiest thing about our relationship is...",
    },
    {
      'text': "The quirkiest thing about our relationship is...",
    },
  ];
  void _updatePrompt(String newText) {
    setState(() {
      prompts.add({
        "text2": newText,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              60.verticalSpace,
              IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: BackIcon()),
              CustomText(
                  text: 'Tell Your Story – Your Way!',
                  text2:
                      "Who you are—and who your family is—can’t be summed up in a checkbox. That’s where these prompts come in!"),
              Text(
                'Pick the ones that speak to you, have fun with them, and let your personality (or your family’s personality) shine. Feeling a change? No problem! You can swap them out anytime to keep things fresh.',
                style: TextStyle(
                  color: Color(0xFF777777),
                  fontSize: 14.sp,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
              24.verticalSpace,
              Divider(
                thickness: 1,
                color: Color(0xFFE6E6E6),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Go ahead',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: '-make your profile 😎 as unique as you are!',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Divider(
                thickness: 1,
                color: Color(0xFFE6E6E6),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: prompts.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return PromptContainer(
                      text: prompts[index]["text"]!,
                      text2: prompts[index]["text2"] ?? '',
                      onEdit: (newText) {
                        _updatePrompt(newText);
                      },
                    );
                  },
                ),
              ),
              50.verticalSpace,
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: ElevatedButton(
          onPressed: () {
            context.navigateTo(HomeScreen());
          },
          child: Text(
            'Next',
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class PromptContainer extends StatefulWidget {
  final String text;
  final String? text2;
  final Function(String) onEdit;

  const PromptContainer({
    super.key,
    required this.text,
    this.text2,
    required this.onEdit,
  });

  @override
  State<PromptContainer> createState() => _PromptContainerState();
}

class _PromptContainerState extends State<PromptContainer> {
  String? newText;

  void _bottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      isScrollControlled: true,
      constraints: BoxConstraints.tight(
        Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * .93,
        ),
      ),
      builder: (ctx) {
        return EditPrompt(
          onSave: (newTextValue) {
            setState(() {
              newText = newTextValue.isNotEmpty ? newTextValue : null;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(width: 1, color: Color(0xFFDFDFDF)),
        ),
        color: const Color(0xFFF4FCFF),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (widget.text2 != null && widget.text2!.isNotEmpty)
                  Text(
                    widget.text2!,
                    style: TextStyle(
                      color: const Color(0xFF777777),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  ),
                if (newText != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    newText!,
                    style: TextStyle(
                      color: const Color(0xFF777777),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      height: 1.40,
                    ),
                  ),
                ],
              ],
            ),
          ),
          12.horizontalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: _bottomSheet,
              icon: Image.asset(
                'asset/images/edit.png',
                height: 22,
                width: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class PromptContainer extends StatefulWidget {
//   final String text;
//   final String? text2;
//   final Function(String) onEdit;

//   const PromptContainer(
//       {super.key, required this.text, this.text2, required this.onEdit});

//   @override
//   State<PromptContainer> createState() => _PromptContainerState();
// }

// class _PromptContainerState extends State<PromptContainer> {
//   void _bottomSheet() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//       ),
//       isScrollControlled: true,
//       constraints: BoxConstraints.tight(
//         Size(
//           MediaQuery.of(context).size.width,
//           MediaQuery.of(context).size.height * .93,
//         ),
//       ),
//       builder: (ctx) {
//         return EditPrompt(
//           onSave: (newText) {
//             widget.onEdit(newText);
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//       width: 327.w,
//       decoration: ShapeDecoration(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//           side: BorderSide(width: 1, color: Color(0xFFDFDFDF)),
//         ),
//         color: Color(0xFFF4FCFF),
//       ),
//       child: Row(
//         children: [
//           Flexible(
//             child: Column(
//               children: [
//                 Text(
//                   widget.text,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 Text(
//                   widget.text2!,
//                   style: TextStyle(
//                     color: Color(0xFF777777),
//                     fontSize: 14.sp,
//                     fontWeight: FontWeight.w500,
//                     height: 1.40,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           IconButton(
//             onPressed: _bottomSheet,
//             icon: Image.asset(
//               'asset/images/edit.png',
//               height: 22,
//               width: 22,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
