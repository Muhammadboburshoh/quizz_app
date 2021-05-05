-- Data Model

create extension pgcrypto;

create table users (
	user_id int4 generated by default as identity primary key,
	name character varying(40) not null,
	username character varying(32) not null,
	password character varying(60) not null
);

create table subjects (
	subject_id int4 generated by default as identity primary key,
	name character varying(40) not null,
	deadline int2 not null,
	user_id int4 not null references users (user_id)
);

create table questions (
	question_id int4 generated by default as identity primary key,
	content character varying(256) not null,
	level char(1) not null,
	type int2 default 1,
	hint character varying(128) not null,
	subject_id int4 not null references subjects (subject_id)
);

create table options (
	option_id int4 generated by default as identity primary key,
	content character varying(256) not null,
	is_correct boolean default false
);

create table quizzes (
	quizz_id int4 generated by default as identity primary key,
	started_at timestamp with time zone default current_timestamp,
	finished_at timestamp with time zone null,
	subject_id int4 not null references subjects (subject_id),
	user_id int4 not null references users (user_id)
);

create table answers (
	answer_id int4 generated by default as identity primary key,
	quizz_id int4 not null references quizzes (quizz_id),
	option_id int4 not null references options (option_id)
);