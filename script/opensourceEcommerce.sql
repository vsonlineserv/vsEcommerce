CREATE DATABASE [opensourceEcommerce]
GO
USE [opensourceEcommerce]
GO
CREATE TABLE [dbo].[Area](
	[City] [nvarchar](100) NOT NULL,
	[AreaName] [nvarchar](100) NOT NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[City] ASC,
	[AreaName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BuyerAddress]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuyerAddress](
	[BuyerAddressId] [int] IDENTITY(1,1) NOT NULL,
	[User] [int] NOT NULL,
	[State] [nvarchar](4000) NULL,
	[City] [nvarchar](4000) NULL,
	[Address1] [nvarchar](4000) NULL,
	[Address2] [nvarchar](4000) NULL,
	[PostalCode] [nvarchar](4000) NULL,
	[PhoneNumber] [nvarchar](4000) NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
	[Country] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.BuyerAddress] PRIMARY KEY CLUSTERED 
(
	[BuyerAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ParentCategoryId] [int] NULL,
	[Name] [nvarchar](400) NOT NULL,
	[MetaTitle] [nvarchar](400) NULL,
	[Published] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[CategoryGroupTag] [nvarchar](150) NULL,
	[GroupDisplayOrder] [int] NULL,
	[FlagShowBuy] [bit] NULL,
	[ShowOnHomePage] [bit] NULL,
	[CategoryImage] [nvarchar](max) NULL,
	[PermaLink] [nvarchar](400) NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
	[MarketPlaceVbuyCategory] [bit] NULL,
	[CreatedBy] [nvarchar](400) NULL,
	[FlagSampleCategory] [bit] NULL,
 CONSTRAINT [PK_dbo.Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryMasterFilter]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryMasterFilter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [int] NOT NULL,
	[FilterParameter] [nvarchar](100) NOT NULL,
	[Unit] [nvarchar](50) NULL,
	[DisplayType] [text] NULL,
 CONSTRAINT [PK_CategoryFilter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AllowsBilling] [bit] NOT NULL,
	[AllowsShipping] [bit] NOT NULL,
	[TwoLetterIsoCode] [nvarchar](2) NULL,
	[ThreeLetterIsoCode] [nvarchar](3) NULL,
	[NumericIsoCode] [int] NOT NULL,
	[SubjectToVat] [bit] NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [varchar](50) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Symbol] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DiscountTypeId] [int] NOT NULL,
	[UsePercentage] [bit] NOT NULL,
	[DiscountPercentage] [decimal](18, 4) NOT NULL,
	[DiscountAmount] [decimal](18, 4) NOT NULL,
	[StartDateUtc] [datetime] NULL,
	[EndDateUtc] [datetime] NULL,
	[RequiresCouponCode] [bit] NOT NULL,
	[CouponCode] [nvarchar](100) NOT NULL,
	[MinOrderValue] [decimal](18, 4) NULL,
	[MaxDiscountAmount] [decimal](18, 4) NULL,
	[CreatedDateUtc] [datetime] NULL,
	[UpdatedDateUtc] [datetime] NULL,
	[IsDeleted] [bit] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_dbo.Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MetaKeywords] [nvarchar](400) NULL,
	[MetaDescription] [nvarchar](4000) NULL,
	[MetaTitle] [nvarchar](400) NULL,
	[LimitedToStores] [bit] NULL,
	[Deleted] [bit] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
	[ManufacturerImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewInventory]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewInventory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[SellerBranchId] [int] NOT NULL,
	[SKU] [varchar](30) NULL,
	[BarCode] [varchar](30) NULL,
	[AvailableQuantity] [int] NULL,
	[FlagTrackQuantity] [bit] NULL,
	[FlagAllowSellOutOfStock] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_NewInventory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewMasterParcelService]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewMasterParcelService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarrierName] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[CreatedBy] [varchar](30) NULL,
	[IsDeleted] [bit] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_NewMasterParcelService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewMasterSettingsSelections]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewMasterSettingsSelections](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MasterSettings] [varchar](50) NOT NULL,
	[CurrentSelection] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_NewMasterSettingsSelections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewMasterShippingCalculation]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewMasterShippingCalculation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](30) NULL,
	[DisplayName] [varchar](30) NULL,
	[DeliveryTime] [varchar](30) NULL,
	[Rate] [int] NULL,
	[RangeStart] [int] NULL,
	[RangeEnd] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](30) NULL,
	[IsDeleted] [bit] NULL,
	[UpdatedDate] [datetime] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_NewMasterShippingCalculation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] IDENTITY(10010,1) NOT NULL,
	[OrderGuid] [uniqueidentifier] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[BillingAddressId] [int] NOT NULL,
	[ShippingAddressId] [int] NOT NULL,
	[OrderStatusId] [int] NOT NULL,
	[ShippingStatusId] [int] NOT NULL,
	[PaymentStatusId] [int] NOT NULL,
	[DeliveryMethod] [int] NOT NULL,
	[PaymentMethod] [int] NOT NULL,
	[VatNumber] [nvarchar](200) NULL,
	[OrderSubtotalInclTax] [decimal](18, 4) NULL,
	[OrderShippingCharges] [decimal](18, 4) NULL,
	[PaymentMethodAdditionalFee] [decimal](18, 4) NULL,
	[OrderDiscount] [decimal](18, 4) NULL,
	[OrderTotal] [decimal](18, 4) NULL,
	[RefundedAmount] [decimal](18, 4) NULL,
	[CustomerIp] [nvarchar](200) NULL,
	[TransactionId] [nvarchar](200) NULL,
	[TransactionResult] [nvarchar](max) NULL,
	[TransactionResultDetails] [nvarchar](max) NULL,
	[OrderDateUtc] [datetime] NULL,
	[Deleted] [bit] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[PurchaseOrderStatus] [int] NULL,
	[OrderCancel] [bit] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
	[OrderTaxTotal] [decimal](18, 4) NULL,
	[OrderShippingTotal] [decimal](18, 4) NULL,
	[FlagConfirmStatus] [bit] NULL,
	[OrderOrigin] [nvarchar](400) NULL,
	[BranchOrderId] [int] NULL,
	[OrderFromVbuy] [bit] NULL,
	[OrderFromVshopper] [bit] NULL,
 CONSTRAINT [PK_dbo.Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProductItem]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProductItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderItemGuid] [uniqueidentifier] NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPriceInclTax] [decimal](18, 4) NOT NULL,
	[PriceInclTax] [decimal](18, 4) NOT NULL,
	[OrderItemStatus] [int] NULL,
	[SelectedSize] [nvarchar](50) NULL,
	[OrderCancel] [bit] NULL,
	[ShippingCharges] [decimal](18, 0) NULL,
 CONSTRAINT [PK_dbo.OrderItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PasswordReset]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PasswordReset](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](200) NOT NULL,
	[PasswordResetToken] [nvarchar](500) NOT NULL,
	[PasswordResetExpiration] [datetime] NOT NULL,
	[FlagCompleted] [bit] NOT NULL,
	[StoreId] [int] NULL,
	[IsVbuyUser] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Permission] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricing]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricing](
	[PricingId] [int] IDENTITY(1,1) NOT NULL,
	[Product] [int] NOT NULL,
	[ProductVariantId] [int] NULL,
	[Store] [int] NOT NULL,
	[Branch] [int] NOT NULL,
	[CallForPrice] [bit] NULL,
	[Price] [decimal](18, 4) NULL,
	[OldPrice] [decimal](18, 4) NULL,
	[ProductCost] [decimal](18, 4) NULL,
	[SpecialPrice] [decimal](18, 4) NULL,
	[SpecialPriceDescription] [nvarchar](50) NULL,
	[SpecialPriceStartDateTimeUtc] [datetime] NULL,
	[SpecialPriceEndDateTimeUtc] [datetime] NULL,
	[AdditionalShippingCharge] [decimal](18, 4) NULL,
	[DeliveryTime] [int] NULL,
	[IsShipEnabled] [bit] NULL,
	[IsFreeShipping] [bit] NULL,
	[AdditionalTax] [decimal](18, 0) NULL,
	[CreatedUser] [nvarchar](50) NULL,
	[UpdatedUser] [nvarchar](50) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_Pricing] PRIMARY KEY CLUSTERED 
(
	[PricingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeId] [int] NULL,
	[Name] [nvarchar](400) NOT NULL,
	[ShortDescription] [nvarchar](4000) NULL,
	[FullDescription] [nvarchar](max) NOT NULL,
	[Manufacturer] [int] NULL,
	[Category] [int] NULL,
	[ShowOnHomePage] [bit] NOT NULL,
	[MetaKeywords] [nvarchar](400) NULL,
	[MetaDescription] [nvarchar](4000) NULL,
	[MetaTitle] [nvarchar](400) NULL,
	[SubjectToAcl] [bit] NULL,
	[LimitedToStores] [bit] NULL,
	[Sku] [nvarchar](400) NULL,
	[ManufacturerPartNumber] [nvarchar](400) NULL,
	[Gtin] [nvarchar](400) NULL,
	[IsGiftCard] [bit] NULL,
	[GiftCardTypeId] [int] NULL,
	[Weight] [nvarchar](50) NULL,
	[Length] [nvarchar](50) NULL,
	[Width] [nvarchar](50) NULL,
	[Height] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[Published] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[ProductDescriptionHtml] [nvarchar](max) NULL,
	[Size1] [nvarchar](50) NULL,
	[Size2] [nvarchar](50) NULL,
	[Size3] [nvarchar](50) NULL,
	[Size4] [nvarchar](50) NULL,
	[Size5] [nvarchar](50) NULL,
	[Size6] [nvarchar](50) NULL,
	[PermaLink] [nvarchar](400) NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
	[CreatedBy] [nvarchar](400) NULL,
	[FlagSharedInfo] [bit] NULL,
	[FlagSampleProducts] [bit] NULL,
 CONSTRAINT [PK_dbo.Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductContact]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ProductId] [int] NOT NULL,
	[StoreId] [int] NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
	[Subject] [nvarchar](200) NULL,
	[Reply] [nvarchar](200) NULL,
	[ReplyDate] [datetime] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_ProductContact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductFilterValue]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFilterValue](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CategoryMasterFilter] [int] NOT NULL,
	[FilterValue] [nvarchar](500) NOT NULL,
	[FilterValueText] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_ProductFilterValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PictureName] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[BranchId] [int] NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductKeyFeatures]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductKeyFeatures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Parameter] [nvarchar](100) NULL,
	[KeyFeature] [nvarchar](300) NOT NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_ProductKeyFeatures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductRating]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductRating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[User] [int] NULL,
 CONSTRAINT [PK_ProductRating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSpecification]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSpecification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[SpecificationGroup] [nvarchar](50) NOT NULL,
	[SpecificationAttribute] [nvarchar](50) NOT NULL,
	[SpecificationDetails] [nvarchar](300) NOT NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_ProductSpecification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStoreMapping]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStoreMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](400) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[Manufacturer] [int] NULL,
	[Category] [int] NULL,
	[ShowOnHomePage] [bit] NOT NULL,
	[Published] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[PermaLink] [nvarchar](400) NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[FlagSampleProducts] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductVariants]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductVariants](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Option1] [nvarchar](400) NULL,
	[Option2] [nvarchar](400) NULL,
	[Option3] [nvarchar](400) NULL,
	[FlagDeleted] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PushNotification]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PushNotification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthId] [nvarchar](4000) NULL,
	[DeviceToken] [nvarchar](4000) NULL,
	[FlagNotification] [bit] NULL,
	[BranchId] [int] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [nvarchar](400) NOT NULL,
	[LogoPicture] [nvarchar](400) NULL,
	[Description] [nvarchar](4000) NULL,
	[PrimaryContact] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[CreatedUser] [int] NOT NULL,
	[OriginalStoreName] [nvarchar](400) NULL,
	[StoreRefereneId] [int] NULL,
	[FlagvBuy] [bit] NULL,
 CONSTRAINT [PK_dbo.Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerBranch]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerBranch](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[Store] [int] NOT NULL,
	[BranchName] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](400) NULL,
	[Country] [int] NULL,
	[State] [nvarchar](400) NULL,
	[City] [nvarchar](400) NULL,
	[Address1] [nvarchar](500) NULL,
	[Address2] [nvarchar](500) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](100) NULL,
	[FaxNumber] [nvarchar](100) NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[Latitude] [decimal](10, 7) NULL,
	[Longitude] [decimal](10, 7) NULL,
	[EnableBuy] [bit] NULL,
	[FlagPartner] [bit] NULL,
	[OriginalBranchName] [nvarchar](200) NULL,
	[StoreType] [nvarchar](200) NULL,
	[OrderIdPrefix] [nvarchar](200) NULL,
	[FlagvBuy] [bit] NULL,
 CONSTRAINT [PK_dbo.Address] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerCategory]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerCategory](
	[Id] [int] IDENTITY(1000,1) NOT NULL,
	[seller] [int] NULL,
	[Category] [int] NULL,
	[FlagDeleted] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerRating]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerRating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[UpdatedOnUtc] [datetime] NULL,
 CONSTRAINT [PK_SellerRating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SellerStaffMapping]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SellerStaffMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[StoreRefereneId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiprocketApiUser]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiprocketApiUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[ShiprocketToken] [nvarchar](max) NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
	[CreatedOnUtc] [datetime2](7) NULL,
	[UpdatedOnUtc] [datetime2](7) NULL,
	[ExpireTime] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShiprocketOrderDetails]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShiprocketOrderDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [nvarchar](50) NULL,
	[ShiprocketOrderId] [nvarchar](50) NULL,
	[ShipmentId] [nvarchar](50) NULL,
	[AwbCode] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCartItem]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCartItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [decimal](18, 0) NOT NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[UpdatedOnUtc] [datetime] NOT NULL,
	[ShippingCharges] [decimal](18, 0) NULL,
	[SelectedSize] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.ShoppingCartItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteSettings]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteSettings](
	[SiteKey] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](100) NULL,
 CONSTRAINT [PK_SiteSettings] PRIMARY KEY CLUSTERED 
(
	[SiteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubscriptionProvider]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubscriptionProvider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [varchar](50) NULL,
	[SecretKey] [varchar](max) NULL,
	[SecretId] [varchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[FlagEnable] [bit] NULL,
	[ProviderName] [int] NULL,
	[Details1] [varchar](max) NULL,
	[Details2] [varchar](max) NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaxMaster]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxMaster](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TaxType] [varchar](50) NULL,
	[PrimaryOption] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_Pricing]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_Pricing](
	[BranchName] [nvarchar](200) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[StoreId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[Price] [decimal](18, 4) NULL,
	[SpecialPrice] [decimal](18, 4) NULL,
	[AdditionalShippingCharge] [decimal](18, 4) NULL,
	[AdditionalTax] [decimal](18, 0) NULL,
	[Published] [bit] NULL,
	[FullDescription] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_Product]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_Product](
	[PictureName] [nvarchar](400) NULL,
	[Category] [nvarchar](400) NULL,
	[SubCategory] [nvarchar](400) NULL,
	[Name] [nvarchar](400) NOT NULL,
	[ShortDescription] [nvarchar](4000) NULL,
	[FullDescription] [nvarchar](max) NULL,
	[Manufacturer] [nvarchar](400) NULL,
	[MetaKeywords] [nvarchar](400) NULL,
	[MetaDescription] [nvarchar](4000) NULL,
	[MetaTitle] [nvarchar](400) NULL,
	[ManufacturerPartNumber] [nvarchar](400) NULL,
	[Gtin] [nvarchar](400) NULL,
	[IsGiftCard] [bit] NULL,
	[Weight] [nvarchar](50) NULL,
	[Length] [nvarchar](50) NULL,
	[Width] [nvarchar](50) NULL,
	[Height] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[Published] [bit] NULL,
	[PictureName1] [nvarchar](400) NULL,
	[PictureName2] [nvarchar](400) NULL,
	[Size1] [nvarchar](50) NULL,
	[Size2] [nvarchar](50) NULL,
	[Size3] [nvarchar](50) NULL,
	[Size4] [nvarchar](50) NULL,
	[Size5] [nvarchar](50) NULL,
	[Size6] [nvarchar](50) NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL,
	[PermaLink] [nvarchar](400) NULL,
	[ProductShowOnHomePage] [bit] NULL,
	[ShowOnHomePage] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ProductFilterValue]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ProductFilterValue](
	[CategoryId] [int] NULL,
	[ProductId] [int] NULL,
	[FilterParameter] [varchar](400) NULL,
	[FilterValue] [varchar](400) NULL,
	[FilterValueText] [varchar](400) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ProductFilterValueWithProductName]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ProductFilterValueWithProductName](
	[ProductName] [varchar](5000) NULL,
	[FilterParameter] [varchar](400) NULL,
	[FilterValue] [varchar](400) NULL,
	[FilterValueText] [varchar](400) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ProductImage]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ProductImage](
	[ProductName] [nvarchar](400) NULL,
	[PictureName] [nvarchar](400) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ProductKeyFeatures]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ProductKeyFeatures](
	[ProductName] [nvarchar](400) NOT NULL,
	[Parameter] [nvarchar](100) NULL,
	[KeyFeature] [nvarchar](300) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_ProductSpecification]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_ProductSpecification](
	[ProductName] [nvarchar](400) NOT NULL,
	[SpecificationGroup] [nvarchar](50) NOT NULL,
	[SpecificationAttribute] [nvarchar](50) NOT NULL,
	[SpecificationDetails] [nvarchar](300) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserGuid] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](200) NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[LastName] [nvarchar](200) NULL,
	[Email] [nvarchar](500) NULL,
	[PhoneNumber1] [nvarchar](200) NULL,
	[PhoneNumber2] [nvarchar](200) NULL,
	[Password] [varbinary](64) NULL,
	[PasswordFormatId] [int] NOT NULL,
	[PasswordSalt] [nvarchar](200) NULL,
	[IsMerchant] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[LastIpAddress] [nvarchar](200) NULL,
	[CreatedOnUtc] [datetime] NOT NULL,
	[LastLoginDateUtc] [datetime] NULL,
	[BillingAddress_Id] [int] NULL,
	[ShippingAddress_Id] [int] NULL,
	[UpdatedOnUtc] [datetime] NULL,
	[IsAdmin] [bit] NULL,
	[IsSuperAdmin] [bit] NULL,
	[IsSales] [bit] NULL,
	[IsSupport] [bit] NULL,
	[IsMarketing] [bit] NULL,
	[StoreId] [int] NULL,
	[IsVbuyUser] [bit] NULL,
	[UserProfileImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPermissionMapping]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPermissionMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PermissionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWishlist]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWishlist](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User] [int] NOT NULL,
	[Product] [int] NOT NULL,
	[CreatedOnUtc] [datetime] NULL,
	[StoreId] [int] NULL,
	[BranchId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VariantOptions]    Script Date: 15-09-2023 19:38:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariantOptions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Options] [nvarchar](400) NOT NULL,
	[FlagDeleted] [bit] NOT NULL,
	[CreatedOnUtc] [datetime] NULL,
	[UpdatedOnUtc] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [ParentCategoryId], [Name], [MetaTitle], [Published], [IsDeleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [CategoryGroupTag], [GroupDisplayOrder], [FlagShowBuy], [ShowOnHomePage], [CategoryImage], [PermaLink], [StoreId], [BranchId], [MarketPlaceVbuyCategory], [CreatedBy], [FlagSampleCategory]) VALUES (1, NULL, N'Mobiles', NULL, 1, 0, NULL, CAST(N'2023-09-15T12:39:09.127' AS DateTime), CAST(N'2023-09-15T12:39:09.127' AS DateTime), NULL, NULL, 1, NULL, NULL, N'mobiles', NULL, 1, NULL, N'adminuser1@testvsecom.change', NULL)
INSERT [dbo].[Category] ([CategoryId], [ParentCategoryId], [Name], [MetaTitle], [Published], [IsDeleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [CategoryGroupTag], [GroupDisplayOrder], [FlagShowBuy], [ShowOnHomePage], [CategoryImage], [PermaLink], [StoreId], [BranchId], [MarketPlaceVbuyCategory], [CreatedBy], [FlagSampleCategory]) VALUES (2, 1, N'Samsung', NULL, 1, 0, NULL, CAST(N'2023-09-15T12:39:38.267' AS DateTime), CAST(N'2023-09-15T12:39:38.267' AS DateTime), NULL, NULL, 1, NULL, NULL, N'samsung', NULL, 1, NULL, N'adminuser1@testvsecom.change', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (1, N'United States', 1, 1, N'US', N'USA', 840, 0, 1, 1)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (2, N'Canada', 1, 1, N'CA', N'CAN', 124, 0, 1, 2)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (3, N'Germany', 1, 1, N'DE', N'DEU', 276, 1, 1, -10)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (4, N'Austria', 1, 1, N'AT', N'AUT', 40, 1, 1, -5)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (5, N'Switzerland', 1, 1, N'CH', N'CHE', 756, 0, 1, -1)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (6, N'Argentina', 1, 1, N'AR', N'ARG', 32, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (7, N'Armenia', 1, 1, N'AM', N'ARM', 51, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (8, N'Aruba', 1, 1, N'AW', N'ABW', 533, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (9, N'Australia', 1, 1, N'AU', N'AUS', 36, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (10, N'Azerbaijan', 1, 1, N'AZ', N'AZE', 31, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (11, N'Bahamas', 1, 1, N'BS', N'BHS', 44, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (12, N'Bangladesh', 1, 1, N'BD', N'BGD', 50, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (13, N'Belarus', 1, 1, N'BY', N'BLR', 112, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (14, N'Belgium', 1, 1, N'BE', N'BEL', 56, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (15, N'Belize', 1, 1, N'BZ', N'BLZ', 84, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (16, N'Bermuda', 1, 1, N'BM', N'BMU', 60, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (17, N'Bolivia', 1, 1, N'BO', N'BOL', 68, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (18, N'Bosnia and Herzegowina', 1, 1, N'BA', N'BIH', 70, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (19, N'Brazil', 1, 1, N'BR', N'BRA', 76, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (20, N'Bulgaria', 1, 1, N'BG', N'BGR', 100, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (21, N'Cayman Islands', 1, 1, N'KY', N'CYM', 136, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (22, N'Chile', 1, 1, N'CL', N'CHL', 152, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (23, N'China', 1, 1, N'CN', N'CHN', 156, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (24, N'Colombia', 1, 1, N'CO', N'COL', 170, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (25, N'Costa Rica', 1, 1, N'CR', N'CRI', 188, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (26, N'Croatia', 1, 1, N'HR', N'HRV', 191, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (27, N'Cuba', 1, 1, N'CU', N'CUB', 192, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (28, N'Cyprus', 1, 1, N'CY', N'CYP', 196, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (29, N'Czech Republic', 1, 1, N'CZ', N'CZE', 203, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (30, N'Denmark', 1, 1, N'DK', N'DNK', 208, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (31, N'Dominican Republic', 1, 1, N'DO', N'DOM', 214, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (32, N'Ecuador', 1, 1, N'EC', N'ECU', 218, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (33, N'Egypt', 1, 1, N'EG', N'EGY', 818, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (34, N'Finland', 1, 1, N'FI', N'FIN', 246, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (35, N'France', 1, 1, N'FR', N'FRA', 250, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (36, N'Georgia', 1, 1, N'GE', N'GEO', 268, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (37, N'Gibraltar', 1, 1, N'GI', N'GIB', 292, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (38, N'Greece', 1, 1, N'GR', N'GRC', 300, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (39, N'Guatemala', 1, 1, N'GT', N'GTM', 320, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (40, N'Hong Kong', 1, 1, N'HK', N'HKG', 344, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (41, N'Hungary', 1, 1, N'HU', N'HUN', 348, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (42, N'India', 1, 1, N'IN', N'IND', 356, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (43, N'Indonesia', 1, 1, N'ID', N'IDN', 360, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (44, N'Ireland', 1, 1, N'IE', N'IRL', 372, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (45, N'Israel', 1, 1, N'IL', N'ISR', 376, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (46, N'Italy', 1, 1, N'IT', N'ITA', 380, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (47, N'Jamaica', 1, 1, N'JM', N'JAM', 388, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (48, N'Japan', 1, 1, N'JP', N'JPN', 392, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (49, N'Jordan', 1, 1, N'JO', N'JOR', 400, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (50, N'Kazakhstan', 1, 1, N'KZ', N'KAZ', 398, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (51, N'Korea, Democratic People''s Republic of', 1, 1, N'KP', N'PRK', 408, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (52, N'Kuwait', 1, 1, N'KW', N'KWT', 414, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (53, N'Malaysia', 1, 1, N'MY', N'MYS', 458, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (54, N'Mexico', 1, 1, N'MX', N'MEX', 484, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (55, N'Netherlands', 1, 1, N'NL', N'NLD', 528, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (56, N'New Zealand', 1, 1, N'NZ', N'NZL', 554, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (57, N'Norway', 1, 1, N'NO', N'NOR', 578, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (58, N'Pakistan', 1, 1, N'PK', N'PAK', 586, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (59, N'Paraguay', 1, 1, N'PY', N'PRY', 600, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (60, N'Peru', 1, 1, N'PE', N'PER', 604, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (61, N'Philippines', 1, 1, N'PH', N'PHL', 608, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (62, N'Poland', 1, 1, N'PL', N'POL', 616, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (63, N'Portugal', 1, 1, N'PT', N'PRT', 620, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (64, N'Puerto Rico', 1, 1, N'PR', N'PRI', 630, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (65, N'Qatar', 1, 1, N'QA', N'QAT', 634, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (66, N'Romania', 1, 1, N'RO', N'ROM', 642, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (67, N'Russia', 1, 1, N'RU', N'RUS', 643, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (68, N'Saudi Arabia', 1, 1, N'SA', N'SAU', 682, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (69, N'Singapore', 1, 1, N'SG', N'SGP', 702, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (70, N'Slovakia (Slovak Republic)', 1, 1, N'SK', N'SVK', 703, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (71, N'Slovenia', 1, 1, N'SI', N'SVN', 705, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (72, N'South Africa', 1, 1, N'ZA', N'ZAF', 710, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (73, N'Spain', 1, 1, N'ES', N'ESP', 724, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (74, N'Sweden', 1, 1, N'SE', N'SWE', 752, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (75, N'Taiwan', 1, 1, N'TW', N'TWN', 158, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (76, N'Thailand', 1, 1, N'TH', N'THA', 764, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (77, N'Turkey', 1, 1, N'TR', N'TUR', 792, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (78, N'Ukraine', 1, 1, N'UA', N'UKR', 804, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (79, N'United Arab Emirates', 1, 1, N'AE', N'ARE', 784, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (80, N'United Kingdom', 1, 1, N'GB', N'GBR', 826, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (81, N'United States minor outlying islands', 1, 1, N'UM', N'UMI', 581, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (82, N'Uruguay', 1, 1, N'UY', N'URY', 858, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (83, N'Uzbekistan', 1, 1, N'UZ', N'UZB', 860, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (84, N'Venezuela', 1, 1, N'VE', N'VEN', 862, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (85, N'Serbia', 1, 1, N'RS', N'SRB', 688, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (86, N'Afghanistan', 1, 1, N'AF', N'AFG', 4, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (87, N'Albania', 1, 1, N'AL', N'ALB', 8, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (88, N'Algeria', 1, 1, N'DZ', N'DZA', 12, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (89, N'American Samoa', 1, 1, N'AS', N'ASM', 16, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (90, N'Andorra', 1, 1, N'AD', N'AND', 20, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (91, N'Angola', 1, 1, N'AO', N'AGO', 24, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (92, N'Anguilla', 1, 1, N'AI', N'AIA', 660, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (93, N'Antarctica', 1, 1, N'AQ', N'ATA', 10, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (94, N'Antigua and Barbuda', 1, 1, N'AG', N'ATG', 28, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (95, N'Bahrain', 1, 1, N'BH', N'BHR', 48, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (96, N'Barbados', 1, 1, N'BB', N'BRB', 52, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (97, N'Benin', 1, 1, N'BJ', N'BEN', 204, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (98, N'Bhutan', 1, 1, N'BT', N'BTN', 64, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (99, N'Botswana', 1, 1, N'BW', N'BWA', 72, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (100, N'Bouvet Island', 1, 1, N'BV', N'BVT', 74, 0, 1, 100)
GO
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (101, N'British Indian Ocean Territory', 1, 1, N'IO', N'IOT', 86, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (102, N'Brunei Darussalam', 1, 1, N'BN', N'BRN', 96, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (103, N'Burkina Faso', 1, 1, N'BF', N'BFA', 854, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (104, N'Burundi', 1, 1, N'BI', N'BDI', 108, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (105, N'Cambodia', 1, 1, N'KH', N'KHM', 116, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (106, N'Cameroon', 1, 1, N'CM', N'CMR', 120, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (107, N'Cape Verde', 1, 1, N'CV', N'CPV', 132, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (108, N'Central African Republic', 1, 1, N'CF', N'CAF', 140, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (109, N'Chad', 1, 1, N'TD', N'TCD', 148, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (110, N'Christmas Island', 1, 1, N'CX', N'CXR', 162, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (111, N'Cocos (Keeling) Islands', 1, 1, N'CC', N'CCK', 166, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (112, N'Comoros', 1, 1, N'KM', N'COM', 174, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (113, N'Congo', 1, 1, N'CG', N'COG', 178, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (114, N'Cook Islands', 1, 1, N'CK', N'COK', 184, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (115, N'Cote D''Ivoire', 1, 1, N'CI', N'CIV', 384, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (116, N'Djibouti', 1, 1, N'DJ', N'DJI', 262, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (117, N'Dominica', 1, 1, N'DM', N'DMA', 212, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (118, N'El Salvador', 1, 1, N'SV', N'SLV', 222, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (119, N'Equatorial Guinea', 1, 1, N'GQ', N'GNQ', 226, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (120, N'Eritrea', 1, 1, N'ER', N'ERI', 232, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (121, N'Estonia', 1, 1, N'EE', N'EST', 233, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (122, N'Ethiopia', 1, 1, N'ET', N'ETH', 231, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (123, N'Falkland Islands (Malvinas)', 1, 1, N'FK', N'FLK', 238, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (124, N'Faroe Islands', 1, 1, N'FO', N'FRO', 234, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (125, N'Fiji', 1, 1, N'FJ', N'FJI', 242, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (126, N'French Guiana', 1, 1, N'GF', N'GUF', 254, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (127, N'French Polynesia', 1, 1, N'PF', N'PYF', 258, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (128, N'French Southern Territories', 1, 1, N'TF', N'ATF', 260, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (129, N'Gabon', 1, 1, N'GA', N'GAB', 266, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (130, N'Gambia', 1, 1, N'GM', N'GMB', 270, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (131, N'Ghana', 1, 1, N'GH', N'GHA', 288, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (132, N'Greenland', 1, 1, N'GL', N'GRL', 304, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (133, N'Grenada', 1, 1, N'GD', N'GRD', 308, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (134, N'Guadeloupe', 1, 1, N'GP', N'GLP', 312, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (135, N'Guam', 1, 1, N'GU', N'GUM', 316, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (136, N'Guinea', 1, 1, N'GN', N'GIN', 324, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (137, N'Guinea-bissau', 1, 1, N'GW', N'GNB', 624, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (138, N'Guyana', 1, 1, N'GY', N'GUY', 328, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (139, N'Haiti', 1, 1, N'HT', N'HTI', 332, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (140, N'Heard and Mc Donald Islands', 1, 1, N'HM', N'HMD', 334, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (141, N'Honduras', 1, 1, N'HN', N'HND', 340, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (142, N'Iceland', 1, 1, N'IS', N'ISL', 352, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (143, N'Iran (Islamic Republic of)', 1, 1, N'IR', N'IRN', 364, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (144, N'Iraq', 1, 1, N'IQ', N'IRQ', 368, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (145, N'Kenya', 1, 1, N'KE', N'KEN', 404, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (146, N'Kiribati', 1, 1, N'KI', N'KIR', 296, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (147, N'Korea', 1, 1, N'KR', N'KOR', 410, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (148, N'Kyrgyzstan', 1, 1, N'KG', N'KGZ', 417, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (149, N'Lao People''s Democratic Republic', 1, 1, N'LA', N'LAO', 418, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (150, N'Latvia', 1, 1, N'LV', N'LVA', 428, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (151, N'Lebanon', 1, 1, N'LB', N'LBN', 422, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (152, N'Lesotho', 1, 1, N'LS', N'LSO', 426, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (153, N'Liberia', 1, 1, N'LR', N'LBR', 430, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (154, N'Libyan Arab Jamahiriya', 1, 1, N'LY', N'LBY', 434, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (155, N'Liechtenstein', 1, 1, N'LI', N'LIE', 438, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (156, N'Lithuania', 1, 1, N'LT', N'LTU', 440, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (157, N'Luxembourg', 1, 1, N'LU', N'LUX', 442, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (158, N'Macau', 1, 1, N'MO', N'MAC', 446, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (159, N'Macedonia', 1, 1, N'MK', N'MKD', 807, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (160, N'Madagascar', 1, 1, N'MG', N'MDG', 450, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (161, N'Malawi', 1, 1, N'MW', N'MWI', 454, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (162, N'Maldives', 1, 1, N'MV', N'MDV', 462, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (163, N'Mali', 1, 1, N'ML', N'MLI', 466, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (164, N'Malta', 1, 1, N'MT', N'MLT', 470, 1, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (165, N'Marshall Islands', 1, 1, N'MH', N'MHL', 584, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (166, N'Martinique', 1, 1, N'MQ', N'MTQ', 474, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (167, N'Mauritania', 1, 1, N'MR', N'MRT', 478, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (168, N'Mauritius', 1, 1, N'MU', N'MUS', 480, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (169, N'Mayotte', 1, 1, N'YT', N'MYT', 175, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (170, N'Micronesia', 1, 1, N'FM', N'FSM', 583, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (171, N'Moldova', 1, 1, N'MD', N'MDA', 498, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (172, N'Monaco', 1, 1, N'MC', N'MCO', 492, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (173, N'Mongolia', 1, 1, N'MN', N'MNG', 496, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (174, N'Montenegro', 1, 1, N'ME', N'MNE', 499, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (175, N'Montserrat', 1, 1, N'MS', N'MSR', 500, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (176, N'Morocco', 1, 1, N'MA', N'MAR', 504, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (177, N'Mozambique', 1, 1, N'MZ', N'MOZ', 508, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (178, N'Myanmar', 1, 1, N'MM', N'MMR', 104, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (179, N'Namibia', 1, 1, N'NA', N'NAM', 516, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (180, N'Nauru', 1, 1, N'NR', N'NRU', 520, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (181, N'Nepal', 1, 1, N'NP', N'NPL', 524, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (182, N'Netherlands Antilles', 1, 1, N'AN', N'ANT', 530, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (183, N'New Caledonia', 1, 1, N'NC', N'NCL', 540, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (184, N'Nicaragua', 1, 1, N'NI', N'NIC', 558, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (185, N'Niger', 1, 1, N'NE', N'NER', 562, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (186, N'Nigeria', 1, 1, N'NG', N'NGA', 566, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (187, N'Niue', 1, 1, N'NU', N'NIU', 570, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (188, N'Norfolk Island', 1, 1, N'NF', N'NFK', 574, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (189, N'Northern Mariana Islands', 1, 1, N'MP', N'MNP', 580, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (190, N'Oman', 1, 1, N'OM', N'OMN', 512, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (191, N'Palau', 1, 1, N'PW', N'PLW', 585, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (192, N'Panama', 1, 1, N'PA', N'PAN', 591, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (193, N'Papua New Guinea', 1, 1, N'PG', N'PNG', 598, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (194, N'Pitcairn', 1, 1, N'PN', N'PCN', 612, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (195, N'Reunion', 1, 1, N'RE', N'REU', 638, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (196, N'Rwanda', 1, 1, N'RW', N'RWA', 646, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (197, N'Saint Kitts and Nevis', 1, 1, N'KN', N'KNA', 659, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (198, N'Saint Lucia', 1, 1, N'LC', N'LCA', 662, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (199, N'Saint Vincent and the Grenadines', 1, 1, N'VC', N'VCT', 670, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (200, N'Samoa', 1, 1, N'WS', N'WSM', 882, 0, 1, 100)
GO
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (201, N'San Marino', 1, 1, N'SM', N'SMR', 674, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (202, N'Sao Tome and Principe', 1, 1, N'ST', N'STP', 678, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (203, N'Senegal', 1, 1, N'SN', N'SEN', 686, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (204, N'Seychelles', 1, 1, N'SC', N'SYC', 690, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (205, N'Sierra Leone', 1, 1, N'SL', N'SLE', 694, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (206, N'Solomon Islands', 1, 1, N'SB', N'SLB', 90, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (207, N'Somalia', 1, 1, N'SO', N'SOM', 706, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (208, N'South Georgia & South Sandwich Islands', 1, 1, N'GS', N'SGS', 239, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (209, N'Sri Lanka', 1, 1, N'LK', N'LKA', 144, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (210, N'St. Helena', 1, 1, N'SH', N'SHN', 654, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (211, N'St. Pierre and Miquelon', 1, 1, N'PM', N'SPM', 666, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (212, N'Sudan', 1, 1, N'SD', N'SDN', 736, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (213, N'Suriname', 1, 1, N'SR', N'SUR', 740, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (214, N'Svalbard and Jan Mayen Islands', 1, 1, N'SJ', N'SJM', 744, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (215, N'Swaziland', 1, 1, N'SZ', N'SWZ', 748, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (216, N'Syrian Arab Republic', 1, 1, N'SY', N'SYR', 760, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (217, N'Tajikistan', 1, 1, N'TJ', N'TJK', 762, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (218, N'Tanzania', 1, 1, N'TZ', N'TZA', 834, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (219, N'Togo', 1, 1, N'TG', N'TGO', 768, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (220, N'Tokelau', 1, 1, N'TK', N'TKL', 772, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (221, N'Tonga', 1, 1, N'TO', N'TON', 776, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (222, N'Trinidad and Tobago', 1, 1, N'TT', N'TTO', 780, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (223, N'Tunisia', 1, 1, N'TN', N'TUN', 788, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (224, N'Turkmenistan', 1, 1, N'TM', N'TKM', 795, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (225, N'Turks and Caicos Islands', 1, 1, N'TC', N'TCA', 796, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (226, N'Tuvalu', 1, 1, N'TV', N'TUV', 798, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (227, N'Uganda', 1, 1, N'UG', N'UGA', 800, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (228, N'Vanuatu', 1, 1, N'VU', N'VUT', 548, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (229, N'Vatican City State (Holy See)', 1, 1, N'VA', N'VAT', 336, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (230, N'Viet Nam', 1, 1, N'VN', N'VNM', 704, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (231, N'Virgin Islands (British)', 1, 1, N'VG', N'VGB', 92, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (232, N'Virgin Islands (U.S.)', 1, 1, N'VI', N'VIR', 850, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (233, N'Wallis and Futuna Islands', 1, 1, N'WF', N'WLF', 876, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (234, N'Western Sahara', 1, 1, N'EH', N'ESH', 732, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (235, N'Yemen', 1, 1, N'YE', N'YEM', 887, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (236, N'Zambia', 1, 1, N'ZM', N'ZMB', 894, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (237, N'Zimbabwe', 1, 1, N'ZW', N'ZWE', 716, 0, 1, 100)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (238, N'United States', 1, 1, N'US', N'USA', 840, 0, 1, 1)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (239, N'United States', 1, 1, N'US', N'USA', 840, 0, 1, 1)
INSERT [dbo].[Country] ([CountryId], [Name], [AllowsBilling], [AllowsShipping], [TwoLetterIsoCode], [ThreeLetterIsoCode], [NumericIsoCode], [SubjectToVat], [Published], [DisplayOrder]) VALUES (240, N'United States', 1, 1, N'US', N'USA', 840, 0, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerId], [Name], [Description], [MetaKeywords], [MetaDescription], [MetaTitle], [LimitedToStores], [Deleted], [DisplayOrder], [CreatedOnUtc], [UpdatedOnUtc], [StoreId], [BranchId], [ManufacturerImage]) VALUES (1, N'Others', N'Others', N'Others', N'Others', N'Others', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON 

INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (1, N'Orders_Read', N'Orders Read')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (2, N'Orders_Write', N'Orders Write')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (3, N'Orders_Edit', N'Orders Edit')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (4, N'Orders_Delete', N'Orders Delete')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (5, N'Category_Read', N'Category Read')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (6, N'Category_Write', N'Category Write')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (7, N'Category_Edit', N'Category Edit')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (8, N'Category_Delete', N'Category Delete')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (9, N'Product_Read', N'Product Read')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (10, N'Product_Write', N'Product Write')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (11, N'Product_Edit', N'Product Edit')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (12, N'Product_Delete', N'Product Delete')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (13, N'Inventory_Read', N'Inventory Read')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (14, N'Inventory_Write', N'Inventory Write')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (15, N'Inventory_Edit', N'Inventory Edit')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (16, N'Inventory_Delete', N'Inventory Delete')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (17, N'Discount_Read', N'Discount Read')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (18, N'Discount_Write', N'Discount Write')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (19, N'Discount_Edit', N'Discount Edit')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (20, N'Discount_Delete', N'Discount Delete')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (21, N'Enquiries_Read', N'Enquiries Read')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (22, N'Enquiries_Write', N'Enquiries Write')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (23, N'Enquiries_Edit', N'Enquiries Edit')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (24, N'Enquiries_Delete', N'Enquiries Delete')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (25, N'Payment_Read', N'Payment Read')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (26, N'Payment_Write', N'Payment Write')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (27, N'Payment_Edit', N'Payment Edit')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (28, N'Payment_Delete', N'Payment Delete')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (29, N'Shipping_Read', N'Shipping Read')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (30, N'Shipping_Write', N'Shipping Write')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (31, N'Shipping_Edit', N'Shipping Edit')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (32, N'Shipping_Delete', N'Shipping Delete')
INSERT [dbo].[Permissions] ([Id], [Permission], [Name]) VALUES (33, N'General', N'General')
SET IDENTITY_INSERT [dbo].[Permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[Pricing] ON 

INSERT [dbo].[Pricing] ([PricingId], [Product], [ProductVariantId], [Store], [Branch], [CallForPrice], [Price], [OldPrice], [ProductCost], [SpecialPrice], [SpecialPriceDescription], [SpecialPriceStartDateTimeUtc], [SpecialPriceEndDateTimeUtc], [AdditionalShippingCharge], [DeliveryTime], [IsShipEnabled], [IsFreeShipping], [AdditionalTax], [CreatedUser], [UpdatedUser], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc]) VALUES (1, 4, NULL, 1, 1, 0, CAST(149999.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(100850.0000 AS Decimal(18, 4)), N'Offer', CAST(N'2022-07-21T05:13:40.500' AS DateTime), CAST(N'2023-12-03T05:13:40.500' AS DateTime), NULL, NULL, NULL, NULL, CAST(0 AS Decimal(18, 0)), N'1', NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Pricing] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductTypeId], [Name], [ShortDescription], [FullDescription], [Manufacturer], [Category], [ShowOnHomePage], [MetaKeywords], [MetaDescription], [MetaTitle], [SubjectToAcl], [LimitedToStores], [Sku], [ManufacturerPartNumber], [Gtin], [IsGiftCard], [GiftCardTypeId], [Weight], [Length], [Width], [Height], [Color], [DisplayOrder], [Published], [IsDeleted], [CreatedOnUtc], [UpdatedOnUtc], [ProductDescriptionHtml], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [PermaLink], [StoreId], [BranchId], [CreatedBy], [FlagSharedInfo], [FlagSampleProducts]) VALUES (4, 0, N'SAMSUNG Galaxy S23 Ultra 5G Smartphone', N'', N'12 GB RAM | 256 GB ROM', 1, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, N'', NULL, 0, 0, N'', N'', N'', N'', NULL, 0, 1, 0, CAST(N'2023-09-15T12:48:17.320' AS DateTime), CAST(N'2023-09-15T12:48:17.320' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'samsung-galaxy-s23-ultra-5g-smartphone', 1, 0, N'adminuser1@testvsecom.change', NULL, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductStoreMapping] ON 

INSERT [dbo].[ProductStoreMapping] ([Id], [ProductId], [Name], [FullDescription], [Manufacturer], [Category], [ShowOnHomePage], [Published], [IsDeleted], [PermaLink], [StoreId], [BranchId], [CreatedOnUtc], [UpdatedOnUtc], [FlagSampleProducts]) VALUES (1, 4, N'SAMSUNG Galaxy S23 Ultra 5G Smartphone', N'12 GB RAM | 256 GB ROM', 1, 2, 0, 1, 0, N'samsung-galaxy-s23-ultra-5g-smartphone', 1, 1, CAST(N'2023-09-15T12:48:17.3333978' AS DateTime2), NULL, 0)
SET IDENTITY_INSERT [dbo].[ProductStoreMapping] OFF
GO
SET IDENTITY_INSERT [dbo].[Seller] ON 

INSERT [dbo].[Seller] ([StoreId], [StoreName], [LogoPicture], [Description], [PrimaryContact], [CreatedOnUtc], [UpdatedOnUtc], [CreatedUser], [OriginalStoreName], [StoreRefereneId], [FlagvBuy]) VALUES (1, N'Ecom', NULL, NULL, 1, CAST(N'2023-09-15T12:31:30.237' AS DateTime), NULL, 1, NULL, 117, NULL)
SET IDENTITY_INSERT [dbo].[Seller] OFF
GO
SET IDENTITY_INSERT [dbo].[SellerBranch] ON 

INSERT [dbo].[SellerBranch] ([BranchId], [Store], [BranchName], [Email], [Country], [State], [City], [Address1], [Address2], [PostalCode], [PhoneNumber], [FaxNumber], [CreatedOnUtc], [Latitude], [Longitude], [EnableBuy], [FlagPartner], [OriginalBranchName], [StoreType], [OrderIdPrefix], [FlagvBuy]) VALUES (1, 1, N'Ecom', N'adminuser1@testvsecom.change', 42, N'Tamilnadu', N'tamilnadu', N'chennai', N'chennai', N'600001', N'+919876543210', NULL, CAST(N'2023-09-15T12:31:37.723' AS DateTime), CAST(0.0000000 AS Decimal(10, 7)), CAST(0.0000000 AS Decimal(10, 7)), 1, NULL, NULL, N'BabyProducts_Toys', N'Ecom', NULL)
SET IDENTITY_INSERT [dbo].[SellerBranch] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [UserGuid], [Username], [FirstName], [LastName], [Email], [PhoneNumber1], [PhoneNumber2], [Password], [PasswordFormatId], [PasswordSalt], [IsMerchant], [Active], [Deleted], [LastIpAddress], [CreatedOnUtc], [LastLoginDateUtc], [BillingAddress_Id], [ShippingAddress_Id], [UpdatedOnUtc], [IsAdmin], [IsSuperAdmin], [IsSales], [IsSupport], [IsMarketing], [StoreId], [IsVbuyUser], [UserProfileImage]) VALUES (1, N'4e58960b-fd1e-4cd8-9ac8-4cbca92f116e', NULL, N'Admin', NULL, N'adminuser1@testvsecom.change', N'+919876543210', NULL, 0xBE25C5679DC3C110100FE93F5CA7AD955201745655E7AC179A62BF47EC2CCBFB, 1, N'2023_VBuy.in', 1, 0, 0, NULL, CAST(N'2023-09-15T12:31:18.307' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[PasswordReset] ADD  CONSTRAINT [DF_PasswordReset_FlagCompleted]  DEFAULT ((0)) FOR [FlagCompleted]
GO
ALTER TABLE [dbo].[CategoryMasterFilter]  WITH CHECK ADD  CONSTRAINT [FK_CategoryFilter_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[CategoryMasterFilter] CHECK CONSTRAINT [FK_CategoryFilter_Category]
GO
ALTER TABLE [dbo].[OrderProductItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderItem_dbo.Order_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[OrderProduct] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProductItem] CHECK CONSTRAINT [FK_dbo.OrderItem_dbo.Order_OrderId]
GO
ALTER TABLE [dbo].[OrderProductItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderItem_dbo.Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProductItem] CHECK CONSTRAINT [FK_dbo.OrderItem_dbo.Product_ProductId]
GO
ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_Product] FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_Product]
GO
ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_SellerBranch] FOREIGN KEY([Branch])
REFERENCES [dbo].[SellerBranch] ([BranchId])
GO
ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_SellerBranch]
GO
ALTER TABLE [dbo].[Pricing]  WITH CHECK ADD  CONSTRAINT [FK_Pricing_Store] FOREIGN KEY([Store])
REFERENCES [dbo].[Seller] ([StoreId])
GO
ALTER TABLE [dbo].[Pricing] CHECK CONSTRAINT [FK_Pricing_Store]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([Manufacturer])
REFERENCES [dbo].[Manufacturer] ([ManufacturerId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductFilterValue]  WITH CHECK ADD  CONSTRAINT [FK_ProductFilterValue_CategoryMasterFilter] FOREIGN KEY([CategoryMasterFilter])
REFERENCES [dbo].[CategoryMasterFilter] ([Id])
GO
ALTER TABLE [dbo].[ProductFilterValue] CHECK CONSTRAINT [FK_ProductFilterValue_CategoryMasterFilter]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK__ProductIm__Produ__0A9D95DB] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK__ProductIm__Produ__0A9D95DB]
GO
ALTER TABLE [dbo].[ProductKeyFeatures]  WITH CHECK ADD  CONSTRAINT [FK_ProductKeyFeatures_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductKeyFeatures] CHECK CONSTRAINT [FK_ProductKeyFeatures_Product]
GO
ALTER TABLE [dbo].[Seller]  WITH CHECK ADD  CONSTRAINT [FK_Seller_User1] FOREIGN KEY([CreatedUser])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Seller] CHECK CONSTRAINT [FK_Seller_User1]
GO
ALTER TABLE [dbo].[SellerCategory]  WITH CHECK ADD  CONSTRAINT [FK__SellerCat__selle__74AE54BC] FOREIGN KEY([seller])
REFERENCES [dbo].[SellerBranch] ([BranchId])
GO
ALTER TABLE [dbo].[SellerCategory] CHECK CONSTRAINT [FK__SellerCat__selle__74AE54BC]
GO
ALTER TABLE [dbo].[ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ShoppingCartItem_dbo.Product_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCartItem] CHECK CONSTRAINT [FK_dbo.ShoppingCartItem_dbo.Product_ProductId]
GO
ALTER TABLE [dbo].[UserWishlist]  WITH CHECK ADD  CONSTRAINT [FK_UserWishlist_Product] FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[UserWishlist] CHECK CONSTRAINT [FK_UserWishlist_Product]
GO
ALTER TABLE [dbo].[UserWishlist]  WITH CHECK ADD  CONSTRAINT [FK_UserWishlist_User] FOREIGN KEY([User])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserWishlist] CHECK CONSTRAINT [FK_UserWishlist_User]
GO

