USE mysns;

INSERT INTO user VALUES("kim@abc.com", "111", "±è½Ã¹Î", now());
INSERT INTO user VALUES("lee@abc.com", "111", "ÀÌ¼ø½Å", now());
INSERT INTO user VALUES("kwon@abc.com", "111", "±ÇÀ²", now());

INSERT INTO feed(id, content) VALUES("kim@abc.com", "Hello");
INSERT INTO feed(id, content) VALUES("kim@abc.com", "Aloha");