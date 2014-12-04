-- Level 10 Rogue Quest, Horde
-- Thanks to Grz3s (via IRC, WotLK UDB Dev)
-- http://www.wowhead.com/npc=6497
-- http://www.wowhead.com/quest=1886
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (125, 0, 0, 'You\'ve got something I need, Astor. And I\'ll be taking it now.', 1, 1, -1, 0, 125, 0, 0, '', 0);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) VALUES (126, 0, 0, 'You\'re Astor Hadren, right?', 1, 1, 125, 0, 0, 0, 0, '', 476);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (474, 24, 7231, 1);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (475, 9, 1886, 0);
INSERT INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES (476, -1, 475, 474);
INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (125, 1, 22, 21, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'astor change faction');
INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (125, 2, 26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'astor attack start');
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) VALUES (125, 624, 0, 0);
