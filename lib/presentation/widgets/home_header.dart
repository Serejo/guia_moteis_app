import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Função para menu lateral
            },
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabButton('ir agora', true),
                _buildTabButton('ir outro dia', false),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextButton(
            onPressed: () {},
            child: CustomPaint(
              painter: DottedLinePainter(),
              child: Container(
                padding: EdgeInsets.only(bottom: 1.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'minha localização',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.expand_more,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                isSelected ? Icons.electric_bolt : Icons.event_available,
                color: isSelected ? Colors.red : Colors.white54,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    double dashWidth = 4.0;
    double dashSpace = 2.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
