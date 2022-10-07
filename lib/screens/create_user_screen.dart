import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';
import 'package:office_doc_tracing/functions/client.dart';
import 'package:office_doc_tracing/screens/login_screen.dart';
import 'package:office_doc_tracing/widgets/custom_password_form_field.dart';
import 'package:office_doc_tracing/widgets/custom_positive_button.dart';
import 'package:office_doc_tracing/widgets/custom_text_form_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var section1_width = width * 0.3265625;
    var pading_around_form_desktop = EdgeInsets.fromLTRB(
      width * 0.1015625,
      height * 0.108333,
      width * 0.10703,
      height * 0.15833,
    );
    var pading_around_form_mobile = EdgeInsets.fromLTRB(
      width * 0.1015625,
      height * 0.108333,
      width * 0.10703,
      height * 0.04854,
    );

    print("heiiiight: $height");
    print("wiiiiidth: $width");
    return Scaffold(
      body: width > 1000
          ? _buildDesktopSignupScreen(
              height,
              section1_width,
              pading_around_form_desktop,
              context,
            )
          : _buildFormContainer(
              height,
              pading_around_form_mobile,
              context,
              false,
            ),
    );
  }

  Row _buildDesktopSignupScreen(
    double height,
    double section1_width,
    EdgeInsets pading_around_form,
    BuildContext context,
  ) {
    return Row(
      children: [
        Container(
          height: height,
          width: section1_width,
          color: black,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                "Create User",
                style: bold64white,
              ),
            ),
          ),
        ),
        Container(
          height: height,
          width: 4,
          color: green6EEB83,
        ),
        Expanded(
          child: _buildFormContainer(
            height,
            pading_around_form,
            context,
            true,
          ),
        )
      ],
    );
  }

  Container _buildFormContainer(
    double height,
    EdgeInsets pading_around_form,
    BuildContext context,
    bool isDesktop,
  ) {
    return Container(
      height: height,
      color: black,
      padding: pading_around_form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome",
                      style: regular48white,
                    ),
                    Text(
                      "Let’s create a new user quickly",
                      style: light24greyA5A5A5,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.06111,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: "Enter user's full name",
                      controller: _nameController,
                      validator: _validateName,
                    ),
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter user's email",
                      controller: _emailController,
                      validator: _validateEmail,
                    ),
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter user's mobile number",
                      controller: _emailController,
                      validator: _validateEmail,
                    ),
                    sizedBoxH22W0,
                    Container(
                      color: Colors.white,
                      child: SfDateRangePicker(
                        selectionTextStyle: regular20green6EEB83,
                        selectionColor: white,
                        backgroundColor: black,
                        todayHighlightColor: green6EEB83,
                        yearCellStyle: DateRangePickerYearCellStyle(
                          textStyle: regular20white,
                        ),
                        monthCellStyle: DateRangePickerMonthCellStyle(
                          textStyle: regular20white,

                          // blackoutDateTextStyle: regular20white
                        ),
                        headerStyle: DateRangePickerHeaderStyle(
                          backgroundColor: black,
                          textStyle: regular20green6EEB83,
                        ),
                        rangeTextStyle: regular20green6EEB83,
                      ),
                    ),
                    // CustomTextFormField(
                    //   hintText: "Enter user's username",
                    //   controller: _userNameController,
                    //   validator: _validateUserName,
                    // ),
                    // sizedBoxH22W0,
                    CustomPasswordFormField(
                      hintText: "Enter password",
                      controller: _passwordController,
                      validator: _validatePassword,
                    ),
                    // sizedBoxH22W0,
                    // CustomPasswordFormField(
                    //   hintText: "Confirm password",
                    //   controller: _confirmPasswordController,
                    //   validator: _validateConfirmPassword,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          sizedBoxH22W0,
          isDesktop
              ? _buildDesktopBottomNav(context)
              : _buildMobileBottomNav(context),
        ],
      ),
    );
  }

  Column _buildMobileBottomNav(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 225,
          child: CustomPositiveButton(
            text: "CREATE USER",
            isLoading: _isLoading,
            onPressed: () {
              _validateAndSubmitForm(context);
            },
          ),
        ),

      ],
    );
  }

  Row _buildDesktopBottomNav(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomPositiveButton(
          text: "CREATE USER",
          isLoading: _isLoading,
          onPressed: () {
            _validateAndSubmitForm(context);
          },
        ),
      ],
    );
  }

  Future<void> _validateAndSubmitForm(BuildContext context) async {
    {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Processing Data'),
          ),
        );

        var _client = APICLient();
        var _response = await _client.register(
          _userNameController.text.toString(),
          _nameController.text.toString(),
          _emailController.text.toString(),
          false,
          _passwordController.text.toString(),
        );

        if (_response == Null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Signup failed.'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Welcome, ${_response!}!\nYou are successfully Signed Up.'),
            ),
          );
        }

        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String? _validateName(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _validateUserName(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _validateConfirmPassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }
}
