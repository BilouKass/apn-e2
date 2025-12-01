# Instructions

Pour pouvoir compiler le projet sur votre ordinateur, il vous faut installer les librairies flex et bison.

- Sur linux (ubuntu) cela se fait par la commande :
  
  sudo apt-get install flex bison
  
  (ou équivalent sur d'autres distributions)

- Sur mac, ces librairies sont installées en standard. Si ce n'est pas le cas pour vous, cela peut s'installer via homebrew (cf https://brew.sh/index_fr)

  brew install flex bison

- sur windows, passez sur une WSL puis suivez les instructions linux

# Compte rendu

Dans cette apnée nous avons utilisé l'outil bison accompagné de l'analyseur lexical lex. Pour mon sujet j'avais la combinaison sous la forme $C_{N}^{K}$ où $C^{K}_{N}$ qui représente la combinaison de K parmis N.\\
Le code est séparé en 2 partie, assign1 où on exprime chaque règle sans ambiguité tandis que dans assign2 nous rentrons une grammaire ambiüe et ensuite j'ai du ajouter les règles d'associativité suivante :
- Gauche: 
  - A + A
  - A - A
  - A * A
  - A / A

- Droite:
  - Var = Expr
  - A ^ A

Plus une règle est haute dans la liste, moins il est prioritaire. Egalement l'assignation est l'opération la moins prioritaire, il est donc déclaré avant les autres dans le code de bison

Pour effectuer la puissance ou la combinaison il y a aussi le code math_op.c avec son .h qui permet d'effectuer ces calculs.
## Grammaires utilisée pour les différentes étapes
### Grammaire originelle $G_1$

$$
\begin{aligned}
& R_0: \quad S \rightarrow A \\
& R_1: \quad A \rightarrow L ; A \\
& R_2: \quad A \rightarrow \varepsilon \\
& R_3: \quad L \rightarrow \text{var} = L \\
& R_4: \quad L \rightarrow E \
& R_5: \quad E \rightarrow E + T \\
& R_6: \quad E \rightarrow E - T \\
& R_7: \quad E \rightarrow T \\
& R_8: \quad T \rightarrow T * G \\
& R_{9}: \quad T \rightarrow T / G \\
& R_{10}: \quad T \rightarrow G \\
& R_{11}: \quad G \rightarrow B \wedge G \\
& R_{12}: \quad G \rightarrow B \\
& R_{13}: \quad B \rightarrow C\wedge B \_ F \\
& R_{14}: \quad B \rightarrow C\_ B \wedge F \\
& R_{15}: \quad B \rightarrow F \\
& R_{16}: \quad F \rightarrow \text{var} \\
& R_{17}: \quad F \rightarrow a \\
& R_{18}: \quad F \rightarrow (L)
\end{aligned}
$$

### Grammaire G2 ambigüe
$$
\begin{aligned}
& R_0: \quad S \rightarrow A \\
& R_1: \quad A \rightarrow L ; A \\
& R_2: \quad A \rightarrow \varepsilon \\
& R_3: \quad L \rightarrow \text{var}  = L \\
& R_4: \quad L \rightarrow E \\
& R_5: \quad E \rightarrow E + E \\
& R_6: \quad E \rightarrow E - E \\
& R_7: \quad E \rightarrow E \times E \\
& R_8: \quad E \rightarrow E / E \\
& R_9: \quad E \rightarrow E \wedge E \\
& R_{10}: \quad E \rightarrow C\wedge F \_ F \\
& R_{11}: \quad E \rightarrow C\_ F \wedge F \\
& R_{12}: \quad F \rightarrow \text{var} \\
& R_{13}: \quad F \rightarrow a \\
& R_{14}: \quad F \rightarrow (L) \\

\end{aligned}
$$
## Difficultés rencontrées

Quelques difficultés à comprendre que les partie entre {} étaient du code C (appel des fonctions de calculs). De même pour les inclusion des .h en haut. 

le %union m'a demandé également des recherches pour mieux comprendre son fonctionnement.


## Remarques éventuelles

Eventuellement rajouter une partie sur les sortie d'erreur ou comment debugger ce genre de code
