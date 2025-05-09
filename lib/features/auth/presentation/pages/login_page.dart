import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ride_match/core/utils/validators';
import 'package:ride_match/core/widgets/button_text.dart';
import 'package:ride_match/core/widgets/circular_progress.dart';
import 'package:ride_match/core/widgets/custome_input.dart';
import 'package:ride_match/features/auth/presentation/blocs/auth/auth_cubit.dart';
import 'package:ride_match/features/auth/presentation/blocs/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                    'Log in',
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
                  ],
                ),
              ),
              SizedBox(
                height: 7.w,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(
                          Login(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                  }
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.resolveWith(
                      (states) => Size(90.w, 13.w)),
                ),
                child: BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return state is LoggingIn
                        ? CircularProgress()
                        : state is LoginFailed
                            ? const ButtonText(text: 'Error')
                            : state is LoginSuccess
                                ? TextButton(
                                    onPressed: () {
                                      GoRouter.of(context).go('/');
                                    },
                                    child:
                                        const ButtonText(text: 'Success! Tap'))
                                : const ButtonText(text: 'Log In');
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'You don\'t have an account?',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        padding: WidgetStateProperty.resolveWith((states) =>
                            EdgeInsets.symmetric(
                                horizontal: 0.w, vertical: 0.w)),
                        minimumSize: WidgetStateProperty.resolveWith(
                            (states) => Size(0, 0))),
                    onPressed: () => {GoRouter.of(context).go('/signup')},
                    child: Text(
                      'Signup',
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
