import 'package:flutter/material.dart';
import 'package:flutter_register_login_form_private/src/components/code_verification.component.dart';
import 'package:flutter_register_login_form_private/src/shared/data/countries.dart';
import 'package:flutter_register_login_form_private/src/shared/widgets/verticalSpacing.widget.dart';

class RegisterComponent extends StatefulWidget {
  const RegisterComponent({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<RegisterComponent> createState() => _RegisterComponentState();
}

class _RegisterComponentState extends State<RegisterComponent> {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryFlagController = TextEditingController();
  String selectValue = '';

  @override
  void initState() {
    super.initState();
    phoneNumberController.text = '+1';
    countryFlagController.text = '🇺🇸';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            verticalSpacing(80),
            backButton(),
            verticalSpacing(80),
            fillInformationBelow(),
            verticalSpacing(80),
            form(),
            verticalSpacing(60),
            hintForCode(),
            verticalSpacing(10),
            phoneNumberInput(),
            verticalSpacing(40),
            sendCodeButton(),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Row(
        children: [
          horizontalSpacing(30),
          const Icon(Icons.arrow_back),
          horizontalSpacing(10),
          const Text('Back', style: TextStyle(fontSize: 20),),
        ],
      ),
    );
  }

  Widget fillInformationBelow() {
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(
              width: 20,
            ),
            Text(
              'Let us know a little more',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: const [
            SizedBox(
              width: 20,
            ),
            Text(
              'about you',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget form() {
    return Column(
      children: [
        firstNameInput(),
        verticalSpacing(8),
        lastNameInput(),
        verticalSpacing(8),
        emailInput(),
      ],
    );
  }

  Widget firstNameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: firstNameController,
        decoration: InputDecoration(
          labelText: 'First Name',
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: const TextStyle(
          fontSize: 20,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget lastNameInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: lastNameController,
        decoration: InputDecoration(
          labelText: 'Last Name',
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: const TextStyle(
          fontSize: 20,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  Widget emailInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: const TextStyle(
          fontSize: 20,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget hintForCode() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'We will send you a code to your phone number',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget phoneNumberInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          TextFormField(
            controller: phoneNumberController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your phone number';
              }
              return null;
            },
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.only(left: 10, bottom: 20),
              prefix: SizedBox(
                width: 70,
                height: 50,
                child: DropdownButton<String>(
                  value: countryFlagController.text,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectValue = newValue!;
                      countryFlagController.text = newValue;
                    });
                  },
                  underline: Container(
                    height: 0,
                  ),
                  items: countries
                    .map<DropdownMenuItem<String>>((Map<String, dynamic> value) {
                      if (value['dialCode'].isNotEmpty) {
                        return DropdownMenuItem<String>(
                          value: value['flag'],
                          onTap: () {
                            for (Map<String, dynamic> country in countries) {
                              if (country['flag'] == value['flag']) {
                                phoneNumberController.text = '+' + country['dialCode'];
                                break;
                              }
                            }
                          },
                          child: Text(value['flag'],
                              style: const TextStyle(
                                fontSize: 30,
                              )),
                        );
                      }
                      throw Exception('No dial code');
                  }).toList(),
                ),
              )
            ),
            style: const TextStyle(
              fontSize: 20
            ),
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }

  Widget sendCodeButton() {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Send Code',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],

        ),
        onTap: () {
          if (phoneNumberController.text.isNotEmpty
              && firstNameController.text.isNotEmpty
              && lastNameController.text.isNotEmpty
              && emailController.text.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CodeVerificationComponent(
                  phoneNumber: phoneNumberController.text
                ),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('SMS Code sent'),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Please fill every field'),
              ),
            );
          }

        },
      ),
    );
  }

}