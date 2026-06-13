module obstacle_detector(

    input obstacle_detected,
    input [7:0] distance,

    output collision_risk

);

assign collision_risk =
        (obstacle_detected == 1'b1) &&
        (distance <= 8'd20);

endmodule