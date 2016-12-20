//
//  RWViewController.m
//  RWDraggableMenu
//
//  Created by Raditya Kurnianto on 12/20/2016.
//  Copyright (c) 2016 Raditya Kurnianto. All rights reserved.
//

#import "RWViewController.h"
#import "RWDraggableMenu.h"

@interface RWViewController ()<RWDraggableMenuDelegate>
@property (strong, nonatomic) RWDraggableMenu *dragMenu;
@end

@implementation RWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (!self.dragMenu) {
        NSArray *iconsArray = @[@"drag-icon", @"comment-icon", @"share-icon", @"copy-icon", @"bookmark-icon"];
        self.dragMenu = [[RWDraggableMenu alloc] init];
        self.dragMenu.delegate = self;
        [self.view addSubview:[self.dragMenu setupDragMenuInView:self.view width:70 height:70 backgroundColorRed:51/255.0 green:102/255.0 blue:153/255.0 alpha:0.5 icons:iconsArray]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
