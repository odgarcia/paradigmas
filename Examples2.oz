% Estados  y funciones de transición y respuesta de un autómata que reconoce  las palabras palíndromes de a's y b's
% con x en la mitad
%  El autómata simplemente replica lo que lee 


functor
import
  Browser(browse:Browse)


define

	local  States2  AlphaIn2  AlphaOut2 AlphaStack2 Inic2 DeltaOutput2   Fin2
	in
	   
	   States2 =  [0  1 2]   % El estado 2 es un estado de error 
	   AlphaIn2 = "ab"
	   AlphaOut2 = "abx"
	   AlphaStack2 = "ab"
	   Inic2 =  0
	   Fin2 = [1]

	   DeltaOutput2 =  fun {$ State Symbol Stack}     % retorna r(EstadpAlQuePasa  StackModificado  CadenaQueEscribe)     
			      if State==0 andthen Symbol==&x then r(1 Stack [&x])   
			      elseif State==0 then r(0 Symbol|Stack [Symbol])
			      elseif State==1 then
				 case Stack of S|Rest  then
				    if S==Symbol then r(1 Rest [Symbol]) else  r(2 Stack nil) end
				 else r(2 Stack nil)
				 end
			      else r(2 ignore nil)
			      end
			   end

	   {Browse [States2  AlphaIn2  AlphaOut2 AlphaStack2 Inic2 DeltaOutput2   Fin2]}
	   
	end


	% Estados  y funciones de transición y respuesta de un autómata que lee una cadena de  a's y b's
	%  de longitud n (n >0)  seguida de n x's y escribe el reverso de la cadena original.
	%  El autómata simplemente replica lo que lee 




	local  States1  AlphaIn1   AlphaOut1 AlphaStack1 Inic1 DeltaOutput1 Fin1  
	in
	   
	   States1 =  [0  1  2]   % El estado 2 es un estado de error 
	   AlphaIn1 = "ab"
	   AlphaOut1 = "abx"
	   AlphaStack1 = "ab"
	   Inic1 =  0
	   Fin1 = [1]

	   DeltaOutput1 =  fun {$ State Symbol Stack}    % retorna r(EstadpAlQuePasa  StackModificado  CadenaQueEscribe)   
			      
				 if  Symbol==&x then
				    case Stack of X|Rest then r(1 Rest [X])
				    else r(2 ignore nil)
				    end
				 elseif State==0 then r(0 Symbol|Stack [Symbol])
				 else    r(2 ignore nil) 
				 end
			      
			   end
	   

	    {Browse [States1  AlphaIn1  AlphaOut1 AlphaStack1 Inic1 DeltaOutput1 Fin1  ]}
	end
end