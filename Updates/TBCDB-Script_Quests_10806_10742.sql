-- Script quests 10806, 10742 (Showdown)

SET @GOC := '20555'; 			-- Goc
SET @BARON := '22473'; 			-- Baron Sablemane
SET @REXXAR := '22448'; 		-- Rexxar
SET @MISHA := '22498'; 			-- Misha
SET @SIGNET := '31808'; 		-- Sablemane's Signet
SET @HORN := '31146'; 			-- Rexxar's Battle Horn
SET @HORDE_EVENT := '14462'; 	-- Triggered by Rexxar's Battle Horn
SET @ALLY_EVENT := '14525'; 	-- Triggered by Sablemane's Signet

UPDATE `creature` SET `Map` = '0' WHERE `id` = '22496'; -- hide spawned Sabellian in TBC
UPDATE `creature` SET `Map` = '0' WHERE `id` = @GOC; 	-- hide spawned Goc in TBC

UPDATE `item_template` SET `spellcharges_1` = '1' WHERE `entry` IN (@SIGNET, @HORN); -- temp prevent multiple goc summons

UPDATE `creature_template` 
SET 
    `DamageMultiplier` = '4.6',
    `RegenerateStats` = '1',
    `MinRangedDmg` = '215',
    `MaxRangedDmg` = '320',
    `RangedAttackPower` = '44',
    `MinMeleeDmg` = '252',
    `MaxMeleeDmg` = '357',
    `MeleeAttackPower` = '304',
    `Armor` = '6719',
    `LootId` = '0',
    `UnitFlags` = '2',
    `MovementType` = '0',
    `FactionAlliance` = '14',
    `FactionHorde` = '14',
    `AIName` = 'EventAI'
WHERE
    `entry` = @GOC;
UPDATE `creature_template` 
SET 
    `DamageMultiplier` = '1',
    `Rank` = '1',
    `Armor` = '12000',
    `UnitClass` = '8',
    `MinLevel` = '72',
    `MaxLevel` = '72',
    `FactionAlliance` = '210',
    `FactionHorde` = '210',
    `MinLevelHealth` = '70000',
    `MaxLevelHealth` = '70000',
    `MinLevelMana` = '11500',
    `MaxLevelMana` = '11500',
    `MinMeleeDmg` = '575',
    `MaxMeleeDmg` = '694',
    `MeleeAttackPower` = '293',
    `MeleeBaseAttackTime` = '2000',
    `EquipmentTemplateId` = '1487', -- change to 1543 for UDB
    `MovementType` = '0',
    `AIName` = 'EventAI'
WHERE
    `entry` = @BARON;
UPDATE `creature_template` 
SET 
    `DamageMultiplier` = '1',
    `Rank` = '1',
    `Armor` = '12000',
    `MinLevelHealth` = '60000',
    `MaxLevelHealth` = '60000',
    `MinLevel` = '72',
    `MaxLevel` = '72',
    `FactionAlliance` = '106',
    `FactionHorde` = '106',
    `MinMeleeDmg` = '575',
    `MaxMeleeDmg` = '694',
    `MeleeAttackPower` = '293',
    `MovementType` = '0',
    `EquipmentTemplateId` = '5554', -- change to 959 for UDB
    `AIName` = 'EventAI'
WHERE
    `entry` = @REXXAR;
UPDATE `creature_template` 
SET 
    `DamageMultiplier` = '4.6',
    `Armor` = '7318',
    `FactionAlliance` = '106',
    `FactionHorde` = '106',
    `MinLevel` = '72',
    `MaxLevel` = '72',
    `MinMeleeDmg` = '307',
    `MaxMeleeDmg` = '438',
    `MeleeAttackPower` = '314',
    `MinLevelHealth` = '34224',
    `MaxLevelHealth` = '34224',
    `AIName` = 'EventAI'
WHERE
    `entry` = @MISHA;

DELETE FROM `dbscripts_on_event` WHERE `id` IN (@HORDE_EVENT, @ALLY_EVENT);
DELETE FROM `dbscripts_on_creature_death` WHERE `id` IN (@GOC,@REXXAR);
DELETE FROM `db_script_string` WHERE `entry` BETWEEN 2000005898 AND 2000005908;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (@GOC, @BARON, @REXXAR, @MISHA);

INSERT INTO `dbscripts_on_event` (`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(@HORDE_EVENT,0,10,@GOC,30000,0,0,0,1,0,0,0,3703.205811,5387.445313,-4.380342,5.694569,'spawn Goc'),
(@HORDE_EVENT,1,0,0,0,@GOC,100,3,2000005908,0,0,0,0,0,0,0,'Goc yell 0'),
(@HORDE_EVENT,1,10,@REXXAR,35000,0,0,0,1,0,0,0,3768.166016,5323.457520,27.822142,2.207640,'spawn Rexxar'),
(@HORDE_EVENT,2,39,1,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'Rexxar fly on'),
(@HORDE_EVENT,3,24,19275,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'Rexxar mount'),
(@HORDE_EVENT,4,3,0,3000,@REXXAR,100,3,0,0,0,0,3727.474365,5364.511230,-8.514009,2.342801,'Rexxar move'),
(@HORDE_EVENT,7,39,0,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'Rexxar fly off'),
(@HORDE_EVENT,9,24,0,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'Rexxar dismount'),
(@HORDE_EVENT,11,0,0,0,@REXXAR,100,3,2000005904,0,0,0,0,0,0,0,'Rexxar yell 1'), 
(@HORDE_EVENT,14,0,0,0,@GOC,100,3,2000005898,0,0,0,0,0,0,0,'Goc yell 1'),
(@HORDE_EVENT,16,0,0,0,@REXXAR,100,3,2000005905,0,0,0,0,0,0,0,'Rexxar yell 2'), 
(@HORDE_EVENT,21,0,0,0,@GOC,100,3,2000005901,0,0,0,0,0,0,0,'Goc yell 2'),
(@HORDE_EVENT,25,0,0,0,@REXXAR,100,3,2000005906,0,0,0,0,0,0,0,'Rexxar yell 3'),
(@HORDE_EVENT,27,26,0,0,@GOC,100,3,0,0,0,0,0,0,0,0,'Goc attack player'),
(@HORDE_EVENT,27,3,0,1000,@REXXAR,100,3,0,0,0,0,3717.383545,5381.583984,-5.516471,2.659832,'Rexxar move'),

(@ALLY_EVENT,0,10,@GOC,30000,0,0,0,1,0,0,0,3703.205811,5387.445313,-4.380342,5.694569,'spawn Goc'),
(@ALLY_EVENT,1,0,0,0,@GOC,100,3,2000005898,0,0,0,0,0,0,0,'Goc yell 1'),
(@ALLY_EVENT,4,10,@BARON,30000,0,0,0,1,0,0,0,3724.616699,5367.338379,-7.873208,2.373113,'spawn Baron'),
(@ALLY_EVENT,5,15,39225,0,@BARON,100,3,0,0,0,0,0,0,0,0,'Baron cast teleport'),
(@ALLY_EVENT,9,0,0,0,@BARON,100,3,2000005899,0,0,0,0,0,0,0,'Baron yell 1'),
(@ALLY_EVENT,13,0,0,0,@BARON,100,3,2000005900,0,0,0,0,0,0,0,'Baron yell 2'),
(@ALLY_EVENT,17,0,0,0,@GOC,100,3,2000005901,0,0,0,0,0,0,0,'Goc yell 2'),
(@ALLY_EVENT,21,0,0,0,@BARON,100,3,2000005902,0,0,0,0,0,0,0,'Baron yell 3'),
(@ALLY_EVENT,23,26,0,0,@GOC,100,3,0,0,0,0,0,0,0,0,'Goc attack player'),
(@ALLY_EVENT,23,3,0,1000,@BARON,100,3,0,0,0,0,3717.383545,5381.583984,-5.516471,2.659832,'Baron move');

INSERT INTO `dbscripts_on_creature_death` (`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(@GOC,1,3,0,1000,@BARON,100,3,0,0,0,0,3724.598145,5355.335938,-8.116101,1.696503,'Baron move'),
(@GOC,2,0,0,0,@BARON,100,3,2000005903,0,0,0,0,0,0,0,'Baron yell 4'),
(@GOC,5,15,39225,0,@BARON,100,3,0,0,0,0,0,0,0,0,'Baron cast teleport'),
(@GOC,6,18,0,0,@BARON,100,2,0,0,0,0,0,0,0,0,'Baron despawn'),
(@GOC,1,3,0,1000,@REXXAR,100,3,0,0,0,0,3724.598145,5355.335938,-8.116101,1.696503,'Rexxar move'),
(@GOC,3,0,0,0,@REXXAR,100,3,2000005907,0,0,0,0,0,0,0,'Rexxar yell 4'),
(@GOC,5,24,19275,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'Rexxar mount'),
(@GOC,5,39,1,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'Rexxar fly on'),
(@GOC,7,3,0,3000,@REXXAR,100,3,0,0,0,0,3560.782715,5473.337891,75.812859,2.555107, 'Rexxar move'),
(@REXXAR,0,18,0,0,@MISHA,100,2,0,0,0,0,0,0,0,0,'Misha despawn');

INSERT INTO `db_script_string` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(2000005898,"Who dares rouse Goc from his restful slumber?",0,0,0,0,0,0,0,0,10084,1,0,53,'Goc yell 1'),
(2000005899,"It's only right that you know the name of the one who will take your life.",0,0,0,0,0,0,0,0,0,1,0,397,'Baron yell 1'),
(2000005900,"Baron Sablemane. It will be on your lips as you gasp your dying breath.",0,0,0,0,0,0,0,0,0,1,0,11,'Baron yell 2'),
(2000005901,"Your name is as insignificant to me as the names of the thousands who have died under the might of Goc. I will crush you and $N!",0,0,0,0,0,0,0,0,10081,1,0,53,'Goc yell 2'),
(2000005902,"Let us begin.",0,0,0,0,0,0,0,0,0,1,0,53,'Baron yell 3'),
(2000005903,"We will speak again, but away from here.",0,0,0,0,0,0,0,0,0,1,0,0,'Baron yell 4'),
(2000005904,"I am Rexxar, son of the Mok'Nathal, champion of the Horde.",0,0,0,0,0,0,0,0,0,1,0,397,'Rexxar yell 1'),
(2000005905,"And their torment at your hands is at an end. By my name, I shall put an end to your life.",0,0,0,0,0,0,0,0,0,1,0,66,'Rexxar yell 2'),
(2000005906,"Prepare yourself for the end.",0,0,0,0,0,0,0,0,0,1,0,53,'Rexxar yell 3'),
(2000005907,"I could not have achieved this victory without you. We will speak at Thunderlord Stronghold.",0,0,0,0,0,0,0,0,0,1,0,0,'Rexxar yell 4'),
(2000005908,"Who dares place this affront upon the altar of Goc?",0,0,0,0,0,0,0,0,10083,1,0,53,'Goc yell 0');
 
INSERT INTO `creature_ai_scripts` (`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
(@MISHA, 0, 0, 100, 1, 1000, 2000, 5000, 6000, 11, 17156, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misha - Cast Maul'),
(@MISHA, 0, 0, 100, 1, 3000, 4000, 25000, 30000, 11, 20753, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Misha - Cast Demoralizing Roar'),
(@GOC, 0, 0, 100, 1, 6000, 11000, 10000, 15000, 11, 38783, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goc - Cast Boulder Volley'),
(@GOC, 0, 0, 100, 1, 8000, 10000, 15000, 20000, 11, 38784, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goc - Cast Ground Smash'),
(@GOC, 4, 0, 100, 0, 0, 0, 0, 0, 19, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goc - Remove Non-Attackable Flag'),
(@BARON, 7, 0, 100, 0, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - Set Phase to 0 on Evade'),
(@BARON, 3, 3, 100, 1, 100, 15, 1000, 1000, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - Set Phase 1 when Mana is above 15% (Phase 2)'),
(@BARON, 3, 5, 100, 0, 7, 0, 0, 0, 49, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - Disable Dynamic Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
(@BARON, 9, 0, 100, 1, 0, 8, 1000, 1000, 49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - Disable Dynamic Movement at 0-8 Yards'),
(@BARON, 9, 5, 100, 1, 9, 80, 1000, 1000, 49, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - Enable Dynamic Movement at 9-80 Yards (Phase 1)'),
(@BARON, 9, 5, 100, 1, 0, 40, 3300, 5000, 11, 17290, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - Cast Fireball (Phase 1)'),
(@BARON, 4, 0, 100, 0, 0, 0, 0, 0, 49, 1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 'Baron Sablemane - Enable Dynamic Movement and Set Phase 1 on Aggro'),
(@BARON, 0, 0, 100, 1, 1000, 2000, 15400, 23500, 11, 39268, 1, 1, 0, 0, 0, 0, 0, 0,	0, 0, 'Baron Sablemane - Cast Chains of Ice'),
(@REXXAR, 0, 0, 100, 1, 1000, 2000, 7000, 8000, 11, 40504, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - Cast Cleave'),
(@REXXAR, 0, 0, 100, 1, 3000, 3000, 5000, 6000, 11, 3391, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - Cast Thrash'),
(@REXXAR, 2, 0, 100, 0, 40, 0, 0, 0, 12, @MISHA, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - Summon Misha at 40% HP'),
(@REXXAR, 25, 0, 100, 0, @MISHA, 0, 0, 0, 11, 8602, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Rexxar - Cast Vengeance on Misha Death');
