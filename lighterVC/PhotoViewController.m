//
//  PhotoViewController.h
//  objc.io example project (issue #1)
//


#import "PhotoViewController.h"
#import "Photo.h"
#import "User.h"
#import "DetailsViewController.h"
#import "DetailViewController.h"


@interface PhotoViewController () <DetailsViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIStackView *contentStackView;
@property (weak, nonatomic) IBOutlet UIView *viewContainter;
@end


@implementation PhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateForPhoto];
    [self addPhotoDetailsTableView];
}

- (void)updateForPhoto
{
    self.navigationItem.title = self.photo.name;
    self.authorLabel.text = self.photo.authorFullName;
    self.photosTakenLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.photo.user.numberOfPhotosTaken];
}

- (void)addPhotoDetailsTableView
{
    DetailsViewController *details = [[DetailsViewController alloc] init];
    details.photo = self.photo;
    details.delegate = self;
    [self addChildViewController:details];
    details.view.frame = _viewContainter.bounds;
    [_viewContainter addSubview:details.view];
    [details didMoveToParentViewController:self];
}


#pragma mark OBJPhotoDetailsViewControllerDelegate

- (void)didSelectPhotoAttributeWithKey:(NSString *)key
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    detailViewController.key = key;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
