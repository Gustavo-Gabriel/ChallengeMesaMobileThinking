//
//  ScreenChange .swift
//  ChallengeMesaMobileThinking
//
//  Created by Gustavo Anjos on 23/02/21.
//

import UIKit

func screenChangeLoginFeed(){
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let secondVC = storyboard.instantiateViewController(identifier: "FeedView")
    secondVC.modalPresentationStyle = .fullScreen
    present(secondVC, animated: true, completion: nil)
}

