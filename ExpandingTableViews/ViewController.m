//
//  ViewController.m
//  ExpandingTableViews
//
//  Created by Fredrik Göransson on 06/10/14.
//  Copyright (c) 2014 Forefront. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell1.h"
#import "TableViewCell2.h"
#import "InvoiceHeaderTableViewCell.h"

@interface ViewController (){
    ExpandableTableViewDataSource *dataSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataSource = [[ExpandableTableViewDataSource alloc] init];

    ExpandableTableViewSection *section1 = [dataSource addSection];
    ExpandableTableViewCell *cell1 = (ExpandableTableViewCell*)[section1 addCell];
    //cell1.tableViewCellClass = [InvoiceHeaderTableViewCell class];
    cell1.data = @"Hello";
    cell1.identifier = @"InvoiceHeaderCell";

    ExpandableTableViewCell *cell2 = [section1 addCell];
    cell2.data = @"World";
    cell2.identifier = @"cell1";

    ExpandableTableViewCell *cell3 = [section1 addCell];
    cell3.data = @"Yo";
    cell3.identifier = @"Cell3";

    
    ExpandableTableViewSection *section2 = [dataSource addSection];
    ExpandableTableViewCellWithView *cell2_1 = [[ExpandableTableViewCellWithView alloc] init];
    cell2_1.data = @"Hello";
    cell2_1.identifier = @"cell2";
    cell2_1.tableViewCellClass = [TableViewCell1 class];
    [section2.cells addObject:cell2_1];
    
    self.tableView.dataSource = dataSource;
    self.tableView.delegate  = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExpandableTableViewSection *section = (ExpandableTableViewSection*)[dataSource.sections objectAtIndex:indexPath.section];
    ExpandableTableViewCell *cellDefinition = [section.cells objectAtIndex:indexPath.row];
    NSLog(@"Was selected %ld %ld - %@", indexPath.section, indexPath.row, cellDefinition.data);
    
}

@end

@implementation ExpandableTableViewCellWithView

@end

@implementation ExpandableTableViewCell

@end

@implementation ExpandableTableViewCellFactory

+ (ExpandableTableViewCellFactory*)defaultFactory
{
    ExpandableTableViewCellFactory *factory = [[ExpandableTableViewCellFactory alloc] init];
    return factory;
}

-(UITableViewCell*)cellForCellDefinition:(ExpandableTableViewCell*)cellDefinition
{
    UITableViewCell *cell;
    if( [cellDefinition isKindOfClass:[ExpandableTableViewCellWithView class]])
    {
        ExpandableTableViewCellWithView *cellDefinitionWithClass = (ExpandableTableViewCellWithView*)cellDefinition;
        
        cell = (UITableViewCell*)[[cellDefinitionWithClass.tableViewCellClass alloc] init];
    }
    else
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellDefinition.identifier];
        
        if( [cellDefinition.data isKindOfClass:[NSString class]])
        {
            NSString *cellText = (NSString*)cellDefinition.data;
            cell.textLabel.text = cellText;
        }
        
    }
    
    return cell;
}

@end

@implementation ExpandableTableViewSection

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.cells = [[NSMutableArray alloc] init];
    }
    return self;
}


-(ExpandableTableViewCell*)addCell
{
    ExpandableTableViewCell *cell1 = [[ExpandableTableViewCell alloc] init];
    [self.cells addObject:cell1];
    return cell1;
}

@end

@implementation ExpandableTableViewDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sections = [[NSMutableArray alloc] init];
        self.cellFactory = [ExpandableTableViewCellFactory defaultFactory];
    }
    return self;
}

- (ExpandableTableViewSection*)addSection
{
    ExpandableTableViewSection *section1 = [[ExpandableTableViewSection alloc] init];
    [self.sections addObject:section1];
    return section1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ExpandableTableViewSection *sectionDefinition = (ExpandableTableViewSection*)[self.sections objectAtIndex:section];
    return [sectionDefinition.cells count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = [NSString stringWithFormat:@"Section %ld", (long)section ];
    return title;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExpandableTableViewSection *sectionDefinition = (ExpandableTableViewSection*)[self.sections objectAtIndex:indexPath.section];
    ExpandableTableViewCell *cellDefinition = [sectionDefinition.cells objectAtIndex:indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDefinition.identifier];
    if( cell == nil )
    {
        cell = [self.cellFactory cellForCellDefinition:cellDefinition];
    }
    
    return cell;
}

@end