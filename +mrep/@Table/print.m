function str = print(obj)

htable = ht.table().border('1');
for n = 1 : size(obj.table_, 1)
    htable.content_(end + 1) = ht.tr();
    for k = 1 : size(obj.table_, 2)
        htable.content_(end).content_(end + 1) = ht.td(obj.table_{n, k}.print());
    end
end

str = htable.print();

end %------------------------------------------------------------

