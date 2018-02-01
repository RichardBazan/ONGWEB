package DAO;

public class DAOVALIDA {
          
      public String primeraLetraMayuscula(String cadena){
          char[] caracteres = cadena.toCharArray();
          caracteres[0] = Character.toUpperCase(caracteres[0]);
          
          for (int i = 0; i < cadena.length()- 2; i++) {
        
              if (caracteres[i] == ' ' || caracteres[i] == '.' || caracteres[i] == ','){
                  caracteres[i + 1] = Character.toUpperCase(caracteres[i + 1]);
              }
          }
        return new String(caracteres).replace(" ", "&nbsp");
    }
      
      
       public String funcion_mes(int mes){
        String mensaje;
           if(mes > 1 ){
           mensaje = "y " + String.valueOf(mes) + " meses";
           }else{
           mensaje = "y " + String.valueOf(mes) + " mes";
           }
           
           if(mes == 0){
               mensaje = "";
           }
        return mensaje;
    }
}
