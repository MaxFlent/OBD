-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Гру 27 2023 р., 18:34
-- Версія сервера: 10.4.32-MariaDB
-- Версія PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `laba2`
--

-- --------------------------------------------------------

--
-- Структура таблиці `administrator`
--

CREATE TABLE `administrator` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `administrator`
--

INSERT INTO `administrator` (`id`, `ticket_id`, `name`, `phone_number`) VALUES
(1, 2, 'Пилипенко Олена Андріївна', 380684569874),
(2, 3, 'Носенко Олег Павлович', NULL),
(3, 1, 'Лачен Ігор Васильович', 380635876952),
(4, 3, 'Янков Ігор Сергійович', 380765414225);

-- --------------------------------------------------------

--
-- Структура таблиці `cashier`
--

CREATE TABLE `cashier` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` bigint(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `cashier`
--

INSERT INTO `cashier` (`id`, `ticket_id`, `name`, `phone_number`) VALUES
(1, 2, 'Кравченко Михайло Андрійович', 380695145785),
(2, 3, 'Петренко Ігор Анатолійович', 380668511225),
(3, 1, 'Радченко Василь Михайлович', 380654521345),
(4, 1, 'Іваненко Олег Олександрович', 380955451785);

-- --------------------------------------------------------

--
-- Структура таблиці `cinema`
--

CREATE TABLE `cinema` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `location` varchar(400) NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `cinema`
--

INSERT INTO `cinema` (`id`, `name`, `location`, `client_id`) VALUES
(1, 'HOLLYWOOD', 'вулиця 77-ї Гвардійської Дивізії, 1В, Чернігів, Чернігівська область, 14000', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `number` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `clients`
--

INSERT INTO `clients` (`id`, `name`, `password`, `number`, `email`) VALUES
(1, 'Куторга Руслан Олександрович', '1234', '+380658547145', 'ruslanochka@gmail.com'),
(2, 'Макс', '1234', '+380658514087', 'dwadwADAWD@gmail.com'),
(3, 'Русланенко Руслан Русланович', '4321', '+380658741547', 'ruslan@gmail.com'),
(4, 'Корж Максим Миколайович', '333', '+380658741547', 'maksimkorzh1@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблиці `film`
--

CREATE TABLE `film` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `duration` int(10) NOT NULL,
  `film_director` varchar(100) NOT NULL,
  `protagonists` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `film`
--

INSERT INTO `film` (`id`, `name`, `duration`, `film_director`, `protagonists`) VALUES
(1, 'Шалений Макс: Дорога гніву', 120, 'Джордж Міллер', 'Макс Рокатанскі, Імператриця Фуріоса, Накс'),
(2, 'Легенди', 131, 'Браян Гельгеланд', 'Рональд Крей, Реджинальд Крей, Френсіс Ши'),
(3, 'Воїн', 140, 'Ґевін О\'Коннор', 'Томмі Конлон, Брендан Конлон, Педді Конлон');

-- --------------------------------------------------------

--
-- Структура таблиці `ticket`
--

CREATE TABLE `ticket` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `film_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_price` int(10) NOT NULL,
  `spectator_place` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп даних таблиці `ticket`
--

INSERT INTO `ticket` (`id`, `film_id`, `ticket_price`, `spectator_place`) VALUES
(1, 1, 160, 18),
(2, 3, 165, 25),
(3, 2, 155, 31);

-- --------------------------------------------------------

--
-- Структура таблиці `viewer`
--

CREATE TABLE `viewer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` bigint(20) UNSIGNED NOT NULL,
  `film_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `Age` int(10) NOT NULL,
  `State` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `administrator`
--
ALTER TABLE `administrator`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Індекси таблиці `cashier`
--
ALTER TABLE `cashier`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Індекси таблиці `cinema`
--
ALTER TABLE `cinema`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `client_id` (`client_id`) USING BTREE;

--
-- Індекси таблиці `clients`
--
ALTER TABLE `clients`
  ADD UNIQUE KEY `id` (`id`);

--
-- Індекси таблиці `film`
--
ALTER TABLE `film`
  ADD UNIQUE KEY `id` (`id`);

--
-- Індекси таблиці `ticket`
--
ALTER TABLE `ticket`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `film_id` (`film_id`);

--
-- Індекси таблиці `viewer`
--
ALTER TABLE `viewer`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `client_id` (`client_id`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `cashier`
--
ALTER TABLE `cashier`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `cinema`
--
ALTER TABLE `cinema`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблиці `film`
--
ALTER TABLE `film`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `viewer`
--
ALTER TABLE `viewer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `cashier`
--
ALTER TABLE `cashier`
  ADD CONSTRAINT `cashier_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `cinema`
--
ALTER TABLE `cinema`
  ADD CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Обмеження зовнішнього ключа таблиці `viewer`
--
ALTER TABLE `viewer`
  ADD CONSTRAINT `viewer_ibfk_2` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viewer_ibfk_3` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viewer_ibfk_4` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
