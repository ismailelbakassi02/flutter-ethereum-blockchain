# 🚀 Flutter Ethereum DApp - Quick Start Guide

## Prerequisites Checklist

Before you begin, ensure you have the following installed:

- ✅ **Node.js v24.11.1** (Verified)
- ✅ **Truffle v5.11.5** (Verified)
- ⚠️ **Flutter SDK** (Not in PATH - needs configuration)
- ⏳ **Ganache** (Required - not yet started)

## Step-by-Step Setup

### Step 1: Start Ganache

You need a local Ethereum blockchain running. Choose one option:

#### Option A: Ganache GUI (Recommended for beginners)
1. Download from: https://trufflesuite.com/ganache/
2. Install and launch Ganache
3. Click "Quickstart" or create a new workspace
4. Verify it's running on **port 7545**
5. **IMPORTANT**: Copy the **Private Key** of the first account (Account 0)
   - Click the key icon next to the first account
   - Copy the entire private key (starts with `0x`)

#### Option B: Ganache CLI
```bash
npm install -g ganache
ganache-cli -p 7545
```
Then copy the private key shown for Account (0).

### Step 2: Update Private Key in Flutter App

1. Open `lib/contract_linking.dart`
2. Find line 11:
   ```dart
   final String _privateKey = "0x6cc0be3ace8811a7b5f671eaec74e8631ff56ca97e3901389e630b2d93432a08";
   ```
3. Replace with YOUR Ganache private key:
   ```dart
   final String _privateKey = "YOUR_GANACHE_PRIVATE_KEY_HERE";
   ```

### Step 3: Deploy Smart Contract

The contract has already been compiled. Now deploy it:

```bash
truffle migrate --reset
```

**Expected Output:**
```
Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.

Starting migrations...
======================
> Network name:    'development'
> Network id:      5777
> Block gas limit: 6721975 (0x6691b7)

1_initial_migration.js
======================
   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0x...
   > contract address:    0x...
   > block number:        1
   > account:             0x...
   > balance:             99.99...
   > gas used:            ...
   > gas price:           ...
   > value sent:          0 ETH
   > total cost:          ... ETH

2_deploy_contracts.js
=====================
   Deploying 'HelloWorld'
   ----------------------
   > transaction hash:    0x...
   > contract address:    0x... (IMPORTANT - Note this!)
   > block number:        3
   > account:             0x...
   > balance:             99.99...
   > gas used:            ...
   > gas price:           ...
   > value sent:          0 ETH
   > total cost:          ... ETH

Summary
=======
> Total deployments:   2
> Final cost:          ... ETH
```

✅ **Verification**: Check that `build/contracts/HelloWorld.json` contains a `networks` section with your network ID.

### Step 4: Install Flutter Dependencies

If Flutter is not in your PATH, you'll need to either:

**Option A**: Add Flutter to PATH
1. Find your Flutter installation directory
2. Add `flutter\bin` to your system PATH
3. Restart your terminal

**Option B**: Use full path to Flutter
```bash
# Replace with your actual Flutter path
C:\path\to\flutter\bin\flutter pub get
```

Once Flutter is accessible:
```bash
flutter pub get
```

**Expected Output:**
```
Running "flutter pub get" in flutter-ethereum-blockchain...
Resolving dependencies...
+ cupertino_icons 1.0.8
+ http 0.13.6
+ provider 6.1.2
+ web3dart 2.3.5
+ web_socket_channel 2.4.0
...
Got dependencies!
```

### Step 5: Run the Flutter App

Choose your target platform:

#### For Windows:
```bash
flutter run -d windows
```

#### For Web (Chrome):
```bash
flutter run -d chrome
```

#### For Android Emulator:
**IMPORTANT**: If using Android emulator, first update `lib/contract_linking.dart` line 9:
```dart
final String _rpcUrl = "http://10.0.2.2:7545";  // For Android emulator
```

Then run:
```bash
flutter run -d <device-id>
```

### Step 6: Test the Application

1. **Initial Load Test**
   - App should display: **"Hello Ismail El Bakassi"**
   - This value comes from the blockchain

2. **Set Name Test**
   - Enter a new name in the text field (e.g., "Test User")
   - Click the **"Set Name"** button
   - Wait for the transaction to complete
   - The display should update to: **"Hello Test User"**

3. **Verify in Ganache**
   - Open Ganache
   - Go to "Transactions" tab
   - You should see your transaction with gas usage

4. **Persistence Test**
   - Close the Flutter app
   - Restart it
   - It should display the last name you set (e.g., "Hello Test User")
   - This proves data is stored on the blockchain!

## Troubleshooting

### Issue: "Contract address not found" or "networks[5777] is undefined"

**Solution:**
1. Make sure Ganache is running
2. Run `truffle migrate --reset`
3. Check that `build/contracts/HelloWorld.json` has a `networks` object with your network ID

### Issue: "Transaction failed" or "insufficient funds"

**Solution:**
1. Verify the private key in `contract_linking.dart` matches your Ganache account
2. Check that the account has ETH in Ganache (should have 100 ETH by default)

### Issue: "WebSocket connection failed"

**Solution:**
1. Ensure Ganache is running on port 7545
2. Check the WebSocket URL in `contract_linking.dart` is `ws://127.0.0.1:7545/`

### Issue: Flutter command not found

**Solution:**
1. Add Flutter to your system PATH
2. Or use the full path to flutter.exe
3. Verify with: `flutter doctor`

### Issue: "invalid opcode" error

**Solution:**
Already fixed! The `truffle-config.js` has `evmVersion: "berlin"` which ensures compatibility with Ganache.

## Network Configuration Summary

| Setting | Value |
|---------|-------|
| RPC URL | `http://127.0.0.1:7545` |
| WebSocket URL | `ws://127.0.0.1:7545/` |
| Network ID | `5777` (or `*` for any) |
| Chain ID | `1337` (Ganache default) |
| Solidity Version | `0.8.21` |
| EVM Version | `berlin` |

## What's Already Configured ✅

- ✅ Smart contract updated with "Ismail El Bakassi"
- ✅ SPDX license added (MIT)
- ✅ Constructor syntax modernized
- ✅ Truffle config with correct EVM version
- ✅ Flutter dependencies specified
- ✅ Contract linking with proper error handling
- ✅ EIP-1559 transaction support
- ✅ Asset path for contract JSON
- ✅ Provider state management

## What You Need to Do 🔧

1. ⏳ Start Ganache on port 7545
2. ⏳ Copy private key from Ganache Account 0
3. ⏳ Update `lib/contract_linking.dart` line 11 with your private key
4. ⏳ Run `truffle migrate --reset`
5. ⏳ Run `flutter pub get` (if Flutter is in PATH)
6. ⏳ Run `flutter run -d windows` (or your preferred platform)

## Next Steps

Once everything is working:

1. **Experiment**: Try setting different names and watch the blockchain update
2. **Explore Ganache**: Check transactions, blocks, and gas usage
3. **Modify the Contract**: Add new functions to the smart contract
4. **Enhance the UI**: Improve the Flutter interface
5. **Deploy to Testnet**: When ready, deploy to a public testnet like Sepolia

## Need Help?

- **Truffle Documentation**: https://trufflesuite.com/docs/
- **Web3dart Documentation**: https://pub.dev/packages/web3dart
- **Flutter Documentation**: https://flutter.dev/docs
- **Ganache Documentation**: https://trufflesuite.com/docs/ganache/

---

**Project Repository**: https://github.com/ismailelbakassi02/flutter-ethereum-blockchain

**Happy Coding! 🎉**
