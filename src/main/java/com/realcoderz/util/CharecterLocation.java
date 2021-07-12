package com.realcoderz.util;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.text.TextPosition;

import com.itextpdf.io.source.ByteArrayOutputStream;

public class CharecterLocation extends PDFTextStripper{

	List<String> lines = new ArrayList<>();
	List<TextPosition> positions = new ArrayList<>();
	
	public CharecterLocation() throws IOException {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	@Override
	protected void writeString(String string, List<TextPosition> textPositions) throws IOException {
	    
		
		
		
		
		for(TextPosition position: textPositions)
		{
			lines.add(string);
			System.out.println(string);
			
		}
	}
	
public static void main(String[] args) throws IOException {
		
		File file = new File("D:/privacy.pdf");
	      PDDocument document = PDDocument.load(file);
	      
		PDFTextStripper stripper = new CharecterLocation();
		stripper.setSortByPosition( true );
		stripper.setStartPage( 0 );
		stripper.setEndPage( document.getNumberOfPages() );
		
		Writer dummy = new OutputStreamWriter(new ByteArrayOutputStream());
		stripper.writeText(document, dummy);
	}
}
