DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `card_id` int(11) NOT NULL,
  `supervisor_card_id` int(11) ,
  `schedule` varchar(255) NOT NULL,
  `employee_type` varchar(255) NOT NULL,
  `salary_hour` decimal(10,2) NOT NULL,
  PRIMARY KEY (`card_id`) ,
 CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `person` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (1, NULL, '6am-2pm', 'student', '20.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (2, 1,'1pm-10pm', 'student', '19.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (3, 1,'9am-7pm', 'student', '19.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (4, 1,'9am-7pm', 'student', '20.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (5,1, '1pm-10pm', 'student', '23.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (6, 2,'1pm-10pm', 'student', '24.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (7,2, '8am-4pm', 'student', '22.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (8,2, '1pm-10pm', 'student', '23.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (9,2, '9am-7pm', 'full time', '20.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (10,2, '1pm-10pm', 'student', '25.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (11,3, '1pm-10pm', 'full time', '21.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (12,3, '1pm-10pm', 'student', '19.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (13,3, '11am-9pm', 'full time', '20.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (14,3, '6am-2pm', 'student', '22.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (15,3, '8am-4pm', 'full time', '20.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (16,4, '6am-2pm', 'full time', '21.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (17,4, '8am-4pm', 'full time', '20.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (18, 4,'9am-7pm', 'student', '20.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (19,4, '6am-2pm', 'full time', '24.00');
INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (20,4, '8am-4pm', 'student', '19.00');
