// Jack Sauter Forseck
// March 23, 2014

// Declares object font of type PFont for text display
PFont font;

// Strings to be filled in with keyboard input and displayed
// within input boxes
String tempName = "";
String tempCategory = "";
String tempStart = "";
String tempEnd = "";
String tempColour = "";

// Tracks which checkbox has been selected
Boolean checkClass = false;
Boolean checkDr = false;
Boolean checkWork = false;

// These ints store the start and end times converted from the
// strings tempStart, tempEnd
int intStart;
int intEnd;

// Function to turn month in integer type to its name
// in String type.
String getMonth(int month)
{
  if (month == 1)
  {
    return "January";
  }
  else if (month == 2)
  {
    return "February";
  }
  else if (month == 3)
  {
    return "March";
  }
  else if (month == 4)
  {
    return "April";
  }
  else if (month == 5)
  {
    return "May";
  }
  else if (month == 6)
  {
    return "June";
  }
  else if (month == 7)
  {
    return "July";
  }
  else if (month == 8)
  {
    return "August";
  }
  else if (month == 9)
  {
    return "September";
  }
  else if (month == 10)
  {
    return "October";
  }
  else if (month == 11)
  {
    return "November";
  }
  else
  {
    return "December";
  }
}

// Function that checks whether a given String has characters
// that are not digits. To be used to check the start and
// end times of 
Boolean hasInvalidChars(String str)
{
  Boolean result = false;
  char character;
  
  // Checks each character in str by converting it to a byte.
  // If the byte has an ASCII value outside of the digits range,
  // returns true.
  for (int i = 0; i < str.length(); i++)
  {
    character = str.charAt(i);
    if ((byte(character) < 48) || (byte(character) > 57))
    {
      result = true;
    }
  }
  return result;
}

void setup()
{
  // Gets date and arranges it to (month day, year)
  // format of String type.
  String monthName = getMonth(month());
  String date = monthName + " " + nf(day(), 0, 0) + ", " + nf(year(), 0, 0);
  
  // Creates font using object font of type PFont
  font = createFont("Arial", 12, true);
  
  // Sets size and background colour of window
  size(300, 660);
  background(255);
  
  // Sets the font and colour of the text to be displayed, and
  // displays it using text function with arguments String date,
  // x-coordinate 100, and y-coordinate 50
  textFont(font, 18);
  fill(0);
  text(date, 90, 20);
  
  // Same as above, but displays the word "Events" under date
  textFont(font, 14);
  fill(0);
  text("Events", 130, 40);
  
  // Creates the rectangle in which all the events will be
  // displayed
  textFont(font, 10);
  fill(0);
  text("0", 10, 55);
  text("24", 10, 55 + 360);
  
  noFill();
  rect(30, 50, 240, 360);
  
  // Draws a gray line to represent each hour in the day, and
  // labels each hour
  int hours = 1;
  for (int unit = 15; unit < 360; unit += 15)
  {
    textFont(font, 10);
    fill(0);
    text(nf(hours, 0, 0), 10, 55 + unit);
    
    stroke(200);
    line(30, 50 + unit, 270, 50 + unit);
    
    hours += 1;
  }
  
  // Rectangle separating out the event display section from
  // the event creation section.
  stroke(0);
  fill(255);
  rect(0, 420, 300, 240);
  
  // Details about the event
  textFont(font);
  fill(0);
  text("Event name: ", 20, 440);
  text("Start time: ", 20, 465);
  text("End time: ", 20, 490);
  text("Event category and colour: ", 20, 515);
  text("Class ---------------->", 50, 540);
  text("Dr. Appointment -->", 50, 565);
  text("Work shift ----------->", 50, 590);
    
  // Input fields
  stroke(0);
  fill(255);
  rect(100, 425, 150, 20);   // Corresponds to Event name
  rect(100, 450, 150, 20);   // Corresponds to Start time
  rect(100, 475, 150, 20);   // Corresponds to End time
  rect(160, 525, 90, 20);    // Corresponds to Class
  rect(160, 550, 90, 20);    // Corresponds to Dr. Appointment
  rect(160, 575, 90, 20);    // Corresponds to Work shift
  
  rect(20, 525, 20, 20);     // Checkbox for Class
  rect(20, 550, 20, 20);     // Checkbox for Dr. Appointment
  rect(20, 575, 20, 20);     // Checkbox for Work shift
  
  stroke(100, 100, 255);
  fill(9, 9, 145);
  rect(90, 600, 65, 30);     // "Done" button
  
  textFont(font);
  fill(255);
  text("Add Event", 95, 620);  // Text for the "Done" button
}

void draw()
{
  
}

void keyTyped()
{
  // Event name, start and end times input boxes, hover mouse to type
  if (((mouseX >= 100) && (mouseX <= 250)) && ((mouseY >= 425) && (mouseY <= 445)))
  {
    tempName += key;
    textFont(font, 10);
    fill(0);
    text(tempName, 110, 440);
  }
  else if (((mouseX >= 100) && (mouseX <= 250)) && ((mouseY >= 450) && (mouseY <= 470)))
  {
    tempStart += key;
    textFont(font, 10);
    fill(0);
    text(tempStart, 110, 465);
  }
  else if (((mouseX >= 100) && (mouseX <= 250)) && ((mouseY >= 475) && (mouseY <= 495)))
  {
    tempEnd += key;
    textFont(font, 10);
    fill(0);
    text(tempEnd, 110, 490);
  }
  
  // Keyboard input to choose colour - hover over the boxes
  if (checkClass == true && (((mouseX >= 160) && (mouseX <= 250)) && ((mouseY >= 525) && (mouseY <= 545))))
  {
    tempCategory = "Class: ";
    tempColour += key;
    textFont(font, 10);
    fill(0);
    text(tempColour, 170, 540);
  }
  else if (checkDr == true && (((mouseX >= 160) && (mouseX <= 250)) && ((mouseY >= 550) && (mouseY <= 570))))
  {
    tempCategory = "Dr. Appointment: ";
    tempColour += key;
    textFont(font, 10);
    fill(0);
    text(tempColour, 170, 565);
  }
  else if (checkWork == true && (((mouseX >= 160) && (mouseX <= 250)) && ((mouseY >= 575) && (mouseY <= 595))))
  {
    tempCategory = "Work: ";
    tempColour += key;
    textFont(font, 10);
    fill(0);
    text(tempColour, 170, 590);
  }
}


void mouseClicked()
{
  // Checks whether the checkboxes have been checked
  // Only one checkbox may be checked at any one time
  if (checkClass != true && (((mouseX >= 20) && (mouseX <= 40)) && ((mouseY >= 525) && (mouseY <= 545))))
  {
    // Draws a cross in the checkbox
    stroke(0);
    line(20, 525, 40, 545);
    line(20, 545, 40, 525);
    
    // Resets the other two checkboxes
    fill(255);
    rect(20, 550, 20, 20);     // Checkbox for Dr. Appointment
    rect(20, 575, 20, 20);     // Checkbox for Work shift
    
    // Resets the other two checkbox values
    checkClass = true;
    checkDr = false;
    checkWork = false;
  }
  else if (checkDr != true && (((mouseX >= 20) && (mouseX <= 40)) && ((mouseY >= 550) && (mouseY <= 570))))
  {
    // Draws a cross in the checkbox
    stroke(0);
    line(20, 550, 40, 570);
    line(20, 570, 40, 550);
    
    // Resets the other two checkboxes
    fill(255);
    rect(20, 525, 20, 20);     // Checkbox for Class
    rect(20, 575, 20, 20);     // Checkbox for Work shift
    
    // Resets the other two checkbox values
    checkDr = true;
    checkClass = false;
    checkWork = false;
  }
  else if (checkWork != true && (((mouseX >= 20) && (mouseX <= 40)) && ((mouseY >= 575) && (mouseY <= 595))))
  {
    // Draws a cross in the checkbox
    stroke(0);
    line(20, 575, 40, 595);
    line(20, 595, 40, 575);
    
    // Resets the other two checkboxes
    fill(255);
    rect(20, 525, 20, 20);     // Checkbox for Class
    rect(20, 550, 20, 20);     // Checkbox for Dr. Appointment
    
    // Resets the other two checkbox values
    checkWork = true;
    checkClass = false;
    checkDr = false;
  }
  
  // Checks whether "Done" button was clicked
  if (((mouseX >= 90) && (mouseX <= 140)) && ((mouseY >= 600) && (mouseY <= 630)))
  {
    // Default gray colour
    color colour = color(100, 100, 100);
    
    // Takes tempColour and compares it to pre-defined strings.
    // If they match, a colour associated with the pre-defined
    // strings will be assigned to variable colour.
    // Tried writing a function for this, but apparently
    // Processing doesn't allow functions to return data of type
    // color.
    if (tempColour.toUpperCase().equals("BLUE"))
    {
      colour = color(0, 0, 255);
    }
    else if (tempColour.toUpperCase().equals("RED"))
    {
      colour = color(255, 0, 0);
    }
    else if (tempColour.toUpperCase().equals("GREEN"))
    {
      colour = color(0, 255, 0);
    }
    else if(tempColour.toUpperCase().equals("PINK"))
    {
      colour = color(252, 181, 251);
    }
    else if(tempColour.toUpperCase().equals("YELLOW"))
    {
      colour = color(255, 244, 18);
    }
    else if(tempColour.toUpperCase().equals("ORANGE"))
    {
      colour = color(255, 141, 18);
    }
    
    // Checks whether the start and end times are valid
    if ((tempStart.length() == 0) || (tempStart.length() > 2) || (hasInvalidChars(tempStart)))
    {
      intStart = -1;
    }
    else
    {
      intStart = int(tempStart);
    }
    
    if ((tempEnd.length() == 0) || (tempEnd.length() > 2) || (hasInvalidChars(tempEnd)))
    {
      intEnd = -1;
    }
    else
    {
      intEnd = int(tempEnd);
    }
    
    // Checks whether any of the inputs needed to add the event
    // are valid. If so, the event will be created an added.
    // If not, an error message will be displayed at the bottom.
    if ((tempName.length() != 0) && (tempCategory.length() != 0) && (intStart != -1) && (intEnd != -1))
    {
      // Object of type Event construction and display
      Event newEvent = new Event(tempName, tempCategory, intStart, intEnd, colour);
      newEvent.display();
      
      // Gets rid of any error displays under the "Done" button
      stroke(255);
      fill(255);
      rect(0, 630, 300, 30);
    }
    else
    {
      // Displays an error message under the "Done" button if any
      // field is invalid
      textFont(font, 10);
      fill(255, 0, 0);
      text("ERROR: Please type a valid name, start and end times, and", 5, 645);
      text("select category for event. Hover mouse on input boxes to type.", 5, 655);
    }
    
    // Resetting the strings to be re-used 
    tempName = "";
    tempCategory = "";
    tempStart = "";
    tempEnd = "";
    tempColour = "";
    
    // Resetting the checkbox values
    checkClass = false;
    checkDr = false;
    checkWork = false;
    
    // Resetting the start and end times values to be re-used
    intStart = -1;
    intEnd = -1;
    
    stroke(0);
    fill(255);
    
    // Resetting all input fields
    rect(100, 425, 150, 20);   // Corresponds to Event name
    rect(100, 450, 150, 20);   // Corresponds to Start time
    rect(100, 475, 150, 20);   // Corresponds to End time
    rect(160, 525, 90, 20);    // Corresponds to Class
    rect(160, 550, 90, 20);    // Corresponds to Dr. Appointment
    rect(160, 575, 90, 20);    // Corresponds to Work shift
    
    rect(20, 525, 20, 20);     // Checkbox for Class
    rect(20, 550, 20, 20);     // Checkbox for Dr. Appointment
    rect(20, 575, 20, 20);     // Checkbox for Work shift
  }
}

// Class Event to encapsulate data regarding different events
// together.
class Event
{
  String name;
  String category;
  int startTime;
  int endTime;
  color colour;
  
  // Constructor
  Event(String tempName, String tempCategory, int tempStart, int tempEnd, color tempColour)
  {
    name = tempName;
    category = tempCategory;
    startTime = tempStart;
    endTime = tempEnd;
    colour = tempColour;
  }
  
  // Displays the Event as a coloured block in the "Events"
  // section of the window.
  void display()
  {
    stroke(colour);
    fill(colour);
    rect(30, 50 + (startTime * 15), 240, (endTime - startTime) * 15);
    
    textFont(font);
    fill(0);
    text(category + name, 50, 60 + (startTime * 15));
  }
}
