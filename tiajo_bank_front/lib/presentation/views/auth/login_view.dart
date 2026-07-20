import 'package:flutter/material.dart';
import '../../../data/models/school_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;
  bool _loading = false;

  Future<void> _submit(SchoolModel school) async {
    setState(() => _loading = true);
    await Future.delayed(const Duration(milliseconds: 600)); // simula carga

    if (!mounted) return;
    setState(() => _loading = false);
    Navigator.pushReplacementNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final school = ModalRoute.of(context)!.settings.arguments as SchoolModel;

    return Scaffold(
      appBar: AppBar(title: Text(school.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_balance, size: 64),
            const SizedBox(height: 8),
            Text(school.slug, style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 24),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Correo'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            CheckboxListTile(
              value: _rememberMe,
              onChanged: (value) => setState(() => _rememberMe = value ?? false),
              title: const Text('Guardar contraseña y mantener sesión iniciada'),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 8),
            _loading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _submit(school),
                      child: const Text('Ingresar'),
                    ),
                  ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Buscar otro colegio'),
            ),
          ],
        ),
      ),
    );
  }
}