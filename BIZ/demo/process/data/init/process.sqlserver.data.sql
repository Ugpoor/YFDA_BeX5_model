--清空数据
delete from DEMO_Dynamic_Flows where $clientFilter(NULL);

insert into DEMO_Dynamic_Flows ($clientName, fID, version, fProcess, fProcessLabel)
values ($clientValue, 1, 0, '/demo/process/process/dynamicFlow1/dynamicFlow1Process', '动态工作流1');  
insert into DEMO_Dynamic_Flows ($clientName, fID, version, fProcess, fProcessLabel)
values ($clientValue, 2, 0, '/demo/process/process/dynamicFlow2/dynamicFlow2Process', '动态工作流2');  
