//
//  ViewController.m
//  Masonry-2
//
//  Created by PENG BAI on 15/8/20.
//  Copyright (c) 2015年 bp1010. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*******/
    [self test0];
    
    
    /******/
//    [self test1];
}

/***
 计算器布局
 
 */
- (void)test0
{
    //
    UIView *displayView = [UIView new];
    displayView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:displayView];
    
    //
    UIView *keyboardView = [UIView new];
    keyboardView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:keyboardView];
    
    //
    [displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top);
        make.left.and.right.equalTo(self.view);
        make.height.equalTo(keyboardView).multipliedBy(0.3);
        
    }];
    
    //
    [keyboardView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(displayView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.and.right.equalTo(self.view);
    }];
    
    UILabel *displayNumLabel = [UILabel new];
    [displayView addSubview:displayNumLabel];
    displayNumLabel.text = @"0";
    displayNumLabel.textColor = [UIColor whiteColor];
    displayNumLabel.font = [UIFont fontWithName:@"HeiTi SC" size:70];
    displayNumLabel.textAlignment = NSTextAlignmentRight;
    
    [displayNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(displayView).offset(-10);
        make.bottom.equalTo(displayView).offset(-10);
    }];
    
    //定义键盘键名称，？号代表合并的单元格
    NSArray *keys = @[@"AC",@"+/-",@"%",@"÷"
                      ,@"7",@"8",@"9",@"x"
                      ,@"4",@"5",@"6",@"-"
                      ,@"1",@"2",@"3",@"+"
                      ,@"0",@"?",@".",@"="];
    
    NSInteger indexOfKeys = 0;
    
    for (NSString *key in keys) {
        // 循环所有键
        indexOfKeys++;
        NSInteger rowNum = indexOfKeys % 4 == 0 ? indexOfKeys / 4 : indexOfKeys / 4 + 1;
        NSInteger colNum = indexOfKeys % 4 == 0 ? 4 : indexOfKeys % 4;
        NSLog(@"index is:%ld and row:%ld,col:%ld",indexOfKeys,rowNum,colNum);
        
        //键样式
        UIButton *keyView = [UIButton buttonWithType:UIButtonTypeCustom];
        [keyboardView addSubview:keyView];
        [keyView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [keyView setTitle:key forState:UIControlStateNormal];
        [keyView.layer setBorderWidth:1];
        [keyView.layer setBorderColor:[[UIColor blackColor]CGColor]];
        [keyView.titleLabel setFont:[UIFont fontWithName:@"Arial-BoldItalicMT" size:30]];
        
        //键约束
        [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
            //处理 0 合并单元格
            if([key isEqualToString:@"0"] || [key isEqualToString:@"?"] ){
                if([key isEqualToString:@"0"]){
                    [keyView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.height.equalTo(keyboardView.mas_height).with.multipliedBy(.2f);
                        make.width.equalTo(keyboardView.mas_width).multipliedBy(.5);
                        make.left.equalTo(keyboardView.mas_left);
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.9f);
                    }];
                }if([key isEqualToString:@"?"]){
                    [keyView removeFromSuperview];
                }
            }
            //正常的单元格
            else{
                make.width.equalTo(keyboardView.mas_width).with.multipliedBy(.25f);
                make.height.equalTo(keyboardView.mas_height).with.multipliedBy(.2f);
                //按照行和列添加约束，这里添加行约束
                switch (rowNum) {
                    case 1:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.1f);
                        keyView.backgroundColor = [UIColor colorWithRed:205 green:205 blue:205 alpha:1];
                    }
                        break;
                    case 2:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.3f);
                    }
                        break;
                    case 3:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.5f);
                    }
                        break;
                    case 4:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.7f);
                    }
                        break;
                    case 5:
                    {
                        make.baseline.equalTo(keyboardView.mas_baseline).with.multipliedBy(.9f);
                    }
                        break;
                    default:
                        break;
                }
                //按照行和列添加约束，这里添加列约束
                switch (colNum) {
                    case 1:
                    {
                        make.left.equalTo(keyboardView.mas_left);
                    }
                        break;
                    case 2:
                    {
                        make.right.equalTo(keyboardView.mas_centerX);
                    }
                        break;
                    case 3:
                    {
                        make.left.equalTo(keyboardView.mas_centerX);
                    }
                        break;
                    case 4:
                    {
                        make.right.equalTo(keyboardView.mas_right);
                        [keyView setBackgroundColor:[UIColor colorWithRed:243 green:127 blue:38 alpha:1]];
                    }
                        break;
                    default:
                        break;
                }
            }
        }];
    }
}

- (void)test1
{
    UIView *titleView = [UIView new];
    titleView.backgroundColor = [UIColor redColor];
    
    UIView *caredView = [UIView new];
    [self.view addSubview:caredView];
    
    UIView *brifeView = [UIView new];
    [self.view addSubview:brifeView];
    
    //self.view
    self.view.backgroundColor = [UIColor colorWithWhite:0.965 alpha:1.000];
    
    //thrm
    UIImageView *plantThrm = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"defalutPlantReferenceIcon"]];
    [self.view addSubview:plantThrm];
    [plantThrm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.equalTo(self.view).with.offset(10);
    }];
    
    //title
    [self.view addSubview:titleView];
    UIImageView *bgTitleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg-plant-reference-title"]];
    [titleView addSubview:bgTitleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right);
        make.left.equalTo(plantThrm.mas_right).with.offset(20);
        make.centerY.equalTo(plantThrm.mas_centerY);
    }];
    [bgTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(titleView);
//        make.edges.equalTo(titleView).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    UILabel *title = [[UILabel alloc]init];
    title.textColor =  [UIColor whiteColor];
    title.font = [UIFont fontWithName:@"Heiti SC" size:26];
//    title.text = _reference.name;
    title.text = @"海棠01";
    [titleView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleView.mas_left).offset(10);
        make.width.equalTo(titleView.mas_width);
        make.centerY.equalTo(titleView.mas_centerY);
    }];
    //植物养护
    UILabel *caredTitle = [[UILabel alloc]init];
    caredTitle.textColor =  [UIColor colorWithRed:0.172 green:0.171 blue:0.219 alpha:1.000];
    caredTitle.font = [UIFont fontWithName:@"Heiti SC" size:10];
    caredTitle.text = @"植物养护";
    [self.view addSubview:caredTitle];
    [caredTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(plantThrm.mas_bottom).with.offset(20);
        make.left.and.right.equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(10);
    }];
    //将图层的边框设置为圆脚
    caredView.layer.cornerRadius = 5;
    caredView.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    caredView.layer.borderWidth = 1;
    caredView.layer.borderColor = [[UIColor colorWithWhite:0.521 alpha:1.000] CGColor];
    caredView.backgroundColor = [UIColor whiteColor];
    [caredView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(caredTitle.mas_bottom).with.offset(5);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.height.equalTo(brifeView);
    }];
    //植物简介
    UILabel *brifeTitle = [[UILabel alloc]init];
    brifeTitle.textColor =  [UIColor colorWithRed:0.172 green:0.171 blue:0.219 alpha:1.000];
    brifeTitle.font = [UIFont fontWithName:@"Heiti SC" size:10];
    brifeTitle.text = @"植物简介";
    [self.view addSubview:brifeTitle];
    [brifeTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(caredView.mas_bottom).with.offset(20);
        make.left.and.right.equalTo(self.view).with.offset(10);
        make.height.mas_equalTo(10);
    }];
    //将图层的边框设置为圆脚
    brifeView.layer.cornerRadius = 5;
    brifeView.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    brifeView.layer.borderWidth = 1;
    brifeView.layer.borderColor = [[UIColor colorWithWhite:0.521 alpha:1.000] CGColor];
    brifeView.backgroundColor = [UIColor whiteColor];
    [brifeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(brifeTitle.mas_bottom).with.offset(5);
        make.left.equalTo(self.view.mas_left).with.offset(10);
        make.right.equalTo(self.view.mas_right).with.offset(-10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-10);
        make.height.equalTo(caredView);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
