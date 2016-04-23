-- q.9280 q.9369 'Replenishing the Healing Crystals'
UPDATE quest_template SET NextQuestId = 9409 WHERE Entry = 9280 AND Entry = 9369;
-- q.9371 'Botanist Taerix'
UPDATE quest_template SET PrevQuestId = 9409 WHERE Entry = 9371;
