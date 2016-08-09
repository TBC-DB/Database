-- Script quests 10806, 10742 (Showdown)

SET @GOC := '20555'; -- Goc
SET @BARON := '22473'; -- Baron Sablemane
SET @REXXAR := '22448'; -- Rexxar
SET @SIGNET := '31808'; -- Sablemane's Signet
SET @HORN := '31146'; -- Rexxar's Battle Horn
SET @HORDE_EVENT := '14462'; -- Triggered by Rexxar's Battle Horn
SET @ALLY_EVENT := '14525'; -- Triggered by Sablemane's Signet

UPDATE `creature` SET `Map` = 0 WHERE `id` = 22496; -- hide spawned Sabellian in TBC
UPDATE `creature` SET `Map` = 0 WHERE `id` = 20555; -- hide spawned Goc in TBC

UPDATE `item_template` SET `spellcharges_1` = '1' WHERE `entry` IN (@SIGNET, @HORN); -- Prevent multiple summon

UPDATE `creature_template` SET `UnitFlags` = '2', `MovementType` = '0', `FactionAlliance` = '14', `FactionHorde` = '14', `AIName` = 'EventAI' WHERE `entry` = @GOC;
UPDATE `creature_template` SET `MinLevel` = '72', `MaxLevel` = '72', `FactionAlliance` = '210', `FactionHorde` = '210', `UnitClass` = '2', `DamageMultiplier` = '7.5', `MinLevelHealth` = '22000', `MaxLevelHealth` = '22000', `MinLevelMana` = '0',  `MaxLevelMana` = '0',  `MinMeleeDmg` = '307', `MaxMeleeDmg` = '438', `MinRangedDmg` = '270', `MaxRangedDmg` = '401', `Armor` = '7318', `MeleeAttackPower` = '314', `EquipmentTemplateId` = '0', `MovementType` = '0' WHERE `entry` = @BARON;
UPDATE `creature_template` SET `MinLevel` = '72', `MaxLevel` = '72', `FactionAlliance` = '106', `FactionHorde` = '106', `UnitClass` = '2', `DamageMultiplier` = '7.5', `MinLevelHealth` = '22000', `MaxLevelHealth` = '22000', `MinLevelMana` = '0',  `MaxLevelMana` = '0',  `MinMeleeDmg` = '307', `MaxMeleeDmg` = '438', `MinRangedDmg` = '270', `MaxRangedDmg` = '401', `Armor` = '7318', `MeleeAttackPower` = '314', `EquipmentTemplateId` = '0', `MovementType` = '0' WHERE `entry` = @REXXAR;

DELETE FROM `dbscripts_on_event` WHERE `id` IN (@HORDE_EVENT, @ALLY_EVENT);
DELETE FROM `dbscripts_on_creature_death` WHERE `id` = @GOC;
DELETE FROM `db_script_string` WHERE `entry` BETWEEN 2000005898 AND 2000005908;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = @GOC;

INSERT INTO `dbscripts_on_event` (`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(@HORDE_EVENT,0,10,@GOC,27000,0,0,0,1,0,0,0,3703.205811,5387.445313,-4.380342,5.694569,'quest 10742 - spawn Goc'),
(@HORDE_EVENT,1,0,0,0,@GOC,100,3,2000005908,0,0,0,0,0,0,0,'quest 10742 - Goc yell 0'),
(@HORDE_EVENT,1,10,@REXXAR,35000,0,0,0,1,0,0,0,3767.087158,5331.740234,37.086582,2.519631,'quest 10742 - spawn Rexxar'),
(@HORDE_EVENT,2,39,1,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'quest 10472 - Rexxar set fly on'),
(@HORDE_EVENT,3,24,19275,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'quest 10472 - Rexxar mount up'),
(@HORDE_EVENT,4,3,0,3000,@REXXAR,100,3,0,0,0,0,3727.474365,5364.511230,-8.514009,2.342801,'quest 10472 - Rexxar land'),
(@HORDE_EVENT,7,39,0,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'quest 10472 - Rexxar set fly off'),
(@HORDE_EVENT,7,24,0,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'quest 10472 - Rexxar dismount'),
(@HORDE_EVENT,11,0,0,0,@REXXAR,100,3,2000005904,0,0,0,0,0,0,0,'quest 10742 - Rexxar yell 1'), 
(@HORDE_EVENT,14,0,0,0,@GOC,100,3,2000005898,0,0,0,0,0,0,0,'quest 10742 - Goc yell 1'),
(@HORDE_EVENT,16,0,0,0,@REXXAR,100,3,2000005905,0,0,0,0,0,0,0,'quest 10742 - Rexxar yell 2'), 
(@HORDE_EVENT,21,0,0,0,@GOC,100,3,2000005901,0,0,0,0,0,0,0,'quest 10742 - Goc yell 2'),
(@HORDE_EVENT,25,0,0,0,@REXXAR,100,3,2000005906,0,0,0,0,0,0,0,'quest 10742 - Rexxar yell 3'),
(@HORDE_EVENT,27,26,0,0,@GOC,100,3,0,0,0,0,0,0,0,0,'quest 10742 - Goc attack player'),
(@ALLY_EVENT,0,10,@GOC,27000,0,0,0,1,0,0,0,3703.205811,5387.445313,-4.380342,5.694569,'quest 10806 - spawn Goc'),
(@ALLY_EVENT,1,0,0,0,@GOC,100,3,2000005898,0,0,0,0,0,0,0,'quest 10806 - Goc yell 1'),
(@ALLY_EVENT,4,10,@BARON,27000,0,0,0,1,0,0,0,3724.616699,5367.338379,-7.873208,2.373113,'quest 10806 - spawn Baron Sablemane'),
(@ALLY_EVENT,5,15,39225,0,@BARON,100,3,0,0,0,0,0,0,0,0,'quest 10806 - Baron Sablemane cast teleport'),
(@ALLY_EVENT,9,0,0,0,@BARON,100,3,2000005899,0,0,0,0,0,0,0,'quest 10806 - Baron Sablemane yell 1'),
(@ALLY_EVENT,13,0,0,0,@BARON,100,3,2000005900,0,0,0,0,0,0,0,'quest 10806 - Baron Sablemane yell 2'),
(@ALLY_EVENT,17,0,0,0,@GOC,100,3,2000005901,0,0,0,0,0,0,0,'quest 10806 - Goc yell 2'),
(@ALLY_EVENT,21,0,0,0,@BARON,100,3,2000005902,0,0,0,0,0,0,0,'quest 10806 - Baron Sablemane yell 3'),
(@ALLY_EVENT,23,26,0,0,@GOC,100,3,0,0,0,0,0,0,0,0,'quest 10806 - Goc attack player');

INSERT INTO `dbscripts_on_creature_death` (`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(@GOC,1,3,0,500,@BARON,100,3,0,0,0,0,3724.598145,5355.335938,-8.116101,1.696503,'quest 10806 - Baron Sablemane move slowly after kill'),
(@GOC,2,0,0,0,@BARON,100,3,2000005903,0,0,0,0,0,0,0,'quest 10806 - Baron Sablemane yell 4'),
(@GOC,5,15,39225,0,@BARON,100,3,0,0,0,0,0,0,0,0,'quest 10806 - Baron Sablemane cast teleport'),
(@GOC,6,18,0,0,@BARON,100,2,0,0,0,0,0,0,0,0,'quest 10806 - Baron Sablemane despawn'),
(@GOC,1,3,0,400,@REXXAR,100,3,0,0,0,0,3724.598145,5355.335938,-8.116101,1.696503,'quest 10472 - Rexxar move slowly after kill'),
(@GOC,3,0,0,0,@REXXAR,100,3,2000005907,0,0,0,0,0,0,0,'quest 10472 - Rexxar yell 4'),
(@GOC,5,24,19275,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'quest 10472 - Rexxar mount up'),
(@GOC,5,39,1,0,@REXXAR,100,3,0,0,0,0,0,0,0,0, 'quest 10472 - Rexxar set fly'),
(@GOC,5,3,0,3000,@REXXAR,100,3,0,0,0,0,3560.782715,5473.337891,75.812859,2.555107, 'quest 10472 - Rexxar fly away');

INSERT INTO `db_script_string` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(2000005898,"Who dares rouse Goc from his restful slumber?",0,0,0,0,0,0,0,0,10084,1,0,53,'quest 10806,10742 - Goc yell 1'),
(2000005899,"It's only right that you know the name of the one who will take your life.",0,0,0,0,0,0,0,0,0,1,0,397,'quest 10806 - Baron Sablemane yell 1'),
(2000005900,"Baron Sablemane. It will be on your lips as you gasp your dying breath.",0,0,0,0,0,0,0,0,0,1,0,11,'quest 10806 - Baron Sablemane yell 2'),
(2000005901,"Your name is as insignificant to me as the names of the thousands who have died under the might of Goc. I will crush you and $N!",0,0,0,0,0,0,0,0,10081,1,0,53,'quest 10806,10742 - Goc yell 2'),
(2000005902,"Let us begin.",0,0,0,0,0,0,0,0,0,1,0,53,'quest 10806 - Baron Sablemane yell 3'),
(2000005903,"We will speak again, but away from here.",0,0,0,0,0,0,0,0,0,1,0,0,'quest 10806 - Baron Sablemane yell 4'),
(2000005904,"I am Rexxar, son of the Mok'Nathal, champion of the Horde.",0,0,0,0,0,0,0,0,0,1,0,397,'quest 10742 - Rexxar yell 1'),
(2000005905,"And their torment at your hands is at an end. By my name, I shall put an end to your life.",0,0,0,0,0,0,0,0,0,1,0,66,'quest 10742 - Rexxar yell 2'),
(2000005906,"Prepare yourself for the end.",0,0,0,0,0,0,0,0,0,1,0,53,'quest 10742 - Rexxar yell 3'),
(2000005907,"I could not have achieved this victory without you. We will speak at Thunderlord Stronghold.",0,0,0,0,0,0,0,0,0,1,0,0,'quest 10742 - Rexxar yell 4'),
(2000005908,"Who dares place this affront upon the altar of Goc?",0,0,0,0,0,0,0,0,10083,1,0,53,'quest 10742 - Goc yell 0');

INSERT INTO `creature_ai_scripts` (`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
(@GOC, 0, 0, 100, 1, 6000, 110000, 6000, 11000, 11, 38783, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goc - Cast Boulder Volley'),
(@GOC, 0, 0, 100, 1, 8000, 10000, 8000, 10000, 11, 38784, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goc - Cast Ground Smash'),
(@GOC, 4, 0, 100, 0, 0, 0, 0, 0, 19, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Goc - Remove Non-Attackable Flag');
