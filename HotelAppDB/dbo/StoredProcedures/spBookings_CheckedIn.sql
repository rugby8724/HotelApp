CREATE PROCEDURE [dbo].[spBookings_CheckedIn]
	@Id int
AS
begin
	set nocount on;

	update dob.Bookings
	set CheckedIn = 1
	where Id = @Id;
end