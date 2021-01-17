create database campus
go
use campus
go
--用户表
create table tser(
userid int primary key,--账号
tser_password varchar(15),  --密码
tser_avatar varchar(255)not null,--头像
tser_mailbox varchar(20),--邮箱
tser_name varchar(7),--昵称
tser_sex char(2) check(Tser_sex='男' or Tser_sex='女')not null,--性别
tser_registration datetime, --注册时间
tser_birthday varchar(15) not null  --出生日期

)
go
--文章表
create table article(
article_id int not null identity(1000,1) primary key,--文章号
article_title varchar(20),--标题
article_content varchar(800),--内容
userid int foreign key references tser(userid),--发表用户（账号）外键
article_time datetime,--发表时间
)
go
--文章评论表
create table comments(
comments_id int not null identity(9000,1) primary key,--评论id
article_id int foreign key references article(article_id),--文章id（外键）
comments_comment varchar(800),--评论内容
commen varchar(800),--父评论
comments_userid int foreign key references tser(userid),--父评论账号
userid int foreign key references tser(userid),--评论用户（账号）外键
comments_time datetime,--发布时间
)
go
--点赞表
create table thumb(
thumb_id int not null identity(1000,1) primary key,--点赞ID
article_id int foreign key references article(article_id),--文章号（外键）
thumb_type char(2) check(thumb_type='1' or thumb_type='2')not null,--点赞类型
userid int foreign key references tser(userid),--点赞用户（账号）外键
thumb_time datetime,--点赞时间
)
go
--市场
create table marketid(
marketid_id int  primary key,--市场id
marketid_title varchar(20),--标题
marketid_items varchar(50),--物品信息
marketid_Mount datetime,--挂载日期
marketid_state varchar(50)--商品状态
)
go
--学习天地
create table learn(
learn_id int primary key,--id
learn_title varchar(20),--标题
learn_content varchar(800),--内容
learn_time datetime,--发布时间
)
go
--表白墙
create table confession(
confession_id int primary key,--id
userid int foreign key references tser(userid),--发布用户（外键）
confession_time datetime,--发布时间
confession_content varchar(800),--内容
confession_viewed int identity(1000,1),--浏览次数
)
go
--意见箱
create table opinion(
opinion_id int primary key,--id
opinion_content varchar(800),--内容
opinion_time datetime,--发布时间
userid int foreign key references tser(userid),--发布用户
)
go
--失物招领
create table found(
found_id int primary key,--id
found_content varchar(800),--内容
found_time datetime,--时间
found_Mount datetime,--挂载日期
found_state char(2) check(found_state='1' or found_state='2'),--物品状态
)
go


--用户案列
insert into tser
values('1802955','123456','','1802955330pp.com','默默','男','2020-12-10','1999-1-3'),
('14454554','147852','','15879523547pp.com','晓欣','女','2020-12-11','1999-1-2');

--文章表案列
insert into article
values('在最美的时光里错过','撑着油纸伞，独彷徨在悠长，','1802955','2020-12-11')
--文章评论表案列
insert into comments
values('1000','好棒喔','厉害','1802955','14454554','2020-12-22')
--点赞表
insert into thumb
values('1000','1','1802955','2020-12-23')
--市场
insert into marketid
values('1','杂物小店','吹风机','2020-12-25','未')
--学习天地
insert into learn
values('1','学习','袈裟大师','2020-12-26')
--表白墙
insert into confession
values('1','1802955','2020-12-26','我喜欢')
--意见箱
insert into opinion
values('1','没有意见','2020-12-28','1802955')
--失物招领
insert into found
values('1','饭卡','2020-12-24','2020-12-24','1')


