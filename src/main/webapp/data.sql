USE mysns;

INSERT INTO user VALUES("kim@abc.com", "111", "��ù�", now());
INSERT INTO user VALUES("lee@abc.com", "111", "�̼���", now());
INSERT INTO user VALUES("kwon@abc.com", "111", "����", now());

INSERT INTO feed(id, content) VALUES("kim@abc.com", "Hello");
INSERT INTO feed(id, content) VALUES("kim@abc.com", "Aloha");