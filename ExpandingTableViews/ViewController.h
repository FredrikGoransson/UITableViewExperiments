//
//  ViewController.h
//  ExpandingTableViews
//
//  Created by Fredrik Göransson on 06/10/14.
//  Copyright (c) 2014 Forefront. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ExpandableTableViewCell;
@class ExpandableTableViewSection;
@class ExpandableTableViewDataSource;



@interface ViewController : UIViewController <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@protocol ExpandableTableViewCellDataSource

-(void)setData:(NSObject*)data;

@end

@interface ExpandableTableViewCellFactory : NSObject

+ (ExpandableTableViewCellFactory*)defaultFactory;

-(UITableViewCell*)cellForCellDefinition:(ExpandableTableViewCell*)cellDefinition;

@end

@interface ExpandableTableViewCell : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSObject *data;

@end

@interface ExpandableTableViewCellWithView : ExpandableTableViewCell

@property (nonatomic, strong) Class tableViewCellClass;

@end


@interface ExpandableTableViewSection : NSObject

@property (nonatomic) NSMutableArray *cells;

-(ExpandableTableViewCell*)addCell;

@end

@interface ExpandableTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *sections;
@property (nonatomic, strong) ExpandableTableViewCellFactory *cellFactory;

- (ExpandableTableViewSection*)addSection;

@end
