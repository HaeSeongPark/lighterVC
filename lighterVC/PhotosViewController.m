//
//  PhotosViewController.m
//  lighterVC
//
//  Created by rhino Q on 22/07/2019.
//  Copyright © 2019 rhino Q. All rights reserved.
//

#import "PhotosViewController.h"
#import "Photo.h"
#import "PhotoCell.h"
#import "ArrayDataSource.h"
#import "Store.h"
#import "AppDelegate.h"
#import "PhotoCell+ConfigureForPhoto.h"
#import "PhotoViewController.h"


//static NSString * const PhotoCellIdentifier = @"PhotoCell";


@interface PhotosViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) ArrayDataSource *photosArrayDataSource;

@end


@implementation PhotosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Photos";
    [self setupTableView];
}

- (void)setupTableView
{
    TableViewCellConfigureBlock configureCell = ^(PhotoCell *cell, Photo *photo) {
        [cell configureForPhoto:photo];
    };
    NSArray *photos = [AppDelegate sharedDelegate].store.sortedPhotos;
    self.photosArrayDataSource = [[ArrayDataSource alloc] initWithItems:photos
                                                         cellIdentifier:PhotoCell.identifier
                                                     configureCellBlock:configureCell];
    self.tableView.dataSource = self.photosArrayDataSource;
    [self.tableView registerNib:[PhotoCell nib] forCellReuseIdentifier:PhotoCell.identifier];
    self.tableView.estimatedRowHeight = 30;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoViewController *photoViewController = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController"
                                                                                     bundle:nil];
    photoViewController.photo = [self.photosArrayDataSource itemAtIndexPath:indexPath];
    [self.navigationController pushViewController:photoViewController animated:YES];
}

@end
