import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtensions on BuildContext {
  AppLocalizations get locales => AppLocalizations.of(this);
}
