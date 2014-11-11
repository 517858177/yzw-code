create database music;

/**
 * SQL for MySQL
 */

/**
 * �û���
 */
create table user(
  /* �û�ID */
  id int(10) primary key auto_increment,
  /* �û��� */
  user_name varchar(50) not null,
  /* ���� */
  password varchar(50) not null,
  /* �ǳ� */
  nick_name varchar(50) not null,
  /* ͼƬ·�� */
  photo_url varchar(100),
  /* ��ʵ���� */
  real_name varchar(50) not null,
  /* �Ա� */
  gender int(1) not null,
  /* ���� */
  birthday date,
  /* �ֻ� */
  phone varchar(20),
  /* �������� */
  email varchar(50),
  /* ��ַ */
  address varchar(100),
  /* ע��ʱ�� */
  register_date date not null
);

/**
 * �����ֵ��
 */
create table dictionary(
  /* �ֵ�ID */
  id int(10) primary key auto_increment,
  /* �ֵ����� */
  name int(1) not null,
  /* �ֵ�ֵ */
  value varchar(50) not null
);

/**
 * ���ֱ�
 */
create table singer(
  /* ����ID */
  id int(10) primary key auto_increment,
  /* �������� */
  name varchar(50) not null,
  /* ������д */
  abbreviate varchar(20) not null,
  /* ͼƬ·�� */
  photo_url varchar(100),
  /* �����Ա� */
  gender int(1) not null,
  /* ���� */
  birthday date,
  /* �������� */
  description varchar(500),
  /* ������� */
  /* ��� */
  type_id int(10) not null,
  /* ��� */
  constraint fk_singer_dic foreign key (type) references dictionary(id)
);

/**
 * ������
 */
create table music(
  /* ����ID */
  id int(10) primary key auto_increment,
  /* �������� */
  name varchar(50) not null,
  /* ������д */
  abbreviate varchar(20) not null,
  /* ͼƬ·�� */
  photo_url varchar(100),
  /* ��Ƶ·�� */
  audio_url varchar(100) not null,
  /* ���·�� */
  lyric_url varchar(100),
  /* ��Ƶ·�� */
  video_url varchar(100),
  /* ����ID */
  /* ��� */
  singer_id int(10),
  /* ������� */
  /* ��� */
  type_id int(10) not null,
  /* ��� */
  constraint fk_music_dic foreign key (type) references dictionary(id)
);

/**
 * �ղر�
 */
create table collection(
  /* �ղ�ID */
  id int(10) primary key auto_increment,
  /* ͼƬ·�� */
  photo_url varchar(100),
  /* �û�ID */
  /* ��� */
  user_id int(10) not null,
  /* ����ID */
  /* ��� */
  singer_id int(10),
  /* ����ID */
  /* ��� */
  music_id int(10),
  /* �ղ����� */
  collect_date date not null,
  /* ��� */
  constraint fk_collection_user foreign key (user_id) references user(id),
  /* ��� */
  constraint fk_collection_singer foreign key (singer_id) references singer(id),
  /* ��� */
  constraint fk_collection_music foreign key (music_id) references music(id)
);