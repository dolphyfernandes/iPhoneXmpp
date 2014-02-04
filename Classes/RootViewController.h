#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "ChatViewController.h"

@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>
{
	NSFetchedResultsController *fetchedResultsController;
}

- (IBAction)settings:(id)sender;

@end
