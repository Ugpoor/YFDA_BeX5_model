delete from SA_OPOrg where $clientFilter(NULL) and (sID='initorg'  or sID='init@initorg');
delete from SA_OPPerson where $clientFilter(NULL) and sID='init';
insert into SA_Code ($clientName, sID, sType, sCode, sName, version) values($clientValue, '__init__','__init__','__init__','__init__',0);
