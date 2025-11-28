# Instructions

Pour pouvoir compiler le projet sur votre ordinateur, il vous faut installer les librairies flex et bison.

- Sur linux (ubuntu) cela se fait par la commande :
  
  sudo apt-get install flex bison
  
  (ou équivalent sur d'autres distributions)

- Sur mac, ces librairies sont installées en standard. Si ce n'est pas le cas pour vous, cela peut s'installer via homebrew (cf https://brew.sh/index_fr)

  brew install flex bison

- sur windows, je ne sais pas, à vous de chercher.

# Compte rendu

Je vous demande de rédiger votre compte rendu dans ce fichier que vous rendrez avec vos programmes sur caseine. Je vous suggère les éléments suivants:

## Grammaires utilisée pour les différentes étapes
### Grammaire originelle $G_1$

$$
\begin{aligned}
& R_0: \quad S \rightarrow A \\
& R_1: \quad A \rightarrow L ; A \\
& R_2: \quad A \rightarrow \varepsilon \\
& R_3: \quad L \rightarrow V = L \\
& R_4: \quad L \rightarrow E \\
& R_5: \quad V \rightarrow \text{var} \\
& R_6: \quad E \rightarrow E + T \\
& R_7: \quad E \rightarrow E - T \\
& R_8: \quad E \rightarrow T \\
& R_9: \quad T \rightarrow T * G \\
& R_{10}: \quad T \rightarrow T / G \\
& R_{11}: \quad T \rightarrow G \\
& R_{12}: \quad G \rightarrow B \wedge G \\
& R_{13}: \quad G \rightarrow B \\
& R_{14}: \quad B \rightarrow C\wedge B \_ F \\
& R_{15}: \quad B \rightarrow C\_ B \wedge F \\
& R_{16}: \quad B \rightarrow F \\
& R_{17}: \quad F \rightarrow \text{var} \\
& R_{18}: \quad F \rightarrow a \\
& R_{19}: \quad F \rightarrow (L)
\end{aligned}
$$

## Difficultés rencontrées

Si vous en avez eu...

## Remarques éventuelles

Si nécessaires...
