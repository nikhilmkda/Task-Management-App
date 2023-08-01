import 'package:flutter/material.dart';

// CustomPainter class to draw a curved chart
class CurvedChartPainter extends CustomPainter {
  // Properties to configure the chart
  final List<Map<String, double>> xValues;
  final List<Map<String, double>> yValues;
  final Color? color;
  final double strokeWidth;
  final List<Color> gradientColors;
  final List<double> gradientStops;
  final TextStyle labelTextStyle;

  // Constructor
  CurvedChartPainter({
    required this.xValues,
    required this.yValues,
    required this.strokeWidth,
    this.color,
    this.gradientColors = const [
      Color(0x00F63E02),
      Color(0xFFFFFFFF),
    ],
    this.gradientStops = const [0.0, 1.0],
    this.labelTextStyle = const TextStyle(color: Colors.grey, fontSize: 12),
  });

  // The paint method is called when the custom painter needs to paint
  @override
  void paint(Canvas canvas, Size size) {
    // Set up the paint for the chart line
    var paint = Paint();
    paint.color = color ?? const Color(0xFFF63E02);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    // Set up the paint for the chart fill
    var fillPaint = Paint();
    fillPaint.style = PaintingStyle.fill;

    // Set up the paint for the axes
    var axisPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw X axis
    canvas.drawLine(
        Offset(0, size.height), Offset(size.width, size.height), axisPaint);

    // Draw Y axis
    canvas.drawLine(const Offset(0, 0), Offset(0, size.height), axisPaint);

    // Create paths for the chart line and fill
    var path = Path();
    var fillPath = Path();

    // Check if there are enough values to draw the chart
    if (xValues.length > 1 && yValues.isNotEmpty) {
      // Calculate some initial values
      final maxValue = yValues.last.values.last;
      final firstValueHeight =
          size.height * (xValues.first.values.first / maxValue);

      // Initialize the paths with the first point
      path.moveTo(0.0, size.height - firstValueHeight);
      fillPath.moveTo(0.0, size.height);
      fillPath.lineTo(0.0, size.height - firstValueHeight);

      // Calculate the distance between each x value
      final itemXDistance = size.width / (xValues.length - 1);

      // Loop through the x values and draw the chart line and fill
      for (var i = 1; i < xValues.length; i++) {
        final x = itemXDistance * i;
        final valueHeight = size.height -
            strokeWidth -
            ((size.height - strokeWidth) *
                (xValues[i].values.elementAt(0) / maxValue));
        final previousValueHeight = size.height -
            strokeWidth -
            ((size.height - strokeWidth) *
                (xValues[i - 1].values.elementAt(0) / maxValue));

        // Draw a quadratic bezier curve between each point
        path.quadraticBezierTo(
          x - (itemXDistance / 2) - (itemXDistance / 8),
          previousValueHeight,
          x - (itemXDistance / 2),
          valueHeight + ((previousValueHeight - valueHeight) / 2),
        );
        path.quadraticBezierTo(
          x - (itemXDistance / 2) + (itemXDistance / 8),
          valueHeight,
          x,
          valueHeight,
        );

        // Draw the fill path using the same quadratic bezier curves
        fillPath.quadraticBezierTo(
          x - (itemXDistance / 2) - (itemXDistance / 8),
          previousValueHeight,
          x - (itemXDistance / 2),
          valueHeight + ((previousValueHeight - valueHeight) / 2),
        );
        fillPath.quadraticBezierTo(
          x - (itemXDistance / 2) + (itemXDistance / 8),
          valueHeight,
          x,
          valueHeight,
        );
      }

      // Close the fill path
      fillPath.lineTo(size.width, size.height);
      fillPath.close();
    }

    // Create a gradient for the fill
    LinearGradient gradient = LinearGradient(
      colors: gradientColors,
      stops: gradientStops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    fillPaint.shader = gradient.createShader(rect);

    // Draw the fill path with the gradient
    canvas.drawPath(fillPath, fillPaint);

    // Draw the chart line
    canvas.drawPath(path, paint);

    // Draw X axis labels
    for (int i = 0; i < 0; i++) {
      double x = size.width * i / (xValues.length - 1);
      var textPainter = TextPainter(
        text:
            TextSpan(text: xValues[i].keys.elementAt(0), style: labelTextStyle),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas, Offset(x - textPainter.width / 2, size.height + 2));
    }

    // Draw Y axis labels
    for (int i = 0; i < 0; i++) {
      double y = size.height * i / (yValues.length - 1);
      double labelValue = yValues.last.values.elementAt(0) *
          (yValues.length - i - 1) /
          (yValues.length - 1);
      var textPainter = TextPainter(
        text: TextSpan(
            text: labelValue.toStringAsFixed(0), style: labelTextStyle),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
          canvas, Offset(-textPainter.width - 2, y - textPainter.height / 2));
    }
  }

  // Determine whether the chart should repaint
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}

// Create a stateless widget for the custom curved chart
class MyCurvedChart extends StatelessWidget {
  // Constructor
  const MyCurvedChart({super.key});

  // Build method to generate the widget tree
  @override
  Widget build(BuildContext context) {
    // Define the X axis values for the chart
    // String will be text label and double will be value in the Map<String, double>
    final List<Map<String, double>> xValues = [
      {"Sun": 20},
      {"Mon": 5},
      {"Tue": 40.0},
      {"Wed": 20.0},
      {"Thu": 80},
      {"Fry": 60},
      {"Sat": 100.0},
    ];

    // Define the Y axis values for the chart
    // String will be text label and double will be value in the Map<String, double>
    final List<Map<String, double>> yValues = [
      {"0": 50},
      {"20": 0},
      {"40": 0.0},
      {"60": 0.0},
      {"80": 0.0},
      {"100": 100.0},
    ];

    // Define the stroke width for the chart line
    const stroke = 2.0;

    // Return a SizedBox to limit the size of the chart
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.6,
      // Use CustomPaint to draw the curved chart
      child: CustomPaint(
        painter: CurvedChartPainter(
          color: Colors.green, // Set the color of the chart line
          yValues: yValues, // Pass the Y axis values
          strokeWidth: stroke, // Set the stroke width
          xValues: xValues, // Pass the X axis values
          gradientColors: [
            // Define the gradient colors for the chart fill
            Colors.green.withAlpha(100),
            const Color(0xFFFFFFFF),
          ],
        ),
      ),
    );
  }
}
