/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

DELETE FROM TREATMENT;
DELETE FROM PET;
DELETE FROM [OWNER];
DELETE FROM [PROCEDURE];

INSERT INTO [OWNER](OWNERID, SURNAME, FIRSTNAME, PHONE) VALUES
(1, 'Sinatra', 'Frank', '400111222'),
(2, 'Ellington', 'Duke', '400222333'),
(3, 'Fitzgerald', 'Ella', '400333444');

INSERT INTO PET(PETTYPE, PETNAME, OWNERID) VALUES
('Dog', 'Buster', 1),
('Cat', 'Fluffy', 1),
('Rabbit', 'Stew', 2),
('Dog', 'Pooper', 3),
('Dog', 'Buster', 3);

INSERT INTO [PROCEDURE](PROCEDUREID, [DESCRIPTION], PRICE) VALUES
(1, 'Rabies Vaccination', 24),
(10, 'Examine and Treat Wound', 30),
(5, 'Heart Worm Test', 25),
(8, 'Tetnus Vaccination', 17);

INSERT INTO Treatment(TREATMENTDATE, PROCEDUREID, NOTES, PRICE, PETTYPE, PETNAME, OWNERID) VALUES
('2017-6-27', 1 ,'Routine vaccination', 24, 'Dog', 'Buster', 1), 

('2018-5-15', 1, 'Booster Shot', 24, 'Dog', 'Buster', 1),

('2018-5-10', 10, 'Wounds sustained in apparent cat fight', 30, 'Cat', 'Fluffy', 1),
('2017-6-20', 1, 'Routine vaccination', 24, 'Cat', 'Fluffy', 1),

('2018-5-10', 10, 'Wounds sustained during attempt to cook the stew', 30, 'Rabbit', 'Stew', 2),
('2018-5-10', 1, 'Routine Vaccination', 24, 'Rabbit', 'Stew', 2),

('2018-5-18', 5, 'Heart Worm Test', 24, 'Dog', 'Pooper', 3),

('2017-6-20', 8, 'Stepped on a rusty nail', 17, 'Dog', 'Buster', 3),
('2017-6-20', 1, 'Routine Vaccination', 24, 'Dog', 'Buster', 3);
