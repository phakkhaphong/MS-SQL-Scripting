USE master;  
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

SELECT * FROM sys.messages WHERE message_id=55055;
GO

RAISERROR(55055,16,111,8999,'AKE!!!');
GO

RAISERROR
	(
	'
	This is a test message with one numeric  
    parameter (%d) and one string parameter (%s)   
    '
	,16,111,8999,'AKE!!!'
	);
GO

--EXEC sp_dropmessage 55055