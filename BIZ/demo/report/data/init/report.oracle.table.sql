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
--

--单位表
--(单位ID/单位名称/单位描述)
create table  DEMO_ReportOrg (
	$clientDefine,
	rOrgID VARCHAR2(100) NOT NULL ,
	rOrgName VARCHAR2(100),
	rOrgDesc CLOB
); 

--部门表
--(部门ID/单位ID/部门名称/部门描述)
create table  DEMO_ReportDept (
	$clientDefine,
	rDeptID VARCHAR2(100) NOT NULL ,
	rOrgID VARCHAR2(100),
	rDeptName VARCHAR2(100),
	rDeptDesc CLOB
);


--雇员表
--(雇员ID/LAST名称/FIRST名称/头衔/出生日期/进入公司日期/住址/城市/地区/邮编/国家/电话/分机/照片/描述信息/单位ID/部门ID/照片路径)
create table  DEMO_ReportEmployees (
	$clientDefine,
	rEmployeeID VARCHAR2(100)  NOT NULL ,
	rLastName VARCHAR2(100),
	rFirstName VARCHAR2(100),
	rTitle VARCHAR2(100),
	rBirthDate DATE ,
	rHireDate DATE ,
	rAddress VARCHAR2(100),
	rCity VARCHAR2(100),
	rRegion VARCHAR2(100),
	rPostalCode VARCHAR2(100),
	rCountry VARCHAR2(100),
	rHomerPhone VARCHAR2(100),
	rExtension VARCHAR2(100),
	rPhoto BLOB  ,
	rNotes CLOB,
	rOrgID VARCHAR2(100),
	rDeptID VARCHAR2(100),
	rPhotoPath VARCHAR2(255)
);


--产品类别表
--(类别ID/类别名称/类别描述)
create table  DEMO_ReportProductCategory (
	$clientDefine,
	rCategoryID VARCHAR2(100)  NOT NULL ,
	rCategoryName VARCHAR2(100),
	rCategoryDesc CLOB
);


--产品表
--(产品ID/产品名称/供应商ID/产品类别ID/单位数量/单价/库存)
create table  DEMO_ReportProducts (
	$clientDefine,
	rProductID VARCHAR2(100) NOT NULL ,
	rProductName VARCHAR2(100),
	rSupplierID VARCHAR2(100),
	rCategoryID VARCHAR2(100),
	rQuantityPerUnit VARCHAR2(100),
	rUnitPrice NUMBER  ,
	rUnitsinstock INTEGER  
);


--供应商表
--(供应商ID/公司名称/联系人/联系人头衔/地址/城市/地区/邮编/国家/电话/传真/主页)
create table  DEMO_ReportSuppliers (
	$clientDefine,
	rSupplierID VARCHAR2(100)  NOT NULL ,
	rCompanyName VARCHAR2(100),
	rContactName VARCHAR2(100),
	rContactTitle VARCHAR2(100),
	rAddress VARCHAR2(100),
	rCity VARCHAR2(100),
	rRegion VARCHAR2(100),
	rPostalCode VARCHAR2(100),
	rCountry VARCHAR2(100),
	rPhone VARCHAR2(100),
	rFax VARCHAR2(100),
	rHomePage CLOB
);


--顾客表
--(顾客ID/顾客名称/联系人名称/联系人头衔/地址/城市/地区/邮编/国家/电话/传真)
create table  DEMO_ReportCustomers (
	$clientDefine,
	rCustomerID VARCHAR2(100)  NOT NULL ,
	rCompanyName VARCHAR2(100),
	rContactName VARCHAR2(100),
	rContactTitle VARCHAR2(100),
	rAddress VARCHAR2(100),
	rCity VARCHAR2(100),
	rRegion VARCHAR2(100),
	rPostalCode VARCHAR2(100),
	rCountry VARCHAR2(100),
	rPhone VARCHAR2(100),
	rFax VARCHAR2(100)
);


--订单表
--(订单ID/顾客ID/雇员ID/订单日期/所需日期/发货日期/中转次数/运费/货运名称/货运地址/货运城市/货运地区/货运邮编/货运国家)
create table  DEMO_ReportOrders (
	$clientDefine,
	rOrderID VARCHAR2(100) NOT NULL ,
	rCustomerID VARCHAR2(100),
	rEmployeeID VARCHAR2(100),
	rOrderDate DATE  ,
	rRequiredDate DATE  ,
	rShippedDate DATE  ,
	rShipVia INTEGER  ,
	rFreght NUMBER  ,
	rShipName VARCHAR2(100),
	rShipAddress VARCHAR2(100),
	rShipCity VARCHAR2(100),
	rShipRegion VARCHAR2(100),
	rShipPostalCode VARCHAR2(100),
	rShipCountry VARCHAR2(100)
);




--订单明细表
--(明细ID/订单ID/产品ID/单价/数量/折扣)
create table  DEMO_ReportOrderDetails (
	$clientDefine,
	rOrderDetailsID VARCHAR2(100) NOT NULL ,
	rOrderID VARCHAR2(100),
	rProductID VARCHAR2(100),
	rUnitPrice NUMBER  ,
	rQuantity INTEGER  ,
	rDiscount NUMBER  
);


--图表XY-LINE测试表
create table  DEMO_ReportChartLottery (
	$clientDefine,
	rLotteryID VARCHAR2(100) NOT NULL ,
	rStage VARCHAR2(100),
	rLotteryNum1 INTEGER  ,
	rLotteryNum2 INTEGER  ,
	rLotteryNum3 INTEGER  
);

--图表甘特图测试表
create table  DEMO_ReportChartProject (
	$clientDefine,
	rProjectID VARCHAR2(100) NOT NULL ,
	rProjectRole VARCHAR2(20),
	rProjectType VARCHAR2(20)  NOT NULL ,
	rStartTime DATE  ,
	rEndTime DATE  ,
	rPlanStartTime DATE  ,
	rPlanEndTime DATE  
);

--报表编辑测试表-主表
create table  R_BB (
	$clientDefine,
	fID VARCHAR2(100),
	fBM VARCHAR2(100),
	fBH VARCHAR2(100),
	fZBJG VARCHAR2(100),
	fPZJG VARCHAR2(100),
	fPZWH VARCHAR2(100),
	fYXQZ VARCHAR2(100),
	fDWFZR VARCHAR2(100),
	fTJFZR VARCHAR2(100),
	fTBR VARCHAR2(100),
	fBCRQ DATE  ,
	fXZQH VARCHAR2(100),
	fTBDW VARCHAR2(100),
	fN VARCHAR2(100),
	fY VARCHAR2(100),
	fSF VARCHAR2(100),
	fS VARCHAR2(100),
	fX VARCHAR2(100),
	f1 VARCHAR2(100),
	f2 VARCHAR2(100),
	f3 VARCHAR2(100),
	f4 VARCHAR2(100),
	f5 VARCHAR2(100),
	f6 VARCHAR2(100),
	f7 VARCHAR2(100),
	version INTEGER NOT NULL 
);


--报表编辑测试表-从表
create table  R_ZB (
	$clientDefine,
	fID VARCHAR2(100),
	fCode INTEGER  ,
	fUnit VARCHAR2(100),
	fIndexType VARCHAR2(100),
	fRefID VARCHAR2(100),
	f1 VARCHAR2(100),
	f2 VARCHAR2(100),
	f3 VARCHAR2(100),
	f4 VARCHAR2(100),
	f5 VARCHAR2(100),
	f6 VARCHAR2(100),
	f7 VARCHAR2(100),
	f8 VARCHAR2(100),
	f9 VARCHAR2(100),
	f10 VARCHAR2(100),
	f11 VARCHAR2(100),
	version INTEGER  
);


--决策报表-产品纬度表
create table  DEMO_ReportProductDim (
	$clientDefine,
	rPID VARCHAR2(100),
	rMajorCategory VARCHAR2(100),
	rMinorCategory VARCHAR2(100),
	rName VARCHAR2(100)
);


--决策报表-地区纬度表
create table  DEMO_ReportRegionDim (
	$clientDefine,
	rRID VARCHAR2(100),
	rConuntry VARCHAR2(100),
	rRegion VARCHAR2(100),
	rProvince VARCHAR2(100),
	rCity VARCHAR2(100)
);


--决策报表-时间纬度表
create table  DEMO_ReportTimeDim (
	$clientDefine,
	rTID VARCHAR2(100),
	rYear VARCHAR2(100),
	rQuarter VARCHAR2(100),
	rMonth VARCHAR2(100)
);



--决策报表-销售事实表
create table  DEMO_ReportSalesFact (
	$clientDefine,
	rSID VARCHAR2(100),
	rRID VARCHAR2(100),
	rTID VARCHAR2(100),
	rPID VARCHAR2(100),
	rStoreSales NUMBER,
	rStoreCost NUMBER  
);

create table  DEMO_REPORTSHIPPERS (
	$clientDefine,
	RSHIPPERID VARCHAR2(100),
	RCOMPANYNAME VARCHAR2(100),
	RPHONE VARCHAR2(100)
);
