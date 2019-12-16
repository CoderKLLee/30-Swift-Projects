//
/*******************************************************************************
        
        File name:     ViewController.swift
        Author:        Kairon (李凯隆)
        Blog  :        https://coderkllee.github.io
        E-mail:        coderkllee@163.com
        
        Description:
        
        History:
                12/12/2019: File created.
        
********************************************************************************/
    

import UIKit
import SnapKit

private let identifier : String = "lapTableViewCell"

class ViewController: UIViewController {

    // MARK:    ---     Variables
    private let mainStopwatch : Stopwatch = Stopwatch()
    private let lapStopwatch : Stopwatch = Stopwatch()
    
    private var isPlay : Bool = false
    private var laps : [String] = []
    
    // MARK:    ---     UI components
    lazy private var lapTimerLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        label.text = "00:00:00"
        
        return label;
    }()
    
    lazy private var timerLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.textColor = .black
        label.text = "00:00.00"

        return label;
    }()
    
    lazy private var playPauseButton : UIButton = {
        let button = UIButton(type:.custom)
        button.setTitle("启动", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.setTitle("停止", for: .selected)
        button.setTitleColor(.red, for: .normal)
        button.layer.cornerRadius = 0.5 * 60
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(onPlayPauseTimerClick(sender:)), for: .touchUpInside)
        return button;
    }()
    
    lazy private var lapRestButton : UIButton = {
         let button = UIButton(type:.custom)
        button.setTitleColor(.black, for: .normal)
         button.setTitle("复位", for: .normal)
         button.setTitle("计次", for: .selected)
         button.addTarget(self, action: #selector(onLapResetTimerClick(sender:)), for: .touchUpInside)
        button.isEnabled = false
        button.layer.cornerRadius = 0.5 * 60
        button.backgroundColor = UIColor.green
         return button;
     }()
    
    lazy private var lapTableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        return tableView;
    }()

    
    // MARK:    ---     Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Stopwatch";
        view.backgroundColor = .init(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1)
        
    }
    
    // 这个时机调用,safeArea的frame才有值
    override func viewWillLayoutSubviews() {
        p_setLayout()
    }
    
    // MARK:    ---     OverwriteSuperClass
    
    // MARK:    ---     Response Mehtods
    @objc private func onPlayPauseTimerClick(sender: UIButton) {
        lapRestButton.isEnabled = true
        lapRestButton.isSelected = true
        lapRestButton.backgroundColor = UIColor.white

        
        if !isPlay {    //  启动
            unowned let weakSelf = self
            
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(onUpdateMainTimer), userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(onUpdateLapTimer), userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopwatch.timer, forMode: RunLoop.Mode.common)
            RunLoop.current.add(lapStopwatch.timer, forMode: RunLoop.Mode.common)
            
            isPlay = true
            playPauseButton.isSelected = true

        } else {    //  停止
            
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            isPlay = false
            lapRestButton.isSelected = false
            playPauseButton.isSelected = false

        }
        

    }
    
    @objc private func onLapResetTimerClick(sender: UIButton) {
        
        if !isPlay {    // 复位
            
            resetMainTimer()
            resetLapTimer()
            lapRestButton.isSelected = false
            lapRestButton.isEnabled = false
            lapRestButton.backgroundColor = UIColor.green

            
        } else {        //  计次
            if let timerLabelText = timerLabel.text {
                laps.append(timerLabelText)
            }
            lapTableView.reloadData()
            resetLapTimer()
            
            unowned let weakSelf = self
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: #selector(onUpdateLapTimer), userInfo: nil, repeats: true)
            RunLoop.current.add(lapStopwatch.timer, forMode: RunLoop.Mode.common)
        }
    }
    
    @objc private func onUpdateMainTimer() {
        p_updateTimer(mainStopwatch, label: timerLabel)
    }
    
    @objc private func onUpdateLapTimer() {
           p_updateTimer(lapStopwatch, label: lapTimerLabel)

    }
    
    
    // MARK:    ---     Delegate
    
    // MARK:    ---     Private Methods
    private func p_setLayout() {
        
        let headerView = UIView()
        headerView.backgroundColor = .white;
        headerView.addSubview(lapTimerLabel)
        headerView.addSubview(timerLabel)
        
        lapTimerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(40)
            make.right.equalTo(-100)
        }
        
        timerLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lapTimerLabel.snp_bottomMargin).offset(10)
            make.right.equalTo(lapTimerLabel)
        }
        
        
        view.addSubview(headerView)
        view.addSubview(lapRestButton)
        view.addSubview(playPauseButton)
        view.addSubview(lapTableView)
        
        headerView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaInsets.top)
            make.left.right.equalTo(view)
            make.bottom.equalTo(timerLabel).offset(40)
            
        }
        
        lapRestButton.snp.makeConstraints { (make) in
            make.top.equalTo(headerView.snp_bottomMargin).offset(20)
            make.width.height.equalTo(60)
            make.centerX.equalTo(view).offset(-30 - 25)
        }
        
        playPauseButton.snp.makeConstraints { (make) in
            make.top.equalTo(lapRestButton)
            make.width.height.equalTo(60)
            make.centerX.equalTo(view).offset( 30 + 25)
        }
        
        lapTableView.snp.makeConstraints { (make) in
            make.top.equalTo(lapRestButton.snp_bottomMargin).offset(50)
            make.left.right.bottom.equalTo(view)
        }
        
    }
    
    private func p_updateTimer(_ stopwatch: Stopwatch, label: UILabel) {
      stopwatch.counter = stopwatch.counter + 0.035
      
      var minutes: String = "\((Int)(stopwatch.counter / 60))"
      if (Int)(stopwatch.counter / 60) < 10 {
        minutes = "0\((Int)(stopwatch.counter / 60))"
      }
      
      var seconds: String = String(format: "%.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))
      if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
        seconds = "0" + seconds
      }
      
      label.text = minutes + ":" + seconds
    }
    
    private func resetMainTimer() {
        resetTimer(mainStopwatch, label: timerLabel)
        laps.removeAll()
        lapTableView.reloadData()
    }
    
    private func resetLapTimer() {
        resetTimer(lapStopwatch, label: lapTimerLabel)
    }
    
    private func resetTimer(_ stopwatch: Stopwatch, label: UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00:00"
    }
    // MARK:    ---     Public Methods
    
   
    
}
 // MARK:    ---     Extension
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell(style: .value1, reuseIdentifier: identifier)
      
        if laps.count != 0 {
            
            cell.textLabel?.text = "计次 \(laps.count - (indexPath as NSIndexPath).row)"
            cell.detailTextLabel?.text = laps[laps.count - (indexPath as NSIndexPath).row - 1]
            
        }
        
        return cell
        
    }
}
