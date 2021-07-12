package com.realcoderz.util;

import java.util.Set;

import com.itextpdf.kernel.pdf.canvas.parser.EventType;
import com.itextpdf.kernel.pdf.canvas.parser.data.IEventData;
import com.itextpdf.kernel.pdf.canvas.parser.listener.ITextExtractionStrategy;

public class Extrection implements ITextExtractionStrategy {

	@Override
	public void eventOccurred(IEventData data, EventType type) {
		// TODO Auto-generated method stub

	}

	@Override
	public Set<EventType> getSupportedEvents() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getResultantText() {
		// TODO Auto-generated method stub
		return null;
	}

}
