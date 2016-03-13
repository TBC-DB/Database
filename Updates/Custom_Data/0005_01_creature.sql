
-- Tagar Spinebreaker
SET @ENTRY := '19443';

DELETE FROM `creature` WHERE `guid`='85987';

UPDATE `creature` SET `position_x`='-440.0492', `position_y`='2970.065', `position_z`='7.508814', `orientation`='4.585325', `spawntimesecs`='1800', `spawndist`='0', `MovementType`='2' WHERE `id`=@ENTRY;
