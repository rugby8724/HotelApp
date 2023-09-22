﻿/*
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

if not exists (select 1 from dbo.RoomTypes)
begin
    insert into dbo.RoomTypes(Title, Description, Price)
    values ('King Size Bed', 'A room with a king size bed and an window.', 100),
    ('Two Queen Size Beds', 'A room with a queen size bed and a window.', 115),
    ('Executive Suite', 'Two rooms, each with a king size bed and a window.', 205)
end


if not exists (select 1 from dbo.Rooms)
begin
    declare @roomId1 int
    declare @roomId2 int
    declare @roomId3 int

    select @roomId1 = Id from dbo.RoomTypes where Title = 'King Size Bed'
    select @roomId2 = Id from dbo.RoomTypes where Title = 'Two Queen Size Beds'
    select @roomId3 = Id from dbo.RoomTypes where Title = 'Executive Suite'

    insert into dbo.Rooms(RoomNumber, RoomTypeId)
    values ('101', @roomId1),
    ('103', @roomId1),
    ('107', @roomId1),
    ('777', @roomId3),
    ('327', @roomId2),
    ('321', @roomId2)
end