import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:relative_choice/core/extensions/extensions.dart';
import 'package:relative_choice/core/utils/appbutton.dart';
import 'package:relative_choice/core/utils/appsnackbar.dart';
import 'package:relative_choice/core/widgets/backicon.dart';
import '../../../../core/widgets/customWidgets.dart';
import '../providers/profile_onboarding_provider.dart';
import 'edit_prompt.dart';

class Prompts extends ConsumerStatefulWidget {
  const Prompts({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PromptsState();
}

class _PromptsState extends ConsumerState<Prompts> {
  late List< String> prompts;
  Map<int, String> editedPrompts = {};
  late final Map<String, String?> helperTexts;
  void _updatePrompt(String newText, int index) {
    editedPrompts[index] = newText;
  }
@override
  void initState() {
    super.initState();
    final List<String> randomPrompts = List<String>.from(allPrompts)..shuffle();
    final List<String> selected = randomPrompts.take(12).toList();

    prompts = [fixedPrompt, ...selected];

    helperTexts = {
      fixedPrompt: fixedPromptHelper,
    };
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
              ListView.separated(
                physics:
                NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: prompts.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return PromptContainer(
                    text2: helperTexts[prompts[index]],
                    text: prompts[index],
                    onEdit: (newText) {
                      print(newText);
                      _updatePrompt(newText, index);
                    },
                  );
                },
              ),
              150.verticalSpace,
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SizedBox(
          height: 60,
          child: PrimaryButton(
            isLoading: ref.watch(profileOnBoardingProvider).isLoading,
            onClick: () {
              final updatedPrompts = editedPrompts.entries.map((entry) {
                final original = prompts[entry.key];
                final edited = entry.value;
                return "$original $edited";
              }).toList();
              if(updatedPrompts.isEmpty){
                Utils.showSnackBar(context, "Please update at least one prompts");
                return;
              }
              ref
                  .read(profileOnBoardingProvider.notifier)
                  .updatePrompt(updatedPrompts);
            },
            title: 'Next',
          ),
        ),
      ),
    );
  }
  final String fixedPrompt = "Something I recently learned about myself is...";
  final String fixedPromptHelper = "For example: ‘I’ve always wanted to celebrate a holiday by hostin...";
  final List<String> allPrompts = [
    // General prompts
    "If I could help others understand one thing about me or my family dynamic, it would be...",
    "Three ways I care for others and three ways I love people to care for me.",
    "Something I recently learned about myself is...",
    "At this point in my life, I've embraced my love for...",
    "Where I feel a hundred percent comfortable is...",
    "The last thing that made me laugh out loud was...",
    "An animal I relate to and why...",
    "A song that makes me instantly happy is...",
    "My secret talent is...",
    "Never have I ever...",

    // Couples
    "A wonderful family dinner would look like...",
    "I've always wanted to celebrate a holiday like this...",
    "I dream of having a family outing where we...",
    "I'm looking for family that will...",
    "I am the type of family member who will...",
    "Something we love doing together as a couple is...",
    "The best lesson we've learned in our relationship is...",
    "Our ideal weekend includes...",
    "A little-known fact about us is...",
    "The quirkiest thing about our relationship is...",

    // Families
    "Our favorite way to spend time as a family is...",
    "If our family had a motto, it would be...",
    "A family tradition we hope to start is...",
    "One thing that makes our family unique is...",
    "A wonderful memory we share as a family is...",
    "The most fun activity we’ve done together is...",
    "A lesson our family has learned together is...",
    "We always laugh when we remember the time we...",
    "If our family could go on a dream vacation, it would be...",
    "One way we support each other in tough times is...",
  ];

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
   @override
  void initState() {
    super.initState();
    if(widget.text2!=null){
      newText=widget.text2;
    }
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
          prompt: newText ?? "",
          onSave: (newTextValue) {
            setState(() {
              newText = newTextValue.isNotEmpty ? newTextValue : null;
            });
            widget.onEdit(newTextValue);
          },
        );
      },
    );
  }
}
