drop table if exists VideoGameTheme;
drop table if exists ClientDiscount;
drop table if exists History;
drop table if exists Discount;
drop table if exists Cart;
drop table if exists VideoGame;
drop table if exists Theme;
drop table if exists Orders;
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

create table if not exists VideoGameTheme
(
    themeId     int not null,
    videoGameId int not null,
    constraint PK_VideoGameTheme PRIMARY KEY (themeId, videoGameId),
    constraint FK_themeId foreign key (themeId) references Theme (themeId) on delete cascade,
    constraint FK_videoGameIdTheme foreign key (videoGameId) references VideoGame (videoGameId) on delete cascade
);

create table if not exists User
(
    userId            int                              not null auto_increment,
    userName          varchar(50)                      not null,
    userPassword      varchar(50)                      not null,
    userMail          varchar(50)                      not null,
    userAddress       varchar(50)                      not null,
    userCreated       date       default (CURDATE()),
    isActive          tinyint(1) default (1),
    userType          enum ('Client', 'Admin', 'Modo') NOT NULL,
    userRight         int                              not null,
    userHistoryId     int                              not null,
    userFidelityPoint int        default (0),
    constraint PK_idUser PRIMARY KEY (userId),
    index (userHistoryId)
);

INSERT INTO User (
    userName,
    userPassword,
    userMail,
    userAddress,
    userCreated,
    userType,
    userRight,
    userHistoryId,
    userFidelityPoint
) VALUES 
( "David", "secret", "d@ku.com", "Tav", CURDATE(), 'Client', 3, 0, 0 ),
( "kevin", "secret", "d@ku.com", "Tav", CURDATE(), 'Modo', 7, 0, 0 ),
( "Romain", "secret", "d@ku.com", "Tav", CURDATE(), 'Modo', 7, 0, 0 ),
( "Yann", "secret", "d@ku.com", "Tav", CURDATE(), 'Client', 3, 0, 0 ),
( "Lucas", "secret", "d@ku.com", "Tav", CURDATE(), 'Client', 3, 0, 0 );

create table if not exists History
(
    historyId         int     not null,
    videoGameId       int     not null,
    videoGamePrice    decimal not null,
    videoGameQuantity int     not null,
    constraint FK_videoGameIdHistory foreign key (videoGameId) references VideoGame (videoGameId),
    constraint FK_historyId foreign key (historyId) references User (userHistoryId)
);


create table if not exists Discount
(
    discountId     int not null auto_increment,
    discountAmount int not null,
    videoGameId    int not null,
    constraint PK_discountId PRIMARY KEY (discountId),
    constraint FK_videoGameId foreign key (videoGameId) references VideoGame (videoGameId)
);
