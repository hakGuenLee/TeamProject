-- drop  table cmmn_cd;

create table cmmn_cd(
cm_no int not null primary key auto_increment,
cm_cd varchar(10) not null  ,
cm_nm varchar(100) not null  ,
item_cd varchar(10) not null  ,
item_nm varchar(50) not null  ,
use_yn varchar(2) not null  default 'Y',
proc_id varchar(30) not null  ,
proc_dt datetime   default now()
);

-- drop table emp_info;
create table emp_info(
emp_id varchar(30) not null primary key ,
emp_nm varchar(50) not null  ,
emp_grd varchar(50) not null  ,
emp_role varchar(50) not null  ,
dept_cd varchar(30) not null  ,
dept_nm varchar(50) not null  ,
cell_phone varchar(15) not null  ,
off_tel varchar(15) not null  ,
email varchar(50) not null  );

--  drop table ctgry_mng;
create table ctgry_mng(
ctgry_no int not null primary key auto_increment,
ct_cd1 varchar(10) not null  ,
ct_nm1 varchar(50) not null  ,
ct_seq1 int not null  ,
ct_cd2 varchar(10)   ,
ct_nm2 varchar(50)   ,
ct_seq2 int   ,
use_yn varchar(1) not null  default 'Y',
proc_id varchar(30)   ,
proc_dt datetime not null  default now());

