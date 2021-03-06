import 'package:scoped_model/scoped_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Url {
  final String url;
  Url({this.url});
}

class Launcher extends Model {
  void _launchInWeb(String url) async {
    final _url = Url(url: url);
    try {
      if (await canLaunch(_url.url)) {
        await launch(
          _url.url,
        );
        notifyListeners();
      } else {
        throw 'Could not launch ${_url.url}';
      }
    } catch (e) {
      print('$e');
    }
  }

  void loadUrl(String url) => _launchInWeb(url);
}
