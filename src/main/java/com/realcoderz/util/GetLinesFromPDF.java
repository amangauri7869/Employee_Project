package com.realcoderz.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.pdfbox.text.TextPosition;
import org.springframework.stereotype.Component;

import com.itextpdf.io.IOException;
import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.colors.ColorConstants;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfLineAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfTextAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;

@Component
public class GetLinesFromPDF extends PDFTextStripper {

	public GetLinesFromPDF() throws java.io.IOException {
		super();
		// TODO Auto-generated constructor stub
	}

	static List<String> lines = new ArrayList<String>();
	List<TextPosition> linePositions = new ArrayList<>();
	private static int pageNumber;
	private static int foundPageNumber;
	Map<String, List<Float>> positions = new HashMap<>();
	static float x, y;
	private static String textToBechecked ="";
	/**
	 * @throws IOException If there is an error parsing the document.
	 * @throws             java.io.IOException
	 */

	public void iterate(String filePath) throws IOException, java.io.IOException {
		PDDocument document = null;
		String fileName = filePath;
		System.out.println("In iterator methos>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

		try {
			document = PDDocument.load(new File(fileName));
			PDFTextStripper stripper = new GetLinesFromPDF();
			int numberOfPages = document.getNumberOfPages();

			for (int pageNumber = 1; pageNumber <= numberOfPages; pageNumber++) {

				GetLinesFromPDF.pageNumber = pageNumber;

				stripper.setSortByPosition(true);
				stripper.setStartPage(pageNumber);
				stripper.setEndPage(pageNumber);
				GetLinesFromPDF.pageNumber = pageNumber;
				String contents = stripper.getText(document);

				/*
				 * if (contents.contains("Telephones and Electronic Mail")) { this.pageNumber =
				 * pageNumber;
				 * 
				 * System.out.println("Page Number is :" + this.pageNumber);
				 * 
				 * break; } else { System.out.println("Contents var in iterator " + contents);
				 * 
				 * }
				 */

				/*
				 * Writer dummy = new OutputStreamWriter(new ByteArrayOutputStream());
				 * stripper.writeText(document, dummy);
				 */

				// print lines
				for (String line : lines) {
					System.out.println(line);
				}
			}

		} finally

		{
			if (document != null) {
				document.close();
			}
		}

	}

	/**
	 * Override the default functionality of PDFTextStripper.writeString()
	 */
	@Override
	protected void writeString(String str, List<TextPosition> textPositions) throws IOException {

		for (TextPosition position : textPositions) {

			System.out.println(textToBechecked);
			if (str.contains(GetLinesFromPDF.textToBechecked)) {

				x = position.getX();
				y = position.getY();

				/*
				 * System.out.println("Positin of text found at position: " + position.getX() +
				 * " " + position.getY());
				 * System.out.println("PageNumber In call back method : " +
				 * GetLinesFromPDF.pageNumber);
				 */GetLinesFromPDF.foundPageNumber = GetLinesFromPDF.pageNumber;

			}

			/* System.out.println(str); */
		}

		// you may process the line here itself, as and when it is obtained
	}

	public TextPosition getPosition(String text) {
		TextPosition position = null;
		System.out.println("position size >>>>" + linePositions.size());
		System.out.println("Number of Lines size >>>>" + lines.size());
		for (int i = 0; i < lines.size(); i++) {
			if (lines.get(i).contains(text)) {
				position = linePositions.get(i);

				break;
			}
		}

		return position;
	}

	public void addAnnotation(String[] refText, String[] comments, String path, String targetPath)
			throws IOException, java.io.IOException {

		System.out.println("Final page found page number in addAnnotation method : " + GetLinesFromPDF.pageNumber);

		// TextPosition position = getPosition(text);
		// List<Float> position = positions.get(refText);
		List<Position> positions = new ArrayList<>();

		for (String ref : refText) {
			
			GetLinesFromPDF.textToBechecked = ref;
			iterate(path);
			Position p = new Position();

			p.setPageNumber(GetLinesFromPDF.foundPageNumber);
			p.setX(x);
			p.setY(y);

			positions.add(p);

		}

		PdfDocument pdfDoc = new PdfDocument(new PdfReader(path), new PdfWriter(targetPath));

		for (int i = 0; i < positions.size(); i++) {
			System.out.println("X value :" + x + " Y value : " + y);

			float x = positions.get(i).getX();
			float y = positions.get(i).getY();

			String comment = comments[i];
			PdfPage page = pdfDoc.getPage(positions.get(i).getPageNumber());
			
			
			Rectangle mediaBox = page.getMediaBox();
			
			float height = mediaBox.getHeight();
			float width = mediaBox.getWidth();
			System.out.println(height + " Width " + width);
			
			Rectangle rect = new Rectangle(220, 350, 255, 245);
	        PdfLineAnnotation ann  = new PdfLineAnnotation(rect,
	                new float[] {220 + 5, 350 + 5, 220 + 255 - 5, 350 + 245 - 5});
	        ann.setTitle(new PdfString("You are here:"));

	        // This method sets the text that will be displayed for the annotation or the alternate description,
	        // if this type of annotation does not display text.
	        ann.setContents(comment);
	        
			
			/*
			 * PdfAnnotation ann = new PdfTextAnnotation(new Rectangle(x, height - y, 0,
			 * 0)).setTitle(new PdfString("iText")) .setContents(comment).setOpen(true);
			 */

			/*
			 * PdfCanvas canvas = new PdfCanvas(pdfDoc.getFirstPage());
			 * canvas.beginText().setFontAndSize(PdfFontFactory.createFont(FontConstants.
			 * HELVETICA), 12).moveText(x, height - y) .showText(comment).endText();
			 */

			page.addAnnotation(ann);

		}

		pdfDoc.close();

	}

	
	public static void main(String[] args) throws IOException, java.io.IOException {
		new GetLinesFromPDF().iterate("A:/test1.pdf");
	}
}
