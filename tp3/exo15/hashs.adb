

with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

with Text_Io;
use Text_Io;



package body Hashs is  

   procedure Initialize (
         H : in out Hash ) is 

        begin
            for i in 1 .. Size loop
                H(i) := null;
            end loop;

        end Initialize;

   procedure Add (
         H     : in out Hash;             
         Key   : in     Unbounded_String; 
         D     : in     Data_Type         )is

         new_cell: Link;
         Item : Natural := Compute_Hash (Key);

        begin

            if h(Item) /= null then
                new_cell := new Cell;
                new_cell.Key := key;
                new_cell.A_Data := d;
                new_cell.next:=h(Item).next;
                h(Item).next := new_cell;

            else
                H(Item):= new Cell;
                H(Item).A_Data:=d;
                H(Item).Key:=Key;
                    
            end if;

        end Add;

   function Consult (
         H     : in     Hash;            
         Key   : in     Unbounded_String ) 
     return Data_Type is

     Item : Natural := Compute_Hash (Key);
     current : Link := H(Item) ;

     begin

        while current /= null loop

            if (current.key = key) then

                return current.A_Data;
            end if;

            current := current.next;

        end loop;

        raise Data_Not_Found;
     end Consult;

   procedure Put (
         H : in     Hash )is

     current : Link ;
     begin

        for i in H'range loop
            
            current := H(i);

            while current /= null loop
                  Put("Key  = ");
                  Put(to_string(Current.key));
                  New_Line;
                  Put("   Data = ");
                  Put(Current.A_Data);
                  New_Line;
                current := current.next;
            end loop;

        end loop;

     end Put;


end Hashs;