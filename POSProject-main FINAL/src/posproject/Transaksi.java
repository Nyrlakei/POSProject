/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package posproject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Transaksi {
    public int id;
    public HashMap<Barang, Integer> daftarBarang = new HashMap<>();
    public int totalHarga;
    public int totalDibayar;
    public int kembalian;
    public Date waktu;
    
    static ArrayList<Transaksi> daftarTransaksi = new ArrayList<>();

    public int getPurchasedItemsCount()
    {
        var tempJumlah = 0;
        
        for (Integer jumlah : daftarBarang.values()) {
            tempJumlah += jumlah;
        }
        
        return tempJumlah;
    }
}
