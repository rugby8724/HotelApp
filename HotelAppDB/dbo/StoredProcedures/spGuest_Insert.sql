CREATE PROCEDURE [dbo].[spGuest_Insert]
	@firstName nvarchar(50),
	@lastName nvarchar(50)
AS
begin
	set nocount on;

	if not exists (select 1 from dbo.Guest where firstName = @firstName and LastName = @lastName)
	begin
		insert into dbo.Guests (FirstName, LastName)
		values (@firstName, @lastName);
	end
	
	select top 1 [Id], [FirstName], [LastName]
	from dbo.Guest where firstName = @firstName and LastName = @lastName
end
