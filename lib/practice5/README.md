### 包管理

---

```
# pubspec.yaml

// 应用或包名
name: flutter_in_action
// 应用描述
description: First Flutter Application.

// 应用的版本
version: 1.0.0+1

// 应用的依赖
dependencies:
    flutter:
        sdk: flutter

    cupertino_icons: ^0.1.2

// 应用的开发依赖
dev_dependencies:
    flutter_test:
        sdk: flutter

// flutter相关配置
flutter:
    uses-material-design: true
```

flutter 包查找网站

- https://pub.dev/
- https://pub.flutter-io.cn/ （国内访问）

找到相关包将包的配置添加到 dependencies 或 dev_dependencies 中

```
dependencies:
    flutter:
        sdk: flutter
        # 新添加的依赖
        english_words: ^4.0.0
```

执行 `flutter packages get`

使用包

```
import 'package:english_words/english_words.dart';
```
