
drop  table cmmn_cd;

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

 
drop table  admin_master;
create table admin_master(
adm_id varchar(30) not null primary key ,
adm_nm varchar(50) not null  ,
adm_vnm varchar(50) not null  ,
adm_pw varchar(200) not null  ,
emp_id varchar(30) not null  ,
use_yn varchar(1) not null  default 'Y',
proc_dt datetime not null  default now(),
mod_dt datetime   ,
exp_dt datetime   ,
proc_id varchar(30) not null  ,
mod_id varchar(30)   ,
exp_id varchar(30)   ,
role varchar(300)   );

select * from ctgry_mng;

drop table  prod_master;
create table prod_master(
prod_no int not null primary key auto_increment,
ctgry_no int not null  ,
prod_nm varchar(200) not null  ,
main_img varchar(300)   ,
price int   ,
point int   ,
qty int   ,
dc_price int   ,
etc1 varchar(100)   ,
etc2 varchar(100)   ,
etc3 varchar(100)   ,
etc4 varchar(100)   ,
etc5 varchar(100)   ,
use_yn varchar(1) not null  default 'Y',
proc_id varchar(30) not null  ,
proc_dt datetime not null  default now(),
mod_id varchar(30)   ,
mod_dt datetime   );

drop table  prod_image;
create table prod_image(
img_no int not null primary key auto_increment,
prod_no int not null  ,
sub_img varchar(300) not null  ,
proc_id varchar(30) not null  ,
proc_dt datetime not null  default now());

drop table  post_mng;
create table post_mng(
pst_no int not null primary key auto_increment,
pst_gb    varchar(1) not null  ,
pst_ttl varchar(200) not null  ,
wrt_id varchar(30) not null  ,
aprv_id varchar(30) not null  ,
strt_ymd datetime not null  ,
end_ymd datetime not null  ,
file_nm varchar(300)   ,
proc_dt datetime not null  default now(),
mod_dt datetime   ,
req_id varchar(30)   ,
req_dt datetime   ,
aprv_dt datetime   );

drop table user_master;
create table user_master(
user_no int not null primary key auto_increment,
user_id varchar(30) not null unique ,
user_pw varchar(200) not null  ,
user_nm varchar(50) not null  ,
user_home varchar(50)   ,
user_phone varchar(50) not null  ,
user_email varchar(200) not null  ,
birth_ymd date not null  ,
zipcode varchar(10) not null  ,
addr varchar(100) not null  ,
addr_detail varchar(200) not null  ,
use_yn varchar(1)   default 'Y',
user_dt datetime   default now()  );

drop table addr_manage;
create table addr_manage(
addr_no int not null primary key auto_increment,
user_id varchar(30) not null  ,
addr_nm varchar(50) not null  ,
addr_gb varchar(30)   ,
addr_nik varchar(20)   ,
addr_tel varchar(20) not null  ,
zipcode varchar(10) not null  ,
addr varchar(100) not null  ,
addr_detail varchar(200) not null    );

drop table order_master;
create table order_master(
order_id varchar(30) not null  ,
user_id varchar(30) not null  ,
od_seq int not null  default 1,
tot_qty int   ,
order_dt datetime not null  default now(),
primary key(order_id, order_dt, od_seq) );


drop table order_detail;
create table order_detail(
od_no int not null primary key auto_increment,
user_id varchar(30) not null  ,
prod_id varchar(50) not null  ,
order_id varchar(50) not null  ,
od_seq int not null  default 1,
addr_no varchar(50) not null  ,
point varchar(50) not null  ,
buy_dt datetime not null  default now(),
payback_yn varchar(1)   ,
cs_yn varchar(1)     );

drop table cart;
create table cart(
cart_no int not null primary key auto_increment,
user_id varchar(30) not null  ,
prod_id varchar(50) not null  ,
op_code varchar(50)   ,
qty int not null  default 1,
buy_yn varchar(50) not null  ,
cart_dt datetime not null  default now()  );

drop table user_wish;
create table user_wish(
wish_no int not null primary key auto_increment,
user_id varchar(30) not null  ,
prod_id varchar(50) not null  ,
op_code varchar(50)     );

drop table cs_master;
create table cs_master(
cs_no int not null primary key auto_increment,
user_id varchar(30) not null  ,
prod_id varchar(100) not null  ,
cs_code varchar(50) not null  ,
cs_dt datetime not null  default now(),
cs_con varchar(500) not null  ,
proc_sts varchar(1) not null  default '1',
sts_dt datetime   );

drop table cs_reply;
create table cs_reply(
csre_no int not null primary key auto_increment,
cs_no varchar(30) not null  ,
csre_con varchar(500) not null  ,
proc_id varchar(30) not null  ,
proc_dt datetime not null  default now());

drop table qna_master;
create table qna_master(
qna_no int not null primary key auto_increment,
user_id varchar(30) not null  ,
prod_id varchar(100) not null  ,
qna_code varchar(30) not null  ,
qna_pw varchar(200) not null  ,
qna_dt datetime not null  default now(),
qna_con varchar(500) not null  ,
proc_sts varchar(1) not null  default '1');

drop table qna_reply;
create table qna_reply(
qr_no int not null primary key auto_increment,
qna_no varchar(30) not null  ,
qr_con varchar(500) not null  ,
proc_id varchar(30) not null  ,
proc_dt datetime not null  default now());

drop table rv_master;
create table rv_master(
rv_no int not null primary key auto_increment,
user_id varchar(30) not null  ,
prod_id varchar(30) not null  ,
rv_star int not null  ,
rv_con varchar(500) not null  ,
rv_img varchar(500)   ,
review_dt datetime not null  default now());

drop table rv_reply;
create table rv_reply(
rr_no int not null primary key auto_increment,
rv_no varchar(50) not null  ,
rr_con varchar(500) not null  ,
proc_id varchar(50) not null  ,
proc_dt datetime not null  default now());







