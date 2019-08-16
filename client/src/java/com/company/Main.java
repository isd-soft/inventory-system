package com.company;

import com.aspose.barcode.BarCodeBuilder;
import com.aspose.barcode.Symbology;
import com.client.Item;
import com.client.clients;
import static com.company.PDFMaker.CreatePDF;
import java.io.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;


public class Main {

    
    
    //Set the base folder for saving barcode images
    public static String strBaseFolder = System.getProperty("user.home")+"\\" ;
    
    
       public static void doMain(String sType, int copyNum) throws IOException, SQLException{
           
                clients cl=new clients();
              List<Item> it;
          
            for(int i = 0; i<copyNum; i++) {
                do{                    
                    //Set the image file name
                    String strImageName =Integer.toString(i) + ".png";

                    //Generate barcode
                    String strCodetext = sType + CodeGenerator.generateCode();               
                      BarCodeBuilder builder = new BarCodeBuilder(strCodetext, Symbology.Code128);       
                       it=cl.client_generator_work_mains(strCodetext);
                                 
                    if(it.size()==0) System.out.println("code doesn't exist "); else System.out.println("This code already exist");
                    
                   builder.save(strBaseFolder + strImageName);
                    System.out.println("Bar code generated successfully: " + strCodetext);
                    
                } while(it.size()!=0);

            }
            CreatePDF(strBaseFolder,copyNum);
           DeleteFiles(copyNum);
        
            }
            
            
            
        public static void DeleteFiles(int copyNum)
        {
        for(int i=0; i<copyNum; i++){
        File deleteFile = new File(strBaseFolder + Integer.toString(i) + ".png");
        deleteFile.delete();
          }
        }
}
