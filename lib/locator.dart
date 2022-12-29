import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/features/homeScreen/provider/home_provider.dart';
import 'src/features/quran/surah/controller/controller.dart';
import 'src/features/settings/theme/provider/theme_provider.dart';

List<SingleChildWidget> appProviders = [
  ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ChangeNotifierProvider(create: ((context) => SurahProvider())),
  ChangeNotifierProvider(create: ((context) => HomeProvider())),
];
