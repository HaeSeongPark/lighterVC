//
//  RatingCell.h
//  objc.io example project (issue #1)
//


#import "RatingCell.h"


static const int MaximumNumberOfStars = 5;
static const float InactiveStarOpacity = .2;

@interface RatingCell()
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *stars;

@end


@implementation RatingCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"RatingCell" bundle:nil];
}

- (void)setRating:(double)rating
{
    if (_rating == rating) return;

    _rating = rating;
    [self updateForRating:rating];
}

- (void)updateForRating:(double)rating
{
    NSUInteger numberOfStars = (NSUInteger) ceilf((float) (rating * MaximumNumberOfStars));
    for (NSUInteger idx = 0; idx < MaximumNumberOfStars; idx++) {
        UIView *starView = self.stars[idx];
        starView.alpha = numberOfStars > idx ? 1 : InactiveStarOpacity;
    }
}

@end
