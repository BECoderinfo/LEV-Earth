import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lvb_earth_admin/controllers/login/login_controller.dart';
import 'package:lvb_earth_admin/utils/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                  ),
                  Text('LVB Earth',
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: constraints.maxHeight * 0.1),
                  Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.05),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            filled: true,
                            fillColor: AppColors.surfaceColor,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 16.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                          controller: controller.idController,
                          onSaved: (phone) {
                            // Save it
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              fillColor: AppColors.surfaceColor,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16.0 * 1.5, vertical: 16.0),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            controller: controller.passwordController,
                            onSaved: (password) {
                              // Save it
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              controller.formKey.currentState!.save();
                              // Navigate to the main screen
                              controller.login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            // backgroundColor: const Color(0xFF00BF6D),
                            // foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 48),
                            shape: const StadiumBorder(),
                          ),
                          child: const Text("Sign in"),
                        ),
                        const SizedBox(height: 16.0),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .color!
                                      .withOpacity(0.64),
                                ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: Text.rich(
                        //     TextSpan(
                        //       text: "Don’t have an account? ",
                        //       children: [
                        //         TextSpan(
                        //             text: "Sign Up",
                        //             style:
                        //                 Theme.of(context).textTheme.bodyLarge),
                        //       ],
                        //     ),
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodyMedium!
                        //         .copyWith(
                        //           color: Theme.of(context)
                        //               .textTheme
                        //               .bodyLarge!
                        //               .color!
                        //               .withOpacity(0.64),
                        //         ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
