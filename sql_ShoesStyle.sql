CREATE TABLE [dbo].[Item](
	[Item_ID] [varchar](5) NOT NULL,
	[Item_Name] [nvarchar](250) NULL,
	[Type] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[Size] [nvarchar](15) NULL,
	[Material] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[Collar] [varchar](8) NULL,
	[Midsole] [varchar](8) NULL,
	[Socklining] [varchar](8) NULL,
	[UpperEyestay] [varchar](8) NULL,
	[Eyestay] [varchar](8) NULL,
	[LowerEyestay] [varchar](8) NULL,
	[Heel] [varchar](8) NULL,
	[ToeBox] [varchar](8) NULL,
	[Tip] [varchar](8) NULL,
	[Quarter] [varchar](8) NULL,
	[Swoosh] [varchar](8) NULL,
	[Lace] [varchar](8) NULL,
	[Tongue] [varchar](8) NULL,
	[TongueRim] [varchar](8) NULL,
	[TongueTag] [varchar](8) NULL,
	[Outsole] [varchar](8) NULL,
	[Text] [varchar](8) NULL,
	[Emblem] [varchar](8) NULL,
	[Foxing] [varchar](8) NULL,
	[FoxingLine] [varchar](8) NULL,
	[HeelLabel] [varchar](8) NULL,
	[InnerLining] [varchar](8) NULL,
	[Vamp] [varchar](8) NULL,
	[Body] [varchar](8) NULL,
	[Eyeholes] [varchar](8) NULL,
	[HeelPatch] [varchar](8) NULL,
	[Logo] [varchar](8) NULL,
	[MidsoleLine] [varchar](8) NULL,
	[StarNText] [varchar](8) NULL,
	[ToeCap] [varchar](8) NULL,
	[Suade] [varchar](8) NULL,
	[Back] [varchar](8) NULL,
	[Import_Date] [datetime] NOT NULL,
 CONSTRAINT [PK__Item__3FB50F94A33FD8AF] PRIMARY KEY CLUSTERED 
(
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Item_ID__4E88ABD4]  DEFAULT ([dbo].[GenerateRandomString](newid(),(5))) FOR [Item_ID]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Quantity__4F7CD00D]  DEFAULT ((0)) FOR [Quantity]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Text__4D5F7D71]  DEFAULT ('#ffffff') FOR [Text]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Emblem__57DD0BE4]  DEFAULT ('#ffffff') FOR [Emblem]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Foxing__58D1301D]  DEFAULT ('#ffffff') FOR [Foxing]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__FoxingLine__59C55456]  DEFAULT ('#ffffff') FOR [FoxingLine]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__HeelLabel__5AB9788F]  DEFAULT ('#ffffff') FOR [HeelLabel]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__InnerLinin__5BAD9CC8]  DEFAULT ('#ffffff') FOR [InnerLining]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Vamp__5CA1C101]  DEFAULT ('#ffffff') FOR [Vamp]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Body__5D95E53A]  DEFAULT ('#ffffff') FOR [Body]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Eyeholes__5E8A0973]  DEFAULT ('#ffffff') FOR [Eyeholes]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__HeelPatch__5F7E2DAC]  DEFAULT ('#ffffff') FOR [HeelPatch]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Logo__607251E5]  DEFAULT ('#ffffff') FOR [Logo]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__MidsoleLin__6166761E]  DEFAULT ('#ffffff') FOR [MidsoleLine]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__StarNText__625A9A57]  DEFAULT ('#ffffff') FOR [StarNText]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__ToeCap__634EBE90]  DEFAULT ('#ffffff') FOR [ToeCap]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Suade__6442E2C9]  DEFAULT ('#ffffff') FOR [Suade]
GO

ALTER TABLE [dbo].[Item] ADD  CONSTRAINT [DF__Item__Import_Dat__01142BA1]  DEFAULT (getdate()) FOR [Import_Date]
GO

--end item
	
CREATE TABLE [dbo].[Delivery](
	[Order_ID] [varchar](5) NOT NULL,
	[Payment method] [nvarchar](50) NOT NULL,
	[Delivery method] [nchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Phone] [numeric](18, 0) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Receiver name] [nvarchar](80) NOT NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [UQ__Payment__F1E4639A7D602B6B] UNIQUE NONCLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO

ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Order]
GO


CREATE TABLE [dbo].[Account](
	[Email] [nvarchar](250) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Role] [nvarchar](250) NULL,
	[Phone] [numeric](18, 0) NULL,
	[Address] [nvarchar](250) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__Account__A9D105342A8EED5C] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_Role]  DEFAULT ('user') FOR [Role]
GO


CREATE TABLE [dbo].[Order](
	[Order_ID] [varchar](5) NOT NULL,
	[Order_Date] [date] NULL,
	[Account_Email] [nvarchar](250) NOT NULL,
	[Status] [varchar](20) NOT NULL,
 CONSTRAINT [PK__Order__F1E4639B75286FC2] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF__Order__Order_ID__5441852A]  DEFAULT ([dbo].[GenerateRandomString](newid(),(3))) FOR [Order_ID]
GO

ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Order_Date]  DEFAULT (getdate()) FOR [Order_Date]
GO

ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_Status]  DEFAULT ('Not requested') FOR [Status]
GO

ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Account] FOREIGN KEY([Account_Email])
REFERENCES [dbo].[Account] ([Email])
GO

ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Account]
GO


CREATE TABLE [dbo].[Order_Item](
	[Order_ID] [varchar](5) NOT NULL,
	[Item_ID] [varchar](5) NOT NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC,
	[Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order_Item] ADD  DEFAULT ((0)) FOR [Quantity]
GO

ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD  CONSTRAINT [FK__Order_Ite__Item___5AEE82B9] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[Item] ([Item_ID])
GO

ALTER TABLE [dbo].[Order_Item] CHECK CONSTRAINT [FK__Order_Ite__Item___5AEE82B9]
GO

ALTER TABLE [dbo].[Order_Item]  WITH CHECK ADD  CONSTRAINT [FK__Order_Ite__Order__59FA5E80] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO

ALTER TABLE [dbo].[Order_Item] CHECK CONSTRAINT [FK__Order_Ite__Order__59FA5E80]
GO


CREATE TABLE [dbo].[Voucher](
	[Voucher_ID] [int] NOT NULL,
	[Discount] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[Voucher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[FeedBack](
	[Contents] [nvarchar](1) NULL,
	[Item_ID] [varchar](5) NULL,
	[Account_ID] [varchar](50) NOT NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FeedBack](
	[Order_ID] [varchar](3) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Rating] [nvarchar](20) NULL,
	[Description] [nvarchar](255) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Account] FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO

ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Account]
GO

ALTER TABLE [dbo].[FeedBack]  WITH CHECK ADD  CONSTRAINT [FK_FeedBack_Delivery] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Delivery] ([Order_ID])
GO

ALTER TABLE [dbo].[FeedBack] CHECK CONSTRAINT [FK_FeedBack_Delivery]
GO

-- chạy sau khi tạo bảng
CREATE TRIGGER UpdateItemQuantityAfterInsert
ON [Order_Item]
AFTER INSERT
AS
BEGIN
    -- Cập nhật số lượng sản phẩm sau khi đặt hàng
    UPDATE oi
    SET oi.Quantity = oi.Quantity + 1
    FROM Order_Item AS oi
    INNER JOIN inserted AS ins ON oi.Order_ID = ins.Order_ID AND oi.Item_ID = ins.Item_ID
    INNER JOIN [Order] AS o ON oi.Order_ID = o.Order_ID
    INNER JOIN Item AS i ON oi.Item_ID = i.Item_ID
END;

Drop trigger UpdateItemQuantityAfterInsertOnItem
-----------------------------------------------------------------------------------------------------------------
---Chạy sau khi tạo bảng
CREATE TRIGGER UpdateItemQuantityAfterInsertOnItem
ON [Item]
AFTER INSERT
AS
BEGIN
    -- Cập nhật số lượng sản phẩm sau khi đặt hàng
    UPDATE i
    SET i.Quantity = i.Quantity + 1
	From Item i
	INNER JOIN inserted AS ins on i.Item_ID = ins.Item_ID
END;

----------------------------------------------------------------------------------------------------
Drop trigger trg_GetLatestInsertedID
-- chạy funtion này sau khi tạo bảng, funtion này dùng để lấy id giá trị mới nhất được insert
CREATE FUNCTION GetLatestInsertedIDFunction()
RETURNS VARCHAR(5)
AS
BEGIN
    DECLARE @LatestInsertedID VARCHAR(5);
    SELECT TOP 1 @LatestInsertedID = Item_ID
    FROM Item
    ORDER BY Import_Date DESC;
    RETURN @LatestInsertedID;
END;
insert into Item(Item_Name, [Type], Pattern, Size, Meterial, Import_Date) values('Shoe Yellow','Green','asdfasd', 34, 'Wood',GetDate())
update Item set Quantity = Quantity + 1 Where Item_ID = dbo.GetLatestInsertedIDFunction()
select * from Item
----------------------------------------------------------------------------------

----Chạy function này trước khi tạo bảng
CREATE FUNCTION dbo.GenerateRandomString(@RandomValue VARBINARY(10), @Length INT) 
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @RandomString VARCHAR(10) = ''
    DECLARE @Counter INT = 1

    WHILE @Counter <= @Length
    BEGIN
        DECLARE @RandomChar CHAR(1)
        SET @RandomChar = CHAR(65 + (ASCII(SUBSTRING(@RandomValue, @Counter, 1)) % 26))
        SET @RandomString = @RandomString + @RandomChar
        SET @Counter = @Counter + 1
    END
    RETURN @RandomString
END;


--sau khi insert thì nó tự lấy Item_ID, mấy câu dưới này mày có thể tự tạo để chạy thử
insert into Item(Item_Name, [Type], Pattern, Size, Meterial, Import_Date) values('Shoe Yellow','Green','asdfasd', 34, 'Wood',GetDate())

select * from Item
insert into [Order](Order_Date, [Status], Account_ID) values(GETDATE(), 1, 2)
insert into Order_Item(Order_ID, Item_ID) values('QRT', 'GXADO')
insert into Voucher(Voucher_ID) values(38)

update Item Set Quantity = it.Quantity + 1  

update Order_Item Set Quantity = Quantity - 1 Where Order_ID = 'CBO' and Item_ID = 'DSKZJ'
