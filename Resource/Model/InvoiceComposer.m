//
//  InvoiceComposer.m
//  testPdf
//
//  Created by Thidaporn Kijkamjai on 1/25/2560 BE.
//  Copyright © 2560 Appxelent. All rights reserved.
//

#import "InvoiceComposer.h"
#import "Utility.h"
#import "Setting.h"
#import "Branch.h"
//#import "ReportEndDay.h"


@implementation InvoiceComposer
- (id)init
{
    self = [super init];
    _pathToInvoiceHtml = [[NSBundle mainBundle] pathForResource:@"Receipt" ofType:@"html"];
    _pathToAbbrInvoiceHtml = [[NSBundle mainBundle] pathForResource:@"ReceiptAbbr" ofType:@"html"];
    _pathToBillHtml = [[NSBundle mainBundle] pathForResource:@"Bill" ofType:@"html"];
    _pathToCancelOrderBillHtml = [[NSBundle mainBundle] pathForResource:@"CancelOrderBill" ofType:@"html"];
    _pathToItemsHtml = [[NSBundle mainBundle] pathForResource:@"items" ofType:@"html"];
    _pathToDeliveryAddressHtml = [[NSBundle mainBundle] pathForResource:@"deliveryAddress" ofType:@"html"];
    _pathToPayByCashHtml = [[NSBundle mainBundle] pathForResource:@"payByCash" ofType:@"html"];
    _pathToPayByCreditCardHtml = [[NSBundle mainBundle] pathForResource:@"payByCreditCard" ofType:@"html"];
    _pathToPayByTransferHtml = [[NSBundle mainBundle] pathForResource:@"payByTransfer" ofType:@"html"];
    _pathToKitchenBillHtml = [[NSBundle mainBundle] pathForResource:@"kitchenBill" ofType:@"html"];
    _pathToKitchenItemsHtml = [[NSBundle mainBundle] pathForResource:@"kitchenItems" ofType:@"html"];
    _pathToEndDayHtml = [[NSBundle mainBundle] pathForResource:@"EndDay" ofType:@"html"];
    _pathToEndDayCustomerTypeHtml = [[NSBundle mainBundle] pathForResource:@"EndDayCustomerType" ofType:@"html"];
    _pathToEndDayCustomerTypeFooterHtml = [[NSBundle mainBundle] pathForResource:@"EndDayCustomerTypeFooter" ofType:@"html"];
    _pathToEndDayCustomerTypeSummaryHtml = [[NSBundle mainBundle] pathForResource:@"EndDayCustomerTypeSummary" ofType:@"html"];
    _pathToEndDayMenuTypeHtml = [[NSBundle mainBundle] pathForResource:@"EndDayMenuType" ofType:@"html"];
    _pathToEndDaySubMenuTypeHtml = [[NSBundle mainBundle] pathForResource:@"EndDaySubMenuType" ofType:@"html"];
    _pathToEndDayPaymentMethodHtml = [[NSBundle mainBundle] pathForResource:@"EndDayPaymentMethod" ofType:@"html"];
    _pathToItemsTotalHtml = [[NSBundle mainBundle] pathForResource:@"itemsTotal" ofType:@"html"];
    return  self;
}

- (NSString *)renderInvoiceWithCompanyName:(NSString *)companyName companyAddress:(NSString *)companyAddress phoneNo:(NSString *)phoneNo taxID:(NSString *)taxID customerName:(NSString *)customerName customerAddress:(NSString *)customerAddress customerPhoneNo:(NSString *)customerPhoneNo customerTaxID:(NSString *)customerTaxID customerType:(NSString *)customerType cashierName:(NSString *)cashierName receiptNo:(NSString *)receiptNo receiptTime:(NSString *)receiptTime totalQuantity:(NSString *)totalQuantity subTotalAmount:(NSString *)subTotalAmount discountAmount:(NSString *)discountAmount afterDiscountAmount:(NSString *)afterDiscountAmount serviceChargeAmount:(NSString *)serviceChargeAmount vatAmount:(NSString *)vatAmount roundingAmount:(NSString *)roundingAmount totalAmount:(NSString *)totalAmount cashReceive:(NSString *)cashReceive cashChanges:(NSString *)cashChanges creditCardType:(NSString *)creditCardType last4Digits:(NSString *)last4Digits creditCardAmount:(NSString *)creditCardAmount transferDate:(NSString *)transferDate transferAmount:(NSString *)transferAmount memberCode:(NSString *)memberCode totalPoint:(NSString *)totalPoint thankYou:(NSString *)thankYou items:(NSMutableArray *)items
{
    
    
    NSString* htmlContent = [NSString stringWithContentsOfFile:_pathToInvoiceHtml
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#COMPANY_NAME#" withString:companyName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#COMPANY_ADDRESS#" withString:companyAddress];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PHONE_NO#" withString:phoneNo];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TAX_ID#" withString:taxID];
    
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_NAME#" withString:customerName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_ADDRESS#" withString:customerAddress];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_PHONE_NO#" withString:customerPhoneNo];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_TAX_ID#" withString:customerTaxID];
    
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_TYPE#" withString:customerType];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CASHIER_NAME#" withString:cashierName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RECEIPT_NO#" withString:receiptNo];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RECEIPT_TIME#" withString:receiptTime];
    
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_QUANTITY#" withString:totalQuantity];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_PRICE_PER_ITEM#" withString:subTotalAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#DISCOUNT_AMOUNT#" withString:discountAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#AFTER_DISCOUNT_AMOUNT#" withString:afterDiscountAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#SERVICE_CHARGE_AMOUNT#" withString:serviceChargeAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#VAT_AMOUNT#" withString:vatAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#ROUNDING_AMOUNT#" withString:roundingAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_AMOUNT#" withString:totalAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#MEMBER_CODE#" withString:memberCode];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_POINT#" withString:totalPoint];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#THANK_YOU#" withString:thankYou];
    
    
    //hide ส่วนลด-คงเหลือ if discount=0
    if([discountAmount floatValue] == 0)
    {
        htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#HIDE#" withString:@"style='display:none'"];
    }
    else
    {
        htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#HIDE#" withString:@""];
    }
    
    
    //pay by cash part
    NSString *payByCashHtmlContent = @"";
    if(![cashReceive isEqualToString:@"0.00"])
    {
        payByCashHtmlContent = [NSString stringWithContentsOfFile:_pathToPayByCashHtml
                                                               encoding:NSUTF8StringEncoding
                                                                  error:NULL];
        
        payByCashHtmlContent = [payByCashHtmlContent stringByReplacingOccurrencesOfString:@"#CASH_RECEIVE#" withString:cashReceive];
        payByCashHtmlContent = [payByCashHtmlContent stringByReplacingOccurrencesOfString:@"#CASH_CHANGES#" withString:cashChanges];

    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PAY_BY_CASH#" withString:payByCashHtmlContent];
    
    
    
    //pay by credit card part
    NSString *payByCreditCardHtmlContent = @"";
    if(![creditCardAmount isEqualToString:@"0.00"])
    {
        payByCreditCardHtmlContent = [NSString stringWithContentsOfFile:_pathToPayByCreditCardHtml
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        payByCreditCardHtmlContent = [payByCreditCardHtmlContent stringByReplacingOccurrencesOfString:@"#CREDIT_CARD_TYPE#" withString:creditCardType];
        payByCreditCardHtmlContent = [payByCreditCardHtmlContent stringByReplacingOccurrencesOfString:@"#LAST_4_DIGITS#" withString:last4Digits];
        payByCreditCardHtmlContent = [payByCreditCardHtmlContent stringByReplacingOccurrencesOfString:@"#CREDIT_CARD_AMOUNT#" withString:creditCardAmount];
        
    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PAY_BY_CARD#" withString:payByCreditCardHtmlContent];
    
    
    
    //pay by transfer part
    NSString *payByTransferHtmlContent = @"";
    if(![transferAmount isEqualToString:@"0.00"])
    {
        payByTransferHtmlContent = [NSString stringWithContentsOfFile:_pathToPayByTransferHtml
                                                               encoding:NSUTF8StringEncoding
                                                                  error:NULL];
        payByTransferHtmlContent = [payByTransferHtmlContent stringByReplacingOccurrencesOfString:@"#TRANSFER_DATE#" withString:transferDate];
        payByTransferHtmlContent = [payByTransferHtmlContent stringByReplacingOccurrencesOfString:@"#TRANSFER_AMOUNT#" withString:transferAmount];
    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PAY_BY_TRANSFER#" withString:payByTransferHtmlContent];

    
    return htmlContent;
}

- (NSString *)renderInvoiceWithRestaurantName:(NSString *)restaurantName phoneNo:(NSString *)phoneNo customerType:(NSString *)customerType cashierName:(NSString *)cashierName receiptNo:(NSString *)receiptNo receiptTime:(NSString *)receiptTime totalQuantity:(NSString *)totalQuantity subTotalAmount:(NSString *)subTotalAmount discountAmount:(NSString *)discountAmount afterDiscountAmount:(NSString *)afterDiscountAmount serviceChargeAmount:(NSString *)serviceChargeAmount vatAmount:(NSString *)vatAmount roundingAmount:(NSString *)roundingAmount totalAmount:(NSString *)totalAmount cashReceive:(NSString *)cashReceive cashChanges:(NSString *)cashChanges creditCardType:(NSString *)creditCardType last4Digits:(NSString *)last4Digits creditCardAmount:(NSString *)creditCardAmount transferDate:(NSString *)transferDate transferAmount:(NSString *)transferAmount memberCode:(NSString *)memberCode totalPoint:(NSString *)totalPoint thankYou:(NSString *)thankYou items:(NSMutableArray *)items nameAndPhoneNo:(NSString *)nameAndPhoneNo address:(NSString *)address
{
    

    NSString* htmlContent = [NSString stringWithContentsOfFile:_pathToAbbrInvoiceHtml
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];

    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RESTAURANT_NAME#" withString:restaurantName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PHONE_NO#" withString:phoneNo];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_TYPE#" withString:customerType];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CASHIER_NAME#" withString:cashierName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RECEIPT_NO#" withString:receiptNo];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RECEIPT_TIME#" withString:receiptTime];


    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_QUANTITY#" withString:totalQuantity];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#SUB_TOTAL_AMOUNT#" withString:subTotalAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#DISCOUNT_AMOUNT#" withString:discountAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#AFTER_DISCOUNT_AMOUNT#" withString:afterDiscountAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#SERVICE_CHARGE_AMOUNT#" withString:serviceChargeAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#VAT_AMOUNT#" withString:vatAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#ROUNDING_AMOUNT#" withString:roundingAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_AMOUNT#" withString:totalAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#MEMBER_CODE#" withString:memberCode];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_POINT#" withString:totalPoint];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#THANK_YOU#" withString:thankYou];
    
    
    //hide ส่วนลด-คงเหลือ if discount=0
    if([discountAmount floatValue] == 0)
    {
        htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#HIDE#" withString:@"style='display:none'"];
    }
    else
    {
        htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#HIDE#" withString:@""];
    }
    
    
    
    //items part
    NSString *allItems = @"";
    for(int i=0; i<[items count]; i++)
//    for(int i=0; i<1; i++)
    {
        NSString *itemHtmlContent = [NSString stringWithContentsOfFile:_pathToItemsHtml
                                                    encoding:NSUTF8StringEncoding
                                                       error:NULL];
        
        
        NSDictionary *dicItem = items[i];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#QUANTITY#" withString:[dicItem valueForKey:@"quantity"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TAKE_AWAY#" withString:[dicItem valueForKey:@"takeAway"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#MENU#" withString:[dicItem valueForKey:@"menu"]];
        
        
        
        //removeTypeNote
        NSString *strRemoveTypeNote = [dicItem valueForKey:@"removeTypeNote"];
        if([Utility isStringEmpty:strRemoveTypeNote])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:@""];
        }
        else
        {
            Branch *branch = [Branch getCurrentBranch];
            NSString *message = branch.wordNo;
            strRemoveTypeNote = [NSString stringWithFormat:@"<br><span style='font-size: 22px;'><u>%@</u> %@</span>",message,strRemoveTypeNote];
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:strRemoveTypeNote];
        }
        
        
        //addTypeNote
        NSString *strAddTypeNote = [dicItem valueForKey:@"addTypeNote"];
        if([Utility isStringEmpty:strAddTypeNote])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:@""];
        }
        else
        {
            Branch *branch = [Branch getCurrentBranch];
            NSString *message = branch.wordAdd;
            strAddTypeNote = [NSString stringWithFormat:@"<br><span style='font-size: 22px;'><u>%@</u> %@</span>",message,strAddTypeNote];
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:strAddTypeNote];
        }
        
        
        
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#PRO#" withString:[dicItem valueForKey:@"pro"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_PRICE_PER_ITEM#" withString:[dicItem valueForKey:@"totalPricePerItem"]];
    
        
        allItems = [NSString stringWithFormat:@"%@%@",allItems,itemHtmlContent];
    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#ITEMS#" withString:allItems];
    
    
    //pay by cash part
    NSString *payByCashHtmlContent = @"";
    if(![cashReceive isEqualToString:@"0.00"])
    {
        payByCashHtmlContent = [NSString stringWithContentsOfFile:_pathToPayByCashHtml
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        
        payByCashHtmlContent = [payByCashHtmlContent stringByReplacingOccurrencesOfString:@"#CASH_RECEIVE#" withString:cashReceive];
        payByCashHtmlContent = [payByCashHtmlContent stringByReplacingOccurrencesOfString:@"#CASH_CHANGES#" withString:cashChanges];
        
    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PAY_BY_CASH#" withString:payByCashHtmlContent];
    
    
    
    //pay by credit card part
    NSString *payByCreditCardHtmlContent = @"";
    if(![creditCardAmount isEqualToString:@"0.00"])
    {
        payByCreditCardHtmlContent = [NSString stringWithContentsOfFile:_pathToPayByCreditCardHtml
                                                               encoding:NSUTF8StringEncoding
                                                                  error:NULL];
        
        payByCreditCardHtmlContent = [payByCreditCardHtmlContent stringByReplacingOccurrencesOfString:@"#CREDIT_CARD_TYPE#" withString:creditCardType];
        payByCreditCardHtmlContent = [payByCreditCardHtmlContent stringByReplacingOccurrencesOfString:@"#LAST_4_DIGITS#" withString:last4Digits];
        payByCreditCardHtmlContent = [payByCreditCardHtmlContent stringByReplacingOccurrencesOfString:@"#CREDIT_CARD_AMOUNT#" withString:creditCardAmount];
        
    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PAY_BY_CARD#" withString:payByCreditCardHtmlContent];
    
    
    
    //pay by transfer part
    NSString *payByTransferHtmlContent = @"";
    if(![transferAmount isEqualToString:@"0.00"])
    {
        payByTransferHtmlContent = [NSString stringWithContentsOfFile:_pathToPayByTransferHtml
                                                             encoding:NSUTF8StringEncoding
                                                                error:NULL];
        payByTransferHtmlContent = [payByTransferHtmlContent stringByReplacingOccurrencesOfString:@"#TRANSFER_DATE#" withString:transferDate];
        payByTransferHtmlContent = [payByTransferHtmlContent stringByReplacingOccurrencesOfString:@"#TRANSFER_AMOUNT#" withString:transferAmount];
    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PAY_BY_TRANSFER#" withString:payByTransferHtmlContent];
    
    
    
    
    //delivery address part
    NSString *deliveryAddressHtmlContent = @"";
    if(![nameAndPhoneNo isEqualToString:@""])
    {
        deliveryAddressHtmlContent = [NSString stringWithContentsOfFile:_pathToDeliveryAddressHtml
                                                                         encoding:NSUTF8StringEncoding
                                                                            error:NULL];
        
        deliveryAddressHtmlContent = [deliveryAddressHtmlContent stringByReplacingOccurrencesOfString:@"#NAME_AND_PHONE_NO#" withString:nameAndPhoneNo];
        deliveryAddressHtmlContent = [deliveryAddressHtmlContent stringByReplacingOccurrencesOfString:@"#ADDRESS#" withString:address];
    }
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#DELIVERY_ADDRESS#" withString:deliveryAddressHtmlContent];
    
    
    return htmlContent;
}

- (NSString *)renderBillWithRestaurantName:(NSString *)restaurantName phoneNo:(NSString *)phoneNo customerType:(NSString *)customerType cashierName:(NSString *)cashierName receiptNo:(NSString *)receiptNo receiptTime:(NSString *)receiptTime totalQuantity:(NSString *)totalQuantity subTotalAmount:(NSString *)subTotalAmount discountAmount:(NSString *)discountAmount afterDiscountAmount:(NSString *)afterDiscountAmount serviceChargeAmount:(NSString *)serviceChargeAmount vatAmount:(NSString *)vatAmount roundingAmount:(NSString *)roundingAmount totalAmount:(NSString *)totalAmount memberCode:(NSString *)memberCode totalPoint:(NSString *)totalPoint thankYou:(NSString *)thankYou items:(NSMutableArray *)items nameAndPhoneNo:(NSString *)nameAndPhoneNo address:(NSString *)address
{
    
    
    NSString* htmlContent = [NSString stringWithContentsOfFile:_pathToBillHtml
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RESTAURANT_NAME#" withString:restaurantName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#PHONE_NO#" withString:phoneNo];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_TYPE#" withString:customerType];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CASHIER_NAME#" withString:cashierName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RECEIPT_NO#" withString:receiptNo];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RECEIPT_TIME#" withString:receiptTime];
    
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_QUANTITY#" withString:totalQuantity];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#SUB_TOTAL_AMOUNT#" withString:subTotalAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#DISCOUNT_AMOUNT#" withString:discountAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#AFTER_DISCOUNT_AMOUNT#" withString:afterDiscountAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#SERVICE_CHARGE_AMOUNT#" withString:serviceChargeAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#VAT_AMOUNT#" withString:vatAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#ROUNDING_AMOUNT#" withString:roundingAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_AMOUNT#" withString:totalAmount];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#MEMBER_CODE#" withString:memberCode];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_POINT#" withString:totalPoint];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#THANK_YOU#" withString:thankYou];
    
    
    
    //hide ส่วนลด-คงเหลือ if discount=0
    if([discountAmount floatValue] == 0)
    {
        htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#HIDE#" withString:@"style='display:none'"];
    }
    else
    {
        htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#HIDE#" withString:@""];
    }
    
    
    //items part
    NSString *allItems = @"";
    for(int i=0; i<[items count]; i++)
    {
        NSString *itemHtmlContent = [NSString stringWithContentsOfFile:_pathToItemsHtml
                                                              encoding:NSUTF8StringEncoding
                                                                 error:NULL];
        
        
        NSDictionary *dicItem = items[i];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#QUANTITY#" withString:[dicItem valueForKey:@"quantity"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TAKE_AWAY#" withString:[dicItem valueForKey:@"takeAway"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#MENU#" withString:[dicItem valueForKey:@"menu"]];
        
        
        
        //removeTypeNote
        NSString *strRemoveTypeNote = [dicItem valueForKey:@"removeTypeNote"];
        if([Utility isStringEmpty:strRemoveTypeNote])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:@""];
        }
        else
        {
            Branch *branch = [Branch getCurrentBranch];
            NSString *message = branch.wordNo;
            strRemoveTypeNote = [NSString stringWithFormat:@"<br><span style='font-size: 22px;'><u>%@</u> %@</span>",message,strRemoveTypeNote];
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:strRemoveTypeNote];
        }
        
        
        //addTypeNote
        NSString *strAddTypeNote = [dicItem valueForKey:@"addTypeNote"];
        if([Utility isStringEmpty:strAddTypeNote])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:@""];
        }
        else
        {
            Branch *branch = [Branch getCurrentBranch];
            NSString *message = branch.wordAdd;
            strAddTypeNote = [NSString stringWithFormat:@"<br><span style='font-size: 22px;'><u>%@</u> %@</span>",message,strAddTypeNote];
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:strAddTypeNote];
        }
        
        
        
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#PRO#" withString:[dicItem valueForKey:@"pro"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_PRICE_PER_ITEM#" withString:[dicItem valueForKey:@"totalPricePerItem"]];
        
        
        allItems = [NSString stringWithFormat:@"%@%@",allItems,itemHtmlContent];
    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#ITEMS#" withString:allItems];
    
    
    
    //delivery address part
    NSString *deliveryAddressHtmlContent = @"";
    if(![nameAndPhoneNo isEqualToString:@""])
    {
        deliveryAddressHtmlContent = [NSString stringWithContentsOfFile:_pathToDeliveryAddressHtml
                                                               encoding:NSUTF8StringEncoding
                                                                  error:NULL];
        
        deliveryAddressHtmlContent = [deliveryAddressHtmlContent stringByReplacingOccurrencesOfString:@"#NAME_AND_PHONE_NO#" withString:nameAndPhoneNo];
        deliveryAddressHtmlContent = [deliveryAddressHtmlContent stringByReplacingOccurrencesOfString:@"#ADDRESS#" withString:address];
    }
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#DELIVERY_ADDRESS#" withString:deliveryAddressHtmlContent];
    
    
    return htmlContent;
}

- (NSString *)renderCancelOrderBillWithRestaurantName:(NSString *)restaurantName customerType:(NSString *)customerType managerName:(NSString *)managerName cancelTime:(NSString *)cancelTime items:(NSMutableArray *)items
{
    NSString* htmlContent = [NSString stringWithContentsOfFile:_pathToCancelOrderBillHtml
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RESTAURANT_NAME#" withString:restaurantName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_TYPE#" withString:customerType];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#MANAGER_NAME#" withString:managerName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CANCEL_TIME#" withString:cancelTime];
    

    
    
    //items part
    NSString *allItems = @"";
    for(int i=0; i<[items count]; i++)
    {
        NSString *itemHtmlContent = [NSString stringWithContentsOfFile:_pathToItemsHtml
                                                              encoding:NSUTF8StringEncoding
                                                                 error:NULL];
        
        
        NSDictionary *dicItem = items[i];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#QUANTITY#" withString:[dicItem valueForKey:@"quantity"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TAKE_AWAY#" withString:[dicItem valueForKey:@"takeAway"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#MENU#" withString:[dicItem valueForKey:@"menu"]];
        
        
        
        //removeTypeNote
        NSString *strRemoveTypeNote = [dicItem valueForKey:@"removeTypeNote"];
        if([Utility isStringEmpty:strRemoveTypeNote])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:@""];
        }
        else
        {
            Branch *branch = [Branch getCurrentBranch];
            NSString *message = branch.wordNo;
            strRemoveTypeNote = [NSString stringWithFormat:@"<br><span style='font-size: 22px;'><u>%@</u> %@</span>",message,strRemoveTypeNote];
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:strRemoveTypeNote];
        }
        
        
        //addTypeNote
        NSString *strAddTypeNote = [dicItem valueForKey:@"addTypeNote"];
        if([Utility isStringEmpty:strAddTypeNote])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:@""];
        }
        else
        {
            Branch *branch = [Branch getCurrentBranch];
            NSString *message = branch.wordAdd;
            strAddTypeNote = [NSString stringWithFormat:@"<br><span style='font-size: 22px;'><u>%@</u> %@</span>",message,strAddTypeNote];
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:strAddTypeNote];
        }
        
        
        
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#PRO#" withString:[dicItem valueForKey:@"pro"]];
        itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_PRICE_PER_ITEM#" withString:[dicItem valueForKey:@"totalPricePerItem"]];
        
        
        allItems = [NSString stringWithFormat:@"%@%@",allItems,itemHtmlContent];
    }
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#ITEMS#" withString:allItems];
    
    
    return htmlContent;
}

- (NSString *)renderKitchenBillWithRestaurantName:(NSString *)restaurantName customerType:(NSString *)customerType waiterName:(NSString *)waiterName menuType:(NSString *)menuType sequenceNo:(NSString *)sequenceNo sendToKitchenTime:(NSString *)sendToKitchenTime totalQuantity:(NSString *)totalQuantity items:(NSMutableArray *)items
{
    NSString* htmlContent = [NSString stringWithContentsOfFile:_pathToKitchenBillHtml
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
    if(!restaurantName)
    {
        restaurantName = @"";
    }
    if(!customerType)
    {
        customerType = @"";
    }
    if(!waiterName)
    {
        waiterName = @"";
    }
    if(!menuType)
    {
        menuType = @"";
    }
    if(!sequenceNo)
    {
        sequenceNo = @"";
    }
    if(!sendToKitchenTime)
    {
        sendToKitchenTime = @"";
    }
    if(!totalQuantity)
    {
        totalQuantity = @"";
    }
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#RESTAURANT_NAME#" withString:restaurantName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#CUSTOMER_TYPE#" withString:customerType];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#WAITER_NAME#" withString:waiterName];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#MENU_TYPE#" withString:menuType];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#SEQUENCE_NO#" withString:sequenceNo];
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#SEND_TO_KITCHEN_TIME#" withString:sendToKitchenTime];
    
    
    htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_QUANTITY#" withString:totalQuantity];
    
    
    
    //items part
    NSString *allItems = @"";
    for(int i=0; i<[items count]; i++)
    {
        NSString *itemHtmlContent = [NSString stringWithContentsOfFile:_pathToKitchenItemsHtml
                                                              encoding:NSUTF8StringEncoding
                                                                 error:NULL];
        
        NSDictionary *dicItem = items[i];
        if([dicItem valueForKey:@"quantity"])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#QUANTITY#" withString:[dicItem valueForKey:@"quantity"]];
        }
        else
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#QUANTITY#" withString:@""];
        }
        
        if([dicItem valueForKey:@"takeAway"])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TAKE_AWAY#" withString:[dicItem valueForKey:@"takeAway"]];
        }
        else
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TAKE_AWAY#" withString:@""];
        }
        
        if([dicItem valueForKey:@"menu"])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#MENU#" withString:[dicItem valueForKey:@"menu"]];
        }
        else
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#MENU#" withString:@""];
        }
        
        
        
        //removeTypeNote
        NSString *strRemoveTypeNote = [dicItem valueForKey:@"removeTypeNote"];
        if([Utility isStringEmpty:strRemoveTypeNote])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:@""];
        }
        else
        {
            Branch *branch = [Branch getCurrentBranch];
            NSString *message = branch.wordNo;
            strRemoveTypeNote = [NSString stringWithFormat:@"<br><span style='font-size: 40px;'><u>%@</u> %@</span>",message,strRemoveTypeNote];
            
            
            if(strRemoveTypeNote)
            {
                itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:strRemoveTypeNote];
            }
            else
            {
                itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#REMOVE_TYPE_NOTE#" withString:@""];
            }
            
        }


        //addTypeNote
        NSString *strAddTypeNote = [dicItem valueForKey:@"addTypeNote"];
        if([Utility isStringEmpty:strAddTypeNote])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:@""];
        }
        else
        {
            Branch *branch = [Branch getCurrentBranch];
            NSString *message = branch.wordAdd;
            strAddTypeNote = [NSString stringWithFormat:@"<br><span style='font-size: 40px;'><u>%@</u> %@</span>",message,strAddTypeNote];
            
            
            if(strAddTypeNote)
            {
                itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:strAddTypeNote];
            }
            else
            {
                itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#ADD_TYPE_NOTE#" withString:@""];
            }
            
        }

        if([dicItem valueForKey:@"pro"])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#PRO#" withString:[dicItem valueForKey:@"pro"]];
        }
        else
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#PRO#" withString:@""];
        }
        
        if([dicItem valueForKey:@"totalPricePerItem"])
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_PRICE_PER_ITEM#" withString:[dicItem valueForKey:@"totalPricePerItem"]];
        }
        else
        {
            itemHtmlContent = [itemHtmlContent stringByReplacingOccurrencesOfString:@"#TOTAL_PRICE_PER_ITEM#" withString:@""];
        }
        
        
        
        allItems = [NSString stringWithFormat:@"%@%@",allItems,itemHtmlContent];
    }
    
    if(allItems)
    {
        htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#ITEMS#" withString:allItems];
    }
    else
    {
        htmlContent = [htmlContent stringByReplacingOccurrencesOfString:@"#ITEMS#" withString:@""];
    }
    
    
    
    return htmlContent;
}

@end
