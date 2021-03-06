import 'package:flutter/material.dart';
import 'package:split_it/core/app_images.dart';
import 'package:split_it/pages/login/login_controller.dart';
import 'package:split_it/pages/login/login_service.dart';
import 'package:split_it/pages/login/login_state.dart';
import 'package:split_it/pages/login/widgets/social_button/social_button_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController loginController;

  @override
  void initState() {
    loginController = LoginController(
        loginService: LoginServiceImplementation(),
        onUpdate: () {
          if (loginController.state is LoginStateSuccess) {
            final user = (loginController.state as LoginStateSuccess).user;
            Navigator.pushReplacementNamed(context, "/home", arguments: user);
          } else {
            setState(() {});
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              width: 247,
              child: Text(
                "Divida suas contas com seus amigos",
                style: AppTheme.textStyles.title,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.emojiStar,
                      width: 36,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    Container(
                      width: 174,
                      child: Text(
                        "Fa??a seu login com uma das contas abaixo",
                        style: AppTheme.textStyles.button,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              if (loginController.state is LoginStateLoading) ...[
                CircularProgressIndicator(),
              ] else if (loginController.state is LoginStateFailure) ...[
                Text((loginController.state as LoginStateFailure).message)
              ] else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      SocialButtonWidget(
                        label: "Entrar com Google",
                        pathImage: AppImages.googleIcon,
                        onPressed: () async {
                          loginController.googleSignIn();
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      // SocialButtonWidget(
                      //   label: "Entrar com Apple",
                      //   pathImage: AppImages.appleIcon,
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
