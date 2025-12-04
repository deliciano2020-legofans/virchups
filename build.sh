#!/bin/bash
set -e

# 你自己的 Flutter 版本，改成你本地用的
FLUTTER_VERSION=3.27.1

echo "Downloading Flutter ${FLUTTER_VERSION}..."

curl -L https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz -o flutter.tar.xz

tar xf flutter.tar.xz

# 把刚解压出来的 flutter 加到 PATH
export PATH="$PWD/flutter/bin:$PATH"

flutter --version

# 拉依赖
flutter pub get

# 真正构建 web
flutter build web --release
