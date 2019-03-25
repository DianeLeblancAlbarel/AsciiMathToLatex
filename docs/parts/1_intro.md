# Introduction

Il existe beaucoup de langages et de logiciels d'édition de documents.
Les plus utilisés sont ceux qui adhèrent au principe *What You See Is What You Get* **(WYSIWYG)**
qui permettent à l'utilisateur de voir le résultats d'apercevoir le docmuents lorsque sa création.
Tels outils ont été facteur essentiel dans la démocratisation de l'ordinateur.
Néanmoins, les logiciels WYSIWYG sont limités face à certains utilisateurs vis-à-vis l'efficacité et la qualité des résultats,
notamment dans le domaine scientifique.

En effet, le langage LaTeX represente un alternatif excellent pour l'edition des textes scientifiques ou ceux
contenant du code informatique, ainsi que HTML pour l'édition des pages web.
Néanmoins, l'utilisation de ces langages reste limité par soucis de simplicité et d'accéssiblité.

En revanche, il existe des logiciels/languages intermédiares qui rendent LaTeX et HTML plus accéssibles.
Nous nous sommes intéressés par le langage **markdown** qui est simple à lire/écrire et peut être
facilement interprété en LaTeX ou HTML par des programmes comme **pandoc**.

Markdown permet d'écrire des équations mathématiques en format TeX, qui pourrons être affichés
correctement sur le document final sans problème.
En revanche, les équations mathématiques en TeX sont rarement lisibles, ce qui est contradictoire
avec l'objectif d'écrire les documents en markdown.

On a donc eu l'idée de développer un langage pour les expressions mathématiques où elles serons
simple à lire et écrire.
Nous avons tout de suite trouvé qu'un tel langage existe: [**AsciiMath**](asciimath.org).
AsciiMath est un langage *markup* qui utilise dans son syntaxe des symboles assez proches
de leur rendu (e.g. `oo` pour $\infty$).

Nous avons donc décidé de créer un interpréteur *AsciiMath en LaTeX*.
