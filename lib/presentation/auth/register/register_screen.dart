import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/assets_manger.dart';
import 'package:todo_app/core/utils/constant_strings_manger.dart';
import 'package:todo_app/core/utils/routes_manger.dart';
import 'package:todo_app/presentation/auth/widgets/custom_text_field.dart';

import '../../../core/utils/dialogs/dialogs.dart';
import '../../../datebase_manager/model/user_dm.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/theme_provider.dart';

class RegisterScreen extends StatefulWidget {
   const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController fullNameController;

  late TextEditingController userNameController;

  late TextEditingController emailController;

  late TextEditingController passwordController;

  late TextEditingController rePasswordController;

  GlobalKey<FormState> formKey = GlobalKey();

   @override
  void initState() {
    // TODO: implement initState
     fullNameController = TextEditingController();
     userNameController = TextEditingController();
     emailController = TextEditingController();
     passwordController = TextEditingController();
     rePasswordController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    fullNameController = TextEditingController();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset(
                  AssetsManager.route,
                  width: 237.w,
                  height: 71.h,
                ),
                SizedBox(height: 15.h,),
                Text(
                  AppLocalizations.of(context)!.fullName,
                  style:  themeProvider.isLightMode()
                      ? LightAppStyle.authTitle
                      : DarkAppStyle.authTitle),

                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  controller: fullNameController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return AppLocalizations.of(context)!.fullNameHint;
                    }
                    return null;
                  },
                  hintText: ConstantManager.fullName,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppLocalizations.of(context)!.userName,
                  style:themeProvider.isLightMode()
                      ? LightAppStyle.authTitle
                      : DarkAppStyle.authTitle),

                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  controller: userNameController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return AppLocalizations.of(context)!.userNameHint;
                    }
                    return null;
                  },
                  hintText: ConstantManager.userName,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppLocalizations.of(context)!.email,
                  style: themeProvider.isLightMode()
                      ? LightAppStyle.authTitle
                      : DarkAppStyle.authTitle),

                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  controller: emailController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return AppLocalizations.of(context)!.emailHint;
                    }
                    return null;
                  },
                  hintText: ConstantManager.email,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppLocalizations.of(context)!.password,
                  style: themeProvider.isLightMode()
                      ? LightAppStyle.authTitle
                      : DarkAppStyle.authTitle),

                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  controller: passwordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return AppLocalizations.of(context)!.passwordHint;
                    }
                    return null;
                  },
                  hintText: ConstantManager.password,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  AppLocalizations.of(context)!.confirmPassword,
                  style: themeProvider.isLightMode()
                      ? LightAppStyle.authTitle
                      : DarkAppStyle.authTitle),

                SizedBox(
                  height: 12.h,
                ),
                CustomTextField(
                  controller: rePasswordController,
                  validator: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return AppLocalizations.of(context)!.confirmPasswordHint;
                    }
                    return null;
                  },
                  hintText: ConstantManager.passwordConfirmation,
                  keyboardType: TextInputType.name,
                ),
                SizedBox(
                  height: 28.h,
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.r)),
                        padding: REdgeInsets.symmetric(vertical: 16)),
                    onPressed: () {
                      register();                    },
                    child: Text(
                      AppLocalizations.of(context)!.signUp,
                      style:themeProvider.isLightMode()
                          ? LightAppStyle.authButton
                          : DarkAppStyle.authButton),
                    )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void register() async {
    if (formKey.currentState?.validate() == false) return;

    try {
      // show Loading
      MyDialog.showLoading(context,
          loadingMessage: 'Waiting...', isDismissible: false);
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      addUserToFireStore(credential.user!.uid);
      //hide loading
      if (mounted) {
        MyDialog.hide(context);
      }
      // show success message
      if (mounted) {
        MyDialog.showMessage(context,
            body: 'User registered successfully',
            posActionTitle: 'Ok', posAction: () {
              Navigator.pushReplacementNamed(context, RoutesManger.login);
            });
      }
    } on FirebaseAuthException catch (authError) {
      if (mounted) {
        MyDialog.hide(context);
      }
      late String message;
      if (authError.code == ConstantManager.weakPassword) {
        message = StringsManager.weakPasswordMessage;
      } else if (authError.code == ConstantManager.emailInUse) {
        message = StringsManager.emailInUseMessage;
      }
      if (mounted) {
        MyDialog.showMessage(
          context,
          title: 'Error',
          body: message,
          posActionTitle: 'OK',
        );
      }
    } catch (error) {
      if (mounted) {
        MyDialog.hide(context);
        MyDialog.showMessage(context,
            title: 'Error',
            body: error.toString(),
            posActionTitle: 'Try again');
      }
    }
  }

  void addUserToFireStore(String uid) async {
    UserDM userDM = UserDM(
      id: uid,
      fullName: fullNameController.text,
      userName: userNameController.text,
      email: emailController.text,
    );
    CollectionReference usersCollection =
    FirebaseFirestore.instance.collection(UserDM.collectionName);
    DocumentReference userDocument = usersCollection.doc(uid);
    await userDocument.set(userDM.toFireStore());
  }
}
