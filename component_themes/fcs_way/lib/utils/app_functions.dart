// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart' as plat;

/// isAppleWeb is needed as we do some extra
/// Adaptive Theme workarounds beyond what [Flex Color Scheme]
/// has implemented. [Unuversal IO] is being used to
/// be cross platform and support web also.
///
/// Bool function so that we can
/// have like:
/// ```
///   isAppleWeb() ?  parmOne : parmTwo
/// ```
///
/// @author Fredrick Allan Grott
bool isAppleWeb() {
  // check two use cases:
  //   -if apple device and in web browser
  //   -if not web but apple device
  if (plat.Platform.isIOS || plat.Platform.isMacOS && kIsWeb) {
    return true;
  } else if (plat.Platform.isIOS || plat.Platform.isMacOS) {
    return true;
  }

  return false;
}
