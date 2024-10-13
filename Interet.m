function I = Interet(C,n,t,l)
    if l == 1 % duree en an
        x = 100;
    elseif l == 2 % duree en mois
        x = 1200;
    elseif l == 3 % duree en semaine
        x = 5200;
    end
    if l == 4 % duree en jour
        x = 36500;
    end
I = (C*n*t)/x;

end