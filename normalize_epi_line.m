function l_normal = normalize_epi_line(line)
    l_normal = line;
    denom = sqrt(power(l_normal(:,1),2)+power(l_normal(:,2),2));
    for i = 1:3
        l_normal(:,i) = l_normal(:,i) ./ denom;
    end
end