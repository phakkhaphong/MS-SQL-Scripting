USE master;  
GO  
 
THROW 
	77777
,	'
	Krungthepmahanakhon Amonrattanakosin 
	Mahintharayutthaya Mahadilokphop 
	Noppharatratchathaniburirom 
	Udomratchaniwetmahasathan 
	Amonphimanawatansathit 
	Sakkathattiyawitsanukamprasit
	'
,	1;
GO

/*
  
EXEC sp_addmessage
	@msgnum = 55055 
,	@severity = 16
,	@msgtext = 
		'
		This is a test message with one numeric  
        parameter (%d) and one string parameter (%s)   
        '
,	@lang = 'us_english'; 
GO

*/

DECLARE @msg varchar(300) 
	= FORMATMESSAGE(55055, 8999,'AKE!!!');

THROW 55055,@msg,111;
GO

--EXEC sp_dropmessage 55055