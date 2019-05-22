SET sql_mode='';

UPDATE STATE SET state_abbreviation = REPLACE(state_abbreviation, '\r', '');
