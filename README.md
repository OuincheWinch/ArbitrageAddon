# ArbitrageAddon
An addon to provide datas before doing The Great Migration between WoW Classic Anninversary and WoW Classic Era

Stronlgy Vibe coded with Gemini, Claude and Grok + me to add some mess

Support me or the project :

<img width="632" height="632" alt="image" src="https://github.com/user-attachments/assets/6005c366-3829-4e2c-9adb-8d16f836c165" />


This addon need Auctioneer to works ! Scan function are Auctioneer ones , so Auctionner is mandatory ! 

/*************************************************  ENGLISH  *************************************************\


Arbitrage: The Great Migration (WoW Classic Addon)
Version: 1.0 License: MIT

📈 Arbitrage: The Great Migration - User Guide
Arbitrage helps you identify profitable item transfers between WoW Classic Anniversary and WoW Classic Era servers. By scanning the Auction House on both servers, it calculates potential profits, liquidity, and helps you organize your shopping list.

🚀 Getting Started
Step 1: Installation
Download the addon from CurseForge or GitHub.

Extract the folder into your WoW Addons directory:

_classic_era_\Interface\AddOns\ArbitrageAddon

Step 2: First Launch
Log into the game on either the Anniversary or Era server.

Open the Auction House.

Type /arbi in the chat to open the main window.

Note: You can verify the interface version in the top right corner (e.g., v1.0.4).

https://youtu.be/wcEUaaa0idU


📊 How to Scan Data
To compare prices, you need data from BOTH servers. The order doesn't matter, but fresh data is better.

1. Scan the "Era" Server (Destination)
Log on to your Era character.

Open the Auction House and type /arbi.

Click the button: [Set Target: ERA].

The addon status will change to: Target: ERA (Waiting...).

Interact with the Auctioneer and click the "Scan" button ⏩ in the default WoW UI to load the first page of items.

The addon will automatically detect the list update and start scanning.

Status: SCANNING: 25% (500/2000)...

Do not close the AH window until the status says: Ready!.

2. Scan the "Anniversary" Server (Source)
Log on to your Anniversary character.

Open the Auction House and type /arbi.

Click the button: [Set Target: ANNIV].

Repeat the scan process (Search -> Wait for 100%).

Once Ready! appears, click [Refresh List].

⚠️ Important: If more than 30 minutes have passed between the two scans, a warning (Desynced >30m) will appear. Prices may have changed!

💰 Analyzing the Data
Once you have data from both sides, the list will populate automatically.

Understanding the Columns
Fav: Checkbox to mark an item as a Favorite (kept even after a reset).

Item Name: The name of the item (colored by rarity).

Liq.(ERA): Liquidity on the destination server.

Green: High supply (Easy to sell/buy).

Red/Orange: Low supply (Risky, might take time to sell).

Era Price: The lowest buyout price on the destination server.

Anniv Price: The lowest buyout price on the source server.

Profit: The raw gold difference per item.

Profit %: The return on investment percentage.

Filtering & Sorting
Search: Filter items by name (e.g., "Lotus").

Min %: Show only items with at least X% profit (Default: 400%).

Min Gold: Show only items with a raw profit of X Gold.

Hide Missing: Hides items that exist on Anniversary but have 0 quantity on Era.

Only Favs: Displays only your favorited items.

🛠 Advanced Features
Favorites System
Add: Check the box in the "Fav" column.

View: Check [Only Favs] to focus solely on your watchlist.

Note: Favorites persist even if you reset scan data.

Blacklist (Ignore List)
Don't want to see "Linen Cloth" anymore?

Hold Alt + Right-Click on any item in the list.

The item will vanish instantly.

To Manage Ignored Items:

Click the [Ignored Items] button.

The list will turn red (Blacklist Mode).

Right-Click an item here to restore it to the main list.

Click [Back to List] to return to normal view.

History Tooltip
Hover over any item in the list (or anywhere in the game!) to see the Arbitrage tooltip. It shows:

Current Era & Anniv Prices.

History: Compares the current price with the previous scan to spot trends (e.g., "Price increased by 5g").

Resetting Data
[Reset Data]: Clears all scan data (Era & Anniv) to start fresh. Keeps Favorites & Blacklist.

[Remove Duplicates]: Cleans up the database if weird duplicates appear.

📧 Support & Feedback
Found a bug? Have a suggestion?

Contact: ouinche@gmail.com

GitHub Issues: [Link to your Repo]

Happy Trading!

/*************************************************  FRANÇAIS  *************************************************\

Arbitrage: La Grande Migration (Addon WoW Classic)
Version: 1.0 Licence: MIT

Necessite que Auctioneer soit installé

Arbitrage est un outil d'Hôtel des Ventes (HV) conçu pour aider les joueurs à identifier les transferts d'or potentiellement rentables entre les serveurs Anniversary et Era à la suite de la Grande Migration.

⚠️ Avertissement Critique : Outil de Données Uniquement
Cet add-on est purement informationnel. Il fournit strictement des données brutes sur les prix et calcule la marge bénéficiaire théorique maximale en se basant sur le prix d'achat immédiat le plus bas enregistré dans votre base de données pour chaque HV.

LA DÉCISION D'ACHETER, DE VENDRE OU DE TRANSFÉRER VOUS APPARTIENT ENTIÈREMENT ET SOUS VOTRE RESPONSABILITÉ.

Le profit suggéré est un scénario idéal et n'inclut pas les frais de l'HV (dépôts ou la taxe de vente de 5 %).

Les données ne sont valables qu'à partir de votre dernier scan. Les prix changent constamment.

Un profit théorique élevé ne garantit pas une forte demande (liquidité) sur le serveur Era.

🎯 La Grande Migration : Anniv → Era
La fonction principale de cet add-on est d'identifier les objets qui sont nettement sous-évalués sur le serveur Anniversary (où vous achetez) et surévalués sur le serveur Era (où vous vendez).

Chemin de Migration : Anniv (Achat) → Era (Vente)

Le calcul du profit est toujours basé sur : Profit = (Prix Era) - (Prix Anniversary).

Installation
Téléchargez l'archive de la dernière version (.zip).

Extrayez le contenu de l'archive.

Placez le dossier ArbitrageAddon directement dans votre répertoire World of Warcraft\_classic_\Interface\AddOns.

Relancez World of Warcraft Classic ou tapez /reload.

Manuel Utilisateur (Fonctionnement)
1. Le Scan (Collecte de Données)
Arbitrage dépend des données que vous collectez manuellement en scannant l'Hôtel des Ventes avec vos deux personnages cibles (un sur Era, un sur Anniv).

Choisissez votre serveur cible : Connectez-vous à votre personnage Anniversary, ouvrez le cadre Arbitrage en tapant /arbi, et cliquez sur Set Target: ANNIV.

Scannez l'HV : Rendez-vous à l'Hôtel des Ventes et effectuez une recherche complète. Attendez que toutes les pages soient chargées. L'addon traitera automatiquement les données en arrière-plan.

Répétez pour le serveur Era : Connectez-vous à votre personnage Era, ouvrez le cadre, cliquez sur Set Target: ERA, et répétez le scan complet de l'HV.

2. Fonctionnalités et Contrôles
Filtres : Utilisez les champs pour filtrer la liste par Profit Min %, Or Min, et Qualité Min. Les cases vous permettent de Cacher les manquants sur Era et d'afficher Seulement les Favoris.

Alt + Clic Droit sur le nom de l'objet : Liste noire l'objet, le retirant de la liste principale.

Bouton Objets Ignorés : Bascule la vue pour afficher UNIQUEMENT les objets dans la liste noire. Clic Droit sur un objet dans ce mode pour le réintégrer.

