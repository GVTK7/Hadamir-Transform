module four_point_hadmir #(parameter N=32)  (input clk,rst,input [N-1:0]r0,i0,r1,i1,r2,i2,r3,i3,
                                                            output reg [N+1:0] R0,I0,R1,I1,R2,I2,R3,I3);


reg [N-1:0]ar,ai,br,bi,cr,ci;
DFT_2 #( N+1)(ar,ai,br,bi,Ar,Ai,Br,Bi);
reg [N+1:0] T1r,T1i,T2r,T2i,T3r,T3i,T4r,T4i;
reg cnt=0;
always @(posedge clk)
if(cnt==0)begin
    ar={r0[N-1],r0};  ai={i0[N-1],i0};
    br={r1[N-1],r1};  bi={i1[N-1],i1};
    T1r=Ar; T1i=Ai;
    T2r=Br; T2i=Bi;
    cnt=cnt+1;
        end

else if(cnt==1)begin
    ar={r2[N-1],r2};  ai={i2[N-1],i2};
    br={r3[N-1],r3};  bi={i3[N-1],i3};
    T3r=Ar; T3i=Ai;
    T4r=Br; T4i=Bi;
    cnt=cnt+1;
        end

else if(cnt==2)begin
    ar=T1r[N:0];  ai=T1i[N:0];
    br=T3r[N:0];  bi=T3i[N:0];
    R0=Ar;  I0=Ai;
    R2=Br;  I2=Bi;
    cnt=cnt+1;
        end


else if(cnt==3)begin
    ar=T1r[N:0];  ai=T1i[N:0];
    br=T3r[N:0];  bi=T3i[N:0];
    R1=Ar;  I1=Ai;
    R3=Br;  I3=Bi;
        end
endmodule
