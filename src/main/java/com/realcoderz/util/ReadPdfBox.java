/*
 * package com.realcoderz.util;
 * 
 * import java.io.File; import java.io.IOException; import java.io.InputStream;
 * 
 * import org.apache.pdfbox.pdmodel.PDDocument; import
 * org.apache.pdfbox.pdmodel.PDPage; import
 * org.apache.pdfbox.pdmodel.PDPageTree; import
 * org.apache.pdfbox.text.PDFTextStripper;
 * 
 * public class ReadPdfBox {
 * 
 * public static void main(String[] args) throws IOException {
 * 
 * 
 * //Loading an existing document File file = new File("D:/privacy.pdf");
 * PDDocument document = PDDocument.load(file);
 * 
 * 
 * PDPageTree pages = document.getPages(); PDPage pdPage = pages.get(0);
 * pdPage.get //Instantiate PDFTextStripper class PDFTextStripper pdfStripper =
 * new PDFTextStripper();
 * 
 * String paragraphStart = pdfStripper.getParagraphStart();
 * 
 * //Retrieving text from PDF document String text =
 * pdfStripper.getText(document); System.out.println(text);
 * 
 * //Closing the document document.close(); }
 * 
 * 
 * 
 * }
 */