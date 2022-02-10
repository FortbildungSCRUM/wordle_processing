    import controlP5.*; 
    ControlP5 cp5; 
     
    float valueA; 
     
    void setup() { 
      size(200,100); 
      cp5 = new ControlP5(this); 
      
      cp5.addTextfield("Strecke", 10, 10, 50, 10);
      cp5.addTextfield("Menge", 10, 40, 50, 10);
      cp5.addButton("Berechne", 1.0, 10, 70, 50, 10);
      cp5.addLabel("Ergebnis", 10, 90);
      
      
    } 
     
    void draw() { 
      background(valueA); 
    } 
