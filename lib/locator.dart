import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/features/settings/theme/provider/theme_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (context) => ThemeProvider())
];
