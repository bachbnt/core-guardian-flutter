# Guardian

Guardian is a library for protecting me from scam.

## Installation

```yaml
dependencies:
  guardian:
    git:
      url: https://github.com/bachbnt/core_guardian_flutter.git
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
          showLogo: true, // default true
          doomsday: '2022-10-16', // type DateTime or String
          child: Home()
      ),
    );
  }
}
```
