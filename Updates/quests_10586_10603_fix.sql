-- Fix drop chance of item 30689 (Razuun's Orders) for quests 10586, 10603 (Bring Down the Warbringer!)

UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '-100' WHERE `entry` = '21287' AND `item` = '30689';
