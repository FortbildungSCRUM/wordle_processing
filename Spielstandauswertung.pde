class Spielstandauswertung{
  
  //5 Spalten, 6 Zeilen
  private char[][] buchstaben = new char[6][5];
  // 0 noch nicht gefüllt
  // 1 falsch
  // 2 gelb
  // 3 grün
  private int[][] farben = new int[6][5];
  private boolean gewonnen;
  
  Spielstandauswertung(){
    gewonnen = false;
    for (int x = 0; x< buchstaben.length; x++){
      for (int y = 0; y<buchstaben[x].length; y++){
        buchstaben[x][y] = ' ';
        farben[x][y] = 0;
      }
    }
  }
  
  
  public void auswerten(int zeile, char[] wort, char[] eingabe){
    
    int gewinnZaehler = 0;
    
    for(int x = 0; x < wort.length; x++){
      
      //Ausgabefeld wird mit eingegebenen Wort gefüllt
      buchstaben[zeile-1][x] = eingabe[x];
      
      //Ist der eingegebene Buchstabe == der gesuchte Buchstabe
      if (eingabe[x] == wort[x]){
        
        //richtiger Buchstabe an richtiger Stelle
        farben[zeile-1][x] = 3;
        gewinnZaehler++;
      }
      else{
        //Der Buchstabe ist nicht an richtiger Stelle
        //Liegt der eingegebene Buchstabe weiter hinter im Wort?
        for (int i = x+1; i < wort.length; i++){
          if (wort[i] == eingabe[x]){
            //richtiger Buchstabe an falscher Stelle
            farben[zeile-1][x] = 2;
          }
         }
         //LIegt der eingegebene Buchstabe weiter vorne im Wort?
         for (int i = 0; i < x; i++){
           if (wort[i] == eingabe[x]){
            //richtiger Buchstabe an falscher Stelle
            farben[zeile-1][x] = 2;
          }
         }
        }
    
        //Ist der eingegebene Buchstabe falsch?
        if (farben[zeile-1][x] == 0) 
            farben[zeile-1][x] = 1;
      }
            
      if (gewinnZaehler == 5){
        gewonnen = true;
      }
    
  }
  
  public boolean hatGewonnen(){
    return gewonnen;
  }
  
  public char[][] getBuchstaben(){
    return buchstaben;
  }
  
  public int[][] getFarben(){
    return farben;
  }
}
