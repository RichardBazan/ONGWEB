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
}
