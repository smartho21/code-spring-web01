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

alter table tbl_board add constraint pk_board 
primary key (bno);

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