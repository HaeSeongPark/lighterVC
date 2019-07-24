//
//  ArrayDataSource.h
//  objc.io example project (issue #1)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>


typedef void (^TableViewCellConfigureBlock)(id cell, id item);

#pragma mark todo : 데이터 추가, 삭제 & reload
@interface ArrayDataSource : NSObject <UITableViewDataSource>

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
