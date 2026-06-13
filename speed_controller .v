module speed_controller(

    input [7:0] speed,
    input [7:0] speed_limit,

    output accelerate,
    output brake

);

assign accelerate = (speed < speed_limit);
assign brake      = (speed > speed_limit);

endmodule