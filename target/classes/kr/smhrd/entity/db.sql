drop table board;
drop table reply;
drop table member;

create table board(
   idx int not null auto_increment,
   memId varchar(20) not null,
   title varchar(200) not null,
   content varchar(2000) not null,
   writer varchar(20) not null,
   indate datetime default now(),
   count int default 0,
   primary key(idx)
);

create table reply(
   idx int not null auto_increment,
   memId varchar(20) not null,
   title varchar(200) not null,
   content varchar(2000) not null,
   writer varchar(20) not null,
   indate datetime default now(),
   count int default 0,
   bgroup int,
   bseq int,
   blevel int,
   bdelete int default 0,
   primary key(idx)
);
select * from reply;
--        NULL


select IFNULL(max(bgroup)+1, 0) from reply;

insert into board(title, content, writer)
values('스프링 MVC','스프링 MVC','홍길동');

insert into board(title, content, writer)
values('스프링 BOOT','스프링 BOOT','이수환');

insert into board(title, content, writer)
values('스프링 Security','스프링 Security','박매일');



create table member(
   memId varchar(30) not null,
   memPwd varchar(30) not null,
   memName varchar(30) not null,
   primary key(memId)
);

insert into member values('smhrd01','smhrd01','관리자');
insert into member values('smhrd02','smhrd02','박매일');
insert into member values('smhrd03','smhrd03','홍길동');

select * from board;
select * from member;
select * from reply;






