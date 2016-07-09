-- add missing text to Kolphis Darkscale from sniff
DELETE FROM npc_text WHERE ID=10540;
INSERT INTO npc_text (ID,prob0,text0_0,text0_1) VALUES
(10540,1,'Begone, overseer!  We\'ve already spoken.$B$BStop dragging your feet and execute your orders at Ruuan Weald!','');

-- Gossip menu insert from sniff
DELETE FROM gossip_menu WHERE entry=8436 AND text_id=10539;
INSERT INTO gossip_menu (entry,text_id) VALUES (8436,10539);
DELETE FROM gossip_menu WHERE entry=8436 AND text_id=10540;
INSERT INTO gossip_menu (entry,text_id) VALUES (8436,10540);
DELETE FROM gossip_menu WHERE entry=8435 AND text_id=10541;
INSERT INTO gossip_menu (entry,text_id) VALUES (8435,10541);
DELETE FROM gossip_menu WHERE entry=8437 AND text_id=10542;
INSERT INTO gossip_menu (entry,text_id) VALUES (8437,10542);
DELETE FROM gossip_menu WHERE entry=8438 AND text_id=10543;
INSERT INTO gossip_menu (entry,text_id) VALUES (8438,10543);
DELETE FROM gossip_menu WHERE entry=8439 AND text_id=10544;
INSERT INTO gossip_menu (entry,text_id) VALUES (8439,10544);
DELETE FROM gossip_menu WHERE entry=8440 AND text_id=10545;
INSERT INTO gossip_menu (entry,text_id) VALUES (8440,10545);

-- Creature Gossip_menu_option insert from sniff
DELETE FROM gossip_menu_option WHERE menu_id IN (8435,8436,8437,8438,8439) AND id=1;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text                                 ,option_id , npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, condition_id) VALUES
                               (8436   , 1 , 0          , 'I\'m fine, thank you. You asked for me?'   ,1         , 1                 , 8435          , 0            , 0               , 0        , 0        , ''      , 0),
                               (8435   , 1 , 0          , 'Oh, it\'s not my fault, I can assure you.' ,1         , 1                 , 8437          , 0            , 0               , 0        , 0        , ''      , 0),
                               (8437   , 1 , 0          , 'Um, no... No, I don\'t want that at all.'  ,1         , 1                 , 8438          , 0            , 0               , 0        , 0        , ''      , 0),
                               (8438   , 1 , 0          , 'Impressive. When do we attack?'            ,1         , 1                 , 8439          , 0            , 0               , 0        , 0        , ''      , 0),
                               (8439   , 1 , 0          , 'Absolutely!'                               ,1         , 1                 , 8440          , 0            , 8439            , 0        , 0        , ''      , 0);

-- quest completion
DELETE FROM dbscripts_on_gossip where id = 8439 and delay = 0 and command = 7 and datalong = 10722;
INSERT INTO dbscripts_on_gossip (id  , delay, command, datalong, comments)
                         VALUES (8439, 0    , 7      , 10722   , 'quest complete 10722 - Meeting at the Blackwing Coven');

-- remove incorrect text from Kolphis Darkscale                         
DELETE FROM npc_gossip where npc_guid = 77171;    
-- Add quest gossip to Kolphis Darkscale
UPDATE creature_template set GossipMenuId= 8436 WHERE entry = 22019;  


-- Active quest condition in questlog but no completed
DELETE FROM conditions WHERE type = 9 and value1 = 10722;
DELETE FROM conditions WHERE condition_entry IN (504, 505, 625);

INSERT INTO conditions (condition_entry      , type, value1, value2)
               VALUES  (504                  , 9   , 10722 , 1),
                       (505                  , 1   , 38157 , 0),
                       (625                  , -1  , 505   , 504);               

-- Gossip to use when player has quest active          
UPDATE gossip_menu_option SET condition_id = 625 WHERE menu_id=8436;

SET @next_creature_ai_scripts_entry = 2816303;

DELETE FROM creature_ai_scripts WHERE creature_id = 22019;
-- whirlwind
INSERT INTO creature_ai_scripts (id                             , creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, comment)
                         VALUES (@next_creature_ai_scripts_entry, 22019      , 0         , 0                       , 100         , 1          , 3000        , 3000        , 8000        , 8000        , 11          , 37704         , 0             , 0             , 'Kolphis Darkscale - Cast Whirlwind');

INSERT INTO creature_ai_scripts (id                                 , creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, comment)
                         VALUES (@next_creature_ai_scripts_entry + 1, 22019      , 2         , 0                       , 100         , 0          , 25           , 0          , 0           , 0           , 11          , 8599          , 0             , 1             , 1           , -46           , 'Kolphis Darkscale - Enrage at 25%');

UPDATE creature_template SET AIName = 'EventAI' WHERE entry = 22019;  
                          

