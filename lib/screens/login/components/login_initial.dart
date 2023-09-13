import 'package:flutter/material.dart';
import 'package:unlockway/constants.dart';
import 'package:unlockway/components/buttons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/generic_form.dart';
import 'package:unlockway/screens/register/register.dart';
import 'package:unlockway/screens/home/home.dart';

class InitialLogin extends StatefulWidget {
  const InitialLogin({super.key});

  @override
  State<InitialLogin> createState() => _InitialLoginState();
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(
        1.0,
        0.0,
      );
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

void navigatePage(BuildContext context, Widget page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return page;
      },
    ),
  );
}

Future<void> _dialogBuilder(BuildContext context) {
  return showGeneralDialog<void>(
    barrierColor: const Color.fromARGB(0, 255, 255, 255),
    context: context,
    transitionDuration: const Duration(milliseconds: 200),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(
        0.0,
        1.0,
      );
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return Dialog(
        alignment: Alignment.bottomCenter,
        insetPadding: const EdgeInsets.all(0),
        child: Container(
          height: 450,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Color(darkBgdark),
            boxShadow: [
              BoxShadow(
                color: Color(darkBglight),
              ),
              BoxShadow(
                color: Color(darkBglight),
                spreadRadius: 4.0,
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            child: Form(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const GenericForm(
                      title: "E-mail",
                      placeholder: "Insira seu E-mail",
                      width: double.infinity),
                  const SizedBox(height: 20),
                  const GenericForm(
                      title: "Senha",
                      placeholder: "********",
                      width: double.infinity),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonOutlined(
                          text: "Cancelar",
                          height: 48.0,
                          width: 600.0,
                          onTap: () {
                            Navigator.of(context).pop();
                          }),
                      const SizedBox(width: 10),
                      ButtonFilled(
                        text: "Entrar",
                        height: 48.0,
                        width: 600.0,
                        onTap: () {
                          navigatePage(
                            context,
                            const Home(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class _InitialLoginState extends State<InitialLogin> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Color(darkBgdark),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  child: SvgPicture.asset(
                    "assets/icon/Logo.svg",
                  ),
                ),
                ButtonFilled(
                  text: "Entrar",
                  height: 48.0,
                  width: 240.0,
                  onTap: () => _dialogBuilder(context),
                ),
                const SizedBox(height: 15),
                ButtonOutlined(
                    text: "Criar Conta",
                    height: 48.0,
                    width: 240.0,
                    onTap: () {
                      Navigator.of(context).push(
                        _createRoute(
                          const RegisterScreen(),
                        ),
                      );
                    }),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 80.0, right: 20.0),
                        child: const Divider(
                          color: Color.fromARGB(255, 180, 179, 179),
                          height: 36,
                        )),
                  ),
                  const Text(
                    "Ou",
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 179, 179),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 80.0),
                        child: const Divider(
                          color: Color.fromARGB(255, 180, 179, 179),
                          height: 36,
                        )),
                  ),
                ]),
                const GoogleButton(),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Image.asset("assets/icon/Vector.png"),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset("assets/icon/Vectortwo.png"),
        ),
      ],
    );
  }
}