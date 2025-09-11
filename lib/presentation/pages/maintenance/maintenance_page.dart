import 'dart:ui';
import 'package:festiva/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MaintenancePage extends StatefulWidget {
  final VoidCallback onRetry;

  const MaintenancePage({
    super.key,
    required this.onRetry,
  });

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;
  late final Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..forward();

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _slideUp = Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Paleta
  static const _bg = Color(0xFF0B0F14); // negro azulado
  static const _accent = AppColors.colorP1;
  static const _accent2 = Color(0xFF7C4DFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: Stack(
        children: [
          // 1) Fondo animado: gradiente girando sutilmente
          const _RotatingGradient(),

          // 2) Blobs suaves (glow) con movimiento leve
          const _NeonBlob(top: -60, left: -40, size: 220, color: _accent),
          const _NeonBlob(bottom: -40, right: -30, size: 180, color: _accent2),

          // 3) Grilla tenue para sensación tech
          const _SoftGrid(),

          // 4) Contenido (glass card)
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: FadeTransition(
                  opacity: _fadeIn,
                  child: SlideTransition(
                    position: _slideUp,
                    child: _GlassCard(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _PulsingSvg(
                            assetPath: 'assets/icons/festiva.svg',
                            size: 60,
                          ),
                          const SizedBox(height: 16),
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [_accent2, _accent],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: const Text(
                              'We’ll be back soon',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'We’re tuning up the dance floor so you can find\n'
                            'the best clubs, events, and afterparties near you.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.82),
                              fontSize: 14.5,
                              height: 1.35,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Chips de estado
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 10,
                            runSpacing: 10,
                            children: const [
                              _StatusChip(text: 'Optimizing recommendations'),
                              _StatusChip(text: 'Upgrading map performance'),
                              _StatusChip(text: 'Polishing dark mode'),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _PrimaryButton(
                            label: 'Check status',
                            onTap: widget.onRetry,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget para usar donde tenías tu if:
/// if (!provider.isMenuActive) return const MaintenanceScreen();

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      padding: const EdgeInsets.all(1.2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(
          colors: [
            Colors.white.withValues(alpha: 0.08),
            Colors.white.withValues(alpha: 0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(21),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 22),
            color: Colors.white.withValues(alpha: 0.05),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryButton({
    required this.label,
    required this.onTap,
  });

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
  bool _hover = false;

  static const _accent = Color(0xFF7C3AED); // púrpura neon
  static const _accent2 = Color(0xFF00D1FF); // cian neon

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedScale(
        scale: _hover ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(14),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                colors: [_accent2, _accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: _accent.withValues(alpha: 0.35),
                  blurRadius: 18,
                  spreadRadius: 1,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.refresh_rounded,
                    color: Colors.white, size: 18),
                const SizedBox(width: 8),
                Text(
                  widget.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String text;
  const _StatusChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withValues(alpha: 0.10)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _PulseDot(),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.90),
              fontSize: 12.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PulseDot extends StatefulWidget {
  const _PulseDot();

  @override
  State<_PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: 0.85, end: 1.15)
          .animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut)),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: AppColors.colorP1,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

// Fondo: gradiente giratorio muy sutil (sin libs)
class _RotatingGradient extends StatefulWidget {
  const _RotatingGradient();

  @override
  State<_RotatingGradient> createState() => _RotatingGradientState();
}

class _RotatingGradientState extends State<_RotatingGradient>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 30))
        ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) => Transform.rotate(
        angle: _controller.value * 6.28318, // 2π
        child: child,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Color(0xFF0B0F14),
              Color(0xFF0F1320),
              Color(0xFF12172A),
              Color(0xFF0B0F14),
            ],
            stops: [0.0, 0.5, 0.85, 1.0],
            center: Alignment(0.2, -0.3),
          ),
        ),
      ),
    );
  }
}

// Blobs glow
class _NeonBlob extends StatelessWidget {
  final double size;
  final double? top, left, right, bottom;
  final Color color;
  const _NeonBlob({
    required this.size,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.40),
                blurRadius: size * 0.85,
                spreadRadius: size * 0.25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Grilla suave
class _SoftGrid extends StatelessWidget {
  const _SoftGrid();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GridPainter(),
      size: Size.infinite,
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.04)
      ..strokeWidth = 0.6;

    const gap = 36.0;
    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Icono con pulso suave
class _PulsingSvg extends StatefulWidget {
  final String assetPath;
  final double size;

  const _PulsingSvg({
    required this.assetPath,
    required this.size,
  });

  @override
  State<_PulsingSvg> createState() => _PulsingSvgState();
}

class _PulsingSvgState extends State<_PulsingSvg>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: _c, curve: Curves.easeInOutCubicEmphasized)
          .drive(Tween(begin: 0.96, end: 1.06)),
      child: SvgPicture.asset(
        widget.assetPath,
        width: widget.size,
        height: widget.size,
        //colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
