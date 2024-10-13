function D = odi_pourcentage_of(a,b)
%% Cette fonction permet d'estimer le pourcentage de "b" sur "a"

    i_sup = (abs(a) - abs(b))./abs(abs(a) - abs(b));
    for i = 1:max(size(a))
    if (abs(a(i)) - abs(b(i)))./abs(abs(a(i)) - abs(b(i))) > zeros(size(a(i)))
        
            D(i) =  (1- (abs(b(i))./abs(a(i)))).*100.*(-i_sup(i));
            
    elseif (abs(a(i)) - abs(b(i)))./abs(abs(a(i)) - abs(b(i))) < zeros(size(a(i)))
        
            D(i) = (-1 + (abs(b(i))./abs(a(i)))).*100;
    end
end