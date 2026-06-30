create database `E-learning`;

use `E-learning`;
CREATE TABLE learners (
  learner_id int  AUTO_INCREMENT,
  full_name varchar(30) ,
  country varchar(30) ,
  PRIMARY KEY (`learner_id`)
) ;
CREATE TABLE courses (
  course_id int  AUTO_INCREMENT,
  course_name varchar(50) ,
  category varchar(40) ,
  unit_price decimal(10,2) ,
  PRIMARY KEY (`course_id`)
) ;

CREATE TABLE purchases (
  purchase_id int  AUTO_INCREMENT,
  learner_id int ,
  course_id int ,
  Quantity int ,
  purchase_date date DEFAULT (current_date()),
  PRIMARY KEY (`purchase_id`),
  KEY learner_id (`learner_id`),
  KEY course_id (`course_id`),
  CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `learners` (`learner_id`),
  CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ;
select * from courses;
select * from learners;
select * from purchases;

INSERT INTO `learners` VALUES 
(1,'Arjun ','India'),
(2,'Priya ','India'),
(3,'Keerthana','Singapore'),
(4,'Ethan ','Australia'),
(5,'Kumar Khan','UAE'),
(6,'Emily Johnson','Canada'),
(7,'Liam','Australia'),
(8,'Noah ','Canada'),
(9,' Tan','Singapore'),
(10,'Omar Abdullah','UAE'),
(11,'Karthik ','India'),
(12,' Babu','India'),
(13,'Olivia Brown','USA'),
(14,'Hassan Ali','UAE'),
(15,'Meena ','India'),
(16,' Xian','Singapore'),
(17,' Davies','UK'),
(18,'Vikram ','India'),
(19,'Jackson ','Australia'),
(20,'Isabella ','Canada'),
(21,'Rahul ','India'),
(22,'Sophia ','UK'),
(23,'Aiden','Canada'),
(24,'Ethan','USA'),
(25,'Layla','UAE');

INSERT INTO `courses` VALUES 
(1,'Python Essentials Bootcamp','Programming',1799.00),
(2,'Java Full Stack Development','Programming',2799.00),
(3,'React & React Native Mastery','Programming',3799.00),
(4,'Machine Learning with Python','Programming',4299.00),
(5,'Digital Marketing Fundamentals','Marketing',1199.00),
(6,'Social Media Growth Hacking','Marketing',1099.00),
(7,'Email & Content Marketing','Marketing',699.00),
(8,'UI/UX Design Bootcamp','Design',1799.00),
(9,'Adobe Photoshop Mastery','Design',3799.00),
(10,'Adobe Illustrator Pro','Design',4299.00),
(11,'Scrum & Agile Management','Business',2199.00),
(12,'Accounting & Finance Basics','Business',2799.00),
(13,'Business Communication Skills','Business',1799.00),
(14,'Productivity & Time Hacking','Personal Development',699.00),
(15,'Leadership Skills for Managers','Personal Development',1199.00),
(16,'Mindfulness & Stress Relief','Personal Development',1799.00);


insert into purchases(learner_id,course_id,Quantity,purchase_date)
      values		('2','4','1','2026-01-07'),
					('10','6','1','2026-01-10'),
					('3','16','1','2026-01-12'),
					('2','3','1','2026-01-13'),
					('20','14','1','2026-01-19'),
					('25','16','1','2026-01-18'),
					('3','4','1','2026-01-19'),
					('17','7','1','2026-01-20'),
                    ('11','11','1','2026-01-22'),
					('3','10','1','2026-01-22'),
					('4','9','1','2026-01-22'),
					('5','8','1','2026-01-22'),
					('6','2','1','2026-01-23'),
					('7','4','1','2026-01-23'),
					('8','8','1','2026-01-23'),
					('3','13','1','2026-01-24'),
					('9','12','1','2026-01-24'),
					('10','11','1','2026-01-24'),
					('12','13','1','2026-01-25'),
					('3','16','1','2026-01-12'),
					('12','11','1','2026-01-12'),
					('13','9','1','2026-01-13'),
					('14','10','1','2026-01-28'),
					('15','11','1','2026-02-12'),
					('17','12','1','2026-01-30'),
					('19','4','1','2026-02-01'),
					('2','5','1','2026-02-01'),
					('1','7','1','2026-02-02'),
					('10','16','1','2026-02-03'),
					('11','1','1','2026-02-05'),
					('13','4','1','2026-02-07'),
					('10','9','1','2026-02-07'),
					('10','10','1','2026-02-07'),
					('11','7','1','2026-02-08'),
					('14','1','1','2026-02-09'),
					('14','6','1','2026-02-09'),
					('17','11','1','2026-02-10'),
					('17','13','1','2026-02-11'),
					('19','10','1','2026-02-11'),
					('20','9','1','2026-02-11'),
					('20','10','1','2026-02-12'),
					('21','16','1','2026-02-13'),
					('1','13','1','2026-02-14'),
					('10','11','1','2026-02-17'),
					('21','11','1','2026-02-17'),
					('22','11','1','2026-02-18'),
					('12','11','1','2026-02-19'),
                    ('23','11','1','2026-02-21'),
					('5','7','1','2026-02-21'),
					('7','12','1','2026-02-22'),
					('9','12','1','2026-02-22'),
					('15','1','1','2026-02-24'),
					('15','1','1','2026-02-25'),
					('17','10','1','2026-02-26'),
					('2','11','1','2026-02-27'),
					('2','10','1','2026-02-28');

 -- Q1. Display each learner’s total spending (quantity × unit_price) along with their country.
                
			select l.full_name,l.country,SUM(p.Quantity * c.unit_price)  total_spending
			from purchases p
			join learners l on l.learner_id = p.learner_id
			join courses c on c.course_id = p.course_id
			group by  l.full_name, l.country;
                
    -- Q2. Find the top 3 most purchased courses based on total quantity sold.
    
    select p.course_id,c.course_name,c.category,count(*) 'CountPurchase'
    from purchases  p
    join courses c on c.course_id = p.course_id
    
    group by p.course_id ,c.course_name,c.category
    order by PurchaseCount desc
    limit 3;
    
  -- Show each course category’s total revenue and the number of unique learners who purchased from that category.
	select c.category,Sum(c.unit_price * p.Quantity)  tot_revenue,
    Count(Distinct p.learner_id)  unique_learners
	from purchases p
	join courses c on c.course_id = p.course_id
	group by c.category;
   
   

  --  List all learners who have purchased courses from more than one category.
  
   select  l.full_name ,count(distinct category) 'Tot_Category'
   from purchases p 
   join learners l on l.learner_id = p.learner_id
   join courses c on c.course_id = p.course_id
   group by l.full_name
   having  total_category >1;

   
  -- Identify courses that have not been purchased at all.
  
	select c.course_id, c.course_name
	from Courses c
	left join purchases p 
    on c.course_id = p.course_id
	Where p.course_id is null;

