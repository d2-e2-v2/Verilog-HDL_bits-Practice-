module top_module (input x, input y, output z);
wire k1,k2,k3,k4;
    assign k1=(~y&x);
    xnor xnor1(k2,x,y);
    and nd1(k3,k2,k1);
    or or1(k4,k1,k2);
    xor xor1(z,k4,k3);
endmodule
