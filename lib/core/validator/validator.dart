import 'package:flutter_riverpod/flutter_riverpod.dart';

final validatorsProvider = Provider<Validators>((ref) {
  return Validators();
});

class Validators {
  final emailRegex =
      r"^((([a-z]|\d|[!#\$%&'*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$";

  String? validateEmail(String? email) {
    email = email?.toLowerCase();
    if (email == null || email.isEmpty) {
      return "Email field can't be empty";
    } else if (!RegExp(emailRegex).hasMatch(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password field can't be empty";
    } else if (password.length < 6) {
      return "Password must contain atleast 6 characters";
    }
    return null;
  }

  String? validateMobile(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Password field can't be empty";
    } else if (phone.length < 10) {
      return "Password must contain atleast 10 digits";
    }
    return null;
  }

String? validationFirstName(String? firstname) {
    if (firstname == null || firstname.isEmpty) {
      return "FirstName field can't be empty";
    }
    return null;
  }
  String? validateConfirmPassword(String? confirmPassword, String password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Confirm Password field can't be empty";
    } else if (confirmPassword != password) {
      return "Confirm password filed can't be matched with password field";
    }
    return null;
  }

  String? validateTermsAccepted(value) {
    if (value == null || value == false) {
      return "Please agree to terms and conditions.";
    }
    return null;
  }

  String? Function(String? value) validate(String errorMessage) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      return null;
    };
  }
}