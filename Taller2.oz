% Author Oscar Garcia
% 2017-04-21
% Esto es por que mozart 1.4 en windows con sublime debe importar la Funcion Browser
functor
import
	Browser(browse:Browse)  
define
% Hasta aqui va el import y junto con el end del final
	declare
	class Automaton
	   attr AlphaOut
	   feat
		  States 
		  AlphaIn
		  AlphaOut
		  AlphaPila 
		  Inic	  
		  Fin
		  DeltaOutput
		meth init(S AI AO AS I DO F)
		   States:=S
		   AlphaIn:=AI
		   AlphaOut:=AO
		   AlphaPila:=AS
		   Inic:=I
		   DeltaOutput:=DO
		   Fin:=F
		end
		meth output
			@DeltaOutput = fun {$ State Symbol} 
				if State==0 andthen Symbol==&x then r(1 ignore [&x])   
		      	elseif State==0 then r(0 push(Symbol) [Symbol])
		      	elseif State==1 then r(1 pop(Symbol)  [Symbol])
		           	else r(2 ignore nil)
		    	end
		   	end
		end
		
		meth browse
		   {Browse @DeltaOutput}
		end
	end

	declare A in 
	A = {New Automaton init([0 1 2] "ab" "abx" "ab" 0 [1])}
	{A output}
	{A browse}
	

end



% Prueba de pila

% declare
% class Pila
%    attr memoria

%    meth init
%       memoria:=nil
%    end

%    meth tamano($)
%       {Length @memoria}
%    end

%    meth top($)
%       if @memoria==nil then
%          raise topEmptyPila end
%       else @memoria.1 end
%    end

%    meth estaVacia($)
%       @memoria==nil
%    end

%    meth push(X)
%       memoria:=X|@memoria
%    end

%    meth pop($)
%       if @memoria==nil then
%          raise popEmptyPila end
%       else local H in
%               H = @memoria.1
%               memoria:=@memoria.2
%               H
%            end
%       end
%    end
% end

% local S={New Pila init}  in
%    {Browse {S tamano($)}}
%    {S push(1000)}
%    {Browse {S pop($)}}
% end