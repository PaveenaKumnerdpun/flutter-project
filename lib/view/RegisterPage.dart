import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_project/model/user_profile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
              appBar: AppBar(
                title: const Text("Register"),
                backgroundColor: Colors.blueGrey.shade300,
              ),
              body: Padding(
                padding: const EdgeInsets.all(40),
                child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: EmailValidator(
                              errorText: 'enter a valid email address'),
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (String? email) {
                            profile.email = email;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Password", style: TextStyle(fontSize: 20)),
                        TextFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: 'enter a valid password'),
                              MinLengthValidator(8,
                                  errorText:
                                      'password must be at least 8 digits long'),
                            ]),
                            obscureText: true,
                            onSaved: (String? password) {
                              profile.password = password;
                            }),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState?.save();
                                    print(
                                        "email = ${profile.email} password = ${profile.password}");
                                    formKey.currentState?.reset();
                                  } //reset to null value after pressing "Register" button
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45, vertical: 15),
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.black,
                                    ),
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    )),
                              )
                            ]),
                      ],
                    )),
              ));
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
