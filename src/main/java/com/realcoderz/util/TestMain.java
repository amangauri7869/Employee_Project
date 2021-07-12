package com.realcoderz.util;

public class TestMain {

	public static void main(String[] args) throws java.io.IOException {

		GetLinesFromPDF pdf = new GetLinesFromPDF();
		// pdf.addAnnotation("Departmental Organization Char", "D:/pdfFile.pdf");

		String[] refs = { "Become leader not a manager",
				"Be careful," + " honest and sincere while selecting a person.", "Don’t make induction a ritual.",
				"Make the employee clear what is expected from him.", "Be firm and fair.", "Confront Problems.",
				"Apply the principle of 20-80." };

		String[] comments = {
				"The basic skills of excellence in HR require a manager to build people, bind people together with hearts minds and souls and for this he has to become a leader and not a mere manager. Every organization that has maintained its excellent over the period of time has been able to do so because it had a leader and not a manager who was able to transform the culture of excellence. While a manager does things right, as a leader HR manager should always do right things. While a manager may be efficient to move",
				"Engage right person at the right job. Don’t try to fit a square in a hole. Discourage favoritisms in recruitment. Don’t compromise with the quality a",

				"Most of the HR managers do this exercise as a ritual and leave it on a subordinate which ultimately turns out to be a utter failure in achiveing purpose of this",
				"It is for the HR manager to ensure that employees working in the organization are well aware of what the organization expects from them. In one of the reputed organization when I was called as an expert to diagnose the problem in people management, after observing the work culture I commented, ‘In your organization everybody is doing every body’s",
				"HR manager has to practice this policy down the line all the time. While dealing employee relations he has to exhibit and display his firmness and fairness even in sensitive situations to command respect from all corners. He has",
				"HR manager who escape from tricky situations and problems can not excel in discharging his functions. He has to confront the problems as they arise and disseminate them. Always remember that avoiding problems and keeping the dust under the corpet will not pave the way of excellence. In any organization where HR people pass the buck and shift the burden",
				"As a HR professional it is not necessary all the time to use your technical knowledge for achieving excellence but what is required is skill of dealing with people and this ratio is known as 20-80. 80% is of your people handling skills in all situations with common sense management of human dignity and 20% is of" };

		pdf.addAnnotation(refs, comments, "A:/privacy.pdf", "A:/privacy2.pdf");
	}

}
