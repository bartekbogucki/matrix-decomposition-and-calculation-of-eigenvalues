function cond=moj_cond_chol(A)
%dana macierz jest symetryczna, a wiec jej uwarunkowanie w normie drugiej: 
cond=wlasna_max(A)/wlasna_min_chol(A);
end
