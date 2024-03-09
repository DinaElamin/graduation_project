// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "email_hint_text": MessageLookupByLibrary.simpleMessage(
            "Enter your email or phone number"),
        "forget_password":
            MessageLookupByLibrary.simpleMessage("Forget Password ?"),
        "full_name": MessageLookupByLibrary.simpleMessage("Full Name"),
        "get_started": MessageLookupByLibrary.simpleMessage("Get Started"),
        "landing_text1":
            MessageLookupByLibrary.simpleMessage("Your School  App"),
        "landing_text2":
            MessageLookupByLibrary.simpleMessage("Bring the school to you"),
        "login": MessageLookupByLibrary.simpleMessage("Log In "),
        "login_text": MessageLookupByLibrary.simpleMessage("Welcome back"),
        "login_text_desc": MessageLookupByLibrary.simpleMessage(
            "sign in to access your account"),
        "name_hint_text":
            MessageLookupByLibrary.simpleMessage("Enter Your Name"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "password_hint_text":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "send_code": MessageLookupByLibrary.simpleMessage("Send Code"),
        "text_forget_password": MessageLookupByLibrary.simpleMessage(
            "Don’t worry! It happens. Please enter the \n email associated with your account.")
      };
}
