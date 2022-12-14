/*Part3. 기본적인 웹게시물관리 SQL*/
create sequence seq_board;

create table tbl_board (
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate, 
  updatedate date default sysdate
);

alter table tbl_board add constraint pk_board primary key (bno);

insert into tbl_board (bno, title, content, writer) values ( seq_board.nextval, '테스트 제목', '테스트 내용','user00');
--재귀복사
insert into tbl_board (bno, title, content, writer) select seq_board.nextval,title, content, writer from tbl_board


/*Part4. Rest 방식과 Ajax를 이용하는 댓글 처리 SQL*/
create table tbl_reply(
	rno number(10,0),
	bno number(10,0),
	reply varchar2(1000) not null,
	replyer varchar2(50) not null,
	replyDate date default sysdate,
	updateDate date default sysdate
	);

create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key(rno);

alter table tbl_reply add constraint fk_reply_board
foreign key(bno) references tbl_board(bno);

--댓글 fk 생성
create index idx_reply on tbl_reply(bno desc, rno asc);

select rno, bno, reply, replyer, replydate, updatedate
from (
select /*+INDEX(tbl_reply idx_reply) */
	rownum rn, bno, rno, reply, replyer, replyDate,updatedate
from tbl_reply
where bno = 6656
and rno>0
and rownum<=20
)
where rn >10;


/*Part5. AOP와 트랜잭션*/
--예제 테이블 생성
create table tbl_sample1(col1 varchar2(500));
select * from tbl_sample1;
delete  from tbl_sample1;
create table tbl_sample2(col2 varchar2(50));
select * from tbl_sample2;

--tbl_board 테이블에  replyCnt칼럼추가
alter table tbl_board add (replycnt number default 0);

update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno)

/*Part6. 파일 업로드 처리*/
create table tbl_attach(
uuid varchar2(100) not null,
uploadPath varchar2(200) not null,
fileName varchar2(100) not null,
filetype char(1) default 'I',
bno number(10,0)
);

alter table tbl_attach add constraint pk_attach primary key(uuid);
alter table tbl_attach add constraint fk_board_attach foreign key(bno)
references tbl_board(bno);

/*part7 spring web security를 이용한 처리*/
create table users(
	username varchar2(50) not null primary key,
	password varchar2(50) not null,
	enable char(1) default '1');
		
create table authorities (
	username varchar2(50) not null,
	authority varchar2(50) not null,
	constraint fk_authorities_sers foreign key(username) references users(username));

create unique index ix_auth_username on authorities(username, authority);

insert into users(username, password) values ('user00', 'pw00');
insert into users(username, password) values ('member00', 'pw00');
insert into users(username, password) values ('admin00', 'pw00');

insert into authorities(username, authority) values ('user00', 'ROLE_USER');
insert into authorities(username, authority) values ('member00', 'ROLE_MANAGER');
insert into authorities(username, authority) values ('admin00', 'ROLE_ADMIN');
insert into authorities(username, authority) values ('admin00', 'ROLE_MANAGER');
commit;

create table tbl_member(
	userid varchar2(50) not null primary key,
	userpw varhcar2(100) not null,
	username varchar2(100) not null,
	regdate date default sysdate,
	enabled char(1) default '1'
);
	
create table tbl_member_auth(
	userid varchar2(50) not null,
	auth varchar2(50) not null,
	constraint fk_member_auth foreign key(userid) references tbl_member(userid)
);

/*remember-me 기능 구형*/
create table persistent_logins(
	username varchar(64) not null,
	series varchar(64) primary key,
	token varchar(64) not null,
	las_used timestamp not null
);