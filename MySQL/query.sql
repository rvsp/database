-- select default database
USE student_records;
-- describe table
DESC profile_status;
-- rename table
RENAME TABLE friends TO firend_list;
ALTER TABLE firend_list RENAME friends;


-- create table with existing table
CREATE TABLE post_temp AS SELECT post_id, post_title FROM posts;
-- copying existing table structure
CREATE TABLE IF NOT EXISTS likes_temp LIKE likes;
-- adding, removing & modify table columns
ALTER TABLE user_profile ADD gender VARCHAR(15);
ALTER TABLE user_profile MODIFY COLUMN gender VARCHAR(20);
ALTER TABLE user_profile DROP COLUMN gender;
-- adding, modify, remove the index
CREATE INDEX post_title_index ON posts(post_title);
SHOW INDEX FROM posts;
DROP INDEX post_title_index ON posts;
-- creating, modifying, droping views
CREATE VIEW user_profile_view AS SELECT profile_id,user_name,user_join_date FROM user_profile WHERE profile_status_status_id = 2;
CREATE OR REPLACE VIEW user_profile_view AS SELECT profile_id,user_name FROM user_profile WHERE profile_status_status_id = 2;
SELECT * FROM user_profile_view;
DROP VIEW user_profile_view;
-- updating existing sinle & multiple records
SET SQL_SAFE_UPDATES=0;
UPDATE profile_status SET status_name='Deactivated' WHERE status_id=3;
SELECT * FROM profile_status;
UPDATE user_profile SET profile_status_status_id=3 WHERE profile_last_name IN ('a','d');
SELECT * FROM user_profile;
-- deleting single & all records
DELETE FROM user_profile WHERE profile_status_status_id=2;
DELETE FROM likes;
-- select statments;
SELECT * FROM posts;
SELECT post_id, CONCAT(post_content, '(',post_title,')') FROM posts;
SELECT post_id, CONCAT(post_content, '(',post_title,')') AS concat_values FROM posts;

-- 27-9-2019
-- Numeric function
SELECT CEILING(3.46);
SELECT CEIL(-6.43);
SELECT COS(90);
SELECT COT(1);
SELECT FLOOR(7.55);
SELECT FORMAT(423423234.65434453,2);
SELECT LOG(45);
SELECT MOD(29,3);
SELECT PI();
SELECT POWER(3,3);
SELECT SQRT(49);
-- String function
SELECT CHAR_LENGTH("text");
SELECT CONCAT('My', 'S', 'QL');
SELECT CONCAT_WS(',','First name','Last Name' );
SELECT FORMAT(12332.123456, 4);
SELECT HEX(255);
SELECT INSERT('Quadratic', 3, 4, 'What');
SELECT INSTR('foobarbar', 'bar');
SELECT LEFT('foobarbar', 5);
SELECT LOWER('QUADRATICALLY');
SELECT LTRIM('  barbar');
SELECT REPLACE('www.mysql.com', 'w', 'Ww');
SELECT REVERSE('abcd');
SELECT RIGHT('foobarbar', 4);
-- date functions
SELECT ADDDATE('1998-01-02', 31);
-- oracle SELECT ADD_MONTHS( DATE '2016-02-29', 1 ) FROM dual;
SELECT DATEDIFF('1997-12-31 23:59:59','1997-12-30');
SELECT EXTRACT(YEAR FROM '1999-07-02');
-- oracle SELECT EXTRACT( YEAR FROM TO_DATE( '31-Dec-1999 5:30:20 ',  'DD-Mon-YYYY HH24:MI:SS' ) ) YEAR FROM  DUAL;
SELECT DAYNAME('1998-02-05');
-- oracle SELECT NEXT_DAY( DATE '2000-01-01', 'SUNDAY' ) FROM dual;
SELECT HOUR('10:05:03');
SELECT MAKETIME(12,15,30);
SELECT MONTHNAME('1998-02-05');
SELECT NOW();
SELECT COUNT(comment_id) FROM comments;
-- querying multiple tables
SELECT u.profile_id, u.user_name, p.post_title
FROM posts AS p
JOIN comments AS c ON p.post_id=c.posts_post_id
JOIN user_profile AS u ON p.user_profile_profile_id=u.profile_id
ORDER BY u.profile_id;

select u.profile_id,u.user_name,p.post_title, p.post_content from user_profile u, posts p
 where u.profile_id = p.user_profile_profile_id;
-- inner join
SELECT u.profile_id, u.user_name, p.post_title
FROM posts as p INNER JOIN user_profile as u 
ON u.profile_id=p.user_profile_profile_id;
-- left join
SELECT u.profile_id, u.user_name, p.post_title
FROM posts AS p
LEFT JOIN user_profile AS u ON p.user_profile_profile_id=u.profile_id
ORDER BY u.user_name;
-- right join
SELECT u.profile_id, u.user_name, p.post_title
FROM posts AS p
RIGHT JOIN user_profile AS u ON p.user_profile_profile_id=u.profile_id
ORDER BY u.user_name;