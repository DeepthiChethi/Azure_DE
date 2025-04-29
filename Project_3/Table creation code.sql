create table dbo.Customers(
	CustomerID int primary key,
	Name varchar(100),
	Email varchar(100),
	Address varchar(255)
)

Create table dbo.Products(
	ProductID int primary key,
	Name varchar(100),
	Category varchar(100),
	Price decimal(10,2)
)

create table onlineTransaction(
	OrderID int primary key,
	CustomerID int,
	ProductID int,
	DateTime datetime,
	PaymentMethond varchar(100),
	Amount decimal(10,2),
	status varchar(100),
	foreign key (CustomerID) references dbo.Customers(CustomerID),
	foreign key (ProductID)  references dbo.Products(ProductID)
)

create table dbo.Stores(
	StoreID int primary key,
	Location varchar(100),
	Manager varchar(100),
	OpenHours varchar(100)
)

create table dbo.InstoreTransactions(
	TransactioID int primary key,
	CustomerID int,
	StoreID int,
	Datetime datetime,
	Amount decimal(10,2),
	PaymentMethond varchar(100),
	foreign key (CustomerID) references dbo.Customers(CustomerID),
	foreign key (StoreID) references dbo.Stores(StoreID) 
)

create table Agents(
	AgentID int primary key,
	Name varchar(100),
	Department varchar(100),
	Shift varchar(100)
)

create table CustomerServiceInteraction(
	InteractionID int primary key,
	CustomerID int,
	Datetime datetime,
	AgentID int,
	IssueType varchar(100),
	ResolutionStatus varchar(50),
	foreign key (CustomerID) references dbo.Customers(CustomerID),
	foreign key (AgentID) references Agents(AgentID) 
)

Create table LoyaltyAccounts(
	LoyaltyID int primary key,
	CustomerID int,
	PointsEarned int,
	TierLevel varchar(50),
	JoinDate date,
	foreign key (CustomerID) references dbo.Customers(CustomerID)	
)


create table LoyaltyTransactions(
	LoyaltyID int,
	DateTime datetime,
	PointsChanges int,
	Reason varchar(50),
	Primary key (LoyaltyID,DateTime),
	foreign key (LoyaltyID) references LoyaltyAccounts(LoyaltyID)
)