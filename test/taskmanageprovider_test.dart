import 'package:flutter_test/flutter_test.dart';
import 'package:task_management_app_thiran_tech/controller/task_manage_provider.dart';

void main() {
  group('TaskManageProvider Tests', () {
    test('Initial selectedIndex is 0', () {
      final provider = TaskManageProvider();
      expect(provider.selectedIndex, 0);
    });

    test('onItemTapped updates selectedIndex', () {
      final provider = TaskManageProvider();
      provider.onItemTapped(2);
      expect(provider.selectedIndex, 2);
    });

    
  });
}
