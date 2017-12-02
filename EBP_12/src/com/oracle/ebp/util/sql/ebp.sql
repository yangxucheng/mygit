
drop database IF EXISTS ebp;
create database ebp;
use ebp;


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) PRIMARY KEY auto_increment,
  `username` varchar(20) NOT NULL,	
  `password` varchar(20) NOT NULL,  
  `name` varchar(255) NOT NULL,	
  `gender` int NOT NULL,		
  `age` int NOT NULL,           
  `idCard` varchar(18) NOT NULL,  
  `address` varchar(255) NOT NULL, 
  `telno` varchar(15) NOT NULL,    
 
  `regTime` timestamp NOT NULL default CURRENT_TIMESTAMP, 
  `balance` double(10,2) default 0.00,	
  `status` int(11) default 1		
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) PRIMARY KEY auto_increment,    
  `commitTime` timestamp NOT NULL default CURRENT_TIMESTAMP, 
  `amount` double(10,2) NOT NULL , 
  `uid` int(11) NOT NULL,           
  FOREIGN KEY(uid) REFERENCES user(uid)
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `orderList`;
CREATE TABLE `orderList` (
  `lid` int(11) PRIMARY KEY auto_increment, 
  `descs` varchar(255) NOT NULL,      
  `price` double(10,2) NOT NULL,      
  `quantity` int(11) NOT NULL,		
  `amount` double(10,2) NOT NULL,      
  `oid` int(11) NOT NULL,  
  `tid` int(11) NOT NULL,
   FOREIGN KEY(oid) REFERENCES orders(oid)
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;



DROP TABLE IF EXISTS `adminUser`;
CREATE TABLE `adminUser` (
  `aid` int(11) PRIMARY KEY auto_increment,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL  
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket` (
  `tid` int(11) PRIMARY KEY auto_increment,  
  `descs` varchar(255) NOT NULL,   
  `startTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `amount` int(11) NOT NULL,		
  `balance` int(11) NOT NULL,		
  `price` double(10,2) NOT NULL,	
  `status` int				
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `ticketdetail`;
CREATE TABLE `ticketdetail` (              
  `tdid` int(11) PRIMARY KEY auto_increment,
  `tId` int(11) NOT NULL,					
  `descs` varchar(255) NOT NULL,			
  `images` varchar(255) NOT NULL, 			
  `sequence` varchar(255) NOT NULL, 		
  FOREIGN KEY(tId) REFERENCES ticket(tid)   
)DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

DROP TABLE IF EXISTS `shoppingcart`;         
CREATE TABLE `shoppingcart` (
  `scid` int(11) PRIMARY KEY auto_increment,			
  `addTime` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `userId` int(11) NOT NULL,
  FOREIGN KEY(userId) REFERENCES user(uid)
)DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `shoppingcartdetail`;              
CREATE TABLE `shoppingcartdetail` (
  `scdid` int(11) PRIMARY KEY auto_increment,			
  `scid` int(11) NOT NULL,								
  `tId` int(11) NOT NULL,								
  `quantity` int(11) NOT NULL,							
  FOREIGN KEY(scid) REFERENCES shoppingcart(scid),
  FOREIGN KEY(tId) REFERENCES ticket(tid)
)DEFAULT CHARSET=utf8;


insert into user values(1, 'jack', '123456', 'jack', 1, 21,'13648783263278847X', 'jbbjhkjl', '13801380000', '2012-09-09', 0, 1);

insert into adminUser values(1, 'admin', '123456');

insert into orders values(1, '2015-08-14 10:20:28', 200, 1);
insert into orders values(2, '2015-08-14 16:39:52', 300, 1);

insert into orderlist values(1, 'addv', 100, 2, 200, 1);
insert into orderlist values(2, 'kjigh', 100, 2, 200, 2);
insert into orderlist values(3, 'dfasdf', 50, 2, 100, 2);

insert into ticket values(1, 'gdutyidg', '2015-08-13 08:30:00', 1200, 380, 86.00, 1);
insert into ticket values(2, 'kwegyhb', '2015-08-25 10:12:00', 200, 180, 186.00, 1);
insert into ticket values(3, 'ryg', '2015-05-26 10:56:00', 800, 320, 72.00, 1);
insert into ticket values(4, 'fgh', '2015-05-27 12:30:00', 300, 68, 65.00, 1);
insert into ticket values(5, 'ewrg', '2015-05-28 23:05:00', 650, 310, 90.00, 1);
insert into ticket values(6, 'asdvhg', '2015-08-12 01:22:00', 860, 120, 230.00, 1);
insert into ticket values(7, 'tdgf', '2015-08-13 06:15:00', 260, 30, 89.00, 1);
insert into ticket values(8, 'yre', '2015-08-29 22:30:00', 430, 10, 180.00, 0);
insert into ticket values(9, 'dvfb', '2015-08-14 21:38:00', 690, 62, 120.00, 1);
insert into ticket values(10, 'fbfb', '2015-08-15 15:29:00', 560, 120, 230.00, 1);
insert into ticket values(11, '3wds', '2015-08-16 17:32:00', 340, 0, 215.00, 0);
insert into ticket values(12, 'uyihg', '2015-08-17 13:00:00', 980, 620, 390.00, 1);
insert into ticket values(13, 'yufgv', '2015-08-18 16:03:00', 560, 80, 268.00, 1);
insert into ticket values(14, 'trgfvb', '2015-08-19 09:20:00', 268, 30, 32.00, 1);
insert into ticket values(15, 'ujhng', '2015-08-20 09:56:00', 128, 108, 67.00, 1);
insert into ticket values(16, 'edc', '2015-08-21 11:30:00', 120, 98, 53.00, 1);
insert into ticket values(17, 'nhju', '2015-08-11 14:23:00', 190, 36, 99.00, 1);
insert into ticket values(18, 'ytfd', '2015-08-23 17:48:00', 200, 8, 96.00, 1);
insert into ticket values(19, 'jmhngfvc', '2015-08-24 20:32:00', 330, 19, 196.00, 1);
