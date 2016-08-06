-- Fix quest chain 5128 (Words of the High Chief)

UPDATE `mangos`.`conditions` SET `value1` = 5087 WHERE `condition_entry` = 211;
