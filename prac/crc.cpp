#include<iostream>
using namespace std;

int main(){
    int i,j,k,l,fs,f[20],gs,g[20],temp[20],crc[15],tf[15],rrem[15],flag=0;

    cout<<"\nEnter Frame size: ";
    cin>>fs;                    
    cout<<"\nEnter Frame: ";
    for(i=0;i<fs;i++)    
        cin>>f[i];        
    cout<<"\nEnter Generator size: ";
    cin>>gs;      
    cout<<"\nEnter Generator: ";
    for(i=0;i<gs;i++)    
        cin>>g[i];
    
    cout<<"\nSender Side: \n Frame: ";
    for(i=0;i<fs;i++)    
        cout<<f[i];    
    cout<<"\n Generator :";
    for(i=0;i<gs;i++)    
        cout<<g[i];
 
    int rs=gs-1;
    cout<<"\n Number of 0's appended: "<<rs;
    for (i=fs;i<fs+rs;i++)    
        f[i]=0;        
    for(i=0;i<20;i++)    
        temp[i]=f[i];    
    cout<<"\n Message after appending 0's :";
    for(i=0; i<fs+rs;i++)    
        cout<<temp[i];
        
    for(i=0;i<fs;i++){
        j=0;  k=i;    
        if(temp[k]>=g[j]){
            for(j=0,k=i;j<gs;j++,k++)
                temp[k]=temp[k]^g[j];            
        }
    }
        
    for(i=0,j=fs;i<rs;i++,j++)
        crc[i]=temp[j];    
    cout<<"\n CRC bits: ";
    for(i=0;i<rs;i++)
        cout<<crc[i];
    
    cout<<"\n Transmitted Frame: ";    
    for(i=0;i<fs;i++)
        tf[i]=f[i];    
    for(i=fs,j=0;i<fs+rs;i++,j++)    
        tf[i]=crc[j];    
    for(i=0;i<fs+rs;i++)    
    cout<<tf[i];    

    cout<<"\n Receiver side: \n Received Frame: ";
    for(i=0;i<fs+rs;i++)    
        cout<<tf[i];    
    for(i=0;i<fs+rs;i++)    
        temp[i]=tf[i];    
    
    for(i=0;i<fs+rs;i++){
        j=0;    k=i;
        if(temp[k]>=g[j]){
            for(j=0,k=i;j<gs;j++,k++)
                temp[k]=temp[k]^g[j];                          
        }
    }

    cout<<"\nReaminder: ";    
    for (i=fs,j=0;i<fs+rs;i++,j++)    
        rrem[j]= temp[i];    
    for(i=0;i<rs;i++)        
        cout<<rrem[i];        
    for(i=0;i<rs;i++){
        if(rrem[i]!=0)    
            flag=1;    
    }

    if(flag==0)    
        cout<<"\n Remainder Is 0 Hence Message Transmitted Is Correct"<<endl;    
    else
        cout<<"\n Remainder Is Not 0 Hence Message Transmitted Contains Error"<<endl;    
    return 0;
}

