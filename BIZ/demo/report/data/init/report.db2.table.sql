
---报表演示库 ORACLE10G2

    DROP TABLE DEMO_ReportOrders
    DROP TABLE DEMO_ReportOrderDetails
    DROP TABLE DEMO_ReportOrg
    DROP TABLE DEMO_ReportDept
    DROP TABLE DEMO_ReportEmployees
    DROP TABLE DEMO_ReportProductCategory
    DROP TABLE DEMO_ReportProducts
    DROP TABLE DEMO_ReportSuppliers
    DROP TABLE DEMO_ReportCustomers
    DROP TABLE DEMO_ReportChartLottery
    DROP TABLE DEMO_ReportChartProject
    DROP TABLE DEMO_ReportProductDim
    DROP TABLE DEMO_ReportRegionDim
    DROP TABLE DEMO_ReportTimeDim
    DROP TABLE DEMO_ReportSalesFact
    DROP TABLE DEMO_ReportShippers
    DROP TABLE R_BB
    DROP TABLE R_ZB

--单位表
--(单位ID/单位名称/单位描述)
create table  DEMO_ReportOrg (
	$clientDefine,
	rOrgID VARCHAR(100) NOT NULL ,
	rOrgName VARCHAR(100),
	rOrgDesc CLOB
); 

--部门表
--(部门ID/单位ID/部门名称/部门描述)
create table  DEMO_ReportDept (
	$clientDefine,
	rDeptID VARCHAR(100) NOT NULL ,
	rOrgID VARCHAR(100),
	rDeptName VARCHAR(100),
	rDeptDesc CLOB
);


--雇员表
--(雇员ID/LAST名称/FIRST名称/头衔/出生日期/进入公司日期/住址/城市/地区/邮编/国家/电话/分机/照片/描述信息/单位ID/部门ID/照片路径)
create table  DEMO_ReportEmployees (
	$clientDefine,
	rEmployeeID VARCHAR(100)  NOT NULL ,
	rLastName VARCHAR(100),
	rFirstName VARCHAR(100),
	rTitle VARCHAR(100),
	rBirthDate TIMESTAMP ,
	rHireDate TIMESTAMP ,
	rAddress VARCHAR(100),
	rCity VARCHAR(100),
	rRegion VARCHAR(100),
	rPostalCode VARCHAR(100),
	rCountry VARCHAR(100),
	rHomerPhone VARCHAR(100),
	rExtension VARCHAR(100),
	rPhoto BLOB  ,
	rNotes CLOB,
	rOrgID VARCHAR(100),
	rDeptID VARCHAR(100),
	rPhotoPath VARCHAR(255)
);


--产品类别表
--(类别ID/类别名称/类别描述)
create table  DEMO_ReportProductCategory (
	$clientDefine,
	rCategoryID VARCHAR(100)  NOT NULL ,
	rCategoryName VARCHAR(100),
	rCategoryDesc CLOB
);


--产品表
--(产品ID/产品名称/供应商ID/产品类别ID/单位数量/单价/库存)
create table  DEMO_ReportProducts (
	$clientDefine,
	rProductID VARCHAR(100) NOT NULL ,
	rProductName VARCHAR(100),
	rSupplierID VARCHAR(100),
	rCategoryID VARCHAR(100),
	rQuantityPerUnit VARCHAR(100),
	rUnitPrice DOUBLE  ,
	rUnitsinstock INTEGER  
);


--供应商表
--(供应商ID/公司名称/联系人/联系人头衔/地址/城市/地区/邮编/国家/电话/传真/主页)
create table  DEMO_ReportSuppliers (
	$clientDefine,
	rSupplierID VARCHAR(100)  NOT NULL ,
	rCompanyName VARCHAR(100),
	rContactName VARCHAR(100),
	rContactTitle VARCHAR(100),
	rAddress VARCHAR(100),
	rCity VARCHAR(100),
	rRegion VARCHAR(100),
	rPostalCode VARCHAR(100),
	rCountry VARCHAR(100),
	rPhone VARCHAR(100),
	rFax VARCHAR(100),
	rHomePage CLOB
);


--顾客表
--(顾客ID/顾客名称/联系人名称/联系人头衔/地址/城市/地区/邮编/国家/电话/传真)
create table  DEMO_ReportCustomers (
	$clientDefine,
	rCustomerID VARCHAR(100)  NOT NULL ,
	rCompanyName VARCHAR(100),
	rContactName VARCHAR(100),
	rContactTitle VARCHAR(100),
	rAddress VARCHAR(100),
	rCity VARCHAR(100),
	rRegion VARCHAR(100),
	rPostalCode VARCHAR(100),
	rCountry VARCHAR(100),
	rPhone VARCHAR(100),
	rFax VARCHAR(100)
);


--订单表
--(订单ID/顾客ID/雇员ID/订单日期/所需日期/发货日期/中转次数/运费/货运名称/货运地址/货运城市/货运地区/货运邮编/货运国家)
create table  DEMO_ReportOrders (
	$clientDefine,
	rOrderID VARCHAR(100) NOT NULL ,
	rCustomerID VARCHAR(100),
	rEmployeeID VARCHAR(100),
	rOrderDate DATE  ,
	rRequiredDate DATE  ,
	rShippedDate DATE  ,
	rShipVia INTEGER  ,
	rFreght DOUBLE  ,
	rShipName VARCHAR(100),
	rShipAddress VARCHAR(100),
	rShipCity VARCHAR(100),
	rShipRegion VARCHAR(100),
	rShipPostalCode VARCHAR(100),
	rShipCountry VARCHAR(100)
);




--订单明细表
--(明细ID/订单ID/产品ID/单价/数量/折扣)
create table  DEMO_ReportOrderDetails (
	$clientDefine,
	rOrderDetailsID VARCHAR(100) NOT NULL ,
	rOrderID VARCHAR(100),
	rProductID VARCHAR(100),
	rUnitPrice DOUBLE  ,
	rQuantity INTEGER  ,
	rDiscount DOUBLE  
);


--图表XY-LINE测试表
create table  DEMO_ReportChartLottery (
	$clientDefine,
	rLotteryID VARCHAR(100) NOT NULL ,
	rStage VARCHAR(100),
	rLotteryNum1 INTEGER  ,
	rLotteryNum2 INTEGER  ,
	rLotteryNum3 INTEGER  
);

--图表甘特图测试表
create table  DEMO_ReportChartProject (
	$clientDefine,
	rProjectID VARCHAR(100) NOT NULL ,
	rProjectRole VARCHAR(20),
	rProjectType VARCHAR(20)  NOT NULL ,
	rStartTime TIMESTAMP  ,
	rEndTime TIMESTAMP  ,
	rPlanStartTime TIMESTAMP  ,
	rPlanEndTime TIMESTAMP  
);

--报表编辑测试表-主表
create table  R_BB (
	$clientDefine,
	fID VARCHAR(100),
	fBM VARCHAR(100),
	fBH VARCHAR(100),
	fZBJG VARCHAR(100),
	fPZJG VARCHAR(100),
	fPZWH VARCHAR(100),
	fYXQZ VARCHAR(100),
	fDWFZR VARCHAR(100),
	fTJFZR VARCHAR(100),
	fTBR VARCHAR(100),
	fBCRQ TIMESTAMP  ,
	fXZQH VARCHAR(100),
	fTBDW VARCHAR(100),
	fN VARCHAR(100),
	fY VARCHAR(100),
	fSF VARCHAR(100),
	fS VARCHAR(100),
	fX VARCHAR(100),
	f1 VARCHAR(100),
	f2 VARCHAR(100),
	f3 VARCHAR(100),
	f4 VARCHAR(100),
	f5 VARCHAR(100),
	f6 VARCHAR(100),
	f7 VARCHAR(100),
	version INTEGER NOT NULL 
);


--报表编辑测试表-从表
create table  R_ZB (
	$clientDefine,
	fID VARCHAR(100),
	fCode INTEGER  ,
	fUnit VARCHAR(100),
	fIndexType VARCHAR(100),
	fRefID VARCHAR(100),
	f1 VARCHAR(100),
	f2 VARCHAR(100),
	f3 VARCHAR(100),
	f4 VARCHAR(100),
	f5 VARCHAR(100),
	f6 VARCHAR(100),
	f7 VARCHAR(100),
	f8 VARCHAR(100),
	f9 VARCHAR(100),
	f10 VARCHAR(100),
	f11 VARCHAR(100),
	version INTEGER  
);


--决策报表-产品纬度表
create table  DEMO_ReportProductDim (
	$clientDefine,
	rPID VARCHAR(100),
	rMajorCategory VARCHAR(100),
	rMinorCategory VARCHAR(100),
	rName VARCHAR(100)
);


--决策报表-地区纬度表
create table  DEMO_ReportRegionDim (
	$clientDefine,
	rRID VARCHAR(100),
	rConuntry VARCHAR(100),
	rRegion VARCHAR(100),
	rProvince VARCHAR(100),
	rCity VARCHAR(100)
);


--决策报表-时间纬度表
create table  DEMO_ReportTimeDim (
	$clientDefine,
	rTID VARCHAR(100),
	rYear VARCHAR(100),
	rQuarter VARCHAR(100),
	rMonth VARCHAR(100)
);



--决策报表-销售事实表
create table  DEMO_ReportSalesFact (
	$clientDefine,
	rSID VARCHAR(100),
	rRID VARCHAR(100),
	rTID VARCHAR(100),
	rPID VARCHAR(100),
	rStoreSales DOUBLE,
	rStoreCost DOUBLE  
);

create table  DEMO_REPORTSHIPPERS (
	$clientDefine,
	RSHIPPERID VARCHAR(100),
	RCOMPANYNAME VARCHAR(100),
	RPHONE VARCHAR(100)
);

