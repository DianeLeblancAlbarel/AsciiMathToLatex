# Introduction

Il existe beaucoup de langages et de logiciels d'édition de documents.
Les plus utilisés sont ceux qui adhèrent au principe *What You See Is What You Get* **(WYSIWYG)**
qui permettent à l'utilisateur d'apercevoir le docmuent lors de sa création.
De tels outils ont été un facteur essentiel dans la démocratisation de l'ordinateur.
Néanmoins, les logiciels WYSIWYG sont limités face à certains utilisateurs vis-à-vis de l'efficacité
et de la qualité des résultats, notamment dans le domaine scientifique.

En effet, le langage LaTeX represente une alternative excellente pour l'édition des textes scientifiques ou ceux
contenant du code informatique, ainsi que HTML pour l'édition des pages web.
Néanmoins, l'utilisation de ces langages reste limité par soucis de simplicité et d'accéssiblité.

En revanche, il existe des logiciels/languages intermédiaires qui rendent LaTeX et HTML plus accéssibles.
Nous nous sommes intéressés au langage **markdown** qui est simple à lire/écrire et peut être
facilement interprété en LaTeX ou HTML par des programmes comme **pandoc**.

Markdown permet d'écrire des expressions mathématiques en format TeX, qui pourront être affichées
correctement sur le document final.
En revanche, les équations mathématiques en TeX sont rarement lisibles, ce qui est contradictoire
avec l'objectif d'écrire les documents en markdown.

On a donc eu l'idée de développer un langage pour les expressions mathématiques où elles serons
simples à lire et écrire.
Nous avons tout de suite trouvé qu'un tel langage existe: [**AsciiMath**](asciimath.org).
AsciiMath est un langage *markup* qui utilise dans sa syntaxe des symboles assez proches
de leurs rendus respectifs (e.g. `oo` pour $\infty$).

Nous avons donc décidé de créer un interpréteur *AsciiMath en LaTeX*.
