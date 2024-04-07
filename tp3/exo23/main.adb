with Text_Io;
use Text_Io;

with donnees;



procedure Main is 
    plusgrand:Integer;
    pluspetit:Integer;
    moyenne:Integer;

begin

    Put("On ajoute des données :");
    donnees.ajouter_donnees(10);
    donnees.ajouter_donnees(20);
    donnees.ajouter_donnees(20);
    donnees.ajouter_donnees(50);
    donnees.ajouter_donnees(17);
    donnees.ajouter_donnees(17);
    donnees.ajouter_donnees(17);

   -- delay 3.0;
    donnees.lire_resultats(plusgrand, pluspetit, moyenne);
    New_Line;
    Put("plus grand :" & Integer'Image(plusgrand));
        New_Line;
    Put("plus petit :" & Integer'Image(pluspetit));
        New_Line;
    Put("moyenne :" & Integer'Image(moyenne));
        New_Line;
    abort donnees.affiche;


end Main;


