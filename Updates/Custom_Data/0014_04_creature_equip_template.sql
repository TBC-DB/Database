
DELETE FROM `creature_equip_template` WHERE `entry` IN ('1566', '5593', '5594', '5595', '5596');
INSERT INTO `creature_equip_template` (`entry`, `equipentry1`, `equipentry2`, `equipentry3`) VALUES
('1566', '28365', '0'    , '0'),
('5593', '11019', '11019', '0'),
('5594', '22210', '22211', '0'),
('5595', '13336', '0'    , '0'),
('5596', '11365', '0'    , '0');
