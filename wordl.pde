public class GUI {

PFont font; //erstellt ein Pfont-Objekt mit dem Namen font

int textX=50;
int textY=50;

int canvasWidth;
int canvasHeight;

int datenWort=0;
int datenStelle=0;

char[] wort=new char[5];

boolean eingabeMoeglich=true;

char[][] daten={
  {' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' '},
  {' ', ' ', ' ', ' ', ' '}
};

int[][] farbe={
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0},
  {0, 0, 0, 0, 0}
};

Steuerung dieSteuerung;


public GUI(int w, int h) {
  this.canvasWidth=w;
  this.canvasHeight=h;
  dieSteuerung = new Steuerung(this);
  font = loadFont("ArialMT-48.vlw"); //weist dem Objekt font die Grafiken für die einzelnen Buchstaben zu
  textFont(font); //estellt ein Objekt textFont mit dem Parameter font
  //Initiales Spielfeld
  zeichneSpiel(daten, farbe);
  schreibeMeldung("Los gehts!");
}  


public char[] getEingabe() {
  return this.daten[datenWort];
}

public void schreibeMeldung(String text) {
  fill(0, 0, 0);
  text(text, 20, 500); 
}

public void zeichneZeichen(char c, int hintergrund, int x, int y) {
  int[][] farbe= {
            {250, 250, 250},  //leeres Feld
            {120, 120, 120},  //buchstabe falsch
            {100, 255, 255},  //stelle falsch
            {100, 255, 100}   //stelle richtig
             };
  
  //Hintergrund
  int offsetX=8;
  int offsetY=43;
  fill(farbe[hintergrund][0], farbe[hintergrund][1], farbe[hintergrund][2]);
  rect(x-offsetX, y-offsetY, 50, 50);
  //Buchstabe
  fill(0, 0, 0);
  text(c, x, y); 
}

void clearCanvas() {
  fill(200, 200, 200);
  rect(0, 0, canvasWidth, canvasHeight);
}

public void zeichneSpiel(char[][] neueDaten, int[][] farben) {
  daten=neueDaten;
  clearCanvas();
  int x=20;
  int y=50;
  for (int i=0; i<daten.length; i++) {
    for (int j=0; j<daten[i].length; j++) {      
      zeichneZeichen(daten[i][j], farben[i][j], x, y);
      x+=70;
    }
    x=20;
    y+=70;
  }
}

public void stoppeEingabe() {
  eingabeMoeglich=false;
}

public void ermoeglicheEingabe() {
  eingabeMoeglich=true;
}

public void setzeZeile(int z) {
  datenWort=z;
}

public void tasteGedrueckt(char zeichen, int kCode) {
  if (eingabeMoeglich) {
    //Letzte Zahl löschen
    if (kCode==BACKSPACE && datenStelle>0) {
      daten[datenWort][datenStelle-1]=' ';
      datenStelle--;
      zeichneSpiel(daten, farbe);
    //Falls Zeile komplett befüllt muss Enter gedrückt werden
    } else if (datenStelle==5) {
      if (kCode==ENTER) {
        //Auswertung der Zeile
          dieSteuerung.spieldurchlauf(g.getEingabe());
        //Neue Zeile
        datenStelle=0;
     //   datenWort++;
      //  schreibeMeldung("Überprüfung...");
      }
    //Nur Buchstaben (kleingeschrieben) akzeptieren
    } else if ((int)zeichen>=97 && (int)zeichen<=122) {
      //Eingabe merken
     daten[datenWort][datenStelle]=(char)((int)zeichen-32);
     //wort[datenStelle]=(char)((int)zeichen-32);
      datenStelle++;
      //Spielfeld neu zeichnen
      zeichneSpiel(daten, farbe);
    }
  }
}  


}


GUI g;

void setup() {
  int w=400;
  int h=600;
  //size(w, h);
  size(400, 600);
  background(200, 200, 200);
  g = new GUI(w, h);
}

void draw() {
}
 
void keyPressed() {
   g.tasteGedrueckt(key, keyCode);
}  
