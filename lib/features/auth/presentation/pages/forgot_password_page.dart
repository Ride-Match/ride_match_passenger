import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:ride_match/config/constants/route_uri.dart';
import 'package:ride_match/core/utils/validators';
import 'package:ride_match/core/widgets/index.dart';
import 'package:ride_match/features/auth/presentation/blocs/index.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            GoRouter.of(context).go(RouteUri.login);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 85.h,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage('assets/forgot.png'),
                      width: 90.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Text(
                      'Don’t worry it happens. Please enter the email address associated with your account.',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    CustomeTextField(
                      hintText: "Email",
                      controller: emailController,
                      validator: emailValidator,
                    ),
                  ],
                ),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is ForgotPasswordLoading ||
                              state is ForgotPasswordSuccess
                          ? null
                          : () {
                              BlocProvider.of<ForgotPasswordBloc>(context).add(
                                  ForgotPassword(email: emailController.text));
                            },
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(Size(90.w, 13.w)),
                      ),
                      child: state is ForgotPasswordLoading
                          ? CircularProgress()
                          : state is ForgotPasswordFailed
                              ? const ButtonText(text: 'Error')
                              : state is ForgotPasswordSuccess
                                  ? TextButton(
                                      onPressed: () {
                                        GoRouter.of(context).go(RouteUri.verifyOtp);
                                      },
                                      child: const ButtonText(
                                          text: 'Success! Tap'))
                                  : const ButtonText(text: 'Send Code'),
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}