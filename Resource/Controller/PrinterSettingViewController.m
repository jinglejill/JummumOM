//
//  PrinterSettingViewController.m
//  DevJummumOM
//
//  Created by Thidaporn Kijkamjai on 24/8/2561 BE.
//  Copyright © 2561 Jummum Tech. All rights reserved.
//

#import "PrinterSettingViewController.h"
#import "PrinterBrandViewController.h"
#import "Setting.h"
#import "AppDelegate.h"
#import "PrinterSetting.h"
#import "Printer.h"
#import "Branch.h"
#import <StarIO/SMPort.h>
#import "ePOS2.h"


@interface PrinterSettingViewController ()
{
    NSMutableArray *_printerList;
    NSInteger _selectedPrinterIndex;
    BOOL _firstLoad;
    
    
    enum Epos2PrinterSeries valuePrinterSeries;
    enum Epos2ModelLang valuePrinterModel;
    Epos2Printer *epsonPrinter;
}
@property (nonatomic) NSMutableArray *statusCellArray;

@property (nonatomic) NSMutableArray *firmwareInfoCellArray;

@end

@implementation PrinterSettingViewController
@synthesize lblNavTitle;
@synthesize tbvData;
@synthesize topViewHeight;


-(IBAction)unwindToPrinterSetting:(UIStoryboardSegue *)segue
{
    _firstLoad = NO;
    [tbvData reloadData];
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    UIWindow *window = UIApplication.sharedApplication.keyWindow;
    
    
    float topPadding = window.safeAreaInsets.top;
    topViewHeight.constant = topPadding == 0?20:topPadding;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *title = [Setting getValue:@"0104t" example:@"ตั้งค่าเครื่องพิมพ์"];
    lblNavTitle.text = title;
    tbvData.scrollEnabled = NO;
    tbvData.dataSource = self;
    tbvData.delegate = self;
    _printerList = [[NSMutableArray alloc]init];
    _firstLoad = YES;
    
    
    valuePrinterSeries = EPOS2_TM_M10;
    valuePrinterModel = EPOS2_MODEL_ANK;
    
    
    [self loadingOverlayView];
    self.homeModel = [[HomeModel alloc]init];
    self.homeModel.delegate = self;
    
    Branch *branch = [Branch getCurrentBranch];
    [self.homeModel downloadItems:dbPrinter withData:branch];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _statusCellArray = [[NSMutableArray alloc] init];
    
    _firmwareInfoCellArray = [[NSMutableArray alloc] init];
    
    if(_firstLoad)
    {
        [self refreshDeviceStatus];//dont forget to uncomment
//        [self removeOverlayViews];//test
    }
}

- (IBAction)goBack:(id)sender
{
    [self performSegueWithIdentifier:@"segUnwindToMe" sender:self];
}

- (IBAction)refresh:(id)sender
{
    [self loadingOverlayView];
    
    [self refreshDeviceStatus];
}

///tableview section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return [_printerList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    NSInteger item = indexPath.item;
    
    
    switch (item)
    {
        case 0:
        {
            UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            PrinterSetting *printerSetting;
            NSString *strPortNameAndMacAddress;
            BOOL printerAlreadySet = NO;
            AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
            NSMutableArray *printerSettingList = appDelegate.settingManager.settings;
            if(indexPath.section+1 <= [printerSettingList count])
            {
                printerSetting = appDelegate.settingManager.settings[indexPath.section];
                strPortNameAndMacAddress = printerSetting.portName;
                if(![Utility isStringEmpty:printerSetting.macAddress])
                {
                    strPortNameAndMacAddress = [NSString stringWithFormat:@"%@ (%@)",strPortNameAndMacAddress,printerSetting.macAddress];
                }
                                
                if(printerSetting.modelName)
                {
                    printerAlreadySet = YES;
                }
            }
            
            if(printerAlreadySet)
            {
                cell.textLabel.text = printerSetting.modelName;
                cell.textLabel.textColor = cSystem4;
                cell.textLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:15.0f];
                cell.detailTextLabel.text = strPortNameAndMacAddress;
                cell.detailTextLabel.textColor = cSystem4;
                cell.detailTextLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:13.0f];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            else
            {
                cell.textLabel.text = @"เลือกเครื่องพิมพ์";
                cell.textLabel.textColor = cPlaceHolder;
                cell.textLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:15.0f];
                cell.detailTextLabel.text = @"";
                cell.detailTextLabel.textColor = cSystem4;
                cell.detailTextLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:13.0f];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            
            return cell;
        }
        break;
        case 1:
        {
            UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"cell"];
            if (!cell) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
            
            Printer *printer = _printerList[indexPath.section];
            if(printer.printerStatus == 1)
            {
                cell.textLabel.text = @"สถานะ";
                cell.textLabel.textColor = cSystem4;
                cell.textLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:15.0f];
                cell.detailTextLabel.text = @"Online";
                cell.detailTextLabel.textColor = cSystem4_50;
                cell.detailTextLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:15.0f];
            }
            else if(printer.printerStatus == 0)
            {
                cell.textLabel.text = @"สถานะ";
                cell.textLabel.textColor = cSystem4;
                cell.textLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:15.0f];
                cell.detailTextLabel.text = @"Offline";
                cell.detailTextLabel.textColor = cSystem4_50;
                cell.detailTextLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:15.0f];
            }
            else if(printer.printerStatus == 2)
            {
                cell.textLabel.text = @"สถานะ";
                cell.textLabel.textColor = cSystem4;
                cell.textLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:15.0f];
                cell.detailTextLabel.text = @"Pending";
                cell.detailTextLabel.textColor = cSystem4_50;
                cell.detailTextLabel.font = [UIFont fontWithName:@"Prompt-Regular" size:15.0f];
            }
            
            return cell;
        }
        break;
        default:
        break;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
    cell.backgroundColor = [UIColor whiteColor];
    [cell setSeparatorInset:UIEdgeInsetsMake(16, 16, 16, 16)];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item == 0)
    {
        _selectedPrinterIndex = indexPath.section;
        dispatch_async(dispatch_get_main_queue(),^ {
            [self performSegueWithIdentifier:@"segPrinterBrand" sender:self];
        } );
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 44)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 11, tableView.frame.size.width, 22)];
    [label setFont:[UIFont fontWithName:@"Prompt-SemiBold" size:15]];
    Printer *printer = _printerList[section];
    NSString *string = printer.name;
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor clearColor]]; //your background color...
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

- (void)refreshDeviceStatus
{
    BOOL starConnected = NO;
    BOOL epsonConnected = NO;
    BOOL result = NO;
    
    
    [_statusCellArray       removeAllObjects];
    [_firmwareInfoCellArray removeAllObjects];
    
    for(int i=0; i<[_printerList count]; i++)
    {
        SMPort *port = nil;
    
        @try
        {
            AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
            NSMutableArray *printerSettingList = appDelegate.settingManager.settings;
        
            
            if(i+1 > [printerSettingList count])
            {
                break;
            }
            PrinterSetting *printerSetting = printerSettingList[i];
            NSString *portName = printerSetting.portName;
            Printer *printer = _printerList[i];
            
            while (YES)
            {
                port = [SMPort getPort:portName :printerSetting.portSettings :10000];     // 10000mS!!!
                
                if (port == nil)
                {
                    starConnected = NO;
                    break;
                }
                else
                {
                    starConnected = YES;
                }
                
                // Sleep to avoid a problem which sometimes cannot communicate with Bluetooth.
                // (Refer Readme for details)
                NSOperatingSystemVersion version = {11, 0, 0};
                BOOL isOSVer11OrLater = [[NSProcessInfo processInfo] isOperatingSystemAtLeastVersion:version];
                if ((isOSVer11OrLater) && ([portName.uppercaseString hasPrefix:@"BT:"])) {
                    [NSThread sleepForTimeInterval:0.2];
                }
                
                StarPrinterStatus_2 printerStatus;
                
                [port getParsedStatus:&printerStatus :2];
                
                
                if (printerStatus.offline == SM_TRUE)
                {
                    printer.printerStatus = 0;
                    [_statusCellArray addObject:@[@"Online", @"Offline", [UIColor redColor]]];
                }
                else
                {
                    printer.printerStatus = 1;
                    [_statusCellArray addObject:@[@"Online", @"Online",  [UIColor blueColor]]];
                }
                
                result = YES;
                break;
            }
            
            if(!starConnected)
            {
                //check epson status
                epsonConnected = [self connectPrinterWithPortName:portName];
                if(epsonConnected)
                {
                    printer.printerStatus = 1;
                }
                else
                {
                    printer.printerStatus = 0;
                }
            }
            
            
            //check gprinter status
            if(!starConnected && !epsonConnected)
            {
                printer.printerStatus = 2;
            }
        }
        @catch (PortException *exc) {
        }
        @finally {
            if (port != nil) {
                [SMPort releasePort:port];
                
                port = nil;
            }
        }
    }
    
    if (result == NO)
    {
        NSString *title = @"ไม่สามารถติดต่อเครื่องพิมพ์ได้";
        NSString *msg = @"";
        [self showAlert:title message:msg];
//        [self showAlert:@"Fail to Open Port" message:@""];
    }
    
    [tbvData reloadData];
    [self removeOverlayViews];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"segPrinterBrand"])
    {
        PrinterBrandViewController *vc = segue.destinationViewController;
        vc.selectedPrinterIndex = _selectedPrinterIndex;
        vc.printer = _printerList[_selectedPrinterIndex];
    }
}

-(void)itemsDownloaded:(NSArray *)items manager:(NSObject *)objHomeModel
{
//    [self removeOverlayViews];
    _printerList = items[0];
    [tbvData reloadData];
}

-(BOOL) connectPrinterWithPortName:(NSString *)portName
{
    Epos2Printer *printer = [[Epos2Printer alloc]initWithPrinterSeries:valuePrinterSeries lang:valuePrinterModel];
    enum Epos2ErrorStatus result = EPOS2_SUCCESS;

    if (printer == nil)
    {
        return false;
    }

    result = [printer connect:portName timeout:(int)EPOS2_PARAM_DEFAULT];
    if (result != EPOS2_SUCCESS)
    {
//            MessageView.showErrorEpos(result, method:"connect")
//        NSString *title = @"ไม่สามารถติดต่อเครื่องพิมพ์ได้";
//        NSString *msg = @"กรุณาตรวจสอบการเชื่อมต่ออีกครั้งหนึ่ง";
//        [self showAlert:title message:msg];
        return false;
    }

    result = [printer beginTransaction];
    if (result != EPOS2_SUCCESS)
    {
//            MessageView.showErrorEpos(result, method:"beginTransaction")
        [printer disconnect];
        return false;
    }
    return true;
}

@end
