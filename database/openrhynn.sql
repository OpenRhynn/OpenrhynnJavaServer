SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `characters` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `class_id` tinyint(3) UNSIGNED NOT NULL,
  `clan_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `world_id` int(10) UNSIGNED NOT NULL DEFAULT '100130',
  `graphics_id` int(10) UNSIGNED NOT NULL,
  `display_name` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `graphics_x` smallint(5) UNSIGNED NOT NULL,
  `graphics_y` smallint(5) UNSIGNED NOT NULL,
  `graphics_dim` tinyint(3) UNSIGNED NOT NULL,
  `x` smallint(6) NOT NULL DEFAULT '122',
  `y` smallint(6) NOT NULL DEFAULT '245',
  `level` smallint(6) UNSIGNED NOT NULL DEFAULT '0',
  `points` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `exp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `gold` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `health_base` int(10) UNSIGNED NOT NULL,
  `health_effect_extra` int(10) UNSIGNED NOT NULL,
  `health_current` int(10) UNSIGNED NOT NULL,
  `mana_base` int(10) UNSIGNED NOT NULL,
  `mana_effect_extra` int(10) UNSIGNED NOT NULL,
  `mana_current` int(10) UNSIGNED NOT NULL,
  `attack_base` int(10) UNSIGNED NOT NULL,
  `attack_effect_extra` int(10) UNSIGNED NOT NULL,
  `defense_base` int(10) UNSIGNED NOT NULL,
  `defense_effect_extra` int(10) UNSIGNED NOT NULL,
  `damage_base` int(10) UNSIGNED NOT NULL,
  `damage_effect_extra` int(10) UNSIGNED NOT NULL,
  `skill_base` int(10) UNSIGNED NOT NULL,
  `skill_effect_extra` int(10) UNSIGNED NOT NULL,
  `magic_base` int(10) UNSIGNED NOT NULL,
  `magic_effect_extra` int(10) UNSIGNED NOT NULL,
  `healthregenerate_base` int(10) UNSIGNED NOT NULL,
  `healthregenerate_effect_extra` int(10) UNSIGNED NOT NULL,
  `manaregenerate_base` int(10) UNSIGNED NOT NULL,
  `manaregenerate_effect_extra` int(10) UNSIGNED NOT NULL,
  `custom_status_msg` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `direct` tinyint(4) NOT NULL DEFAULT '1',
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `state_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `friends` (
  `id` int(10) UNSIGNED NOT NULL,
  `lower_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `higher_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `initiator` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



CREATE TABLE `inventory` (
  `id` int(10) UNSIGNED NOT NULL,
  `char_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tpl_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(3) UNSIGNED NOT NULL,
  `set_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `graphics_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `graphics_x` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `graphics_y` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '',
  `available_status` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT 'all',
  `can_sell` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `can_drop` tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  `units` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `max_units` smallint(5) UNSIGNED NOT NULL DEFAULT '1',
  `units_sell` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `price` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `health_effect` int(11) NOT NULL DEFAULT '0',
  `mana_effect` int(11) NOT NULL DEFAULT '0',
  `attack_effect` int(11) NOT NULL DEFAULT '0',
  `defense_effect` int(11) NOT NULL DEFAULT '0',
  `damage_effect` int(11) NOT NULL DEFAULT '0',
  `skill_effect` int(11) NOT NULL DEFAULT '0',
  `magic_effect` int(11) NOT NULL DEFAULT '0',
  `healthregenerate_effect` int(11) NOT NULL DEFAULT '0',
  `manaregenerate_effect` int(11) NOT NULL DEFAULT '0',
  `action_effect_1` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `action_effect_1_data` varchar(512) COLLATE utf8_bin NOT NULL DEFAULT '',
  `effect_duration` int(10) UNSIGNED NOT NULL,
  `required_skill` int(11) NOT NULL DEFAULT '0',
  `required_magic` int(11) NOT NULL DEFAULT '0',
  `frequency` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `range` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `premium` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `usage_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `equiped` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `belt` tinyint(4) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `mob_spawning` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL,
  `world_id` int(10) UNSIGNED NOT NULL,
  `spawn_x` smallint(6) NOT NULL DEFAULT '0',
  `spawn_y` smallint(6) NOT NULL DEFAULT '0',
  `respawn_delay` int(10) UNSIGNED NOT NULL DEFAULT '5000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `mob_spawning` (`id`, `object_id`, `tpl_id`, `world_id`, `spawn_x`, `spawn_y`, `respawn_delay`) VALUES
(1, 100000, 100008, 100130, 70, 130, 60000),
(2, 100001, 100008, 100130, 150, 60, 60000),
(3, 100002, 100010, 100132, 250, 170, 30000),
(4, 100003, 100010, 100132, 170, 133, 30000),
(5, 100004, 100000, 100132, 158, 400, 30000),
(6, 100005, 100000, 100132, 238, 434, 30000),
(7, 100006, 100009, 100132, 190, 530, 30000),
(8, 100007, 100009, 100132, 180, 580, 30000),
(9, 100008, 100009, 100132, 213, 673, 30000),
(10, 100009, 100001, 100132, 260, 207, 30000),
(11, 100010, 100001, 100132, 488, 224, 30000),
(12, 100011, 100001, 100132, 468, 109, 30000),
(13, 100012, 100041, 100136, 456, 241, 120000),
(14, 100013, 100041, 100136, 456, 244, 120000),
(15, 100014, 100042, 100136, 522, 322, 120000),
(16, 100015, 100041, 100136, 465, 436, 120000),
(17, 100016, 100042, 100136, 504, 72, 120000),
(18, 100017, 100041, 100136, 450, 156, 120000),
(19, 100018, 100042, 100136, 345, 141, 120000),
(20, 100019, 100041, 100136, 411, 54, 120000),
(21, 100020, 100009, 100136, 216, 75, 120000),
(22, 100021, 100009, 100136, 117, 120, 120000),
(23, 100022, 100002, 100136, 147, 27, 120000),
(24, 100023, 100002, 100136, 72, 51, 120000),
(25, 100024, 100002, 100148, 384, 166, 120000),
(26, 100025, 100002, 100148, 330, 310, 120000),
(27, 100026, 100002, 100148, 321, 121, 120000),
(28, 100027, 100026, 100148, 216, 265, 120000),
(29, 100028, 100025, 100148, 151, 250, 120000),
(30, 100029, 100027, 100148, 72, 241, 120000),
(31, 100030, 100038, 100148, 90, 187, 120000),
(32, 100031, 100024, 100148, 120, 90, 120000),
(33, 100032, 100026, 100148, 201, 45, 120000),
(34, 100033, 100023, 100137, 174, 589, 120000),
(35, 100034, 100023, 100137, 150, 454, 120000),
(36, 100035, 100023, 100137, 60, 454, 120000),
(37, 100036, 100028, 100137, 171, 327, 120000),
(38, 100037, 100031, 100137, 117, 243, 120000),
(39, 100038, 100029, 100137, 379, 288, 120000),
(40, 100039, 100030, 100137, 361, 162, 120000),
(41, 100040, 100020, 100137, 373, 45, 120000),
(42, 100041, 100039, 100137, 454, 112, 120000),
(43, 100042, 100032, 100137, 490, 130, 120000),
(44, 100043, 100064, 100137, 472, 67, 120000),
(45, 100044, 100011, 100144, 42, 103, 120000),
(46, 100045, 100022, 100151, 65, 101, 120000),
(47, 100048, 100040, 100151, 155, 38, 120000),
(48, 100049, 100003, 100150, 152, 158, 120000),
(49, 100050, 100003, 100150, 197, 230, 120000),
(50, 100051, 100005, 100150, 44, 293, 120000),
(51, 100052, 100004, 100150, 62, 401, 120000),
(52, 100053, 100005, 100150, 26, 464, 120000),
(53, 100054, 100006, 100150, 170, 437, 120000),
(54, 100055, 100012, 100150, 116, 644, 120000),
(55, 100056, 100007, 100150, 80, 698, 120000),
(56, 100057, 100007, 100150, 161, 653, 120000),
(57, 100058, 100013, 100150, 431, 698, 120000),
(58, 100059, 100013, 100150, 494, 698, 120000),
(59, 100060, 100033, 100150, 548, 653, 120000),
(60, 100061, 100014, 100150, 665, 590, 120000),
(61, 100062, 100015, 100150, 467, 401, 120000),
(62, 100063, 100016, 100150, 503, 419, 120000),
(63, 100064, 100017, 100150, 557, 401, 120000),
(64, 100065, 100050, 100153, 117, 222, 120000),
(65, 100066, 100051, 100153, 81, 213, 120000),
(66, 100067, 100052, 100153, 72, 240, 120000),
(67, 100068, 100053, 100153, 21, 213, 120000),
(68, 100069, 100054, 100153, 111, 142, 120000),
(69, 100070, 100055, 100153, 75, 142, 120000),
(70, 100071, 100056, 100153, 21, 151, 120000),
(71, 100075, 100057, 100153, 96, 24, 120000),
(72, 100076, 100058, 100153, 78, 24, 120000),
(73, 100077, 100059, 100153, 96, 70, 120000),
(74, 100078, 100045, 100153, 141, 21, 120000),
(75, 100079, 100046, 100153, 172, 69, 120000),
(76, 100081, 100048, 100153, 285, 115, 120000),
(77, 100082, 100049, 100153, 294, 115, 120000),
(78, 100083, 100060, 100153, 483, 115, 120000),
(79, 100084, 100061, 100153, 492, 115, 120000),
(80, 100085, 100062, 100153, 672, 115, 120000),
(81, 100086, 100063, 100154, 161, 82, 120000),
(82, 100087, 100047, 100153, 186, 97, 120000),
(83, 100088, 100057, 100150, 424, 141, 120000),
(84, 100089, 100037, 100150, 496, 141, 120000),
(85, 100090, 100035, 100150, 514, 186, 120000),
(86, 100091, 100036, 100150, 640, 231, 120000),
(87, 100092, 100044, 100150, 631, 267, 120000),
(88, 100093, 100043, 100150, 694, 231, 120000),
(89, 100094, 100019, 100150, 550, 249, 120000),
(90, 100095, 100063, 100165, 144, 58, 120000),
(91, 100096, 100064, 100165, 45, 103, 120000),
(92, 100097, 100047, 100146, 100, 238, 120000),
(93, 100098, 100047, 100146, 188, 260, 120000),
(94, 100099, 100047, 100146, 243, 117, 120000),
(95, 100100, 100047, 100146, 100, 117, 120000),
(96, 100101, 100039, 100151, 181, 24, 120000),
(97, 100102, 100034, 100151, 83, 64, 120000),
(98, 100103, 100065, 100166, 120, 85, 120000),
(99, 100104, 100067, 100167, 140, 65, 120000),
(100, 100105, 100066, 100167, 260, 65, 120000),
(101, 100106, 100072, 100172, 100, 390, 120000),
(102, 100107, 100073, 100172, 370, 420, 120000),
(103, 100108, 100047, 100172, 445, 300, 120000),
(104, 100109, 100047, 100172, 10, 210, 120000),
(105, 100110, 100071, 100172, 460, 315, 120000),
(106, 100111, 100071, 100172, 415, 165, 120000),
(107, 100112, 100071, 100172, 190, 180, 120000),
(108, 100113, 100068, 100169, 270, 20, 120000),
(109, 100114, 100069, 100169, 315, 170, 120000),
(110, 100115, 100053, 100169, 390, 320, 120000),
(111, 100116, 100051, 100169, 330, 380, 120000),
(112, 100117, 100070, 100169, 210, 260, 120000),
(113, 100118, 100050, 100169, 60, 245, 120000),
(114, 100119, 100069, 100169, 150, 140, 120000),
(115, 100120, 100051, 100169, 55, 365, 120000),
(116, 100121, 100047, 100172, 385, 345, 120000),
(117, 100122, 100074, 100171, 160, 320, 120000),
(118, 100123, 100081, 100171, 55, 440, 120000),
(119, 100124, 100080, 100171, 355, 305, 120000),
(120, 100125, 100079, 100171, 310, 140, 120000),
(121, 100126, 100075, 100167, 65, 170, 120000),
(122, 100127, 100075, 100167, 65, 170, 120000),
(123, 100128, 100076, 100167, 65, 185, 120000),
(124, 100129, 100057, 100167, 65, 185, 120000),
(125, 100130, 100077, 100167, 200, 185, 120000),
(126, 100131, 100078, 100167, 140, 65, 120000),
(127, 100132, 100047, 100167, 245, 35, 120000),
(128, 100133, 100047, 100167, 305, 125, 120000),
(129, 100134, 100072, 100164, 65, 140, 120000),
(130, 100135, 100073, 100164, 140, 50, 120000),
(131, 100136, 100072, 100164, 65, 65, 120000),
(132, 100137, 100073, 100163, 125, 80, 120000),
(133, 100138, 100081, 100163, 125, 155, 120000),
(134, 100139, 100080, 100163, 230, 95, 120000),
(135, 100140, 100073, 100163, 120, 155, 120000),
(136, 100141, 100082, 100111, 585, 435, 120000),
(137, 100142, 100085, 100111, 525, 465, 120000),
(138, 100143, 100084, 100111, 660, 495, 120000),
(139, 100144, 100083, 100111, 555, 375, 120000),
(140, 100145, 100086, 100111, 435, 525, 120000),
(141, 100146, 100087, 100111, 720, 330, 120000),
(142, 100147, 100087, 100111, 120, 480, 120000),
(143, 100148, 100084, 100111, 321, 223, 120000),
(144, 100149, 100084, 100111, 313, 225, 120000),
(145, 100150, 100087, 100111, 283, 255, 120000),
(146, 100151, 100083, 100111, 330, 435, 120000),
(147, 100152, 100085, 100111, 255, 480, 120000),
(148, 100153, 100071, 100111, 585, 75, 120000),
(149, 100154, 100071, 100111, 615, 75, 120000),
(150, 100155, 100083, 100111, 330, 450, 120000);



CREATE TABLE `npc_spawning` (
  `id` int(10) UNSIGNED NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `tpl_id` int(10) UNSIGNED NOT NULL,
  `world_id` int(10) UNSIGNED NOT NULL,
  `spawn_x` smallint(6) NOT NULL DEFAULT '0',
  `spawn_y` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



INSERT INTO `npc_spawning` (`id`, `object_id`, `tpl_id`, `world_id`, `spawn_x`, `spawn_y`) VALUES
(1, 200000, 200001, 100130, 205, 140),
(2, 200001, 200002, 100132, 560, 560),
(3, 200002, 200003, 100132, 450, 450),
(4, 200003, 200004, 100132, 577, 50),
(5, 200004, 200005, 100132, 624, 312),
(6, 200005, 200006, 3, 32, 71),
(7, 200007, 200007, 100132, 135, 309),
(8, 200008, 200008, 100145, 160, 36),
(9, 200009, 200009, 100136, 100, 260),
(10, 200010, 200000, 100136, 70, 350),
(11, 200011, 200010, 100136, 205, 395),
(12, 200012, 200011, 100148, 439, 84),
(13, 200013, 200012, 100139, 95, 85),
(14, 200014, 200013, 100160, 90, 80);



CREATE TABLE `recovery` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `code` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `login` varchar(16) COLLATE utf8_bin NOT NULL,
  `pass` varchar(64) COLLATE utf8_bin NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `email` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



CREATE TABLE `vars` (
  `id` int(10) UNSIGNED NOT NULL,
  `char_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `var_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `val` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


ALTER TABLE `characters`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lower_id` (`lower_id`),
  ADD KEY `higher_id` (`higher_id`);


ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `char_id` (`char_id`);


ALTER TABLE `mob_spawning`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `npc_spawning`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `recovery`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);


ALTER TABLE `vars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `char_id` (`char_id`);


ALTER TABLE `characters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `friends`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `inventory`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `mob_spawning`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

ALTER TABLE `npc_spawning`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

ALTER TABLE `recovery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `vars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;



ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`lower_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`higher_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;


ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`char_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;


ALTER TABLE `vars`
  ADD CONSTRAINT `vars_ibfk_1` FOREIGN KEY (`char_id`) REFERENCES `characters` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;