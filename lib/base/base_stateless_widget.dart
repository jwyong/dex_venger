import 'package:flutter/material.dart';

import '../generated/l10n.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  BaseStatelessWidget({super.key});

  late final s = S();
}