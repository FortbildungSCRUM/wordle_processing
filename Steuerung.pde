class Steuerung{
  
  GUI dieGUI;
  Wortgenerator dieWoerter;
  Spielstandauswertung derSpielstand;
  
  int zeilennummer;
  int versuche = 6;
  
  Steuerung(GUI gui){
    dieGUI = gui;
    dieWoerter = new Wortgenerator();
    derSpielstand = new Spielstandauswertung();
    zeilennummer = 0;
  }
  
  void spieldurchlauf(char[] eingabe){
    
      if(dieWoerter.istWortInListe(eingabe)){
         zeilennummer++;

        //Auswertung 
        char[] wort = dieWoerter.getZufallswort();
        derSpielstand.auswerten(zeilennummer, wort, eingabe);
        
        //Buchstaben gefärbt anzeigen lassen
        dieGUI.zeichneSpiel(derSpielstand.getBuchstaben(), derSpielstand.getFarben());
        
        //Wohin wird die nächste Eingabe eingelesen?
        dieGUI.setzeZeile(zeilennummer);
        
        //Auswertung
        if (derSpielstand.hatGewonnen()){
          dieGUI.schreibeMeldung("gewonnen");
          dieGUI.stoppeEingabe();
        }
      }
      else{
        dieGUI.zeichneSpiel(derSpielstand.getBuchstaben(), derSpielstand.getFarben());
        dieGUI.schreibeMeldung("Wort ist kein deutsches Wort");
      }
      
      //Spiel beendet?
      if (zeilennummer == versuche){
        dieGUI.schreibeMeldung("verloren");
      }
      
      
  }
  
}
