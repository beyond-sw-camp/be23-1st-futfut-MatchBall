create schema futsalMatchingSystem;

use futsalMatchingSystem;

CREATE TABLE user (
    ID bigint NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    login_id varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL,
    phone_number varchar(255) NOT NULL,
    status ENUM('Y', 'N') NOT NULL DEFAULT 'N',
    PRIMARY KEY (ID)
) COMMENT='사용자';

CREATE TABLE member (
    ID bigint NOT NULL AUTO_INCREMENT,
    userID bigint NOT NULL,
    account varchar(255) NOT NULL,
    pomCount int NOT NULL DEFAULT 0,
    PRIMARY KEY (ID),
    FOREIGN KEY (userID) REFERENCES user (ID)
) COMMENT='회원';

CREATE TABLE referee (
    ID bigint NOT NULL AUTO_INCREMENT,
    userID bigint NOT NULL,
    certificate varchar(255) NOT NULL ,
    pay_account varchar(255) NOT NULL,
    fee_rate int NOT NULL DEFAULT 3,
    PRIMARY KEY (ID),
    FOREIGN KEY (userID) REFERENCES user (ID)
) COMMENT='심판';


CREATE TABLE referee_payment (
    ID bigint NOT NULL AUTO_INCREMENT,
    refereeID bigint NOT NULL,
    paymentDate datetime NOT NULL ,
    payment int NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (refereeID) REFERENCES referee (ID)
) COMMENT='심판 정산 내역';

CREATE TABLE stadium (
    ID bigint NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    condition_text text,
    location varchar(255),
    max_count int NOT NULL,
    PRIMARY KEY (ID)
) COMMENT='구장';

CREATE TABLE stadium_option (
    ID bigint NOT NULL AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    PRIMARY KEY (ID)
) COMMENT='구장 옵션';

CREATE TABLE stadium_detail_option (
    ID bigint NOT NULL AUTO_INCREMENT,
    stadiumID bigint NOT NULL,
    optionID bigint NOT NULL,

    PRIMARY KEY (ID),
    UNIQUE KEY UQ_stadium_option (stadiumID, optionID),
    FOREIGN KEY (stadiumID) REFERENCES stadium (ID),
    FOREIGN KEY (optionID) REFERENCES stadium_option (ID)
) COMMENT='구장 상세';

CREATE TABLE matches (
    ID bigint NOT NULL AUTO_INCREMENT,
    stadiumID bigint NOT NULL,
    refereeID bigint NOT NULL,
    match_price int NOT NULL,
    date date NOT NULL,
    time time NOT NULL,
    member_count int NOT NULL,
    POM varchar(255),
    status ENUM('계획', '열림', '닫힘', '취소') NOT NULL DEFAULT '계획',
    PRIMARY KEY (ID),
    FOREIGN KEY (stadiumID) REFERENCES stadium (ID),
    FOREIGN KEY (refereeID) REFERENCES referee (ID)
) COMMENT='경기';

CREATE TABLE match_apply (
    ID bigint NOT NULL AUTO_INCREMENT,
    memberID bigint NOT NULL,
    matchesID bigint NOT NULL,
    status ENUM('승인', '대기', '환불') NOT NULL DEFAULT '대기',
    apply_price int NOT NULL DEFAULT 10000,
    payment_time datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    refund_time datetime NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (memberID) REFERENCES member (ID),
    FOREIGN KEY (matchesID) REFERENCES matches (ID)
) COMMENT='경기 신청';

CREATE TABLE pom_vote (
    ID bigint NOT NULL AUTO_INCREMENT,
    applyID bigint NOT NULL,
    voter_memberID bigint NOT NULL,
    voted_memberID bigint NULL,

    PRIMARY KEY (ID),
    FOREIGN KEY (applyID) REFERENCES match_apply (ID),
    FOREIGN KEY (voter_memberID) REFERENCES member (ID),
    FOREIGN KEY (voted_memberID) REFERENCES member (ID)
) COMMENT='투표';