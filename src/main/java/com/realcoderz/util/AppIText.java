package com.realcoderz.util;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;

import com.itextpdf.io.font.FontConstants;
import com.itextpdf.kernel.color.DeviceCmyk;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.geom.Rectangle;
import com.itextpdf.kernel.pdf.PdfArray;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfPage;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfString;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.kernel.pdf.annot.PdfAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfTextAnnotation;
import com.itextpdf.kernel.pdf.annot.PdfTextMarkupAnnotation;
import com.itextpdf.kernel.pdf.canvas.PdfCanvas;
import com.itextpdf.kernel.pdf.canvas.parser.EventType;
import com.itextpdf.kernel.pdf.canvas.parser.PdfTextExtractor;
import com.itextpdf.kernel.pdf.canvas.parser.data.IEventData;
import com.itextpdf.kernel.pdf.canvas.parser.filter.TextRegionEventFilter;
import com.itextpdf.kernel.pdf.canvas.parser.listener.FilteredTextEventListener;
import com.itextpdf.kernel.pdf.canvas.parser.listener.ITextExtractionStrategy;
import com.itextpdf.kernel.pdf.canvas.parser.listener.LocationTextExtractionStrategy;


class AppIText implements ITextExtractionStrategy{
	  
	  private static final Logger LOGGER = Logger.getLogger(AppIText.class);
	  private static int LOG_LEVEL = 0; 
	  private final static int VISUAL_DEBUG =100;
	  
	  private String filePath = ("D:/privacy2.pdf"); 
	  private static String DEST = "D:/privacy3.pdf"; private PdfDocument pdfDocument; 
	  private PdfDocument pdfWriteDoc;
	  
	  
	  public void before() throws IOException 
	  { 
		  File file = new File(DEST);
		  file.getParentFile().mkdir(); if (file.exists()) { file.delete(); }
		  pdfDocument = new PdfDocument(new PdfReader(filePath)); 
		  pdfWriteDoc = new PdfDocument(new PdfWriter(DEST));
		  
	  }
	  
	  public static void main(String[] args) throws IOException 
	  { 
		  AppIText appIText = new AppIText();
		  appIText.before(); appIText.process();
	  }
	  
	  private void process() throws IOException 
	  {

	  for (int i = 1; i <= pdfDocument.getNumberOfPages(); i++) 
	  { 
		  PdfPage page =
		pdfDocument.getPage(i);
	  
	  List<PdfPage> newPdfPages = pdfDocument.copyPagesTo(i, i, pdfWriteDoc);
	  PdfPage newPage = null; 
	  if (newPdfPages.size() > 0) 
	  { 
		  newPage = newPdfPages.get(0); 
		  }
	  
	  
	  
	  
	  List<PdfAnnotation> annotations = page.getAnnotations(); 
	  for (PdfAnnotation annotation : annotations) 
	  { 
		  if (annotation.getContents() != null) 
		  {
			  System.out.println(); 
			  System.out.println("Annotation contents: {}"+
			annotation.getContents()); 
			 if (annotation instanceof PdfTextMarkupAnnotation)
			 { 
				 PdfArray rectangleArray = annotation.getRectangle();
				 System.out.println("rectangleArray: x={}, y={}, w={}, h={}"+
				rectangleArray.get(0)+ rectangleArray.get(1)+ rectangleArray.get(2)+
				rectangleArray.get(3) ); Rectangle pageSizeWithRotation = page.getCropBox();
				System.out.
				println("pageSizeWithRotation: x={}, y={}, w={}, h={}, top={}, bottom={}, left={}, right={}"
						+ pageSizeWithRotation.getX()+ pageSizeWithRotation.getY()+
						pageSizeWithRotation.getWidth()+ pageSizeWithRotation.getHeight()+
						pageSizeWithRotation.getTop()+ pageSizeWithRotation.getBottom()+
						pageSizeWithRotation.getLeft()+ pageSizeWithRotation.getRight() ); 
				float x = ((PdfNumber) rectangleArray.get(0)).floatValue(); float y = ((PdfNumber)
						rectangleArray.get(1)).floatValue(); 
				float width = ((PdfNumber) rectangleArray.get(2)).floatValue() - x; 
				float height = ((PdfNumber) rectangleArray.get(3)).floatValue() - y; 
				Rectangle rectangle = new Rectangle(x, y, width, height ); 
				
								/*
								 * 13:10:33.097 [main] INFO b.h.AppIText - Annotation contents:
								 * q(7.1).explain(1) 13:10:33.107 [main] INFO b.h.AppIText - rectangleArray:
								 * x=90.0338, y=438.245, w=468.33, h=489.749 13:10:33.107 [main] INFO
								 * b.h.AppIText - pageSizeWithRotation: x=0.0, y=0.0, w=531.0, h=666.0,
								 * top=666.0, bottom=0.0, left=0.0, right=531.0 width: 468.33f - 90.0388f,
								 * height: 489.749f - 438.245f
								 */
	  
	  if (LOG_LEVEL >= VISUAL_DEBUG) 
								{
									PdfCanvas canvas = new PdfCanvas(newPage);
									canvas.setFillColor(new DeviceCmyk(1, 0, 0, 0)).rectangle(rectangle).fillStroke();
								}

								TextRegionEventFilter regionFilter = new TextRegionEventFilter(rectangle);
								ITextExtractionStrategy strategy = new FilteredTextEventListener(
										new LocationTextExtractionStrategy(), regionFilter);
								String str = PdfTextExtractor.getTextFromPage(page, strategy) + "\n";
								System.out.println("str: {}" + str);
							}
						}
					}
	  }
	  
	  
		
		  PdfAnnotation ann = new PdfTextAnnotation(new Rectangle(355, 405, 0,
		  0)).setTitle(new PdfString("iText"))
		  .setContents("Please, fill out the form.").setOpen(true);
		  
		  PdfCanvas canvas = new PdfCanvas(pdfDocument.getFirstPage());
		  canvas.beginText().setFontAndSize(PdfFontFactory.createFont(FontConstants.
		  HELVETICA), 12).moveText(265, 597)
		  .showText("I agree to the terms and conditions.").endText();
		 
	  
		//pdfDocument.getPage(3).addAnnotation(ann);
	  pdfDocument.close(); 
	  pdfWriteDoc.close(); }
	  
	  
			/*
			 * public String hasString(String str) { PdfDocument documentsrc = new
			 * PdfDocument(new PdfReader("D:/privacy.pdf")); PdfDocument documentTarget =
			 * new PdfDocument(new PdfWriter("D:/privacy5.pdf"));
			 * 
			 * int numberOfPages = documentTarget.getNumberOfPages();
			 * 
			 * for(int i = 1; i <= numberOfPages; i++) { PdfPage page =
			 * documentTarget.getPage(i);
			 * 
			 * 
			 * }
			 * 
			 * 
			 * }
			 */
	  
	  @Override 
	  public void eventOccurred(IEventData data, EventType type) {
	  
	  
	  // you can first check the type of the event 
		  if
	  (!type.equals(EventType.RENDER_TEXT)) return;
	  
	  // now it is safe to cast TextRenderInfo renderInfo = (TextRenderInfo) data;
	  
	  }
	  
	  @Override public Set<EventType> getSupportedEvents() { 
		  // TODO Auto-generatedmethod stub 
		  return null; }
	  
	  @Override public String getResultantText() { // TODO Auto-generated method stub 
		  return null; }
	  
	  }
