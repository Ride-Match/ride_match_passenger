import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ride_match/core/utils/validators';
import 'package:ride_match/core/widgets/button_text.dart';
import 'package:ride_match/core/widgets/custome_input.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'Ride Match',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 10.w,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 2.w,
                  ),
                ],
              ),
              SizedBox(
                height: 7.w,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomeTextField(
                      hintText: "Username",
                      controller: nameController,
                      validator: textValidator,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    CustomeTextField(
                      hintText: "Email",
                      controller: emailController,
                      validator: emailValidator,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    CustomeTextField(
                      hintText: "Password",
                      controller: passwordController,
                      password: true,
                      validator: passwordValidator,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Stack(alignment: Alignment.centerRight, children: [
                      TextFormField(
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        obscureText: !visible,
                        obscuringCharacter: '*',
                        validator: (value) {
                          return confirmPasswordValidator(
                              value, passwordController.text);
                        },
                        controller: confirmPasswordController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                            constraints: BoxConstraints(maxWidth: 90.w),
                            label: Text('Confirm Password'),
                            hintText: 'Confirm Password',
                            labelStyle: Theme.of(context).textTheme.bodyMedium,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 0.3.w),
                                borderRadius: BorderRadius.circular(3.w)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 0.3.w),
                                borderRadius: BorderRadius.circular(3.w)),
                            disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 0.3.w),
                                borderRadius: BorderRadius.circular(3.w)),
                            alignLabelWithHint: true),
                      ),
                      IconButton(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.4),
                        iconSize: 6.w,
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: () {
                          setState(() {
                            visible = !visible;
                          });
                        },
                      )
                    ]),
                    SizedBox(
                      height: 4.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 7.w,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.resolveWith(
                      (states) => Size(90.w, 13.w)),
                ),
                child: ButtonText(text: "Sign Up"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'You already have an account?',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.resolveWith((states) =>
                            EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 0.w)),
                        minimumSize: MaterialStateProperty.resolveWith(
                            (states) => Size(0, 0))),
                    onPressed: () => {GoRouter.of(context).go('/login')},
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 4.w),
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
