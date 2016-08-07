-- Fix quest chain 5128 (Words of the High Chief)

UPDATE `conditions` SET `value1` = 5121, `type` = 9 WHERE `condition_entry` = 211;
