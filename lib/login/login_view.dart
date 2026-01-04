import 'package:flutter/material.dart';
import 'package:todoapprev/core/page_route_name.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isObscure = true;
  var fromKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffDFECDB),

        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          title: const Text("Loign"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              key: fromKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: mediaQuery.size.height * 0.2),
                  Text(
                    "Welcome Back!",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    cursorColor: theme.primaryColor,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: theme.primaryColor,
                      ),
                      label: Text(
                        "E-mail ",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      hintText: "Enter Your Email address",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.primaryColor),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "plz enter your email";
                      }
                      var regex = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                      );
                      if (!regex.hasMatch(value)) {
                        return "invailed email";
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    obscureText: isObscure,
                    controller: passwordController,
                    cursorColor: theme.primaryColor,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: theme.primaryColor,
                        ),
                      ),
                      label: Text(
                        "Password ",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      hintText: "Enter Your Password",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.primaryColor),
                      ),
                    ),
                    /*validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "plz enter your password";
                      }

                      return null;
                    },*/
                  ),
                  const Text(
                    "forgot password ",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),

                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      /*if (fromKey.currentState!.validate()) {
                        print("vaild");
                      }*/
                      Navigator.pushReplacementNamed(
                        context,
                        PageRouteNames.task,
                      );
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                      backgroundColor: theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          "LOGIN",
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const Icon(Icons.arrow_forward_sharp, size: 22),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteNames.registration);
                    },

                    child: const Text(
                      "Create Account ",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
