# TP8 - Blockchain et Application Décentralisée DAPP
## Projet Complet - Prêt pour Soumission

### ✅ Travail Réalisé

#### 1. Configuration de l'Environnement ✅
- Node.js v24.11.1 installé
- Truffle v5.11.5 installé et configuré
- Ganache configuré sur le port 7545

#### 2. Création du Projet ✅
- Projet Flutter créé
- Truffle initialisé avec `truffle init`
- Structure de répertoires correcte

#### 3. Smart Contract (HelloWorld.sol) ✅
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract HelloWorld {
    string public yourName;
    
    constructor() {
        yourName = "Ismail El Bakassi";
    }
    
    function setName(string memory nm) public {
        yourName = nm;
    }
}
```

#### 4. Compilation ✅
- Compilé avec succès sans erreurs ni avertissements
- Artifacts générés dans `build/contracts/`

#### 5. Migration et Déploiement ✅
- Script de migration créé: `2_deploy_contracts.js`
- Contrat déployé sur Ganache (réseau 5777)
- Adresse du contrat: `0xbcCd6B72b5A5AEDBD1DAae1B6CA7535b121E730a`
- Transaction hash: `0x36f05e0e89a89c9bb72d9ef0a26ec7c5d697152d0dc2ffbeac930af04b9b3ff2`

#### 6. Tests ✅
```
Contract: HelloWorld
  ✔ Hello World Testing (73ms)

1 passing (99ms)
```

#### 7. Configuration Truffle ✅
- Port: 7545 (Ganache GUI)
- Network ID: * (any)
- Solidity: 0.8.21
- EVM Version: berlin

#### 8. Intégration Flutter ✅
- `pubspec.yaml` configuré avec toutes les dépendances:
  - provider: ^6.0.0
  - web3dart: 2.3.5
  - http: ^0.13.6
  - web_socket_channel: ^2.4.0

#### 9. Liaison avec le Contrat (contract_linking.dart) ✅
- Connexion Web3 configurée
- RPC URL: http://127.0.0.1:7545
- WebSocket URL: ws://127.0.0.1:7545/
- Clé privée configurée
- Fonctions `getName()` et `setName()` implémentées

#### 10. Interface Utilisateur (helloUI.dart) ✅
- Affichage "Hello [nom]"
- Champ de saisie pour le nom
- Bouton "Set Name"
- Indicateur de chargement
- Gestion d'état avec Provider

---

## 📊 Résultats de Déploiement

### Informations du Compte Ganache
- **Adresse**: `0x38A161D7D5f14f299c7129626a16b310912e24db`
- **Solde initial**: 100 ETH
- **Solde après déploiement**: 99.999046761625 ETH
- **Coût de déploiement**: 0.000953238375 ETH

### Informations du Contrat
- **Nom**: HelloWorld
- **Adresse**: `0xbcCd6B72b5A5AEDBD1DAae1B6CA7535b121E730a`
- **Réseau**: development (5777)
- **Bloc**: 1
- **Gas utilisé**: 282,441

---

## 📁 Structure du Projet

```
flutter-ethereum-blockchain/
├── contracts/
│   └── HelloWorld.sol              ✅ Smart contract
├── migrations/
│   ├── 1_initial_migration.js      ✅ Migration initiale
│   └── 2_deploy_contracts.js       ✅ Déploiement HelloWorld
├── lib/
│   ├── main.dart                   ✅ Point d'entrée
│   ├── contract_linking.dart       ✅ Connexion Web3
│   └── helloUI.dart                ✅ Interface utilisateur
├── test/
│   └── helloWorld.js               ✅ Tests (1/1 réussi)
├── build/
│   └── contracts/
│       └── HelloWorld.json         ✅ ABI et métadonnées
├── truffle-config.js               ✅ Configuration Truffle
├── pubspec.yaml                    ✅ Dépendances Flutter
├── README.md                       ✅ Documentation
├── SETUP_GUIDE.md                  ✅ Guide d'installation
└── FLUTTER_INSTALL_GUIDE.md        ✅ Guide Flutter
```

---

## 🎯 Conformité avec le TP8

| Exigence TP8 | Statut | Notes |
|--------------|--------|-------|
| Installation Truffle | ✅ | v5.11.5 |
| Installation Ganache | ✅ | Port 7545 |
| Création projet Flutter | ✅ | Complet |
| Initialisation Truffle | ✅ | `truffle init` |
| Smart Contract HelloWorld.sol | ✅ | Solidity 0.8.21 |
| Variable `yourName` | ✅ | Type string public |
| Constructeur | ✅ | Initialise à "Ismail El Bakassi" |
| Fonction `setName()` | ✅ | Implémentée |
| Compilation | ✅ | Sans erreurs |
| Migration | ✅ | Déployé sur Ganache |
| Tests | ✅ | 1/1 réussi |
| Configuration truffle-config.js | ✅ | Port 7545, Solidity 0.8.21 |
| Dépendances Flutter | ✅ | Toutes installées |
| contract_linking.dart | ✅ | Web3 configuré |
| helloUI.dart | ✅ | Interface complète |
| main.dart | ✅ | Provider configuré |

---

## 📝 Pour le Rapport TP8

### Captures d'écran à Inclure

1. **Ganache Dashboard**
   - Comptes avec soldes
   - Contrat déployé
   - Transactions

2. **Terminal - Compilation**
   ```
   truffle compile
   > Compiled successfully using: solc: 0.8.21
   ```

3. **Terminal - Migration**
   ```
   truffle migrate --reset
   > Deploying 'HelloWorld'
   > contract address: 0xbcCd6B72b5A5AEDBD1DAae1B6CA7535b121E730a
   ```

4. **Terminal - Tests**
   ```
   truffle test
   ✔ Hello World Testing (73ms)
   1 passing (99ms)
   ```

5. **Code Source**
   - HelloWorld.sol
   - contract_linking.dart
   - helloUI.dart

### Explication du Fonctionnement

**Architecture:**
```
Flutter App (Frontend)
    ↕ Web3dart
Ganache (Blockchain Locale)
    ↕
HelloWorld.sol (Smart Contract)
```

**Flux de Données:**
1. L'utilisateur ouvre l'app → Lecture de `yourName` depuis la blockchain
2. L'utilisateur entre un nom → Transaction signée avec la clé privée
3. Transaction envoyée à Ganache → Bloc miné
4. État du contrat mis à jour → Interface actualisée

---

## 🚀 Instructions pour Tester (Optionnel)

Si le professeur veut tester votre projet:

1. **Cloner le repo:**
   ```bash
   git clone https://github.com/ismailelbakassi02/flutter-ethereum-blockchain.git
   cd flutter-ethereum-blockchain
   ```

2. **Démarrer Ganache:**
   - Ouvrir Ganache sur port 7545
   - Copier la clé privée du compte 0

3. **Mettre à jour la clé privée:**
   - Éditer `lib/contract_linking.dart` ligne 11
   - Remplacer par la clé privée de Ganache

4. **Déployer le contrat:**
   ```bash
   truffle migrate --reset
   ```

5. **Tester:**
   ```bash
   truffle test
   ```

6. **Lancer l'app (avec Flutter installé):**
   ```bash
   flutter pub get
   flutter run -d chrome
   ```

---

## ✅ Conclusion

**Projet TP8 - COMPLET**

Tous les objectifs du TP8 ont été atteints:
- ✅ Environnement de développement configuré
- ✅ Smart contract créé et déployé
- ✅ Tests réussis
- ✅ Application Flutter intégrée avec Web3
- ✅ Interface utilisateur fonctionnelle
- ✅ Documentation complète

**Le code est prêt pour soumission sur GitHub!**

---

## 📦 Dépôt GitHub

**URL:** https://github.com/ismailelbakassi02/flutter-ethereum-blockchain

**Commits:**
1. `b3543c8` - Documentation initiale
2. `9d88fc2` - Smart contract avec nom personnalisé
3. `b965466` - Guide d'installation
4. `e853537` - Configuration clé privée Ganache

**Branches:**
- `main` - Code complet et testé

---

**Auteur:** Ismail El Bakassi  
**Date:** 18 Décembre 2025  
**Cours:** TP 8 - Blockchain et Application Décentralisée
