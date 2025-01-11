drop database if exists Database_Jakarta_Project;

create database if not exists Database_Jakarta_Project;

use Database_Jakarta_Project;

drop table if exists VideoGameTheme;
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
("Assassin’s Creed Mirage","Assassin''s Creed Mirage is an action-adventure video game, the thirteenth major installment in the series and the successor to AC Valhalla. Mirage takes place mainly in ninth-century Baghdad and features Basim Ibn Ishaq. Historically, this was the time of the anarchy of Samarra, an unstable period marked by constant changes of rulers. In the game, Basim, first seen in Assassin''s Creed Valhalla, goes from being a street thief to a fully-fledged Assassin.",45.00,25,"2023-01-05"),

("Assassin's Creed Valhalla","Assassin''s Creed Valhalla is the 12th installment in the Assassin''s Creed series, and it''s set in the 9th century (from 873) and takes you all over Europe as your clan travels from severely overpopulated and war-torn Norway to England, a verdant land of peace, prosperity and fertile fields where you can grow your crops. The UK may have a reputation for being a cold, rainy country, but compared to the desolation that reigns in the Arctic, it''s not such a bad substitute! This is an open-world action-adventure game.",10.00,25,"2020-11-10"),

("Assassin's Creed III Remastered","Relive the American Revolution or experience it for the first time in Assassin''s Creed III Remastered, with improved graphics and new gameplay mechanics. 1775. The American Colonies are on the verge of revolt. As Connor, you fight for the freedom of your people and your nation. Choose your weapons from a vast selection, and assassinate your enemies in a multitude of ways.",9.00,25,"2019-03-29"),

("Resident Evil 4","Survival is just the beginning. Six years have passed since the biological disaster at Raccoon City. Agent Leon S. Kennedy, one of the survivors, is sent to rescue the President''s kidnapped daughter. His investigation leads him to an isolated European village whose inhabitants are hiding a terrible secret. And so the curtain rises on a story of daring rescue and gruesome horror, where life, death, terror and catharsis mingle. With updated gameplay, a revisited story and ultra-detailed graphics, Resident Evil 4 marks the rebirth of an industry behemoth. Immerse yourself in the nightmare that revolutionized horror and survival games.",30.00,25,"2023-03-24"),

("Forza Motorsport","Forza Motorsport is the equivalent of Forza Motorsport 8, except that it''s more of a reboot of the original game than a sequel: hence the lack of a number next to the name. It''s a motor racing simulation video game. This new opus features more than 500 cars with 800 upgrades (the upgrades to be earned are unique to each car and obtained by spending time driving and accumulating XP), including some from all eras of motor racing (80 from all eras), 100 of which are new to the game.",56.00,25,"2023-10-10"),

("Battlefield 2042","Battlefield 2042 is a first-person shooter with a strong multiplayer focus. The game, the twelfth in the series (which also boasts over forty expansion packs), is set in the not-too-distant future (as the name suggests), which means there are plenty of high-tech, futuristic weapons and gadgets, such as deployable drones, turrets and robot dogs.",13.00,25,"2021-11-19"),

("Minecraft","Explore randomly generated worlds and build anything you can think of, from a makeshift shelter to the most fabulous of castles. Play in Creative mode with unlimited resources, or dig to the center of the world to craft weapons and armor to defeat the dangerous creatures of Survival mode. Climb steep mountains, discover intricate caverns and mine large veins of ore.",21.00,25,"2011-11-19"),

("Fortnite","Fortnite is an online video game available in three modes. Initially, the first game mode (Fortnite: Save the World) was released, and made little headway. But then Battle Royale mode was launched and Fortnite quickly became the most popular game in the world, winning awards every year since its release. Today, it''s still one of the most popular games.",5.00,25,"2017-07-25"),

("HumanitZ","A zombie invasion has eradicated all civilisation. Hordes of zeeks have risen to the top of the food chain, becoming ferocious predators. A few years later, Man is an endangered species and only a few pockets of resistance manage to survive in this desolate world. Welcome to HumanitZ, an isometric open-world survival game where you can try to change things and put humanity back where it belongs at the top of the food chain. Will you risk exploring the cities in search of loot, knowing that zombies are waiting around every corner? Or will you prefer the countryside, trying to survive by hunting, fishing and farming?",24.00,25,"2023-09-18"),

("7 Days to Die","7 Days to Die started out as an early access-funded survival horror game that succeeded in reaching its goal and made its way onto the market as a successful product. In the game, the player must not only survive enemies and combat, but also simply live: finding food, water, shelter, etc. are all essential to the character''s survival.",24.00,25,"2013-12-13"),

("ARK : Survival Evolved","As a man or woman stranded naked, freezing and starving on a mysterious island, you must hunt, gather, craft items, grow plants and build shelters to survive. Use your skills and cunning to kill, tame, mate and ride dinosaurs and primitive creatures living on the Ark, teaming up with hundreds of players to survive, dominate and ... escape! The following features are included in the game from release. We have many more features and enhancements planned for the long-term development roadmap, and here''s what you''ll experience right now in ARK: tame, train, breed and ride dinosaurs in a living ecosystem.",15.00,25,"2017-08-27"),

("Rust","Rust is a multiplayer survival game available online only. It can be difficult for a beginner to get through the crucial first stages after the breeding period, because not only is it the usual PvE you''d expect from a survival game, but it''s PvP at the same time: so you start the game naked, armed only with a rock and a torch when you could be facing a well-armed military man just waiting for the perfect moment to attack his enemy!",20.00,25,"2018-02-08"),

("Stardew Valley","Stardew Valley on PC is a game that allows players to get away from the hustle and bustle of their daily lives, whether at school or work, and see what it''s like to take over a slightly run-down farm, work to grow crops, collect money, give gifts to neighbors and much more. It''s a farm simulation game, a role-playing game, although the action is gentle and focused on farming, rather than the usual RPG combat tactics.",20.00,25,"2016-02-26"),

("Terraria","Terraria is a two-dimensional exploration game in which players seek to shape the world according to their own choices and also their combat, crafting and resource-gathering skills! Create a character and set out to explore the world watch out for nightfall and zombies, so your first task will almost always be to build yourself some sort of shelter. It gets really dark at night in the game, so don''t forget to find, buy or create some sort of light source.",7.00,25,"2011-05-16"),

("Cyberpunk 2077","Cyberpunk 2077 is an open-world action-adventure game set in Night City, a megalopolis obsessed with power, seduction and body modification. You play as V, an outlaw mercenary in search of a unique implant that holds the key to immortality. Customise your character''s cyberware, skills and play style, and explore this immense city where every choice you make will have a direct impact on the story and the world around you.",60.00,25,"2020-12-10"),

("Call Of Duty : Modern Warfare III","In the direct sequel to Call of Duty: Modern Warfare II, Captain Price and Task Force 141 face the ultimate threat. Ultranationalist war criminal Vladimir Makarov is expanding his reach across the globe, forcing Task Force 141 to fight like never before. Modern Warfare III celebrates the 20th anniversary of Call of Duty with one of the largest collections of Multiplayer maps ever assembled both fan favorites and brand-new maps. The 16 launch maps from Modern Warfare 2 (2009) have been updated with new modes and gameplay features and will be available from launch, while more than 12 new 6v6 maps will fuel the post-launch seasons.",70.00,25,"2023-11-10"),

("Car Mechanic Simulator 2021","Car Mechanic Simulator 2021 is a new production with a well-established player base. Start as a new car garage owner and work your way up to a service empire. Get your hands dirty in a simulation game with incredibly realistic detail. Get ready to work on 4000+ unique parts and over 72 cars. Roll up your sleeves and immerse yourself in an insanely realistic garage environment.",25.00,25,"2021-08-11"),

("Team Fortress Classic","Team Fortress Classic, one of the most popular online action games of all time, features more than nine character classes from medic to spy to demolisher who compete uniquely of online team warfare. Each character class has unique weapons, items and abilities, and teams compete online in a variety of game modes.",24.00,25,"1999-04-01"),

("Watch_Dogs 2","Watch Dogs 2 is the sequel to the first game in the series, and we recently learned that it will be getting a third edition shortly. It''s a third-person action-adventure game set in an open world. You play as Marcus Holloway, a rebel trying to thwart the city authorities'' attempts to control the population using high-tech surveillance equipment. Marcus Holloway is a member of a hacktivist gang, one of their best members, and it''s his job to carry out missions, bringing supporters to the gang, known as DedSec.",5.00,25,"2016-11-29"),

("GTA V","Grand Theft Auto V is an action-adventure game, the fifth in the GTA series. As with the other games in the series, you gain experience by committing crimes. The game alternates between third-person and first-person narrative, and you''ll play as three criminals, committing robberies and trying to avoid a particular government agency. You don''t just choose a character to play as, as the narrative allows you to switch from one character to another. The game is set in the fictional city of San Andreas, which is based on the Southern California way of life. Although much of the game''s scripted action takes place in the city, the world is much larger than in the previous GTA and players can explore it freely. The city is in Blaine County, close to another city, Los Santos (both equally fictional) and all areas can be accessed from the start of the game.",10.00,25,"2015-04-14"),

("Red Dead Redemption 2","Red Dead Redemption 2 is an open-world action-adventure game in which the player can roam freely and play in third-person, while reverting to first-person in simulation mode. The player can commit crimes, but must then be ready to be hunted down by the forces of law and order, ready to bring the full force of the law to bear against the evildoer! RDR2, as it is affectionately known, was released on other platforms before the PC release, earning it the title of best-selling game of all time, before the figures for the PC game were included. The reason for the game''s popularity is not hard to see.",16.00,25,"2019-12-05");

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
(1,1), (5,1),
(1,2), (5,2),
(1,3), (5,3),
(1,4), (3,4), (5,4),
(2,5), (5,5),
(1,6), (2,6), (6,6),
(2,7), (4,7),
(3,8), (4,8), (7,8),
(1,9), (3,9), (5,9),
(1,10), (3,10), (5,10),
(1,11), (3,11), (5,11),
(2,12), (3,12), (4,12),
(4,13), (5,13),
(1,14), (5,14),
(1,15), (5,15), (7,15),
(2,16), (5,16), (6,16),
(2,17), (5,17), (6,17),
(2,18), (6,18),
(1,19), (2,19), (6,19),
(1,20), (2,20), (5,20), (7,20),
(1,21), (5,21);

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
( 'David', 'secret', 'd1@ku.com', 'Tav', CURDATE(), 'Client', 3, 0 ),
( 'kevin', 'secret', 'd2@ku.com', 'Tav', CURDATE(), 'Modo', 7, 0 ),
( 'Romain', 'secret', 'd3@ku.com', 'Tav', CURDATE(), 'Modo', 7, 0 ),
( 'Yann', 'secret', 'd4@ku.com', 'Tav', CURDATE(), 'Client', 3, 0 ),
( 'CYTech', 'c7267d9b7abd409c7ceb3cb7a8a43adc99f67eb856fcf71c1e884b4d0e9a5d35', 'cytech@gmail.com', 'Tav', CURDATE(), 'Admin', 7, 0 ),
( 'Lucas', 'secret', 'd5@ku.com', 'Tav', CURDATE(), 'Client', 3, 0 );

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
