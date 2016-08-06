-- Fix Quest 3701 (The Smoldering Ruins of Thaurissan)

SET @RELIC = '153556'; -- Thaurissan Relic

UPDATE `mangos`.`gameobject_template` SET `data1` = 3701 WHERE `entry` = @RELIC;
