# 🚀 Installing Flutter via VS Code - Step-by-Step Guide

## ✅ Prerequisites Check

- ✅ **VS Code Installed:** Version 1.102.0
- ✅ **Git Installed:** (Already used for this project)
- ✅ **Project Ready:** Flutter DApp project already created

---

## 📋 Installation Steps

### Step 1: Open Project in VS Code

Open your project in VS Code:

```bash
code .
```

Or manually:
1. Open VS Code
2. Go to **File > Open Folder**
3. Navigate to: `C:\Users\pc\Desktop\flutter-ethereum-blockchain`
4. Click **Select Folder**

---

### Step 2: Install Flutter Extension

**Option A - From VS Code:**
1. Click the **Extensions** icon in the left sidebar (or press `Ctrl+Shift+X`)
2. Search for **"Flutter"**
3. Click **Install** on the "Flutter" extension by Dart Code
4. This will also install the Dart extension automatically

**Option B - From Command Palette:**
1. Press `Ctrl+Shift+P` to open Command Palette
2. Type: `Extensions: Install Extensions`
3. Search for **"Flutter"**
4. Click **Install**

---

### Step 3: Download Flutter SDK via VS Code

1. **Open Command Palette:**
   - Press `Ctrl+Shift+P`

2. **Type:** `Flutter: New Project`

3. **Select:** `Download SDK`
   - VS Code will prompt you to select where to install Flutter

4. **Choose Installation Location:**
   - Recommended: `C:\flutter`
   - Click **Select Folder** or **Clone Flutter**

5. **Wait for Download:**
   - You'll see: "Downloading the Flutter SDK. This may take a few minutes."
   - This typically takes 5-10 minutes depending on your internet speed

6. **Add to PATH:**
   - When prompted, click **Add SDK to PATH**
   - You should see: "The Flutter SDK was added to your PATH"

7. **Google Analytics (Optional):**
   - Click **OK** if you agree to share analytics

---

### Step 4: Restart VS Code

1. Close all VS Code windows
2. Close all terminal windows
3. Reopen VS Code
4. Open your project folder again

---

### Step 5: Verify Installation

Open a new terminal in VS Code (`Ctrl+` ` or Terminal > New Terminal) and run:

```bash
flutter doctor -v
```

**Expected Output:**
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x, on Microsoft Windows...)
[✓] Windows Version (Installed version of Windows is version 10 or higher)
[✓] Chrome - develop for the web
[!] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK.
[✓] VS Code (version 1.102.0)
[✓] Connected device (2 available)
[✓] Network resources
```

Don't worry about Android toolchain - we only need Chrome for web development!

---

### Step 6: Install Flutter Dependencies

In the VS Code terminal, run:

```bash
flutter pub get
```

This will install all the packages specified in `pubspec.yaml`:
- provider
- web3dart
- http
- web_socket_channel

---

### Step 7: Enable Web Support (if needed)

```bash
flutter config --enable-web
```

---

### Step 8: Run the DApp in Chrome

```bash
flutter run -d chrome
```

Or use VS Code's built-in runner:
1. Press `F5` or go to **Run > Start Debugging**
2. Select **Chrome** as the device
3. The app will launch in Chrome automatically!

---

## 🎯 Quick Alternative Method

If the above seems complex, here's a faster way:

1. **Open VS Code**
2. **Press:** `Ctrl+Shift+P`
3. **Type:** `Flutter: New Project`
4. **Follow the prompts** to download Flutter SDK
5. **After installation, close VS Code**
6. **Reopen VS Code** in your project folder
7. **Run:** `flutter pub get`
8. **Run:** `flutter run -d chrome`

---

## 🔧 Troubleshooting

### Issue: "Flutter SDK not found"
**Solution:**
1. Press `Ctrl+Shift+P`
2. Type: `Flutter: Change SDK`
3. Navigate to where you installed Flutter (e.g., `C:\flutter`)

### Issue: "flutter command not found"
**Solution:**
1. Restart VS Code completely
2. Restart your computer (to refresh PATH)
3. Try again

### Issue: "No devices found"
**Solution:**
```bash
flutter config --enable-web
flutter devices
```
You should see Chrome listed.

---

## 📱 Expected Result

Once you run `flutter run -d chrome`, you should see:

1. **Terminal Output:**
   ```
   Launching lib\main.dart on Chrome in debug mode...
   Building application for the web...
   ```

2. **Chrome Browser Opens** with your DApp

3. **App Display:**
   - Shows: **"Hello Ismail El Bakassi"**
   - Text input field
   - "Set Name" button

4. **Functionality:**
   - Enter a name → Click "Set Name"
   - Name updates on blockchain
   - Check Ganache for transaction

---

## 🎉 Success Checklist

After installation, verify:

- [ ] `flutter --version` works in terminal
- [ ] `flutter doctor` shows Flutter installed
- [ ] VS Code recognizes Flutter SDK
- [ ] `flutter pub get` completes successfully
- [ ] `flutter run -d chrome` launches the app
- [ ] App displays "Hello Ismail El Bakassi"
- [ ] Can interact with smart contract

---

## 📚 Next Steps After Installation

1. **Test the DApp:**
   - Enter your name
   - Click "Set Name"
   - Verify transaction in Ganache

2. **Take Screenshots for TP8 Report:**
   - VS Code with Flutter extension
   - `flutter doctor` output
   - App running in Chrome
   - Ganache showing transactions

3. **Complete Your Lab Report:**
   - Document installation process
   - Show code screenshots
   - Demonstrate functionality

---

## 💡 Pro Tips

1. **Hot Reload:** Press `r` in the terminal while app is running to reload changes
2. **Hot Restart:** Press `R` for a full restart
3. **Debug Mode:** Use VS Code's debugger (F5) for breakpoints
4. **DevTools:** Flutter DevTools will open automatically for debugging

---

## 🚀 Ready to Go!

Once Flutter is installed, simply run:

```bash
cd C:\Users\pc\Desktop\flutter-ethereum-blockchain
flutter pub get
flutter run -d chrome
```

Your DApp will launch and connect to your Ganache blockchain! 🎉

---

**Need Help?** If you encounter any issues during installation, let me know the error message and I'll help you troubleshoot!
