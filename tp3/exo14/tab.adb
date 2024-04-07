
with Text_Io;
use Text_Io;


procedure Tab is 


   -- Tableau contraint a 1 dimension 
   --
   type TDim1 is array (0 .. 10) of Integer;  
   Dim1 : TDim1;


   -- Tableau contraint a 2 dimensions
   --
   type TDim2 is array (1 .. 10, 4 .. 5) of Integer;  
   Dim2 : TDim2;


   -- Tableau non contraint a 2 dimensions
   --
   type Dim2n is array (Integer range <>, Integer range <>) of Integer; 
   Dim3 : Dim2n (3 .. 7, 1 .. 5);  



begin

   Put_Line("dim1'first : " & Integer'Image(Dim1'First));
   Put_Line("dim1'last : " & Integer'Image(Dim1'Last));
   Put_Line("dim1'length : " & Integer'Image(Dim1'Length));
   Put_Line("dim1'range : " & Integer'Image(Dim1'First) & " .." & Integer'
      Image(Dim1'Last));

   Put_Line("dim2'first : " & Integer'Image(Dim2'First));
   Put_Line("dim2'last : " & Integer'Image(Dim2'Last));
   Put_Line("dim2'length : " & Integer'Image(Dim2'Length));
   Put_Line("dim2'range : " & Integer'Image(Dim2'First) & " .." & Integer'
      Image(Dim2'Last));

   Put_Line("dim2'first(2) : " & Integer'Image(Dim2'First(2)));
   Put_Line("dim2'last(2) : " & Integer'Image(Dim2'Last(2)));
   Put_Line("dim2'length(2) : " & Integer'Image(Dim2'Length(2)));
   Put_Line("dim2'range(2) : " & Integer'Image(Dim2'First(2)) & " .." &
      Integer'Image(Dim2'Last(2)));

   Put_Line("dim3'first : " & Integer'Image(Dim3'First));
   Put_Line("dim3'last : " & Integer'Image(Dim3'Last));
   Put_Line("dim3'length : " & Integer'Image(Dim3'Length));
   Put_Line("dim3'range : " & Integer'Image(Dim3'First) & " .." & Integer'
      Image(Dim3'Last));

   Put_Line("dim3'first(2) : " & Integer'Image(Dim3'First(2)));
   Put_Line("dim3'last(2) : " & Integer'Image(Dim3'Last(2)));
   Put_Line("dim3'length(2) : " & Integer'Image(Dim3'Length(2)));
   Put_Line("dim3'range(2) : " & Integer'Image(Dim3'First(2)) & " .." &
      Integer'Image(Dim3'Last(2)));

end Tab;

