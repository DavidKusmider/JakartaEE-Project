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
    userRight         int                              ,
    userHistoryId     int                              not null,
    userFidelityPoint int        default (0),
    constraint PK_idUser PRIMARY KEY (userId),
    index (userHistoryId)
);

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