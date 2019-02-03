# BBIN

BBin est un utilitaire Pastebin pour shell,  il permet d'envoyer l'entrée standard sur Pastebin.

### Installation
![Build Status](http://img.shields.io/travis/badges/badgerbadgerbadger.svg?style=for-the-badge&logo=appveyor)
```
git clone https://github.com/bclerc/bbin
cd bbin
sh bbin.sh -i
```
Une fois l'installation du programme terminé vous devez inscrire votre clef developpeur Pastebin dans le fichier `config.yml`
>Vous trouverez votre clef api ici : https://pastebin.com/api
```
apikey=#Votre cles ici 
```

## Utilisation

Par exemple, pour envoyer un fichier

```
cat file.txt | bbin
cat file.txt | bbin -n 'Name of file'
```

![Recordit GIF](http://g.recordit.co/NYCLVFeMMr.gif)

### Clès utilisateur API
>Pour pouvoir faire des postes à votre nom et les rendres privés vous devez inscrire votre clef d'utilisateur dqns le fichier `config.yml'. Cependant elle n'est pas obligatoire pour les autres fonctions.

```
apikey=
userkey= #Votre cles ici 
```

### Les arguments

Definir le nom du pastebin

```
cat file.txt | bbin -n "Ceci est un jolie nom"
```

- Definir le delai avant la suppression

> N:   Jamais,   1H:   1 Heure,   1W:   Une semaine,   1M:   1 Mois,   1Y:   1 Ans 
```
cat file.txt | bbin -d "1D"
```

- Definir le pastebin en privé 
> La clef "userkey" est nécessaire pour cette option

```
cat file.txt | bbin -p 
```

Mettre à jour 

```
bbin -u 
```

## Auteurs

* **CLERC Bryce** -[bclerc](https://github.com/bclerc)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
