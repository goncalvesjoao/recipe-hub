-- =========================
-- USERS
-- =========================
INSERT INTO users VALUES
(1, 'john@example.com', 'John', 'https://i.pravatar.cc/100?img=1'),
(2, 'maria@example.com', 'Maria', 'https://i.pravatar.cc/100?img=2'),
(3, 'alex@example.com', 'Alex', 'https://i.pravatar.cc/100?img=3'),
(4, 'sara@example.com', 'Sara', 'https://i.pravatar.cc/100?img=4'),
(5, 'ken@example.com', 'Ken', 'https://i.pravatar.cc/100?img=5');

-- =========================
-- INGREDIENTS
-- =========================
INSERT INTO ingredients VALUES
(1,'Spaghetti'),
(2,'Egg'),
(3,'Pancetta'),
(4,'Parmesan'),
(5,'Chicken'),
(6,'Rice'),
(7,'Soy Sauce'),
(8,'Garlic'),
(9,'Onion'),
(10,'Tomato'),
(11,'Beef'),
(12,'Potato'),
(13,'Carrot'),
(14,'Milk'),
(15,'Butter'),
(16,'Flour'),
(17,'Sugar'),
(18,'Salt'),
(19,'Pepper'),
(20,'Olive Oil');

-- =========================
-- RECIPES (25)
-- =========================
INSERT INTO recipes VALUES
(1,1,'Spaghetti Carbonara','Cook pasta. Mix eggs and cheese. Combine.',600,900,'https://picsum.photos/seed/1/600/400'),
(2,2,'Chicken Fried Rice','Cook rice. Stir fry chicken and mix.',500,800,'https://picsum.photos/seed/2/600/400'),
(3,3,'Beef Stew','Simmer beef with vegetables.',900,3600,'https://picsum.photos/seed/3/600/400'),
(4,4,'Tomato Pasta','Cook pasta and tomato sauce.',400,700,'https://picsum.photos/seed/4/600/400'),
(5,5,'Garlic Chicken','Cook chicken with garlic.',300,900,'https://picsum.photos/seed/5/600/400'),
(6,1,'Mashed Potatoes','Boil and mash potatoes.',300,600,'https://picsum.photos/seed/6/600/400'),
(7,2,'Omelette','Beat eggs and cook.',200,300,'https://picsum.photos/seed/7/600/400'),
(8,3,'Grilled Chicken','Season and grill chicken.',400,1200,'https://picsum.photos/seed/8/600/400'),
(9,4,'Beef Stir Fry','Cook beef with vegetables.',300,700,'https://picsum.photos/seed/9/600/400'),
(10,5,'Pancakes','Mix batter and cook.',300,600,'https://picsum.photos/seed/10/600/400'),
(11,1,'French Toast','Dip bread and fry.',200,400,'https://picsum.photos/seed/11/600/400'),
(12,2,'Chicken Soup','Boil chicken with vegetables.',600,1800,'https://picsum.photos/seed/12/600/400'),
(13,3,'Rice Bowl','Cook rice with toppings.',300,600,'https://picsum.photos/seed/13/600/400'),
(14,4,'Garlic Pasta','Cook pasta with garlic oil.',300,500,'https://picsum.photos/seed/14/600/400'),
(15,5,'Beef Burger','Grill beef patty.',400,800,'https://picsum.photos/seed/15/600/400'),
(16,1,'Chicken Salad','Mix chicken with vegetables.',300,400,'https://picsum.photos/seed/16/600/400'),
(17,2,'Fried Potatoes','Fry sliced potatoes.',200,500,'https://picsum.photos/seed/17/600/400'),
(18,3,'Tomato Soup','Cook tomatoes and blend.',400,900,'https://picsum.photos/seed/18/600/400'),
(19,4,'Scrambled Eggs','Cook eggs slowly.',200,300,'https://picsum.photos/seed/19/600/400'),
(20,5,'Beef Tacos','Cook beef and assemble.',400,700,'https://picsum.photos/seed/20/600/400'),
(21,1,'Chicken Curry','Cook chicken with spices.',600,1800,'https://picsum.photos/seed/21/600/400'),
(22,2,'Vegetable Stir Fry','Cook mixed vegetables.',300,500,'https://picsum.photos/seed/22/600/400'),
(23,3,'Mac and Cheese','Cook pasta with cheese.',400,700,'https://picsum.photos/seed/23/600/400'),
(24,4,'Roasted Chicken','Roast whole chicken.',900,3600,'https://picsum.photos/seed/24/600/400'),
(25,5,'Chocolate Cake','Bake cake batter.',900,1800,'https://picsum.photos/seed/25/600/400');

-- =========================
-- RECIPE INGREDIENTS (sample coverage)
-- =========================
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity, measuring_unit) VALUES
(1,1,200,'g'), (1,2,2,'units'), (1,3,100,'g'), (1,4,50,'g'),
(2,5,150,'g'), (2,6,200,'g'), (2,7,2,'tbsp'),
(3,11,300,'g'), (3,12,2,'units'), (3,13,1,'unit'),
(4,1,200,'g'), (4,10,2,'units'),
(5,5,200,'g'), (5,8,3,'cloves'),
(6,12,3,'units'), (6,15,20,'g'),
(7,2,3,'units'),
(8,5,200,'g'),
(9,11,200,'g'), (9,9,1,'unit'),
(10,16,200,'g'), (10,14,300,'ml'), (10,17,50,'g'),
(11,2,2,'units'), (11,14,100,'ml'),
(12,5,200,'g'), (12,13,1,'unit'),
(13,6,200,'g'),
(14,1,200,'g'), (14,8,2,'cloves'),
(15,11,200,'g'),
(16,5,150,'g'),
(17,12,3,'units'),
(18,10,4,'units'),
(19,2,3,'units'),
(20,11,200,'g'),
(21,5,200,'g'),
(22,13,2,'units'),
(23,1,200,'g'), (23,4,100,'g'),
(24,5,500,'g'),
(25,16,200,'g'), (25,17,100,'g'), (25,14,200,'ml');

-- =========================
-- LIKES (distribution)
-- =========================
INSERT INTO recipe_user_likes (user_id, recipe_id) VALUES
(1,2),(1,3),(1,4),(1,5),
(2,1),(2,3),(2,6),(2,7),
(3,1),(3,2),(3,8),(3,9),
(4,1),(4,2),(4,3),(4,10),
(5,1),(5,4),(5,5),(5,6),
(1,10),(2,11),(3,12),(4,13),(5,14),
(1,15),(2,16),(3,17),(4,18),(5,19),
(1,20),(2,21),(3,22),(4,23),(5,24),
(1,25),(2,25),(3,25),(4,25),(5,25);
