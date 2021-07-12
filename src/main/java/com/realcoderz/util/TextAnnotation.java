
package com.realcoderz.util;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfTextAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;

public class TextAnnotation {

	public static void main(String args[]) throws Exception {
		PdfDocument pdfDoc = new PdfDocument(new PdfReader("D:/privacy.pdf"), new PdfWriter("D:/privacy2.pdf"));

		int numberOfPages = pdfDoc.getNumberOfPages();
		System.out.println(numberOfPages);

		PdfAnnotation ann = new PdfTextAnnotation(new Rectangle(350, 400, 0, 0)).setTitle(new PdfString("iText"))
				.setContents("Please, fill out the form.").setOpen(true);

		PdfCanvas canvas = new PdfCanvas(pdfDoc.getFirstPage());
		canvas.beginText().setFontAndSize(PdfFontFactory.createFont(FontConstants.HELVETICA), 12).moveText(265, 597)
				.showText("I agree to the terms and conditions.").endText();
		
		PdfAnnotation ann1 = new PdfTextAnnotation(new Rectangle(360, 460, 0, 0)).setTitle(new PdfString("iText"))
				.setContents("Please, fill out the form.").setOpen(true);

		PdfCanvas canvas1 = new PdfCanvas(pdfDoc.getFirstPage());
		canvas.beginText().setFontAndSize(PdfFontFactory.createFont(FontConstants.HELVETICA), 12).moveText(265, 597)
				.showText("I agree to the terms and conditions.").endText();

		PdfAnnotation ann2 = new PdfTextAnnotation(new Rectangle(355, 405, 0, 0)).setTitle(new PdfString("iText"))
				.setContents("Please, fill out the form.").setOpen(true);

		PdfCanvas canvas2 = new PdfCanvas(pdfDoc.getFirstPage());
		canvas.beginText().setFontAndSize(PdfFontFactory.createFont(FontConstants.HELVETICA), 12).moveText(265, 597)
				.showText("I agree to the terms and conditions.").endText();
		
		
		pdfDoc.getPage(1).addAnnotation(ann);
		pdfDoc.getPage(1).addAnnotation(ann1);
		pdfDoc.getPage(1).addAnnotation(ann2);
		pdfDoc.close();
	}

	/*
	 * static boolean hasString(String str) { String fileName = "";
	 * 
	 * StringBuilder text = new StringBuilder(); if (File.Exists(fileName)) {
	 * PdfReader pdfReader = new PdfReader(fileName); pdfReader. for (int page = 1;
	 * page >= ; page++) { ITextExtractionStrategy strategy = new
	 * SimpleTextExtractionStrategy(); string currentText =
	 * PdfTextExtractor.getTextFromPage(pdfReader, page, strategy); currentText =
	 * Encoding.UTF8.GetString(ASCIIEncoding.Convert( Encoding.Default,
	 * Encoding.UTF8, Encoding.Default.GetBytes(currentText)));
	 * 
	 * text.Append(currentText); } pdfReader.close(); } return text.toString(); }
	 */

}
