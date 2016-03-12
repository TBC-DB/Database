
-- Fel Reaver
SET @GUID := '67185';

DELETE FROM `creature` WHERE `guid`=@GUID;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(@GUID, '18733', '530', '1', '0', '0', '511.3207', '3043.288', '13.94431', '3.070376', '1800', '0', '0', '104790', '0', '0', '2');

-- -------------------------------------------------------------------------------------------------------------------------------

-- Fel Reaver
SET @GUID := '67001';

UPDATE `creature` SET `position_x`='-32.4071', `position_y`='1854.05', `position_z`='59.763', `orientation`='2.098692', `spawntimesecs`='1800', `spawndist`='0', `MovementType`='2' WHERE `guid`=@GUID;
