//
//  ViewController.m
//  XZAlertView
//
//  Created by zhi on 2018/5/5.
//  Copyright © 2018年 kizy. All rights reserved.
//

#import "ViewController.h"
#import "XZAlertView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *btnArr;

@property (weak, nonatomic) IBOutlet UIButton *btnImg;
@property (weak, nonatomic) IBOutlet UIButton *btnTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnSubTitle;
@property (weak, nonatomic) IBOutlet UIButton *btnContent;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;
@property (weak, nonatomic) IBOutlet UIButton *btnCancel;

- (IBAction)btnPreviewOnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.btnArr = [NSMutableArray array];
    
    self.btnImg.tag = 1;
    self.btnTitle.tag = 2;
    self.btnSubTitle.tag = 3;
    self.btnContent.tag = 4;
    self.btnConfirm.tag = 5;
    self.btnCancel.tag = 6;
    
    NSArray *array = @[self.btnImg, self.btnTitle, self.btnSubTitle, self.btnContent, self.btnConfirm, self.btnCancel];
    [array enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setImage:[UIImage imageNamed:@"card_icon_select_black_1"] forState:UIControlStateSelected];
        [obj addTarget:self action:@selector(btnOnClick:) forControlEvents:UIControlEventTouchUpInside];
    }];
}

- (void)btnOnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.btnArr addObject:sender];
    }else{
        if ([self.btnArr containsObject:sender]) {
            [self.btnArr removeObject:sender];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPreviewOnClick:(id)sender {
    
    __block NSString *imgUrl = nil;
    __block  NSString *title = nil;
    __block  NSString *subTitle = nil;
    __block  NSString *content = nil;
    __block  NSString *confirm = nil;
    __block  NSString *cancel = nil;
    
    [self.btnArr enumerateObjectsUsingBlock:^(UIButton*  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (obj.tag) {
            case 1:
                imgUrl = @"timg.jpeg";
                break;
            case 2:
                title = @"这是标题";
                break;
            case 3:
                subTitle = @"这是副标题";
                break;
            case 4:
                content = @"欢迎大家使用\n作者：kizy\nQQ：358033194";
                break;
            case 5:
                confirm = @"确认";
                break;
            case 6:
                cancel = @"取消";
                break;
            default:
                break;
        }
    }];
    
    XZAlertView *alertView = [[XZAlertView alloc] initWithTitle:title subTitle:subTitle content:content imgUrlStr:imgUrl cancel:cancel commit:confirm block:^(NSInteger result) {
        
    }];
    alertView.animationType = showAnimationType_Push;
    alertView.subType = kCATransitionFromBottom;
    
    [alertView show];
    
}
@end
