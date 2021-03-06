//
//  RootTableViewController.swift
//  iOS Sample
//
//  Created by ethan on 15/11/27.
//  Copyright © 2015年 ethan. All rights reserved.
//

import UIKit
import ETNetwork

enum Sections: Int {
    case Data, Download, Upload, Credit, BatchChain
    
    var segueIdentifer: String {
        switch self {
        case .Data:
            return "Data"
        case .Download:
            return "Download"
        case .Upload:
            return "Upload"
        case .Credit:
            return "Auth"
        case .BatchChain:
            return "BatchChain"
        }
    }
}

enum DataRows: Int {
    case Get, Post, Put, Delete
    
    var description: String {
        switch self {
        case .Get:
            return "GET"
        case .Post:
            return "POST"
        case .Put:
            return "PUT"
        case .Delete:
            return "DELETE"
        }
    }
}

enum DownloadRows: Int {
    case Download, DownloadWithResumeData

    var description: String {
        switch self {
        case .Download:
            return "Download"
        case .DownloadWithResumeData:
            return "DownloadWithResumeData"
        }
    }
}

enum UploadRows: Int {
    case UploadData, UploadFile, UploadStream

    var description: String {
        switch self {
        case .UploadData:
            return "UploadData"
        case .UploadFile:
            return "UploadFile"
            case .UploadStream:
            return "UploadStream"

        }
    }
}

enum AuthRows: Int {
    case HttpBasic
    
    var description: String {
        switch self {
        case .HttpBasic:
            return "HttpBasic"
        }
    }
}

enum BatchChainRows: Int {
    case Batch, Chain
    var description: String {
        switch self {
        case .Batch:
            return "Batch"
        case .Chain:
            return "Chain"
        }
    }
}


class RootTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   //MARK: - Table view delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let section = Sections(rawValue: indexPath.section)!
        self.performSegueWithIdentifier(section.segueIdentifer, sender: indexPath)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let dest = segue.destinationViewController
         let indexPath = sender as! NSIndexPath
        if let dest = dest as? DataTableViewController {
            dest.dataRows = DataRows(rawValue: indexPath.row)
        } else if let dest = dest as? DownloadTableViewController {
            dest.downloadRows = DownloadRows(rawValue: indexPath.row)
        } else if let dest = dest as? UploadTableViewController {
            dest.uploadRows = UploadRows(rawValue: indexPath.row)
        } else if let dest = dest as? AuthTableViewController {
            dest.authRows = AuthRows(rawValue: indexPath.row)
        }  else if let dest = dest as? BatchChainTableViewController {
            dest.bcRows = BatchChainRows(rawValue: indexPath.row)
        }
    }

}
