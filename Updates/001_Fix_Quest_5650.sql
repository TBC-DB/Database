-- ==============================
-- Fix Quest 5650 Garment of Darkness
-- ==============================
UPDATE `quest_template` SET ReqCreatureOrGOId2 = 12428, ReqSpellCast1 = 2052, ReqSpellCast2 = 1243 WHERE entry = 5650;
