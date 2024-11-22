// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:fcs_services/themes/build_context_extensions.dart';
import 'package:flutter/material.dart';

WidgetStateProperty<TextStyle> textButtonTextStyle(BuildContext context) {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.selected)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.error)) {
      context.labelLarge?.copyWith(color: context.error);
    }

    if (states.contains(WidgetState.pressed)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.hovered)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.focused)) {
      context.labelLarge?.copyWith(color: context.primary);
    }
    throw Exception();
  });
}

WidgetStateProperty<TextStyle> filledButtonTextStyle(BuildContext context) {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.selected)) {
      context.labelLarge?.copyWith(color: context.onPrimary);
    }

    if (states.contains(WidgetState.error)) {
      context.labelLarge?.copyWith(color: context.onError);
    }

    if (states.contains(WidgetState.pressed)) {
      context.labelLarge?.copyWith(color: context.onPrimary);
    }

    if (states.contains(WidgetState.hovered)) {
      context.labelLarge?.copyWith(color: context.onPrimary);
    }

    if (states.contains(WidgetState.focused)) {
      context.labelLarge?.copyWith(color: context.onPrimary);
    }
    throw Exception();
  });
}

WidgetStateProperty<TextStyle> elevatedButtonTextStyle(BuildContext context) {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.selected)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.error)) {
      context.labelLarge?.copyWith(color: context.error);
    }

    if (states.contains(WidgetState.pressed)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.hovered)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.focused)) {
      context.labelLarge?.copyWith(color: context.primary);
    }
    throw Exception();
  });
}

WidgetStateProperty<TextStyle> outlinedButtonTextStyle(BuildContext context) {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.selected)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.error)) {
      context.labelLarge?.copyWith(color: context.error);
    }

    if (states.contains(WidgetState.pressed)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.hovered)) {
      context.labelLarge?.copyWith(color: context.primary);
    }

    if (states.contains(WidgetState.focused)) {
      context.labelLarge?.copyWith(color: context.primary);
    }
    throw Exception();
  });
}

WidgetStateProperty<TextStyle> segmentedButtonTextStyle(BuildContext context) {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.selected)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.error)) {
      context.labelLarge?.copyWith(color: context.error);
    }

    if (states.contains(WidgetState.pressed)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.hovered)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.focused)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }
    throw Exception();
  });
}

WidgetStateProperty<TextStyle> menuButtonTextStyle(BuildContext context) {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.selected)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.error)) {
      context.labelLarge?.copyWith(color: context.error);
    }

    if (states.contains(WidgetState.pressed)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.hovered)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.focused)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }
    throw Exception();
  });
}

WidgetStateProperty<TextStyle> searchBarTextStyle(BuildContext context) {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      context.labelLarge?.copyWith(color: context.surface);
    }

    if (states.contains(WidgetState.selected)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.error)) {
      context.labelLarge?.copyWith(color: context.error);
    }

    if (states.contains(WidgetState.pressed)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.hovered)) {
      context.labelLarge?.copyWith(color: context.onSurfaceVariant);
    }

    if (states.contains(WidgetState.focused)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }
    throw Exception();
  });
}

WidgetStateProperty<TextStyle> searchBarHintStyle(BuildContext context) {
  return WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      context.labelLarge?.copyWith(color: context.surface);
    }

    if (states.contains(WidgetState.selected)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.error)) {
      context.labelLarge?.copyWith(color: context.error);
    }

    if (states.contains(WidgetState.pressed)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.hovered)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }

    if (states.contains(WidgetState.focused)) {
      context.labelLarge?.copyWith(color: context.onSurface);
    }
    throw Exception();
  });
}
