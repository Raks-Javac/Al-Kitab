import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/shared/res/theme/theme_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (context) => ThemeProvider())
];
