//
//  Receipt.m
//  FFD
//
//  Created by Thidaporn Kijkamjai on 9/23/2560 BE.
//  Copyright © 2560 Appxelent. All rights reserved.
//

#import "Receipt.h"
#import "SharedReceipt.h"
#import "Utility.h"
#import "Setting.h"
#import "JummumOM-Swift.h"


@implementation Receipt
- (NSDictionary *)dictionary
{
    return [NSDictionary dictionaryWithObjectsAndKeys:
        [self valueForKey:@"receiptID"]?[self valueForKey:@"receiptID"]:[NSNull null],@"receiptID",
        [self valueForKey:@"branchID"]?[self valueForKey:@"branchID"]:[NSNull null],@"branchID",
        [self valueForKey:@"customerTableID"]?[self valueForKey:@"customerTableID"]:[NSNull null],@"customerTableID",
        [self valueForKey:@"memberID"]?[self valueForKey:@"memberID"]:[NSNull null],@"memberID",
        [self valueForKey:@"servingPerson"]?[self valueForKey:@"servingPerson"]:[NSNull null],@"servingPerson",
        [self valueForKey:@"customerType"]?[self valueForKey:@"customerType"]:[NSNull null],@"customerType",
        [Utility dateToString:[self valueForKey:@"openTableDate"] toFormat:@"yyyy-MM-dd HH:mm:ss"],@"openTableDate",
        [self valueForKey:@"paymentMethod"]?[self valueForKey:@"paymentMethod"]:[NSNull null],@"paymentMethod",
        [self valueForKey:@"totalAmount"]?[self valueForKey:@"totalAmount"]:[NSNull null],@"totalAmount",
        [self valueForKey:@"cashAmount"]?[self valueForKey:@"cashAmount"]:[NSNull null],@"cashAmount",
        [self valueForKey:@"cashReceive"]?[self valueForKey:@"cashReceive"]:[NSNull null],@"cashReceive",
        [self valueForKey:@"creditCardType"]?[self valueForKey:@"creditCardType"]:[NSNull null],@"creditCardType",
        [self valueForKey:@"creditCardNo"]?[self valueForKey:@"creditCardNo"]:[NSNull null],@"creditCardNo",
        [self valueForKey:@"creditCardAmount"]?[self valueForKey:@"creditCardAmount"]:[NSNull null],@"creditCardAmount",
        [Utility dateToString:[self valueForKey:@"transferDate"] toFormat:@"yyyy-MM-dd HH:mm:ss"],@"transferDate",
        [self valueForKey:@"transferAmount"]?[self valueForKey:@"transferAmount"]:[NSNull null],@"transferAmount",
        [self valueForKey:@"remark"]?[self valueForKey:@"remark"]:[NSNull null],@"remark",
        [self valueForKey:@"specialPriceDiscount"]?[self valueForKey:@"specialPriceDiscount"]:[NSNull null],@"specialPriceDiscount",
        [self valueForKey:@"discountProgramType"]?[self valueForKey:@"discountProgramType"]:[NSNull null],@"discountProgramType",
        [self valueForKey:@"discountProgramTitle"]?[self valueForKey:@"discountProgramTitle"]:[NSNull null],@"discountProgramTitle",
        [self valueForKey:@"discountProgramValue"]?[self valueForKey:@"discountProgramValue"]:[NSNull null],@"discountProgramValue",
        [self valueForKey:@"discountType"]?[self valueForKey:@"discountType"]:[NSNull null],@"discountType",
        [self valueForKey:@"discountValue"]?[self valueForKey:@"discountValue"]:[NSNull null],@"discountValue",
        [self valueForKey:@"discountReason"]?[self valueForKey:@"discountReason"]:[NSNull null],@"discountReason",
        [self valueForKey:@"serviceChargePercent"]?[self valueForKey:@"serviceChargePercent"]:[NSNull null],@"serviceChargePercent",
        [self valueForKey:@"serviceChargeValue"]?[self valueForKey:@"serviceChargeValue"]:[NSNull null],@"serviceChargeValue",
        [self valueForKey:@"priceIncludeVat"]?[self valueForKey:@"priceIncludeVat"]:[NSNull null],@"priceIncludeVat",
        [self valueForKey:@"vatPercent"]?[self valueForKey:@"vatPercent"]:[NSNull null],@"vatPercent",
        [self valueForKey:@"vatValue"]?[self valueForKey:@"vatValue"]:[NSNull null],@"vatValue",
        [self valueForKey:@"netTotal"]?[self valueForKey:@"netTotal"]:[NSNull null],@"netTotal",
        [self valueForKey:@"luckyDrawCount"]?[self valueForKey:@"luckyDrawCount"]:[NSNull null],@"luckyDrawCount",
        [self valueForKey:@"beforeVat"]?[self valueForKey:@"beforeVat"]:[NSNull null],@"beforeVat",
        [self valueForKey:@"status"]?[self valueForKey:@"status"]:[NSNull null],@"status",
        [self valueForKey:@"statusRoute"]?[self valueForKey:@"statusRoute"]:[NSNull null],@"statusRoute",
        [self valueForKey:@"receiptNoID"]?[self valueForKey:@"receiptNoID"]:[NSNull null],@"receiptNoID",
        [self valueForKey:@"receiptNoTaxID"]?[self valueForKey:@"receiptNoTaxID"]:[NSNull null],@"receiptNoTaxID",
        [Utility dateToString:[self valueForKey:@"receiptDate"] toFormat:@"yyyy-MM-dd HH:mm:ss"],@"receiptDate",
        [Utility dateToString:[self valueForKey:@"sendToKitchenDate"] toFormat:@"yyyy-MM-dd HH:mm:ss"],@"sendToKitchenDate",
        [Utility dateToString:[self valueForKey:@"deliveredDate"] toFormat:@"yyyy-MM-dd HH:mm:ss"],@"deliveredDate",
        [self valueForKey:@"mergeReceiptID"]?[self valueForKey:@"mergeReceiptID"]:[NSNull null],@"mergeReceiptID",
        [self valueForKey:@"hasBuffetMenu"]?[self valueForKey:@"hasBuffetMenu"]:[NSNull null],@"hasBuffetMenu",
        [self valueForKey:@"timeToOrder"]?[self valueForKey:@"timeToOrder"]:[NSNull null],@"timeToOrder",
        [self valueForKey:@"buffetEnded"]?[self valueForKey:@"buffetEnded"]:[NSNull null],@"buffetEnded",
        [Utility dateToString:[self valueForKey:@"buffetEndedDate"] toFormat:@"yyyy-MM-dd HH:mm:ss"],@"buffetEndedDate",
        [self valueForKey:@"buffetReceiptID"]?[self valueForKey:@"buffetReceiptID"]:[NSNull null],@"buffetReceiptID",
        [self valueForKey:@"voucherCode"]?[self valueForKey:@"voucherCode"]:[NSNull null],@"voucherCode",
        [self valueForKey:@"shopDiscount"]?[self valueForKey:@"shopDiscount"]:[NSNull null],@"shopDiscount",
        [self valueForKey:@"jummumDiscount"]?[self valueForKey:@"jummumDiscount"]:[NSNull null],@"jummumDiscount",
        [self valueForKey:@"transactionFeeValue"]?[self valueForKey:@"transactionFeeValue"]:[NSNull null],@"transactionFeeValue",
        [self valueForKey:@"jummumPayValue"]?[self valueForKey:@"jummumPayValue"]:[NSNull null],@"jummumPayValue",
        [self valueForKey:@"gbpReferenceNo"]?[self valueForKey:@"gbpReferenceNo"]:[NSNull null],@"gbpReferenceNo",
        [self valueForKey:@"modifiedUser"]?[self valueForKey:@"modifiedUser"]:[NSNull null],@"modifiedUser",
        [Utility dateToString:[self valueForKey:@"modifiedDate"] toFormat:@"yyyy-MM-dd HH:mm:ss"],@"modifiedDate",
        nil];
}

-(Receipt *)initWithBranchID:(NSInteger)branchID customerTableID:(NSInteger)customerTableID memberID:(NSInteger)memberID servingPerson:(NSInteger)servingPerson customerType:(NSInteger)customerType openTableDate:(NSDate *)openTableDate paymentMethod:(NSInteger)paymentMethod totalAmount:(float)totalAmount cashAmount:(float)cashAmount cashReceive:(float)cashReceive creditCardType:(NSInteger)creditCardType creditCardNo:(NSString *)creditCardNo creditCardAmount:(float)creditCardAmount transferDate:(NSDate *)transferDate transferAmount:(float)transferAmount remark:(NSString *)remark specialPriceDiscount:(float)specialPriceDiscount discountProgramType:(NSInteger)discountProgramType discountProgramTitle:(NSString *)discountProgramTitle discountProgramValue:(float)discountProgramValue discountType:(NSInteger)discountType discountValue:(float)discountValue discountReason:(NSString *)discountReason serviceChargePercent:(float)serviceChargePercent serviceChargeValue:(float)serviceChargeValue priceIncludeVat:(NSInteger)priceIncludeVat vatPercent:(float)vatPercent vatValue:(float)vatValue netTotal:(float)netTotal luckyDrawCount:(NSInteger)luckyDrawCount beforeVat:(float)beforeVat status:(NSInteger)status statusRoute:(NSString *)statusRoute receiptNoID:(NSString *)receiptNoID receiptNoTaxID:(NSString *)receiptNoTaxID receiptDate:(NSDate *)receiptDate sendToKitchenDate:(NSDate *)sendToKitchenDate deliveredDate:(NSDate *)deliveredDate mergeReceiptID:(NSInteger)mergeReceiptID hasBuffetMenu:(NSInteger)hasBuffetMenu timeToOrder:(NSInteger)timeToOrder buffetEnded:(NSInteger)buffetEnded buffetEndedDate:(NSDate *)buffetEndedDate buffetReceiptID:(NSInteger)buffetReceiptID voucherCode:(NSString *)voucherCode shopDiscount:(float)shopDiscount jummumDiscount:(float)jummumDiscount transactionFeeValue:(float)transactionFeeValue jummumPayValue:(float)jummumPayValue gbpReferenceNo:(NSString *)gbpReferenceNo
{
    self = [super init];
    if(self)
    {
        self.receiptID = [Receipt getNextID];
        self.branchID = branchID;
        self.customerTableID = customerTableID;
        self.memberID = memberID;
        self.servingPerson = servingPerson;
        self.customerType = customerType;
        self.openTableDate = openTableDate;
        self.paymentMethod = paymentMethod;
        self.totalAmount = totalAmount;
        self.cashAmount = cashAmount;
        self.cashReceive = cashReceive;
        self.creditCardType = creditCardType;
        self.creditCardNo = creditCardNo;
        self.creditCardAmount = creditCardAmount;
        self.transferDate = transferDate;
        self.transferAmount = transferAmount;
        self.remark = remark;
        self.specialPriceDiscount = specialPriceDiscount;
        self.discountProgramType = discountProgramType;
        self.discountProgramTitle = discountProgramTitle;
        self.discountProgramValue = discountProgramValue;
        self.discountType = discountType;
        self.discountValue = discountValue;
        self.discountReason = discountReason;
        self.serviceChargePercent = serviceChargePercent;
        self.serviceChargeValue = serviceChargeValue;
        self.priceIncludeVat = priceIncludeVat;
        self.vatPercent = vatPercent;
        self.vatValue = vatValue;
        self.netTotal = netTotal;
        self.luckyDrawCount = luckyDrawCount;
        self.beforeVat = beforeVat;
        self.status = status;
        self.statusRoute = statusRoute;
        self.receiptNoID = receiptNoID;
        self.receiptNoTaxID = receiptNoTaxID;
        self.receiptDate = receiptDate;
        self.sendToKitchenDate = sendToKitchenDate;
        self.deliveredDate = deliveredDate;
        self.mergeReceiptID = mergeReceiptID;
        self.hasBuffetMenu = hasBuffetMenu;
        self.timeToOrder = timeToOrder;
        self.buffetEnded = buffetEnded;
        self.buffetEndedDate = buffetEndedDate;
        self.buffetReceiptID = buffetReceiptID;
        self.voucherCode = voucherCode;
        self.shopDiscount = shopDiscount;
        self.jummumDiscount = jummumDiscount;
        self.transactionFeeValue = transactionFeeValue;
        self.jummumPayValue = jummumPayValue;
        self.gbpReferenceNo = gbpReferenceNo;
        self.modifiedUser = [Utility modifiedUser];
        self.modifiedDate = [Utility currentDateTime];
    }
    return self;
}

+(NSInteger)getNextID
{
    NSString *primaryKeyName = @"receiptID";
    NSString *propertyName = [NSString stringWithFormat:@"_%@",primaryKeyName];
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;


    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:propertyName ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    NSArray *sortArray = [dataList sortedArrayUsingDescriptors:sortDescriptors];
    dataList = [sortArray mutableCopy];

    if([dataList count] == 0)
    {
        return -1;
    }
    else
    {
        id value = [dataList[0] valueForKey:primaryKeyName];
        if([value integerValue]>0)
        {
            return -1;
        }
        else
        {
            return [value integerValue]-1;
        }
    }
}

+(void)addObject:(Receipt *)receipt
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    [dataList addObject:receipt];
}

+(void)removeObject:(Receipt *)receipt
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    [dataList removeObject:receipt];
}

+(void)addList:(NSMutableArray *)receiptList
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    [dataList addObjectsFromArray:receiptList];
}

+(void)removeList:(NSMutableArray *)receiptList
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    [dataList removeObjectsInArray:receiptList];
}

+(Receipt *)getReceipt:(NSInteger)receiptID
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_receiptID = %ld",receiptID];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    if([filterArray count] > 0)
    {
        return filterArray[0];
    }
    return nil;
}

-(id)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];

    if (copy)
    {
        ((Receipt *)copy).receiptID = self.receiptID;
        ((Receipt *)copy).branchID = self.branchID;
        ((Receipt *)copy).customerTableID = self.customerTableID;
        ((Receipt *)copy).memberID = self.memberID;
        ((Receipt *)copy).servingPerson = self.servingPerson;
        ((Receipt *)copy).customerType = self.customerType;
        [copy setOpenTableDate:self.openTableDate];
        ((Receipt *)copy).paymentMethod = self.paymentMethod;
        ((Receipt *)copy).totalAmount = self.totalAmount;
        ((Receipt *)copy).cashAmount = self.cashAmount;
        ((Receipt *)copy).cashReceive = self.cashReceive;
        ((Receipt *)copy).creditCardType = self.creditCardType;
        [copy setCreditCardNo:self.creditCardNo];
        ((Receipt *)copy).creditCardAmount = self.creditCardAmount;
        [copy setTransferDate:self.transferDate];
        ((Receipt *)copy).transferAmount = self.transferAmount;
        [copy setRemark:self.remark];
        ((Receipt *)copy).specialPriceDiscount = self.specialPriceDiscount;
        ((Receipt *)copy).discountProgramType = self.discountProgramType;
        [copy setDiscountProgramTitle:self.discountProgramTitle];
        ((Receipt *)copy).discountProgramValue = self.discountProgramValue;
        ((Receipt *)copy).discountType = self.discountType;
        ((Receipt *)copy).discountValue = self.discountValue;
        [copy setDiscountReason:self.discountReason];
        ((Receipt *)copy).serviceChargePercent = self.serviceChargePercent;
        ((Receipt *)copy).serviceChargeValue = self.serviceChargeValue;
        ((Receipt *)copy).priceIncludeVat = self.priceIncludeVat;
        ((Receipt *)copy).vatPercent = self.vatPercent;
        ((Receipt *)copy).vatValue = self.vatValue;
        ((Receipt *)copy).netTotal = self.netTotal;
        ((Receipt *)copy).luckyDrawCount = self.luckyDrawCount;
        ((Receipt *)copy).beforeVat = self.beforeVat;
        ((Receipt *)copy).status = self.status;
        [copy setStatusRoute:self.statusRoute];
        [copy setReceiptNoID:self.receiptNoID];
        [copy setReceiptNoTaxID:self.receiptNoTaxID];
        [copy setReceiptDate:self.receiptDate];
        [copy setSendToKitchenDate:self.sendToKitchenDate];
        [copy setDeliveredDate:self.deliveredDate];
        ((Receipt *)copy).mergeReceiptID = self.mergeReceiptID;
        ((Receipt *)copy).hasBuffetMenu = self.hasBuffetMenu;
        ((Receipt *)copy).timeToOrder = self.timeToOrder;
        ((Receipt *)copy).buffetEnded = self.buffetEnded;
        [copy setBuffetEndedDate:self.buffetEndedDate];
        ((Receipt *)copy).buffetReceiptID = self.buffetReceiptID;
        [copy setVoucherCode:self.voucherCode];
        ((Receipt *)copy).shopDiscount = self.shopDiscount;
        ((Receipt *)copy).jummumDiscount = self.jummumDiscount;
        ((Receipt *)copy).transactionFeeValue = self.transactionFeeValue;
        ((Receipt *)copy).jummumPayValue = self.jummumPayValue;
        [copy setGbpReferenceNo:self.gbpReferenceNo];
        [copy setModifiedUser:[Utility modifiedUser]];
        [copy setModifiedDate:[Utility currentDateTime]];
    }
    
    return copy;
}

-(BOOL)editReceipt:(Receipt *)editingReceipt
{
    if(self.receiptID == editingReceipt.receiptID
    && self.branchID == editingReceipt.branchID
    && self.customerTableID == editingReceipt.customerTableID
    && self.memberID == editingReceipt.memberID
    && self.servingPerson == editingReceipt.servingPerson
    && self.customerType == editingReceipt.customerType
    && [self.openTableDate isEqual:editingReceipt.openTableDate]
    && self.paymentMethod == editingReceipt.paymentMethod
    && self.totalAmount == editingReceipt.totalAmount
    && self.cashAmount == editingReceipt.cashAmount
    && self.cashReceive == editingReceipt.cashReceive
    && self.creditCardType == editingReceipt.creditCardType
    && [self.creditCardNo isEqualToString:editingReceipt.creditCardNo]
    && self.creditCardAmount == editingReceipt.creditCardAmount
    && [self.transferDate isEqual:editingReceipt.transferDate]
    && self.transferAmount == editingReceipt.transferAmount
    && [self.remark isEqualToString:editingReceipt.remark]
    && self.specialPriceDiscount == editingReceipt.specialPriceDiscount
    && self.discountProgramType == editingReceipt.discountProgramType
    && [self.discountProgramTitle isEqualToString:editingReceipt.discountProgramTitle]
    && self.discountProgramValue == editingReceipt.discountProgramValue
    && self.discountType == editingReceipt.discountType
    && self.discountValue == editingReceipt.discountValue
    && [self.discountReason isEqualToString:editingReceipt.discountReason]
    && self.serviceChargePercent == editingReceipt.serviceChargePercent
    && self.serviceChargeValue == editingReceipt.serviceChargeValue
    && self.priceIncludeVat == editingReceipt.priceIncludeVat
    && self.vatPercent == editingReceipt.vatPercent
    && self.vatValue == editingReceipt.vatValue
    && self.netTotal == editingReceipt.netTotal
    && self.luckyDrawCount == editingReceipt.luckyDrawCount
    && self.beforeVat == editingReceipt.beforeVat
    && self.status == editingReceipt.status
    && [self.statusRoute isEqualToString:editingReceipt.statusRoute]
    && [self.receiptNoID isEqualToString:editingReceipt.receiptNoID]
    && [self.receiptNoTaxID isEqualToString:editingReceipt.receiptNoTaxID]
    && [self.receiptDate isEqual:editingReceipt.receiptDate]
    && [self.sendToKitchenDate isEqual:editingReceipt.sendToKitchenDate]
    && [self.deliveredDate isEqual:editingReceipt.deliveredDate]
    && self.mergeReceiptID == editingReceipt.mergeReceiptID
    && self.hasBuffetMenu == editingReceipt.hasBuffetMenu
    && self.timeToOrder == editingReceipt.timeToOrder
    && self.buffetEnded == editingReceipt.buffetEnded
    && [self.buffetEndedDate isEqual:editingReceipt.buffetEndedDate]
    && self.buffetReceiptID == editingReceipt.buffetReceiptID
    && [self.voucherCode isEqualToString:editingReceipt.voucherCode]
    && self.shopDiscount == editingReceipt.shopDiscount
    && self.jummumDiscount == editingReceipt.jummumDiscount
    && self.transactionFeeValue == editingReceipt.transactionFeeValue
    && self.jummumPayValue == editingReceipt.jummumPayValue
    && [self.gbpReferenceNo isEqualToString:editingReceipt.gbpReferenceNo]
    )
    {
        return NO;
    }
    return YES;
}

+(Receipt *)copyFrom:(Receipt *)fromReceipt to:(Receipt *)toReceipt
{
    toReceipt.receiptID = fromReceipt.receiptID;
    toReceipt.branchID = fromReceipt.branchID;
    toReceipt.customerTableID = fromReceipt.customerTableID;
    toReceipt.memberID = fromReceipt.memberID;
    toReceipt.servingPerson = fromReceipt.servingPerson;
    toReceipt.customerType = fromReceipt.customerType;
    toReceipt.openTableDate = fromReceipt.openTableDate;
    toReceipt.paymentMethod = fromReceipt.paymentMethod;
    toReceipt.totalAmount = fromReceipt.totalAmount;
    toReceipt.cashAmount = fromReceipt.cashAmount;
    toReceipt.cashReceive = fromReceipt.cashReceive;
    toReceipt.creditCardType = fromReceipt.creditCardType;
    toReceipt.creditCardNo = fromReceipt.creditCardNo;
    toReceipt.creditCardAmount = fromReceipt.creditCardAmount;
    toReceipt.transferDate = fromReceipt.transferDate;
    toReceipt.transferAmount = fromReceipt.transferAmount;
    toReceipt.remark = fromReceipt.remark;
    toReceipt.specialPriceDiscount = fromReceipt.specialPriceDiscount;
    toReceipt.discountProgramType = fromReceipt.discountProgramType;
    toReceipt.discountProgramTitle = fromReceipt.discountProgramTitle;
    toReceipt.discountProgramValue = fromReceipt.discountProgramValue;
    toReceipt.discountType = fromReceipt.discountType;
    toReceipt.discountValue = fromReceipt.discountValue;
    toReceipt.discountReason = fromReceipt.discountReason;
    toReceipt.serviceChargePercent = fromReceipt.serviceChargePercent;
    toReceipt.serviceChargeValue = fromReceipt.serviceChargeValue;
    toReceipt.priceIncludeVat = fromReceipt.priceIncludeVat;
    toReceipt.vatPercent = fromReceipt.vatPercent;
    toReceipt.vatValue = fromReceipt.vatValue;
    toReceipt.netTotal = fromReceipt.netTotal;
    toReceipt.luckyDrawCount = fromReceipt.luckyDrawCount;
    toReceipt.beforeVat = fromReceipt.beforeVat;
    toReceipt.status = fromReceipt.status;
    toReceipt.statusRoute = fromReceipt.statusRoute;
    toReceipt.receiptNoID = fromReceipt.receiptNoID;
    toReceipt.receiptNoTaxID = fromReceipt.receiptNoTaxID;
    toReceipt.receiptDate = fromReceipt.receiptDate;
    toReceipt.sendToKitchenDate = fromReceipt.sendToKitchenDate;
    toReceipt.deliveredDate = fromReceipt.deliveredDate;
    toReceipt.mergeReceiptID = fromReceipt.mergeReceiptID;
    toReceipt.hasBuffetMenu = fromReceipt.hasBuffetMenu;
    toReceipt.timeToOrder = fromReceipt.timeToOrder;
    toReceipt.buffetEnded = fromReceipt.buffetEnded;
    toReceipt.buffetEndedDate = fromReceipt.buffetEndedDate;
    toReceipt.buffetReceiptID = fromReceipt.buffetReceiptID;
    toReceipt.voucherCode = fromReceipt.voucherCode;
    toReceipt.shopDiscount = fromReceipt.shopDiscount;
    toReceipt.jummumDiscount = fromReceipt.jummumDiscount;
    toReceipt.transactionFeeValue = fromReceipt.transactionFeeValue;
    toReceipt.jummumPayValue = fromReceipt.jummumPayValue;
    toReceipt.gbpReferenceNo = fromReceipt.gbpReferenceNo;
    toReceipt.modifiedUser = [Utility modifiedUser];
    toReceipt.modifiedDate = [Utility currentDateTime];
    
    return toReceipt;
}

+(NSMutableArray *)getReceiptListWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate statusList:(NSArray *)statusList
{
    NSMutableArray *receiptList = [[NSMutableArray alloc]init];
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    
    for(NSString *status in statusList)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_receiptDate BETWEEN %@ and _status = %ld", [NSArray arrayWithObjects:startDate, endDate, nil],[status integerValue]];
        NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
        [receiptList addObjectsFromArray:filterArray];
    }
    
    
    return [self sortList:receiptList];
}

+(NSMutableArray *)getReceiptListWithReceiptNoID:(NSString *)receiptNoID
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_receiptNoID = %@",receiptNoID];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    
    return [filterArray mutableCopy];
}

+(NSMutableArray *)getRemarkReceiptListWithMemeberID:(NSInteger)memberID
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_memberID = %ld and _remark != %@",memberID,@""];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    
    
    
    return [filterArray mutableCopy];
}

+(NSMutableArray *)getReceiptListWithMemeberID:(NSInteger)memberID
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_memberID = %ld",memberID];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    
    
    
    return [filterArray mutableCopy];
}

+(NSMutableArray *)sortList:(NSMutableArray *)receiptList
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"_receiptDate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    NSArray *sortArray = [receiptList sortedArrayUsingDescriptors:sortDescriptors];
    
    
    return [sortArray mutableCopy];
}

+(float)getAllCashAmountWithReceiptDate:(NSDate *)date
{
    NSDate *startOfTheDay = [Utility setStartOfTheDay:date];
    NSDate *endOfTheDay = [Utility setEndOfTheDay:date];
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_receiptDate >= %@ and _receiptDate <= %@",startOfTheDay,endOfTheDay];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    
    float sum = 0;
    for(Receipt *item in filterArray)
    {
        sum += item.cashAmount;
    }
    
    return sum;
}


+(float)getAllTransferAmountWithReceiptDate:(NSDate *)date
{
    NSDate *startOfTheDay = [Utility setStartOfTheDay:date];
    NSDate *endOfTheDay = [Utility setEndOfTheDay:date];
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_receiptDate >= %@ and _receiptDate <= %@",startOfTheDay,endOfTheDay];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    
    float sum = 0;
    for(Receipt *item in filterArray)
    {
        sum += item.transferAmount;
    }
    
    return sum;
}

+(NSDate *)getMaxModifiedDateWithMemberID:(NSInteger)memberID
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_memberID = %ld",memberID];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"_modifiedDate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    NSArray *sortArray = [filterArray sortedArrayUsingDescriptors:sortDescriptors];
    
    if([sortArray count] > 0)
    {
        Receipt *receipt = sortArray[0];
        return receipt.modifiedDate;
    }
    
    return nil;
}

+(NSMutableArray *)getReceiptList
{
    return [SharedReceipt sharedReceipt].receiptList;
}

+(void)removeAllObjects
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    [dataList removeAllObjects];
}

+(NSString *)getStrStatus:(Receipt *)receipt
{
    NSString *strStatus;
    switch (receipt.status)
    {
        case 2:
        {
            NSString *message = [Setting getValue:@"034m" example:@"ลูกค้าสั่ง"];
            strStatus = message;
        }
            break;
        case 5:
        {
            NSString *message = [Setting getValue:@"035m" example:@"กำลังทำ"];
            strStatus = message;
        }
            break;
        case 6:
        {
            NSString *message = [Setting getValue:@"036m" example:@"เสิร์ฟแล้ว"];
            strStatus = message;
        }
            break;
        case 7:
        {
            NSString *message = [Setting getValue:@"037m" example:@"Pending cancel"];
            strStatus = message;
        }
            break;
        case 8:
        {
            NSString *message = [Setting getValue:@"038m" example:@"Order dispute in process"];
            strStatus = message;
        }
            break;
        case 9:
        {
            NSString *message = [Setting getValue:@"039m" example:@"Order cancelled"];
            strStatus = message;
        }
            break;
        case 10:
        {
            NSString *message = [Setting getValue:@"040m" example:@"Order dispute finished"];
            strStatus = message;
        }
            break;
        case 11:
        {
            NSString *message = [Setting getValue:@"041m" example:@"Negotiate"];
            strStatus = message;
        }
            break;
        case 12:
        {
            NSString *message = [Setting getValue:@"042m" example:@"Review dispute"];
            strStatus = message;
        }
            break;
        case 13:
        {
            NSString *message = [Setting getValue:@"043m" example:@"Review dispute in process"];
            strStatus = message;
        }
        break;
        case 14:
        {
            NSString *message = [Setting getValue:@"044m" example:@"Order dispute finished"];
            strStatus = message;
        }
        break;
        default:
            break;
    }
    
    return strStatus;
}

+(UIColor *)getStatusColor:(Receipt *)receipt
{
    UIColor *color;
    switch (receipt.status)
    {
        case 2:
        {
            color = mOrange;
        }
            break;
        case 5:
        {
            color = mOrange;
        }
            break;
        case 6:
        {
            color = mGreen;
        }
            break;
        case 7:
        {
            color = mOrange;
        }
            break;
        case 8:
        {
            color = mOrange;
        }
            break;
        case 9:
        {
            color = mRed;
        }
            break;
        case 10:
        {
            color = mRed;
        }
            break;
        case 11:
        {
            color = mOrange;
        }
            break;
        case 12:
        {
            color = mOrange;
        }
            break;
        case 13:
        {
            color = mOrange;
        }
        break;
        case 14:
        {
            color = mRed;
        }
        break;
        
        default:
            break;
    }
    
    return color;
}

+(NSInteger)getStateBeforeLast:(Receipt *)receipt
{
    NSArray *statusList = [receipt.statusRoute componentsSeparatedByString:@","];
    if([statusList count]>1)
    {
        return [statusList[[statusList count]-2] integerValue];
    }
    return 0;
}

+(Receipt *)getReceipt:(NSInteger)receiptID branchID:(NSInteger)branchID
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_receiptID = %ld and _branchID = %ld",receiptID,branchID];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    if([filterArray count] > 0)
    {
        return filterArray[0];
    }
    return nil;
}

+(NSMutableArray *)getReceiptListWithStatus:(NSInteger)status branchID:(NSInteger)branchID
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_status = %ld and _branchID = %ld",status,branchID];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    
    return [filterArray mutableCopy];
}

+(void)updateStatus:(Receipt *)receipt
{
    Receipt *selectedReceipt = [self getReceipt:receipt.receiptID branchID:receipt.branchID];
    selectedReceipt.status = receipt.status;
    selectedReceipt.statusRoute = receipt.statusRoute;
    selectedReceipt.modifiedUser = receipt.modifiedUser;
    selectedReceipt.modifiedDate = receipt.modifiedDate;    
}
//
//+(NSMutableArray *)sortListDesc:(NSMutableArray *)receiptList
//{
//    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"_receiptDate" ascending:NO];
//    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"_receiptID" ascending:NO];
//    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor,sortDescriptor2, nil];
//    NSArray *sortArray = [receiptList sortedArrayUsingDescriptors:sortDescriptors];
//    
//    
//    return [sortArray mutableCopy];
//}

+(NSMutableArray *)sortListAsc:(NSMutableArray *)receiptList
{
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"_receiptDate" ascending:YES];
    NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc] initWithKey:@"_receiptID" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor,sortDescriptor2, nil];
    NSArray *sortArray = [receiptList sortedArrayUsingDescriptors:sortDescriptors];
    
    
    return [sortArray mutableCopy];
}

+(NSDate *)getMaxModifiedDateWithBranchID:(NSInteger)branchID
{
    NSMutableArray *dataList = [SharedReceipt sharedReceipt].receiptList;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"_branchID = %ld",branchID];
    NSArray *filterArray = [dataList filteredArrayUsingPredicate:predicate];
    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"_modifiedDate" ascending:NO];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    NSArray *sortArray = [filterArray sortedArrayUsingDescriptors:sortDescriptors];
    
    if([sortArray count] > 0)
    {
        Receipt *receipt = sortArray[0];
        return receipt.modifiedDate;
    }
    else
    {
        return [Utility stringToDate:@"2018-01-01 00:00:00" fromFormat:@"yyyy-MM-dd HH:mm:ss"];
    }    
}

+(NSInteger)getPriorStatus:(Receipt *)receipt
{
    NSArray *arrStatus = [receipt.statusRoute componentsSeparatedByString: @","];
    if([arrStatus count] >= 2)
    {
        return [arrStatus[[arrStatus count]-2] integerValue];
    }
    return 0;
}

+(NSInteger)getIndex:(NSMutableArray *)receiptList receipt:(Receipt *)receipt
{
    NSInteger i;
    for(i=0; i<[receiptList count]; i++)
    {
        Receipt *item = receiptList[i];
        if(item.receiptID == receipt.receiptID)
        {
            return i;
        }
    }
    return 0;
}

+(NSString *)maskCreditCardNo:(Receipt *)receipt
{
    NSRange needleRange;
    needleRange = NSMakeRange(12,4);
    NSString *last4digit = [receipt.creditCardNo substringWithRange:needleRange];
    
    NSInteger cardBrand = [OMSCardNumber brandForPan:receipt.creditCardNo];
    NSString *cardAbbr;
    switch (cardBrand)
    {
        case OMSCardBrandJCB:
        {
            cardAbbr = @"JCB";
        }
        break;
        case OMSCardBrandAMEX:
        {
            cardAbbr = @"AMEX";
        }
        break;
        case OMSCardBrandVisa:
        {
            cardAbbr = @"VISA";
        }
        break;
        case OMSCardBrandMasterCard:
        {
            cardAbbr = @"Master";
        }
        break;
    }
    
    return [NSString stringWithFormat:@"**** **** **** %@ %@",last4digit,cardAbbr];
}

+(Receipt *)getReceipt:(NSInteger)receiptID receiptList:(NSMutableArray *)receiptList
{
    for(Receipt *item in receiptList)
    {
        if(item.receiptID == receiptID)
        {
            return item;
        }
    }
    return nil;
}

+(NSInteger)getPaymentMethod:(Receipt *)receipt
{
    if(![Utility isStringEmpty:receipt.creditCardNo])
    {
        return 2;
    }
    else if(![Utility isStringEmpty:receipt.gbpReferenceNo])
    {
        return 1;
    }
    return 0;
}
@end
