import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ride_match/config/constants/route_uri.dart';
import 'package:ride_match/core/utils/validators';
import 'package:ride_match/core/widgets/button_text.dart';
import 'package:ride_match/core/widgets/circular_progress.dart';
import 'package:ride_match/core/widgets/custome_input.dart';
import 'package:ride_match/features/auth/presentation/blocs/forgot_password/forgot_password_bloc.dart';
import "package:responsive_sizer/responsive_sizer.dart";

class ResetPasswordPage extends StatefulWidget {
  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            GoRouter.of(context).go(RouteUri.verifyOtp);
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 100.w,
          height: 85.h,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 90.w,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.w,
                      ),
                      Text(
                        'Reset Password',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Text(
                        'Please enter a secure password that you can easily remember.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      CustomeTextField(
                        hintText: "New Password",
                        controller: newPasswordController,
                        validator: passwordValidator,
                        password: true,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is ResetPasswordLoading ||
                              state is ResetPasswordSuccess
                          ? null
                          : () {
                              BlocProvider.of<ForgotPasswordBloc>(context).add(
                                  ResetPassword(
                                      password: newPasswordController.text));
                            },
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(Size(90.w, 13.w)),
                      ),
                      child: state is ResetPasswordLoading
                          ? CircularProgress()
                          : state is ResetPasswordFailed
                              ? const ButtonText(text: 'Error')
                              : state is ResetPasswordSuccess
                                  ? TextButton(
                                      onPressed: () {
                                        GoRouter.of(context).go(RouteUri.login);
                                      },
                                      child: const ButtonText(
                                        text: 'Success! Tap',
                                      ),
                                    )
                                  : const ButtonText(
                                      text: 'Reset Password',
                                    ),
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}