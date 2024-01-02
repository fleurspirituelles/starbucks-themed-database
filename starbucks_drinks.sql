create database if not exists starbucks;
use starbucks;

create table categories (
    category_id int primary key auto_increment,
    category_name varchar(50) not null
);

create table base_items (
    base_item_id int primary key auto_increment,
    base_item_name varchar(50) not null
);

create table sizes (
    size_id int primary key auto_increment,
    size_name varchar(50) not null
);

create table milks (
    milk_id int primary key auto_increment,
    milk_name varchar(50) not null
);

create table milk_temperatures (
    temperature_id int primary key auto_increment,
    temperature_name varchar(50) not null
);

create table espresso_roasts (
    roast_id int primary key auto_increment,
    roast_name varchar(50) not null
);

create table shots (
    shot_id int primary key auto_increment,
    shot_name varchar(50) not null
);

create table add_ins (
    add_in_id int primary key auto_increment,
    add_in_name varchar(50) not null
);

create table toppings (
    topping_id int primary key auto_increment,
    topping_name varchar(50) not null,
    category varchar(50) not null
);

create table flavor_pumps (
    pump_id int primary key auto_increment,
    flavor_name varchar(50) not null
);

create table prices (
    price_id int primary key auto_increment,
    size_id int,
    base_price decimal(5,2) not null,
    foreign key (size_id) references sizes(size_id)
);

insert into prices (size_id, base_price) values
(1, 1.50),
(2, 2.50),
(3, 3.50),
(4, 4.50),
(5, 6.50), 
(6, 8.50), 
(7, 10.50),
(8, 12.50);

create table drinks (
    drink_id int primary key auto_increment,
    drink_name varchar(255) not null,
    drink_type varchar(50) not null,
    category_id int,
    base_item_id int,
    foreign key (category_id) references categories(category_id),
    foreign key (base_item_id) references base_items(base_item_id)
);

create table menu (
    menu_id int primary key auto_increment,
    drink_id int,
    size_id int,
    milk_id int,
    temperature_id int,
    roast_id int,
    add_in_id int,
    topping_id int,
    pump_id int,
    base_item_id int,
    price decimal(4,2),
    foreign key (drink_id) references drinks(drink_id),
    foreign key (size_id) references sizes(size_id),
    foreign key (milk_id) references milks(milk_id),
    foreign key (temperature_id) references milk_temperatures(temperature_id),
    foreign key (roast_id) references espresso_roasts(roast_id),
    foreign key (add_in_id) references add_ins(add_in_id),
    foreign key (topping_id) references toppings(topping_id),
    foreign key (pump_id) references flavor_pumps(pump_id),
    foreign key (base_item_id) references base_items(base_item_id)
);