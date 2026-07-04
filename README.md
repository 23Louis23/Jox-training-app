# Jox Training App

App de suivi d'entraînement (séances, index de Hooper, charges, historique). Les données sont stockées dans une base Supabase partagée : Jox remplit sur son téléphone, tu consultes depuis ton ordinateur, tout se synchronise via le même lien.

## 1. Créer la base de données (Supabase — gratuit)

1. Va sur [supabase.com](https://supabase.com) et crée un compte, puis un nouveau projet (choisis un mot de passe de base de données, garde-le de côté).
2. Une fois le projet créé, ouvre **SQL Editor** (menu de gauche) > **New query**.
3. Colle le contenu du fichier [`schema.sql`](schema.sql) de ce dossier et clique **Run**. Ça crée la table `sessions` qui stockera toutes les séances.
4. Va dans **Project Settings > API**. Récupère :
   - **Project URL** (ex: `https://abcdefgh.supabase.co`)
   - **anon public key** (une longue chaîne de caractères)

## 2. Configurer l'appli

✅ Déjà fait — `index.html` contient déjà ton URL Supabase, ta clé, et un code d'accès (`2468` par défaut, modifiable dans le fichier en cherchant `APP_PIN`).

## 3. Déployer sur Vercel (gratuit) — sans rien installer

Ta machine n'a pas Node/npm installés, donc on passe par le site web de GitHub + Vercel (aucune installation nécessaire) :

1. Crée un compte sur [github.com](https://github.com) si tu n'en as pas.
2. Sur GitHub, clique **"New repository"**, donne-lui un nom (ex: `jox-training-app`), laisse-le "Public" ou "Private" au choix, ne coche aucune case d'initialisation, clique **"Create repository"**.
3. Sur la page du repo vide, clique **"uploading an existing file"**, puis glisse-dépose les 3 fichiers de ce dossier (`index.html`, `schema.sql`, `README.md`). Clique **"Commit changes"**.
4. Va sur [vercel.com/new](https://vercel.com/new), connecte-toi (tu peux te connecter directement avec ton compte GitHub), puis **"Import"** le repo `jox-training-app`.
5. Laisse les réglages par défaut (aucune build command nécessaire, c'est un site statique) et clique **"Deploy"**.
6. Après ~30 secondes, Vercel te donne une URL publique (ex: `https://jox-training-app.vercel.app`) — c'est le lien à partager avec Jox.

*(Si tu installes un jour Node.js, tu pourras aussi déployer plus vite avec `npx vercel --prod` depuis ce dossier.)*

## 4. Utilisation

- Envoie l'URL + le code PIN à Jox. Il l'ouvre sur son téléphone, entre le code une fois (mémorisé ensuite sur son appareil), remplit l'index de Hooper et ses charges après chaque séance, puis clique "Enregistrer".
- Toi, tu ouvres la même URL sur ton ordinateur, entres le même code, et tu vois en direct le tableau de bord et l'historique.

## Note sur la sécurité

Le code PIN est une simple barrière côté appli (évite qu'un lien égaré tombe entre de mauvaises mains), pas une authentification réelle : la clé `anon` de Supabase reste visible dans le code source de la page. Pour un usage privé entre toi et un athlète, ce niveau de protection est suffisant. Si tu geres plusieurs athlètes ou des données plus sensibles un jour, il vaudra mieux passer à une vraie authentification (comptes email/mot de passe Supabase Auth).
