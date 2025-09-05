import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinPutWidget extends StatefulWidget {
  const PinPutWidget({super.key,this.validator,this.onCompleted});
final String? Function(String?)? validator;
final void Function(String)? onCompleted;
  @override
  State<PinPutWidget> createState() => _PinPutWidgetState();
}

class _PinPutWidgetState extends State<PinPutWidget> {
  late final PinTheme defaultPinTheme;
  late final PinTheme focusedPinTheme;
  late final PinTheme submittedPinTheme;

  @override
  void initState() {
    super.initState();

    defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF005FF2)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0xFF005FF2)),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: const Color(0xFF005FF2)),
      ),
      textStyle: defaultPinTheme.textStyle?.copyWith(color: Colors.black)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      validator: widget.validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: widget.onCompleted,
      onTapOutside: (val)=>FocusScope.of(context).unfocus(),
    );
  }
}
