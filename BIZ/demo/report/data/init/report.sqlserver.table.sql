---报表演示库 MSSQL

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
    
    
--订单表
--(订单ID/顾客ID/雇员ID/订单日期/所需日期/发货日期/中转次数/运费/货运名称/货运地址/货运城市/货运地区/货运邮编/货运国家)
create table  [dbo].[DEMO_ReportOrders] (
	$clientDefine,
	[rOrderID] [varchar] (100)   NOT NULL ,
	[rCustomerID] [varchar] (100)  NULL ,
	[rEmployeeID] [varchar] (100)  NULL ,
	[rOrderDate] [datetime] NULL ,
	[rRequiredDate] [datetime] NULL ,
	[rShippedDate] [datetime] NULL ,
	[rShipVia] [int] NULL ,
	[rFreght] [money] NULL ,
	[rShipName] [varchar] (100)  NULL ,
	[rShipAddress] [varchar] (100)  NULL ,
	[rShipCity] [varchar] (100)  NULL ,
	[rShipRegion] [varchar] (100)  NULL ,
	[rShipPostalCode] [varchar] (100)  NULL ,
	[rShipCountry] [varchar] (100)  NULL 
)

$clientIndex(DEMO_ReportOrders)




--订单明细表
--(明细ID/订单ID/产品ID/单价/数量/折扣)
create table  [dbo].[DEMO_ReportOrderDetails] (
	$clientDefine,
	[rOrderDetailsID] [varchar] (100)   NOT NULL ,
	[rOrderID] [varchar] (100)  NULL ,
	[rProductID] [varchar] (100)  NULL ,
	[rUnitPrice] [money] NULL ,
	[rQuantity] [int] NULL ,
	[rDiscount] [real] NULL 
)

$clientIndex(DEMO_ReportOrderDetails)

    

--单位表
--(单位ID/单位名称/单位描述)



create table  [dbo].[DEMO_ReportOrg] (
	$clientDefine,
	[rOrgID] [varchar] (100)   NOT NULL ,
	[rOrgName] [varchar] (100)  NULL ,
	[rOrgDesc] [text]  NULL 
) 

$clientIndex(DEMO_ReportOrg) 


--部门表
--(部门ID/单位ID/部门名称/部门描述)
create table  [dbo].[DEMO_ReportDept] (
	$clientDefine,
	[rDeptID] [varchar] (100)   NOT NULL ,
	[rOrgID] [varchar] (100)  NULL ,
	[rDeptName] [varchar] (100)  NULL ,
	[rDeptDesc] [text]  NULL 
) 

$clientIndex(DEMO_ReportDept) 


--雇员表
--(雇员ID/LAST名称/FIRST名称/头衔/出生日期/进入公司日期/住址/城市/地区/邮编/国家/电话/分机/照片/描述信息/单位ID/部门ID/照片路径)
create table  [dbo].[DEMO_ReportEmployees] (
	$clientDefine,
	[rEmployeeID] [varchar] (100)  NOT NULL ,
	[rLastName] [varchar] (100)  NULL ,
	[rFirstName] [varchar] (100)  NULL ,
	[rTitle] [varchar] (100)  NULL ,
	[rBirthDate] [datetime] NULL ,
	[rHireDate] [datetime] NULL ,
	[rAddress] [varchar] (100)  NULL ,
	[rCity] [varchar] (100)  NULL ,
	[rRegion] [varchar] (100)  NULL ,
	[rPostalCode] [varchar] (100)  NULL ,
	[rCountry] [varchar] (100)  NULL ,
	[rHomerPhone] [varchar] (100)  NULL ,
	[rExtension] [varchar] (100)  NULL ,
	[rPhoto] [image] NULL ,
	[rNotes] [text]  NULL ,
	[rOrgID] [varchar] (100)  NULL ,
	[rDeptID] [varchar] (100)  NULL ,
	[rPhotoPath] [varchar] (255)  NULL 
) 

$clientIndex(DEMO_ReportEmployees) 


--产品类别表
--(类别ID/类别名称/类别描述)
create table  [dbo].[DEMO_ReportProductCategory] (
	$clientDefine,
	[rCategoryID] [varchar] (100)  NOT NULL ,
	[rCategoryName] [varchar] (100)  NULL ,
	[rCategoryDesc] [text]  NULL 
) 

$clientIndex(DEMO_ReportProductCategory) 



--产品表
--(产品ID/产品名称/供应商ID/产品类别ID/单位数量/单价/库存)
create table  [dbo].[DEMO_ReportProducts] (
	$clientDefine,
	[rProductID] [varchar] (100)   NOT NULL ,
	[rProductName] [varchar] (100)  NULL ,
	[rSupplierID] [varchar] (100)  NULL ,
	[rCategoryID] [varchar] (100)  NULL ,
	[rQuantityPerUnit] [varchar] (100)  NULL ,
	[rUnitPrice] [money] NULL ,
	[rUnitsinstock] [int] NULL 
)

$clientIndex(DEMO_ReportProducts) 

--供应商表
--(供应商ID/公司名称/联系人/联系人头衔/地址/城市/地区/邮编/国家/电话/传真/主页)
create table  [dbo].[DEMO_ReportSuppliers] (
	$clientDefine,
	[rSupplierID] [varchar] (100)  NOT NULL ,
	[rCompanyName] [varchar] (100)  NULL ,
	[rContactName] [varchar] (100)  NULL ,
	[rContactTitle] [varchar] (100)  NULL ,
	[rAddress] [varchar] (100)  NULL ,
	[rCity] [varchar] (100)  NULL ,
	[rRegion] [varchar] (100)  NULL ,
	[rPostalCode] [varchar] (100)  NULL ,
	[rCountry] [varchar] (100)  NULL ,
	[rPhone] [varchar] (100)  NULL ,
	[rFax] [varchar] (100)  NULL ,
	[rHomePage] [text]  NULL 
) 

$clientIndex(DEMO_ReportSuppliers) 

--顾客表
--(顾客ID/顾客名称/联系人名称/联系人头衔/地址/城市/地区/邮编/国家/电话/传真)
create table  [dbo].[DEMO_ReportCustomers] (
	$clientDefine,
	[rCustomerID] [varchar] (100)  NOT NULL ,
	[rCompanyName] [varchar] (100)  NULL ,
	[rContactName] [varchar] (100)  NULL ,
	[rContactTitle] [varchar] (100)  NULL ,
	[rAddress] [varchar] (100)  NULL ,
	[rCity] [varchar] (100)  NULL ,
	[rRegion] [varchar] (100)  NULL ,
	[rPostalCode] [varchar] (100)  NULL ,
	[rCountry] [varchar] (100)  NULL ,
	[rPhone] [varchar] (100)  NULL ,
	[rFax] [varchar] (100)  NULL 
)

$clientIndex(DEMO_ReportCustomers) 


--图表XY-LINE测试表
create table  [dbo].[DEMO_ReportChartLottery] (
	$clientDefine,
	[rLotteryID] [varchar] (100)   NOT NULL ,
	[rStage] [varchar] (100)  NULL ,
	[rLotteryNum1] [int] NULL ,
	[rLotteryNum2] [int] NULL ,
	[rLotteryNum3] [int] NULL 
)

$clientIndex(DEMO_ReportChartLottery) 

	
--图表甘特图测试表
create table  [dbo].[DEMO_ReportChartProject] (
	$clientDefine,
	[rProjectID] [varchar] (100)   NOT NULL ,
	[rProjectRole] [varchar] (20)  NULL ,
	[rProjectType] [varchar] (20)  NOT NULL ,
	[rStartTime] [datetime] NULL ,
	[rEndTime] [datetime] NULL ,
	[rPlanStartTime] [datetime] NULL ,
	[rPlanEndTime] [datetime] NULL 
)

$clientIndex(DEMO_ReportChartProject) 


--决策报表-产品纬度表
create table  [dbo].[DEMO_ReportProductDim] (
	$clientDefine,
	[rPID] [varchar] (100)  NULL ,
	[rMajorCategory] [varchar] (100)  NULL ,
	[rMinorCategory] [varchar] (100)  NULL ,
	[rName] [varchar] (100)  NULL 
)

$clientIndex(DEMO_ReportProductDim) 

--决策报表-地区纬度表
create table  [dbo].[DEMO_ReportRegionDim] (
	$clientDefine,
	[rRID] [varchar] (100)  NULL ,
	[rConuntry] [varchar] (100)  NULL ,
	[rRegion] [varchar] (100)  NULL ,
	[rProvince] [varchar] (100)  NULL ,
	[rCity] [varchar] (100)  NULL 
)

$clientIndex(DEMO_ReportRegionDim) 


--决策报表-时间纬度表
create table  [dbo].[DEMO_ReportTimeDim] (
	$clientDefine,
	[rTID] [varchar] (100)  NULL ,
	[rYear] [varchar] (100)  NULL ,
	[rQuarter] [varchar] (100)  NULL ,
	[rMonth] [varchar] (100)  NULL 
)

$clientIndex(DEMO_ReportTimeDim) 


--决策报表-销售事实表
create table  [dbo].[DEMO_ReportSalesFact] (
	$clientDefine,
	[rSID] [varchar] (100)  NULL ,
	[rRID] [varchar] (100)  NULL ,
	[rTID] [varchar] (100)  NULL ,
	[rPID] [varchar] (100)  NULL ,
	[rStoreSales] [money] NULL ,
	[rStoreCost] [money] NULL 
)

$clientIndex(DEMO_ReportSalesFact) 


create table  [dbo].[DEMO_ReportShippers] (
	$clientDefine,
	[rShipperID] [varchar] (100)  NULL ,
	[rCompanyname] [varchar] (100)  NULL ,
	[rPhone] [varchar] (100)  NULL
)

$clientIndex(DEMO_ReportShippers) 

--报表编辑测试表-主表
create table  [dbo].[R_BB] (
	$clientDefine,
	[fID] [varchar] (100)  NULL ,
	[fBM] [varchar] (100)  NULL ,
	[fBH] [varchar] (100)  NULL ,
	[fZBJG] [varchar] (100)  NULL ,
	[fPZJG] [varchar] (100)  NULL ,
	[fPZWH] [varchar] (100)  NULL ,
	[fYXQZ] [varchar] (100)  NULL ,
	[fDWFZR] [varchar] (100)  NULL ,
	[fTJFZR] [varchar] (100)  NULL ,
	[fTBR] [varchar] (100)  NULL ,
	[fBCRQ] [datetime] NULL ,
	[fXZQH] [varchar] (100)  NULL ,
	[fTBDW] [varchar] (100)  NULL ,
	[fN] [varchar] (100)  NULL ,
	[fY] [varchar] (100)  NULL ,
	[fSF] [varchar] (100)  NULL ,
	[fS] [varchar] (100)  NULL ,
	[fX] [varchar] (100)  NULL ,
	[f1] [varchar] (100)  NULL ,
	[f2] [varchar] (100)  NULL ,
	[f3] [varchar] (100)  NULL ,
	[f4] [varchar] (100)  NULL ,
	[f5] [varchar] (100)  NULL ,
	[f6] [varchar] (100)  NULL ,
	[f7] [varchar] (100)  NULL ,
	[version] [int] NULL 
)

$clientIndex(R_BB) 


--报表编辑测试表-从表
create table  [dbo].[R_ZB] (
	$clientDefine,
	[fID] [varchar] (100)  NULL ,
	[fCode] [int] NULL ,
	[fUnit] [varchar] (100)  NULL ,
	[fIndexType] [varchar] (100)  NULL ,
	[fRefID] [varchar] (100)  NULL ,
	[f1] [varchar] (100)  NULL ,
	[f2] [varchar] (100)  NULL ,
	[f3] [varchar] (100)  NULL ,
	[f4] [varchar] (100)  NULL ,
	[f5] [varchar] (100)  NULL ,
	[f6] [varchar] (100)  NULL ,
	[f7] [varchar] (100)  NULL ,
	[f8] [varchar] (100)  NULL ,
	[f9] [varchar] (100)  NULL ,
	[f10] [varchar] (100)  NULL ,
	[f11] [varchar] (100)  NULL ,
	[version] [int] NULL 
)

$clientIndex(R_ZB) 
