import 'package:flutter/cupertino.dart';

import 'screens/cover/cover_screen.dart';

final Map<String, Widget Function(BuildContext)> navigationRoutes = {
  '/': (context) => CoverScreen(),
};