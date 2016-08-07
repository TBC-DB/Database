-- Fix Quest 3701 (The Smoldering Ruins of Thaurissan)

SET @RELIC = '153556'; -- Thaurissan Relic
SET @VOICE = '8887'; -- A tormented voice

DELETE FROM `db_script_string` WHERE `entry` BETWEEN 2000000544 AND 2000000551;
DELETE FROM `dbscripts_on_go_use` where `id` IN (SELECT guid FROM `gameobject` WHERE `id` = @RELIC);

UPDATE `gameobject_template` SET `displayId` = 406, `data1` = 0, `flags` = 0, `size` = 2, `data3` = 3000  WHERE `entry` = @RELIC;

INSERT INTO `db_script_string` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES 
(2000000544,'You will perish here. <Your mind fills with visions of chaos and destruction.>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,NULL),
(2000000545,'Leave this place. <The relic emits a white hot arc of flame. A memory has been gained: A lone Dark Iron dwarf is surrounded by seven corpses, kneeling before a monolith of flame.>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,NULL),
(2000000546,'Defiler... you will be punished for this incursion. <A symbol of flame radiates from the relic before it crumbles to the earth.>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,NULL),
(2000000547,'Help us, outsider. <The relic crumbles to dust. A vision of eight Dark Iron dwarves performing some sort of ritual fills your head.>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,NULL),
(2000000548,'Your existence is acknowledged. <The relic turns to dust. Your head throbs with newfound wisdom. Something evil lurks in the heart of the mountain.>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,NULL),
(2000000549,'Leave this place. <The relic emits a white hot arc of flame. A memory has been gained: A lone Dark Iron dwarf is surrounded by seven corpses, kneeling before a monolith of flame.>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,NULL),
(2000000550,'He cannot be defeated. <The relic burns to nothing. The memories it held are now your own. This city was destroyed by a being not of this world.>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,NULL),
(2000000551,'Do not taint these ruins, mortal. <You are engulfed in a blinding flash of light. A creature composed entirely of flame is the only thing you can remember seeing.>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,4,0,0,NULL);

INSERT INTO `dbscripts_on_go_use` (`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES 
(4611,2,0,0,0,@VOICE,10,3,2000000550,2000000551,2000000544,2000000545,0,0,0,0,'Thaurissan relic - random whisper'),
(4611,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7800.4,-1900.31,135.089,0,''),
(4594,2,0,0,0,@VOICE,10,3,2000000549,2000000550,2000000551,2000000544,0,0,0,0,'Thaurissan relic - random whisper'),
(4594,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7835.78,-2067.96,136.252,0,''),
(4540,2,0,0,0,@VOICE,10,3,2000000548,2000000549,2000000550,2000000551,0,0,0,0,'Thaurissan relic - random whisper'),
(4540,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7779.31,-1855.2,134.131,0,''),
(4539,2,0,0,0,@VOICE,10,3,2000000547,2000000548,2000000549,2000000550,0,0,0,0,'Thaurissan relic - random whisper'),
(4539,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7891.04,-2188.15,133.436,0,''),
(4538,2,0,0,0,@VOICE,10,3,2000000546,2000000547,2000000548,2000000549,0,0,0,0,'Thaurissan relic - random whisper'),
(4538,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7793.7,-1961.65,134.118,0,''),
(4512,2,0,0,0,@VOICE,10,3,2000000545,2000000546,2000000547,2000000548,0,0,0,0,'Thaurissan relic - random whisper'),
(4512,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7766.91,-2013.52,135.337,0,''),
(4511,2,0,0,0,@VOICE,10,3,2000000544,2000000545,2000000546,2000000547,0,0,0,0,'Thaurissan relic - random whisper'),
(4511,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7716.94,-2033.14,133.439,0,''),
(6782,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7844.55,-1945.58,137.301,0,''),
(6782,2,0,0,0,@VOICE,10,3,2000000551,2000000544,2000000545,2000000546,0,0,0,0,'Thaurissan relic - random whisper'),
(6786,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7725.99,-2125.54,133.439,0,''),
(6786,2,0,0,0,@VOICE,10,3,2000000544,2000000545,2000000546,2000000547,0,0,0,0,'Thaurissan relic - random whisper'),
(6797,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7741.42,-1948.2,136.462,0,''),
(6797,2,0,0,0,@VOICE,10,3,2000000545,2000000546,2000000547,2000000548,0,0,0,0,'Thaurissan relic - random whisper'),
(6811,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7774.49,-2235,134.134,0,''),
(6811,2,0,0,0,@VOICE,10,3,2000000546,2000000547,2000000548,2000000549,0,0,0,0,'Thaurissan relic - random whisper'),
(6845,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7804.24,-2103.44,133.439,0,''),
(6845,2,0,0,0,@VOICE,10,3,2000000547,2000000548,2000000549,2000000550,0,0,0,0,'Thaurissan relic - random whisper'),
(6848,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7892.84,-2144.82,120.545,0,''),
(6848,2,0,0,0,@VOICE,10,3,2000000548,2000000549,2000000550,2000000551,0,0,0,0,'Thaurissan relic - random whisper'),
(4542,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7888.89,-2004.36,135.828,0,''),
(4542,2,0,0,0,@VOICE,10,3,2000000549,2000000550,2000000551,2000000544,0,0,0,0,'Thaurissan relic - random whisper'),
(4513,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7820.68,-2203.07,133.439,0,''),
(4513,2,0,0,0,@VOICE,10,3,2000000550,2000000551,2000000544,2000000545,0,0,0,0,'Thaurissan relic - random whisper'),
(4514,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7715.64,-1846.73,135.942,0,''),
(4514,2,0,0,0,@VOICE,10,3,2000000551,2000000544,2000000545,2000000546,0,0,0,0,'Thaurissan relic - random whisper'),
(4515,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7884.96,-2246.48,136.311,0,''),
(4515,2,0,0,0,@VOICE,10,3,2000000544,2000000545,2000000546,2000000547,0,0,0,0,'Thaurissan relic - random whisper'),
(4541,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7741.91,-2292.93,136.29,0,''),
(4541,2,0,0,0,@VOICE,10,3,2000000545,2000000546,2000000547,2000000548,0,0,0,0,'Thaurissan relic - random whisper'),
(4612,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7748.03,-2078.4,133.439,0,''),
(4612,2,0,0,0,@VOICE,10,3,2000000546,2000000547,2000000548,2000000549,0,0,0,0,'Thaurissan relic - random whisper'),
(6770,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7843.89,-1992.06,139.809,0,''),
(6770,2,0,0,0,@VOICE,10,3,2000000547,2000000548,2000000549,2000000550,0,0,0,0,'Thaurissan relic - random whisper'),
(6784,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7775.43,-2313.51,137.082,0,''),
(6784,2,0,0,0,@VOICE,10,3,2000000548,2000000549,2000000550,2000000551,0,0,0,0,'Thaurissan relic - random whisper'),
(6793,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7793.45,-1804.18,132.184,0,''),
(6793,2,0,0,0,@VOICE,10,3,2000000549,2000000550,2000000551,2000000544,0,0,0,0,'Thaurissan relic - random whisper'),
(6802,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7710.73,-2178.15,131.896,0,''),
(6802,2,0,0,0,@VOICE,10,3,2000000550,2000000551,2000000544,2000000545,0,0,0,0,'Thaurissan relic - random whisper'),
(6841,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7828.93,-2265.71,137.186,0,''),
(6841,2,0,0,0,@VOICE,10,3,2000000551,2000000544,2000000545,2000000546,0,0,0,0,'Thaurissan relic - random whisper'),
(6847,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7693.64,-2387.06,147.656,0,''),
(6847,2,0,0,0,@VOICE,10,3,2000000544,2000000545,2000000546,2000000547,0,0,0,0,'Thaurissan relic - random whisper'),
(6853,1,10,@VOICE,5000,0,0,0,0,0,0,0,-7757.94,-2159.73,133.439,0,''),
(6853,2,0,0,0,@VOICE,10,3,2000000545,2000000546,2000000547,2000000548,0,0,0,0,'Thaurissan relic - random whisper');
