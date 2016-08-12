-- Fix requirements to drop Dragonmaw Shinbones (7131) for quest 1846 (Dragonmaw Shinbones)

UPDATE `quest_template` SET `ReqSourceId1` = '7131' WHERE `entry` = '1846';