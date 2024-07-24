SELECT 
	sp.name
,	X.query_plan
FROM sys.procedures as sp
INNER JOIN sys.dm_exec_procedure_stats as ps
ON sp.object_id=ps.object_id --AND ps.database_id=<Adventureworks database id>
CROSS APPLY sys.dm_exec_query_plan(ps.plan_handle) as X
