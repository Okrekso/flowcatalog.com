-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 11 2018 г., 11:11
-- Версия сервера: 5.6.37
-- Версия PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `FShop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ADMINS`
--

CREATE TABLE `ADMINS` (
  `ID` int(11) NOT NULL,
  `Full_name` varchar(255) DEFAULT NULL,
  `Access_level` int(11) NOT NULL DEFAULT '5',
  `Email` varchar(255) DEFAULT NULL,
  `Pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ADMINS`
--

INSERT INTO `ADMINS` (`ID`, `Full_name`, `Access_level`, `Email`, `Pass`) VALUES
(1, 'Test Tester Testerov', 1, 'test@test', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `COMMENTS`
--

CREATE TABLE `COMMENTS` (
  `ID` int(11) NOT NULL,
  `Content` text,
  `Points` int(11) DEFAULT '1',
  `UID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ORDERS`
--

CREATE TABLE `ORDERS` (
  `ID` int(11) NOT NULL,
  `Product_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Payment` int(11) NOT NULL DEFAULT '0',
  `Address` varchar(255) DEFAULT NULL,
  `Responsible_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ORDERS`
--

INSERT INTO `ORDERS` (`ID`, `Product_id`, `User_id`, `Payment`, `Address`, `Responsible_admin`) VALUES
(1, 1, 1, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `SHOP`
--

CREATE TABLE `SHOP` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Price` double(15,2) DEFAULT NULL,
  `Tags` varchar(255) DEFAULT NULL,
  `Img` varchar(255) DEFAULT NULL,
  `Count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SHOP`
--

INSERT INTO `SHOP` (`ID`, `Name`, `Price`, `Tags`, `Img`, `Count`) VALUES
(1, 'Coca Cola', 14.99, 'Food;Drinks', 'https://picua.org/images/2018/09/07/defe9202453702b5e5b8f33dabc932f8.md.png', 10),
(2, 'Pizza Mozarella', 68.99, 'Food;Italian', 'https://image.ibb.co/nRi3vU/pizza.png', 1),
(3, 'Fried potatoes', 25.50, 'Food;', 'https://images.media-allrecipes.com/userphotos/250x250/930253.jpg', NULL),
(4, 'Pepsi cola', 10.50, 'Food;Drinks;', 'https://vignette.wikia.nocookie.net/pepsi/images/3/38/Pepsi_Cola_12_OZ_Aluminum_Can.png/revision/latest?cb=20171019023202', 30),
(5, 'Muffin', 26.99, 'Food;Pies;', 'http://www.stickpng.com/assets/images/589605c8cba9841eabab60f1.png', 10),
(6, 'Chocolate Muffin', 30.00, 'Food;Pies;', 'https://orig00.deviantart.net/84a2/f/2012/043/4/e/chocolate_muffin_png_by_miamh25-d4phjce.png', 8),
(7, 'Snickers', 15.50, 'Food;Sneaks;', 'https://vignette.wikia.nocookie.net/epicrapbattlesofhistory/images/a/a8/Snickers.png/revision/latest?cb=20150802062002', 50);

-- --------------------------------------------------------

--
-- Структура таблицы `USERS`
--

CREATE TABLE `USERS` (
  `ID` int(11) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Pass` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Surname` varchar(255) DEFAULT NULL,
  `Patronymic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `USERS`
--

INSERT INTO `USERS` (`ID`, `Email`, `Pass`, `Name`, `Surname`, `Patronymic`) VALUES
(1, 'Test@gmail.com', '123', 'Test_user', 'Test_user', 'Test_user');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `ADMINS`
--
ALTER TABLE `ADMINS`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `UID_f` (`UID`);

--
-- Индексы таблицы `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Product_id_f` (`Product_id`),
  ADD KEY `User_id_f` (`User_id`),
  ADD KEY `Admin_f` (`Responsible_admin`);

--
-- Индексы таблицы `SHOP`
--
ALTER TABLE `SHOP`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `USERS`
--
ALTER TABLE `USERS`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ADMINS`
--
ALTER TABLE `ADMINS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `COMMENTS`
--
ALTER TABLE `COMMENTS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ORDERS`
--
ALTER TABLE `ORDERS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `SHOP`
--
ALTER TABLE `SHOP`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `USERS`
--
ALTER TABLE `USERS`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `COMMENTS`
--
ALTER TABLE `COMMENTS`
  ADD CONSTRAINT `UID_f` FOREIGN KEY (`UID`) REFERENCES `USERS` (`ID`);

--
-- Ограничения внешнего ключа таблицы `ORDERS`
--
ALTER TABLE `ORDERS`
  ADD CONSTRAINT `Admin_f` FOREIGN KEY (`Responsible_admin`) REFERENCES `ADMINS` (`ID`),
  ADD CONSTRAINT `Product_id_f` FOREIGN KEY (`Product_id`) REFERENCES `SHOP` (`ID`),
  ADD CONSTRAINT `User_id_f` FOREIGN KEY (`User_id`) REFERENCES `USERS` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
