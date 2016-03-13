
-- Razorsaw
SET @ENTRY := '20798';
set @ITEM := '29590';

UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=@ENTRY and`item`=@ITEM;
