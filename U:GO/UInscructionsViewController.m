//
//  UInscructionsViewController.m
//  U:GO
//
//  Created by Julien Saad on 2014-05-28.
//  Copyright (c) 2014 Third Bridge. All rights reserved.
//

#import "UInscructionsViewController.h"
#import "InstructionCell.h"

@interface UInscructionsViewController ()

@property NSMutableArray* sailTitles;
@property NSMutableArray* sailDescriptions;
@property NSMutableArray* sailTimes;

@end

@implementation UInscructionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.screenName = @"Instructions Screen - iOS";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _sailTitles = [[NSMutableArray alloc] init];
    
    [_sailTitles addObject:@"Café Myriade"];
    [_sailTitles addObject:@"Shopping"];
    [_sailTitles addObject:@"Place Phillips"];
    [_sailTitles addObject:@"Old Port of Montreal"];
    [_sailTitles addObject:@"Terrasse"];
    [_sailTitles addObject:@"Desert"];
    
    _sailDescriptions = [[NSMutableArray alloc] init];
    
    if(!ISFRENCH){
    [_sailDescriptions addObject:@"Need a good coffee to kickstart the day? Head to Café Myriade to enjoy pastries with one of the best latte in town!"];
    [_sailDescriptions addObject:@"Head downtown onto’s St-Catherine street for some shopping! To spend a lot, head to Holt Renfrew or Ogilvy. For art into a Mall, head to Eaton Center. And if you want to buy the classic Hudson Bay hunter’s bedding blanket, you’ll find it at the end of St-Catherine’s street across Union’s street."];
    [_sailDescriptions addObject:@"Enjoy a light lunch at the Place Phillips right in front of The Bay shopping Mall. Lots of food truck around!"];
    [_sailDescriptions addObject:@"Get to enjoy the beautiful view of the old port by crossing all along the De La Commune street! On your way back, get to St-Paul’s street; it’s the perfect time to buy some souvenir such as maple syrup or just a wolf shirt!"];
    [_sailDescriptions addObject:@"Walked a lot and feel you need a break? Why not enjoy a good apero on a Terasse? We recommend you the traditionnal Terasse Bonsecours or Hotel Nelligan."];
    [_sailDescriptions addObject:@"Head onto the Quartier chinois to get a little refreshner : Bubble Tea drink! Take time while you sip to admire the asian culture."];
    }else{
        [_sailDescriptions addObjectsFromArray:[NSArray arrayWithObjects:@"Besoin d'un bon café pour démarrer la journée? Rendez-vous au Café Myriade pour déguster des pâtisseries avec l'un des meilleurs latte en ville!",@"On se dirige au centre-ville sur la rue St-c'est Catherine pour faire du shopping! Dépensez beaucoup au Holt Renfrew ou Ogilvy. Admirez de l’art dans un centre commercial au Centre Eaton. Si vous voulez acheter une literie de couverture classique de la Baie d'Hudson, vous la trouverez à la fin de la rue St-Catherine au coin de la rue de l'Union.",@"Profitez d'un déjeuner léger sur la Place Phillips juste en face du centre commercial La Baie. Beaucoup de ‘’Food Truck’’ aux alentours!",@"Profitez de la belle vue qu’offre le vieux port en traversant tout le long de la rue De La Commune! Sur le chemin du retour, prenez la rue Saint-Paul; c'est le moment idéal pour acheter des souvenirs tels que du sirop d'érable ou des chandails de loups!",@"Vous avez beaucoup marché et sentez que vous avez besoin d'une pause? Pourquoi ne pas profiter d'un apéro sur une Terasse? Nous vous recommandons la traditionnelle Terasse Bonsecours ou Hôtel Nelligan.",@"Dirigez vous au Quartier chinois afin de vous rafraîchir un peu: Bubble Tea! Prenez le temps pendant que y êtes pour admirer la culture asiatique.", nil]];
    }
    
    _sailTimes = [[NSMutableArray alloc] init];
    [_sailTimes addObject:@"10 am"];
    [_sailTimes addObject:@"11 am"];
    [_sailTimes addObject:@"1 pm"];
    [_sailTimes addObject:@"2 pm"];
    [_sailTimes addObject:@"7 pm"];
    [_sailTimes addObject:@"9 pm"];
    
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(25, 0, -40, 0);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _sailDescriptions.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 220;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"DirectionCell";
    
    InstructionCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[InstructionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell.
    cell.numberLabel.text = [NSString stringWithFormat:@"%d",indexPath.row+1];
    cell.placeName.text = _sailTitles[indexPath.row];
    cell.hours.text = _sailTimes[indexPath.row];
    cell.descriptionTextLabel.text = _sailDescriptions[indexPath.row];
    cell.descriptionTextLabel.adjustsFontSizeToFitWidth = YES;
    cell.descriptionTextLabel.textAlignment = NSTextAlignmentCenter;

    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)returnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
