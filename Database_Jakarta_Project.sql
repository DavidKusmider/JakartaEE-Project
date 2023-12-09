drop table if exists VideoGameTheme;
drop table if exists CartRow;
drop table if exists History;
drop table if exists Discount;
drop table if exists VideoGame;
drop table if exists Theme;
drop table if exists User;

create table if not exists VideoGame
(
    videoGameId          int             not null auto_increment,
    videoGameName        varchar(50)     not null,
    videoGameDescription varchar(10000)  not null,
    videoGamePrice       decimal         not null,
    videoGameStock       int             not null,
    releaseDate          Date            not null,
    constraint PK_VideoGame PRIMARY KEY (videoGameId)
);

INSERT INTO VideoGame (
	videoGameName,
	videoGameDescription,
	videoGamePrice,
	videoGameStock,
	releaseDate
) VALUES
("Assassin’s Creed Mirage","Assassin’s Creed Mirage sur PC est un jeu vidéo d'action et d'aventure, le treizième opus majeur de la série et le successeur d'AC Valhalla. Mirage se déroule principalement dans la Bagdad du IXe siècle et met en scène Basim Ibn Ishaq. Historiquement, c'est l'époque de l'anarchie de Samarra, une période instable marquée par des changements constants de dirigeants. Dans le jeu, Basim - vu pour la première fois dans Assassin's Creed Valhalla - passe du statut de voleur de rue à celui d'Assassin à part entière.",45.00,25,"5 octobre 2023"),

("Assassin's Creed Valhalla","Assassin's Creed Valhalla pour PC est le 12ème épisode de la série Assassin's Creed, et ce dernier se déroule au 9ème siècle (à partir de 873) et vous emmène partout en Europe pour faire voyager votre clan d'une Norvège gravement surpeuplée et déchirée par la guerre vers l'Angleterre, une terre verdoyante où règnent la paix, la prospérité et des champs fertiles où vous pourrez faire pousser vos récoltes. Le Royaume-Uni a peut-être la réputation d'être un pays froid et pluvieux, mais comparé à la désolation qui règne en Arctique, ce n'est pas si mal comme substitut ! Il s'agit d'un jeu d'action et d'aventure dans un open world.",10.00,25,"10 novembre 2020"),

("Assassin's Creed III Remastered","Revivez la Révolution Américaine ou vivez-la pour la première fois dans Assassin's Creed III Remastered, avec des graphismes améliorés et de nouvelles mécaniques de jeu. 1775. Les Colonies Américaines sont sur le point de se révolter. Vous incarnez Connor, et vous battez pour la liberté de votre peuple et de votre nation. Choisissez vos armes parmi une vaste sélection, et assassinez vos ennemis de multiples façons.",9.00,25,"29 mars 2019"),

("Resident Evil 4","La survie n'est que le début. Six ans se sont écoulés depuis la catastrophe biologique de Raccoon City. L'agent Leon S. Kennedy, l'un des survivants du drame, est envoyé secourir la fille du président qui a été kidnappée. Son enquête le mène jusqu'à un village européen isolé, dont les habitants cachent un effroyable secret. Et ainsi se lève le rideau d'une histoire de sauvetage audacieux et d'horreur atroce, où se mêlent vie, mort, terreur et catharsis. Avec un gameplay modernisé, une histoire revisitée et des graphismes ultra détaillés, Resident Evil 4 signe la renaissance d'un monstre de l'industrie. Replongez dans le cauchemar qui a révolutionné les jeux d'horreur et de survie.",30.00,25,"24 mars 2023"),



("Forza Motorsport","Forza Motorsport sur PC est l'équivalent de Forza Motorsport 8, à la différence près qu'il s'agit plus d'un reboot du jeu original que d'une suite : d'où l'absence de numéro à côté du nom. C'est un jeu vidéo de simulation de course automobile. Ce nouvel opus propose plus de 500 voitures avec 800 améliorations (les améliorations devront être gagnées étant uniques à chaque voiture et obtenues en passant du temps de conduite, et en accumulant de l'XP), dont certaines de toutes les époques de la course automobile (80 de toutes les époques) et 100 d'entre elles sont des nouveautés dans le jeu.",56.00,25,"10 octobre 2023"),

("Battlefield 2042","Battlefield 2042 pour PC est un jeu vidéo de tir à la première personne avec un fort accent sur le multijoueur. Le jeu, le douzième de la série (qui compte également plus de quarante packs d'extension), se déroule dans un futur assez proche (comme son nom l'indique), ce qui signifie qu'il y a beaucoup d'armes et de gadgets high-tech et futuristes, comme des drones déployables, des tourelles et des chiens robots.",13.00,25,"19 novembre 2021"),

("Minecraft","Explorez des mondes générés aléatoirement et construisez tout ce qui vous passe par la tête, d''un abri de fortune au plus fabuleux des châteaux. Jouez en mode Créatif avec des ressources illimitées, ou creusez jusqu''au centre du monde pour fabriquer armes et armures afin de vaincre les dangereuses créatures du mode Survie. Gravissez des montagnes escarpées, découvrez des cavernes complexes et extrayez de grandes veines de minerai.",21.00,25,"19 novembre 2011"),

("Fortnite","Fortnite est un jeu vidéo en ligne disponible en trois modes. Au départ, le premier mode de jeu (Fortnite : Save the World) est sorti, et n'a guère progressé. Mais le mode Battle Royale a ensuite été lancé et Fortnite est rapidement devenu le jeu le plus populaire au monde, remportant des prix chaque année depuis sa sortie. Aujourd'hui, il est toujours l'un des jeux les plus populaires.",5.00,25,"25 juillet 2017"),



("HumanitZ","Une invasion zombie a éradiqué toute civilisation. Des hordes de zeeks se sont hissées tout en haut de la chaîne alimentaire en devenant de féroces prédateurs. Quelques années plus tard, l’Homme est une espèce en voie de disparation et seules quelques poches de résistance parviennent à survivre dans ce monde désolé. Bienvenue dans HumanitZ, un jeu en vue isométrique de survie en monde ouvert où vous pouvez essayer de changer les choses et de remettre l’humanité à la place qui est la sienne - tout en haut de la chaîne alimentaire. Vous risquerez-vous à explorer les villes en quête de loot, sachant que les zombies vous attendent à chaque coin de rue ? Ou préférerez-vous plutôt la campagne, pour essayer de survivre en chassant, pêchant et cultivant vos terres ?",24.00,25,"18 septembre 2023"),

/*("Resident Evil 4","","",23.99,25,""), déjà créé avant pour une autre catégorie*/

("7 Days to Die","7 Days to Die sur PC a commencé comme un jeu d'horreur de survie financé par un early access qui a réussi à atteindre son objectif et a fait son chemin sur le marché comme un produit abouti. Dans le jeu, le joueur doit non seulement survivre aux ennemis et aux combats, mais aussi simplement vivre : trouver de la nourriture, de l'eau, un abri, etc. sont tous essentiels à la survie du personnage.",24.00,25,"13 décembre 2013"),

("ARK : Survival Evolved","En tant qu'homme ou femme échoué nu, en train de gelé et de mourir de faim sur une île mystérieuse, vous devez chasser, récolter, fabriquer des objets, faire pousser des plantes et construire des abris pour survivre. Utilisez vos compétences et votre ruse pour tuer, apprivoiser, faire accoupler et chevaucher des dinosaures et des créatures primitives vivant sur l'Arche, en faisant équipe avec des centaines de joueurs pour survivre, dominer et ... s'échapper ! Les fonctions suivantes sont présentes dans le jeu dès sa sortie. Nous avons de nombreux autres aspects et améliorations prévues pour la feuille de route à long terme du développement, et voici ce que vous allez vivre dès maintenant dans ARK: APPRIVOISEZ, ENTRAINEZ, FAITES REPRODUIRE ET CHEVAUCHEZ LES DINOSAURES DANS UN ÉCOSYSTÈME VIVANT",15.00,25,"27 août 2017"),

("Rust","Rust for PC Rust est un jeu de survie multi-joueurs disponible uniquement en ligne. Il peut être difficile pour un débutant de passer les premières étapes cruciales après la période de reproduction, car non seulement c'est le PvE habituel que l'on peut attendre d'un jeu de survie, mais c'est en même temps du PvP : ainsi vous débuter dans le jeu en étant nu, seulement muni d'une pierre et d'une torche alors que vous pourriez faire face pourrait à un militaire bien armé qui attend juste le moment parfait pour attaquer son ennemi !",20.00,25,"8 février 2018"),

("Stardew Valley","Stardew Valley sur PC est un jeu qui permet aux joueurs de s'éloigner de l'agitation de leur vie quotidienne, que ce soit à l'école ou au travail, et de voir ce que c'est que de reprendre une ferme un peu délabrée, de travailler pour faire des récoltes, de récolter de l'argent, de faire des cadeaux aux voisins et bien plus encore. Il s'agit d'un jeu de simulation de ferme, un jeu de rôle, bien que l'action soit douce et axée sur l'agriculture, plutôt que sur les tactiques de combat habituelles d'un RPG.",20.00,25,"26 février 2016"),

/*("ARK : Survival Evolved","","",23.99,25,""), déjà créé avant pour une autre catégorie*/

/*("7 Days to Die","","",23.99,25,""), déjà créé avant pour une autre catégorie*/



/*("Forza Motorsport","","",23.99,25,""), déjà créé avant pour une autre catégorie*/

("Terraria","Terraria pour PC est un jeu d'exploration en deux dimensions dans lequel le joueur cherche à aménager le monde selon ses propres choix - et aussi ses compétences en matière de combat, d'artisanat et de collecte de ressources !",7.00,25,"16 mai 2011"),

/*("Red Dead Redemption 2","Red Dead Redemption 2 pour PC est un jeu d'action et d'aventure, open world, dans lequel le joueur peut errer librement et jouer à la troisième personne, tout en revenant à la première personne en mode simulation. Le joueur peut commettre des crimes, mais il doit ensuite être prêt à être traqué par les forces de l'ordre, prêt à faire peser toute la force de la loi contre le malfaiteur !",16.00,25,"5 décembre 2019"),*/

("Cyberpunk 2077","Cyberpunk 2077 est un jeu d’action-aventure en monde ouvert qui se déroule à Night City, une mégalopole obsédée par le pouvoir, la séduction et les modifications corporelles. Vous incarnez V, mercenaire hors-la-loi à la recherche d’un implant unique qui serait la clé de l’immortalité. Personnalisez les cyberlogiciels, les compétences et le style de jeu de votre personnage, et explorez cette ville immense où chacun de vos choix aura un impact direct sur l’histoire et le monde qui vous entoure.",60.00,25,"10 décembre 2020"),



/*("Battlefield 2042","","",12.85,25,""), déjà créé avant pour une autre catégorie*/

("Call Of Duty : Modern Warfare III","Dans la suite directe de Call of Duty: Modern Warfare II, le capitaine Price et la Task Force 141 affrontent la menace ultime. Le criminel de guerre ultranationaliste Vladimir Makarov étend son emprise à travers le monde, obligeant la Task Force 141 à se battre comme jamais auparavant.Modern Warfare III célèbre le 20e anniversaire de Call of Duty avec l'une des plus grandes collections de cartes Multijoueur jamais réunies (à la fois des favoris des fans et de toutes nouvelles cartes). Les 16 cartes de lancement de Modern Warfare 2 (2009) ont été modernisées avec de nouveaux modes et de nouvelles fonctionnalités de jeu et seront disponibles dès le lancement, tandis que plus de 12 nouvelles cartes 6v6 alimenteront les saisons après le lancement.",70.00,25,"10 novembre 2023"),

("Car Mechanic Simulator 2021","Car Mechanic Simulator 2021 est une nouvelle production avec une base de joueurs bien établie. Commencez en tant que nouveau propriétaire d'un garage automobile et faites votre chemin vers un empire du service. Mettez la main à la pâte dans un jeu de simulation aux détails incroyablement réalistes. Préparez-vous à travailler sur 4000+ pièces uniques et plus de 72 voitures. Relevez vos manches et plongez dans un environnement de garage d'un réalisme fou.",25.00,25,"	11 août 2021"),

("Team Fortress Classic","Team Fortress Classic, l'un des jeux d'action en ligne les plus populaires de tous les temps, propose plus de neuf classes de personnages - de l'infirmier à l'espion en passant par le démolisseur - qui s'affrontent dans un style unique de guerre d'équipe en ligne. Chaque classe de personnage possède des armes, des objets et des capacités uniques, et les équipes s'affrontent en ligne dans divers modes de jeu.",24.00,25,"1 avril 1999"),


/*("Fortnite","","",23.99,25,""), déjà créé avant pour une autre catégorie*/

("Watch_Dogs 2","Watch Dogs 2 sur PC est la suite du premier jeu de la même série, et on a appris depuis peu qu’il bénéficiera d'une troisième édition dans peu de temps. Il s'agit d'un jeu d'action et d'aventure à la troisième personne au sein d’un open world. Vous incarnez Marcus Holloway, un rebelle qui tente de déjouer les tentatives des autorités de la ville pour contrôler la population à l'aide d'équipements de surveillance de haute technologie. Marcus Holloway est membre d'un gang de hacktivistes, l'un de leurs meilleurs membres, et c'est son travail de mener à bien des missions, d'amener des partisans au gang, connu sous le nom de DedSec.",5.00,25,"29 novembre 2016"),

("GTA V","Grand Theft Auto V pour PC est un jeu d'action et d'aventure, le cinquième de la série GTA. Comme pour les autres jeux de la série, vous gagnez en expérience en commettant des crimes. Le jeu alterne entre le récit à la troisième personne et le jeu à la première personne et serez amené à jouer comme trois criminels en commettant des vols et essayant d'éviter une agence gouvernementale déterminée. Vous ne choisissez pas seulement un personnage à jouer, car le récit vous permet de switcher d'un personnage à un autre. Le jeu se déroule dans la ville fictive de San Andreas qui est basée sur le mode de vie du sud de la Californie. Bien qu'une grande partie de l'action scénarisée du jeu se déroule en ville, le monde est beaucoup plus vaste que dans la RGT précédente et les joueurs peuvent l'explorer librement. La ville se trouve dans le comté de Blaine, près d'une autre ville, Los Santos (les deux sont toute aussi fictives) et toutes les zones peuvent être accessibles dès le début du jeu.",10.00,25,"14 avril 2015"),

("Red Dead Redemption 2","Red Dead Redemption 2 pour PC est un jeu d'action et d'aventure, open world, dans lequel le joueur peut errer librement et jouer à la troisième personne, tout en revenant à la première personne en mode simulation. Le joueur peut commettre des crimes, mais il doit ensuite être prêt à être traqué par les forces de l'ordre, prêt à faire peser toute la force de la loi contre le malfaiteur ! RDR2, comme on l'appelle affectueusement, est sorti sur d'autres plates-formes avant la sortie sur PC, ce qui lui a valu le titre de jeu le plus vendu de tous les temps, avant que les chiffres du jeu PC ne soient inclus. La raison de la popularité du jeu n'est pas difficile à voir.",16.00,25,"5 décembre 2019");

create table if not exists Theme
(
    themeId   int         not null auto_increment,
    themeName varchar(50) not null,
    constraint PK_theme PRIMARY KEY (themeId)
);

INSERT INTO Theme (
	themeName
) VALUES
("Adventure"),
("Multiplayer"),
("Survival"),
("Building"),
("Solo"),
("Fist-Play"),
("Third-Play");

create table if not exists VideoGameTheme
(
    themeId     int not null,
    videoGameId int not null,
    constraint PK_VideoGameTheme PRIMARY KEY (themeId, videoGameId),
    constraint FK_themeId foreign key (themeId) references Theme (themeId) on delete cascade,
    constraint FK_videoGameIdTheme foreign key (videoGameId) references VideoGame (videoGameId) on delete cascade
);

INSERT INTO VideoGameTheme (
	themeId,
	videoGameId
) VALUES
(1,1),
(1,2),
(1,3), (5,3),
(1,4), (5,4),
(2,5), (5,5),
(1,6), (2,6),
(2,7), (4,7),
(2,8), (5,8), (7,8),
(1,9), (5,9),
(1,10), (5,10),
(1,11), (5,11),
(4,12), (5,12),
(4,13), (5,13),
(1,14), (5,14),
(1,15), (5,15), (7,15),
(5,16),
(2,17), (5,17), (6,17),
(5,18), (6,18),
(2,19), (6,19),
(1,20), (5,20), (7,20),
(1,21), (5,21), (7,21);

create table if not exists User
(
    userId            int                              not null auto_increment,
    userName          varchar(100)                     not null,
    userPassword      varchar(1000)                    not null,
    userMail          varchar(100)                     not null,
    userAddress       varchar(100)                     not null,
    userCreated       date       default (CURDATE()),
    isActive          tinyint(1) default (1),
    userType          enum ('Client', 'Admin', 'Modo') NOT NULL,
    userRight         int,
    userFidelityPoint int        default (0),
    constraint PK_idUser PRIMARY KEY (userId)
);

INSERT INTO User (
    userName,
    userPassword,
    userMail,
    userAddress,
    userCreated,
    userType,
    userRight,
    userFidelityPoint
) VALUES
( "David", "secret", "d1@ku.com", "Tav", CURDATE(), 'Client', 3, 0 ),
( "kevin", "secret", "d2@ku.com", "Tav", CURDATE(), 'Modo', 7, 0 ),
( "Romain", "secret", "d3@ku.com", "Tav", CURDATE(), 'Modo', 7, 0 ),
( "Yann", "secret", "d4@ku.com", "Tav", CURDATE(), 'Client', 3, 0 ),
( "CYTech", "c7267d9b7abd409c7ceb3cb7a8a43adc99f67eb856fcf71c1e884b4d0e9a5d35", "cytech@gmail.com", "Tav", CURDATE(), 'Admin', 7, 0 ),
( "Lucas", "secret", "d5@ku.com", "Tav", CURDATE(), 'Client', 3, 0 );

INSERT INTO User (userName, userPassword, userMail, userAddress, userCreated, userType, userRight, userFidelityPoint)
VALUE ('Lucas','a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3','lucas2@gmail.com','TestVille',CURDATE(),'Client',1,100);

create table if not exists History
(
    historyId         int     not null,
    videoGameId       int     not null,
    videoGamePrice    decimal not null,
    videoGameQuantity int     not null,
    constraint FK_videoGameIdHistory foreign key (videoGameId) references VideoGame (videoGameId) on delete cascade ,
    constraint FK_historyId foreign key (historyId) references User (userId) on delete cascade
);


create table if not exists Discount
(
    discountId     int not null auto_increment,
    discountAmount int not null,
    videoGameId    int not null,
    constraint PK_discountId PRIMARY KEY (discountId),
    constraint FK_videoGameId foreign key (videoGameId) references VideoGame (videoGameId) on delete cascade
);

create table if not exists CartRow
(
    cartId         int not null auto_increment,
    userId         int not null,
    videoGameId    int not null,
    quantity       int not null DEFAULT 1,
    constraint PK_cartId PRIMARY KEY (cartId),
    constraint FK_userIdCart foreign key (userId) references User (userId) on delete cascade ,
    constraint FK_videoGameIdCart foreign key (videoGameId) references VideoGame (videoGameId) on delete cascade
);

INSERT INTO CartRow (userId, videoGameId, quantity) VALUES
(9, 1, 2);
