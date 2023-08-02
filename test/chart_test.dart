import 'package:flutter_test/flutter_test.dart';
import 'package:task_management_app_thiran_tech/model/fl_chart.dart';

void main() {
  group('CurvedChartPainter Tests', () {
    test('shouldRepaint returns true for different delegates', () {
      final painter1 = CurvedChartPainter(
        xValues: [],
        yValues: [],
        strokeWidth: 2,
      );
      final painter2 = CurvedChartPainter(
        xValues: [],
        yValues: [],
        strokeWidth: 2,
      );
      expect(painter1.shouldRepaint(painter2), true);
    });
  });
}
