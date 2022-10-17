# Guardian

Guardian is a library for protecting me from scam.

## Installation

```yaml
dependencies:
  guardian:
    git:
      url: https://github.com/bachbnt/core-guardian-flutter.git
```


## Usage

```dart
import 'package:guardian/guardian.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Guardian(
          appId: String,
          mode: GuardianMode,
          showLogo: bool,
          logoUrl: String,
          logoSize: double,
          message: String,
          messageColor: Color,
          expDate: String || DateTime,
          configUrl: String,
          maxCount: int,
          child: HomeScreen()),
    );
  }
}
```
