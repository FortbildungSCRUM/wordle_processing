public class Wortgenerator {
  private String[] woerterbuch = {
    "PILZE", "WILLE", "WERTE", "STELE", "VATER", "KATER", "STEIL", "TEILE", "WEILE"}  ;
  private String zufallswort;
  
  public char[] getZufallswort() {
    return zufallswort.toCharArray();
  }
  
  public Wortgenerator(){
    neuesZufallswort();
  }
  
  public char[] neuesZufallswort() {
    int zufall = (int)(Math.random() * woerterbuch.length);
    zufallswort = woerterbuch[zufall];
    return zufallswort.toCharArray();
  }
  
  public boolean istWortInListe(char[] wort) {
    for (String einWort : woerterbuch ) {
      if ((new String(wort)).equals(einWort)) {
        return true;
      } // end of for
      
    }
    return false;
  }
}
