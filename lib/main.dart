import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'PressStart2P',
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 26, color: Color(0xFF00FF66)),
          titleMedium: TextStyle(fontSize: 16, color: Color(0xFF00FF66)),
          bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF00FF66)),
          labelMedium: TextStyle(fontSize: 12, color: Color(0xFF00FF66)),
        ),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Star> stars = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }
void generateStars(Size size) {
  final random = Random();
  stars = List.generate(600, (_) {
    return Star(
      x: random.nextDouble() * size.width,
      y: random.nextDouble() * size.height,
      size: random.nextDouble() * 2 + 0.5,      
      opacity: random.nextDouble() * 0.8 + 0.2, 
      dx: (random.nextDouble() - 0.5) * 0.3,    
      dy: (random.nextDouble()) * 0.5 + 0.1,    
    );
  });
}

void moveStars(Size size) {
  for (var star in stars) {
    star.x += star.dx;
    star.y += star.dy;

    // wrap around horizontally
    if (star.x < 0) star.x = size.width;
    if (star.x > size.width) star.x = 0;

    // wrap vertically
    if (star.y > size.height) star.y = 0;
  }
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        if (stars.isEmpty) generateStars(size);

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            moveStars(size);

            return Scaffold(
              backgroundColor: Colors.black,
              body: Stack(
                children: [
                  CustomPaint(
                    size: size,
                    painter: StarfieldPainter(stars),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 56,
                                    backgroundImage:
                                        AssetImage('assets/image.png'),
                                  ),
                                  const SizedBox(height: 20),
                                  Text('Yuvraj Singh Rathore',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
                                  const SizedBox(height: 8),
                                  Text('Flutter Developer & UI Designer',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  const SizedBox(height: 16),
                                  Text(
                                    'I build modern, clean, and responsive mobile apps using Flutter. Focused on UI excellence and smooth user experience.',
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 40),
                                ],
                              ),
                            ),
                            const Text('Skills',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent)),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 24,
                              runSpacing: 24,
                              children: const [
                                SkillItem(icon: Icons.storage, label: 'DSA'),
                                SkillItem(
                                    icon: Icons.phone_android, label: 'Flutter'),
                                SkillItem(icon: Icons.android, label: 'Kotlin'),
                                SkillItem(
                                    icon: Icons.token, label: 'Blockchain'),
                                SkillItem(icon: Icons.public, label: 'Full Stack'),
                              ],
                            ),
                            const SizedBox(height: 40),
                            const Text('Projects',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent)),
                            const SizedBox(height: 16),
                            const ProjectCard(
                                title: 'Portfolio App',
                                description:
                                    'A modern portfolio built with Flutter focusing on UI and responsiveness.'),
                            const SizedBox(height: 16),
                            const ProjectCard(
                                title: 'Kotlin Note App',
                                description:
                                    'A clean note-taking app using Kotlin with local storage.'),
                            const SizedBox(height: 16),
                            const ProjectCard(
                                title: 'Blockchain Demo',
                                description:
                                    'A proof-of-work blockchain demonstration built in Dart.'),
                            const SizedBox(height: 16),
                            const ProjectCard(
                                title: 'DSA Practice',
                                description:
                                    'A collection of data structure & algorithm implementations.'),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
class Star {
  double x;
  double y;
  double size;
  double opacity;
  double dx;
  double dy;

  Star({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.dx,
    required this.dy,
  });
}
class StarfieldPainter extends CustomPainter {
  final List<Star> stars;

  StarfieldPainter(this.stars);

  @override
  void paint(Canvas canvas, Size size) {
    for (final star in stars) {
      final paint = Paint()
        ..color = Colors.white.withOpacity(star.opacity);

      canvas.drawCircle(
        Offset(star.x, star.y),
        star.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class SkillItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const SkillItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.greenAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 28, color: Colors.greenAccent),
        ),
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.labelMedium),
      ],
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  const ProjectCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black.withOpacity(0.3),
      elevation: 8,
      shadowColor: Colors.greenAccent.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description,
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}