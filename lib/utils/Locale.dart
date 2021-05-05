import 'package:flutter/material.dart';

class CustomLocale {
  Locale _nepaliLocale = Locale('ne', 'NP');
  Locale _englishLocale = Locale('en', 'US');
  Locale get englishLocale {
    return this._englishLocale;
  }

  Locale get nepaliLocale {
    return this._nepaliLocale;
  }
}
