
-- Bonechewer Raider
UPDATE `creature` SET `position_x`='-181.9185', `position_y`='2754.960', `position_z`='29.76429', `orientation`='0.4706351', `spawndist`='0', `MovementType`='2' WHERE `guid`='58703';
UPDATE `creature` SET `position_x`='-169.5699', `position_y`='2587.481', `position_z`='38.79408', `orientation`='1.7707180', `spawndist`='0', `MovementType`='2' WHERE `guid`='58707';
UPDATE `creature` SET `position_x`='-174.6418', `position_y`='2337.374', `position_z`='60.27502', `orientation`='0.8733066', `spawndist`='0', `MovementType`='2' WHERE `guid`='58710';
UPDATE `creature` SET `position_x`='-285.6413', `position_y`='2377.453', `position_z`='49.44769', `orientation`='1.1097160', `spawndist`='0', `MovementType`='2' WHERE `guid`='58709';
UPDATE `creature` SET `position_x`='-331.2074', `position_y`='2628.407', `position_z`='41.12315', `orientation`='5.5013020', `spawndist`='0', `MovementType`='2' WHERE `guid`='58708';
UPDATE `creature` SET `position_x`='-402.8730', `position_y`='2886.875', `position_z`='12.04784', `orientation`='1.5610350', `spawndist`='0', `MovementType`='2' WHERE `guid`='58705';
UPDATE `creature` SET `position_x`='-446.6853', `position_y`='2973.210', `position_z`='7.425929', `orientation`='5.2047230', `spawndist`='0', `MovementType`='2' WHERE `guid`='58704';
UPDATE `creature` SET `position_x`='-373.1331', `position_y`='2840.704', `position_z`='2.514051', `orientation`='5.2295210', `spawndist`='0', `MovementType`='2' WHERE `guid`='58706';

SET @GUID := '60702';
DELETE FROM `creature` WHERE `guid`=@GUID;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(@GUID, '16925', '530', '1', '0', '0', '-335.0468', '2752.976', '18.02921', '5.832601', '300', '0', '0', '3989', '0', '0', '2');
