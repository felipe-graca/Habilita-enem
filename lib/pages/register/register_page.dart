import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habilita_enem/core/components/buttons.dart';
import 'package:habilita_enem/core/components/custom_text_form_field.dart';
import 'package:habilita_enem/pages/register/register_cubit.dart';
import 'package:habilita_enem/shared/spacing.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerCubit = GetIt.I.get<RegisterCubit>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocBuilder<RegisterCubit, RegisterState>(
          bloc: registerCubit,
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: Spacing.m),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          size: 35,
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.m),
                const Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: Spacing.xxxl),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: CustomTextFormField(label: 'Nome'),
                ),
                const SizedBox(height: Spacing.m),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: CustomTextFormField(
                    label: 'E-mail',
                  ),
                ),
                const SizedBox(height: Spacing.m),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: CustomTextFormField(
                    label: 'Senha',
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: Spacing.l),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Spacing.l),
                  child: PrimaryButton(text: 'Registrar-se'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
