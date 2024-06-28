Create Database DemoApp

Use DemoApp

Create Table People (
Id int identity(1,1) PRIMARY KEY,
Name Nvarchar(100) not null unique,
Surname Nvarchar(100) not null,
PhoneNumber Nvarchar(20) Default 'Teyin edilmeyib',
Email Nvarchar(100) unique not null,
Age int,
Gender CHAR(1), 
HasCitizenship bit,
CityId int Foreign Key References Cities(Id)
)

Create Table Countries (
Id int Primary Key identity(1,1),
Name Nvarchar(100) not null,
Area Decimal(18,2)
)

Create Table Cities (
Id int Primary Key identity(1,1),
Name Nvarchar(100) not null,
Area Decimal(18,2),
CountryId int Foreign Key References Countries(Id)
)

insert into Countries 
values
('Azerbaijan',86600.00),
('Russia', 17098242),
('United sa', 9833520),
('Poland', 322575),
('Germany',357592),
('Italy',302073),
('Turkiye', 783562)

insert into Cities
values
('Baku',2140, 1),
('Ganja', 3100, 1),
('Moscow',2511,2),
('Surgut', 354, 2),
('New York', 2309 ,3),
('Austin', 845.66 ,3),
('Warsaw',517, 4),
('Bydgoszcz', 176, 4),
('Leverkusen', 79, 5),
('Berlin', 891 ,5),
('Roma', 1285, 6 ),
('Milan', 181, 6),
('Istanbul',5461, 6),
('Burdur',7175, 6)

select * from People
select * from Cities

insert into People
values
('Inal', 'Guliyev', '+9947712234567','inalgg@code.edu.az',24,'K',0,1),
('Elcan', 'Shalanov', '+994551234567','elcangg@code.edu.az',21,'K',1,2),
('Nijat', 'Azizov', '+994512345678','nijataziz@code.edu.az',34,'K',0,1),
('Elnur', 'Gafarzada', '+994559874562','elnurmg@code.edu.az',19,'K',0,1),
('Salahaddin', 'Shahbazov', 'Teyin edilmeyib', 'salo@gmail.com',14,'K',0,13),
('Uzay', 'Mental', 'Teyin edilmeyib','uzaymental@gmail.com',16,'K',1,1),
('Sadiq', 'Resulzade', '+994779870908','resulzades@code.edu.az',24,'K',1,1)

create view task1 as
select p.Id, p.Name, p.Surname, p.PhoneNumber, p.Email, p.Age, p.Gender,
       ci.Name as City 
from People p
inner join Cities ci on p.CityId = ci.Id

Select * from task1


select * from Countries order by Area desc

select * from Cities order by Name

select count(*) from Countries where Area > 20000

select  Name, Area from Countries where Name like 'r%' order by Area desc;

select ci.Name as City, count(*) as PersonCount from People p inner join Cities ci on p.CityId = ci.Id group by ci.Name;

select ci.Name as City, count(*) as PersonCount from People p inner join Cities ci on p.CityId = ci.Id group by ci.Name having count(*) > 3;
