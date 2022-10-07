import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';
import 'package:office_doc_tracing/functions/client.dart';
import 'package:office_doc_tracing/screens/create_user_screen.dart';
import 'package:office_doc_tracing/widgets/custom_password_form_field.dart';
import 'package:office_doc_tracing/widgets/custom_positive_button.dart';
import 'package:office_doc_tracing/widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var section1_width = width * 0.3265625;
    var pading_around_form_desktop = EdgeInsets.fromLTRB(
      width * 0.1015625,
      height * 0.25277,
      width * 0.10703,
      height * 0.25277,
    );
    var pading_around_form_mobile = EdgeInsets.fromLTRB(
      width * 0.1015625,
      height * 0.22462,
      width * 0.10703,
      height * 0.10321,
    );

    print("heiiiight: $height");
    print("wiiiiidth: $width");
    return Scaffold(
      body: width > 1000
          ? _buildDesktopLoginScreen(
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

  Row _buildDesktopLoginScreen(
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
                "Login",
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
                      "Let’s log you in quickly",
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
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter username",
                      controller: _userNameController,
                      validator: _validateUserName,
                    ),
                    sizedBoxH22W0,
                    CustomPasswordFormField(
                      hintText: "Enter password",
                      controller: _passwordController,
                      validator: _validatePassword,
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
          child: CustomPositiveButton(
            text: "LOGIN",
            isLoading: _isLoading,
            onPressed: () {
              _validateAndSubmitForm(context);
            },
          ),
        ),
        const SizedBox(height: 45),
        Text(
          "don't have an account?",
          style: regular20white,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const CreateUserScreen(),
              ),
            );
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.zero,
            ),
          ),
          child: Text(
            "sign up",
            style: regular20green6EEB83,
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
          text: "LOGIN",
          isLoading: _isLoading,
          onPressed: () {
            _validateAndSubmitForm(context);
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "don't have an account?",
              style: regular20white,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const CreateUserScreen(),
                  ),
                );
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
              ),
              child: Text(
                "sign-up",
                style: regular20green6EEB83,
              ),
            ),
          ],
        )
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
        var _response = await _client.getToken(
          _userNameController.text.toString(),
          _passwordController.text.toString(),
        );

        // if (_response == Null) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('Signup failed.'),
        //     ),
        //   );
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text(
        //           'Welcome, ${_response!}!\nYou are successfully Signed Up.'),
        //     ),
        //   );
        // }

        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String? _validateUserName(value) {
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
}
