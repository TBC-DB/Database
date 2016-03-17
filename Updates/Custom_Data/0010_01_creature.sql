
-- Dread Tactician
UPDATE `creature` SET `position_x`='-296.4266', `position_y`='1568.856', `position_z`='41.835220', `orientation`='3.729646', `spawndist`='0', `MovementType`='2' WHERE `guid`='59170';
UPDATE `creature` SET `position_x`='-133.5336', `position_y`='1582.918', `position_z`='42.812290', `orientation`='6.205007', `spawndist`='0', `MovementType`='2' WHERE `guid`='59171';

-- Shattered Hand Berserker
DELETE FROM `creature` WHERE `guid` IN ('58280', '58296');
UPDATE `creature` SET `position_x`='-432.5425', `position_y`='3016.569', `position_z`='-16.84295', `orientation`='5.780838', `spawndist`='0', `MovementType`='2' WHERE `guid`='58295';
