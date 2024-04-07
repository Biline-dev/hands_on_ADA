

package donnees is 
  
  taille_donnees : constant integer := 10;

  task affiche;

  procedure ajouter_donnees(une_donnee : in integer);
  procedure vider_donnees;
  procedure lire_resultats(plusgrand : out integer; pluspetit : out integer; moyenne : out integer);


  private

    type donnee is array (1 .. taille_donnees) of integer; 
    t_donnee : donnee ;
    current_index : integer:=0; 



end donnees;
