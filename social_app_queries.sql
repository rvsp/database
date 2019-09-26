CREATE TABLE `profile_status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_profile` (
  `profile_id` int(11) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `profile_first_name` varchar(100) DEFAULT NULL,
  `profile_last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `mobile` int(10) NOT NULL,
  `user_join_date` datetime DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `profile_status_status_id` int(11) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `friends` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(80) DEFAULT NULL,
  `f_email` varchar(45) DEFAULT NULL,
  `f_mobile` varchar(45) DEFAULT NULL,
  `user_profile_profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `comments` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `posts_post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `no_of_like_for_post` int(11) NOT NULL,
  `posts_post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_login_details` (
  `login_id` int(11) NOT NULL,
  `user_last_login` datetime NOT NULL,
  `no_user_login_device` int(11) NOT NULL,
  `user_profile_profile_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(45) DEFAULT NULL,
  `post_content` varchar(45) DEFAULT NULL,
  `user_profile_profile_id` int(11) NOT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `friends`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `profile_status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `user_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`,`posts_post_id`),
  ADD KEY `fk_comments_posts1_idx` (`posts_post_id`);

ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`,`posts_post_id`),
  ADD KEY `fk_likes_posts1_idx` (`posts_post_id`);

ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`,`user_profile_profile_id`),
  ADD UNIQUE KEY `dept_name_UNIQUE` (`post_title`),
  ADD KEY `fk_posts_user_profile_idx` (`user_profile_profile_id`);

ALTER TABLE `profile_status`
  ADD PRIMARY KEY (`status_id`);

ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;


ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`profile_id`,`profile_status_status_id`),
  ADD UNIQUE KEY `mobile_UNIQUE` (`mobile`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  ADD KEY `fk_user_profile_profile_status1_idx` (`profile_status_status_id`);

ALTER TABLE `user_login_details`
  ADD PRIMARY KEY (`login_id`,`user_profile_profile_id`),
  ADD KEY `fk_user_login_details_user_profile1_idx` (`user_profile_profile_id`);

ALTER TABLE `friends`
  ADD PRIMARY KEY (`f_id`,`user_profile_profile_id`),
  ADD UNIQUE KEY `t_mobile_UNIQUE` (`f_mobile`),
  ADD KEY `fk_friends_user_profile1_idx` (`user_profile_profile_id`);

ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_user_profile_profile_status1` FOREIGN KEY (`profile_status_status_id`) REFERENCES `profile_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE `user_login_details`
  ADD CONSTRAINT `fk_user_login_details_user_profile1` FOREIGN KEY (`user_profile_profile_id`) REFERENCES `user_profile` (`profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE `friends`
  ADD CONSTRAINT `fk_friends_user_profile1` FOREIGN KEY (`user_profile_profile_id`) REFERENCES `user_profile` (`profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_user_profile` FOREIGN KEY (`user_profile_profile_id`) REFERENCES `user_profile` (`profile_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_posts1` FOREIGN KEY (`posts_post_id`) REFERENCES `posts` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_posts1` FOREIGN KEY (`posts_post_id`) REFERENCES `posts` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


INSERT INTO `profile_status` (`status_id`, `status_name`) VALUES
(1, 'Active'),
(2, 'In Active'),
(3, 'Closed');

INSERT INTO `user_profile` (`profile_id`, `user_name`, `profile_first_name`, `profile_last_name`, `email`, `mobile`, `user_join_date`, `date_of_birth`, `profile_status_status_id`, `created_at`) VALUES
(1, 'venkat', 'venkat', 'r', @gmail.com', 464434, '2019-09-25 00:25:16', '2019-09-17', 2, '2019-09-11 05:08:39.374819'),
(3, 'def', 'def', 'd', 'def@mail.com', 989666, '2019-09-24 17:29:53', '2019-09-23', 2, '2019-09-25 09:06:29.000811'),
(4, 'xyz', 'xyz', 'x', 'xyz@mail.com', 56458, '2019-09-26 14:47:45', '2019-09-17', 3, '2019-09-25 12:48:00.366000');'pvenkat.rv@gmail.com', 545464, '2019-09-25 11:41:41', '2019-09-25', 1, '2019-09-25 14:18:48.819819'),
(2, 'abc', 'abc', 'a', 'abc

INSERT INTO `friends` (`f_id`, `f_name`, `f_email`, `f_mobile`, `user_profile_profile_id`) VALUES
(1, 'ramu', 'ramu@mail.com', '4684634', 1),
(2, 'raju', 'raju@gmail.com', '56894515', 1),
(3, 'rafeeq', 'rafeeq@mail.com', '89561154', 1),
(4, 'priya', 'priya@mail.com', '4569893', 3),
(5, 'manish', 'manis@mail.com', '32659845', 3),
(6, 'babu', 'abbu@mail.com', '54215689', 2),
(7, 'meena', 'meena@mail.com', '86241535', 2),
(8, 'mysql', 'mysql@mail.com', '35684835', 4),
(9, 'java', 'java@mail.com', '15264839', 4),
(10, 'python', 'python@mail.com', '6835815', 2);

INSERT INTO `user_login_details` (`login_id`, `user_last_login`, `no_user_login_device`, `user_profile_profile_id`) VALUES
(1, '2019-09-25 11:47:23', 2, 1),
(2, '2019-09-24 09:17:52', 4, 2),
(3, '2019-09-12 10:59:46', 6, 4),
(4, '2019-09-25 00:00:00', 2, 3);

INSERT INTO `posts` (`post_id`, `post_title`, `post_content`, `user_profile_profile_id`, `created_at`) VALUES
(1, 'python', 'Python is an interpreted, high-level', 1, '2019-09-25 01:08:00.811413'),
(2, 'java', 'Java is a general-purpose programming', 1, '2019-09-16 02:24:27.671241'),
(3, 'mysql', 'MySQL is an open-source relational database', 3, '2019-09-11 14:50:45.351834'),
(4, 'postgresql', 'PostgreSQL, also known as Postgres', 4, '2019-09-02 03:30:21.866507'),
(5, 'nodejs', 'Node.js is a JavaScript runtime built', 3, '2019-09-08 19:17:00.390000'),
(6, 'electronjs', 'Electron is an open-source framework', 1, '2019-09-22 19:02:00.858351'),
(7, 'vuejs', 'Vue.js is an open-source JavaScript', 2, '2019-09-13 03:30:44.000491'),
(8, 'chrome', 'Google Chrome is a cross-platform web', 4, '2019-09-15 11:46:31.803265');

INSERT INTO `comments` (`comment_id`, `comments`, `created_at`, `updated_at`, `posts_post_id`) VALUES
(1, 'python', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 1),
(2, 'sql', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 4),
(3, 'sqme sql', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 3),
(4, 'language', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 2),
(5, 'browser', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 8),
(6, 'framework', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 5),
(7, 'language', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 2),
(8, 'framework', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 6),
(9, 'python lanuage', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 1),
(10, 'query', '2019-09-25 00:00:00', '2019-09-25 00:00:00', 3);

INSERT INTO `likes` (`like_id`, `no_of_like_for_post`, `posts_post_id`) VALUES
(1, 4, 2),(2, 45, 6),(5, 6, 7),(6, 15, 8),
(7, 3, 3),(8, 4, 4),(9, 4, 5),(10, 21, 1);