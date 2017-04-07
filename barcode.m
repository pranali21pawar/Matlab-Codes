clear

I= imread('upcAbarcode.png');

numberOfRows=size(I,1);

n=floor(numberOfRows/2);

rowValues=zeros(1,89);

index=91;

size(I,2);

count=0;
flag = 0;
for i=1:size(I,2)
    
    if flag==1 && index<90 && index>0
        rowValues(index) = I(n,i+3);
        %rowValues(index)
        
    end

	if I(n,i)==0 && flag==0
        %count
        count=count+1 ;
    end

	if count==9 && flag == 0
        index=0 ;
        flag = 1 ;
    end
    %index
    index = index+1;
end
rowValues;
