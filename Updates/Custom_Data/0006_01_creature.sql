
-- Mo'arg Forgefiend
SET @GUID := '59516';

DELETE FROM `creature` WHERE `guid`=@GUID;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(@GUID, '16946', '530', '1', '0', '0', '346.7749', '2238.071', '119.0799', '4.683131', '300	', '0', '0', '5158', '0', '0', '2');

UPDATE `creature` SET `position_x`='352.1310', `position_y`='2184.019', `position_z`='118.1270', `orientation`='1.2042770', `spawndist`='0', `MovementType`='2' WHERE `guid`='58976';
UPDATE `creature` SET `position_x`='386.5509', `position_y`='2500.263', `position_z`='150.6602', `orientation`='0.9773844', `spawndist`='0', `MovementType`='2' WHERE `guid`='58977';
UPDATE `creature` SET `position_x`='465.6350', `position_y`='2500.467', `position_z`='158.4418', `orientation`='1.6961510', `spawndist`='0', `MovementType`='2' WHERE `guid`='58978';
UPDATE `creature` SET `position_x`='599.9173', `position_y`='2796.910', `position_z`='222.7564', `orientation`='1.6038840', `spawndist`='0', `MovementType`='2' WHERE `guid`='58979';
UPDATE `creature` SET `position_x`='518.7199', `position_y`='2787.585', `position_z`='213.9373', `orientation`='3.4208450', `spawndist`='0', `MovementType`='2' WHERE `guid`='58980';
