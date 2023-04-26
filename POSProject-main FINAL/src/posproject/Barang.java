/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package posproject;

import java.util.ArrayList;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author ASUS
 */
public class Barang {
    public String kode;
    public String nama;
    public float harga;
    
    static ArrayList<Barang> daftarBarang;
    public static void loadBarangFromDB() {
        daftarBarang = new ArrayList<Barang>();
        Barang barang;
        
        try {
            Statement stmt = DBConnector.connection.createStatement();
            String sql = "SELECT * FROM barang";
        
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next())
            {
                barang = new Barang();
                barang.kode = Integer.toString(rs.getInt("kode"));
                barang.nama = rs.getString("nama");
                barang.harga = rs.getFloat("harga");
                daftarBarang.add(barang);
            }
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
    }
    
    public static Barang getBarang(String kode) {
        for (int i = 0; i < daftarBarang.size(); i++) {
            var barang = daftarBarang.get(i);
            
            if (barang.kode.equals(kode)) {
                return barang;
            }
        }
        
        return null;
    }
}
