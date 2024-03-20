CREATE DATABASE blog_db;
\c blog_db;
-- blogとtagをn:nでつなぐ
create table if not exists blog (
  title text primary key,
  summary text not null
);

create table if not exists tag (
  name text primary key
);

create table if not exists blog_tag (
  blog_title text references blog(title),
  tag_name text references tag(name),
  primary key (blog_title, tag_name)
);