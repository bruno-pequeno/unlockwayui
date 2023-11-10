import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unlockway/components/form_progress.dart';
import 'package:unlockway/components/navigation.dart';
import 'package:unlockway/components/text_field.dart';
import 'package:unlockway/screens/login/login.dart';
import 'package:unlockway/screens/register/register_second.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    required this.name,
    required this.lastname,
    required this.peso,
    required this.altura,
    required this.meta,
    required this.email,
    required this.goal,
    required this.biotype,
  });

  final String name;
  final String lastname;
  final double peso;
  final double altura;
  final String meta;
  final String email;
  final String goal;
  final String biotype;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 13),
          padding: const EdgeInsets.all(22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    navigationPageLeftAnimation(
                      const Login(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 26.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                label: Text(
                  'Voltar'.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              SvgPicture.asset(
                "assets/svgs/logo_mini.svg",
                width: 28,
                height: 28,
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        toolbarHeight: 80,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: Theme.of(context).colorScheme.outline == Colors.white
                ? SvgPicture.asset("assets/svgs/register_bg.svg",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height)
                : SvgPicture.asset("assets/svgs/register_bg_light.svg",
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height),
          ),
          Form(
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Column(
                children: [
                  FormProgress(steps: 2, now: 1),
                  SizedBox(
                    height: 20,
                  ),
                  GenericTextField(
                    placeholder: "Insira seu nome, ex: Marcela",
                    title: "Nome",
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GenericTextField(
                    placeholder: "Insira seu sobrenome, ex: Fernandes",
                    title: "Sobrenome",
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: GenericTextField(
                          placeholder: "Ex: 88",
                          title: "Peso",
                          width: 200,
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        child: GenericTextField(
                          placeholder: "Ex: 1,70",
                          title: "Altura",
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GenericTextField(
                    placeholder: "Diga-nos qual seu objetivo",
                    title: "Meta",
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, bottom: 20),
              width: 130,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    const Color.fromARGB(255, 171, 216, 77)
                  ],
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.5,
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      navigationPageRightAnimation(
                        RegisterSecond(
                          name: widget.name,
                          lastname: widget.lastname,
                          peso: widget.peso,
                          altura: widget.altura,
                          meta: widget.meta,
                          email: widget.email,
                          goal: widget.goal,
                          biotype: widget.biotype,
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Seguir",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(Icons.arrow_forward_outlined),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
