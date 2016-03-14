
-- Arzeth the Merciless
SET @ENTRY := '19354';

UPDATE `creature_template` SET `SpeedWalk`=('2.5' / '2.5'), `SpeedRun`=('9.72222' / '7.0') WHERE `Entry`=@ENTRY;
