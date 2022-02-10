public class Test {
  String text;
  public Test(String text) {
    this.text=text;
  }
  public String gibText() {
    return text;
  }
}

public void setup() {
  Test t =new Test("Bla");
  
  println(t.gibText());
}


    
