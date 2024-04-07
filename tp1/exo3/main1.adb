with Ada.Text_IO;
use Ada.Text_IO;

with lists;

procedure main1 is
   type Note is new Float range 0.0 .. 20.0;
   Saisie, Min, Max : Note;


   type note_ptr is access note;
   float_ptr : note_ptr;

   Somme : Float:=0.0;
   Nb_Notes : Integer := 0;
   package note_io is new Float_IO (Note) ;

   procedure Afficher_Note(n: in Note) is
    begin
        note_io.put(n);
    end Afficher_Note;

   package ma_liste is new lists(Note, Afficher_Note);
   use ma_liste;

   les_notes : Lien;
   une_note : Element_Ptr;


begin
   -- Saisie des notes
   loop
      Ada.Text_IO.Put("Saisir une note (0.0 pour terminer) : ");
      note_io.Get(Saisie);
      une_note := new Note'(Saisie);
      Ajouter(les_notes, une_note);
      exit when Saisie = 0.0;
      Nb_Notes := Nb_Notes + 1;

      -- Calcul de la somme, du minimum et du maximum
      Somme := Somme + Float(Saisie);
      if Nb_Notes = 1 then
         Min := Saisie;
         Max := Saisie;
      elsif Saisie < Min then
         Min := Saisie;
      elsif Saisie > Max then
         Max := Saisie;
      end if;
   end loop;
   Afficher(les_notes);

   -- Affichage des résultats
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put("Nombre de notes saisies : ");
   Ada.Text_IO.Put(Integer'Image(Nb_Notes));
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put("Moyenne : ");
   Ada.Text_IO.Put(Float'Image(Float(Somme / Float(Nb_Notes))));
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put("Minimum : ");
   Ada.Text_IO.Put(Float'Image(Float(Min)));
   Ada.Text_IO.New_Line;
   Ada.Text_IO.Put("Maximum : ");
   Ada.Text_IO.Put(Float'Image(Float(Max)));
   Ada.Text_IO.New_Line;
end main1;
