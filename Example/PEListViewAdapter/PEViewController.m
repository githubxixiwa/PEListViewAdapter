//
//  PEViewController.m
//  PEListViewAdapter
//
//  Created by Pole Era on 01/24/2021.
//  Copyright (c) 2021 Pole Era. All rights reserved.
//

#import "PEViewController.h"
#import "PETestTableViewController.h"
#import "PETestCollectionViewController.h"

@interface PEViewController ()

@end

@implementation PEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (IBAction)tableViewBtnAction:(id)sender {
    PETestTableViewController *vc = [PETestTableViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)collectionViewBtnAction:(id)sender {
    PETestCollectionViewController *vc = [PETestCollectionViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
