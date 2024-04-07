
with Text_IO;
use  Text_IO;


package body donnees is

   task body affiche is
   begin
      loop
         Put_Line("Nombre de données : " & Integer'Image(current_index));
         New_Line;
         delay 5.0;
      end loop;
   end affiche;

  -- La procedure ajouter_donnee permet de mémoriser une nouvelle donnée (argument une_donnee).
  -- Si lors de l'ajout, le nombre de données stockées est égal à taille_donnees, 
  -- alors ajouter_donnee doit remplacer la plus ancienne donnée par la nouvelle.   
  procedure ajouter_donnees(une_donnee : in integer) is
  begin
    
    if (current_index<=taille_donnees) then 
      current_index:=current_index+1;
      t_donnee(current_index):= une_donnee;
    else 
      current_index:=0;
      current_index:=current_index+1;
      t_donnee(current_index):= une_donnee;
    end if;

  end ajouter_donnees;
 
  -- La procédure vide_donnees permet de supprimer toutes les données mémorisées dans le paquetage. 
  procedure vider_donnees is
  begin
    current_index:=0;
  end vider_donnees;

  -- La procédure lire_resultats calcule et renvoie à partir des données mémorisées la plus petite donnée, 
  --la plus grande donnée et la moyenne des données 
  procedure lire_resultats(plusgrand : out integer; pluspetit : out integer; moyenne : out integer) is
  begin

    pluspetit:= t_donnee(1);
    plusgrand:= t_donnee(1);
    moyenne:= t_donnee(1);

    for i in 2..current_index loop
      if(pluspetit > t_donnee(i)) then
        pluspetit := t_donnee(i);
      end if;
      if(plusgrand<t_donnee(i)) then
        plusgrand := t_donnee(i);
      end if;

      moyenne := moyenne + t_donnee(i);

    end loop;

    moyenne := moyenne/current_index;

  end lire_resultats;


end donnees;