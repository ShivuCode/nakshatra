import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:nakshatra/Constants/constants.dart';
import 'package:nakshatra/responsive.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey formKey = GlobalKey<FormState>();
  bool show = false;
  String countryCode = '+91';
  //this for fields decorations for login $ registration
  InputDecoration decoration(String hint) => InputDecoration(
      contentPadding: const EdgeInsets.only(top: 0.5),
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.2)),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1.2)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.teal)),
      labelText: hint,
      labelStyle: const TextStyle(fontSize: 15, color: Colors.grey));

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Form(
          key: formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: size > 700 ? 650 : size,
                padding: const EdgeInsets.all(20.0),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  height(10),
                  const Text.rich(TextSpan(
                      text: 'NA',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.teal,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: "KSHA",
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                letterSpacing: 0.3)),
                        TextSpan(
                            text: "TRA",
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.teal,
                                letterSpacing: 0.3))
                      ])),
                  height(8),
                  const Text(
                      "we want your email or password for login and start jourey with you please fill up all requirements.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  height(50),
                  Wrap(
                    children: [
                      if (!show)
                        Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              child: TextFormField(
                                  cursorColor: Colors.teal,
                                  decoration: decoration("Email")),
                            ),
                            height(8)
                          ],
                        ),
                      if (show)
                        Column(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              child: TextFormField(
                                  cursorColor: Colors.teal,
                                  decoration: decoration("Full Name")),
                            ),
                            height(8)
                          ],
                        ),
                      if (show)
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    child: TextFormField(
                                        cursorColor: Colors.teal,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.only(top: 0.5),
                                          border: const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.2)),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.2)),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.teal)),
                                          labelText: "Mobile Number",
                                          labelStyle: const TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          prefix: GestureDetector(
                                            onTap: () {
                                              showCountryPicker(
                                                context: context,
                                                showPhoneCode:
                                                    true, // optional. Shows phone code before the country name.
                                                onSelect: (Country country) {
                                                  setState(() {
                                                    countryCode =
                                                        country.phoneCode;
                                                  });
                                                },
                                              );
                                            },
                                            child: Text("+ $countryCode ",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey)),
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            height(8)
                          ],
                        ),
                      if (show)
                        Row(children: [
                          Expanded(
                              child: Column(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                child: TextFormField(
                                    cursorColor: Colors.teal,
                                    decoration: decoration("Age")),
                              ),
                              height(8)
                            ],
                          )),
                          width(5),
                          Expanded(
                            child: Column(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  child: DropdownButtonFormField<String>(
                                      dropdownColor: Colors.black,
                                      decoration: decoration("Gender"),
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                      value: "Female",
                                      onChanged: (value) {},
                                      items: const [
                                        DropdownMenuItem(
                                          value: "Female",
                                          child: Text("Female"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Male",
                                          child: Text("Male"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Other",
                                          child: Text("Other"),
                                        ),
                                      ]),
                                ),
                                height(8)
                              ],
                            ),
                          ),
                        ]),
                      if (show)
                        Row(children: [
                          Expanded(
                              child: Column(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                child: TextFormField(
                                    cursorColor: Colors.teal,
                                    decoration: decoration("State")),
                              ),
                              height(8)
                            ],
                          )),
                          width(5),
                          Expanded(
                            child: Column(
                              children: [
                                AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    child: TextFormField(
                                      decoration: decoration("City"),
                                    )),
                                height(8)
                              ],
                            ),
                          ),
                        ]),
                      Column(
                        children: [
                          TextFormField(
                              cursorColor: Colors.teal,
                              decoration: decoration("Password")),
                          height(8)
                        ],
                      ),
                      if (show)
                        Column(
                          children: [
                            AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                child: TextFormField(
                                    cursorColor: Colors.teal,
                                    decoration:
                                        decoration("Confirm password"))),
                            height(8)
                          ],
                        ),
                      Column(
                        children: [
                          height(10),
                          ElevatedButton(
                              style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                     const Size(double.infinity, 46)),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.teal)),
                              onPressed: () {
                                nextScreenReplace(
                                    context, const ResponsiveLayout());
                              },
                              child: Text(show ? "SignUp" : "SignIn")),
                          height(10),
                        ],
                      ),
                      if (!show)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            width(5),
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                height: 0.5,
                              ),
                            ),
                            width(5),
                            const Text(
                              "OR",
                              style: TextStyle(color: Colors.grey),
                            ),
                            width(5),
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                height: 0.5,
                              ),
                            ),
                            width(5),
                          ],
                        ),
                    ],
                  ),
                  height(5),
                  if (!show)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Did'nt have account | ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                            onHover: (v) {},
                            onPressed: () {
                              setState(() {
                                show = !show;
                              });
                            },
                            child: const Text("SignUp",
                                style: TextStyle(color: Colors.teal)))
                      ],
                    )
                ]),
              ),
            ),
          ),
        ));
  }
}
