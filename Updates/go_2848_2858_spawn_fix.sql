-- Fix spawn times for Pillar of Opal and Pillar of Amethyst

UPDATE `gameobject` SET `spawntimesecs` = '2' WHERE `id` IN ('2848','2858');