name_list = {"ON/","OFF/"};
iteration={"1","20","100"};
prefix = {"population_gen_"};
surfix = {".csv"};
count = 1;
for i=1:1:3
    on_filename = sprintf('%s%s%s%s',name_list{1},prefix{1},iteration{i},surfix{1});
    off_filename = sprintf('%s%s%s%s',name_list{2},prefix{1},iteration{i},surfix{1});
    on_table = readtable(on_filename);
    off_table = readtable(off_filename);
    on_mat = table2array(on_table);
    off_mat = table2array(off_table);
    subplot(1,3,count)
    plot(on_mat(:,4),on_mat(:,5),'*r')
    hold on
    plot(off_mat(:,4),off_mat(:,5),'*b')
    count = count + 1;
end