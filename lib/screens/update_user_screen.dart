import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';
import 'package:office_doc_tracing/functions/client.dart';
import 'package:office_doc_tracing/screens/login_screen.dart';
import 'package:office_doc_tracing/widgets/custom_password_form_field.dart';
import 'package:office_doc_tracing/widgets/custom_positive_button.dart';
import 'package:office_doc_tracing/widgets/custom_text_form_field.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({Key? key}) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
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
    var section1Width = width * 0.3265625;
    var padingAroundFormDesktop = EdgeInsets.fromLTRB(
      width * 0.1015625,
      height * 0.108333,
      width * 0.10703,
      height * 0.15833,
    );
    var padingAroundFormMobile = EdgeInsets.fromLTRB(
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
        section1Width,
        padingAroundFormDesktop,
        context,
      )
          : _buildFormContainer(
        height,
        padingAroundFormMobile,
        context,
        false,
      ),
    );
  }

  Row _buildDesktopSignupScreen(
      double height,
      double section1Width,
      EdgeInsets padingAroundForm,
      BuildContext context,
      ) {
    return Row(
      children: [
        Container(
          height: height,
          width: section1Width,
          color: black,
          child: Center(
            child: RotatedBox(
              quarterTurns: -1,
              child: Text(
                "Update User Details",
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
            padingAroundForm,
            context,
            true,
          ),
        )
      ],
    );
  }

  Container _buildFormContainer(
      double height,
      EdgeInsets paddingAroundForm,
      BuildContext context,
      bool isDesktop,
      ) {
    return Container(
      height: height,
      color: black,
      padding: paddingAroundForm,
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
                      "Let’s update user details quickly",
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
            text: "SAVE CHANGES",
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
          text: "SAVE CHANGES",
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
