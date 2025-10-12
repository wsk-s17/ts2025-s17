SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ts2025-module-b`
--

-- --------------------------------------------------------

--
-- Структура таблицы `applications`
--

CREATE TABLE `applications` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('PENDING','APPROVED','CANCELED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `category_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `applications`
--

INSERT INTO `applications` (`id`, `status`, `category_id`, `user_id`) VALUES
('6ce341e2-7778-43c7-a083-c78d521e7c51', 'PENDING', 'a1244ed1-d541-46f7-8b83-303842f97d36', '00d3a44c-5550-4ba2-bbf7-b10276e38e90'),
('b6420843-2af0-4509-b47c-4f11ba4b3f00', 'PENDING', 'a1244ed1-d541-46f7-8b83-303842f97d36', '16cae386-6d4e-4b61-be24-e9c68bc34028');

-- --------------------------------------------------------

--
-- Структура таблицы `balance_histories`
--

CREATE TABLE `balance_histories` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('REPLENISHMENT','WITHDRAWAL','RENTAL','MODERATION_REWARD') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int NOT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `balance_histories`
--

INSERT INTO `balance_histories` (`id`, `type`, `value`, `user_id`, `created_at`) VALUES
('301a8b37-af15-4b91-aa2e-9d242644f75d', 'RENTAL', 3900, '16cae386-6d4e-4b61-be24-e9c68bc34028', '2025-10-01 18:14:28.834'),
('3a5467a2-0fa6-4789-9f64-43a5e92028ef', 'REPLENISHMENT', 5000, '16cae386-6d4e-4b61-be24-e9c68bc34028', '2025-10-01 18:14:28.823'),
('3f45a77a-6aa3-41a1-8792-290b979886e5', 'MODERATION_REWARD', 1980, '16cae386-6d4e-4b61-be24-e9c68bc34028', '2025-10-01 18:14:28.838'),
('7229d1a4-33f1-4c74-b916-c93cfe540cd0', 'WITHDRAWAL', 1235, '16cae386-6d4e-4b61-be24-e9c68bc34028', '2025-10-01 18:14:28.830'),
('989744f6-a1fd-4d88-b456-200e3f426dd2', 'REPLENISHMENT', 2000, '16cae386-6d4e-4b61-be24-e9c68bc34028', '2025-10-01 18:14:28.827');

-- --------------------------------------------------------

--
-- Структура таблицы `bicycles`
--

CREATE TABLE `bicycles` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage_of_wear` int NOT NULL DEFAULT '0',
  `location_x` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_y` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('AVAILABLE','UNAVAILABLE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'AVAILABLE',
  `path_to_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bicycles`
--

INSERT INTO `bicycles` (`id`, `name`, `slug`, `description`, `percentage_of_wear`, `location_x`, `location_y`, `status`, `path_to_image`, `category_id`) VALUES
('25fcd20d-2af7-404a-afa4-2b63b4d1f864', 'Roadster', 'roadster', 'Lightweight and fast bike for comfortable rides around the city and on smooth roads.', 0, '1375.15', '1116.05', 'AVAILABLE', 'bicycle-2.jpg', 'a1244ed1-d541-46f7-8b83-303842f97d36'),
('281bb00a-bbfd-4b48-a439-02e696ae99e2', 'SwiftRide', 'swift-ride', 'Agile city bike with an upright seating position, ideal for everyday short-distance trips.', 35, '132.68', '994.19', 'AVAILABLE', 'bicycle-3.jpg', 'a1244ed1-d541-46f7-8b83-303842f97d36'),
('cd7f1320-3b77-44db-9c2b-a3b98e9f6a0c', 'MountainX', 'mountain-x', 'Durable mountain bike with suspension and wide tires, designed for riding on rough terrain.', 0, '3197.13', '125.05', 'AVAILABLE', 'bicycle-1.jpg', 'a1244ed1-d541-46f7-8b83-303842f97d36'),
('cd7f1320-3b77-44db-9c2b-a3b98e9f6a1c', 'Unavailable', 'unavailable', 'test', 0, '1197.13', '1125.05', 'UNAVAILABLE', 'bicycle-1.jpg', 'a1244ed1-d541-46f7-8b83-303842f97d36');

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_per_min` int NOT NULL,
  `full_price` int DEFAULT NULL,
  `rating` smallint DEFAULT NULL,
  `userRating` smallint DEFAULT NULL,
  `percentage_of_wear` int DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `ended_at` datetime(3) DEFAULT NULL,
  `bicycle_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tariff_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_code_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photos` json DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `price_per_min`, `full_price`, `rating`, `userRating`, `percentage_of_wear`, `started_at`, `ended_at`, `bicycle_id`, `tariff_id`, `user_id`, `promo_code_id`, `photos`) VALUES
('09bea923-8620-45e0-b7c9-079f528670c3', 70, 980, 5, NULL, 8, '2025-10-01 18:14:28.905', '2025-10-01 18:28:28.905', '25fcd20d-2af7-404a-afa4-2b63b4d1f864', 'b9966acb-bddd-4dd3-95c4-1cb281263d95', '00d3a44c-5550-4ba2-bbf7-b10276e38e90', NULL, '\"[\\\"bicycle-1.jpg\\\",\\\"bicycle-2.jpg\\\"]\"'),
('1da082fc-d13b-4c9f-acea-f55c4d85e1b9', 50, 400, 5, NULL, 4, '2025-10-01 18:14:28.909', '2025-10-01 18:22:28.909', '25fcd20d-2af7-404a-afa4-2b63b4d1f864', '98dde7bf-a6ad-4d7d-bf26-6de7070310eb', '00d3a44c-5550-4ba2-bbf7-b10276e38e90', NULL, '\"[\\\"bicycle-1.jpg\\\",\\\"bicycle-2.jpg\\\"]\"'),
('2492d40c-3fab-437a-b0bf-9c621ac18403', 100, 3000, 4, NULL, 14, '2025-10-01 18:14:28.915', '2025-10-01 18:44:28.915', '25fcd20d-2af7-404a-afa4-2b63b4d1f864', '98dde7bf-a6ad-4d7d-bf26-6de7070310eb', '00d3a44c-5550-4ba2-bbf7-b10276e38e90', NULL, '\"[\\\"bicycle-1.jpg\\\",\\\"bicycle-2.jpg\\\"]\"'),
('3153c753-4911-4aed-aa3d-947a29a08982', 30, 60, NULL, NULL, 2, '2025-10-01 18:14:28.919', '2025-10-01 18:16:28.919', '281bb00a-bbfd-4b48-a439-02e696ae99e2', 'b9966acb-bddd-4dd3-95c4-1cb281263d95', '16cae386-6d4e-4b61-be24-e9c68bc34028', NULL, '\"[\\\"bicycle-1.jpg\\\",\\\"bicycle-2.jpg\\\"]\"'),
('805eb83e-3d3f-4844-87d3-d1ae6ab8309e', 20, 100, 4, NULL, 5, '2025-10-01 18:14:28.894', '2025-10-01 18:19:28.894', 'cd7f1320-3b77-44db-9c2b-a3b98e9f6a0c', 'b9966acb-bddd-4dd3-95c4-1cb281263d95', '00d3a44c-5550-4ba2-bbf7-b10276e38e90', NULL, '\"[\\\"bicycle-1.jpg\\\",\\\"bicycle-2.jpg\\\"]\"');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rent_conditions` json DEFAULT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `rent_conditions`, `user_id`) VALUES
('1115ce64-8472-4104-a713-de40a14f61c7', 'Mountain Bicycles', NULL, '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('a1244ed1-d541-46f7-8b83-303842f97d36', 'City Bicycles', NULL, '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('a19c11c1-d564-489b-b3f5-cac9659f2ffe', 'City Bicycles', NULL, 'bfd6c6dd-a6c1-42fb-a4b5-221934d3de17');

-- --------------------------------------------------------

--
-- Структура таблицы `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_percent` int DEFAULT NULL,
  `free_minutes` int DEFAULT NULL,
  `expires_at` datetime(3) NOT NULL,
  `category_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `promo_codes` (`id`, `code`, `discount_percent`, `free_minutes`, `expires_at`, `category_id`) VALUES
('b1a2e3f4-1234-4abc-9def-000000000001', 'OLD2024', 15, 10, '2024-12-31 23:59:59', 'a1244ed1-d541-46f7-8b83-303842f97d36'),

('c2b3d4e5-2345-4def-9abc-000000000002', 'WELCOME10', 10, NULL, '2025-12-31 23:59:59', 'a1244ed1-d541-46f7-8b83-303842f97d36'),
('d3c4e5f6-3456-4abc-9def-000000000003', 'FREERIDE30', NULL, 30, '2026-01-15 23:59:59', 'a1244ed1-d541-46f7-8b83-303842f97d36');

-- --------------------------------------------------------

--
-- Структура таблицы `tariffs`
--

CREATE TABLE `tariffs` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('STATIC','DYNAMIC') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'STATIC',
  `base_price` int NOT NULL,
  `min_price` int DEFAULT NULL,
  `max_price` int DEFAULT NULL,
  `category_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tariffs`
--

INSERT INTO `tariffs` (`id`, `name`, `type`, `base_price`, `min_price`, `max_price`, `category_id`, `deleted_at`) VALUES
('98dde7bf-a6ad-4d7d-bf26-6de7070310eb', 'Economy', 'DYNAMIC', 75, 25, 150, 'a1244ed1-d541-46f7-8b83-303842f97d36', NULL),
('b9966acb-bddd-4dd3-95c4-1cb281263d95', 'Standard', 'STATIC', 100, NULL, NULL, 'a1244ed1-d541-46f7-8b83-303842f97d36', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `balance`, `password`) VALUES
('00d3a44c-5550-4ba2-bbf7-b10276e38e90', 'User 3', 'user3@gmail.com', '+77777777773', 10000, '$argon2id$v=19$m=65536,t=3,p=4$+nZVBxtlY1QsvF1IkWPfAQ$1ZQcxOGjvWtWMAGhAFa20x7AQVgkxxPxQz7r3ATGDmk'),
('16cae386-6d4e-4b61-be24-e9c68bc34028', 'User 4', 'user4@gmail.com', '+77777777774', 13845, '$argon2id$v=19$m=65536,t=3,p=4$xyDIAlRpWQ7ql3pbnscUnw$B8APqx0BUjNp46YoZWlRQK7JiuKjSkYJIbI2xyDvBR0'),
('33cb78e6-8d94-465a-9e25-cda6c8cca3cd', 'User 1', 'user1@gmail.com', '+77777777771', 20000, '$argon2id$v=19$m=65536,t=3,p=4$ng5JfHFJli16YxaD20WMDA$E3lxh9g6dYiqFNcGGPW/+Ks78TZNA0aUOzF6u+za294'),
('bfd6c6dd-a6c1-42fb-a4b5-221934d3de17', 'User 2', 'user2@gmail.com', '+77777777772', 10000, '$argon2id$v=19$m=65536,t=3,p=4$+CPjlyaOSBSTmJ2XdajhSQ$pdxctUmZgrDzfhmgzq971p5IWwAr6AFb48eJQoI8+9I');

-- --------------------------------------------------------

--
-- Структура таблицы `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_tokens`
--

INSERT INTO `user_tokens` (`id`, `value`, `hash`, `user_id`) VALUES
('0500ec79-c54c-49ca-a4bb-48123c822bdd', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNiwiZXhwIjoxNzU5NTk4MTM2LCJqdGkiOiJkNTJhZjU1Ni01YjAzLTRiOTUtYjE4My1mNWMzNDIyNzZjOTgifQ.uft1WkJAxbbfy98UzioT9iVnf0sGfDJ2nSf4adPjvlc', '9efb25c288433ef35bbac89a910b00200655b13672fd9f7ac0f91e5be87158e7', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('0eca01c2-13f5-4456-957f-fc108e6bb6d1', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNiwiZXhwIjoxNzU5NTk4MTM2LCJqdGkiOiI0ZTgxMGZlNS1hYjM5LTQxN2ItYjFlMi03YWQ5MjE0OWNiNjMifQ.9Rps1uZcwd08MaTC6wbN3R_ruo_d3k4rl7Mt-DDJUYE', '3eb22c3ef6010a94975df6a0f36910475cbd2cdbb3827e02f149d71389b752a0', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('213d1bb7-18d7-4e29-9966-8820ae523e18', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNSwiZXhwIjoxNzU5NTk4MTM1LCJqdGkiOiI1NjRjOWY1My02YjE5LTQwNzEtYTY1Mi1hYTdiOTUxY2RiZGQifQ.Z9azh9Varq9JLNh3yxRdVewCQ0SLg77eFfVLZOnRO7g', '5a55bfdc8f5c2f8012fab0f831dad8f53994c163d34297d41e99f709dcfb42db', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('72df5b00-794f-4522-9610-045f216a2cf5', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNSwiZXhwIjoxNzU5NTk4MTM1LCJqdGkiOiI3YWJjYTU2NS04YmE4LTQ2YjYtYWJlZC1hMjdlMTVkYTc5OGUifQ.Y_rbr5-o_Li9EKdiD2yePLM9Y84jFJLOO1qeOkWv_Nc', '620b6d90031ff09bccb75dbc9857f1be99906ce124f67f5b441313f16befb031', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('8fac4153-69f9-4f02-9570-b6c385fc24d9', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNiwiZXhwIjoxNzU5NTk4MTM2LCJqdGkiOiI3MGUyZWRkNS00MjY3LTQxNjgtOWViMS1hYzQ2NTg1ZTRhZTcifQ.hwbsdMTFIrryFD1l_KS_9fUcytkLcXJLS51qPMncTpE', '92a362086e4b8ab7330aa18900e3531f8c8cec4fc3f5e0a66fa7c6c278611e03', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('9c843267-a3ff-49da-ae57-bc48d30e60e5', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNSwiZXhwIjoxNzU5NTk4MTM1LCJqdGkiOiJlYmVmYjVlOS05MjBhLTQxMjctYTIyNi1kZjJkOTQzMDZjYTMifQ.K9w9cjRgb_fis1Dj_cIioyqrJhATgUOcqatYWwxxDto', '72f6224268217ad73757d4c5b2d4f75bea1f920883a335454cd2ab741d47636a', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('a112bf9a-4bd4-4a32-a4f4-360fee753d65', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNiwiZXhwIjoxNzU5NTk4MTM2LCJqdGkiOiJiOGYxNzE3OC03ZDZmLTQyYzctOGMwMy0yYzgzY2E5MzVkMDQifQ.wLzy-PZq6joOozXvTf6SH_y4OoR2OO3sA3BHkEtBrB0', '6d3341f8e6295b84665f71395e702aef2bca2b33fb183825a37ff2e5caccd979', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('c2b4c774-2e29-4b82-b64e-03a53656384f', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNiwiZXhwIjoxNzU5NTk4MTM2LCJqdGkiOiJiMWQ4NDlhYy1jOTY3LTQ5MjktOTljNS0yMWJmZDlhYWNjZDUifQ.C06_xLgYBYQL36VhxyQxcaR7e91wnxbchqgo5psyoFE', '1d59490c454e45883a20f18b3825351046915de3cb3d4c6a6203ce676387f844', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd'),
('ffae1663-9437-4a73-ae13-6b5830989c52', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXIxQGdtYWlsLmNvbSIsImlhdCI6MTc1OTQyNTMzNSwiZXhwIjoxNzU5NTk4MTM1LCJqdGkiOiIxNGM2MTM1Mi1lMjFmLTQ5M2QtYmMxMi00OTlhNmMwYmFkMjgifQ.FLa9k0Ww-BtZ-eYZa6jsZzEV8Q3KwprOzXyJA1xt6Mc', 'ecb7c587aaae5bf0ceb891fc3a69bbb549b2f9f709b19641b0b0f6ceb8af4cd7', '33cb78e6-8d94-465a-9e25-cda6c8cca3cd');

-- --------------------------------------------------------

--
-- Структура таблицы `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('714fe96c-1e4e-4053-b043-4e4c99ce26a1', 'c89cd8c9c3569dab4ca4bccf9a79f9d9ac39296cc70ac27c8ce8d0ffebef4d75', '2025-10-01 18:14:22.389', '20251001181420_init', NULL, NULL, '2025-10-01 18:14:21.003', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `applications_user_id_key` (`user_id`),
  ADD KEY `applications_category_id_fkey` (`category_id`);

--
-- Индексы таблицы `balance_histories`
--
ALTER TABLE `balance_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `balance_histories_user_id_fkey` (`user_id`);

--
-- Индексы таблицы `bicycles`
--
ALTER TABLE `bicycles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bicycles_slug_key` (`slug`),
  ADD KEY `bicycles_category_id_fkey` (`category_id`);

--
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_bicycle_id_fkey` (`bicycle_id`),
  ADD KEY `bookings_tariff_id_fkey` (`tariff_id`),
  ADD KEY `bookings_user_id_fkey` (`user_id`),
  ADD KEY `bookings_promo_code_id_fkey` (`promo_code_id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_user_id_fkey` (`user_id`);

--
-- Индексы таблицы `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promo_codes_code_key` (`code`),
  ADD KEY `promo_codes_category_id_fkey` (`category_id`);

--
-- Индексы таблицы `tariffs`
--
ALTER TABLE `tariffs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tariffs_category_id_fkey` (`category_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_key` (`email`);

--
-- Индексы таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_tokens_hash_key` (`hash`),
  ADD KEY `user_tokens_user_id_fkey` (`user_id`);

--
-- Индексы таблицы `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `balance_histories`
--
ALTER TABLE `balance_histories`
  ADD CONSTRAINT `balance_histories_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `bicycles`
--
ALTER TABLE `bicycles`
  ADD CONSTRAINT `bicycles_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_bicycle_id_fkey` FOREIGN KEY (`bicycle_id`) REFERENCES `bicycles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_promo_code_id_fkey` FOREIGN KEY (`promo_code_id`) REFERENCES `promo_codes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_tariff_id_fkey` FOREIGN KEY (`tariff_id`) REFERENCES `tariffs` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD CONSTRAINT `promo_codes_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `tariffs`
--
ALTER TABLE `tariffs`
  ADD CONSTRAINT `tariffs_category_id_fkey` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
