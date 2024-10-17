create database Colegio

use Colegio
go

create table School
(
    SchoolId int primary key identity,
    SchoolName varchar(50) not null,
    Description varchar(1000) null,
    Address varchar(50) null,
    Phone varchar(50) null,
    PostCode varchar(50) null,
    PostAddress varchar(50) null
);


create table Class
(
    ClassId int primary key identity,
    SchoolId int not null,
    ClassName varchar(50) not null,
    Description varchar(1000) null,
    foreign key (SchoolId) references School(SchoolId)
);



create table Course
(
    CourseId int primary key identity,
    CourseName varchar(50) not null,
    SchoolId int not null,
    Description varchar(1000) null,
    foreign key (SchoolId) references School(SchoolId)
);

create table Student
(
    StudentId int primary key identity,
    ClassId int not null,
    Studentname varchar(100) not null,
    Studentnumber varchar(20) not null,
    Totalgrade float null,
    Address varchar(100) null,
    Phone varchar(20) null,
    Email varchar(100) null,
    foreign key (ClassId) references class(ClassId)
);

create table Teacher
(
    TeacherId int primary key identity,
    SchoolId int not null,
    TeacherName varchar(50) not null,
    Description varchar(1000) null,
    foreign key (SchoolId) references School(SchoolId)
);


create table StudentCourse
(
    StudentId int not null,
    CourseId int not null,
    primary key (StudentId, CourseId),
    foreign key (StudentId) references Student(StudentId),
    foreign key (CourseId) references Course(CourseId)
);

create table TeacherCourse
(
    TeacherId int not null,
    CourseId int not null,
    primary key (TeacherId, CourseId),
    foreign key (TeacherId) references Teacher(TeacherId),
    foreign key (CourseId) references Course(CourseId)
);

create table Grade
(
    GradeId int primary key identity,
    StudentId int not null,
    CourseId int not null,
    Grade float null,
    Comment varchar(1000) null,
    foreign key (StudentId) references Student(StudentId),
    foreign key (CourseId) references Course(CourseId)
);


