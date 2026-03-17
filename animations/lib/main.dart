//22k-4156,22k-4574, 22k-4431,22k-4494
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fade In Logo')),
      body: const Column(
        children: [
          Expanded(child: ExplicitFadeIn()),
          Divider(thickness: 2),
          Expanded(child: ImplicitFadeIn()),
        ],
      ),
    );
  }
}

class ExplicitFadeIn extends StatefulWidget {
  const ExplicitFadeIn({super.key});

  @override
  State<ExplicitFadeIn> createState() => _ExplicitFadeInState();
}

class _ExplicitFadeInState extends State<ExplicitFadeIn>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Explicit — AnimationController',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        FadeTransition(
          opacity: _animation,
          child: const FlutterLogo(size: 100),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _controller.forward(),
              child: const Text('Fade In'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () => _controller.reverse(),
              child: const Text('Fade Out'),
            ),
          ],
        ),
      ],
    );
  }
}

class ImplicitFadeIn extends StatefulWidget {
  const ImplicitFadeIn({super.key});

  @override
  State<ImplicitFadeIn> createState() => _ImplicitFadeInState();
}

class _ImplicitFadeInState extends State<ImplicitFadeIn> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Implicit — AnimatedContainer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: _visible ? Colors.transparent : Colors.white,
          ),
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(seconds: 2),
            curve: Curves.easeIn,
            child: const FlutterLogo(size: 100),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => _visible = true),
              child: const Text('Fade In'),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () => setState(() => _visible = false),
              child: const Text('Fade Out'),
            ),
          ],
        ),
      ],
    );
  }
}