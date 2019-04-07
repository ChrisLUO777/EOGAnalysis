load("EOGLfix2abspdf.mat");
sample1=y;
load("EOGYfix2abspdf.mat");
sample2=y;
[cm_H,cm_P,cm_stat] = cmtest2(sample1(1,:),sample2(1,:));