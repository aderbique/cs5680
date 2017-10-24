 i=imread('Lena.jpg');
   i=im2double(i);
   X=size(i);
   [LL1,LH1,HL1,HH1]=dwt2(i,'haar');
   [LL2,LH2,HL2,HH2]=dwt2(LL1,'haar');
   [m,n]=size(LL2);
for i=1:m
  for j=1:n
      LL2(i,j) = LL2(i,j)/(m*n);
  end
end
[m,n]=size(LH2);
for i=1:m
  for j=1:n
      LH2(i,j) = LH2(i,j)*(-1);
  end
end
[m,n]=size(HL2);
for i=1:m
  for j=1:n
      HL2(i,j) = HL2(i,j)*(-1);
  end
end
 [m,n]=size(HH2);
 for i=1:m
    for j=1:n
        HH2(i,j) = HH2(i,j)*(-1);
    end
 end
 a=LL2;
 LL2=HL2;
 HL2=a;
 b=LH2;
 LH2=HH2;
 HH2=b;
 LL1=idwt2(LL2,LH2,HL2,HH2,'haar');
 imshow(LL1);
 [p,q]=size(LL1);
 for i=1:p
    for j=1:q
        LL1(i,j) = LL1(i,j)/(p*q);
    end
 end
 [p,q]=size(LH1);
 for i=1:p
    for j=1:q
        LH1(i,j) = LH1(i,j)*(-1);
    end
 end
 [p,q]=size(HL1);
 for i=1:p
     for j=1:q
        HL1(i,j) = HL1(i,j)*(-1);
     end
 end
 [p,q]=size(HH1);
 for i=1:p
     for j=1:q
        HH1(i,j) = HH1(i,j)*(-1);
    end
 end
 c=LL1;
 LL1=HL1;
 HL1=c;
 d=LH1;
 LH1=HH1;
 HH1=d;
 y=idwt2(LL1,LH1,HL1,HH1,'haar');
 z=im2uint8(y);
 figure(2),imshow(z);