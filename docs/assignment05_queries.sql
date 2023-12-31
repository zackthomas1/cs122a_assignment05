show tables;

-- Questions on View (25 marks)
Create VIEW Top_Machines_Used AS
	With equipment_name AS(
		SELECT equipment_type, equipment_id 
		FROM equipment
   	), 
	usage_reading_jan_june AS(
		Select * 
		From usage_reading
		Where timestamp BETWEEN '2023-01-01 00:00:00' AND '2023-06-30 00:00:00'
	),
    name_reading AS (
        Select  en.equipment_type, en.equipment_id, ur.card_id, ur.timestamp
		From equipment_name as en, usage_reading_jan_june as ur
		Where en.equipment_id=ur.equipment_id
    ), 
	distinct_users (equipment_type, user_count) AS(
		Select equipment_type, count(Distinct card_id)
		From name_reading
		Group By equipment_type
	),
	distinct_days (equipment_type, day_count) As(
		SELECT equipment_type, count(Distinct timestamp) 
		FROM name_reading
		Group By equipment_type
	),
    type_user_day_count As(
    	Select du.equipment_type, du.user_count, dd.day_count
		From distinct_users as du, distinct_days as dd 
		Where du.equipment_type=dd.equipment_type
    )   
    Select equipment_type, user_count, day_count, Rank() Over(Order by user_count Desc) usage_rank 
    From type_user_day_count;

Drop view Top_Machines_Used;

Select * 
From Top_Machines_Used;

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
DELETE FROM `employee` WHERE  card_id=21;

select *
from employee;

-- Recursive Queries (25 marks) 
With Recursive employee_hierarchy (card_id, supervisor_card_id,chain_length) As (
	-- Base case 
    Select card_id, supervisor_card_id, 0
    from employee
    Where supervisor_card_id Is NULL
    
    Union
    
    -- recursive step 
    Select e.card_id, e.supervisor_card_id, eh.chain_length+1
    From employee as e, employee_hierarchy as eh
	Where e.supervisor_card_id=eh.card_id
)
Select Distinct chain_length 
From employee_hierarchy
Where chain_length = (Select Max(chain_length) from employee_hierarchy);

Select * 
From employee;

-- Rank Query (15 marks)
With employee_salary_rank As(
	select person.card_id, person.name, person.dob, employee.salary_hour, Rank() Over(Order by salary_hour Desc) salary_rank
	from person,employee 
	where employee.card_id=person.card_id
),
highest_paid_employee As(
	select *, Rank() Over(order by dob Desc) dob_rank
	from employee_salary_rank 
	where employee_salary_rank.salary_rank=1
)
select * 
from highest_paid_employee 
where highest_paid_employee.dob_rank=2




    