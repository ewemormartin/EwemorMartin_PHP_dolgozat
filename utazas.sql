-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Ápr 08. 12:08
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `utazas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `jarmu`
--

CREATE TABLE `jarmu` (
  `jarmuAzon` int(32) NOT NULL,
  `tipus` varchar(20) NOT NULL,
  `varosAzon` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `jarmu`
--

INSERT INTO `jarmu` (`jarmuAzon`, `tipus`, `varosAzon`) VALUES
(1, 'Honda', 1),
(2, 'Toyota', 4),
(3, 'BMW', 2),
(4, 'Skoda', 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sofor`
--

CREATE TABLE `sofor` (
  `soforAzon` int(32) NOT NULL,
  `vezetekNev` varchar(30) NOT NULL,
  `keresztNev` varchar(30) NOT NULL,
  `jarmuAzon` int(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `sofor`
--

INSERT INTO `sofor` (`soforAzon`, `vezetekNev`, `keresztNev`, `jarmuAzon`) VALUES
(1, 'Ewemor', 'Martin', 3),
(2, 'Kiss', 'Pista', 1),
(3, 'Csolti', 'Péter', 2),
(4, 'Béldy', 'Ádám', 4);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `varos`
--

CREATE TABLE `varos` (
  `varosAzon` int(32) NOT NULL,
  `nev` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `varos`
--

INSERT INTO `varos` (`varosAzon`, `nev`) VALUES
(1, 'Budapest'),
(2, 'Pécs'),
(3, 'Szeged'),
(4, 'Keszthely');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `jarmu`
--
ALTER TABLE `jarmu`
  ADD PRIMARY KEY (`jarmuAzon`),
  ADD KEY `varosAzon` (`varosAzon`);

--
-- A tábla indexei `sofor`
--
ALTER TABLE `sofor`
  ADD PRIMARY KEY (`soforAzon`),
  ADD KEY `jarmuAzon` (`jarmuAzon`);

--
-- A tábla indexei `varos`
--
ALTER TABLE `varos`
  ADD PRIMARY KEY (`varosAzon`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `jarmu`
--
ALTER TABLE `jarmu`
  MODIFY `jarmuAzon` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `sofor`
--
ALTER TABLE `sofor`
  MODIFY `soforAzon` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT a táblához `varos`
--
ALTER TABLE `varos`
  MODIFY `varosAzon` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `jarmu`
--
ALTER TABLE `jarmu`
  ADD CONSTRAINT `jarmu_ibfk_1` FOREIGN KEY (`varosAzon`) REFERENCES `varos` (`varosAzon`);

--
-- Megkötések a táblához `sofor`
--
ALTER TABLE `sofor`
  ADD CONSTRAINT `sofor_ibfk_1` FOREIGN KEY (`jarmuAzon`) REFERENCES `jarmu` (`jarmuAzon`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
