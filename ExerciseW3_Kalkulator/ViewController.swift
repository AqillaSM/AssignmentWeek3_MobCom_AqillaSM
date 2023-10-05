//
//  ViewController.swift
//  ExerciseW3_Kalkulator
//
//  Created by MacBook Pro on 03/10/23.
//

import UIKit

class ViewController: UIViewController 
{

    @IBOutlet weak var perhitungan: UILabel!
    
    @IBOutlet weak var hasil: UILabel!
    
    var penghitungan:String = ""
    var penghitungan2:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        HapusSemuanya()
    }
    
    func HapusSemuanya()
    {
        penghitungan = ""
        penghitungan2 = ""
        perhitungan.text = ""
        hasil.text = ""
    }
    
    func NambahHitung(value:String)
    {
        penghitungan = penghitungan + value
        perhitungan.text = penghitungan
    }
    
    func NambahHitung2(value:String)
    {
        penghitungan2 = penghitungan2 + value
    }
    

    @IBAction func hapussemua(_ sender: Any) {
        HapusSemuanya()
    }
    
    @IBAction func hapusaja(_ sender: Any) {
        if(!penghitungan.isEmpty)
        {
            penghitungan.removeLast()
            penghitungan2.removeLast()
            perhitungan.text = penghitungan
        }
    }
    
    @IBAction func persen(_ sender: Any) {
        NambahHitung(value: "%")
        NambahHitung2(value: "%")
    }
    
    @IBAction func bagi(_ sender: Any) {
        NambahHitung(value: "/")
        NambahHitung2(value: "*1.0/")
    }
    
    @IBAction func kali(_ sender: Any) {
        NambahHitung(value: "*")
        NambahHitung2(value: "*1.0*")
    }
    
    @IBAction func kurang(_ sender: Any) {
        NambahHitung(value: "-")
        NambahHitung2(value: "*1.0-")
    }
    
    @IBAction func tambah(_ sender: Any) {
        NambahHitung(value: "+")
        NambahHitung2(value: "*1.0+")
    }
    
    @IBAction func samadengan(_ sender: Any) {
        if inputbenar() {
            if penghitungan2.contains("%") {
                // Ganti karakter '%' dengan '*0.01'
                penghitungan2 = penghitungan2.replacingOccurrences(of: "%", with: "*0.01")
            }
            let hitungan = NSExpression(format: penghitungan2)
            let result = hitungan.expressionValue(with: nil, context: nil) as! Double // Hasil akan selalu berupa Double
            let hasilString = FormatHasil(result: result)
            hasil.text = hasilString
        } else {
            let peringatan = UIAlertController(title: "Input Tidak Benar", message: "Operasi matematika salah", preferredStyle: .alert)
            peringatan.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(peringatan, animated: true, completion: nil)
        }
        penghitungan = ""
        penghitungan2 = ""
        perhitungan.text = ""
    }
    
    func inputbenar() -> Bool
    {
        var count = 0
        var funcCharIndex = [Int]()
        
        for char in penghitungan2
        {
            if(karakter(char: char))
            {
                funcCharIndex.append(count)
            }
            count += 1
        }
        
        var sebelumnya: Int = -1
        
        for index in funcCharIndex
        {
            if(index == 0)
            {
                return false
            }
            if(index == penghitungan2.count - 1)
            {
                return false
            }
            
            if(sebelumnya != 1)
            {
                if(index - sebelumnya == 1)
                {
                    return false
                }
            }
            sebelumnya = index
        }
        return true
    }
    
    func karakter (char: Character) -> Bool
    {
        if(char == "*")
        {
            return true
        }
        if(char == "/")
        {
            return true
        }
        return false
    }
    
    func FormatHasil(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(result)
        }
    }
    
    @IBAction func sembilan(_ sender: Any) {
        NambahHitung(value: "9")
        NambahHitung2(value: "9")
    }
    
    @IBAction func delapan(_ sender: Any) {
        NambahHitung(value: "8")
        NambahHitung2(value: "8")
    }
    
    @IBAction func tujuh(_ sender: Any) {
        NambahHitung(value: "7")
        NambahHitung2(value: "7")
    }
    
    @IBAction func enam(_ sender: Any) {
        NambahHitung(value: "6")
        NambahHitung2(value: "6")
    }
    
    @IBAction func lima(_ sender: Any) {
        NambahHitung(value: "5")
        NambahHitung2(value: "5")
    }
    
    @IBAction func empat(_ sender: Any) {
        NambahHitung(value: "4")
        NambahHitung2(value: "4")
    }
    
    @IBAction func tiga(_ sender: Any) {
        NambahHitung(value: "3")
        NambahHitung2(value: "3")
    }
    
    @IBAction func dua(_ sender: Any) {
        NambahHitung(value: "2")
        NambahHitung2(value: "2")
    }
    
    @IBAction func satu(_ sender: Any) {
        NambahHitung(value: "1")
        NambahHitung2(value: "1")
    }
    
    @IBAction func nol(_ sender: Any) {
        NambahHitung(value: "0")
        NambahHitung2(value: "0")
    }
    
    @IBAction func koma(_ sender: Any) {
        NambahHitung(value: ".")
        NambahHitung2(value: ".")
    }
    
}

