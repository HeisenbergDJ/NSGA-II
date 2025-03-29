clear;
clc;

P_star = table2array(readtable("Dataset.csv"));
rate={"10/","30/","50/","70/","90/"};
figure(1)
hold on
for j = 1:1:5
    directory = rate{j};
    for i = 1:1:35
        filename = sprintf('%s%s%d%s',directory,"population_gen_",i,".csv");
        table = readtable(filename);
        mat = table2array(table);
        P = [mat(:,4) mat(:,5)];
        gamma = calculateConvergenceMetric(P,P_star);
        Gamma(j,i) = gamma;
        Iteration(j,i) = i;
    end 
        plot(Iteration(j,:), Gamma(j,:))
        
end

legend(rate, 'Location', 'best'); % 使用 rate 作为图例标签

    