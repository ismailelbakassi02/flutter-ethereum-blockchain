# Hello World Blockchain

Application Flutter intégrant un smart contract Ethereum pour afficher et modifier un nom stocké sur la blockchain.

## 📋 Description

Ce projet est une application décentralisée (DApp) qui combine Flutter et Ethereum. Elle permet aux utilisateurs d'interagir avec un smart contract déployé sur une blockchain locale (Ganache) pour lire et modifier une variable `yourName`.

## 🏗️ Structure du Projet

```
hello_world/
├── contracts/                  # Smart contracts Solidity
│   └── HelloWorld.sol         # Contrat principal avec fonctions getName et setName
├── migrations/                 # Scripts de déploiement Truffle
│   └── 2_deploy_contracts.js  # Déploiement du contrat HelloWorld
├── lib/                        # Code source Flutter
│   ├── main.dart              # Point d'entrée de l'application
│   ├── contract_linking.dart  # Logique de connexion au smart contract
│   └── helloUI.dart           # Interface utilisateur
├── build/                      # Fichiers de build
│   └── contracts/             # ABI et métadonnées des contrats compilés
├── test/                       # Tests du smart contract
│   └── helloWorld.js          # Tests Truffle
├── android/                    # Configuration Android
├── ios/                        # Configuration iOS
├── web/                        # Configuration Web
├── windows/                    # Configuration Windows
├── linux/                      # Configuration Linux
├── macos/                      # Configuration macOS
├── truffle-config.js          # Configuration Truffle
├── pubspec.yaml               # Dépendances Flutter
└── README.md                  # Documentation du projet
```

## 🔧 Technologies Utilisées

### Frontend
- **Flutter** : Framework UI cross-platform
- **Provider** : Gestion d'état
- **web3dart** (v2.3.5) : Interaction avec Ethereum
- **http** : Requêtes HTTP
- **web_socket_channel** : Communication WebSocket

### Blockchain
- **Solidity** (v0.8.21) : Langage de smart contract
- **Truffle** : Framework de développement Ethereum
- **Ganache** : Blockchain locale pour le développement

## 📦 Prérequis

Assurez-vous d'avoir installé les outils suivants :

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=2.17.0 <4.0.0)
- [Node.js](https://nodejs.org/) (v14 ou supérieur)
- [Truffle](https://trufflesuite.com/docs/truffle/getting-started/installation/) : `npm install -g truffle`
- [Ganache](https://trufflesuite.com/ganache/) : Blockchain locale

## 🚀 Installation et Démarrage

### 1. Cloner le projet

```bash
git clone https://github.com/MohamedAmineZinabi/flutter-ethereum-blockchain.git
cd hello_world
```

### 2. Installer les dépendances Flutter

```powershell
flutter pub get
```

### 3. Démarrer Ganache

Lancez Ganache sur le port **7545** :
- Via l'interface graphique : Créez un nouveau workspace
- Ou via CLI : `ganache-cli -p 7545`

> **Important** : Notez l'adresse du premier compte et sa clé privée affichées dans Ganache.

### 4. Configurer la clé privée

Modifiez le fichier `lib/contract_linking.dart` :

```dart
final String _privateKey = "VOTRE_CLE_PRIVEE_GANACHE";
```

Remplacez par la clé privée du premier compte Ganache.

### 5. Compiler et déployer le smart contract

```powershell
truffle compile
truffle migrate --reset
```

Le contrat sera déployé sur le réseau local (network_id: 5777).

### 6. Vérifier l'adresse du contrat

Après le déploiement, vérifiez que l'adresse dans `build/contracts/HelloWorld.json` correspond au réseau "5777".

### 7. Lancer l'application Flutter

```powershell
flutter run
```

Ou pour un appareil spécifique :
```powershell
flutter run -d windows    # Windows
flutter run -d chrome     # Web
flutter run -d <device-id> # Mobile
```

## 🎮 Utilisation

1. Au lancement, l'application affiche "Hello Med Amine" (valeur par défaut du contrat)
2. Entrez un nouveau nom dans le champ de texte
3. Cliquez sur "Set Name" pour écrire sur la blockchain
4. Le nom s'actualise automatiquement après la transaction

## 🔍 Détails Techniques

### Smart Contract (`HelloWorld.sol`)

```solidity
contract HelloWorld {
    string public yourName;
    
    constructor() public {
        yourName = "Med Amine";
    }
    
    function setName(string memory nm) public {
        yourName = nm;
    }
}
```

### Configuration Réseau

- **RPC URL** : `http://127.0.0.1:7545`
- **WebSocket URL** : `ws://127.0.0.1:7545/`
- **Network ID** : 5777 (Ganache par défaut)
- **EVM Version** : berlin (compatibilité avec Ganache)

## 🧪 Tests

Pour exécuter les tests du smart contract :

```powershell
truffle test
```

## ⚠️ Problèmes Courants

### Erreur "invalid opcode"
- Assurez-vous que l'`evmVersion` dans `truffle-config.js` est configuré sur `"berlin"`
- Vérifiez que la version Solidity correspond (0.8.21)

### Erreur de connexion
- Vérifiez que Ganache tourne sur le port 7545
- Vérifiez les URLs RPC et WebSocket dans `contract_linking.dart`

### Contrat non déployé
- Exécutez `truffle migrate --reset` pour redéployer
- Vérifiez que le network_id dans le fichier JSON correspond à 5777

## 📝 Auteur

**Mohamed Amine Zinabi**

## 📄 Licence

Ce projet est un exemple éducatif de DApp Flutter-Ethereum.
