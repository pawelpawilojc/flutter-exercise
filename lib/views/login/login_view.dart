import 'package:flutter/material.dart';
import 'package:listopad3/utils/my_colors.dart';
import 'package:listopad3/utils/my_images.dart';
import 'package:listopad3/utils/my_texts.dart';
import 'package:listopad3/views/home/home_view.dart';
import 'package:listopad3/views/register/register_view.dart';
import 'package:listopad3/views/widgets/basic_text_form_field.dart';
import 'package:listopad3/views/widgets/social_logo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final personController = TextEditingController();
final passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loggedInState = false;

  Future<void> changeLoginState() async {
    loggedInState = true;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('logged', loggedInState);
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Image.asset(MyImages.imageLogo),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    MyTexts.signIn,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: MyColors.midnightOrchidColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const BasicTextFormField(prefixIconChoice: 'person'),
                const SizedBox(height: 30),
                const BasicTextFormField(prefixIconChoice: 'password'),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    MyTexts.forgotPassword,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: MyColors.midnightOrchidColor,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (personController.text == 'pawel' &&
                        passwordController.text == 'haslo') {
                      changeLoginState();
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      MyColors.enchantingAmethystColor,
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(
                      const Size(double.infinity, 50),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  child: const Text(
                    MyTexts.signIn,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  MyTexts.signInSocials,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: MyColors.midnightOrchidColor,
                    shadows: const <Shadow>[
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 10,
                        color: Color(0x4D000000),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SocialLogo(socialNetwork: 'google'),
                      SocialLogo(socialNetwork: 'fb'),
                      SocialLogo(socialNetwork: 'x'),
                      SocialLogo(socialNetwork: 'in'),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyTexts.noAccount,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: MyColors.midnightOrchidColor,
                        ),
                      ),
                      Text(
                        MyTexts.signUp,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: MyColors.midnightOrchidColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
