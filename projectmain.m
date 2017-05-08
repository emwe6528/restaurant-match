load('testmatrix.mat')
A=RestaurantData(:,3:end);
atm=A(:,1:8);
amen=A(:,9:12);
crowd=A(:,13:18);
meals=A(:,19:21);
diet=A(:,22:24);
types=A(:,25:31);
%categories={atm,amen,crowd,meals,diet,types};
load('responses.mat')
R=RestaurantMatchResponses;
R=R(3,1:end-4);
idx=find(R==1);

atm_idx=idx(idx<9);
amen_idx=idx(idx>=9&(idx<13))-8;
crowd_idx=idx(idx>=13 & (idx<19))-12;
meals_idx=idx(idx>=19&idx<22)-18;
diet_idx=idx(idx>=22&idx<25)-21;
types_idx=idx(idx>=25&idx<32)-24;

atm=atm(:,atm_idx);
amen=amen(:,amen_idx);
crowd=crowd(:,crowd_idx);
meals=meals(:,meals_idx);
diet=diet(:,diet_idx);
types=types(:,types_idx);

K_atm=atm*atm';
K_amen=amen*amen';
K_crowd=crowd*crowd';
K_meals=meals*meals';
K_diet=(diet*diet');
K_types=types*types';

[vec1,val1]=eig(K_atm);
[vec2,val2]=eig(K_amen);
[vec3,val3]=eig(K_crowd);
[vec4,val4]=eig(K_meals);
[vec5,val5]=eig(K_diet);
[vec6,val6]=eig(K_types);

ranking=vec1(:,end)+vec2(:,end)+vec3(:,end)+vec4(:,end)+vec5(:,end)+vec6(:,end);

