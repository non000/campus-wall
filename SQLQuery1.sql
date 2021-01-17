create database campus
go
use campus
go
--�û���
create table tser(
userid int primary key,--�˺�
tser_password varchar(15),  --����
tser_avatar varchar(255)not null,--ͷ��
tser_mailbox varchar(20),--����
tser_name varchar(7),--�ǳ�
tser_sex char(2) check(Tser_sex='��' or Tser_sex='Ů')not null,--�Ա�
tser_registration datetime, --ע��ʱ��
tser_birthday varchar(15) not null  --��������

)
go
--���±�
create table article(
article_id int not null identity(1000,1) primary key,--���º�
article_title varchar(20),--����
article_content varchar(800),--����
userid int foreign key references tser(userid),--�����û����˺ţ����
article_time datetime,--����ʱ��
)
go
--�������۱�
create table comments(
comments_id int not null identity(9000,1) primary key,--����id
article_id int foreign key references article(article_id),--����id�������
comments_comment varchar(800),--��������
commen varchar(800),--������
comments_userid int foreign key references tser(userid),--�������˺�
userid int foreign key references tser(userid),--�����û����˺ţ����
comments_time datetime,--����ʱ��
)
go
--���ޱ�
create table thumb(
thumb_id int not null identity(1000,1) primary key,--����ID
article_id int foreign key references article(article_id),--���ºţ������
thumb_type char(2) check(thumb_type='1' or thumb_type='2')not null,--��������
userid int foreign key references tser(userid),--�����û����˺ţ����
thumb_time datetime,--����ʱ��
)
go
--�г�
create table marketid(
marketid_id int  primary key,--�г�id
marketid_title varchar(20),--����
marketid_items varchar(50),--��Ʒ��Ϣ
marketid_Mount datetime,--��������
marketid_state varchar(50)--��Ʒ״̬
)
go
--ѧϰ���
create table learn(
learn_id int primary key,--id
learn_title varchar(20),--����
learn_content varchar(800),--����
learn_time datetime,--����ʱ��
)
go
--���ǽ
create table confession(
confession_id int primary key,--id
userid int foreign key references tser(userid),--�����û��������
confession_time datetime,--����ʱ��
confession_content varchar(800),--����
confession_viewed int identity(1000,1),--�������
)
go
--�����
create table opinion(
opinion_id int primary key,--id
opinion_content varchar(800),--����
opinion_time datetime,--����ʱ��
userid int foreign key references tser(userid),--�����û�
)
go
--ʧ������
create table found(
found_id int primary key,--id
found_content varchar(800),--����
found_time datetime,--ʱ��
found_Mount datetime,--��������
found_state char(2) check(found_state='1' or found_state='2'),--��Ʒ״̬
)
go


--�û�����
insert into tser
values('1802955','123456','','1802955330pp.com','ĬĬ','��','2020-12-10','1999-1-3'),
('14454554','147852','','15879523547pp.com','����','Ů','2020-12-11','1999-1-2');

--���±���
insert into article
values('��������ʱ������','������ֽɡ�����������Ƴ���','1802955','2020-12-11')
--�������۱���
insert into comments
values('1000','�ð��','����','1802955','14454554','2020-12-22')
--���ޱ�
insert into thumb
values('1000','1','1802955','2020-12-23')
--�г�
insert into marketid
values('1','����С��','�����','2020-12-25','δ')
--ѧϰ���
insert into learn
values('1','ѧϰ','���Ĵ�ʦ','2020-12-26')
--���ǽ
insert into confession
values('1','1802955','2020-12-26','��ϲ��')
--�����
insert into opinion
values('1','û�����','2020-12-28','1802955')
--ʧ������
insert into found
values('1','����','2020-12-24','2020-12-24','1')


