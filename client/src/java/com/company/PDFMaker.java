/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company;

import static com.company.Main.strBaseFolder;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;


/**
 *
 * @author Dan
 */
public class PDFMaker{

    
    public static void CreatePDF(String strBaseFolder,int copyNum){
     
     System.out.println("Creating pdf barcodes");
     int i = 0;
     
     Document document = new Document(PageSize.A4.rotate());
     document.top(0);
     document.bottom(0);
     document.addTitle("Inther");
     System.out.println("Create document...");
     
     
     try{
           PdfWriter.getInstance(document,new FileOutputStream(strBaseFolder + "output.pdf"));
           document.setMargins(0, 0 , 0, 0);
           document.open();
            

          
         while(i<copyNum){

             
          
                PdfPTable table = new PdfPTable(8);
                Image img = Image.getInstance(strBaseFolder + Integer.toString(i)+".png");
                Image img2 = Image.getInstance(strBaseFolder + Integer.toString(i+1)+".png");
                Image img3 = Image.getInstance(strBaseFolder + Integer.toString(i+2)+".png");
                Image img4 = Image.getInstance(strBaseFolder + Integer.toString(i+3)+".png");
                Image img5 = Image.getInstance(strBaseFolder + Integer.toString(i+4)+".png");
                Image img6 = Image.getInstance(strBaseFolder + Integer.toString(i+5)+".png");
                Image img7 = Image.getInstance(strBaseFolder + Integer.toString(i+6)+".png");
                Image img8 = Image.getInstance(strBaseFolder + Integer.toString(i+7)+".png");
            
                
                PdfPCell cell = new PdfPCell();
                PdfPCell cell2 = new PdfPCell();
                PdfPCell cell3 = new PdfPCell();
                PdfPCell cell4 = new PdfPCell();
                PdfPCell cell5 = new PdfPCell();
                PdfPCell cell6 = new PdfPCell();
                PdfPCell cell7 = new PdfPCell();
                PdfPCell cell8 = new PdfPCell();
                
                cell.addElement(img);
                cell2.addElement(img2);
                cell3.addElement(img3);
                cell4.addElement(img4);
                cell5.addElement(img5);
                cell6.addElement(img6);
                cell7.addElement(img7);
                cell8.addElement(img8);
                
                            cell.setFixedHeight(66f);
                            cell2.setFixedHeight(66f);
                            cell3.setFixedHeight(66f);
                            cell4.setFixedHeight(66f);
                            cell5.setFixedHeight(66f);
                            cell6.setFixedHeight(66f);
                            cell7.setFixedHeight(66f);
                            cell8.setFixedHeight(66f);
                            
                           cell.setPaddingLeft(17);
                           cell.setPaddingTop(15);
                           
                           cell2.setPaddingLeft(7.5f);
                           cell2.setPaddingRight(7.5f);
                           cell2.setPaddingTop(15);
                           
                           cell3.setPaddingLeft(7.5f);
                           cell3.setPaddingRight(7.5f);
                           cell3.setPaddingTop(15);
                           
                           cell4.setPaddingLeft(7.5f);
                           cell4.setPaddingRight(7.5f);
                           cell4.setPaddingTop(15);
                           
                           cell5.setPaddingLeft(7.5f);
                           cell5.setPaddingRight(7.5f);
                           cell5.setPaddingTop(15);
                           
                           cell6.setPaddingLeft(7.5f);
                           cell6.setPaddingRight(7.5f);
                           cell6.setPaddingTop(15);
                           
                           cell7.setPaddingLeft(7.5f);
                           cell7.setPaddingRight(7.5f);
                           cell7.setPaddingTop(15);
                           
                           cell8.setPaddingRight(17);
                           cell8.setPaddingTop(15);
                
                table.addCell(cell);
                table.addCell(cell2);
                table.addCell(cell3);
                table.addCell(cell4);
                table.addCell(cell5);
                table.addCell(cell6);
                table.addCell(cell7);
                table.addCell(cell8);
                
                System.out.println(i);
                System.out.println(i+1);
                System.out.println(i+2);
                System.out.println(i+3);
                System.out.println(i+4);
                System.out.println(i+5);
                System.out.println(i+6);
                System.out.println(i+7);
                System.out.println("--------------------------------------------");
                
        table.setTotalWidth(PageSize.A4.rotate().getWidth()-5);
        table.setLockedWidth(true);   

                document.add(table);
                                  
         //System.out.println("---------------------------");
         i=i+8;

         }
          System.out.println("Document created succesfully");
          
     } catch(DocumentException | IOException e){
     
         System.out.println(e);
     }
  
        document.close();    
    }
    
    
    
    
}
