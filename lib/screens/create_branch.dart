import 'package:flutter/material.dart';
import 'package:office_doc_tracing/constants.dart';
import 'package:office_doc_tracing/functions/client.dart';
import 'package:office_doc_tracing/widgets/custom_password_form_field.dart';
import 'package:office_doc_tracing/widgets/custom_positive_button.dart';
import 'package:office_doc_tracing/widgets/custom_text_form_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateBranchScreen extends StatefulWidget {
  const CreateBranchScreen({Key? key}) : super(key: key);

  @override
  State<CreateBranchScreen> createState() => _CreateBranchScreenState();
}

class _CreateBranchScreenState extends State<CreateBranchScreen> {
  final _descriptionController = TextEditingController();
  final _branchAddressController = TextEditingController();
  final _branchNameController = TextEditingController();
  final _branchStateController = TextEditingController();
  final _branchCityController = TextEditingController();
  final _branchCountryController = TextEditingController();
  final _branchPincodeController = TextEditingController();
  final _createBranchFormKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String? token;

  fetchTokenFromPref() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString("token");
    });
    // print("Get tooooken in create user screen: $token");
  }

  @override
  void initState() {
    fetchTokenFromPref();
    super.initState();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _branchAddressController.dispose();
    _branchNameController.dispose();
    _branchStateController.dispose();
    _branchCityController.dispose();
    _branchCountryController.dispose();
    _branchPincodeController.dispose();

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
                "Create Branch",
                style: bold64white,
              ),
            ),
          ),
        ),
        Container(
          height: height,
          width: 4,
          color: grey5261,
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
      color: greyF0F5F9,
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
                      style: regular48black,
                    ),
                    Text(
                      "Let’s create a new branch quickly",
                      style: light24black,
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
              key: _createBranchFormKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: "Enter branch name",
                      controller: _branchNameController,
                      validator: _validateName,
                    ),
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter description",
                      controller: _descriptionController,
                      validator: _validateEmail,
                    ),
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter branch address",
                      controller: _branchAddressController,
                      validator: _validateEmail,
                    ),
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter branch city",
                      controller: _branchCityController,
                      validator: _validateEmail,
                    ),
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter branch state",
                      controller: _branchStateController,
                      validator: _validateEmail,
                    ),
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter branch country",
                      controller: _branchCountryController,
                      validator: _validateEmail,
                    ),
                    sizedBoxH22W0,
                    CustomTextFormField(
                      hintText: "Enter branch pincode",
                      controller: _branchPincodeController,
                      validator: _validateEmail,
                    ),
                    sizedBoxH22W0,
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
            text: "CREATE BRANCH",
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
          text: "CREATE BRANCH",
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
      if (_createBranchFormKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Processing Data'),
          ),
        );

        var _client = APICLient();
        var _response;
        try {
          try {
            print("Tokkken: ${token!}\nFull name: ${_branchNameController.text}\nEmail: ${_descriptionController.text}\nPassword: ${_branchStateController.text}\nMobile: ${_branchAddressController.text}");
          } catch (e) {
            print("Error occurred Tooken is null: ${e.toString()}");
          }
          _response = await _client.createUser(
              token!,
              _branchNameController.text,
              _descriptionController.text,
              _branchStateController.text,
              _branchAddressController.text,
              "2001-10-04",
              ["All permissions"],
              [],
              []);
        } catch (e) {
          print("Error occurred while user creation : ${e.toString()}");
        }


        if (_response == Null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('User Creation failed.'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'User named, ${_response!.fullName}!\nHaving email: ${_response.email} created successfully.'),
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

}
