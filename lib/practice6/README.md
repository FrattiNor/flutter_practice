### 资源管理

---

定义资源

```
flutter:
  assets:
    - assets/my_icon.png
    - assets/background.png
```

加载文本

```
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
}
```

声明分辨率相关的图片 assets

AssetImage (opens new window)可以将 asset 的请求逻辑映射到最接近当前设备像素比例（dpi）的 asset。为了使这种映射起作用，必须根据特定的目录结构来保存 asset

```
…/my_icon.png
…/2.0x/my_icon.png
…/3.0x/my_icon.png
```

在设备像素比率为 1.8 的设备上，.../2.0x/my_icon.png 将被选择。对于 2.7 的设备像素比率，.../3.0x/my_icon.png 将被选择。

加载图片

```
Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('graphics/background.png'),
            ),
        ),
    );
}

Widget build(BuildContext context) {
    return Image.asset('graphics/background.png');
}
```

加载包里的图片

```
AssetImage('icons/heart.png', package: 'my_icons')

Image.asset('icons/heart.png', package: 'my_icons')
```
