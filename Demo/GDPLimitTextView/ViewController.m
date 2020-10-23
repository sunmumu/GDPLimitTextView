//
//  ViewController.m
//  GDPLimitTextView
//
//  Created by sunmumu on 2018/5/24.
//  Copyright © 2018年 sunmumu. All rights reserved.
//

#import "ViewController.h"
#import "GDPLimitTextView/GDPLimitTextView.h"

@interface ViewController ()

@property (nonatomic, strong) GDPLimitTextView              *limitTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
    [self updateMakeConstraints];
}

// MARK: - SetupUI
- (void)setupUI {
    [self.view addSubview:self.limitTextView];
}

- (void)updateMakeConstraints {
    if (@available(iOS 11.0, *)) {
        UIEdgeInsets Inset = self.view.safeAreaInsets;
        self.limitTextView.frame = CGRectMake(50, Inset.top + 100, 300, 200);
    }
}

// MARK: - Getter -
- (GDPLimitTextView *)limitTextView {
    if (!_limitTextView) {
        _limitTextView = [[GDPLimitTextView alloc] initWithFrame:CGRectMake(50, 100, 300, 200) placeholder:@"请输入公司介绍 (200字以内)" limitNumber:200 textBlock:^(NSString *result) {
            NSLog(@"文字是%@",result);
        }];
    }
    return _limitTextView;
}



@end
