CREATE TABLE users (
  userId varchar(28),
  active char(20),
  createdDate bigint,
  lastlogin double precision,
  role char(28),
  signUpSource char(28),
  state char(10),
  PRIMARY KEY (userId)
);

COPY users(active,createdDate,lastLogin,role,signUpSource,state,userId)
FROM 'C:\Users\Public\user.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE receipts (
  receiptId varchar(28),
  bonusPointsEarned decimal,
  bonusPointsEarnedReason varchar(250),
  createDate bigint,
  dateScanned bigint,
  finishedDate double precision,
  modifyDate bigint,
  pointsAwardedDate double precision,
  pointsEarned decimal,
  purchaseDate double precision,
  purchasedItemCount decimal,
  rewardsReceiptStatus char(20),
  totalSpent decimal,
  userId varchar(28),
  PRIMARY KEY (receiptId)

);

COPY receipts(bonusPointsEarned,bonusPointsEarnedReason,createDate,dateScanned,finishedDate,modifyDate,pointsAwardedDate,pointsEarned,purchaseDate,purchasedItemCount,rewardsReceiptStatus,totalSpent,userId,receiptId)
FROM 'C:\Users\Public\receipt.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE brands (
  brandId varchar(28),
  barcode varchar(50),
  category varchar(150),
  categoryCode varchar(50),
  cpg varchar(250),
  name varchar(250),
  topBrand varchar(150),
  brandCode varchar(150),
  PRIMARY KEY (brandId)
);

COPY brands(barcode,category,categoryCode,cpg,name,topBrand,brandCode,brandId)
FROM 'C:\Users\Public\brands.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE barcodeScan (
  barcodeEntryId bigint,                                  
  barcode  varchar(50),
  description  varchar(250),
  finalPrice decimal,
  itemPrice decimal,
  needsFetchReview varchar(20),
  partneritemId integer,
  preventTargetGapPoints varchar(20),
  quantityPurchased decimal,
  userFlaggedBarcode bigint,
  userFlaggedNewItem varchar(20),
  userFlaggedPrice decimal,
  userFlaggedQuantity decimal,
  receiptId varchar(28),
  needsFetchReviewReason varchar(250),
  pointsNotAwardedReason varchar(250),
  pointsPayerId varchar(28),
  rewardsGroup varchar(250),
  rewardsProductPartnerId varchar(28),
  userFlaggedDescription varchar(250),
  originalMetaBriteBarcode varchar(250),
  originalMetaBriteDescription varchar(250),
  brandCode varchar(250),
  discountedItemPrice decimal,
  itemNumber decimal,
  originalMetaBriteQuantityPurchased decimal,
  pointsEarned decimal,
  targetPrice decimal,
  competitiveProduct varchar(250),
  originalFinalPrice decimal ,
  originalMetaBriteItemPrice decimal,
  competitorRewardsGroup varchar(250),
  metabriteCampaignId varchar(250),
  originalReceiptItemText varchar(250),
  priceAfterCoupon decimal,
  PRIMARY KEY (barcodeEntryId,barcode, receiptId)
);

COPY barcodeScan(barcodeEntryId,barcode,description,finalPrice,itemPrice,needsFetchReview,partnerItemId,preventTargetGapPoints,quantityPurchased,userFlaggedBarcode,userFlaggedNewItem,userFlaggedPrice,userFlaggedQuantity,receiptId,needsFetchReviewReason,pointsNotAwardedReason,pointsPayerId,rewardsGroup,rewardsProductPartnerId,userFlaggedDescription,originalMetaBriteBarcode,originalMetaBriteDescription,brandCode,discountedItemPrice,itemNumber,originalMetaBriteQuantityPurchased,pointsEarned,targetPrice,competitiveProduct,originalFinalPrice,originalMetaBriteItemPrice,competitorRewardsGroup,metabriteCampaignId,originalReceiptItemText,priceAfterCoupon)
FROM 'C:\Users\Public\barcodeScan.csv'
DELIMITER ','
CSV HEADER;

CREATE TABLE reviewNeeded (
  reviewId varchar(28),
  needsFetchReview varchar(20),
  partnerItemId  integer,
  preventTargetGapPoints varchar(20),
  userFlaggedBarcode varchar(50),
  userFlaggedNewItem varchar(20),
  userFlaggedPrice double precision,
  userFlaggedQuantity decimal,
  receiptId varchar(28),
  brandCode varchar(50),
  competitorRewardsGroup varchar(250),
  description varchar(250),
  discountedItemPrice double precision,
  finalPrice double precision,
  itemPrice double precision,
  originalReceiptItemText varchar(250),
  quantityPurchased decimal,
  needsFetchReviewReason varchar(250),
  userFlaggedDescription varchar(250),
  deleted varchar(250),
  priceAfterCoupon double precision,
  competitiveProduct varchar(250),
  rewardsProductPartnerId varchar(250),
  metabriteCampaignId varchar(250),
  rewardsGroup varchar(250),
  PRIMARY KEY (reviewId,receiptId)
);

COPY reviewNeeded(reviewId,needsFetchReview,partnerItemId,preventTargetGapPoints,userFlaggedBarcode,userFlaggedNewItem,userFlaggedPrice,userFlaggedQuantity,receiptId,brandCode,competitorRewardsGroup,description,discountedItemPrice,finalPrice,itemPrice,originalReceiptItemText,quantityPurchased,needsFetchReviewReason,userFlaggedDescription,deleted,priceAfterCoupon,competitiveProduct,rewardsProductPartnerId,metabriteCampaignId,rewardsGroup)
FROM 'C:\Users\Public\reviewNeeded.csv'
DELIMITER ','
CSV HEADER;
