// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Your School  App`
  String get landing_text1 {
    return Intl.message(
      'Your School  App',
      name: 'landing_text1',
      desc: '',
      args: [],
    );
  }

  /// `Bring the school to you`
  String get landing_text2 {
    return Intl.message(
      'Bring the school to you',
      name: 'landing_text2',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_started {
    return Intl.message(
      'Get Started',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Log In `
  String get login {
    return Intl.message(
      'Log In ',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get login_text {
    return Intl.message(
      'Welcome back',
      name: 'login_text',
      desc: '',
      args: [],
    );
  }

  /// `sign in to access your account`
  String get login_text_desc {
    return Intl.message(
      'sign in to access your account',
      name: 'login_text_desc',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Name`
  String get name_hint_text {
    return Intl.message(
      'Enter Your Name',
      name: 'name_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email or phone number`
  String get email_hint_text {
    return Intl.message(
      'Enter your email or phone number',
      name: 'email_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get password_hint_text {
    return Intl.message(
      'Enter your password',
      name: 'password_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password ?`
  String get forget_password {
    return Intl.message(
      'Forget Password ?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Send Code`
  String get send_code {
    return Intl.message(
      'Send Code',
      name: 'send_code',
      desc: '',
      args: [],
    );
  }

  /// `please check your email`
  String get please_check_your_email {
    return Intl.message(
      'please check your email',
      name: 'please_check_your_email',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent a code to `
  String get text_verify_code {
    return Intl.message(
      'We’ve sent a code to ',
      name: 'text_verify_code',
      desc: '',
      args: [],
    );
  }

  /// `I didn't receive a code !`
  String get did_not_receive_code {
    return Intl.message(
      'I didn\'t receive a code !',
      name: 'did_not_receive_code',
      desc: '',
      args: [],
    );
  }

  /// `Don’t worry! It happens. Please enter the \n email associated with your account.`
  String get text_forget_password {
    return Intl.message(
      'Don’t worry! It happens. Please enter the \n email associated with your account.',
      name: 'text_forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get verify_code {
    return Intl.message(
      'Verify Code',
      name: 'verify_code',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get change_password {
    return Intl.message(
      'Change Password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter New Password`
  String get enter_new_password {
    return Intl.message(
      'Enter New Password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm new password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Update password`
  String get update_password {
    return Intl.message(
      'Update password',
      name: 'update_password',
      desc: '',
      args: [],
    );
  }

  /// `Password changed`
  String get password_changed {
    return Intl.message(
      'Password changed',
      name: 'password_changed',
      desc: '',
      args: [],
    );
  }

  /// `Your password has been changed successfully`
  String get text_password_change {
    return Intl.message(
      'Your password has been changed successfully',
      name: 'text_password_change',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Search ... `
  String get search {
    return Intl.message(
      'Search ... ',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Users`
  String get users {
    return Intl.message(
      'Users',
      name: 'users',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message(
      'Students',
      name: 'students',
      desc: '',
      args: [],
    );
  }

  /// `Teachers`
  String get teachers {
    return Intl.message(
      'Teachers',
      name: 'teachers',
      desc: '',
      args: [],
    );
  }

  /// `Classes`
  String get classes {
    return Intl.message(
      'Classes',
      name: 'classes',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get class_student {
    return Intl.message(
      'Class',
      name: 'class_student',
      desc: '',
      args: [],
    );
  }

  /// `View Profile`
  String get view_profile {
    return Intl.message(
      'View Profile',
      name: 'view_profile',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get my_profile {
    return Intl.message(
      'My Profile',
      name: 'my_profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting {
    return Intl.message(
      'Settings',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get user_name {
    return Intl.message(
      'User Name',
      name: 'user_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Student Profile`
  String get student_profile {
    return Intl.message(
      'Student Profile',
      name: 'student_profile',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get national_iD {
    return Intl.message(
      'National ID',
      name: 'national_iD',
      desc: '',
      args: [],
    );
  }

  /// `Save Change`
  String get save_change {
    return Intl.message(
      'Save Change',
      name: 'save_change',
      desc: '',
      args: [],
    );
  }

  /// `Add Student`
  String get add_student {
    return Intl.message(
      'Add Student',
      name: 'add_student',
      desc: '',
      args: [],
    );
  }

  /// `Add Teacher`
  String get add_teacher {
    return Intl.message(
      'Add Teacher',
      name: 'add_teacher',
      desc: '',
      args: [],
    );
  }

  /// `Add Grade`
  String get add_grade {
    return Intl.message(
      'Add Grade',
      name: 'add_grade',
      desc: '',
      args: [],
    );
  }

  /// `Enter Full Name`
  String get enter_full_name {
    return Intl.message(
      'Enter Full Name',
      name: 'enter_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter National ID`
  String get enter_national_id {
    return Intl.message(
      'Enter National ID',
      name: 'enter_national_id',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email`
  String get enter_email {
    return Intl.message(
      'Enter Email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Class Code`
  String get enter_class_code {
    return Intl.message(
      'Enter Class Code',
      name: 'enter_class_code',
      desc: '',
      args: [],
    );
  }

  /// `enter the teacher's subject`
  String get enter_the_teacher_subject {
    return Intl.message(
      'enter the teacher\'s subject',
      name: 'enter_the_teacher_subject',
      desc: '',
      args: [],
    );
  }

  /// `enter the teacher's class`
  String get enter_the_teacher_class {
    return Intl.message(
      'enter the teacher\'s class',
      name: 'enter_the_teacher_class',
      desc: '',
      args: [],
    );
  }

  /// `Class Code`
  String get class_code {
    return Intl.message(
      'Class Code',
      name: 'class_code',
      desc: '',
      args: [],
    );
  }

  /// `Update User Image`
  String get update_user_image {
    return Intl.message(
      'Update User Image',
      name: 'update_user_image',
      desc: '',
      args: [],
    );
  }

  /// `Grade`
  String get grade {
    return Intl.message(
      'Grade',
      name: 'grade',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Choose the Subject`
  String get choose_the_subject {
    return Intl.message(
      'Choose the Subject',
      name: 'choose_the_subject',
      desc: '',
      args: [],
    );
  }

  /// `Semester Two`
  String get semester_two {
    return Intl.message(
      'Semester Two',
      name: 'semester_two',
      desc: '',
      args: [],
    );
  }

  /// `Semester One`
  String get semester_one {
    return Intl.message(
      'Semester One',
      name: 'semester_one',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Grades`
  String get grades {
    return Intl.message(
      'Grades',
      name: 'grades',
      desc: '',
      args: [],
    );
  }

  /// `Delete Grade ? `
  String get delete_garde {
    return Intl.message(
      'Delete Grade ? ',
      name: 'delete_garde',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Grade Details`
  String get grade_details {
    return Intl.message(
      'Grade Details',
      name: 'grade_details',
      desc: '',
      args: [],
    );
  }

  /// `Semester One Subject`
  String get semester_one_subject {
    return Intl.message(
      'Semester One Subject',
      name: 'semester_one_subject',
      desc: '',
      args: [],
    );
  }

  /// `Semester Two Subject`
  String get semester_two_subject {
    return Intl.message(
      'Semester Two Subject',
      name: 'semester_two_subject',
      desc: '',
      args: [],
    );
  }

  /// `Teacher Home`
  String get teacher_home {
    return Intl.message(
      'Teacher Home',
      name: 'teacher_home',
      desc: '',
      args: [],
    );
  }

  /// `Add Exam`
  String get add_exam {
    return Intl.message(
      'Add Exam',
      name: 'add_exam',
      desc: '',
      args: [],
    );
  }

  /// `Exam Name`
  String get exam_name {
    return Intl.message(
      'Exam Name',
      name: 'exam_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter Exam Name`
  String get enter_exam_name {
    return Intl.message(
      'Enter Exam Name',
      name: 'enter_exam_name',
      desc: '',
      args: [],
    );
  }

  /// `Subject Id`
  String get subject_id {
    return Intl.message(
      'Subject Id',
      name: 'subject_id',
      desc: '',
      args: [],
    );
  }

  /// `Enter Subject Id`
  String get enter_subject_id {
    return Intl.message(
      'Enter Subject Id',
      name: 'enter_subject_id',
      desc: '',
      args: [],
    );
  }

  /// `Upload Exam Image`
  String get upload_exam_image {
    return Intl.message(
      'Upload Exam Image',
      name: 'upload_exam_image',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Select Image Source`
  String get select_image_source {
    return Intl.message(
      'Select Image Source',
      name: 'select_image_source',
      desc: '',
      args: [],
    );
  }

  /// `Student Exams`
  String get student_exams {
    return Intl.message(
      'Student Exams',
      name: 'student_exams',
      desc: '',
      args: [],
    );
  }

  /// `Behaviors`
  String get behaviors {
    return Intl.message(
      'Behaviors',
      name: 'behaviors',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message(
      'Appearance',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `Exams`
  String get exams {
    return Intl.message(
      'Exams',
      name: 'exams',
      desc: '',
      args: [],
    );
  }

  /// `Attendence`
  String get attendence {
    return Intl.message(
      'Attendence',
      name: 'attendence',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get current_password {
    return Intl.message(
      'Current Password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Subject Details`
  String get subject_details {
    return Intl.message(
      'Subject Details',
      name: 'subject_details',
      desc: '',
      args: [],
    );
  }

  /// `Change Profile`
  String get change_profile {
    return Intl.message(
      'Change Profile',
      name: 'change_profile',
      desc: '',
      args: [],
    );
  }

  /// `Find a student ...`
  String get find_a_student {
    return Intl.message(
      'Find a student ...',
      name: 'find_a_student',
      desc: '',
      args: [],
    );
  }

  /// `Add Student Successfully !`
  String get add_student_successfully {
    return Intl.message(
      'Add Student Successfully !',
      name: 'add_student_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Add Teacher Successfully !`
  String get add_teacher_successfully {
    return Intl.message(
      'Add Teacher Successfully !',
      name: 'add_teacher_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Image Required`
  String get image_required {
    return Intl.message(
      'Image Required',
      name: 'image_required',
      desc: '',
      args: [],
    );
  }

  /// `Please select an image to proceed.`
  String get please_select_an_image {
    return Intl.message(
      'Please select an image to proceed.',
      name: 'please_select_an_image',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Take Photo`
  String get take_photo {
    return Intl.message(
      'Take Photo',
      name: 'take_photo',
      desc: '',
      args: [],
    );
  }

  /// `Choose From The Gallery`
  String get choose_from_the_gallery {
    return Intl.message(
      'Choose From The Gallery',
      name: 'choose_from_the_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Upload user Image`
  String get upload_user_image {
    return Intl.message(
      'Upload user Image',
      name: 'upload_user_image',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Grade`
  String get please_enter_grade {
    return Intl.message(
      'Please Enter Grade',
      name: 'please_enter_grade',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
