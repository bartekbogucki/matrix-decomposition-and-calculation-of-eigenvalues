function cond=moj_cond_householder(A)
%dana macierz jest symetryczna, a wiec jej uwarunkowanie w normie drugiej: 
cond=wlasna_max(A)/wlasna_min_householder(A);
end
