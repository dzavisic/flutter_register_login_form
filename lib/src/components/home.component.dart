import 'package:flutter/material.dart';
import 'package:flutter_register_login_form_private/src/components/register.component.dart';
import 'package:flutter_register_login_form_private/src/shared/widgets/verticalSpacing.widget.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeComponent> createState() => _HomeComponentState();
}

class _HomeComponentState extends State<HomeComponent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            verticalSpacing(150),
            colorBall(Colors.red[400], 100, 50),
            welcomeToCodeVerification(),
            verticalSpacing(50),
            colorBall(Colors.cyan , 50, 340),
            verticalSpacing(130),
            getStartedButton(),
            verticalSpacing(10),
            loginButton(),
            verticalSpacing(100),
            colorBall(Colors.purple[200] , 65, 100),
          ],
        ),
      ),
    );
  }

  Widget getStartedButton() {
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
              'Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterComponent(title: 'Register form')));
        },
      ),
    );
  }

  Widget loginButton() {
    return Container(
      width: MediaQuery.of(context).size.width - 60,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Login',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login is disabled, please press the button above.'),
            ),
          );
        },
      ),
    );
  }

  Widget colorBall(Color? color, double size, double paddingRight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: size,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
          ),
        ),
        SizedBox(
          width: paddingRight,
        ),
      ],
    );
  }

  Widget welcomeToCodeVerification() {
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(
              width: 20,
            ),
            Text(
              'Welcome to',
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
              'SIGNUP EXAMPLE',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}