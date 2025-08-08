@echo off
echo 🔧 Fixing build issues...

echo 🧹 Cleaning Flutter...
flutter clean

echo 🗑️ Cleaning Gradle cache...
cd android
gradlew clean
cd ..

echo 📦 Getting dependencies...
flutter pub get

echo 🔨 Building release APK...
flutter build apk --release --target-platform android-arm64

if %ERRORLEVEL% EQU 0 (
    echo ✅ Build successful!
    echo 📱 APK location: build\app\outputs\flutter-apk\app-release.apk
) else (
    echo ❌ Build failed!
    echo 💡 Try running: flutter doctor
)

pause 