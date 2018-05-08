
SET Search_path = 'Project';

CREATE TABLE RESTAURANT
(RESTAURANTID CHAR(2) PRIMARY KEY, 
	NAME VARCHAR(100) NOT NULL, 
	TYPE VARCHAR(100), 
	URL VARCHAR(100)

);

CREATE TABLE RATER
(
	USERID CHAR(2) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL, 
	NAME VARCHAR(20) NOT NULL, 
	JOIN_DATE DATE NOT NULL, 
	TYPE VARCHAR(15) NOT NULL, 
	REPUTATION INT NOT NULL, 
	PRIMARY KEY (USERID)
);

CREATE TABLE RATING
(
	USERID CHAR(2) NOT NULL,
	DATE DATE NOT NULL, 
	PRICE INT NOT NULL, 
	FOOD INT NOT NULL, 
	MOOD INT NOT NULL, 
	STAFF INT NOT NULL, 
	COMMENTS VARCHAR(100),
	RESTAURANTID CHAR(2) NOT NULL,
	FOREIGN KEY (USERID) REFERENCES RATER(USERID),
	FOREIGN KEY (RESTAURANTID) REFERENCES RESTAURANT(RESTAURANTID)
);

CREATE TABLE LOCATIONS
(
	LOCATIONID CHAR(2) NOT NULL, 
	FIRST_OPEN_DATE DATE , 
	MANAGER_NAME VARCHAR(20) NOT NULL,
	PHONE_NUMBER CHAR(15) NOT NULL, 
	STREET_ADDRESS VARCHAR(50) NOT NULL, 
	HOUR_OPEN VARCHAR(10) NOT NULL,
	HOUR_CLOSE VARCHAR(10) NOT NULL, 
	RESTAURANTID CHAR(2) NOT NULL, 
	PRIMARY KEY (LOCATIONID), 
	FOREIGN KEY (RESTAURANTID) REFERENCES RESTAURANT(RESTAURANTID)
);

CREATE TABLE MENUITEM
(
	ITEMID CHAR(2) NOT NULL, 
	NAME VARCHAR(50), 
	TYPE CHAR(8), 
	CATEGORY CHAR(7), 
	DESCRIPTION VARCHAR(1000), 
	PRICE DECIMAL(4,2), 
	RESTAURANTID CHAR(2), 
	PRIMARY KEY (ITEMID),
	FOREIGN KEY (RESTAURANTID) REFERENCES RESTAURANT(RESTAURANTID)
);

CREATE TABLE RATINGITEM
(
	USERID CHAR(2) NOT NULL, 
	DATE DATE NOT NULL, 
	ITEMID CHAR(10) NOT NULL, 
	RATING CHAR(1) NOT NULL, 
	COMMENT VARCHAR(60)
);

INSERT INTO RESTAURANT VALUES ('01', 'Burgers N Fries Forever', 'Fast food', 'https://burgersnfriesforever.com/');
INSERT INTO RESTAURANT VALUES ('02', 'Zaks Diner', 'Fast food', 'http://www.zaksdiner.com/eat-at-zaks/');
INSERT INTO RESTAURANT VALUES ('03', 'McDonalds', 'Fast food', 'https://www.mcdonalds.com/ca/en-ca.html');
INSERT INTO RESTAURANT VALUES ('04', 'IPho', 'Vietnamese', 'https://ipho-ottawa.com/');
INSERT INTO RESTAURANT VALUES ('05', 'Green Papaya', 'Thai', 'http://prestongreenpapaya.menu.ca/');
INSERT INTO RESTAURANT VALUES ('06', 'Ariana', 'Afghani', 'https://arianakababhouse.com/');
INSERT INTO RESTAURANT VALUES ('07', 'Vittoria Trattoria', 'Italian', 'https://vittoriatrattoria.com/');
INSERT INTO RESTAURANT VALUES ('08', 'Oh so good!', 'Cafe', 'http://ww7.ohsogooddesserts.com/');
INSERT INTO RESTAURANT VALUES ('09', 'Shawarma Palace', 'Middle Eastern', 'http://shawarmapalace.ca/');
INSERT INTO RESTAURANT VALUES ('10', 'Colonade Pizza', 'Italian', 'http://www.colonnadepizza.com/');
INSERT INTO RESTAURANT VALUES ('11', 'Sushi 88', 'Japanese', 'http://www.sushi88.ca/');
INSERT INTO RESTAURANT VALUES ('12', 'Stella Luna Gelato', 'Cafe', 'http://www.slgelato.com/');
INSERT INTO RESTAURANT VALUES ('13', 'Evoo Greek Kitchen', 'Greek', 'https://www.evoogreekkitchen.ca');

INSERT INTO RATER VALUES ('01','sodales.elit@aenim.ca','Ciara Whitaker','2017-02-27 ','Critic',1);
INSERT INTO RATER VALUES ('02','ridiculus@lobortisauguescelerisque.net','Lacota Berger','2018-09-24 ','Online',2);
INSERT INTO RATER VALUES ('03','egestas@montesnascetur.edu','Leonard Michael','2018-05-29 ','Online',3);
INSERT INTO RATER VALUES ('04','nisi@convallis.co.uk','Logan Warren','2018-10-06 ','Online',2);
INSERT INTO RATER VALUES ('05','dignissim.tempor@aliquetProin.org','Madonna Little','2019-01-07 ','Online',4);
INSERT INTO RATER VALUES ('06','Donec.at.arcu@velitjusto.com','Ryan Fulton','2018-09-03 ','Online',2);
INSERT INTO RATER VALUES ('07','Cras@blanditcongueIn.com','Cade Miller','2017-12-10 ','Critic',1);
INSERT INTO RATER VALUES ('08','ipsum.leo.elementum@Utsagittis.ca','Curran Boyle','2017-10-26 ','Critic',1);
INSERT INTO RATER VALUES ('09','nunc@vehicularisusNulla.net','Athena Stein','2018-09-21 ','Critic',1);
INSERT INTO RATER VALUES ('10','luctus.sit@atfringillapurus.edu','Valentine Glass','2017-05-08 ','Blogger',5);
INSERT INTO RATER VALUES ('11','sit@imperdietdictum.org','Dominique Guerra','2017-07-09 ','Blogger',5);
INSERT INTO RATER VALUES ('12','dis.parturient@quisurna.ca','Dane Cochran','2017-08-20 ','Critic',5);
INSERT INTO RATER VALUES ('13','nisl.sem.consequat@necmollisvitae.net','Aileen Garner','2019-02-03 ','Critic',1);
INSERT INTO RATER VALUES ('14','libero@nisl.edu','Jillian Bryan','2017-08-16 ','Critic',3);
INSERT INTO RATER VALUES ('15','velit@vitaevelit.org','Derek Joyner','2017-06-07 ','Online',1);
INSERT INTO RATER VALUES ('16','In@nibhQuisquenonummy.com','Baker Gutierrez','2018-03-07 ','Online',5);
INSERT INTO RATER VALUES ('17','pellentesque.eget@turpisnecmauris.edu','Ferris Cameron','2018-07-30 ','Critic',3);
INSERT INTO RATER VALUES ('18','Aenean.euismod.mauris@tempusnonlacinia.com','Abel Cohen','2018-10-17 ','Online',3);
INSERT INTO RATER VALUES ('19','diam.at@tellusSuspendissesed.net','Brett Shepard','2017-11-26 ','Critic',1);
INSERT INTO RATER VALUES ('20','dapibus.ligula.Aliquam@Cras.com','Kennedy Ware','2017-03-28 ','Online',1);

INSERT INTO RATING VALUES ('15','2017-03-31 ',2,1,3,1,'Great food!','01');
INSERT INTO RATING VALUES ('09','2017-08-28 ',2,4,4,2,'Food was good, staff was rude.','01');
INSERT INTO RATING VALUES ('02','2019-01-30 ',4,2,2,1,'Cheap food.','01');
INSERT INTO RATING VALUES ('12','2018-10-31 ',4,1,2,4,'Great price and staff, food wasnt good.','01');
INSERT INTO RATING VALUES ('20','2017-03-11 ',3,5,5,1,'Would come again!','01');
INSERT INTO RATING VALUES ('07','2018-05-14 ',3,4,3,2,'GOOD!','01');
INSERT INTO RATING VALUES ('15','2018-11-28 ',2,3,1,2,'Okay.','01');
INSERT INTO RATING VALUES ('04','2019-01-31 ',3,2,2,4,'N/A','01');
INSERT INTO RATING VALUES ('04','2019-01-31 ',3,5,2,4,'N/A','01');

INSERT INTO RATING VALUES ('12','2017-12-30 ',5,5,4,2,'Not bad','02');
INSERT INTO RATING VALUES ('04','2017-08-20 ',2,4,1,2,'Dissapointing.','02');
INSERT INTO RATING VALUES ('12','2018-11-17 ',4,3,4,2,'Great late night eats.','02');
INSERT INTO RATING VALUES ('14','2018-06-27 ',3,1,2,5,'N/A','02');
INSERT INTO RATING VALUES ('13','2017-12-27 ',4,2,5,4,'Food was dry.','02');
INSERT INTO RATING VALUES ('09','2017-02-04 ',4,3,4,5,'Best milkshakes ever!','02');
INSERT INTO RATING VALUES ('08','2018-07-15 ',2,1,2,1,'N/A','02');
INSERT INTO RATING VALUES ('16','2017-04-04 ',3,3,4,4,'N/A','02');
INSERT INTO RATING VALUES ('10','2017-02-04 ',4,3,4,5,'N/A','02');
INSERT INTO RATING VALUES ('05','2017-02-04 ',4,2,4,5,'N/A','02');
INSERT INTO RATING VALUES ('03','2017-02-04 ',4,3,4,5,'Great food!','02');

INSERT INTO RATING VALUES ('18','2018-07-14 ',3,2,5,2,'N/A','03');
INSERT INTO RATING VALUES ('03','2019-02-18 ',2,3,2,5,'Quick service.','03');
INSERT INTO RATING VALUES ('12','2019-01-02 ',3,3,1,2,'N/A','03');
INSERT INTO RATING VALUES ('08','2018-09-29 ',2,1,1,3,'N/A','03');
INSERT INTO RATING VALUES ('20','2019-02-12 ',1,5,4,2,'Great food!','03');
INSERT INTO RATING VALUES ('15','2017-07-06 ',2,4,1,2,'N/A','03');
INSERT INTO RATING VALUES ('05','2017-11-29 ',1,5,4,4,'Typical McDonalds','03');
INSERT INTO RATING VALUES ('08','2017-12-09 ',4,1,5,1,'N/A','03');

INSERT INTO RATING VALUES ('05','2018-03-09 ',2,4,4,3,'My favourite restaurant!','04');
INSERT INTO RATING VALUES ('02','2017-04-03 ',2,1,3,1,'N/A','04');
INSERT INTO RATING VALUES ('12','2018-07-20 ',5,4,5,2,'Cute place with great food.','04');
INSERT INTO RATING VALUES ('01','2017-10-16 ',4,3,2,3,'N/A','04');
INSERT INTO RATING VALUES ('10','2017-10-09 ',5,2,5,5,'Amazing place','04');
INSERT INTO RATING VALUES ('12','2017-02-27 ',1,5,2,1,'N/A','04');
INSERT INTO RATING VALUES ('07','2018-11-19 ',3,3,2,5,'N/A','04');
INSERT INTO RATING VALUES ('07','2018-07-10 ',5,4,4,4,'Perfect for any occassion.','04');

INSERT INTO RATING VALUES ('19','2017-10-20 ',4,1,2,2,'N/A','05');
INSERT INTO RATING VALUES ('15','2017-06-09 ',1,1,4,2,'N/A','05');
INSERT INTO RATING VALUES ('10','2017-07-02 ',3,4,4,5,'A little too spicy but still good food.','05');
INSERT INTO RATING VALUES ('08','2017-03-28 ',1,4,1,1,'N/A','05');
INSERT INTO RATING VALUES ('20','2017-06-16 ',4,5,4,5,'Great food and great staff!','05');
INSERT INTO RATING VALUES ('18','2017-08-12 ',2,4,3,3,'N/A','05');
INSERT INTO RATING VALUES ('05','2017-02-24 ',3,4,5,5,'N/A','05');
INSERT INTO RATING VALUES ('15','2018-07-26 ',1,3,5,2,'N/A','05');
INSERT INTO RATING VALUES ('05','2018-03-09 ',2,4,4,3,'Beautiful restaurant.','05');

INSERT INTO RATING VALUES ('03','2018-05-08 ',4,1,3,2,'N/A','06');
INSERT INTO RATING VALUES ('02','2017-11-22 ',2,3,3,4,'N/A','06');
INSERT INTO RATING VALUES ('18','2018-05-18 ',3,2,3,4,'N/A','06');
INSERT INTO RATING VALUES ('17','2018-09-16 ',4,2,3,2,'N/A','06');
INSERT INTO RATING VALUES ('04','2018-12-13 ',5,1,1,2,'Too busy around lunch, staff were very slow.','06');
INSERT INTO RATING VALUES ('13','2017-05-30 ',5,1,5,3,'N/A','06');
INSERT INTO RATING VALUES ('12','2017-12-26 ',2,5,3,1,'Food always tastes great.','06');
INSERT INTO RATING VALUES ('19','2018-12-17 ',4,3,3,3,'Great food, tastes very authentic.','06');

INSERT INTO RATING VALUES ('11','2018-01-19 ',2,2,4,5,'N/A','07');
INSERT INTO RATING VALUES ('17','2018-08-19 ',4,5,3,2,'N/A','07');
INSERT INTO RATING VALUES ('12','2018-05-31 ',4,1,1,1,'N/A','07');
INSERT INTO RATING VALUES ('16','2018-07-25 ',3,5,1,1,'Great food!','07');
INSERT INTO RATING VALUES ('14','2018-01-17 ',4,1,1,2,'N/A','07');
INSERT INTO RATING VALUES ('15','2018-11-05 ',4,2,3,5,'N/A','07');
INSERT INTO RATING VALUES ('07','2018-04-13 ',1,5,5,5,'N/A','07');
INSERT INTO RATING VALUES ('20','2019-03-01 ',3,5,2,3,'Nice place and nice staff.','07');

INSERT INTO RATING VALUES ('12','2017-07-28 ',4,5,4,4,'N/A','08');
INSERT INTO RATING VALUES ('08','2018-05-02 ',4,5,3,3,'Great food and atmosphere!','08');
INSERT INTO RATING VALUES ('13','2018-04-01 ',3,5,2,2,'N/A','08');
INSERT INTO RATING VALUES ('09','2018-10-08 ',2,1,2,2,'Ovepriced.','08');
INSERT INTO RATING VALUES ('12','2017-11-21 ',1,3,4,3,'N/A','08');
INSERT INTO RATING VALUES ('15','2018-07-16 ',2,5,1,4,'N/A','08');
INSERT INTO RATING VALUES ('17','2017-12-03 ',4,4,5,1,'N/A','08');
INSERT INTO RATING VALUES ('07','2017-10-03 ',4,5,4,5,'Best cake ever!','08');
INSERT INTO RATING VALUES ('11','2018-04-01 ',3,5,3,2,'Amazing desserts!','08');

INSERT INTO RATING VALUES ('15','2017-05-29 ',4,1,1,1,'N/A','09');
INSERT INTO RATING VALUES ('20','2019-01-19 ',5,3,2,2,'N/A','09');
INSERT INTO RATING VALUES ('09','2017-11-13 ',5,3,4,4,'One of the best places.','09');
INSERT INTO RATING VALUES ('03','2018-05-18 ',1,2,5,3,'N/A','09');
INSERT INTO RATING VALUES ('18','2018-08-25 ',3,3,2,1,'N/A','09');
INSERT INTO RATING VALUES ('03','2018-03-01 ',3,2,3,4,'N/A','09');
INSERT INTO RATING VALUES ('02','2017-02-09 ',3,1,2,1,'N/A','09');
INSERT INTO RATING VALUES ('09','2017-07-23 ',4,3,3,4,'Always satisfied.','09');

INSERT INTO RATING VALUES ('05','2017-05-21 ',2,5,5,3,'N/A','10');
INSERT INTO RATING VALUES ('09','2017-09-11 ',1,1,4,1,'N/A','10');
INSERT INTO RATING VALUES ('11','2017-02-19 ',3,3,4,4,'Amazing!','10');
INSERT INTO RATING VALUES ('19','2017-09-07 ',4,4,4,4,'N/A','10');
INSERT INTO RATING VALUES ('11','2017-02-07 ',3,5,1,5,'N/A','10');
INSERT INTO RATING VALUES ('20','2017-12-12 ',4,4,2,3,'Pizza is bae.','10');
INSERT INTO RATING VALUES ('15','2017-10-04 ',3,3,1,3,'N/A','10');
INSERT INTO RATING VALUES ('08','2017-12-17 ',3,5,3,3,'Love this place.','10');

INSERT INTO RATING VALUES ('15','2017-11-22 ',3,5,3,1,'N/A','11');
INSERT INTO RATING VALUES ('10','2017-03-29 ',4,2,4,3,'N/A','11');
INSERT INTO RATING VALUES ('12','2017-05-17 ',2,2,1,3,'Overpriced but great quality.','11');
INSERT INTO RATING VALUES ('03','2017-02-23 ',2,5,4,4,'N/A','11');
INSERT INTO RATING VALUES ('12','2018-12-25 ',3,5,2,2,'Great food!','11');
INSERT INTO RATING VALUES ('10','2018-03-19 ',5,2,3,4,'N/A','11');
INSERT INTO RATING VALUES ('13','2018-03-19 ',5,1,3,4,'N/A','11');
INSERT INTO RATING VALUES ('20','2018-03-19 ',5,5,3,4,'Amazing!','11');
INSERT INTO RATING VALUES ('07','2018-09-21 ',2,3,5,1,'N/A','11');
INSERT INTO RATING VALUES ('08','2018-03-04 ',4,1,1,3,'N/A','11');

INSERT INTO RATING VALUES ('10','2018-02-08 ',2,3,3,5,'Would definitely come again.','12');
INSERT INTO RATING VALUES ('08','2018-03-17 ',2,2,2,4,'Good time.','12');
INSERT INTO RATING VALUES ('20','2017-05-26 ',2,4,2,3,'N/A','12');
INSERT INTO RATING VALUES ('20','2017-01-25 ',1,4,2,3,'N/A','12');
INSERT INTO RATING VALUES ('15','2019-01-20 ',4,4,3,1,'N/A','12');
INSERT INTO RATING VALUES ('03','2017-03-31 ',3,3,4,3,'N/A','12');
INSERT INTO RATING VALUES ('20','2018-06-20 ',5,1,1,1,'N/A','12');
INSERT INTO RATING VALUES ('10','2017-09-19 ',5,1,2,2,'N/A','12');

INSERT INTO RATING VALUES ('09','2018-05-25 ',5,4,4,3,'N/A','13');
INSERT INTO RATING VALUES ('06','2017-03-31 ',1,4,3,1,'Was not impressed.','13');
INSERT INTO RATING VALUES ('18','2019-03-18 ',4,4,3,4,'Lovely staff.','13');
INSERT INTO RATING VALUES ('04','2017-12-04 ',5,1,5,1,'N/A','13');
INSERT INTO RATING VALUES ('09','2017-05-18 ',2,2,1,4,'N/A','13');
INSERT INTO RATING VALUES ('08','2017-04-28 ',4,5,1,5,'N/A','13');
INSERT INTO RATING VALUES ('03','2018-05-01 ',2,4,1,5,'N/A','13');
INSERT INTO RATING VALUES ('10','2018-09-01 ',2,1,2,3,'N/A','13');
INSERT INTO RATING VALUES ('08','2019-03-18 ',1,4,3,4,'N/A','13');
INSERT INTO RATING VALUES ('15','2019-03-18 ',5,4,3,4,'Amazing!','13');
INSERT INTO RATING VALUES ('20','2019-03-18 ',4,5,3,4,'Great food!','13');


INSERT INTO MENUITEM VALUES ('01', 'The Original', 'Food', 'Main', 'Burger with tomato, lettuce and BFF sauce.', 8.00, '01');
INSERT INTO MENUITEM VALUES ('02', 'The Mexican', 'Food', 'Main', 'Burger with red onion, jalapeños, lettuce, and chipotle mayo..', 9.00, '01');
INSERT INTO MENUITEM VALUES ('03', 'Milkshake', 'Beverage', 'Dessert', 'Chocolate or vanilla.', 4.00, '01');
INSERT INTO MENUITEM VALUES ('04','French Toast and Eggs','Food','Main','Two eggs any style, fruit & French toast made with extra thick Texas toast', 15.49,'02');
INSERT INTO MENUITEM VALUES ('05','Milkshake','Beverage','Dessert','Made with premium ice cream topped with whipped cream.',6.99,'02');
INSERT INTO MENUITEM VALUES ('06','Montreal Scramble','Food','Main','Three eggs scrambled with smoked meat & onion, served on a bagel & topped with melted Swiss', 15.50,'02');
INSERT INTO MENUITEM VALUES ('07','Milkshake','Beverage','Dessert','Trademark Milkshake!',3.50,'03');
INSERT INTO MENUITEM VALUES ('08','Egg McMuffin','Food','Starter','Our breakfast sandwich boasts one freshly-cracked egg topped with Canadian bacon and a slice of tasty processed cheddar cheese, sitting happily on a toasted English muffin.', 0.00,'03');
INSERT INTO MENUITEM VALUES ('09','Garden Fresh Side Salad','Food','Starter', 'Salad made with red peppers, cucumbers, cheddar, lettuce and baby kale', 5.00,'03');
INSERT INTO MENUITEM VALUES ('10','Milkshake','Beverage','Dessert','N/A',5.95,'04');
INSERT INTO MENUITEM VALUES ('11','Bubble Tea','Beverage','Dessert','N/A', 5.95,'04');
INSERT INTO MENUITEM VALUES ('12','Stir Fry','Food','Main','Lemongrass Chicken with vermicelli.', 14.95,'04');
INSERT INTO MENUITEM VALUES ('13','Pad Khing','Food','Main','Sautéed chicken, pork or beef with fresh ginger, onions and mushroom.',16.50,'05');
INSERT INTO MENUITEM VALUES ('14','Gaeng Pah','Food','Main','Wild bamboo curry with chicken, pork, beef or vegetables.', 16.95,'05');
INSERT INTO MENUITEM VALUES ('15','Pad Thai','Food','Main','Shrimp, chicken or tofu stir-fried traditional rice noodle with egg, beansprouts, peanuts and chef sauce.', 16.75,'05');
INSERT INTO MENUITEM VALUES ('16','Chicken tandoori','Food','Main','Four chicken drums marinated.', 12.99,'06');
INSERT INTO MENUITEM VALUES ('17','Samosa','Food','Starter','Beef, chicken or vegetable.', 3.50,'06');
INSERT INTO MENUITEM VALUES ('18','Ariana Salad','Food','Starter','Red onion, lettuce, tomato, cucumber, feta, peppers and italian dressing.', 8.99,'06');
INSERT INTO MENUITEM VALUES ('19','Cheesecake','Food','Dessert','Chocolate or strawberry cheesecake.', 3.99, '06');
INSERT INTO MENUITEM VALUES ('20','Zuccotto','Food','Dessert','Chocolate mousse filed bomb cake.', 9.00,'07');
INSERT INTO MENUITEM VALUES ('21','Tiramisu','Food','Dessert','Esspresso scented italian trifle.', 9.00,'07');
INSERT INTO MENUITEM VALUES ('22','House Salad','Food','Starter', 'Mixed greens and tomatoes tossed in our house dressing', 8.00,'07');
INSERT INTO MENUITEM VALUES ('23','Arrabiata','Food','Main','Red wine and garlic infused spicy tomato sauce served with penne.', 17.00,'07');
INSERT INTO MENUITEM VALUES ('24','Pie','Food','Dessert','Freshly made daily specials.',6.75,'08');
INSERT INTO MENUITEM VALUES ('25','Milkshake','Beverage','Dessert','N/A', 6.00,'08');
INSERT INTO MENUITEM VALUES ('26','Ice Cream','Food','Dessert','Variety of ice cream.', 2.50,'08');
INSERT INTO MENUITEM VALUES ('27','Beef Sharwarma','Food','Main', 'Marinated layer of thinly cut sirloin beef.',13.00,'09');
INSERT INTO MENUITEM VALUES ('28','Falafel','Food','Starter','A fried mixture of fresh vegtables and beans.',11.95,'09');
INSERT INTO MENUITEM VALUES ('29','Chicken kabob','Food','Main','Tender cubes of chicken, served on a bed of Mediterranean rice.', 15.95,'09');
INSERT INTO MENUITEM VALUES ('30','Potatoes','Food','Starter','Stir fried potato with garlic, coriander and hot red pepper.', 3.50,'09');
INSERT INTO MENUITEM VALUES ('31','Caesar Salad','Food','Starter', 'Romaine lettuce served with croutons and a creamy Caesar dressing.', 11.00,'10');
INSERT INTO MENUITEM VALUES ('32','Italian Salad','Food','Starter','Romaine lettuce served with onions, green peppers, olives, tomatoes and our salad dressing.', 11.00,'10');
INSERT INTO MENUITEM VALUES ('33','Canadian Pizza','Food','Main','Mushroom, pepperoni, and bacon.', 10.00,'10');
INSERT INTO MENUITEM VALUES ('34','Pizza Burger','Food','Main','Ground beef, mushrooms and green peppers.', 10.00,'10');
INSERT INTO MENUITEM VALUES ('35','Edamame','Food','Starter','Baby soy beans.', 4.95,'11');
INSERT INTO MENUITEM VALUES ('36','Vegetarian Gyoza','Food','Starter','Five pan seared vetable gyoza and ponzu sauce.',7.00,'11');
INSERT INTO MENUITEM VALUES ('37','Salmon Batera','Food','Main','Atlantic salmon, yuzu sauce and jalepenos.',15.00,'11');
INSERT INTO MENUITEM VALUES ('38','Sashimi Lunch Surprise','Food','Main','12 pcs of assorted sashimi and 3 rolls.', 15.00,'11');
INSERT INTO MENUITEM VALUES ('39','Waffles','Food','Dessert','Buttermilk waffles like your grandma used to make.', 8.00,'12');
INSERT INTO MENUITEM VALUES ('40','Gelato','Food','Dessert','Freshly made, award winning gelato.', 3.00,'12');
INSERT INTO MENUITEM VALUES ('41','Gelato Cake','Food','Dessert','Combination of gelato and cake.',5.00,'12');
INSERT INTO MENUITEM VALUES ('42','Avocado Salad','Food','Starter','Tomato, feta, avocado, onion and evoo.', 10.00,'13');
INSERT INTO MENUITEM VALUES ('43','Smoked Duck Benedict','Food','Main','hives, cheddar hollandaise, potatoes.',15.00,'13');
INSERT INTO MENUITEM VALUES ('44','Calamari','Food','Main','Fried or Grilled, tzatziki, lemon.', 18.00,'13');

INSERT INTO RATINGITEM VALUES ('01', '2018-02-08', '02', 4, 'Amazing!');
INSERT INTO RATINGITEM VALUES ('02', '2017-12-06', '05', 4, 'Great food!');
INSERT INTO RATINGITEM VALUES ('03', '2018-03-18', '08', 2, 'Could have been better, but still good for the price.');
INSERT INTO RATINGITEM VALUES ('05', '2017-05-08', '02', 3, 'Food didnt taste fresh.');

INSERT INTO LOCATIONS VALUES ('01','1998-03-09','Pearl Merrill','1-613-598-8031','329 Bank St, Ottawa, ON','08:00','20:00', '01');
INSERT INTO LOCATIONS VALUES ('02','1996-01-21','Kelly Cooke','1-613-848-9384','278 Dalhousie St, Ottawa, ON','08:00','20:00', '01');
INSERT INTO LOCATIONS VALUES ('03','1992-04-23','Leigh Beach','1-613-684-5622','14 Byward Market Square, Ottawa, ON K1N 7A1','08:00','23:00', '02');
INSERT INTO LOCATIONS VALUES ('04','1993-02-03','Unity Nash','1-613-084-7423','499 Terry Fox Dr, Kanata, ON K2T 1H7','09:00','23:00', '02');
INSERT INTO LOCATIONS VALUES ('05','2002-10-07','Bianca Yates','1-613-479-0329','1375 Baseline Rd, Ottawa, ON K2C 3G1','12:00','21:00', '03');
INSERT INTO LOCATIONS VALUES ('06','2006-11-12','Ariel Barrera','1-613-009-5475','115 Parent Ave, Ottawa, ON K1N 7B5','12:00','20:00','04');
INSERT INTO LOCATIONS VALUES ('07','1995-08-13','Jonah Garner','1-613-464-6142','1374 Baseline Rd, Ottawa, ON K2C 0A9','10:00','20:00', '05');
INSERT INTO LOCATIONS VALUES ('08','2014-01-11','Kiara Sandoval','1-613-016-4541','2677 Alta Vista Dr, Ottawa, ON K1V 7T5','11:00','21:00', '06');
INSERT INTO LOCATIONS VALUES ('09','2016-07-19','Ray Pittman','1-613-823-3272','3625 Rivergate Way, Ottawa, ON K1V 1Z9','09:00','20:00', '07');
INSERT INTO LOCATIONS VALUES ('10','1987-08-13','Iliana Graham','1-613-076-6260','261 Richmond Rd, Ottawa, ON K1Z 6X1','07:00','22:00', '08');
INSERT INTO LOCATIONS VALUES ('11','2006-10-13','Amal Davis','1-613-150-5002','464 Rideau St, Ottawa, ON K1N 5Z3','12:00','23:00:', '09');
INSERT INTO LOCATIONS VALUES ('12','2004-07-01','Stone West','1-613-753-5227','464 Bank St #2, Ottawa, ON K2P 1Z3','08:00','22:00', '09');
INSERT INTO LOCATIONS VALUES ('13','1992-11-19','Jason Marquez','1-613-527-1294','280 Metcalfe St, Ottawa, ON K2P 1R7','09:30','21:00', '10');
INSERT INTO LOCATIONS VALUES ('14','2007-05-19','Kirk Wilkinson','1-613-259-5495','1280 Baseline Rd, Ottawa, ON K2C 0A9','10:30','21:00', '11');
INSERT INTO LOCATIONS VALUES ('15','1990-12-15','Luke Mcdowell','1-613-121-4821','1103 Bank St, Ottawa, ON K1S 3X4','10:00','21:00', '12');
INSERT INTO LOCATIONS VALUES ('16','1984-04-08','Kasper Stanley','1-613-009-1293','438 Preston St, Ottawa, ON K1S 4N4','08:30','19:00', '13');


INSERT INTO MENUITEM VALUES ('45', 'Fries', 'Food', 'Starter', 'Double-fried to perfection with your choice of house made sauce.', 5.00, '01');
INSERT INTO MENUITEM VALUES ('46','Delux Nachos','Food','Starter','Salsa, jalapeño peppers, three cheese blend, black beans, roasted corn + guacamole or sour cream',10.99,'02');
INSERT INTO MENUITEM VALUES ('47','Mighty Angus','Food','Main','A juicy 100% Canadian Angus beef patty, topped with smoky Angus sauce, hickory smoked bacon pieces, crisp leaf lettuce, tomato, processed cheese and grilled onions, served on a sesame and poppy seed bun.', 8.00,'03');
INSERT INTO MENUITEM VALUES ('48','Papaya Salad','Food','Main','Papaya salad with shrimp and shrimp chips and peanuts', 7.95,'04');
INSERT INTO MENUITEM VALUES ('49','Satay','Food','Starter','Skewers of marinated chicken served with peanut sauce.', 9.95,'05');
INSERT INTO MENUITEM VALUES ('50','Coconut Rice','Food','Dessert','Traditional coconut rice.', 2.95,'05');
INSERT INTO MENUITEM VALUES ('51','Veal Chop','Food','Main', 'Grilled 12oz. veal chop with a basil pine nut pesto rub, served with gnocchi in a chipotle cream sauce with cherry tomatoes and sautéed greens.', 38.00,'07');
INSERT INTO MENUITEM VALUES ('52','Baklava','Food','Dessert', 'Pastry consisting of sheets of phyllo layered with chopped nuts, butter, and cinnamon, baked, and soaked in a honey or sugar syrup.',1.50,'09');
INSERT INTO MENUITEM VALUES ('53','Fruit salad','Food','Dessert','Daily variety of fresh fruits.', 5.00,'10');
INSERT INTO MENUITEM VALUES ('54','Banana Tempura','Food','Dessert','Coated in a light tempura batter and fried until golden.', 3.00,'11');
INSERT INTO MENUITEM VALUES ('55','Panini','Food','Main','Daily assortment of freshly made paninis and a side of soup or salad.', 18.00,'12');
INSERT INTO MENUITEM VALUES ('56','Soup','Food','Starter','Soup of the day.', 18.00,'12');
INSERT INTO MENUITEM VALUES ('57',' Frappe','Beverage','Dessert','Iced, shaken, instant coffee.', 4.00,'13');


INSERT INTO RATING VALUES ('12','2015-05-17 ',2,1,1,3,'Great food and service.','10');
INSERT INTO RATING VALUES ('03','2014-02-23 ',2,2,4,4,'Nice atmosphere.','11');
INSERT INTO RATING VALUES ('12','2014-12-25 ',3,5,2,2,'Great food!','03');
INSERT INTO RATING VALUES ('10','2014-03-19 ',5,2,5,4,'N/A','07');
INSERT INTO RATING VALUES ('13','2016-03-19 ',5,5,3,4,'N/A','12');


INSERT INTO RATER VALUES ('21','digula.qyam@Cras.com','John','2017-03-28 ','Online',2);

INSERT INTO RATING VALUES ('21','2017-03-31 ',2,3,3,1,'Good food!','01');

