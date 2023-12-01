show tables;

-- Questions on View (25 marks)

-- Question on Trigger (5 marks)
delimiter |
create trigger PreventSalaryReduction
before update on employee
for each row 
	begin 
		if (New.salary_hour < Old.salary_hour) then
			set New.salary_hour = Old.salary_hour;
        end if; 
	end;|
delimiter ; 

drop trigger PreventSalaryReduction;

update employee
set salary_hour = 6.00
where card_id = 4;

select *
from employee
where card_id=4;
-- Question on Constraints (5 marks)
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `card_id` int(11) NOT NULL,
  `supervisor_card_id` int(11) ,
  `schedule` varchar(255) NOT NULL,
  `employee_type` varchar(255) NOT NULL,
  `salary_hour` decimal(10,2) NOT NULL,
  CHECK (salary_hour > 12.00), -- check constraint
  PRIMARY KEY (`card_id`) ,
 CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `person` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employee` (`card_id`, `supervisor_card_id`,`schedule`, `employee_type`, `salary_hour`) VALUES (21,4, '8am-4pm', 'student', '10.00');

-- Recursive Queries (25 marks) 

-- Rank Query (15 marks)
    