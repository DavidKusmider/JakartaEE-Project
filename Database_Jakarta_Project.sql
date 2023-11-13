drop table if exists VideoGameTheme;
drop table if exists CartRow;
drop table if exists History;
drop table if exists Discount;
drop table if exists VideoGame;
drop table if exists Theme;
drop table if exists User;

create table if not exists VideoGame
(
    videoGameId          int          not null auto_increment,
    videoGameName        varchar(50)  not null,
    videoGameDescription varchar(200) not null,
    videoGamePrice       decimal      not null,
    videoGameStock       int          not null,
    releaseDate          Date         not null,
    constraint PK_VideoGame PRIMARY KEY (videoGameId)
);

INSERT INTO VideoGame (
	videoGameName,
	videoGameDescription,
	videoGamePrice,
	videoGameStock,
	releaseDate
) VALUES
( "ARK : Survival Evolved", "primal", 23.99, 2,"2002-10-05"),
( "Outer Wilds", "Space", 9.99, 10,"2010-12-14"),
( "Battlefiel 1", "army", 10.99, 2,"2017-10-29"),
( "The Witcher 3 : Wild Hunt", "adventure", 30.99, 2,"2016-01-29"),
( "Undertale", "pixelart", 5.99, 2,"2016-8-25"),
( "Gris", "atmosphere", 20.99, 2,"2018-03-23"),
( "Gris", "atmosphere", 20.99, 2,"2018-03-23"),
( "Gris", "atmosphere", 20.99, 2,"2018-03-23"),
( "Gris", "atmosphere", 20.99, 2,"2018-03-23"),
( "Gris", "atmosphere", 20.99, 2,"2018-03-23");

create table if not exists Theme
(
    themeId   int         not null auto_increment,
    themeName varchar(50) not null,
    constraint PK_theme PRIMARY KEY (themeId)
);

INSERT INTO Theme (
	themeName
) VALUES
( "adventure" ),
( "horror");

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
( 1,1);

create table if not exists User
(
    userId            int                              not null auto_increment,
    userName          varchar(100)                     not null,
    userPassword      varchar(1000)                     not null,
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
