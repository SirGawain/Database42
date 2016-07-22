//
//  ViewController.swift
//  Database42
//
//  Created by george on 16/07/16.
//  Copyright © 2016 george. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var switch1: UISwitch!
    @IBOutlet weak var info_name1: UILabel!
    @IBOutlet weak var info_name2: UILabel!
    @IBOutlet weak var info_birth1: UILabel!
    @IBOutlet weak var info_birth2: UILabel!
    @IBOutlet weak var info_phone1: UILabel!
    @IBOutlet weak var info_phone2: UIButton!
    @IBOutlet weak var info_card1: UILabel!
    @IBOutlet weak var info_card2: UILabel!
    
    var group = [student]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        group.append(student(name: "Максим", surname: "Бабурин", patronymic: "Сергеевич", birthdate: "29/3/94", phoneNumber: "+79158467718", numberCard: "14743"))
        group.append(student(name: "Максим", surname: "Гундин", patronymic: "Алексеевич", birthdate: "17/5/97", phoneNumber: "+79158120398", numberCard: "14871"))
        group.append(student(name: "Дарья", surname: "Кузнецова", patronymic: "Сергеевна", birthdate: "9/2/97", phoneNumber: "+79106804175", numberCard: "14555"))
        group.append(student(name: "Евгений", surname: "Мальков", patronymic: "Андреевич", birthdate: "22/4/97", phoneNumber: "+79644945410", numberCard: "14556"))
        group.append(student(name: "Георгий", surname: "Мамардашвили", patronymic: "Нугзарович", birthdate: "11/9/96", phoneNumber: "294245", numberCard: "14557"))
        group.append(student(name: "Юлия", surname: "Мартынова", patronymic: "Леонидовна", birthdate: "9/11/96", phoneNumber: "+79605071785", numberCard: "14558"))
        group.append(student(name: "Иван", surname: "Носарь", patronymic: "Александрович", birthdate: "20/5/96", phoneNumber: "+79644950031", numberCard: "14559"))
        group.append(student(name: "Никита", surname: "Овсов", patronymic: "Алексеевич", birthdate: "26/12/96", phoneNumber: "+79106908386", numberCard: "14560"))
        group.append(student(name: "Екатерина", surname: "Орехова", patronymic: "Андреевна", birthdate: "27/11/96", phoneNumber: "+79290879878", numberCard: "14561"))
        group.append(student(name: "Алексей", surname: "Сенюшин", patronymic: "Владимирович", birthdate: "3/8/96", phoneNumber: "+79203673809", numberCard: "14563"))
        group.append(student(name: "Максим", surname: "Петров", patronymic: "Юрьевич", birthdate: "31/10/96", phoneNumber: "+79605091855", numberCard: "14562"))
        group.append(student(name: "Дмитрий", surname: "Самоловов", patronymic: "Владимирович", birthdate: "11/11/95", phoneNumber: "+79806943667", numberCard: "14749"))
        group.append(student(name: "Дмитрий", surname: "Смирнов", patronymic: "Николаевич", birthdate: "14/3/96", phoneNumber: "+79612450165", numberCard: "14564"))
        group.append(student(name: "Федор", surname: "Федотов", patronymic: "Андреевич", birthdate: "17/3/97", phoneNumber: "+79621688378", numberCard: "14565"))
        group.append(student(name: "Дмитрий", surname: "Чубаров", patronymic: "Михайлович", birthdate: "14/12/95", phoneNumber: "+79106803935", numberCard: "14567"))
        group.append(student(name: "Михаил", surname: "Шаганов", patronymic: "Юрьевич", birthdate: "23/12/96", phoneNumber: "+79203534710", numberCard: "14568"))
        group.append(student(name: "Екатерина", surname: "Шипкова", patronymic: "Игоревна", birthdate: "2/12/96", phoneNumber: "+79621613258", numberCard: "14569"))
        group.append(student(name: "Ирина", surname: "Яркова", patronymic: "Алексеевна", birthdate: "7/7/96", phoneNumber: "+79158334850", numberCard: "14570"))
        info_name1.hidden=true
        info_name2.hidden=true
        info_birth1.hidden=true
        info_birth2.hidden=true
        info_phone1.hidden=true
        info_phone2.hidden=true
        info_card1.hidden=true
        info_card2.hidden=true
    }

    @IBAction func btn_find_click(sender: AnyObject)
    {
        info_name1.hidden=true
        info_name2.hidden=true
        info_birth1.hidden=true
        info_birth2.hidden=true
        info_phone1.hidden=true
        info_phone2.hidden=true
        info_card1.hidden=true
        info_card2.hidden=true
        
        let str = textField1.text
        info_name2.text = nil
        
        for item in group
        {
        if item.surname == str
            {
                info_name1.hidden=false
                info_name2.hidden=false
                info_name2.text = item.surname + " " + item.name + " " + item.patronymic
                
                info_birth1.hidden=false
                info_birth2.hidden=false
                info_birth2.text = item.birthdate
                
                if switch1.on == true
                {
                    info_phone1.hidden=false
                    info_phone2.hidden=false
                    info_phone2.setTitle(item.phoneNumber, forState: .Normal)
                    
                    info_card1.hidden=false
                    info_card2.hidden=false
                    info_card2.text = item.numberCard
                }
            }
        }
        
        if info_name2.text == nil
        {
            info_name2.hidden=false
            info_name2.text = "Информация не найдена..."
        }
        textField1.resignFirstResponder()
    }
    
    @IBAction func make_call(sender: AnyObject)
    {
        var number: String = sender.currentTitle!!
        number = "tel://" + number
        let url: NSURL = NSURL (string: number)!
        UIApplication.sharedApplication().openURL(url)
    }
}







